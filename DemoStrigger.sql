use BT1CSDL

create trigger ThanhTien on [dbo].[tChiTietHDB]
for insert, update as
begin
	declare @sohdb nvarchar(10), @dongia money, @thanhtien money, @masach nvarchar(10)
	select @sohdb = sohdb, @masach = masach from inserted
	select @dongia = dongiaban from tSach where MaSach = @masach
	update tChiTietHDB set ThanhTien = SLBan*@dongia where SoHDB = @sohdb and MaSach = @masach
end

alter table tChiTietHDB add ThanhTien money
alter table tChiTietHDB add DonGia money


select * from tChiTietHDB

create trigger DonGia on [dbo].[tChiTietHDB]
for insert, update as
begin
	declare @sohdb nvarchar(10), @dongia money, @thanhtien money, @masach nvarchar(10)
	select @sohdb = sohdb, @masach = masach from inserted
	select @dongia = dongiaban from tSach where MaSach = @masach
	update tChiTietHDB set ThanhTien = SLBan*@dongia where SoHDB = @sohdb and MaSach = @masach
	update tChiTietHDB set DonGia = @dongia where SoHDB = @sohdb and MaSach = @masach
	--update tChiTietHDB set ThanhTien = SLBan*@dongia where SoHDB = @sohdb and MaSach = @masach
end

drop trigger DonGia

create trigger ThanhTien on [dbo].[tChiTietHDB]
for insert, update as
begin
	update tChiTietHDB set ThanhTien = inserted.SLBan * DonGiaBan
	from inserted join tSach on inserted.MaSach = tSach.MaSach
	join tChiTietHDB on inserted.SoHDB = tChiTietHDB.SoHDB and
	inserted.MaSach = tChiTietHDB.MaSach
end

drop trigger ThanhTien
insert into tChiTietHDB(SoHDB,MaSach,SLBan) values ('HDB01','S09',10),('HDB01','S10',10),('HDB01','S11',10)

create trigger ThanhTien on [dbo].[tChiTietHDB]
for insert, update as
begin
	update tChiTietHDB set ThanhTien = inserted.SLBan * DonGiaBan
	from inserted join tSach on inserted.MaSach = tSach.MaSach
	join tChiTietHDB on inserted.SoHDB = tChiTietHDB.SoHDB and
	inserted.MaSach = tChiTietHDB.MaSach
end

alter table tKhachHang add slHoaDon int
--cau3 Thêm trường số lượng hóa đơn vào bảng khách hàng và tự động cập nhật cho trường này mỗi khi thêm hóa đơn
create trigger TongHoaDon on [dbo].[tHoaDonBan]
for insert, update as
begin
	declare @sohdb nvarchar(10), @tonghdb int, @mak nvarchar(10)
	select @mak = MaKh from inserted
	update tKhachHang set slHoaDon = ISNULL(slHoaDon,0) + 1 where @mak = MaKH
end

--cau4: Thêm trường số lượng hóa đơn vào bảng khách hàng và cập nhật tự động cho trường này mỗi khi thêm, sửa, xóa hóa đơn
alter table tKhachHang add SoLuong int
create trigger cau4 on [dbo].[tHoaDonBan]
for insert, update,delete as
begin
	declare @MaKH1 nvarchar(10), @MaKH2 nvarchar(10), @in int,@de int
	select @MaKH1 = MaKH, @in = 1 from inserted
	select @MaKH2 = MaKH, @de = 1 from deleted
	update tKhachHang set SoLuong = ISNULL(SoLuong,0) + ISNULL(@in,0) where MaKH = @MaKH1
	update tKhachHang set SoLuong = ISNULL(SoLuong,0) - ISNULL(@in,0) where MaKH = @MaKH2
end
alter table tHoaDonBan add TongTien int
alter table tHoaDonBan drop TongTien
select * from tHoaDonBan

--cau4
create trigger Cau4trigger on thoadonban
for insert, update, delete
as begin
	declare @MaKH1 nvarchar(10), @MaKH2 nvarchar(10), @in int, @de int
	select @MaKH1=MaKH, @in = 1 from inserted
	select @MaKH2=MaKH, @de = 1 from deleted
	update tKhachHang set SoLuong=isnull(soluong,0)+isnull(@in,0) where MaKH=@MaKH1
	update tKhachHang set SoLuong=isnull(soluong,0)-isnull(@de,0) where MaKH= @MaKH2
end

select * from tKhachHang where MaKH='KH01'
insert into tHoaDonBan values('HDB34','NV06','2014-05-10','KH01',NULL,NULL)
select * from tKhachHang where MaKH='KH01'
update tHoaDonBan set MaNV='NV06' where SoHDB='HDB34'
select * from tKhachHang where MaKH='KH01'
update tHoaDonBan set MaKH='KH02' where SoHDB='HDB34'
select * from tKhachHang where MaKH='KH01'
select * from tKhachHang where MaKH='KH02'

select * from tKhachHang where MaKH='KH02'
delete from tHoaDonBan where SoHDB='HDB34'
select * from tKhachHang where MaKH='KH02'

select * from tHoaDonBan where SoHDB='HDB34'

