create trigger trg_proc_changes
on database
for
	create_procedure,
	alter_procedure,
	drop_procedure
as
begin
	set nocount on;
	insert into proc_logs(
		event_data,
		changed_by
	)
	values (
		EVENTDATA(),
		user
	);
end;
go

create table proc_logs(
	log_id int identity primary key,
	event_data XML NOT NULL,
	changed_by sysname not null
);
go

select * from proc_logs
alter procedure testN05 @ms nvarchar(10)
as 
begin
	select * from tSach Where MaSach = @ms
end


CREATE TRIGGER trgSprocs
ON DATABASE
FOR CREATE_LOGIN, ALTER_LOGIN, DROP_LOGIN
AS
IF DATEPART(hh,GETDATE()) > 8 AND DATEPART(hh,GETDATE()) < 18
BEGIN
DECLARE @Message nvarchar(max)
SELECT @Message =
'Completing work during core hours. Trying to release - '
+ EVENTDATA().value
('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
RAISERROR (@Message, 16, 1)
ROLLBACK
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'ApressFinancialDBMA',
@recipients = 'robin@fat-belly.com',
@body = 'A stored procedure change',
@subject = 'A stored procedure change has been initiated and rolled back
during core hours'
END
disable trigger trg_proc_changes on database


crea