USE [master]
GO
/****** Object:  Database [QLKhachSan]    Script Date: 12/3/2015 2:43:03 PM ******/
CREATE DATABASE [QLKhachSan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKhachSan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLKhachSan.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLKhachSan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLKhachSan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLKhachSan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKhachSan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKhachSan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKhachSan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKhachSan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKhachSan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKhachSan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKhachSan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKhachSan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKhachSan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKhachSan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKhachSan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKhachSan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKhachSan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKhachSan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKhachSan] SET  MULTI_USER 
GO
ALTER DATABASE [QLKhachSan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKhachSan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKhachSan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKhachSan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLKhachSan]
GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHang]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHang]
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang
end

GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHangDaT]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHangDaT](@tg datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDi<@tg
end

GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHangDT]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHangDT](@tg datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDi>@tg
end

GO
/****** Object:  StoredProcedure [dbo].[Load_KHCMND]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---
create proc [dbo].[Load_KHCMND](@cmnd nvarchar(50))
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and a.SoCMND=@cmnd
end

GO
/****** Object:  StoredProcedure [dbo].[Load_KHTen]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KHTen](@ten nvarchar(50))
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and a.TenKhachHang=@ten
end

GO
/****** Object:  StoredProcedure [dbo].[Load_KHTG]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KHTG](@tgbd datetime,@tgkt datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDen>@tgbd and b.NgayDi<@tgkt
end

GO
/****** Object:  StoredProcedure [dbo].[Them_DatHang]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Them_DatHang](@cmnd nvarchar(50),@maphong int,@ndk datetime, @nden datetime, @ndi datetime)
as
begin
	declare @ma char(10)
	set @ma=(select makhachhang from KhachHang where SoCMND=@cmnd)
	insert into DatPhong(MaKhachHang,MaPhong,NgayDangKy,NgayDen,NgayDi)
	values(@ma,@maphong,@ndk,@nden,@ndi)
	update Phong set TrangThai='Dang su dung' where SoPhong=@maphong
end

GO
/****** Object:  StoredProcedure [dbo].[ThemKH]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemKH](@ten nvarchar(50),@cmnd nvarchar(50),@ns datetime, @dc nvarchar(50))
as
begin
	declare @ma char(10)
	set @ma=((select COUNT(makhachhang) from KhachHang)+1)
	insert into KhachHang(MaKhachHang,TenKhachHang,SoCMND,NgaySinh,diachi)
	values(@ma,@ten,@cmnd,@ns,@dc)
end

GO
/****** Object:  StoredProcedure [dbo].[TimPhong]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TimPhong](@tgdat datetime ,@tgtra datetime)
as
begin
	select a.* from Phong a, DatPhong b
	where b.NgayDen>@tgdat and b.NgayDi<@tgtra and b.MaPhong=a.SoPhong
end

GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatPhong](
	[MaKhachHang] [char](10) NOT NULL,
	[MaPhong] [int] NOT NULL,
	[NgayDangKy] [datetime] NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[ThanhToan] [nchar](10) NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC,
	[MaPhong] ASC,
	[NgayDangKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [char](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[MaNhanVienQuanLy] [char](10) NULL,
	[GiaDichVu] [int] NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaDichVu] [char](10) NOT NULL,
	[MaKhachHang] [char](10) NOT NULL,
	[NgayLap] [datetime] NOT NULL,
	[Tongtien] [nchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC,
	[MaKhachHang] ASC,
	[NgayLap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [char](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoCMND] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[QuocTich] [nvarchar](20) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[SoCMND] [int] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoDienThoai] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 12/3/2015 2:43:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[SoPhong] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[Giuong] [int] NULL,
	[Chan] [int] NULL,
	[GaTrai] [int] NULL,
	[Goi] [int] NULL,
	[Quat] [int] NULL,
	[DenNgu] [int] NULL,
	[DenLon] [int] NULL,
	[Ban] [int] NULL,
	[Tu] [int] NULL,
	[GiaPhong] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[SoPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'1         ', 101, CAST(0x0000A54300000000 AS DateTime), CAST(0x0000A54700000000 AS DateTime), CAST(0x0000A56000000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'10        ', 105, CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A56500000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'2         ', 106, CAST(0x0000A55600000000 AS DateTime), CAST(0x0000A55B00000000 AS DateTime), CAST(0x0000A55E00000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'3         ', 103, CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A56300000000 AS DateTime), CAST(0x0000A56500000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'4         ', 203, CAST(0x0000A55D00000000 AS DateTime), CAST(0x0000A55E00000000 AS DateTime), CAST(0x0000A56500000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'5         ', 204, CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A56600000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'6         ', 205, CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A56200000000 AS DateTime), CAST(0x0000A56500000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'7         ', 102, CAST(0x0000A55E00000000 AS DateTime), CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A56A00000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'8         ', 104, CAST(0x0000A55F00000000 AS DateTime), CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A56800000000 AS DateTime), NULL)
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'9         ', 206, CAST(0x0000A55F00000000 AS DateTime), CAST(0x0000A55F00000000 AS DateTime), CAST(0x0000A56800000000 AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'1         ', N'Phí Xuân Đạo', CAST(0xDF130B00 AS Date), N'Nam', N'354823187', N'01632489256', NULL, N'Da Nang', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'10        ', N'Khương Huy Hoàng', CAST(0x77FC0A00 AS Date), N'Nam', N'324548461', N'01652334893', NULL, N'Ha Nam', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'2         ', N'Phạm Đình Minh', CAST(0xE3FD0A00 AS Date), N'Nam', N'687418596', N'0934624466', NULL, N'Ninh Binh', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'3         ', N'Lưu Văn Lâm', CAST(0xFB160B00 AS Date), N'Nam', N'354698451', N'0986277237', NULL, N'Hai Phong', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'4         ', N'Lê Tuấn Minh', CAST(0x76140B00 AS Date), N'Nam', N'654987855', N'0985113598', N'letuanminh@gmail.com', N'Ha Noi', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'5         ', N'Nguyễn Anh Dũng', CAST(0xF0170B00 AS Date), N'Nam', N'345343535', N'01654824763', NULL, N'Bac Giang', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'6         ', N'Lương Văn Luận', CAST(0x8B160B00 AS Date), N'Nam', N'687453452', N'01632548952', NULL, N'Bac Giang', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'7         ', N'Hoàng Đình Đạt', CAST(0x79170B00 AS Date), N'Nam', N'654982354', N'0987632548', N'hoangdinhdat@gmail.com', N'Bac Kan', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'8         ', N'Nguyễn Mạnh Hải', CAST(0x18190B00 AS Date), N'Nam', N'168471346', N'0952488753', NULL, N'Hai Duong', N'VN')
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'9         ', N'Đinh Ngọc San', CAST(0x1D1C0B00 AS Date), N'Nam', N'213841329', N'0983487523', NULL, N'Binh Phuoc', N'VN')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [username], [pass], [NgaySinh], [SoCMND], [GioiTinh], [SoDienThoai], [Email], [DiaChi]) VALUES (N'NV1       ', N'Nguyễn Chí Công', N'ncc', N'123', CAST(0x941C0B00 AS Date), 123456789, N'Nam', 1239608547, N'cong@gmail.com', N'Ha Giang')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [username], [pass], [NgaySinh], [SoCMND], [GioiTinh], [SoDienThoai], [Email], [DiaChi]) VALUES (N'NV2       ', N'Nguyễn Đức Cảnh', N'ndc', N'123', CAST(0xFF180B00 AS Date), 515214589, N'Nam', 965842333, N'nguyenduccanh@gmail.com', N'Ha Noi')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [username], [pass], [NgaySinh], [SoCMND], [GioiTinh], [SoDienThoai], [Email], [DiaChi]) VALUES (N'NV3       ', N'Lê Tuấn Minh', N'ltm', N'123', CAST(0x10150B00 AS Date), 612364945, N'Nam', 987421438, N'letuanminh@gmail.com', N'Nam Dinh')
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [username], [pass], [NgaySinh], [SoCMND], [GioiTinh], [SoDienThoai], [Email], [DiaChi]) VALUES (N'NV4       ', N'Lưu Văn Lâm', N'lvl', N'123', CAST(0x501C0B00 AS Date), 145498513, N'Nam', 958463245, N'luuvanlam@gmail.com', N'Ha Noi')
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (101, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 2, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (102, N'Dang su dung', 2, 2, 2, 4, 2, 1, 1, 2, 2, 150000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (103, N'Dang su dung', 2, 2, 2, 4, 2, 1, 1, 2, 2, 150000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (104, N'Dang su dung', 1, 1, 1, 2, 1, 1, 1, 1, 2, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (105, N'Dang su dung', 1, 1, 1, 2, 1, 1, 1, 1, 1, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (106, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 1, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (201, N'Chua su dung', 2, 2, 2, 4, 2, 1, 1, 2, 2, 150000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (202, N'Chua su dung', 2, 2, 2, 4, 2, 1, 1, 2, 2, 150000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (203, N'Dang su dung', 1, 1, 1, 2, 1, 1, 1, 1, 2, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (204, N'Dang su dung', 2, 2, 2, 4, 2, 1, 11, 2, 1, 150000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (205, N'Dang su dung', 1, 1, 1, 2, 1, 1, 1, 1, 1, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (206, N'Dang su dung', 2, 2, 2, 4, 2, 1, 1, 2, 1, 170000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (301, N'Chua su dung', 2, 2, 2, 4, 2, 1, 1, 2, 1, 170000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (302, N'Chua su dung', 2, 2, 2, 4, 2, 1, 1, 2, 2, 200000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (303, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 1, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (304, N'Chua su dung', 2, 2, 2, 4, 2, 1, 1, 2, 1, 170000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (305, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 2, 100000)
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (306, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 1, 100000)
USE [master]
GO
ALTER DATABASE [QLKhachSan] SET  READ_WRITE 
GO
