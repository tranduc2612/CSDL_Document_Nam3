use QLBanSach

-- câu 1
create proc cau1Ktra @tenNV nvarchar(255),@nam nvarchar(5) , @soTien money output, @slHDB int output
as
begin
	select @slHDB = count(SoHDB) from tHoaDonBan 
	join tNhanVien on tHoaDonBan.MaNV = tNhanVien.MaNV 					
	where TenNV = @tenNV and YEAR(NgayBan) = @nam

	select @soTien = sum(SLBan * DonGiaBan) from tNhanVien join tHoaDonBan on tNhanVien.MaNV = tHoaDonBan.MaNV
							join tChiTietHDB on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
							join tSach on tSach.MaSach = tChiTietHDB.MaSach
							where year(NgayBan) = @nam and TenNV = @tenNV 
							group by tNhanVien.MaNV
end


declare @sotienD money,@soluonghd int
exec cau1Ktra N'Trần Huy','2014',@soTienD output,@soluonghd output
print @sotienD
print @soluonghd

select * from tNhanVien

-- câu 2
alter table tKhachHang add SLSachMua int;
create trigger Cau2Ktra on dbo.tChiTietHDB
for insert as
begin
	declare @soHD nvarchar(255),@slBan int,@maK nvarchar(255)
	select @soHD = SoHDB,@slBan = SLBan from inserted
	select @maK  = MaKH from tHoaDonBan where tHoaDonBan.SoHDB = @soHD
	update tKhachHang set SLSachMua = isNull(SLSachMua,0) + isNull(@slBan,0) where @maK = MaKH
end

select * from tChiTietHDB
insert into tChiTietHDB values ('HDB01','S11',3,Null)
select * from tKhachHang

-- câu 3
exec sp_addlogin NguyenBinhAn,123
exec sp_adduser NguyenBinhAn,NguyenBinhAn

grant select,update on tSach to NguyenBinhAn with grant option 

exec sp_addlogin NguyenDucAnh,123
exec sp_adduser NguyenDucAnh,NguyenDucAnh

-- câu 4
create function cau4Ktra (@thang nvarchar(5),@nam nvarchar(5)) returns table as
return (
	select top 1 with ties tChiTietHDB.SoHDB,NgayBan,count(tHoaDonBan.SoHDB) as SLHD from tHoaDonBan 
	join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB where YEAR(NgayBan) = @nam and MONTH(NgayBan) = @thang
	group by NgayBan,tChiTietHDB.SoHDB
	order by SLHD desc
)
select * from cau4Ktra('05','2014');
select * from tHoaDonBan where YEAR(NgayBan) = '2014' and MONTH(NgayBan) = '05'