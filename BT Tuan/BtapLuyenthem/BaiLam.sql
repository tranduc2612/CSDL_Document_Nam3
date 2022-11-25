use QLBanSachLuyenThem

-- Create view
-- 1.Tạo view in ra danh sách các sách của nhà xuất bản giáo dục nhập trong năm 2021
create view cau1View as
select distinct tNhaXuatBan.MaNXB,tenNXB from tNhaXuatBan 
join tSach on tNhaXuatBan.MaNXB = tSach.MaNXB
join tChiTietHDN on tChiTietHDN.MaSach = tSach.MaSach
join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
where YEAR(NgayNhap) = '2014'

select * from cau1View

--2.Tạo view thống kê các sách không bán được trong năm 2021
create view cau2View as 
select * from tSach where MaSach not in 
(select distinct MaSach from tChiTietHDB join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB where Year(NgayBan) = '2014')

select * from cau2View

--3.Tạo view thống kê 10 khách hàng có tổng tiền tiêu dùng cao nhất trong năm 2021
create view cau3View as
select top 3 with ties MaKH,sum(SLBan*DonGiaBan) as ChiTieu from tChiTietHDB join tSach 
on tSach.MaSach = tChiTietHDB.MaSach
join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
group by MaKH
order by ChiTieu desc

select * from cau3View

-- 4.Tạo view thống kê số lượng sách bán ra trong năm 2021 và số lượng sách nhập trong năm 2021 và chênh lệch giữa hai số lượng này ứng với mỗi đầu sách
create view cau4View as
select tSach.MaSach,tSach.TenSach,ISNULL(SLB,0) as SoLuongBan,ISNULL(SLN,0) as SoLuongNhap,ISNULL(SLN,0)-ISNULL(SLB,0)  as ChenhLech from tSach join
(select MaSach, Sum(SLBan) as SLB from tChiTietHDB join tHoaDonBan 
on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
where YEAR(NgayBan) = '2014'
group by MaSach) as BangSLB
on tSach.MaSach = BangSLB.MaSach
join
(select MaSach, Sum(SLNhap) as SLN from tChiTietHDN join tHoaDonNhap 
on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN 
where YEAR(NgayNhap) = '2014'
group by MaSach) as BangSLN
on BangSLB.MaSach = BangSLN.MaSach

--Tạo view đưa ra những thông tin hóa đơn và tổng tiền của hóa đơn đó trong ngày 16/11/2021
create view cau5View as
select tHoaDonBan.SoHDB,sum(DonGiaBan*SLBan) as tong from tSach join tChiTietHDB 
join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
on tSach.MaSach = tChiTietHDB.MaSach
where MONTH(NgayBan) = '5' and YEAR(NgayBan) = '2014'
group by tHoaDonBan.SoHDB

select * from tHoaDonBan




















-- de kiem tra CNTT1
create proc cau1CNTT1 @tenNV nvarchar(255),@nam nvarchar(5) , @soTien money output, @slHDB int output
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
exec cau1CNTT1 N'Trần Huy','2014',@soTienD output,@soluonghd output
print @sotienD
print @soluonghd

-- cau 3
exec sp_addlogin NguyenBinhAn,123
exec sp_adduser NguyenBinhAn,NguyenBinhAn

grant select,update on tSach to NguyenBinhAn with grant option 

exec sp_addlogin NguyenDucAnh,123
exec sp_adduser NguyenDucAnh,NguyenDucAnh

-- cau 4
create function cau4CNTT1 (@thang nvarchar(5),@nam nvarchar(5)) returns table as
return (
	select top 1 with ties tChiTietHDB.SoHDB,NgayBan,count(tHoaDonBan.SoHDB) as SLHD from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB where YEAR(NgayBan) = @nam and MONTH(NgayBan) = @thang
group by NgayBan,tChiTietHDB.SoHDB
order by SLHD desc
)

select * from cau4CNTT1('2014','5');

-- cau 2
alter table tKhachHang add SLSachMua int;
create trigger Cau2CNTT2 on dbo.tChiTietHDB
for insert as
begin
	declare @soHD nvarchar(255),@slBan int,@maK nvarchar(255)
	select @soHD = SoHDB,@slBan = SLBan from inserted
	select @maK  = MaKH from tHoaDonBan where tHoaDonBan.SoHDB = @soHD
	update tKhachHang set SLSachMua = isNull(SLSachMua,0) + @slBan where MaKH = @maK
