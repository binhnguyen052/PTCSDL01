USE [master]
GO
/****** Object:  Database [QLDKCD]    Script Date: 1/3/2019 11:08:52 AM ******/
CREATE DATABASE [QLDKCD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDKCD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLDKCD.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLDKCD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLDKCD_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLDKCD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDKCD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDKCD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDKCD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDKCD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDKCD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDKCD] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDKCD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLDKCD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDKCD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDKCD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDKCD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDKCD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDKCD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDKCD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDKCD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDKCD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLDKCD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDKCD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDKCD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDKCD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDKCD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDKCD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDKCD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDKCD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLDKCD] SET  MULTI_USER 
GO
ALTER DATABASE [QLDKCD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDKCD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDKCD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDKCD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLDKCD] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLDKCD]
GO
/****** Object:  Table [dbo].[CHUYENDE]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUYENDE](
	[MaCD] [nchar](10) NOT NULL,
	[TenCD] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Deadline] [nvarchar](50) NULL,
	[SoSVMax] [int] NOT NULL DEFAULT ((0)),
	[MaNganh] [nchar](10) NOT NULL,
	[SoChi] [int] NULL,
	[TgHoc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANGKY]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGKY](
	[MaDK] [int] IDENTITY(1,1) NOT NULL,
	[MaDsGvu_CDe] [int] NOT NULL,
	[MaSoSV] [nchar](10) NOT NULL,
	[MaNhom] [int] NULL,
	[Diem] [float] NULL,
	[TgianDK] [date] NOT NULL DEFAULT ('5/1/2018'),
PRIMARY KEY CLUSTERED 
(
	[MaDK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIACHI]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIACHI](
	[MaDC] [int] IDENTITY(1,1) NOT NULL,
	[SoNha] [nvarchar](50) NULL,
	[Quan] [nvarchar](50) NOT NULL DEFAULT (N'Mặc định'),
	[TP] [nvarchar](50) NOT NULL DEFAULT (N'Mặc định'),
PRIMARY KEY CLUSTERED 
(
	[MaDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DsGvu_CDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DsGvu_CDe](
	[MaDsGvu_CDe] [int] IDENTITY(1,1) NOT NULL,
	[Loai] [int] NULL,
	[MaCD] [nchar](10) NOT NULL,
	[MaGVu] [nchar](10) NOT NULL,
	[NgBatDau] [date] NULL,
	[NgKetThuc] [date] NULL,
	[NienKhoa] [int] NOT NULL,
	[SoHK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDsGvu_CDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MaGV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Phai] [nvarchar](10) NOT NULL DEFAULT (N'Giới tính'),
	[NgSinh] [date] NOT NULL DEFAULT ('1/1/1'),
	[MaDC] [int] NOT NULL,
	[MaTK] [nchar](10) NULL,
	[MaNganh] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GIAOVU]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOVU](
	[MaGVu] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Phai] [nvarchar](10) NOT NULL DEFAULT (N'Giới tính'),
	[NgSinh] [date] NOT NULL DEFAULT ('1/1/1'),
	[MaDC] [int] NOT NULL,
	[MaTK] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOCKY]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCKY](
	[NienKhoa] [int] NOT NULL DEFAULT ((0)),
	[SoHK] [int] NOT NULL DEFAULT ((0)),
	[NgBD] [date] NULL,
	[NgKT] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[NienKhoa] ASC,
	[SoHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOP]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [nchar](10) NOT NULL,
	[SoNhomMax] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGANH]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGANH](
	[MaNganh] [nchar](10) NOT NULL,
	[TenNganh] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[TongSoSV] [int] NOT NULL DEFAULT ((0)),
	[SlCDe] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[MaNganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHOM]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOM](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[MaLop] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHUTRACH]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHUTRACH](
	[MaPhuTrach] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [nchar](10) NOT NULL,
	[MaGV] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhuTrach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSoSV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Phai] [nvarchar](10) NOT NULL DEFAULT (N'Giới tính'),
	[NgSinh] [date] NOT NULL DEFAULT ('1/1/1'),
	[MaDC] [int] NOT NULL,
	[MaNganh] [nchar](10) NOT NULL,
	[MaTK] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSoSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [nchar](10) NOT NULL,
	[MatKhau] [nvarchar](max) NOT NULL DEFAULT ('admin'),
	[ChucVu] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD001     ', N'Nhập môn lập trình', NULL, 100, N'NG001     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD002     ', N'Lập trình hướng đối tượng', NULL, 100, N'NG001     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD003     ', N'Thông minh nhân tạo', NULL, 80, N'NG001     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD004     ', N'Hệ điều hành', NULL, 80, N'NG001     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD005     ', N'Điện tử căn bản', NULL, 100, N'NG002     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD006     ', N'Cơ lượng tử', NULL, 100, N'NG002     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD007     ', N'Điện từ quang', NULL, 80, N'NG002     ', 3, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD008     ', N'Vật lý thống kê', NULL, 80, N'NG002     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD009     ', N'Thiên văn học', NULL, 50, N'NG002     ', 3, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD010     ', N'Hóa vô cơ', NULL, 100, N'NG003     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD011     ', N'Hóa hữu cơ', NULL, 100, N'NG003     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD012     ', N'Hóa sinh lý', NULL, 80, N'NG003     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD013     ', N'Hóa đại cương', NULL, 80, N'NG003     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD015     ', N'Giải tích', NULL, 100, N'NG004     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD016     ', N'Đại số', NULL, 100, N'NG004     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD017     ', N'Toán rời rạc', NULL, 80, N'NG004     ', 4, NULL)
INSERT [dbo].[CHUYENDE] ([MaCD], [TenCD], [Deadline], [SoSVMax], [MaNganh], [SoChi], [TgHoc]) VALUES (N'CD018     ', N'Xác suất thống kê', NULL, 80, N'NG004     ', 4, NULL)
SET IDENTITY_INSERT [dbo].[DANGKY] ON 

INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (1, 1, N'SV001     ', 1, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (2, 1, N'SV002     ', 3, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (3, 3, N'SV003     ', 2, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (4, 2, N'SV004     ', 1, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (5, 4, N'SV005     ', 1, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[DANGKY] ([MaDK], [MaDsGvu_CDe], [MaSoSV], [MaNhom], [Diem], [TgianDK]) VALUES (6, 2, N'SV006     ', 2, NULL, CAST(N'2018-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[DANGKY] OFF
SET IDENTITY_INSERT [dbo].[DIACHI] ON 

INSERT [dbo].[DIACHI] ([MaDC], [SoNha], [Quan], [TP]) VALUES (1, N'1/10', N'Quận 1', N'Hồ Chí Minh')
INSERT [dbo].[DIACHI] ([MaDC], [SoNha], [Quan], [TP]) VALUES (2, N'15/3', N'Quận 12', N'Hồ Chí Minh')
INSERT [dbo].[DIACHI] ([MaDC], [SoNha], [Quan], [TP]) VALUES (3, N'16/10', N'Quận 5', N'Hà Nội')
INSERT [dbo].[DIACHI] ([MaDC], [SoNha], [Quan], [TP]) VALUES (4, N'20/108', N'Quận Tân Bình', N'Hồ Chí Minh')
INSERT [dbo].[DIACHI] ([MaDC], [SoNha], [Quan], [TP]) VALUES (5, N'35/10/20', N'Quận Ba Đình', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[DIACHI] OFF
SET IDENTITY_INSERT [dbo].[DsGvu_CDe] ON 

INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (1, 1, N'CD001     ', N'GVU001    ', CAST(N'2017-01-01' AS Date), CAST(N'2017-01-03' AS Date), 2017, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (2, 1, N'CD002     ', N'GVU001    ', CAST(N'2017-01-01' AS Date), CAST(N'2017-01-03' AS Date), 2017, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (3, 0, N'CD003     ', N'GVU001    ', CAST(N'2017-01-01' AS Date), CAST(N'2017-01-03' AS Date), 2017, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (4, 0, N'CD004     ', N'GVU001    ', CAST(N'2017-01-01' AS Date), CAST(N'2017-01-03' AS Date), 2017, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (5, 1, N'CD009     ', N'GVU002    ', CAST(N'2018-03-01' AS Date), CAST(N'2018-03-03' AS Date), 2018, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (6, 1, N'CD010     ', N'GVU002    ', CAST(N'2018-03-01' AS Date), CAST(N'2018-03-03' AS Date), 2018, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (7, 0, N'CD011     ', N'GVU002    ', CAST(N'2018-06-01' AS Date), CAST(N'2018-06-03' AS Date), 2018, 2)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (8, 1, N'CD012     ', N'GVU002    ', CAST(N'2018-06-01' AS Date), CAST(N'2018-06-03' AS Date), 2018, 2)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (10, 1, N'CD001     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (11, 1, N'CD002     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (12, 1, N'CD003     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (13, 1, N'CD005     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (14, 1, N'CD006     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (15, 1, N'CD007     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (16, 1, N'CD008     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (17, 1, N'CD009     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (18, 1, N'CD010     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (19, 1, N'CD011     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (20, 1, N'CD012     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (21, 1, N'CD013     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (22, 1, N'CD015     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (23, 1, N'CD016     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (24, 1, N'CD017     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (25, 1, N'CD018     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
INSERT [dbo].[DsGvu_CDe] ([MaDsGvu_CDe], [Loai], [MaCD], [MaGVu], [NgBatDau], [NgKetThuc], [NienKhoa], [SoHK]) VALUES (26, 1, N'CD004     ', N'GVU001    ', CAST(N'2019-01-03' AS Date), CAST(N'2019-01-07' AS Date), 2019, 1)
SET IDENTITY_INSERT [dbo].[DsGvu_CDe] OFF
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV001     ', N'Phạm Văn A', N'Nam', CAST(N'1980-12-01' AS Date), 1, NULL, N'NG001     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV002     ', N'Phạm Thị B', N'Nữ', CAST(N'1982-01-15' AS Date), 5, NULL, N'NG002     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV003     ', N'Phạm Văn C', N'Nam', CAST(N'1975-02-28' AS Date), 4, NULL, N'NG003     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV004     ', N'Phạm Thị D', N'Nữ', CAST(N'1983-03-31' AS Date), 2, NULL, N'NG004     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV005     ', N'Phạm Văn E', N'Nam', CAST(N'1980-12-01' AS Date), 1, NULL, N'NG001     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV006     ', N'Phạm Thị F', N'Nữ', CAST(N'1982-01-15' AS Date), 5, NULL, N'NG002     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV007     ', N'Phạm Văn G', N'Nam', CAST(N'1975-02-28' AS Date), 4, NULL, N'NG003     ')
INSERT [dbo].[GIAOVIEN] ([MaGV], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK], [MaNganh]) VALUES (N'GV008     ', N'Phạm Thị H', N'Nữ', CAST(N'1983-03-31' AS Date), 2, NULL, N'NG004     ')
INSERT [dbo].[GIAOVU] ([MaGVu], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK]) VALUES (N'GVU001    ', N'Huỳnh Văn A', N'Nam', CAST(N'1980-12-01' AS Date), 1, NULL)
INSERT [dbo].[GIAOVU] ([MaGVu], [HoTen], [Phai], [NgSinh], [MaDC], [MaTK]) VALUES (N'GVU002    ', N'Huỳnh Thị B', N'Nữ', CAST(N'1986-02-22' AS Date), 5, NULL)
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2017, 1, CAST(N'2017-01-01' AS Date), CAST(N'2021-06-01' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2017, 2, CAST(N'2017-09-01' AS Date), CAST(N'2021-12-31' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2018, 1, CAST(N'2018-01-01' AS Date), CAST(N'2022-06-01' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2018, 2, CAST(N'2018-09-01' AS Date), CAST(N'2022-12-31' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2019, 1, CAST(N'2019-01-01' AS Date), CAST(N'2023-06-01' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2019, 2, CAST(N'2019-09-01' AS Date), CAST(N'2023-12-31' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2020, 1, CAST(N'2020-01-01' AS Date), CAST(N'2024-06-01' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2020, 2, CAST(N'2020-09-01' AS Date), CAST(N'2024-12-31' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2021, 1, CAST(N'2021-01-01' AS Date), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[HOCKY] ([NienKhoa], [SoHK], [NgBD], [NgKT]) VALUES (2021, 2, CAST(N'2021-09-01' AS Date), CAST(N'2025-12-31' AS Date))
INSERT [dbo].[LOP] ([MaLop], [SoNhomMax]) VALUES (N'LH001     ', 8)
INSERT [dbo].[LOP] ([MaLop], [SoNhomMax]) VALUES (N'LH002     ', 5)
INSERT [dbo].[NGANH] ([MaNganh], [TenNganh], [TongSoSV], [SlCDe]) VALUES (N'NG001     ', N'Công Nghệ Thông Tin', 500, 4)
INSERT [dbo].[NGANH] ([MaNganh], [TenNganh], [TongSoSV], [SlCDe]) VALUES (N'NG002     ', N'Vật Lý', 100, 5)
INSERT [dbo].[NGANH] ([MaNganh], [TenNganh], [TongSoSV], [SlCDe]) VALUES (N'NG003     ', N'Hóa Học', 100, 5)
INSERT [dbo].[NGANH] ([MaNganh], [TenNganh], [TongSoSV], [SlCDe]) VALUES (N'NG004     ', N'Toán Học', 70, 4)
SET IDENTITY_INSERT [dbo].[NHOM] ON 

INSERT [dbo].[NHOM] ([MaNhom], [TenNhom], [MaLop]) VALUES (1, N'A', N'LH001     ')
INSERT [dbo].[NHOM] ([MaNhom], [TenNhom], [MaLop]) VALUES (2, N'B', N'LH001     ')
INSERT [dbo].[NHOM] ([MaNhom], [TenNhom], [MaLop]) VALUES (3, N'A', N'LH002     ')
INSERT [dbo].[NHOM] ([MaNhom], [TenNhom], [MaLop]) VALUES (4, N'B', N'LH002     ')
SET IDENTITY_INSERT [dbo].[NHOM] OFF
SET IDENTITY_INSERT [dbo].[PHUTRACH] ON 

INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (3, N'CD001     ', N'GV003     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (4, N'CD002     ', N'GV004     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (5, N'CD003     ', N'GV001     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (6, N'CD004     ', N'GV002     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (9, N'CD005     ', N'GV005     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (10, N'CD006     ', N'GV006     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (11, N'CD007     ', N'GV007     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (12, N'CD008     ', N'GV008     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (13, N'CD009     ', N'GV001     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (15, N'CD010     ', N'GV003     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (17, N'CD011     ', N'GV005     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (18, N'CD012     ', N'GV006     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (19, N'CD013     ', N'GV007     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (20, N'CD015     ', N'GV008     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (21, N'CD016     ', N'GV006     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (25, N'CD017     ', N'GV007     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (28, N'CD018     ', N'GV008     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (29, N'CD001     ', N'GV008     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (30, N'CD002     ', N'GV007     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (31, N'CD003     ', N'GV006     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (32, N'CD004     ', N'GV005     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (33, N'CD005     ', N'GV004     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (34, N'CD006     ', N'GV003     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (35, N'CD007     ', N'GV002     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (36, N'CD008     ', N'GV001     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (37, N'CD009     ', N'GV008     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (38, N'CD010     ', N'GV007     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (39, N'CD011     ', N'GV006     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (40, N'CD012     ', N'GV005     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (41, N'CD013     ', N'GV004     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (42, N'CD015     ', N'GV003     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (43, N'CD016     ', N'GV002     ')
INSERT [dbo].[PHUTRACH] ([MaPhuTrach], [MaCD], [MaGV]) VALUES (44, N'CD017     ', N'GV001     ')
SET IDENTITY_INSERT [dbo].[PHUTRACH] OFF
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV001     ', N'Phạm Văn A', N'Nam', CAST(N'1996-01-13' AS Date), 1, N'NG001     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV0010    ', N'Phạm Văn J', N'Nam', CAST(N'1995-05-18' AS Date), 3, N'NG003     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV0011    ', N'Phạm Thị K', N'Nữ', CAST(N'1998-12-14' AS Date), 4, N'NG002     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV0012    ', N'Phạm Thị L', N'Nữ', CAST(N'1993-01-25' AS Date), 1, N'NG004     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV002     ', N'Phạm Văn B', N'Nam', CAST(N'1997-08-20' AS Date), 2, N'NG001     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV003     ', N'Phạm Thị C', N'Nữ', CAST(N'1996-06-01' AS Date), 5, N'NG002     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV004     ', N'Phạm Văn D', N'Nam', CAST(N'1995-05-18' AS Date), 3, N'NG003     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV005     ', N'Phạm Thị E', N'Nữ', CAST(N'1998-12-14' AS Date), 4, N'NG002     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV006     ', N'Phạm Thị F', N'Nữ', CAST(N'1993-01-25' AS Date), 1, N'NG004     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV007     ', N'Phạm Văn G', N'Nam', CAST(N'1996-01-13' AS Date), 1, N'NG001     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV008     ', N'Phạm Văn H', N'Nam', CAST(N'1997-08-20' AS Date), 2, N'NG001     ', NULL)
INSERT [dbo].[SINHVIEN] ([MaSoSV], [HoTen], [Phai], [NgSinh], [MaDC], [MaNganh], [MaTK]) VALUES (N'SV009     ', N'Phạm Thị I', N'Nữ', CAST(N'1996-06-01' AS Date), 5, N'NG002     ', NULL)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'admin     ', N'admin', 0)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'giaovien1 ', N'admin', 2)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'giaovien2 ', N'admin', 2)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'giaovien3 ', N'admin', 2)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'giaovien4 ', N'admin', 2)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'giaovu2   ', N'admin', 1)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'GVU001    ', N'admin', 1)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien1 ', N'admin', 3)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien2 ', N'admin', 3)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien3 ', N'admin', 3)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien4 ', N'admin', 3)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien5 ', N'admin', 3)
INSERT [dbo].[TAIKHOAN] ([MaTK], [MatKhau], [ChucVu]) VALUES (N'sinhvien6 ', N'admin', 3)
ALTER TABLE [dbo].[CHUYENDE]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[NGANH] ([MaNganh])
GO
ALTER TABLE [dbo].[DANGKY]  WITH CHECK ADD FOREIGN KEY([MaDsGvu_CDe])
REFERENCES [dbo].[DsGvu_CDe] ([MaDsGvu_CDe])
GO
ALTER TABLE [dbo].[DANGKY]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NHOM] ([MaNhom])
GO
ALTER TABLE [dbo].[DANGKY]  WITH CHECK ADD FOREIGN KEY([MaSoSV])
REFERENCES [dbo].[SINHVIEN] ([MaSoSV])
GO
ALTER TABLE [dbo].[DsGvu_CDe]  WITH CHECK ADD FOREIGN KEY([NienKhoa], [SoHK])
REFERENCES [dbo].[HOCKY] ([NienKhoa], [SoHK])
GO
ALTER TABLE [dbo].[DsGvu_CDe]  WITH CHECK ADD FOREIGN KEY([MaCD])
REFERENCES [dbo].[CHUYENDE] ([MaCD])
GO
ALTER TABLE [dbo].[DsGvu_CDe]  WITH CHECK ADD FOREIGN KEY([MaGVu])
REFERENCES [dbo].[GIAOVU] ([MaGVu])
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD FOREIGN KEY([MaDC])
REFERENCES [dbo].[DIACHI] ([MaDC])
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[NGANH] ([MaNganh])
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[GIAOVU]  WITH CHECK ADD FOREIGN KEY([MaDC])
REFERENCES [dbo].[DIACHI] ([MaDC])
GO
ALTER TABLE [dbo].[GIAOVU]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[NHOM]  WITH CHECK ADD FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[PHUTRACH]  WITH CHECK ADD FOREIGN KEY([MaCD])
REFERENCES [dbo].[CHUYENDE] ([MaCD])
GO
ALTER TABLE [dbo].[PHUTRACH]  WITH CHECK ADD FOREIGN KEY([MaGV])
REFERENCES [dbo].[GIAOVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD FOREIGN KEY([MaDC])
REFERENCES [dbo].[DIACHI] ([MaDC])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD FOREIGN KEY([MaNganh])
REFERENCES [dbo].[NGANH] ([MaNganh])
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
/****** Object:  StoredProcedure [dbo].[createAccount]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[createAccount] @MaTK nchar(10), @MatKhau nvarchar(max), @ChucVu int
as
	begin
		insert TAIKHOAN(MaTK, MatKhau, ChucVu) values (@MaTK, @MatKhau, @ChucVu)
	end

GO
/****** Object:  StoredProcedure [dbo].[createChuyenDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[createChuyenDe] @MaCD nchar(10), @TenCD nvarchar(50), @SoSVMax int, @MaNganh nchar(10), @SoChi int
as
	begin
		insert CHUYENDE(MaCD, TenCD, SoSVMax, MaNganh, SoChi) values (@MaCD, @TenCD, @SoSVMax, @MaNganh, @SoChi)
	end

GO
/****** Object:  StoredProcedure [dbo].[createGVuCde]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[createGVuCde] @TenCD nvarchar(50), @Loai int, @MaGVu nchar(10), @NienKhoa int, @SoHK int, @NgBatDau date, @NgKetThuc date
as
	begin
		declare @MaCD nchar(10)
		select @MaCD = cd.MaCD
		from CHUYENDE cd
		where cd.TenCD = @TenCD

		insert DsGvu_CDe(Loai, MaCD, MaGVu, NienKhoa, SoHK, NgBatDau, NgKetThuc) 
		values (@Loai, @MaCD, @MaGVu, @NienKhoa, @SoHK, @NgBatDau, @NgKetThuc)
	end

GO
/****** Object:  StoredProcedure [dbo].[deleteChuyenDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[deleteChuyenDe] @MaCD nchar(10)
as
	begin
		delete DANGKY
		where MaDsGvu_CDe in (select MaDsGvu_CDe
							  from DsGvu_CDe
							  where MaCD = @MaCD)

		delete DsGvu_CDe
		where MaCD = @MaCD

		delete PHUTRACH
		where MaCD = @MaCD

		delete CHUYENDE
		where MaCD = @MaCD
	end

GO
/****** Object:  StoredProcedure [dbo].[deleteGvuCDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[deleteGvuCDe] @MaCD nchar(10), @Loai int, @NienKhoa int, @HocKy int
as
	begin
		declare @MadsGvuCde int

		select @MadsGvuCde = MaDsGvu_CDe
		from DsGvu_CDe
		where MaCD = @MaCD and Loai = @Loai and NienKhoa = @NienKhoa and SoHK = @HocKy

		delete DANGKY
		where MaDsGvu_CDe = @MadsGvuCde

		delete DsGvu_CDe
		where  MaDsGvu_CDe =  @MadsGvuCde
	end

GO
/****** Object:  StoredProcedure [dbo].[getChuyenDeForGVu]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getChuyenDeForGVu] 
as
	begin
		select cd.MaCD, cd.TenCD, cd.SoSVMax, cd.MaNganh, cd.SoChi
		from CHUYENDE cd
	end

GO
/****** Object:  StoredProcedure [dbo].[getChuyenDeTheoTenNganh]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getChuyenDeTheoTenNganh] @TenNganh nvarchar(50)
as
	begin
		select cd.*
		from NGANH ng, CHUYENDE cd
		where ng.MaNganh = cd.MaNganh and ng.TenNganh = @TenNganh
	end

GO
/****** Object:  StoredProcedure [dbo].[getDsGvu_CDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getDsGvu_CDe] 
as
	begin
		select gvcd.MaDsGvu_CDe, cd.MaCD, cd.TenCD, gvcd.NienKhoa, gvcd.SoHK, gvcd.Loai, gvcd.MaGVu, gvcd.NgBatDau, gvcd.NgKetThuc
		from DsGvu_CDe gvcd, CHUYENDE cd
		where gvcd.MaCD = cd.MaCD
	end

GO
/****** Object:  StoredProcedure [dbo].[getGiaoVienTheoTenNgTenCD]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getGiaoVienTheoTenNgTenCD] @TenNganh nvarchar(50), @TenCD nvarchar(50)
as
	begin
		select gv.*
		from NGANH ng, CHUYENDE cd, GIAOVIEN gv
		where ng.MaNganh = cd.MaNganh and gv.MaNganh = ng.MaNganh and gv.MaTK is null
			  and ng.TenNganh = @TenNganh 
			  and cd.TenCD = @TenCD
			  
	end

GO
/****** Object:  StoredProcedure [dbo].[getHocKy]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getHocKy]
as
	begin
		select *
		from HOCKY
	end

GO
/****** Object:  StoredProcedure [dbo].[getNganh]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getNganh]
as
	begin
		select *
		from NGANH
	end

GO
/****** Object:  StoredProcedure [dbo].[getNganhByMaCD]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getNganhByMaCD] @MaCD nchar(10)
as
	begin
		select ng.*
		from NGANH ng, CHUYENDE cd
		where ng.MaNganh = cd.MaNganh and cd.MaCD = @MaCD
	end

GO
/****** Object:  StoredProcedure [dbo].[getSinhVienTheoTNganh]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getSinhVienTheoTNganh] @TenNganh nvarchar(50)
as
	begin
		select sv.*
		from SINHVIEN sv, NGANH ng
		where sv.MaNganh = ng.MaNganh and ng.TenNganh = @TenNganh and sv.MaTK is null
	end

GO
/****** Object:  StoredProcedure [dbo].[getTaiKhoanByIdTaiKhoan]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTaiKhoanByIdTaiKhoan] @maTaiKhoan nchar(10), @MatKhau nchar(10), @ChucVu int
as
	begin
		select *
		from TAIKHOAN
		where MaTK = @maTaiKhoan and MatKhau = @MatKhau and ChucVu = @ChucVu
	end

GO
/****** Object:  StoredProcedure [dbo].[updateChuyenDe]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[updateChuyenDe] @MaCD nchar(10), @TenCD nvarchar(50), @SoSVMax int, @MaNganh nchar(10), @SoChi int
as
	begin
		update CHUYENDE
		set TenCD = @TenCD , SoChi = @SoChi, SoSVMax = @SoSVMax, MaNganh = @MaNganh
		where MaCD = @MaCD
	end

GO
/****** Object:  StoredProcedure [dbo].[updateGiaoVien]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[updateGiaoVien] @MaTK nchar(10), @MaGV nchar(10)
as
	begin
		update GIAOVIEN
		set MaTK = @MaTK
		where MaGV = @MaGV
	end

GO
/****** Object:  StoredProcedure [dbo].[updateSinhVien]    Script Date: 1/3/2019 11:08:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[updateSinhVien] @MaTK nchar(10), @MaSV nchar(10)
as
	begin
		update SINHVIEN
		set MaTK = @MaTK
		where MaSoSV = @MaSV
	end

GO
USE [master]
GO
ALTER DATABASE [QLDKCD] SET  READ_WRITE 
GO
