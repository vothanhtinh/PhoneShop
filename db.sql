USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 3/2/2023 6:05:47 PM ******/
CREATE DATABASE [ShopOnline] ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\ShopOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopOnline', N'ON'
GO
USE [ShopOnline]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/2/2023 6:05:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [nchar](10) NOT NULL,
	[TenLoaiSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 3/2/2023 6:05:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [nchar](10) NOT NULL,
	[TenNSX] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/2/2023 6:05:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](10) NOT NULL,
	[TenSp] [nvarchar](max) NULL,
	[MaLoaiSP] [nchar](10) NULL,
	[NhaSX] [nchar](10) NULL,
	[CauHinh] [nvarchar](max) NULL,
	[HinhChinh] [nvarchar](50) NULL,
	[SoLuongDaBan] [int] NULL,
	[LuotXem] [int] NULL,
	[Gia] [int] NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'L01       ', N'Cao Cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'L02       ', N'Trung Cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'L03       ', N'Trung Bình')
GO
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'N01       ', N'IPhone')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'N02       ', N'SamSung')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'N03       ', N'ViVo')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX]) VALUES (N'N04       ', N'Oppo')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP01', N'Điện thoại iPhone 14 Plus 512GB', N'L01       ', N'N01       ', N'Chưa Xác Định', N'1.png', 0, 0, 26990000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP02', N'Điện thoại iPhone 14 Pro Max 128GB', N'L01       ', N'N01       ', N'Chưa Xác Định', N'2.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP03', N'IPhone13', N'L01       ', N'N01       ', N'Chưa Xác Định', N'3.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP04', N'IPhone12', N'L01       ', N'N01       ', N'Chưa Xác Định', N'4.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP05', N'SamSungNote10', N'L02       ', N'N02       ', N'Chưa Xác Định', N'5.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP06', N'SamSungNote11', N'L02       ', N'N02       ', N'Chưa Xác Định', N'6.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP07', N'SamSungNote12', N'L02       ', N'N02       ', N'Chưa Xác Định', N'7.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP08', N'SamSungNote13', N'L02       ', N'N02       ', N'Chưa Xác Định', N'8.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP09', N'Oppo1', N'L03       ', N'N04       ', N'Chưa Xác Định', N'9.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP10', N'Oppo2', N'L03       ', N'N04       ', N'Chưa Xác Định', N'10.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP11', N'Oppo3', N'L03       ', N'N04       ', N'Chưa Xác Định', N'11.png', 0, 0, 29000000, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSp], [MaLoaiSP], [NhaSX], [CauHinh], [HinhChinh], [SoLuongDaBan], [LuotXem], [Gia], [TinhTrang]) VALUES (N'SP12', N'Oppo4', N'L03       ', N'N04       ', N'Chưa Xác Định', N'12.png', 0, 0, 29000000, 0)
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_SoLuongDaBan]  DEFAULT ((0)) FOR [SoLuongDaBan]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
