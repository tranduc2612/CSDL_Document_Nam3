USE [BT1CSDL]
GO
select * from dbo.tChiTietHDB
select * from dbo.tSach
select * from dbo.tHoaDonBan
select * from dbo.tChiTietHDN
select * from dbo.tHoaDonNhap
select * from dbo.tKhachHang
select * from dbo.tNhaCungCap
select * from dbo.tNhanVien
select * from dbo.tNhaXuatBan
select * from dbo.tTheLoai

--1. In ra danh sách các sách chỉ lấy (MaSach,TenSach) do Nhà xuất bản Giáo Dục xuất bản.
select tSach.MaSach, TenSach
from tSach inner join tNhaXuatBan 
on tNhaXuatBan.MaNXB = tSach.MaNXB
where TenNXB = N'NXB Giáo Dục'
--2. In ra danh sách các sách có tên bắt đầu là “Ngày”.
select * from dbo.tSach where TenSach like N'Lập%'
--3. In ra danh sách các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục có giá từ 100.000 đến 150.000.

select MaSach,TenSach from dbo.tSach inner join dbo.tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
where TenNXB = N'NXB Giáo Dục' and 100000 > DonGiaBan and DonGiaBan > 150000

--4. In ra danh sách các các sách (MaSach,TenSach) do Nhà xuất bản Giáo Dục hoặc 
--Nhà Xuất Bản Trẻ sản xuất có giá từ 90.000 đến 140.000.
select MaSach,TenSach,TenNXB,DonGiaBan from dbo.tSach inner join dbo.tNhaXuatBan 
on tSach.MaNXB = tNhaXuatBan.MaNXB
where TenNXB = N'NXB Giáo Dục' or TenNXB = N'NXB Trẻ' and 90000 > DonGiaBan and DonGiaBan > 140000
	
--5. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2014 và ngày 31/12/2014.
select  tChiTietHDB.SoHDB ,sum(tChiTietHDB.SLBan*tSach.DonGiaBan) as TongTien 
from dbo.tChiTietHDB inner join dbo.tSach on tChiTietHDB.MaSach = tSach.MaSach 
inner join dbo.tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB where tHoaDonBan.NgayBan = '2013-1-1' 
or tHoaDonBan.NgayBan = '2014-7-10' group by tChiTietHDB.SoHDB, tHoaDonBan.NgayBan
--6. In ra các số hóa đơn, trị giá hóa đơn trong tháng 4/2014, 
--sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select tChiTietHDB.SoHDB as SoHoaDon,sum(tChiTietHDB.SLBan*tSach.DonGiaBan) as TongTien 
from tChiTietHDB inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
inner join tSach on tSach.MaSach = tChiTietHDB.MaSach where month(tHoaDonBan.NgayBan) = '4' 
and year(tHoaDonBan.NgayBan) = '2014'
group by tChiTietHDB.SoHDB,tChiTietHDB.SLBan,tSach.DonGiaBan,tHoaDonBan.NgayBan
order by TongTien DESC, tHoaDonBan.NgayBan ASC

--7. In ra danh sách các khách hàng (MaKH, TenKH) đã mua hàng trong ngày 10/4/2014.
select tKhachHang.MaKH, TenKH
from tKhachHang inner join tHoaDonBan 
on tKhachHang.MaKH = tHoaDonBan.MaKH
where NgayBan = '2014-04-10'

--8. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Trần Huy” lập trong ngày “11/8/2014”
select tHoaDonBan.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHD
from tHoaDonBan join tNhanVien on tHoaDonBan.MaNV = tNhanVien.MaNV
				join tChiTietHDB on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach on tChiTietHDB.MaSach = tSach.MaSach
where NgayBan = '2014-08/11' and TenNV = N'Trần Huy'
group by tHoaDonBan.SoHDB

--9. In ra danh sách các sách (MaSach,TenSach) được khách hàng có tên “Nguyễn Đình Sơn” mua trong tháng 8/2014.
select tSach.MaSach, TenSach
from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
		   join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
		   join tKhachHang on tHoaDonBan.MaKH = tKhachHang.MaKH
where TenKH = N'Nguyễn Đình Sơn' 
and month(NgayBan) = 8 and year(NgayBan) = 2014
--10. Tìm các số hóa đơn đã mua sách “Cấu trúc dữ liệu và giải thuật” 
select tChiTietHDB.SoHDB from tChiTietHDB 
inner join tSach on tSach.MaSach = tChiTietHDB.MaSach 
where tSach.TenSach = N'Cấu trúc dữ liệu và giải thuật'

