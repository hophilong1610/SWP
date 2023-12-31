drop database Fastfood

USE [master]
GO
/****** Object:  Database [Fastfood]    Script Date: 5/25/2023 1:02:35 PM ******/
CREATE DATABASE [Fastfood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fastfood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Fastfood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fastfood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Fastfood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fastfood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fastfood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fastfood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fastfood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fastfood] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fastfood] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fastfood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fastfood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fastfood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fastfood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fastfood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fastfood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fastfood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fastfood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fastfood] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Fastfood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fastfood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fastfood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fastfood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fastfood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fastfood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fastfood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fastfood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fastfood] SET  MULTI_USER 
GO
ALTER DATABASE [Fastfood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fastfood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fastfood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fastfood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fastfood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fastfood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fastfood] SET QUERY_STORE = OFF
GO
USE [Fastfood]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartid] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](50) NULL,
	[price] [money] NULL,
	[img] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[details] [nvarchar](250) NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productCart]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCart](
	[cartid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[amount] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [productCart_pk] PRIMARY KEY CLUSTERED 
(
	[cartid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 5/25/2023 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[cartid] [int] NOT NULL,
	[Bill] [int] NULL,
	[Status] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [Order_pk] PRIMARY KEY CLUSTERED 
(
	[cartid] ASC,
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (1, N'Phạm Ngọc Thiện', N'Thien', N'12345', 1)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (2, N'Huỳnh Ngọc Châm', N'Cham', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (3, N'Phan Khánh Quỳnh', N'Quynh', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (4, N'Nguyễn Đức Hải Nam', N'Nam', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (5, N'Hồ Phi Long', N'Long', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (6, N'Nguyễn Trường Vũ', N'Vu', N'12345', 1)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (7, N'Trần Thanh Tuyền', N'Tuyen', N'12345', 1)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (8, N'Nguyễn Duy Khương', N'Khuong', N'12345', 1)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (9, N'Huỳnh Ngọc Thế Bảo', N'Bao', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (10, N'Trần Thanh Trà', N'Tra', N'12345', 0)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (11, N'Nguyễn Trường Thanh', N'Thanh', N'12345', 2)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (12, N'Trần Ngọc Huyền', N'Huyen', N'12345', 2)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (13, N'Trần Duy Bảo', N'Bao', N'12345', 2)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (14, N'Phan Ngọc Thế Mạnh', N'Manh', N'12345', 2)
INSERT [dbo].[Account] ([id], [name], [username], [password], [role]) VALUES (15, N'Phạm Trang Nhung', N'Nhung', N'12345', 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Fried Chicken')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Pizza')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Nước ngọt')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Combo')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Hamburger')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (1, N'Spicy Fried Chicken', 5.0000, N'Img19.jpg', N'1 Big Spicy Chicken', N'Crispy fried chicken with spicy flavors', 1)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (2, N'Fried Chicken with Wasabi sauce', 4.7000, N'Img2.jpg', N'1 Big Chicken with Wasabi Sauce', N'Crispy fried chicken with wasabi sauce', 1)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (3, N'Orginal Fried chicken', 4.0000, N'Img3.jpg', N'1 Big Original Chicken', N'Orginal Crispy fried chicken', 1)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (4, N'Fried Chicken with Honey sauce', 5.5000, N'Img4.jpg', N'1 Big Chicken with Honey sauce', N'Crispy fried chicken with honey sauce', 1)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (5, N'Non Spicy Crispy Chicken', 4.6000, N'Img5.jpg', N'1 Big Non Spicy Chicken', N'Non spicy crispy fried chicken', 1)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (6, N'Cheese Pizza', 6.0000, N'Img6.jpg', N'1 Big Cheese Pizza', N'Pizza with 4 types of cheese', 2)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (7, N'Beef Pizza', 5.7000, N'Img7.jpg', N'1 Big Beef Pizza', N'Pizza with premium beef', 2)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (8, N'Chicken Pizza', 5.8000, N'Img8.jpg', N'1 Big Chicken Pizza', N'Pizza with delicious and juicy chicken', 2)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (9, N'Pepsi', 2.0000, N'Img9.jpg', N'1 Pepsi', N'Iced Pepsi Can', 3)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (10, N'Coca', 2.0000, N'Img10.jpg', N'1 Coca', N'Iced Coca Can', 3)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (11, N'Sprite', 2.0000, N'Img11.jpg', N'1 Sprite', N'Iced Sprite Can', 3)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (12, N'Mirinda', 2.0000, N'Img12.jpg', N'1 Mirinda', N'Iced Mirinda Can', 3)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (13, N'Combo Fried Chicken', 7.0000, N'Img13.jpg', N'A combo for 4 people', N'4 Fried Chicken + 2 Pumcheese + 2 Pepsi Can', 4)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (14, N'Combo Burger', 7.8000, N'Img14.jpg', N'A combo for 5 people', N'1 Burger Zinger/ Burger Flava/ Burger Shrimp + 1 Fried Chicken + 1 Pepsi Can', 4)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (15, N'Cheese Burger', 4.8000, N'Img15.jpg', N'1 Big Cheese Burger', N'Burger with a delicous slice of cheese placed on top of the meat patty', 5)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (16, N'Shrimp Burger', 5.2000, N'Img16.jpg', N'1 Big Shrrimp Burger', N'A combination of coarsely chopped shrimp and finely pulsed shrimp combined with breadcrumbs and spices', 5)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (17, N'Chicken Burger', 5.5000, N'Img17.jpg', N'1 Big Chicken Burger', N'Crispy Chicken Burger with Honey Mustard Coleslaw on a toasted brioche bun', 5)
INSERT [dbo].[Product] ([pid], [pname], [price], [img], [title], [details], [cid]) VALUES (18, N'Vegetarian Hamburger', 4.0000, N'Img18.jpg', N'1 Big Vegetarian Burger', N'Veggie burgers made from vegetables, whole grains, and legumes (like beans or lentils).', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
/****** Object:  Index [UQ__Cart__3213E83E42B6DD48]    Script Date: 5/25/2023 1:02:35 PM ******/
ALTER TABLE [dbo].[Cart] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__productC__DD37D91BA5ED1287]    Script Date: 5/25/2023 1:02:35 PM ******/
ALTER TABLE [dbo].[productCart] ADD UNIQUE NONCLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [cart_account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [cart_account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_category] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_category]
GO
ALTER TABLE [dbo].[productCart]  WITH CHECK ADD  CONSTRAINT [cart_productCart] FOREIGN KEY([cartid])
REFERENCES [dbo].[Cart] ([cartid])
GO
ALTER TABLE [dbo].[productCart] CHECK CONSTRAINT [cart_productCart]
GO
ALTER TABLE [dbo].[productCart]  WITH CHECK ADD  CONSTRAINT [product_productCart] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[productCart] CHECK CONSTRAINT [product_productCart]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [cart_order] FOREIGN KEY([cartid])
REFERENCES [dbo].[Cart] ([cartid])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [cart_order]
GO
USE [master]
GO
ALTER DATABASE [Fastfood] SET  READ_WRITE 
GO
