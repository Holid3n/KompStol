USE [master]
GO
/****** Object:  Database [KompStol]    Script Date: 16.12.2023 0:24:26 ******/
CREATE DATABASE [KompStol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KompStol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KompStol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KompStol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KompStol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KompStol] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KompStol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KompStol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KompStol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KompStol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KompStol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KompStol] SET ARITHABORT OFF 
GO
ALTER DATABASE [KompStol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KompStol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KompStol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KompStol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KompStol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KompStol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KompStol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KompStol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KompStol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KompStol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KompStol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KompStol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KompStol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KompStol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KompStol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KompStol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KompStol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KompStol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KompStol] SET  MULTI_USER 
GO
ALTER DATABASE [KompStol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KompStol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KompStol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KompStol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KompStol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KompStol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KompStol] SET QUERY_STORE = OFF
GO
USE [KompStol]
GO
/****** Object:  User [Admin]    Script Date: 16.12.2023 0:24:26 ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[loginhistory]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginhistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[LoginDateTime] [datetime] NULL,
	[TypeVxod] [nvarchar](50) NULL,
 CONSTRAINT [PK_loginhistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[dexcription] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_sostav_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_user]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 16.12.2023 0:24:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[loginhistory] ON 

INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (1, 1, CAST(N'2023-12-14T13:29:20.647' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (2, 1, CAST(N'2023-12-14T13:30:16.300' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (3, 1, CAST(N'2023-12-14T13:46:03.113' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (4, 6, CAST(N'2023-12-14T13:56:19.007' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (5, 2, CAST(N'2023-12-14T13:57:03.710' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (6, 2, CAST(N'2023-12-14T13:58:02.103' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (7, 6, CAST(N'2023-12-14T14:00:13.973' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (8, 3, CAST(N'2023-12-14T14:01:48.147' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (9, 1, CAST(N'2023-12-14T14:02:28.207' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (10, 2, CAST(N'2023-12-14T14:05:11.203' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (11, 3, CAST(N'2023-12-14T14:07:27.807' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (12, 3, CAST(N'2023-12-14T14:21:55.210' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (13, 3, CAST(N'2023-12-14T14:31:00.620' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (14, 3, CAST(N'2023-12-14T14:36:03.460' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (15, 1, CAST(N'2023-12-14T14:48:02.450' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (16, 2, CAST(N'2023-12-14T14:55:16.717' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (17, 2, CAST(N'2023-12-14T14:57:55.473' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (18, 2, CAST(N'2023-12-14T14:59:10.543' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (19, 1, CAST(N'2023-12-14T15:00:40.313' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (20, 6, CAST(N'2023-12-14T15:02:30.800' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (21, 3, CAST(N'2023-12-14T15:06:01.537' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (22, 3, CAST(N'2023-12-14T15:32:22.490' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (23, 6, CAST(N'2023-12-14T15:33:50.980' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (24, 3, CAST(N'2023-12-14T15:47:34.217' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (25, 1, CAST(N'2023-12-14T18:56:36.293' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (26, 3, CAST(N'2023-12-14T18:57:19.997' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (27, 2, CAST(N'2023-12-14T18:58:30.157' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (28, 1, CAST(N'2023-12-14T18:58:57.137' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (29, 1, CAST(N'2023-12-14T18:59:57.597' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (30, 3, CAST(N'2023-12-14T19:01:01.483' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (31, 3, CAST(N'2023-12-14T19:01:59.167' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (32, 3, CAST(N'2023-12-14T19:33:00.710' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (33, 3, CAST(N'2023-12-14T19:34:21.740' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (34, 6, CAST(N'2023-12-14T19:35:32.813' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (35, 6, CAST(N'2023-12-14T20:44:45.273' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (36, 6, CAST(N'2023-12-14T20:52:29.003' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (37, 6, CAST(N'2023-12-14T21:00:22.633' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (38, 6, CAST(N'2023-12-14T21:00:51.303' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (39, 6, CAST(N'2023-12-14T21:01:52.933' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (40, 6, CAST(N'2023-12-14T21:06:50.957' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (41, 3, CAST(N'2023-12-14T21:10:34.393' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (42, 3, CAST(N'2023-12-14T21:11:43.697' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (43, 3, CAST(N'2023-12-14T21:13:09.197' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (44, 6, CAST(N'2023-12-14T21:14:37.220' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (45, 3, CAST(N'2023-12-14T21:22:06.097' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (46, 3, CAST(N'2023-12-14T21:27:20.053' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (47, 3, CAST(N'2023-12-14T21:28:37.283' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (48, 3, CAST(N'2023-12-14T21:29:50.697' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (49, 3, CAST(N'2023-12-14T21:31:09.280' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (50, 3, CAST(N'2023-12-14T21:40:33.887' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (51, 3, CAST(N'2023-12-14T21:48:22.227' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (52, 2, CAST(N'2023-12-14T21:48:37.367' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (53, 3, CAST(N'2023-12-14T21:49:08.207' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (54, 2, CAST(N'2023-12-14T21:49:31.913' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (55, 3, CAST(N'2023-12-14T21:51:17.240' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (56, 1, CAST(N'2023-12-14T22:00:38.250' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (57, 1, CAST(N'2023-12-14T22:00:55.750' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (58, 1, CAST(N'2023-12-14T22:02:40.963' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (59, 1, CAST(N'2023-12-14T22:03:06.240' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (60, 1, CAST(N'2023-12-14T22:04:04.843' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (61, 1, CAST(N'2023-12-14T22:05:41.520' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (62, 1, CAST(N'2023-12-14T22:06:56.873' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (63, 1, CAST(N'2023-12-14T22:08:14.383' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (64, 2, CAST(N'2023-12-14T22:08:47.810' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (65, 2, CAST(N'2023-12-14T22:09:16.880' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (66, 2, CAST(N'2023-12-14T22:10:41.060' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (67, 3, CAST(N'2023-12-14T22:12:11.943' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (68, 1, CAST(N'2023-12-16T00:01:55.853' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (69, 1, CAST(N'2023-12-16T00:03:35.523' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (70, 1, CAST(N'2023-12-16T00:06:08.407' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (71, 1, CAST(N'2023-12-16T00:06:37.383' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (72, 2, CAST(N'2023-12-16T00:07:25.933' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (73, 6, CAST(N'2023-12-16T00:08:02.907' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (74, 2, CAST(N'2023-12-16T00:11:03.093' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (75, 1, CAST(N'2023-12-16T00:17:22.610' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (76, 1, CAST(N'2023-12-16T00:17:44.080' AS DateTime), NULL)
INSERT [dbo].[loginhistory] ([id], [id_user], [LoginDateTime], [TypeVxod]) VALUES (77, 1, CAST(N'2023-12-16T00:18:31.537' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[loginhistory] OFF
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (1, N'/Photo/1.png', N'var1', N'замечательный', N'Russia', 22000, 2)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (2, N'/Photo/2.png', N'var2', N'прекрасный', N'Russia', 21000, 3)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3, N'/Photo/3.png', N'var3', N'удобный', N'Russia', 35000, 41)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3017, N'/Photo/4.png', N'var4', N'нереальный', N'Russia', 12000, 4)
INSERT [dbo].[merch] ([id], [photo], [name], [dexcription], [manufacturer], [price], [discount]) VALUES (3019, N'/Photo/5.png', N'var', N'мощный', N'Russia', 37000, 32)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 1, 1, 1, CAST(N'2023-09-14' AS Date), 1256, 1200, 0, 1200, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 2, 2, 2, CAST(N'2023-09-25' AS Date), 6673, 5000, 0, 6673, 5)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3, 3, 3, 3, CAST(N'2023-09-28' AS Date), 4342, 9000, 0, 4342, 4)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (4, 3, 1, 1, CAST(N'2023-12-14' AS Date), 291, 2500, 125, 2375, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (5, 3, 1, 1, CAST(N'2023-12-14' AS Date), 525, 5900, 0, 5900, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name], [photo]) VALUES (1, N'Пункт выдачи 1', N'/photo/point.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (2, N'Пункт выдачи 2', N'/photo/point2.jpg')
INSERT [dbo].[point] ([id], [name], [photo]) VALUES (3, N'Пункт выдачи 3', NULL)
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (1, 1, 1, 1, 1200, 0, 1)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (2, 2, 1, 2, 6673, 0, 2)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (3, 3, 1, 3, 4342, 0, 3)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (4, 2, 1, 1, 2500, 5, 4)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (5, 1, 1, 1, 2900, 0, 5)
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count], [quantity], [total_cost], [discount], [id]) VALUES (5, 3, 1, 1, 3000, 0, 6)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'доставляется')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_user] ON 

INSERT [dbo].[type_user] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[type_user] ([id], [role]) VALUES (2, N'Менеджер')
INSERT [dbo].[type_user] ([id], [role]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[type_user] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'admin', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'manager', N'12345', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'user', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (4, N'Denis', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (5, N'Erik', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (6, N'Vanya', N'12345', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[loginhistory]  WITH CHECK ADD  CONSTRAINT [FK_loginhistory_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[loginhistory] CHECK CONSTRAINT [FK_loginhistory_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders1] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_user] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_user] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_user]
GO
USE [master]
GO
ALTER DATABASE [KompStol] SET  READ_WRITE 
GO