end

create trigger Cau2CNTT1 on dbo.tChiTietHDB
for insert as
begin
	declare @soHD nvarchar(255),@slban int,@maK nvarchar(255), @slsach int
	select @soHD = SoHDB,@slBan = SLBan from inserted
	select @slsach = sum(SLBan) from tHoaDonBan
	join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	where  @maK = MaKH
	group by  MaKH 
	update tKhachHang set SLSachMua = isNull(SLSachMua,0) + @slsach where MaKH = @maK
end

select * from tChiTietHDB
insert into tChiTietHDB values ('HDB01','S09',3,Null)
select * from tKhachHang


-- Đề luyện hôm tối thứ 7
-- câu 1: Tạo hàm có đầu vào là tháng đầu ra là thông tin các hóa đơn trong tháng đó
create function cau1LuyenTapT7 (@thang nvarchar(5),@nam nvarchar(5)) returns table 
as return(
	select * from tHoaDonBan where YEAR(NgayBan) = @nam and MONTH(NgayBan) = @thang
)

select * from cau1LuyenTapT7('5','2014')
-- câu 2: Tạo hàm thủ tục có đầu vào là mã nhân viên, đầu ra là số lượng hóa đơn nhập, số lượng hóa đơn bán mà nhân viên đó xử lý.
create proc cau2LuyenTapT7 @maNV nvarchar(5),@slN int output,@slB int output as
begin
	select @slB = sum(SLBan) from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
	where MaNV = @maNV
	group by tHoaDonBan.SoHDB

	select @slN = sum(SLNhap) from tHoaDonNhap join tChiTietHDN on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN 
	where MaNV = @maNV
	group by tHoaDonNhap.SoHDN
end

declare @slban int,@slnhap int
exec cau2LuyenTapT7 'NV01',@slnhap output,@slban output
print @slnhap
print @slban

-- câu 3: Tạo view đưa ra thông tin các khách hàng và thông tin hóa đơn, giá trị hóa đơn họ đã mua trong năm 2014
create view cau3LuyenTapT7 as
select tKhachHang.MaKH,TenKH,sum(SLBan*DonGiaBan) as GiaTri from tKhachHang join tHoaDonBan on tKhachHang.MaKH = tHoaDonBan.MaKH
						 join tChiTietHDB on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
						 join tSach on tSach.MaSach = tChiTietHDB.MaSach
Where YEAR(NgayBan) = '2014'
group by tKhachHang.MaKH,TenKH
select * from cau3LuyenTapT7

-- câu 4: Thêm trường Tổng số đầu sách và bảng thế loại, cập nhật tự động cho trường này mỗi khi thêm, sửa, xóa 
--một chi tiết hóa đơn bán
ALTER trigger cau4LuyenTapT7 on tChiTietHDB for insert,update,delete as
begin
	declare @maSachI nvarchar(255),@maSachD nvarchar(255),@maTheLoaiI nvarchar(255),@maTheLoaiD nvarchar(255)
	select @maSachI = MaSach from inserted 
	select @maSachD = MaSach from deleted
	select @maTheLoaiI = MaTheLoai from tSach where @maSachI = MaSach
	update tTheLoai set TongSoDauSach = isnull(TongSoDauSach,0) + 1 where MaTheLoai = @maTheLoaiI
	select @maTheLoaiD = MaTheLoai from tSach where @maSachD = MaSach
	update tTheLoai set TongSoDauSach = isnull(TongSoDauSach,0) - 1 where MaTheLoai = @maTheLoaiD
END

-- câu 5: 
drop trigger cau4LuyenTapT7

update tTheLoai set TongSoDauSach = (select count(MaSach) from tSach where MaTheLoai = 'TL01') where MaTheLoai = 'TL01'
select MaSach from tSach where MaTheLoai = 'TL01'
select MaTheLoai,SLBan from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
select * from tChiTietHDB
select * from tTheLoai

-- câu 6:
create view cau6LuyenTapT7 as
select MaKH,count(SoHDB) as SL from tHoaDonBan
group by MaKH
HAVING COUNT(SoHDB) IN (SELECT DISTINCT TOP 2 count(SoHDB) as SL from tHoaDonBan group by MaKH order by SL desc)