--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “S01” hoặc “S02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
select SoHDB from tChiTietHDB where MaSach in ('S01','S02') and SLBan between 10 and 20 

--12. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “S10” và “S11”, mỗi sản phẩm mua với số lượng từ 5 đến 10.
select tchiTietHDB.SoHDB from tChiTietHDB inner join 
(select SoHDB from tChiTietHDB where MaSach = 'S10' and SLBan between 5 and 10) as bangPhu 
on bangPhu.SoHDB = tChiTietHDB.SoHDB where tChiTietHDB.MaSach = 'S11' and SLBan between 5 and 10

--13. In ra danh sách các sách không bán được.
select * 
from tSach 
where MaSach not in (select distinct MaSach from tChiTietHDB)
--14. In ra danh sách các sách không bán được trong năm 2014.
select * 
from tSach 
where MaSach not in (select distinct MaSach 
					 from tChiTietHDB join tHoaDonBan
					 on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
					 where year(NgayBan) = 2014)
--15. In ra danh sách các sách của NXB Giáo Dục không bán được trong năm 2014.
select tSach.* 
from tSach inner join tNhaXuatBan
on tSach.MaNXB = tNhaXuatBan.MaNXB
where MaSach not in (select distinct MaSach 
					 from tChiTietHDB inner join tHoaDonBan
					 on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
					 where DATEPART(yy, NgayBan) = 2014)
	 and TenNXB = N'NXB Giáo Dục'

--16. Tìm số hóa đơn đã mua tất cả các sách của NXB Giáo Dục.

select SoHDB,TenNXB,TenSach,SLBan from tSach 
inner join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach 
inner join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB where tNhaXuatBan.TenNXB = N'NXB Giáo Dục'


--17. Có bao nhiêu đầu sách khác nhau được bán ra trong năm 2014. *****
select COUNT(TongSoSachMua) as SoDauSachBanRa from (select MaSach,COUNT(MaSach) as TongSoSachMua from tChiTietHDB 
inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB 
where year(tHoaDonBan.NgayBan) = '2014'
group by MaSach) as BangPhu

--18. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu? ******
select max(TriGiaHoaDon) as TriGiaHoaDonCaoNhat, 
	   min(TriGiaHoaDon) as TriGiaHoaDonThapNhat
from (select tChiTietHDB.SoHDB, sum(DonGiaBan * SLBan) as TriGiaHoaDon
		from tChiTietHDB join tSach 
		on tChiTietHDB.MaSach = tSach.MaSach
		group by tChiTietHDB.SoHDB) TriGiaHoaDon

--19. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2014 là bao nhiêu? *****
select avg(DonGia) as TriGiaTrungBinh from (
select tChiTietHDB.SoHDB,tHoaDonBan.NgayBan,sum(SLBan*DonGiaBan) as DonGia from tChiTietHDB 
inner join tSach on tChiTietHDB.MaSach = tSach.MaSach 
inner join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
where year(tHoaDonBan.NgayBan) = '2014'
group by tChiTietHDB.SoHDB,tHoaDonBan.NgayBan
) as BangPhu

--20. Tính doanh thu bán hàng trong năm 2014. *********
select sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where Year(NgayBan) = 2014

--21. Tìm số hóa đơn có trị giá cao nhất trong năm 2014. ********
select top 1 tChiTietHDB.SoHDB,tHoaDonBan.NgayBan,sum(SLBan*DonGiaBan) as DonGia from tChiTietHDB 
inner join tSach on tChiTietHDB.MaSach = tSach.MaSach 
inner join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
where year(tHoaDonBan.NgayBan) = '2014'
group by tChiTietHDB.SoHDB,tHoaDonBan.NgayBan
order by DonGia desc 



--22. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2014. ********
select top 1 tKhachHang.TenKH,tChiTietHDB.SoHDB,sum(SLBan*DonGiaBan) as DonGia from tChiTietHDB 
inner join tSach on tChiTietHDB.MaSach = tSach.MaSach 
inner join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
inner join tKhachHang on tHoaDonBan.MaKH = tKhachHang.MaKH
where year(tHoaDonBan.NgayBan) = '2014'
group by tChiTietHDB.SoHDB,tKhachHang.TenKH order by DonGia desc

--23. In ra danh sách 3 khách hàng (MaKH, TenKH) có doanh số cao nhất. *******
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

--24. In ra danh sách các sách có giá bán bằng 1 trong 3 mức giá cao nhất.*****

select tSach.MaSach, tSach.TenSach, tSach.DonGiaBan from tSach
where tSach.DonGiaBan in (select distinct top 3 DonGiaBan from tSach order by DonGiaBan desc)
order by tSach.DonGiaBan desc

