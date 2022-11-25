use QLBanSachLuyenThem
go

select * from tHoaDonBan
select * from tChiTietHDB


alter table tHoaDonBan
add soSanPhamBan int

create trigger cau4 on tChiTietHDB
for insert,delete,update as
begin
	declare @soSanPham int,@soHDBInsert nvarchar(25),@soHDBDelete nvarchar(25)
	select @soHDBInsert = SoHDB from inserted
	select @soHDBDelete = SoHDB from deleted
	select @soSanPham = soSanPhamBan from tHoaDonBan
	update tHoaDonBan set soSanPhamBan = @soSanPham + 1 where SoHDB = @soHDBInsert
	update tHoaDonBan set soSanPhamBan = @soSanPham - 1 where SoHDB = @soHDBDelete
end

insert into tChiTietHDB (SoHDB,MaSach) values (N'HDB01',N'S06')

update tHoaDonBan set soSanPhamBan = (select count(MaSach) from tChiTietHDB where SoHDB = N'HDB01') where SoHDB = N'HDB01'


CREATE PROCEDURE cau9 @maSach nvarchar(5),@nam nvarchar(5),@slsachNhap int output, @slsachBan int
output
AS
begin
	select @slsachBan = sum(SLBan) from tChiTietHDB
	join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	where YEAR(NgayBan) = @nam

	select @slsachNhap = sum(SLNhap) from tChiTietHDN
	join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
	where YEAR(NgayNhap) = @nam
End

create procedure cau11 @khachhang nvarchar(5),@nam nvarchar(5),@tien money output,@soHoaDonban int output
as
begin
	select @tien = sum(SoLuong*DonGiaBan) from tChiTietHDB 
	join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
	join tSach on tChiTietHDB.MaSach = tSach.MaSach
	where MaKH = @khachhang and YEAR(NgayBan) = @nam

	select @soHoaDonban = count(tHoaDonBan.SoHDB) from tHoaDonBan join tKhachHang on tKhachHang.MaKH = tHoaDonBan.MaKH
	where tKhachHang.MaKH = @khachhang and YEAR(NgayBan) = @nam
end



create function cau9 (@maLoai nvarchar(5))
returns Table
as
 return (
	select * from tSach join 
 )

 create function cau4LuyenTapThem (@ngay datetime) returns table
 as return (
	select * from tNhanVien where MONTH(NgaySinh) = MONTH(@ngay) and DAY(NgaySinh) = DAY(@ngay)
)


select * from tNhanVien
select * from cau4LuyenTapThem('2020/09/11')
 select * from tNhanVien

select * from tKhachHang
select * from tHoaDonBan
select * from tChiTietHDB




create function cau8 (@maSach nvarchar(5)) returns int
as
begin
	declare @slban int,@slNhap int
	select @slban = sum(SLBan) from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach  
	where tSach.MaSach = @maSach
	group by tSach.MaSach

	select @slban = sum(SLBan) from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach  
	where tSach.MaSach = @maSach
	group by tSach.MaSach
end


select tSach.MaSach,SLNhap from tSach join tChiTietHDN on tSach.MaSach = tChiTietHDN.MaSach
select * from tSach full outer join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
full outer join tChiTietHDN on tSach.MaSach = tChiTietHDN.MaSach




select distinct MaSach from tChiTietHDB
select * from tChiTietHDN