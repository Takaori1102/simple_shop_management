USE [master]
GO
/****** Object:  Database [FootBallShop]    Script Date: 7/18/2023 8:54:03 PM ******/
CREATE DATABASE [FootBallShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootBallShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\FootBallShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootBallShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\FootBallShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FootBallShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootBallShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootBallShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootBallShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootBallShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootBallShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootBallShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootBallShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootBallShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootBallShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootBallShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootBallShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootBallShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootBallShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootBallShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootBallShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootBallShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FootBallShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootBallShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootBallShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootBallShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootBallShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootBallShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootBallShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootBallShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FootBallShop] SET  MULTI_USER 
GO
ALTER DATABASE [FootBallShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootBallShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootBallShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootBallShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootBallShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FootBallShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootBallShop', N'ON'
GO
ALTER DATABASE [FootBallShop] SET QUERY_STORE = OFF
GO
USE [FootBallShop]
GO
/****** Object:  Table [dbo].[Best_Seller]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Best_Seller](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
	[TagId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](255) NOT NULL,
	[link] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Product]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Product](
	[ProductID] [int] NULL,
	[image] [text] NULL,
	[deleteFlag] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New_Arrival]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New_Arrival](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderFromUser] [int] NULL,
	[Customer_Name] [nvarchar](255) NULL,
	[Customer_Email] [varchar](255) NULL,
	[Customer_Phone] [varchar](20) NULL,
	[Customer_Address] [nvarchar](255) NULL,
	[EmloyeeID] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[TotalOrder] [money] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Collection](
	[ProductId] [int] NOT NULL,
	[CollectionId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Collection_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Tag]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tag](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Tag_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[ClassType] [int] NULL,
	[ClassValue] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[ParentId] [int] NULL,
	[CategoryId] [int] NULL,
	[IsParent] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[DeleteFlag] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[StatusOrderID] [int] NOT NULL,
	[StatusValue] [nvarchar](255) NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[StatusOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/18/2023 8:54:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[EmailID] [text] NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [text] NULL,
	[Avatar] [text] NULL,
	[RoleID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (1, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (4, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (28, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (8, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (1, N'Áo Tuyển', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (2, N'Áo Thi đấu', 1, NULL, 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (33, N'Giày Fake', 1, NULL, 2)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [TagId]) VALUES (34, N'Giày Thi Đấu', 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (1, N'Áo tuyển', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/10-37c9706f-413a-4123-b0d6-07905851440b.png?v=1648550713910', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (3, N'Áo câu lạc bộ', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/9-228daf39-c660-4d00-9cc0-b9bbdb8f0e1d.png?v=1648550696500', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (12, N'Giày Thi đấu', N'OKE', 1, NULL)
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'/images/a4b33e61-366a-413e-b175-7b9990723a6d.png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhgNZgCoi4eoJcUHZVPaBqhZFNO_0FrzYKavxG0-cocA&s', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (3, N'https://supersports.com.vn/cdn/shop/products/H40951-1_900x@2x.jpg?v=1634524988', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (4, N'https://dothethao.net.vn/wp-content/uploads/2020/12/ao-dau-san-nha-atletico-madrid-2021-2022-concept.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (5, N'https://rozaco.vn/wp-content/uploads/2021/05/ao-atletico-2022-san-khach.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (6, N'https://kingmensport.vn/wp-content/uploads/2022/05/z3425437734044_0a970e5e5bb51c35c7ee70b668c6690e.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (7, N'https://product.hstatic.net/200000022804/product/2a1129e4_4ff7444c36fd4b6884988bf1203e41ce_master.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (8, N'https://dothethao.net.vn/wp-content/uploads/2014/03/ao_bayern_munich_2013_2014_san_nha20130929144531.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (9, N'https://vuaaodau.vn/wp-content/uploads/2022/07/bay5-400x400.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (10, N'https://dothethao.net.vn/wp-content/uploads/2023/03/z4183842258900-a85fd8743fcdab6cadcfa04832a42822.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (11, N'https://aobongda24h.com/pic/product/Ao-juvent_636870296463520260_HasThumb.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (26, N'https://img.websosanh.vn/v10/users/review/images/tvrv7n48pm5an/giay-da-bong-nike-4.jpg?compress=85', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (27, N'https://thegioithethao.vn/images/products/2021/12/07/large/giay_da_bong_adidas___eg0913_1638843062.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (28, N'https://fansport.vn/upload/product/16/57/00/2021-2022-home-liverpool-shirt-jersey-ao-bong-da-red-nike-db2533-688-image-20220705143900-825946.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (29, N'https://www.sporter.vn/wp-content/uploads/2017/06/Ao-bong-da-chelsea-san-khach-hang-viet-nam-1-1.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (30, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1-qkiEx9OhPVKmR6dM7rUjfyYKJA2rLhq5A&usqp=CAU', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (31, N'https://assets.adidas.com/images/w_600,f_auto,q_auto/53c802aacfa34ac9826faadc00e0f57f_9366/Ao_thi_djau_san_nha_djoi_Tay_Ban_Nha_DJo_FR8361_01_laydown.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (32, N'https://product.hstatic.net/200000025394/product/ao_djau_san_nha_djoi_tuyen_djuc_22_trang_hf1467_01_laydown_0ba0df0c655047a0bc66006c36891aab_master.jpg', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'/images/65e84f74-1d79-4ec3-a583-905279ed5cb5.png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (1, N'/images/4e21c7dd-2a3d-4781-abc9-351e08d1f0bb.png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (33, N'/images/837034f2-4be6-4c25-9edb-a72709e61a7d.png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (33, N'/images/7ba46375-6a91-46fe-bfba-710fb756cfe7.png', 0)
INSERT [dbo].[Image_Product] ([ProductID], [image], [deleteFlag]) VALUES (33, N'/images/55985b52-dd57-4d97-9a79-2e0c0fb9f150.png', 0)
GO
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (8, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (10, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (26, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (27, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (1, 18, N'Minh Nguyen', N'ndminh1010@gmail.com', N'0983218694', N'Số 958 đường Điện Biên', NULL, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, 4820.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (2, 19, N'Nguyen Thanh Duc', N'hihi@gmail.com', N'0903441188', N'London,Anh', NULL, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, 240.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (3, 19, N'Hoang Thu Phuong', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'ship cho em tình iuuu cháy bỏng của anhh iuu vợ', NULL, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, 240.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (4, 19, N'Hoang Thu Phuong', N'PhuongHT172196@fpt.edu.vn', N'0818165923', N'For you my beautiful lovely wife', NULL, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1, 1020.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (5, 19, N'Thanh Duc', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'78 Láng Hạ,Đống Đa,Hà Nội', NULL, CAST(N'2023-07-09T00:00:00.000' AS DateTime), 1, 240.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (6, 23, N'Hoang Thu Phuong', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'ship cho em tình iuuu cháy bỏng của anhh iuu vợ', NULL, CAST(N'2023-07-10T00:00:00.000' AS DateTime), 1, 220.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (7, 19, N'Hoang Thu Phuong', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'ship cho em tình iuuu cháy bỏng của anhh iuu vợ', NULL, CAST(N'2023-07-10T00:00:00.000' AS DateTime), 1, 5500.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (8, 23, N'Hoang Thu Phuong', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'ship cho em tình iuuu cháy bỏng của anhh iuu vợ', NULL, CAST(N'2023-07-11T00:00:00.000' AS DateTime), 1, 110.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [OrderFromUser], [Customer_Name], [Customer_Email], [Customer_Phone], [Customer_Address], [EmloyeeID], [DateTime], [PaymentMethod], [TotalOrder], [Status]) VALUES (9, 27, N'Hoang Thu Phuong', N'ducnthe171716@fpt.edu.vn', N'0936003961', N'78 Đông Quan', NULL, CAST(N'2023-07-12T00:00:00.000' AS DateTime), 2, 380.0000, 1)
GO
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (1, N'Ship COD', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (2, N'Chuyển khoản', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (3, N'Paypal', 0)
GO
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (1, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (2, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (3, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (4, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (5, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (6, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (7, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (8, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (9, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (10, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (11, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (26, 12, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (27, 12, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (28, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (29, 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (30, 1, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (31, 1, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (32, 1, 0)
GO
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (1, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (2, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (4, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (5, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (6, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (7, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (8, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (9, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (10, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (11, 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (26, 2, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (27, 2, 0)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (1, N'Áo Real Madrid', 220.0000, 30, 1, 3, N'Trắng', NULL, NULL, 2, 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (2, N'Áo Real Madrid', 220.0000, 0, 1, 3, N'Đen', NULL, 1, 1, 0, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (3, N'Áo Real Madrid', 280.0000, 57, 1, 3, N'Xanh', NULL, 1, 1, 0, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (4, N'Áo Atletico Madrid', 320.0000, 45, 1, 1, N'Aó Sân Nhà', NULL, NULL, 1, 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (5, N'Áo Atletico Madrid', 480.0000, 12, 1, 1, N'Aó Sân Khách', NULL, 4, 1, 0, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (6, N'Áo Barca', 350.0000, 8, 1, 1, N'Áo Sân Nhà', NULL, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (7, N'Áo Barca', 250.0000, 6, 1, 1, N'Áo Sân Khách', NULL, 5, 1, 0, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (8, N'Áo Bayern Munich', 250.0000, 0, 1, 1, N'Áo Sân Nhà', NULL, NULL, 1, 1, N'', 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (9, N'Áo Bayern Munich', 90.0000, 34, 1, 1, N'Áo Sân Khách', NULL, 8, 1, 0, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (10, N'Áo Juventus', 90.0000, 0, 1, 1, N'Trắng', NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (11, N'Áo Juventus', 90.0000, 42, 1, 1, N'Đen', NULL, 10, 1, 0, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (26, N'Giày Nike', 1000.0000, 10, 1, NULL, NULL, NULL, NULL, 33, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (27, N'Giày Adidas', 1200.0000, 10, 1, NULL, NULL, NULL, NULL, 34, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (28, N'Aó Liverpool', 90.0000, 12, 1, 2, N'Aó sân nhà', NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (29, N'Aó Chelsea', 90.0000, 13, 1, 1, N'Aó sân nhà', NULL, 3, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (30, N'Aó Bồ Đào Nha', 100.0000, 12, 1, 3, N'Đỏ', NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (31, N'Aó Tây Ban Nha', 100.0000, 10, 1, 3, N'Đỏ', NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (32, N'Aó Đức', 100.0000, 9, 1, 3, N'Xanh lá cây', NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [DeleteFlag]) VALUES (33, N'Áo Test', 123.0000, 10, 1, NULL, NULL, CAST(N'2023-07-18' AS Date), NULL, 2, 1, N'', 0)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (2, N'Staff', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (3, N'Customer', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[StatusOrder] ([StatusOrderID], [StatusValue]) VALUES (3, N'Hoàn thành')
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (1, N'Quần áo', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (2, N'Giày', 1, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (1, N'Loại')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (2, N'Kích thước')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (3, N'Màu sắc')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (1, N'Nguyễn Ánh Linh', N'admin@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'1999-12-02' AS Date), N'Hà Ðông, Hà N?i', NULL, 1, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (2, N'Đào Phúc Lộc', N'cus2@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987283476', CAST(N'1992-02-15' AS Date), NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (3, N'Quyền Hải Long', N'cus3@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0332837477', CAST(N'2002-06-23' AS Date), N'Lao Cai', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (4, N'Nguyễn Quang Huy', N'cus4@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678876', CAST(N'2001-05-04' AS Date), N'Khu?t Duy Ti?n, Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (5, N'Trần Trí Dũng', N'cus5@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678432', NULL, NULL, NULL, 2, 1, 0, N'Khách hàng không có thông tin')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (6, N'Vũ Duy Nam', N'cus6@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0983123122', CAST(N'2001-10-06' AS Date), NULL, NULL, 2, 1, 1, N'C?n xin d?a ch? khách hàng')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (7, N'Nguyen Duc Minh', NULL, NULL, N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (8, N'Nguyen Duc Minh', NULL, N'108801319630039114694', N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (10, N'Minh Nguyen', N'minhnd101001@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', NULL, N'helooooooooo', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (11, N'Nguyen Minh', NULL, N'118315661978952123595', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (12, N'Minh Nguyen', N'nono@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1234567890', NULL, N'Ðu?ng Ðiên Biên, thành ph? Yên Bái', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (13, N'Nguyen Duc Minh', N'khongco@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'3534543256', NULL, N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (14, N'Nguyen Duc Minh', N'ndminh.work@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-06' AS Date), N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (15, N'helo', N'efgsdgk@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-15' AS Date), N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (16, N'check check', N'test@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', N'0987654321', CAST(N'2002-06-13' AS Date), N'', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (17, N'Minh Nguyễn', NULL, N'106099637354725921371', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (18, N'Thanh Duc', N'thanhduc@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0923444444', CAST(N'2023-06-01' AS Date), N'', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (19, N'Nguyễn Thành Đức', NULL, N'108530884344422238191', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (20, N'Hoang Thu Phuong', N'PhuongHT172196@fpt.edu.vn', NULL, N'21232f297a57a5a743894a0e4a801fc3', N'0936003961', CAST(N'2023-07-04' AS Date), N'78 Láng H?,Ð?ng Ða,Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (21, N'Hoang Thu Phuong', N'hoho@gmail.com', NULL, N'21232f297a57a5a743894a0e4a801fc3', N'0936003961', CAST(N'2023-07-04' AS Date), N'78 Láng H?,Ð?ng Ða,Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (22, N'Nguyen Mạnh Tiến', N'manhtien123@gmail.com', NULL, N'e10adc3949ba59abbe56e057f20f883e', N'0392929323', CAST(N'2023-07-05' AS Date), N'78 Ðông Quan', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (23, N'Thanh Duc Dep Zai', N'thanhducdepzai123@gmail.com', NULL, N'25d55ad283aa400af464c76d713c07ad', N'0983609763', CAST(N'2023-05-30' AS Date), N'647 Dong Kim Nguu', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (24, N'Hoang Thu Phuong', N'thanhducdepzai1234@gmail.com', NULL, N'bfd81ee3ed27ad31c95ca75e21365973', N'0936003961', CAST(N'2023-07-04' AS Date), N'78  C?u gi?y', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (25, N'konimionininini', N'thanhducdepzai12345@gmail.com', NULL, N'25d55ad283aa400af464c76d713c07ad', N'0903441188', CAST(N'2023-07-08' AS Date), N'647 Dong Kim Nguu', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (26, N'Nguyen Thanh Duck', N'thanhducdepzai123456@gmail.com', NULL, N'fbe82b93c071bedda31afded400cca52', N'0936003967', CAST(N'2023-07-03' AS Date), N'647 Kim Nguu', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (27, N'Thanh Duck', N'thanhducdepzai1234567@gmail.com', NULL, N'97a6461e48e7d96ce886952c4ad2b86d', N'0936003966', CAST(N'2023-07-01' AS Date), N'78 Khuong Dinh', NULL, 3, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Best_Seller]  WITH CHECK ADD  CONSTRAINT [FK_Best_seller_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Best_Seller] CHECK CONSTRAINT [FK_Best_seller_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Tags]
GO
ALTER TABLE [dbo].[Image_Product]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Image_Product] CHECK CONSTRAINT [FK_Image_Product_Products]
GO
ALTER TABLE [dbo].[New_Arrival]  WITH CHECK ADD  CONSTRAINT [FK_New_Arrival_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[New_Arrival] CHECK CONSTRAINT [FK_New_Arrival_Products]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders1] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusOrder] ([StatusOrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([EmloyeeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([OrderFromUser])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User1]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Collections] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collections] ([CollectionID])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Collections]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Tags1] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Tags1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products1] FOREIGN KEY([ClassType])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [FootBallShop] SET  READ_WRITE 
GO
