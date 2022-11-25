USE [QLNhanVien]
GO

-- Bai 2
select * from tChiTietNhanVien
select * from tNhanVien
select * from tPhongBan

--1. Tạo hàm với đầu vào là năm, đầu ra là danh sách nhân viên sinh vào năm đó
create function cau1(@nam nvarchar(5))
returns Table
as 
	return (
		select * from tNhanVien where @nam = YEAR(NTNS)
	)
select * from cau1(N'1965')	
--2. Tạo hàm với đầu vào là số thâm niên đầu ra là danh sách nhân viên có thâm niên đó
create function cau2(@thamnien int)
returns Table
as 
	return (
		select * from tNhanVien where DATEDIFF(MONTH, NgayBD, GETDATE())/12 = @thamnien
	)
select * from cau2(32)	
--3. Tạo hàm đầu vào là chức vụ đầu ra là những nhân viên cùng chức vụ đó
create function cau3(@chucvu nvarchar(5))
returns table
 as return (
	select dbo.tNhanVien.*
	from tNhanVien join tChiTietNhanVien on tNhanVien.MaNV = tChiTietNhanVien.MaNV
	where tChiTietNhanVien.ChucVu = @chucvu
 )
 select * from cau3(N'NV')
--4. Tạo hàm đưa ra thông tin về nhân viên được tăng lương của ngày hôm nay (giả sử 3 năm lên lương 1 lần)
create function cau4() 
returns table
as return (
	SELECT dbo.tNhanVien.*
	FROM dbo.tNhanVien JOIN dbo.tChiTietNhanVien ON dbo.tNhanVien.MaNV = dbo.tChiTietNhanVien.MaNV
	WHERE DAY(NgayBD) = DAY(GETDATE()) AND (DATEDIFF(MONTH, NgayBD, GETDATE())/12 % 3) = 0
)
SELECT * FROM dbo.Cau4()
--5. Tạo Hàm có đầu vào là tháng, năm đầu ra là bảng lương của nhân viên theo tháng, năm đó gồm các thông tin sau:
ALTER FUNCTION Cau5() RETURNS TABLE
AS
RETURN
(
	SELECT tTMP.MaNV, tTMP.HO_TEN, tTMP.LUONG, BHXH = 0.08*tTMP.LUONG, BHYT = 0.015*tTMP.LUONG, BHTN = 0.01*tTMP.LUONG,
	THUC_LINH = 0.895*tTMP.LUONG -
	CASE 
		WHEN 0 < tTMP.TN AND tTMP.TN <= 5000000 THEN TN*0.05
		WHEN 5000000 < tTMP.TN AND tTMP.TN <= 10000000 THEN tTMP.TN*0.1 - 250000
		WHEN 10000000 < tTMP.TN AND tTMP.TN <= 18000000 THEN tTMP.TN*0.15 - 750000
		WHEN 18000000 < tTMP.TN AND tTMP.TN <= 32000000 THEN tTMP.TN*0.2 - 1650000
		WHEN 32000000 < tTMP.TN AND tTMP.TN <= 52000000 THEN tTMP.TN*0.25 - 3250000
		WHEN 52000000 < tTMP.TN AND tTMP.TN <= 80000000 THEN tTMP.TN*0.3 - 5850000
		WHEN tTMP.TN > 80000000 THEN tTMP.TN*0.35 - 9850000 ELSE 0
	END
	FROM
		(SELECT tChiTietNhanVien.MaNV,
		HO_TEN = HO + ' ' + TEN,
		LUONG = HSLuong*1490000 + CASE SUBSTRING(MucDoCV, 1, 1) WHEN 'A' THEN 10000000 WHEN 'B' THEN 8000000 WHEN 'C' THEN 5000000 END,
		TN = 0.895*(HSLuong*1490000 + CASE SUBSTRING(MucDoCV, 1, 1) WHEN 'A' THEN 10000000 WHEN 'B' THEN 8000000 WHEN 'C' THEN 5000000 END) - 11000000 - ISNULL(GTGC, 0)*4400000
		FROM dbo.tNhanVien JOIN dbo.tChiTietNhanVien ON dbo.tNhanVien.MaNV = dbo.tChiTietNhanVien.MaNV) AS tTMP
)

-- cau 6 Tạo thủ tục có đầu vào là mã phòng, đầu ra là số nhân viên của phòng đó và tên trưởng phòng
create procedure cau6 @maphong nvarchar(5),@slNV int output,@tenTP nvarchar(30) output
as
begin
	declare @MaTP nvarchar(225)
	select @slNV = count(*) from tPhongBan join tNhanVien on tPhongBan.MaPB = tNhanVien.MaPB where tPhongBan.MaPB = @maphong
	select @MaTP = TruongPhong from tPhongBan join tNhanVien on tPhongBan.MaPB = tNhanVien.MaPB where tPhongBan.MaPB = @maphong
	select @tenTP = TEN from tNhanVien where MaNV = @MaTP
	
	--cach 2
	SELECT @slNV = COUNT(*), @tenTP = (SELECT HO + ' ' + TEN FROM dbo.tNhanVien WHERE MaNV = TruongPhong)
	FROM dbo.tNhanVien JOIN dbo.tPhongBan ON dbo.tNhanVien.MaPB = dbo.tPhongBan.MaPB
	WHERE tPhongBan.MaPB = @maphong
	GROUP BY TruongPhong
end
drop procedure cau6
declare @sl int,@tentruongphong nvarchar(30)
exec cau6 N'KT',@sl output,@tentruongphong output
print @sl
print @tentruongphong


-- cau 7 Tạo thủ tục có đầu vào là mã phòng, tháng, năm, đầu ra là số tiền lương của phòng đó
create procedure cau7 @maphong nvarchar(5),@thang int,@nam int,@tienluong int output
as
begin
	SELECT @SO_TIEN_LUONG = SUM(1490000*HSLuong + (CASE SUBSTRING(MucDoCV, 1, 1) WHEN 'A' THEN 10000000 WHEN 'B' THEN 8000000 WHEN 'C' THEN 5000000 END))
	FROM dbo.tNhanVien JOIN dbo.tChiTietNhanVien ON dbo.tNhanVien.MaNV = dbo.tChiTietNhanVien.MaNV
	WHERE MaPB = @MA_PHONG 
end
