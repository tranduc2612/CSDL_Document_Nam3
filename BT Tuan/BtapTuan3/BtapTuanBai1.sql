USE [BT2]
-- Bai 1 Tuan 3

-- cau 1: Tạo View danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng
create view DSSV as 
select MaSV,HoSV,TenSV,HocBong from DSSinhVien

-- cau 2:Tạo view Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
create view DSSVHBtren150000 as
select MaKhoa,HoSV,TenSV,NoiSinh,HocBong from DSSinhVien where HocBong >= 150000

-- cau 3:Tạo view liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.

create view DDSVKhoaAnhVan as
select DSSinhVien.MaSV,DSSinhVien.HoSV,DSSinhVien.TenSV,DMKhoa.TenKhoa,DSSinhVien.Phai
from DMKhoa inner join DSSinhVien on DMKhoa.MaKhoa = DSSinhVien.MaKhoa
where DMKhoa.MaKhoa = N'AV'

-- cau 4: Tạo view gồm những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
create view DDSVTuoi20den25 as
select DMKhoa.MaKhoa,DMKhoa.TenKhoa,(YEAR(getdate()) - YEAR(DSSinhVien.NgaySinh)) as tuoi
from DMKhoa inner join DSSinhVien on DMKhoa.MaKhoa = DSSinhVien.MaKhoa
where (YEAR(getdate()) - YEAR(DSSinhVien.NgaySinh)) BETWEEN 20 AND 25;

-- cau 5: Tạo view cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
create view MucHocBong_View as
select MaSV, Phai, DSSinhVien.MaKhoa, MucHocBong = case when
												HocBong > 500000 then N'Hoc bong cao'
												else N'Muc trung binh' end
from DSSinhVien
join DMKhoa on DMKhoa.MaKhoa = DSSinhVien.MaKhoa

select * from MucHocBong_View

-- cau 6: Tạo view đưa ra thông tin những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn
create view MucHocBongLonHonAnhVan as
select * from DSSinhVien where HocBong > (
select Max(DSSinhVien.HocBong) from DSSinhVien inner join DMKhoa on DSSinhVien.MaKhoa = DMKhoa.MaKhoa
where DMKhoa.MaKhoa = N'AV' group by DMKhoa.MaKhoa)

-- cau 7: Tạo view đưa ra thông tin những sinh viên đạt điểm cao nhất trong từng môn
create view DiemCaoNhatTungMon as
select MaSV,BangPhu.MaMH,TenMH,Diem from DMMonHoc 
inner join KetQua on DMMonHoc.MaMH = KetQua.MaMH 
inner join (select MaMH,Max(Diem) as diemcao from KetQua group by MaMH) 
as BangPhu on BangPhu.MaMH = DMMonHoc.MaMH
where diemcao = Diem and BangPhu.MaMH = KetQua.MaMH


-- cau 8: Tạo view đưa ra những sinh viên chưa thi môn cơ sở dữ liệu.
create view cau8 as
select * from DSSinhVien where MaSV not in (select distinct MaSV from KetQua where MaMH = N'01')

select * from cau8

-- cau 9: Tạo view danh sách sinh viên không bi rớt môn nào
create view cau9 as
select * from DSSinhVien
where MaSV not in (select distinct MaSV from KetQua
					group by MaSV, MaMH
					having max(Diem) < 4.0)