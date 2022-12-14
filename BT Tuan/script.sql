GO
/****** Object:  Table [dbo].[FunctionTest]    Script Date: 9/29/2022 4:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE [dbo].[FunctionTest](
	[MAHS] [nvarchar](8) NOT NULL,
	[HO] [nvarchar](15) NULL,
	[TEN] [nvarchar](7) NULL,
	[NU] [bit] NOT NULL,
	[NGAYSINH] [datetime] NULL,
	[MALOP] [nvarchar](4) NULL,
	[GHICHU] [nvarchar](50) NULL,
	[XEPLOAI] [nvarchar](50) NULL,
	[dtbc] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00001', N'Nguyen Van', N'Nam', 0, CAST(N'1974-04-06T00:00:00.000' AS DateTime), N'10A2', N'Chuy?n tru?ng t? ngàyNov  6 202', N'luu ban', 3,67)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00013', N'Nguyen Minh', N'Quang', 0, CAST(N'1975-07-12T00:00:00.000' AS DateTime), N'10A2', N'chuyển trường từ ngày Oct 26 202', NULL, 7,17)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00014', N'Trang Phi', N'Hùng', 0, CAST(N'1975-11-04T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 3,58)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00053', N'Luong Khai', N'Truyen', 0, CAST(N'1974-12-12T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 10)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00054', N'Do Van', N'Thanh', 0, CAST(N'1974-11-10T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 4,5)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00059', N'Nguyen Thanh', N'Thu', 0, CAST(N'1975-05-11T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00060', N'Nguyen Truong', N'Son', 0, CAST(N'1975-08-07T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 3,58)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00445', N'Lai Van', N'Teo', 0, CAST(N'1974-01-27T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,33)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00446', N'Dinh Thi', N'Hai', 1, CAST(N'1974-12-21T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,92)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00451', N'Huynh My', N'Le', 1, CAST(N'1975-02-24T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 5,25)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00452', N'Pham Van', N'Tuan', 0, CAST(N'1975-08-22T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,75)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00457', N'Nguyen Chi', N'Cong', 0, CAST(N'1974-08-08T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,42)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00458', N'Tran Ngoc', N'Han', 1, CAST(N'1975-08-24T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,25)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00463', N'Nguyen Thanh', N'Hiep', 0, CAST(N'1975-04-13T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 5,42)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00464', N'Nguyen Cong', N'Quan', 0, CAST(N'1975-10-30T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,25)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00469', N'Tran Trung', N'Tinh', 0, CAST(N'1974-10-12T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,5)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00470', N'Nguyen Thanh', N'Tai', 0, CAST(N'1975-07-27T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00475', N'Nguyen Thanh', N'Hai', 0, CAST(N'1975-06-27T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00476', N'Nguyen Hong', N'Phi', 0, CAST(N'1975-02-21T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,33)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00481', N'Nguyen Tuyet', N'Mai', 1, CAST(N'1974-03-26T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,92)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00482', N'Phu Tyet', N'Mai', 1, CAST(N'1975-09-17T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,42)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00487', N'Le Kim', N'Loan', 1, CAST(N'1974-11-09T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,25)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00488', N'Tran Hong', N'Yen', 1, CAST(N'1975-06-26T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,42)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00502', N'Vo Phong', N'Tran', 0, CAST(N'1975-06-14T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,58)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00529', N'Nguyen Van', N'Dinh', 0, CAST(N'1974-11-09T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,67)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00530', N'Pham Cong', N'Trinh', 0, CAST(N'1975-07-21T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,75)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00535', N'Bui Thanh', N'Tung', 0, CAST(N'1974-09-16T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,08)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00536', N'Le Van', N'Viet', 0, CAST(N'1974-09-11T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00541', N'Nguyen Ngoc', N'Dung', 0, CAST(N'1974-04-24T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,42)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00542', N'Phan Thanh', N'Hong', 0, CAST(N'1975-10-17T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,5)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00547', N'Le Thanh', N'Nhanh', 1, CAST(N'1974-07-09T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,17)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00548', N'Nguyen Be', N'Nam', 1, CAST(N'1975-08-27T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,83)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00553', N'Pham Van', N'Det', 0, CAST(N'1974-09-17T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,75)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00554', N'Phan Thi', N'Thin', 1, CAST(N'1975-11-15T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00559', N'Le Thi Van', N'Anh', 1, CAST(N'1975-08-23T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,92)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00560', N'Nguyen Truc', N'Ly', 1, CAST(N'1974-11-30T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00565', N'Cho Tuan', N'Kiet', 0, CAST(N'1974-06-28T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 5,83)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00566', N'Vo Giai', N'Phong', 0, CAST(N'1975-04-18T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 7,83)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00571', N'Ho Van', N'Cau', 0, CAST(N'1975-03-28T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 6,67)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00572', N'Nguyen Thanh', N'Son', 0, CAST(N'1974-05-14T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,17)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00577', N'Le Hung', N'Vi', 0, CAST(N'1973-05-04T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,17)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'00578', N'Tran Hoang', N'Dang', 0, CAST(N'1975-06-14T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8,83)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'98988', N'Nguyễn Kim ', N'Sao', 0, CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'10A2', NULL, NULL, 8)
INSERT [dbo].[FunctionTest] ([MAHS], [HO], [TEN], [NU], [NGAYSINH], [MALOP], [GHICHU], [XEPLOAI], [dtbc]) VALUES (N'ab125', N'Nguyen', N'Son', 0, NULL, N'10A2', NULL, NULL, 8)
GO