--25. In ra danh sách các sách do NXB Giáo Dục sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).*********
select tSach.MaSach, tSach.TenSach, tSach.DonGiaBan,tNhaXuatBan.TenNXB from tSach
inner join tNhaXuatBan on tNhaXuatBan.MaNXB = tSach.MaNXB
where (tSach.DonGiaBan in (select distinct top 3 DonGiaBan from tSach order by DonGiaBan desc)) and tNhaXuatBan.TenNXB = N'NXB Giáo Dục'
order by tSach.DonGiaBan desc

--26. Tính tổng số đầu sách do NXB Giáo Dục xuất bản.*****
select count(MaSach) as TongDauSach from tSach 
inner join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
where tNhaXuatBan.TenNXB = N'NXB Giáo Dục'

--27. Tính tổng số sách của từng NXB.**********
select  tNhaXuatBan.MaNXB, TenNXB, 
		sum(SoLuong) as SoLuongSach
from tNhaXuatBan join tSach 
on tSach.MaNXB = tNhaXuatBan.MaNXB
group by  tNhaXuatBan.MaNXB, TenNXB

--28. Với từng NXB, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.*******
select tNhaXuatBan.TenNXB,max(tSach.DonGiaBan) as GiaSachBanCaoNhat,min(tSach.DonGiaBan) as GiaSachBanThapNhat, 
avg(tSach.DonGiaBan) as GiaBanTrungBinh
from tSach inner join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB
group by tNhaXuatBan.TenNXB

--29. Tính doanh thu bán hàng mỗi ngày.

select year(NgayBan), month(NgayBan), NgayBan, sum((DonGiaBan - DonGiaNhap) * SLBan) as DoanhThu
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
group by Rollup(Year(NgayBan),  Month(NgayBan), NgayBan)

--30. Tính tổng số lượng của từng sách bán ra trong tháng 10/2014.
select tChiTietHDB.MaSach, sum(SLBan) as SoLuong
from tHoaDonBan join tChiTietHDB 
on tChiTietHDB.SoHDB = tChiTietHDB.SoHDB 
where month(NgayBan) = 10 and year(NgayBan) = 2014
group by tChiTietHDB.MaSach

--31. Tính doanh thu bán hàng của từng tháng trong năm 2014 (kể cả những tháng không có doanh thu, VD: Tháng 1: 0; Tháng 2: 12000000; Tháng 3: 0; Tháng ….)
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

--32. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SoHDB,count(MaSach) as SoSachMua from tChiTietHDB group by SoHDB having count(MaSach) >= 4

--33. Tìm hóa đơn có mua 3 sách do NXB Giáo Dục xuất bản (3 sách khác nhau).
select SoHDB,count(MaSach) as SoSach from tChiTietHDB 
where tChiTietHDB.MaSach in 
	(select tSach.MaSach from tSach 
	inner join tNhaXuatBan on tSach.MaNXB = tNhaXuatBan.MaNXB 
	where tNhaXuatBan.TenNXB = N'NXB Giáo Dục')
group by SoHDB
having count(MaSach) >= 3

--34. Tìm khách hàng (MaKH, TenKH) có số lần mua hàng nhiều nhất.
-- in ra 1 khach hang co so lan mua hang nhieu nhat
select top 1 with ties tKhachHang.MaKH,tKhachHang.TenKH, count(SoHDB) as SoHoaDonMua 
from tKhachHang inner join tHoaDonBan on tKhachHang.MaKH = tHoaDonBan.MaKH
group by tKhachHang.MaKH,tKhachHang.TenKH order by count(SoHDB) desc

--35. Tháng mấy trong năm 2014, doanh số bán hàng cao nhất ?
select top(1) with ties Month(NgayBan) as Thang, 
			  sum(SLBan*(DonGiaBan  - DonGiaNhap)) as DoanhSo
from tHoaDonBan join tChiTietHDB  
				on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				join tSach 
				on tChiTietHDB.MaSach = tSach.MaSach
where Year(NgayBan) = 2014
group by Month(NgayBan)
order by DoanhSo desc

--36. Tìm sách có tổng số lượng bán ra thấp nhất trong năm 2014. _____
select top(1) with ties tChiTietHDB.MaSach, TenSach, 
			  sum(SLBan) as Soluong
from tSach left join tChiTietHDB on tChiTietHDB.MaSach = tSach.MaSach
		   join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
where year(NgayBan) = 2014
group by tChiTietHDB.MaSach, TenSach
order by Soluong asc


