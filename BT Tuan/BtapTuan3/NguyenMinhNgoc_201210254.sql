USE [BT1CSDL2]

-- Tạo người dùng N05, pass 123
exec sp_addlogin N05, 123

-- Tạo 1 login cho N05
exec sp_adduser N05, N05user

exec sp_addlogin A, 123
exec sp_addlogin B, 123

exec sp_adduser A, A
exec sp_adduser B, B

Grant select, update on tKhachHang to A with grant option

-- View 
-- 1.	Tạo view in ra danh sách các sách của nhà xuất bản giáo dục nhập trong năm 2021
go
create view Cau1 as
	select s.MaSach, TenSach
	from tSach s join tChiTietHDN on s.MaSach = tChiTietHDN.MaSach
				 join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
				 join tNhaXuatBan on s.MaNXB = tNhaXuatBan.MaNXB
	where year(NgayNhap) = 2014 and TenNXB = N'NXB Kim Đồng'
go
-- 2.	Tạo view thống kê các sách không bán được trong năm 2021
create view Cau2 as
select s.MaSach, TenSach
from tSach as s
where s.MaSach not in (select MaSach 
					   from tChiTietHDB join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
					   where year(NgayBan) = 2014) 

select * from Cau2
-- 3.	Tạo view thống kê 2 khách hàng có tổng tiền tiêu dùng cao nhất trong năm 2021
create view Cau3 as
select top(2) with ties tKhachHang.MaKH, TenKh, sum(SLBan * DonGiaBan) as TongTienTieuDung
from tKhachHang join tHoaDonBan on tKhachHang.MaKH = tHoaDonBan.MaKH 
				join tChiTietHDB on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
				join tSach on tSach.MaSach = tChiTietHDB.MaSach
group by tKhachHang.MaKH, TenKh
order by sum(SLBan * DonGiaBan) desc
				
-- 4.	Tạo view thống kê số lượng sách bán ra trong năm 2014, nhập vào trong năm 2014 và chênh lêch giữa 2 số lượng này ứng với mỗi đầu sách
create view Cau4 as
select distinct tChiTietHDB.MaSach as SachBan, tChiTietHDN.MaSach as SachNhap, sum(SLBan) as SoLuongBan, SLNhap, SLNHap - sum(SLBan) as Chenhlech
from tChiTietHDB full outer join tChiTietHDN on tChiTietHDB.MaSach = tChiTietHDN.MaSach
			     full outer join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				full outer join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
group by tChiTietHDB.MaSach, tChiTietHDN.MaSach, SLNhap


select tSach.MaSach, TenSach, sum(SLBan) as SoLuongBan, SLNhap, SLNhap - sum(SLBan) as ChenhLech
from tSach full outer join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
		   full outer join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
		   full outer join tChiTietHDN on tChiTietHDN.MaSach = tSach.MaSach
		   full join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
where year(NgayBan) = 2014 and year(NgayNhap) = 2014
group by tSach.MaSach, TenSach, SLNhap, SLBan

select TenSach , sum(SLban)
from tSach
right outer join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
		   join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where year(NgayBan) = 2014
group by TenSach

update tSach
set SoLuong = (select )

-- 5.	Tạo view đưa ra những thông tin hóa đơn và tổng tiền của hóa đơn đó trong ngày 16/11/2021
-- 6.	 Tạo view đưa ra doanh thu bán hàng của từng tháng trong năm 2014, những tháng không có doanh thu thì ghi là 0.



-- Hàm và thủ tục
-- Tính Tổng Các Số Chẵn
DECLARE @t int, @x INT
SET @t = 0 
SET @x = 1
	WHILE (@x <=100)
		BEGIN
			IF((@x % 2) = 0)
				SET @t = @t + @x
				SET @x = @x + 1
		END
PRINT @t

--Tính Tổng Số Lẻ
DECLARE @t int, @x INT
SET @t = 0 
SET @x = 1
	WHILE (@x <=100)
		BEGIN
			IF((@x % 2) = 1)
				SET @t = @t + @x
				SET @x = @x + 1
		END
PRINT @t

