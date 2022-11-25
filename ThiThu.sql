use QLBanSach

create view cau1thi as
select distinct tSach.MaSach,tSach.TenSach,sum(SLBan) from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach
join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
where MONTH(NgayBan) = '5' and YEAR(NgayBan) = '2014'
group by tSach.MaSach,tSach.TenSach