--37. Mỗi NXB, tìm sách (MaSach,TenSach) có giá bán cao nhất.
select TenNXB, S1.MaSach, TenSach, DonGiaBan
from tNhaXuatBan join tSach as S1 on tNhaXuatBan.MaNXB = S1.MaNXB
where DonGiaBan = (	select max(DonGiaBan)
					from tSach as S2
					where S2.MaNXB = tNhaXuatBan.MaNXB)


--38. Giảm giá sách 10% cho các sách của NXB Giáo Dục 
select tenSach, DonGiaBan
from tSach 
where MaNXB = 'NXB05'

UPDATE tSach
set DonGiaBan = DonGiaBan * 0.9
from tNhaXuatBan
where tNhaXuatBan.TenNXB = N'NXB Giáo Dục' and tNhaXuatBan.MaNXB = tSach.MaNXB
--39. Thêm trưởng tổng tiền cho bảng tHoaDonBan rồi cập nhật tổng tiền của hóa đơn cho trường này.
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

--40. Giảm 10% trên tổng hóa đơn cho các hóa đơn có trị giá trên 500.000 trong tháng 9/2014
update tHoaDonBan
set TongTien = TongTien*0.9
where TongTien > 500000 
      and year(NgayBan) = 2014 
      and month(NgayBan) = 9
--41. Tính tổng số lượng sách nhập trong năm 2014
select sum(SLNhap) as TongsSoLuongNhap from	tChiTietHDN 
inner join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN 
where year(tHoaDonNhap.NgayNhap) = '2014'

--42. Tính tổng số lượng sách bán trong năm 2014
select sum(SLBan) as TongsSoLuongBan from	tChiTietHDB 
inner join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB 
where year(tHoaDonBan.NgayBan) = '2014'

--43. Tính tổng tiền đã nhập trong năm 2014
select sum(tChiTietHDN.SLNhap*tSach.DonGiaNhap) as TongTienNhap2014 from tChiTietHDN 
inner join tSach on tChiTietHDN.MaSach = tSach.MaSach 
inner join tHoaDonNhap on tHoaDonNhap.SoHDN = tChiTietHDN.SoHDN
where year(tHoaDonNhap.NgayNhap) = '2014'
--44. Xóa những hóa đơn do nhân viên "Trần Huy" lập (lưu ý xóa chi tiết hóa đơn trước)
delete from tChiTietHDB
from tHoaDonBan, tNhanVien
where tNhanVien.MaNV = tHoaDonBan.MaNV 
and TenNV = N'Trần Huy' 
and tChiTietHDB.SoHDB = tHoaDonBan.SoHDB


--45. Đổi tên "NXB Thăng Long" thành "NXB Văn học
UPDATE tNhaXuatBan
SET TenNXB = N'NXB Văn Học'
WHERE tNhaXuatBan.MaNXB = 'NXB03';
select * from tNhaXuatBan


--46. Đưa ra thông tin toàn bộ sách, nếu sách được bán trong năm 2014 thì đưa ra SL bán
-- ca nam
select tSach.MaSach,tSach.TenSach,sum(SLBan) as SoLuongBan from tSach 
left join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
group by tSach.MaSach,tSach.TenSach

-- ma sach duoc ban trong nam 2014
select * from tSach full outer join (
	select distinct tChiTietHDB.MaSach, sum(tChiTietHDB.SLBan) as SoLuong from tChiTietHDB 
	inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
	where year(tHoaDonBan.NgayBan) = '2014'
	group by tChiTietHDB.MaSach
) as BangPhu on tSach.MaSach = BangPhu.MaSach




--create view cau4 as 
select tSach.MaSach,SLBan,SLNhap,abs(SLBan - SLNhap) from tSach inner join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
								inner join tHoaDonBan on tChiTietHDB.SoHDB = tHoaDonBan.SoHDB
								inner join tChiTietHDN on tSach.MaSach = tChiTietHDN.MaSach
								inner join tHoaDonNhap on tChiTietHDN.SoHDN = tHoaDonNhap.SoHDN
where year(tHoaDonNhap.NgayNhap) = '2014' and year(tHoaDonBan.NgayBan) = '2014'
select tChiTietHDB.MaSach,tChiTietHDB.SLBan	from tChiTietHDB 			


select tSach.MaSach,tHoaDonBan.NgayBan,sum(isnull(tChiTietHDB.SLBan,0) * tSach.DonGiaBan ) as DoanhTu from tChiTietHDB 
	full outer join tSach on tChiTietHDB.MaSach = tSach.MaSach
	inner join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
	group by tSach.MaSach, rollup(tHoaDonBan.NgayBan) 
	