--Tính 10!
DECLARE @t int, @x INT
SET @t = 1
SET @x = 1
	WHILE ( @x < 11)
		BEGIN 
			SET @t = @t * @x
			SET @x = @x + 1
		END
PRINT @t

-- VN: tìm hiểu deny dùng trong hoàn cảnh nào

select * from tNhaCungCap
select * from tNhanVien
select * from tKhachHang
select * from tHoaDonNhap
select * from tHoaDonBan
select * from tNhaXuatBan
select * from tChiTietHDN
select * from tChiTietHDB
select * from tTheLoai
select * from tSach

-- 1. In ra danh sách các sách chỉ lấy (MaSach, TenSach) do Nhà xuất bản Giáo Dục xuất bản.
select tSach.MaSach, TenSach
from tSach inner join tNhaXuatBan 
on tNhaXuatBan.MaNXB = tSach.MaNXB
where TenNXB = N'NXB Giáo Dục'

-- 2. In ra danh sách các sách có tên bắt đầu là “Ngày”.
select *
from tSach 
where TenSach like '%Ngày%'

-- 3. In ra danh sách các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục có giá từ 100.000 
-- đến 150.000
select tSach.MaSach, TenSach
from tSach inner join tNhaXuatBan 
on tNhaXuatBan.MaNXB = tSach.MaNXB
where TenNXB = N'NXB Giáo Dục' and (DonGiaBan between 100000 and 150000)

-- 4. In ra danh sách các các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục hoặc Nhà 
-- Xuất Bản Trẻ sản xuất có giá từ 90.000 đến 140.000.
select tSach.MaSach, TenSach, TenNXB
from tSach inner join tNhaXuatBan 
on tNhaXuatBan.MaNXB = tSach.MaNXB
where (TenNXB = N'NXB Giáo Dục' or TenNXB = N'NXB Trẻ') 
	  and (DonGiaBan between 90000 and 140000)

-- 5. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2014 và ngày 31/12/2014
select tHoaDonBan.SoHDB, sum(DonGiaBan * SLBan ) as TriGiaHD
from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where NgayBan = '2014-01-01' or NgayBan = '2014-12-31'
group by tHoaDonBan.SoHDB

-- 6. In ra các số hóa đơn, trị giá hóa đơn trong tháng 4/2014, sắp xếp theo ngày (tăng dần) và 
-- trị giá của hóa đơn (giảm dần).
select tHoaDonBan.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHD
from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where datepart(mm, NgayBan) = 4
group by tHoaDonBan.SoHDB, NgayBan
order by NgayBan, TriGiaHD desc

-- 7. In ra danh sách các khách hàng (MaKH, TenKH) đã mua hàng trong ngày 10/4/2014.
select tKhachHang.MaKH, TenKH
from tKhachHang inner join tHoaDonBan 
on tKhachHang.MaKH = tHoaDonBan.MaKH
where NgayBan = '2014-04-10'

-- 8. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Trần Huy” lập trong ngày 
-- “11/8/2014”
select tHoaDonBan.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHD
from tHoaDonBan join tNhanVien on tHoaDonBan.MaNV = tNhanVien.MaNV
				join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where NgayBan = '2014-08/11' and TenNV = N'Trần Huy'
group by tHoaDonBan.SoHDB

-- 9. In ra danh sách các sách (MaSach,TenSach) được khách hàng có tên “Nguyễn Đình Sơn” 
-- mua trong tháng 8/2014.
select tSach.MaSach, TenSach
from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
		   join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
		   join tKhachHang on tHoaDonBan.MaKH = tKhachHang.MaKH
where TenKH = N'Nguyễn Đình Sơn' 
and month(NgayBan) = 8 and year(NgayBan) = 2014

-- 10. Tìm các số hóa đơn đã mua sách “Cấu trúc dữ liệu và giải thuật” 
select tChiTietHDB.soHDB
from tChiTietHDB join tSach 
on tChiTietHDB.MaSach = tSach.MaSach
where TenSach = N'Cấu trúc dữ liệu và giải thuật'

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “S01” hoặc “S02”, mỗi sản phẩm mua với 
-- số lượng từ 10 đến 20.
select soHDB
from tChiTietHDB
where (MaSach = 'S01' or MaSach = 'S02' ) 
	  and (SLban between 10 and 20)