-- cau 5
create trigger Cau5trigger on tChiTietHDB
for insert--, update, delete
as begin
	update tHoaDonBan set SoSP=isnull(soSP,0)+ SLB
	from (select SoHDB, sum(SLBan) as SLB from inserted group by inserted.SoHDB) A
	where tHoaDonBan.SoHDB=A.SoHDB

	update tHoaDonBan set SoSP=isnull(soSP,0)- SLB
	from (select SoHDB, sum(SLBan) as SLB from deleted group by deleted.SoHDB) A
	where tHoaDonBan.SoHDB=A.SoHDB
end

select * from tChiTietHDB where SoHDB='HDB01'
delete from tChiTietHDB where SoHDB='HDB01' and MaSach like 'S1%'

--5. Thêm trường số sản phẩm vào bảng hóa đơn bán, cập nhật tự động cho trường này mỗi khi thêm, xóa, sửa chi tiết hóa đơn

create trigger Cau5trigger on tChiTietHDB
for insert, update, delete
as begin
	declare @sohdb1 nvarchar(10), @sohdb2 nvarchar(10), @in int, @de int
	select @sohdb1= SoHDB, @in = SLBan from inserted
	select @sohdb2= SoHDB, @de =SLBan from deleted
	update tHoaDonBan set SoSP=isnull(soSP,0)+isnull(@in,0) -isnull(@de,0) where SoHDB = isnull(@sohdb1, @sohdb2)
end

select * from tHoaDonBan
select * from tChiTietHDB 

select * from tHoaDonBan where SoHDB = 'HDB03' 
insert into tChiTietHDB
values ('HDB03','S01',10,NULL,108000.00,NULL,NULL)
select * from tHoaDonBan where SoHDB = 'HDB03' 

delete from tChiTietHDB where SoHDB = 'HDB03' and MaSach = 'S01'
select * from tHoaDonBan where SoHDB = 'HDB03' 

update tChiTietHDB set SLBan = 20 where SoHDB = 'HDB03' and MaSach = 'S01' 
select * from tHoaDonBan where SoHDB = 'HDB03' 

--cách 2 cho insert, delete nhiều dòng
go
alter trigger Cau5trigger on tChiTietHDB
for insert--, update, delete
as begin
	update tHoaDonBan set SoSP=isnull(soSP,0)+ SLB
	from (select SoHDB, sum(SLBan) as SLB from inserted group by inserted.SoHDB) A
	where tHoaDonBan.SoHDB=A.SoHDB

	update tHoaDonBan set SoSP=isnull(soSP,0)- SLB
	from (select SoHDB, sum(SLBan) as SLB from deleted group by deleted.SoHDB) A
	where tHoaDonBan.SoHDB=A.SoHDB
end
select * from tChiTietHDB where SoHDB='HDB01'
delete from tChiTietHDB where SoHDB='HDB01' and MaSach like 'S1%'

insert into tChiTietHDB(SoHDB, MaSach, SLBan) values ('HDB01', 'S16',10),('HDB01', 'S17',10),('HDB01', 'S18',10)
select * from tHoaDonBan where SoHDB = 'HDB01' 
select * from tHoaDonBan where SoHDB = 'HDB02'



-- cau 7
create trigger TongBan on [dbo].[tChiTietHDB]
for insert,update,delete as
begin
	
end

create trigger cau7Ban on [dbo].[tChiTietHDB]
for insert,update,delete as
begin
	declare @MaSach nvarchar(10),@tongslban int, @slBan int,@slbancu int
	select @MaSach = MaSach,@slBan = SLBan from inserted
	select @MaSach = MaSach,@slbancu = SLBan from deleted
	select @tongslban = TongSLBan from tSach where @MaSach = MaSach
	update tSach set SoLuong = SoLuong - TongSLBan where MaSach = @MaSach
	update tSach set TongSLBan = TongSLBan - @slbancu where @MaSach = MaSach
	update tSach set TongSLBan = TongSLBan + @slban where @MaSach = MaSach
	update tSach set SoLuong = SoLuong + TongSLBan where MaSach = @MaSach
end

create trigger cau7Nhap on [dbo].[tChiTietHDN]
for insert,update,delete as
begin
	declare @MaSach nvarchar(10),@slNhap int,@sltonkho int,@slnhapcu int
	select @MaSach = MaSach,@slNhap = SLNhap  from inserted
	select @MaSach = MaSach,@slnhapcu = SLNhap from deleted
	select @sltonkho = SoLuong from tSach where @MaSach = MaSach;
	update tSach set SoLuong = @sltonkho - ISNULL(@slnhapcu,0) where MaSach = @MaSach
end

select * from tChiTietHDB where MaSach = N'S01'
select * from tChiTietHDN

drop trigger cau7Ban
drop trigger cau7Nhap

update tChiTietHDB set SLBan = 20 where MaSach = N'S01'
select * from tSach
select * from tChiTietHDB where MaSach = N'S01'
select * from tChiTietHDN where MaSach = N'S01'
update tChiTietHDN set SLNhap = 80 where MaSach = N'S01'

alter table tSach add TongSLBan int
update tSach set TongSLBan = (select sum(SLban) from tChiTietHDB where MaSach = N'S01') where MaSach = N'S01'
update tSach set SoLuong = 50 where MaSach = N'S01'
update tSach set SoLuong = 50 where MaSach = N'S02'

drop trigger ThanhTien