
USE [QLBanSach]
GO
/****** Object:  Table [dbo].[tChiTietHDB]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDB](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaSach] [nvarchar](10) NOT NULL,
	[SLBan] [int] NULL,
	[KhuyenMai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tChiTietHDB] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tChiTietHDN]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tChiTietHDN](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaSach] [nvarchar](10) NOT NULL,
	[SLNhap] [int] NULL,
	[KhuyenMai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tChiTietHDN] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonBan]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonBan](
	[SoHDB] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[NgayBan] [datetime] NULL,
	[MaKH] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tHoaDonNhap]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tHoaDonNhap](
	[SoHDN] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](10) NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [nvarchar](10) NULL,
 CONSTRAINT [PK_tHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tKhachHang]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tKhachHang](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[GioiTinh] [bit] NULL,
 CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaCungCap]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaCungCap](
	[MaNCC] [nvarchar](10) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
 CONSTRAINT [PK_tNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhanVien]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNV] [nvarchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [nvarchar](15) NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhaXuatBan]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhaXuatBan](
	[MaNXB] [nvarchar](10) NOT NULL,
	[TenNXB] [nvarchar](100) NULL,
 CONSTRAINT [PK_tNhaXuatBan] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tSach]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSach](
	[MaSach] [nvarchar](10) NOT NULL,
	[TenSach] [nvarchar](200) NULL,
	[TacGia] [nvarchar](150) NULL,
	[MaTheLoai] [nvarchar](10) NULL,
	[MaNXB] [nvarchar](10) NULL,
	[DonGiaNhap] [money] NULL,
	[DonGiaBan] [money] NULL,
	[SoLuong] [int] NULL,
	[SoTrang] [int] NULL,
	[TrongLuong] [nvarchar](50) NULL,
	[Anh] [image] NULL,
 CONSTRAINT [PK_tSach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTheLoai]    Script Date: 11/10/2021 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTheLoai](
	[MaTheLoai] [nvarchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_tTheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S01', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S02', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB01', N'S04', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'S04', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB02', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S06', 7, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB03', N'S08', 11, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S03', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB04', N'S10', 9, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S07', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB05', N'S08', 14, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S02', 13, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S05', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S10', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB06', N'S11', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S01', 10, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S06', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB07', N'S08', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S01', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S06', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB08', N'S07', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S06', 1, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB09', N'S09', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S07', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S11', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB10', N'S13', 6, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S04', 2, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S08', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB11', N'S11', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S05', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S09', 4, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB12', N'S12', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S02', 3, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S03', 5, NULL)
INSERT [dbo].[tChiTietHDB] ([SoHDB], [MaSach], [SLBan], [KhuyenMai]) VALUES (N'HDB13', N'S04', 2, NULL)
GO
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaSach], [SLNhap], [KhuyenMai]) VALUES (N'HDN01', N'S01', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaSach], [SLNhap], [KhuyenMai]) VALUES (N'HDN02', N'S06', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaSach], [SLNhap], [KhuyenMai]) VALUES (N'HDN03', N'S03', 20, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaSach], [SLNhap], [KhuyenMai]) VALUES (N'HDN04', N'S09', 10, NULL)
INSERT [dbo].[tChiTietHDN] ([SoHDN], [MaSach], [SLNhap], [KhuyenMai]) VALUES (N'HDN05', N'S06', 15, NULL)
GO
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB01', N'NV01', CAST(N'2014-08-11T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB02', N'NV02', CAST(N'2014-05-03T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB03', N'NV03', CAST(N'2013-12-01T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB04', N'NV04', CAST(N'2013-11-12T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB05', N'NV04', CAST(N'2014-05-14T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB06', N'NV05', CAST(N'2014-06-30T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB07', N'NV06', CAST(N'2014-05-10T00:00:00.000' AS DateTime), N'KH01')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB08', N'NV01', CAST(N'2013-01-01T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB09', N'NV01', CAST(N'2013-02-10T00:00:00.000' AS DateTime), N'KH02')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB10', N'NV02', CAST(N'2014-04-10T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB11', N'NV03', CAST(N'2014-03-11T00:00:00.000' AS DateTime), N'KH04')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB12', N'NV03', CAST(N'2014-07-10T00:00:00.000' AS DateTime), N'KH03')
INSERT [dbo].[tHoaDonBan] ([SoHDB], [MaNV], [NgayBan], [MaKH]) VALUES (N'HDB13', N'NV05', CAST(N'2014-04-12T00:00:00.000' AS DateTime), N'KH04')
GO
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN01', N'NV02', CAST(N'2014-04-13T00:00:00.000' AS DateTime), N'NCC01')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN02', N'NV01', CAST(N'2014-06-28T00:00:00.000' AS DateTime), N'NCC03')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN03', N'NV04', CAST(N'2014-01-01T00:00:00.000' AS DateTime), N'NCC06')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN04', N'NV05', CAST(N'2014-03-05T00:00:00.000' AS DateTime), N'NCC04')
INSERT [dbo].[tHoaDonNhap] ([SoHDN], [MaNV], [NgayNhap], [MaNCC]) VALUES (N'HDN05', N'NV03', CAST(N'2014-04-10T00:00:00.000' AS DateTime), N'NCC05')
GO
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH01', N'Nguyễn Đình Sơn', N'Bắc Ninh', N'0968686868', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH02', N'Đỗ Văn Bắc', N'Hải Dương', N'0905883993', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH03', N'Mạnh Thường Quân', N'Hải Phòng', N'0918688685', 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH04', N'Mai Phương Lan', N'Hà Nội', N'0978656790', 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH05', N'Nguyễn Thị Phương', N'Hà Nội', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH06', N'Trần Đăng Hưng', N'Ninh Bình', NULL, 1)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH07', N'Hoàng Thị Hồng', N'Thái Nguyên', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'KH08', N'Cẩm Thị Hương', N'TP HCM', NULL, 0)
INSERT [dbo].[tKhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [GioiTinh]) VALUES (N'Kh09', N'Mai Văn Hùng', N'Phú Thọ', NULL, 1)
GO
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC01', N'Bách Việt')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC02', N'NXB Trẻ')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC03', N'Phú Hà book')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC04', N'Alphabooks')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC05', N'TGM Books')
INSERT [dbo].[tNhaCungCap] ([MaNCC], [TenNCC]) VALUES (N'NCC06', N'Thái Hà')
GO
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV01', N'Trần Huy', N'Nam', CAST(N'1990-09-11T00:00:00.000' AS DateTime), N'Hà Nội', N'0986868686')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV02', N'Thanh Tâm', N'Nữ', CAST(N'1986-01-12T00:00:00.000' AS DateTime), N'Bắc Ninh', N'0979657676')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV03', N'Nguyễn Minh', N'Nam', CAST(N'1989-07-05T00:00:00.000' AS DateTime), N'Hải Dương', N'0968145689')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV04', N'Phan Cao', N'Nam', CAST(N'1991-08-12T00:00:00.000' AS DateTime), N'Ninh Bình', N'0985143235')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV05', N'Bùi Ngọc', N'Nữ', CAST(N'1987-03-01T00:00:00.000' AS DateTime), N'Thái Bình', N'0918167892')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV06', N'Nguyễn Hoàng', N'Nam', CAST(N'1990-04-04T00:00:00.000' AS DateTime), N'Nam Định', N'0962091660')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV07', N'Nguyễn Hải', N'Nam', CAST(N'1994-05-05T00:00:00.000' AS DateTime), N'Hà Nội', N'0962091666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV08', N'Đỗ Thảo', N'Nữ', CAST(N'1990-06-06T00:00:00.000' AS DateTime), N'Hà Nội', N'0962099666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV09', N'Đỗ Thảo Phương', N'Nữ', CAST(N'1990-07-07T00:00:00.000' AS DateTime), N'Hà Nội', N'0966666666')
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai]) VALUES (N'NV10', N'Đỗ Huy Long', N'Nam', CAST(N'1995-08-08T00:00:00.000' AS DateTime), N'Nam Định', N'0983646585')
GO
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB01', N'NXB Kim Đồng')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB02', N'NXB Trẻ')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB03', N'NXB Thăng Long')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB04', N'NXB Nhã Nam')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB05', N'NXB Giáo Dục')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB06', N'NXB Fahasa')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB07', N'NXB Phương Nam')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB08', N'NXB ĐH GTVT')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB09', N'NXB ĐH QGHN')
INSERT [dbo].[tNhaXuatBan] ([MaNXB], [TenNXB]) VALUES (N'NXB10', N'NXB Thủ Đô')
GO
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S01', N'Sống và khát vọng', N'Trần Đăng Khoa', N'TL01', N'NXB01', 100000.0000, 108000.0000, 120, 365, N'638 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S02', N'Cha Nên Dạy Con Như Thế Nào?', N'Vương Ba, Vương Trí Diễm', N'TL01', N'NXB04', 60000.0000, 69000.0000, 70, 264, N'440 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S03', N'Trốn chạy và yêu thương', N'Maya banks', N'TL06', N'NXB02', 105000.0000, 115000.0000, 45, 508, N'450 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S04', N'Anh sẽ yêu em mãi chứ', N'Gào', N'TL06', N'NXB05', 65000.0000, 89000.0000, 78, 320, N'374 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S05', N'Thế giới phẳng ( Tái bản năm 2014)', N'Thomas L.Friedman', N'TL05', N'NXB03', 245000.0000, 272000.0000, 56, 818, N'902 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S06', N'Giáo trình C++ & lập trình hướng đối tượng', N'GS. Phạm Văn Ất', N'TL05', N'NXB06', 64000.0000, 78000.0000, 89, 496, N'650 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S07', N'Manchester United - Thiên sử về quỷ đỏ', N'Jim White', N'TL03', N'NXB07', 135000.0000, 149000.0000, 68, 639, N'720 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S08', N'Cát bụi thời gian', N'Sidney Sheldon', N'TL04', N'NXB05', 80000.0000, 92000.0000, 45, 482, N'500 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S09', N'Tự học bảo mật và quản trị mạng', N'Mai Hương', N'TL02', N'NXB08', 41000.0000, 48000.0000, 79, 344, N'480 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S10', N'Triệu phú khởi nghiệp từ hai bàn tay trắng', N'Triệu Phàm Vũ', N'TL05', N'NXB09', 115000.0000, 130000.0000, 43, 452, N'506 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S11', N'Cấu trúc dữ liệu và giải thuật', N'Hồ Đắc Phương', N'TL02', N'NXB10', 110000.0000, 150000.0000, 80, 300, N'500 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S12', N'Lập Trình C', N'Phạm Văn Ất', N'TL02', N'NXB10', 100000.0000, 130000.0000, 80, 440, N'400 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S13', N'Không ai qua sông', N'Lữ Ngọc Tư', N'TL01', N'NXB10', 100000.0000, 140000.0000, 80, 330, N'330 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S14', N'Đón đầu xu hướng', N'Rohit Bhargava', N'TL01', N'NXB10', 200000.0000, 250000.0000, 60, 220, N'200 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S15', N'Để con được ốm', N'Nguyễn Thị Đoan', N'TL01', N'NXB10', 200000.0000, 300000.0000, 40, 400, N'500 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S16', N'Búc xúc làm ta vô cảm', N'Đặng Hoàng Giang', N'TL01', N'NXB10', 200000.0000, 300000.0000, 50, 400, N'300 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S17', N'Tony buổi sáng - trên đường băng', N'Tony Buổi Sáng', N'TL01', N'NXB09', 250000.0000, 300000.0000, 30, 300, N'400 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S18', N'Đừng bao giờ đi ăn một mình', N'Keith Ferrazzi', N'TL01', N'NXB09', 300000.0000, 400000.0000, 60, 555, N'500 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S19', N'Ngày xưa có một con bò', N'Camilo Cruz', N'TL01', N'NXB09', 300000.0000, 450000.0000, 60, 400, N'400 gram', NULL)
INSERT [dbo].[tSach] ([MaSach], [TenSach], [TacGia], [MaTheLoai], [MaNXB], [DonGiaNhap], [DonGiaBan], [SoLuong], [SoTrang], [TrongLuong], [Anh]) VALUES (N'S20', N'Tôi thấy hoa vàng trên cỏ xanh', N'Nguyễn nhật ánh', N'TL01', N'NXB09', 300000.0000, 400000.0000, 80, 550, N'300 gram', NULL)
GO
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL01', N'Bí quyết Cuộc sống')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL02', N'Sách Tin học')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL03', N'Thể Thao, Du lịch')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL04', N'Văn hóa, Nghệ thuật')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL05', N'Sách Kinh doanh')
INSERT [dbo].[tTheLoai] ([MaTheLoai], [TenTheLoai]) VALUES (N'TL06', N'Sách Khuyến mại, Sách mới phát hành')
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tHoaDonBan] FOREIGN KEY([SoHDB])
REFERENCES [dbo].[tHoaDonBan] ([SoHDB])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tHoaDonBan]
GO
ALTER TABLE [dbo].[tChiTietHDB]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDB_tSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tSach] ([MaSach])
GO
ALTER TABLE [dbo].[tChiTietHDB] CHECK CONSTRAINT [FK_tChiTietHDB_tSach]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap] FOREIGN KEY([SoHDN])
REFERENCES [dbo].[tHoaDonNhap] ([SoHDN])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tHoaDonNhap]
GO
ALTER TABLE [dbo].[tChiTietHDN]  WITH CHECK ADD  CONSTRAINT [FK_tChiTietHDN_tSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[tSach] ([MaSach])
GO
ALTER TABLE [dbo].[tChiTietHDN] CHECK CONSTRAINT [FK_tChiTietHDN_tSach]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tKhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tKhachHang]
GO
ALTER TABLE [dbo].[tHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonBan_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonBan] CHECK CONSTRAINT [FK_tHoaDonBan_tNhanVien]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tNhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhaCungCap]
GO
ALTER TABLE [dbo].[tHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tHoaDonNhap_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tHoaDonNhap] CHECK CONSTRAINT [FK_tHoaDonNhap_tNhanVien]
GO
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tNhaXuatBan] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[tNhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tNhaXuatBan]
GO
ALTER TABLE [dbo].[tSach]  WITH CHECK ADD  CONSTRAINT [FK_tSach_tTheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[tTheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[tSach] CHECK CONSTRAINT [FK_tSach_tTheLoai]
GO

create view cau1 as
select * from tHoaDonBan
select * from tChiTietHDB
select * from tSach

-- cau1
select year(NgayBan) as nam, MONTH(NgayBan) as thang, NgayBan, sum(DonGiaBan * SLBan) as TongTien
from tChiTietHDB join tSach on tChiTietHDB.MaSach = tSach.MaSach
				 join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB
				  where YEAR(NgayBan) = N'2014'and MONTH(NgayBan) = N'4'
group by Rollup(Month(NgayBan), NgayBan)

-- cau2
create procedure cau2 @thang char(5),@sotien int output,@slHoaDon int output as
begin
	select @slHoaDon = count(SoHDB) from tHoaDonBan where MONTH(NgayBan) = @thang
	select @sotien = sum(SLBan*DonGiaBan) from tSach join tChiTietHDB on tSach.MaSach = tChiTietHDB.MaSach 
	join tHoaDonBan on tHoaDonBan.SoHDB = tChiTietHDB.SoHDB where MONTH(NgayBan) = @slHoaDon
end

declare @tongtien int,@slhoadon int
exec cau2 N'5',@tongtien output,@slhoadon output
print @tongtien
print @slhoadon

create view cau4 as
select top 1 with ties tNhanVien.MaNV,tNhanVien.TenNV,count(SoHDB)+count(SoHDN) as TongHoaDonNhapVaBan from tNhanVien full outer join tHoaDonBan
on tNhanVien.MaNV = tHoaDonBan.MaNV 
full outer join tHoaDonNhap on tHoaDonNhap.MaNV = tNhanVien.MaNV
group by tNhanVien.MaNV,tNhanVien.TenNV
order by TongHoaDonNhapVaBan desc