-- 12. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “S10” và “S11”, mỗi sản phẩm 
-- mua với số lượng từ 5 đến 10.
select soHDB
from tChiTietHDB
where MaSach = 'S10' and (SLban between 5 and 10) 
	  and soHDB in (select SoHDB from tChiTietHDB
					where MaSach = 'S11' 
					and (SLban between 5 and 10) )
-- Cach 2
select t1.soHDB
from tChiTietHDB as t1 inner join tChiTietHDB as t2 
on t1.SoHDB = t2.SoHDB
where t1.MaSach = 'S10' and (t1.SLban between 5 and 10)  
and t2.MaSach = 'S11' and (t2.SLban between 5 and 10) 

-- 13. In ra danh sách các sách không bán được.
select * 
from tSach 
where MaSach not in (select distinct MaSach from tChiTietHDB)

-- 14. In ra danh sách các sách không bán được trong năm 2014.
select * 
from tSach 
where MaSach not in (select distinct MaSach 
					 from tChiTietHDB join tHoaDonBan
					 on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
					 where year(NgayBan) = 2014)

-- 15. In ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014.
select tSach.* 
from tSach join tNhaXuatBan
on tSach.MaNXB = tNhaXuatBan.MaNXB
where MaSach not in (select distinct MaSach 
					 from tChiTietHDB join tHoaDonBan
					 on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
					 where year(NgayBan) = 2014)
and TenNXB = N'NXB Giáo Dục'
-- 16. Tìm số hóa đơn đã mua tất cả các sách của NXB Giáo Dục.
-- Có 2 cách hiểu ?
select soHDB 
from tChiTietHDB
where soHDB not in (
	  select distinct soHDB
	  from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
					   join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
	  where TenNXB != N'NXB Giáo Dục')

-- 17. Có bao nhiêu đầu sách khác nhau được bán ra trong năm 2014.
select count (*) as SoLuongDauSach
from (select distinct MaSach 
	  from tChiTietHDB join tHoaDonBan
	  on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	  where Year(NgayBan) = 2014) SoLuongDauSach

-- 18. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
select max(TriGiaHoaDon) as TriGiaHoaDonCaoNhat, 
	   min(TriGiaHoaDon) as TriGiaHoaDonThapNhat
from (	select tChiTietHDB.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHoaDon
		from tChiTietHDB join tSach 
		on tChiTietHDB.MaSach = tSach.MaSach
		group by tChiTietHDB.SoHDB) TriGiaHoaDon

-- 19. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2014 là bao nhiêu?
select avg(TriGiaHoaDon) as TriGiaHoaDonTrungBinh
from (	select tChiTietHDB.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHoaDon
		from tChiTietHDB join tSach 
		on tChiTietHDB.MaSach = tSach.MaSach
		group by tChiTietHDB.SoHDB) TriGiaHoaDon join tHoaDonBan
on TriGiaHoaDon.SoHDB = tHoaDonBan.SoHDB
where Year(NgayBan) = 2014

-- 20. Tính doanh thu bán hàng trong năm 2014.
select sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where Year(NgayBan) = 2014

-- 21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014.
select top(1) with ties tChiTietHDB.SoHDB, 
	   sum(DonGiaBan * SLBan) as TriGiaHoaDon
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where year(NgayBan) = 2014
group by tChiTietHDB.SoHDB
order by TriGiaHoaDon desc
	
-- 21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014
WITH tTriGiaHoaDon
AS (	  SELECT tHoaDonBan.SoHDB, SUM(SLBan * DonGiaBan) as TriGia, YEAR(NgayBan) AS NamBan
		  FROM tChiTietHDB JOIN tSach ON tChiTietHDB.MaSach = tSach.MaSach 
						   JOIN tHoaDonBan ON tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
		  GROUP BY tHoaDonBan.SoHDB, YEAR(NgayBan)
	)
