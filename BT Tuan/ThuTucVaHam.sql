use [BT1_TKCSDL]

CREATE PROCEDURE DiemTrungBinh @mahs nvarchar(5), @dtb float
output
AS
begin
select @dtb=round((toan*2+van*2+ly+hoa)/6, 2) from diem where
MAHS=@mahs
End

declare @tb float
exec DiemTrungBinh '00001', @tb output
print @tb

select * into FunctionTest from DSHS
where MALOP = '10A2'

drop function sinhkhoa

Create function sinhkhoa () returns char(8) As
Begin 
declare @max int 
select 
@max = max(cast(substring(MAHS,4,5) as int)) + 1
from dbo.TestFunction
declare @s char(10)
set @s = '0000' + rtrim(cast(@max as char(5)))
set @s = 'UTC' + right(rtrim(@s),4)
return @s
endselect dbo.sinhkhoa ()create procedure SLSach @masach nvarchar(5),@sl int outputasbeginselect @sl = sum(MaSach) from dbo.tChiTietHDB inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB where year(tHoaDonBan.NgayBan) = '2014'group by MaSachenddeclare @num intexec SLSach '001',@num outputprint @num;create function Sach (@thang int) returns TABLE as	return(		select distinct sum(SLBan) from tHoaDonBan inner join tChiTietHDB 		on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB		where MONTH(tHoaDonBan.NgayBan) = @thang	)