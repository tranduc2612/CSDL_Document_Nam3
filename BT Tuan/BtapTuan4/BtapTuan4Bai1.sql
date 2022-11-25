GO
USE QLVanTai

-- bai 1

select * from ChiTietVanTai
select * from LoTrinh
select * from TrongTai
-- cau 1
create function cau1(@lt nvarchar(50))
returns Table
as 
return (SELECT SoXe, MaTrongTai, SoLuongVT, NgayDi, NgayDen
	FROM ChiTietVanTai
	WHERE MaLoTrinh = @lt
)

select * from cau1(N'Hà Nội')

-- cau 2
create function cau2(@soxe nvarchar(5))
returns Table
as 
return (
	select LoTrinh.* from LoTrinh join ChiTietVanTai on LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh 
	where SoXe = @soxe
)

select * from cau2('333')
-- cau 3
create function cau3(@trongtai int)
returns table
as
return
(
	select distinct ChiTietVanTai.SoXe from ChiTietVanTai 
	inner join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	where @trongtai <= TrongTaiQD
)
select * from cau3(8)
-- cau 4
create function cau4(@trongtai int,@lotrinh nvarchar(255)) returns int 
as
begin
	declare @soluong int
	select @soluong = count(*) from 
	ChiTietVanTai join TrongTai on ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	where TrongTai.TrongTaiQD >= @trongtai and ChiTietVanTai.MaLoTrinh = @lotrinh
	return @soluong
end
select dbo.cau4(8,N'HN') as SoLuongXe

-- cau 5
create procedure cau5 @malt nvarchar(225),@slxe int output as
begin
	select @slxe = count(SoXe) from  ChiTietVanTai where MaLoTrinh = @malt
end

declare @sl int
exec cau5 N'HN',@sl output
print @sl

-- cau 6
create procedure cau6 @malt nvarchar(225), @namvt nvarchar(5), @sotien int output as
begin 
	select @sotien = sum(DonGia) from LoTrinh 
	inner join ChiTietVanTai 
	on LoTrinh.MaLoTrinh = ChiTietVanTai.MaLoTrinh
	where LoTrinh.MaLoTrinh = @malt and year(ChiTietVanTai.NgayDi) = @namvt
	group by LoTrinh.TenLoTrinh
end
declare @tongtien int
exec cau6 N'HN',N'2014',@tongtien output
print @tongtien

-- cau 7
create procedure cau7 @soxe int, @namvt nvarchar(5), @sotien int output as
begin 
	select @sotien = sum(DonGia) from ChiTietVanTai inner join 
	LoTrinh on ChiTietVanTai.MaLoTrinh = LoTrinh.MaLoTrinh
	where Soxe = @soxe and @namvt = year(NgayDi)
end

declare @tongtiencau7 int
exec cau7 333,N'2014',@tongtiencau7 output
print @tongtiencau7

-- cau 8
create procedure cau8 @matt nvarchar(10), @soluong int output as
begin 
	select @soluong = count(SoXe) from ChiTietVanTai inner join TrongTai on
	ChiTietVanTai.MaTrongTai = TrongTai.MaTrongTai
	where SoLuongVT > (select TrongTaiQD from TrongTai where MaTrongTai = @matt)
end
declare @tongtiencau8 int
exec cau8 50,@tongtiencau8 output
print @tongtiencau8