SELECT SoHDB
FROM tTriGiaHoaDon
WHERE NamBan = 2014 AND TriGia = (SELECT MAX(TriGia) FROM tTriGiaHoaDon)

-- 22. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014.
select top(1) with ties tChiTietHDB.SoHDB, TenKH, 
	   sum(DonGiaBan * SLBan) as TriGiaHoaDon
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				 join tKhachHang on tKhachHang.MaKH = tHoaDonBan.MaKH
where year(NgayBan) = 2014
group by tChiTietHDB.SoHDB, TenKH
order by TriGiaHoaDon desc
---......
-- 23. In ra danh sách 3 khách hàng (MaKH, TenKH) có doanh số cao nhất.
select tKhachHang.MaKH, tenKH, DiaChi, DienThoai, 
	   sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
					 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
					 join tKhachHang on tKhachHang.MaKH = tHoaDonBan.MaKH
group by tKhachHang.MaKH, tenKH, DiaChi, DienThoai
having sum((DonGiaBan - DonGiaNhap) * SLBan) 
in (select distinct top(3) sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
	from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
					 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
					 join tKhachHang on tKhachHang.MaKH = tHoaDonBan.MaKH
	group by tKhachHang.MaKH
	order by DoanhThu desc)
											
-- 24. In ra danh sách các sách có giá bán bằng 1 trong 3 mức giá cao nhất.
select *
from tSach 
where DonGiaBan in (select distinct top(3) DonGiaBan
					from tSach
					order by DonGiaBan desc)
order by DonGiaBan

-- 25. In ra danh sách các sách do NXB Giáo Dục sản xuất có giá bằng 1 trong 3 mức giá cao 
-- nhất (của tất cả các sản phẩm).
select *
from tSach join tNhaXuatBan 
on tNhaXuatBan.MaNXB = tSach.MaNXB
where TenNXB = N'NXB Giáo Dục' and
DonGiaBan in (select distinct top(3) DonGiaBan
			  from tSach
			  order by DonGiaBan desc)

-- 26. Tính tổng số đầu sách do NXB Giáo Dục xuất bản.
select count(*)
from tSach join tNhaXuatBan 
on tSach.MaNXB = tNhaXuatBan.MaNXB
where TenNXB = N'NXB Giáo Dục'

-- 27. Tính tổng số sách của từng NXB.
select  tNhaXuatBan.MaNXB, TenNXB, 
		sum(SoLuong) as SoLuongSach
from tNhaXuatBan join tSach 
on tSach.MaNXB = tNhaXuatBan.MaNXB
group by  tNhaXuatBan.MaNXB, TenNXB

-- 28. Với từng NXB, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select tNhaXuatBan.MaNXB, TenNXB, max(DonGiaBan) as CaoNhat, 
	   min(DonGiaBan) as ThapNhat, avg(DonGiaBan) as TrungBinh
from tNhaXuatBan join tSach on tNhaXuatBan.MaNXB = tSach.MaNXB
group by tNhaXuatBan.MaNXB, TenNXB

-- 29. Tính doanh thu bán hàng mỗi ngày.
select year(NgayBan), month(NgayBan), NgayBan, sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
group by Rollup(Year(NgayBan),  Month(NgayBan), NgayBan)

select NgayBan, sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
group by NgayBan


-- 30. Tính tổng số lượng của từng sách bán ra trong tháng 10/2014.
-- 2 nghĩa ????
select tChiTietHDB.MaSach, sum(SLBan) as SoLuong
from tHoaDonBan join tChiTietHDB 
on tChiTietHDB.SoHDB = tChiTietHDB.SoHDB 
where month(NgayBan) = 10 and year(NgayBan) = 2014
group by tChiTietHDB.MaSach

-- 31. Tính doanh thu bán hàng của từng tháng trong năm 2014 (kể cả những tháng không có 
-- doanh thu, VD: Tháng 1: 0; Tháng 2: 12000000; Tháng 3: 0; Tháng ….)
create table tThang(
	Thang varchar(2) primary key
)
Insert into tThang(Thang)
values
	('1'),
	('2'),
	('3'),
	('4'),
	('5'),
	('6'),
	('7'),
	('8'),
	('9'),
	('10'),
	('11'),
	('12')

select Month(NgayBan) as Thang, sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
into DoanhThu 
from tHoaDonBan join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where Year(NgayBan) = 2014					
group by Month(NgayBan)

select tThang.Thang, DoanhThu
from DoanhThu right join tThang on DoanhThu.Thang = tThang.Thang

-- Cách cô chữa
case 
	when điều kiện then giá trị
	when điều kiện then giá trị
	...
	else giá trị 
end
isnull(tên trường, 0) => nếu trường có giá trị null thì cho bằng 0

-- Chữa câu 31:
select 
	SUM(case when MONTH(NgayBan) = 1 then (slBan*DonGiaBan) else 0 end) as Thang1,
	SUM(case when MONTH(NgayBan) = 2 then (slBan*DonGiaBan) else 0 end) as Thang2,
	SUM(case when MONTH(NgayBan) = 3 then (slBan*DonGiaBan) else 0 end) as Thang3,
	SUM(case when MONTH(NgayBan) = 4 then (slBan*DonGiaBan) else 0 end) as Thang4,
	SUM(case when MONTH(NgayBan) = 5 then (slBan*DonGiaBan) else 0 end) as Thang5,
	SUM(case when MONTH(NgayBan) = 6 then (slBan*DonGiaBan) else 0 end) as Thang6,
	SUM(case when MONTH(NgayBan) = 7 then (slBan*DonGiaBan) else 0 end) as Thang7,
	SUM(case when MONTH(NgayBan) = 8 then (slBan*DonGiaBan) else 0 end) as Thang8,
	SUM(case when MONTH(NgayBan) = 9 then (slBan*DonGiaBan) else 0 end) as Thang9,
	SUM(case when MONTH(NgayBan) = 10 then (slBan*DonGiaBan) else 0 end) as Thang10,
	SUM(case when MONTH(NgayBan) = 11 then (slBan*DonGiaBan) else 0 end) as Thang11,
	SUM(case when MONTH(NgayBan) = 12 then (slBan*DonGiaBan) else 0 end) as Thang12
from tHoaDonBan hdb join tChiTietHDB ctb on hdb.SoHDB = ctb.SoHDB
					join tSach s on ctb.MaSach = s.MaSach
where year(NgayBan) = 2014

-- 32. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select tChiTietHDB.SoHDB, count(MaSach) as SoLoaiHang
from tChiTietHDB 
group by SoHDB
having count(MaSach) >= 4

-- 33. Tìm hóa đơn có mua 3 sách do NXB Giáo Dục xuất bản (3 sách khác nhau).
select tChiTietHDB.SoHDB
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
where tNhaXuatBan.TenNXB = N'NXB Giáo Dục' 
group by SoHDB
having count(distinct tChiTietHDB.MaSach) = 3

-- 34. Tìm khách hàng (MaKH, TenKH) có số lần mua hàng nhiều nhất.
select top (1) with ties tKhachHang.MaKH, TenKH, 
			   count (SoHDB) as SoLanMuaHang
from tKhachHang join tHoaDonBan 
on tKhachHang.MaKH = tHoaDonBan.MaKH
group by tKhachHang.MaKH, TenKH
order by SoLanMuaHang desc

-- 35. Tháng mấy trong năm 2014, doanh số bán hàng cao nhất ?
select top(1) with ties Month(NgayBan) as Thang, 
			  sum(SLBan*(DonGiaBan  - DonGiaNhap)) as DoanhSo
from tHoaDonBan join tChiTietHDB  
				on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach 
				on tChiTietHDB.MaSach = tSach.MaSach
where Year(NgayBan) = 2014
group by Month(NgayBan)
order by DoanhSo desc

-- 36. Tìm sách có tổng số lượng bán ra thấp nhất trong năm 2014.
-- In ra sách có số lượng bán = 0 hay số lượng bán ít nhất > 0 ?
select top(1) with ties tChiTietHDB.MaSach, TenSach, 
			  sum(SLBan) as Soluong
from tSach left join tChiTietHDB on tChiTietHDB.MaSach = tSach.MaSach
		   join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
where year(NgayBan) = 2014
group by tChiTietHDB.MaSach, TenSach
order by Soluong asc

-- 37. Mỗi NXB, tìm sách (MaSach,TenSach) có giá bán cao nhất.
select TenNXB, S1.MaSach, TenSach, DonGiaBan
from tNhaXuatBan join tSach as S1 on tNhaXuatBan.MaNXB = S1.MaNXB
where DonGiaBan = (	select max(DonGiaBan)
					from tSach as S2
					where S2.MaNXB = tNhaXuatBan.MaNXB)

-- 38. Giảm giá sách 10% cho các sách của NXB Giáo Dục 
-- ? Giảm ở tSach hay giảm ở tChiTietHoaDon
select tenSach, DonGiaBan
from tSach 
where MaNXB = 'NXB05'

UPDATE tSach
set DonGiaBan = DonGiaBan * 0.9
from tNhaXuatBan
where tNhaXuatBan.TenNXB = N'NXB Giáo Dục' 
	  and tNhaXuatBan.MaNXB = tSach.MaNXB

-- 39. Thêm trưởng tổng tiền cho bảng tHoaDonBan rồi cập nhật tổng tiền của hóa đơn cho 
-- trường này.
alter table tHoaDonBan 
add TongTien money null

UPDATE tHoaDonBan
set TongTien = tien
from tHoaDonBan join (select soHDB as soHD2, sum(SLBan*DonGiaBan) as tien
					  from tChiTietHDB join tSach 
					  on tChiTietHDB.MaSach = tSach.MaSach
					  group by soHDB) as tTongTien
on tHoaDonBan.SoHDB = soHD2

select * from tHoaDonBan

-- 40. Giảm 10% trên tổng hóa đơn cho các hóa đơn có trị giá trên 500.000 trong tháng 9/2014
update tHoaDonBan
set TongTien = TongTien*0.9
where TongTien > 500000 
      and year(NgayBan) = 2014 
      and month(NgayBan) = 9

-- 41. Tính tổng số lượng sách nhập trong năm 2014
select sum(SLNhap)
from tChiTietHDN join tHoaDonNhap 
on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
where Year(NgayNhap) = 2014

-- 42. Tính tổng số lượng sách bán trong năm 2014
select sum(SLBan)
from tChiTietHDB join tHoaDonBan 
on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where Year(NgayBan) = 2014

-- 43. Tính tổng tiền đã nhập trong năm 2014
-- ? tổng tiền sách đã nhập
select sum(SLNhap * DonGiaNhap) as TongTienNhapSach
from tHoaDonNhap join tChiTietHDN on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
				 join tSach on tChiTietHDN.MaSach = tSach.MaSach
where Year(NgayNhap) = 2014				 

-- 44. Xóa những hóa đơn do nhân viên "Trần Huy" lập (lưu ý xóa chi tiết hóa đơn trước)
delete from tChiTietHDB
from tHoaDonBan, tNhanVien
where tNhanVien.MaNV = tHoaDonBan.MaNV 
and TenNV = N'Trần Huy' 
and tChiTietHDB.SoHDB = tHoaDonBan.SoHDB

select * from tChiTietHDB
-- 45. Đổi tên "NXB Thăng Long" thành "NXB Văn học
update tNhaXuatBan
set TenNXB = N'NXB Văn học'
where TenNXB = N'NXB Thăng Long'

-- 46. Đưa ra thông tin toàn bộ sách, nếu sách được bán trong năm 2014 thì đưa ra SL bán
-- dùng left join
select tSach.*, SoLuongBan
from tSach left join 
(select tChiTietHDB.MaSach, sum(SLBan) as SoLuongBan
from tChiTietHDB join tSach as tSach2 on tSach2.MaSach = tChiTietHDB.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where year(NgayBan) = 2014
group by tChiTietHDB.MaSach) as Sach2014
on tSach.MaSach = Sach2014.MaSach