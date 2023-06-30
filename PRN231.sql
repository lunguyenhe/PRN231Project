USE [master]
GO
/****** Object:  Database [PRN231PROJECT]    Script Date: 22/6/2023 9:34:39 AM ******/
CREATE DATABASE [PRN231PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN231PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN231PROJECT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN231PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231PROJECT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231PROJECT', N'ON'
GO
ALTER DATABASE [PRN231PROJECT] SET QUERY_STORE = OFF
GO
USE [PRN231PROJECT]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Usename] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](60) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
	[HelpfulVotes] [int] NOT NULL,
	[UnhelpfulVotes] [int] NOT NULL,
	[RatingStars] [int] NOT NULL,
	[EmployeeReply] [nvarchar](max) NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentVotes]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentVotes](
	[CommentID] [int] NULL,
	[CustomerID] [int] NULL,
	[VoteType] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[AccountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[HireDate] [date] NULL,
	[Salary] [decimal](10, 2) NULL,
	[Address] [nvarchar](200) NULL,
	[AccountID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Length] [float] NULL,
	[Width] [float] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[Wheelbase] [float] NULL,
	[ImageUrl] [nvarchar](200) NULL,
	[ImageUrl2] [nvarchar](200) NULL,
	[ImageUrl3] [nvarchar](200) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[AverageRating] [float] NOT NULL,
	[CategoryID] [int] NULL,
	[BrandID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestDriveRegistrations]    Script Date: 22/6/2023 9:34:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestDriveRegistrations](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[FullName] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[TestDriveDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Usename], [Password], [Role]) VALUES (1, N'lu', N'123', 1)
INSERT [dbo].[Account] ([AccountID], [Usename], [Password], [Role]) VALUES (2, N'lu123', N'123', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandID], [BrandName], [Website], [Description], [Logo]) VALUES (1, N'Honda', N'https://global.honda/', N'Honda Motor Co., Ltd.[3] (Japanese: 本田技研工業株式会社, Hepburn: Honda Giken Kōgyō KK, IPA: [honda] (listen); /ˈhɒndə/; commonly known as simply Honda) is a Japanese public multinational conglomerate manufacturer of automobiles, motorcycles, and power equipment, headquartered in Minato, Tokyo, Japan.

Honda has been the world''s largest motorcycle manufacturer since 1959,[4][5] reaching a production of 400 million by the end of 2019.[6] It is also the world''s largest manufacturer of internal combustion engines measured by volume, producing more than 14 million internal combustion engines each year.[7] Honda became the second-largest Japanese automobile manufacturer in 2001.[8][9] In 2015, Honda was the eighth largest automobile manufacturer in the world.[10]', N'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fvi.m.wikipedia.org%2Fwiki%2FT%25E1%25BA%25ADp_tin%3AHonda_Logo.svg&psig=AOvVaw02W143GjcBi3p5IkoiUg9E&ust=1685238393926000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNiM3LuwlP8CFQAAAAAdAAAAABAD')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Website], [Description], [Logo]) VALUES (2, N'BMW', N'https://www.bmwgroup.com/', N'With its four brands BMW, MINI, Rolls-Royce and BMW Motorrad, the BMW Group is the world’s leading premium manufacturer of automobiles and motorcycles. The company set the course for the future at an early stage and consistently makes sustainability and efficient resource management central to its strategic direction, from the supply chain through production to the end of the use phase of all products. The BMW Group production network comprises over 30 production sites worldwide; the company has a global sales network in more than 140 countries.', N'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fthinkmarketingmagazine.com%2Fbmw-logo-evolution-story%2F&psig=AOvVaw11mJ09q65uoPv6nfJ0Eopt&ust=1685238544111000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLD64_iwlP8CFQAAAAAdAAAAABAD')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Website], [Description], [Logo]) VALUES (3, N'Audi', N'https://www.audi.vn/', N'AUDI AG là một công ty của Đức chuyên sản xuất ô tô hạng sang dưới nhãn hiệu Audi. Công ty này là thành viên của tập đoàn ô tô lớn nhất thế giới Volkswagen AG. Cái tên Audi bản dịch tiếng La tinh là tên của nhà sáng lập August Horch.', N'logoaudi.png')
INSERT [dbo].[Brands] ([BrandID], [BrandName], [Website], [Description], [Logo]) VALUES (4, N'Kia', N'https://kiavietnam.com.vn/', N'KIA có trụ sở chính được đặt tại thành phố Seoul, Hàn Quốc, là hãng xe hơi có giá trị thương hiệu lớn thứ 5 châu Á, hạng 13 thế giới năm 2020.', N'kia-logo.png')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Sedan', N'Sedan is understood as a 4-door car, with 4 or 5 seats, with a ceiling extending from front to back, a bonnet and luggage compartment lower than the main compartment, along with a way to open the trunk.')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'SUV', N'SUV and CUV (also known as Crossover) are two concepts that are often used mixed, sometimes accepted together.
The SUV is essentially a sport utility vehicle, with a high ground clearance, full-time or part-time 4-wheel drive. The size of this car is usually from medium to large, with equipment that favors the ability to run long distances, off-road more than on the street.')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [ProductID], [CustomerID], [Comment], [CreatedAt], [HelpfulVotes], [UnhelpfulVotes], [RatingStars], [EmployeeReply], [EmployeeID]) VALUES (1, 2, 1, N'da lai thu ổn', CAST(N'2023-05-29T17:07:14.347' AS DateTime), 0, 0, 5, NULL, NULL)
INSERT [dbo].[Comments] ([CommentID], [ProductID], [CustomerID], [Comment], [CreatedAt], [HelpfulVotes], [UnhelpfulVotes], [RatingStars], [EmployeeReply], [EmployeeID]) VALUES (2, 2, 1, N'da lai thu on', CAST(N'2023-05-29T17:07:14.347' AS DateTime), 0, 0, 4, NULL, NULL)
INSERT [dbo].[Comments] ([CommentID], [ProductID], [CustomerID], [Comment], [CreatedAt], [HelpfulVotes], [UnhelpfulVotes], [RatingStars], [EmployeeReply], [EmployeeID]) VALUES (1002, 2, 1, N'ok', CAST(N'2023-06-10T15:25:22.430' AS DateTime), 0, 0, 5, NULL, NULL)
INSERT [dbo].[Comments] ([CommentID], [ProductID], [CustomerID], [Comment], [CreatedAt], [HelpfulVotes], [UnhelpfulVotes], [RatingStars], [EmployeeReply], [EmployeeID]) VALUES (2002, 8, 1, N'san pham ok', CAST(N'2023-06-15T17:13:22.937' AS DateTime), 0, 0, 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [AccountID]) VALUES (1, N'Nguyen', N'A', N'lunguyen2k18@gmail.com', N'0123456789', N'HaNoi', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [HireDate], [Salary], [Address], [AccountID]) VALUES (1, N'Nguyen', N'B', N'lunguyen2k22@gmail.com', CAST(N'2022-08-25' AS Date), CAST(500.00 AS Decimal(10, 2)), N'HaNoi', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Length], [Width], [Height], [Weight], [Wheelbase], [ImageUrl], [ImageUrl2], [ImageUrl3], [Price], [AverageRating], [CategoryID], [BrandID]) VALUES (2, N'BMW 5 Series Sedan', N'BMW 5 Series Sedan là hình ảnh thu nhỏ của không gian năng động và sang trọng chuẩn doanh nhân. BMW 5 Series Sedan tạo nên sự cuốn hút ngay từ cái nhìn đầu tiên về phong cách thể thao kết hợp với sự tinh tế trong thiết kế. Bề mặt phẳng kết hợp với đường gân sắc nét mang đến vẻ ngoài thanh lịch nhưng vẫn đậm tính hiện đại. Nội thất trang nhã và tiện dụng cho thấy tham vọng cách tân của BMW 5 Series Sedan với các công nghệ hướng tới tương lai cùng các tính năng thể thao. Kết hợp với khả năng vận hành ấn tượng và các công nghệ tiên tiến, BMW 5 Series Sedan mang đến sự thoải mái, tự tin và trên hết là cảm giác lái được thỏa mãn tuyệt đối trên cả hành trình dù ngắn hay dài.', 4963, 1868, 1497, 1700, 2975, N'bmw-5-series-sedan.png', N'bmw-5-series-sedan-02.jpg', N'bmw 5-03.jpg', CAST(232.00 AS Decimal(18, 2)), 3, 1, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Length], [Width], [Height], [Weight], [Wheelbase], [ImageUrl], [ImageUrl2], [ImageUrl3], [Price], [AverageRating], [CategoryID], [BrandID]) VALUES (8, N'Audi A3 Sedan', N'Audi A3 SedanKhông gian cabin Audi A3 Sedan 2021 áp dụng các hình khối góc cạnh giúp thu hút nhóm khách hàng trẻ tuổi yêu thích tính thể thao hiện đại. A3 trang bị đồng hồ lái kỹ thuật số kích thước 10,25 inch trên bản tiêu chuẩn và 12,3 inch trên bản cao cấp, hệ thống giải trí màn hình 10,1 inch tương thích Apple Carplay và Android Auto, màn hình nhỏ hiển thị và điều khiển hệ thống điều hoà tự động, ghế kiểu thể thao ôm người ngồi', 4500, 1820, 1430, 1465, 2950, N'audi-a3-sedan.jpg', N'audi-a3-sedan-01.jpg', N'audi-a3-sedan-7.jpg', CAST(2112.00 AS Decimal(18, 2)), 2, 1, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Length], [Width], [Height], [Weight], [Wheelbase], [ImageUrl], [ImageUrl2], [ImageUrl3], [Price], [AverageRating], [CategoryID], [BrandID]) VALUES (9, N'Honda HR-V', N'So với các mẫu xe trong cùng phân khúc CUV hạng B như MG ZS, Hyundai Kona, Ford EcoSport, Mazda CX-3… HR-V sở hữu kích thước tổng thể và trục cơ sở lớn hơn đáng kể, điều này giúp xe bề thế và có một không gian bên trong rộng rãi, thoải mái.

Trọng lượng xe là 1.363 kg và trọng lượng toàn tải ở mức 1.830 kg. Dù cho HR-V sở hữu trọng lượng nặng nhất trong phân khúc, nhưng do sử dụng khối động cơ mạnh mẽ lên tới 174 mã lực nên HR-V vẫn sở hữu tỷ số công suất trên trọng lượng ở mức thấp.', 4385, 1790, 1590, 1363, 2610, N'honda_hr_v_2022_4k-t2.jpg', N'honda HRV.jpg', N'honda-hr-v-2022.jpg', CAST(500.00 AS Decimal(18, 2)), 1, 2, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Length], [Width], [Height], [Weight], [Wheelbase], [ImageUrl], [ImageUrl2], [ImageUrl3], [Price], [AverageRating], [CategoryID], [BrandID]) VALUES (10, N'Kia K3', N'Th?u hi?u du?c nhu c?u c?a khách hàng, v?i chi?n lu?c phát tri?n tr? thành nhà cung c?p gi?i pháp di d?ng thông minh (Smart mobility solutions), KIA dã không ng?ng d?i m?i và sáng t?o, ?ng d?ng các công ngh? thông minh phát tri?n s?n ph?m th? h? m?i trong dó có Kia K3.
Kia K3 cung là kì v?ng c?a KIA hu?ng d?n nh?ng khách hàng tr? dam mê chinh ph?c và mong mu?n khám phá nh?ng tr?i nghi?m m?i. V?i vai trò m?t ngu?i b?n d?ng hành, m?u xe là l?a ch?n lý tu?ng d?nh hình cho phong cách s?ng thông minh “Smart Lifestyle” c?a khách hàng tr? th?i d?i m?i.', 4640, 1800, 8, 1450, 2700, N'K3-5.jpg', N'K3-4.jpg', N'K3-3.jpg', CAST(599.00 AS Decimal(18, 2)), 5, 1, 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Length], [Width], [Height], [Weight], [Wheelbase], [ImageUrl], [ImageUrl2], [ImageUrl3], [Price], [AverageRating], [CategoryID], [BrandID]) VALUES (11, N'Kia Sportage', N'M?u xe ?ng d?ng thành t? Bold for Nature – Ð?m Ch?t T? Nhiên trong tri?t lý thi?t k? m?i. L?y c?m h?ng t? thiên nhiên và cu?c s?ng duong d?i, Kia Sportage du?c nh?n m?nh b?ng nh?ng du?ng nét táo b?o và d?t khoát, t?o nên m?t di?n m?o d?y m?nh m?, hi?n d?i và ?n tu?ng.', 4660, 1865, 1700, 1650, 2755, N'suv-1.png', N'KIA-Sportage-trang-6.jpg', N'KIA-Sportage-trang-16.jpg', CAST(599.00 AS Decimal(18, 2)), 5, 1, 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105344A76D1B1]    Script Date: 22/6/2023 9:34:40 AM ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D105341B8AE309]    Script Date: 22/6/2023 9:34:40 AM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [HelpfulVotes]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [UnhelpfulVotes]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [RatingStars]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [AverageRating]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[CommentVotes]  WITH CHECK ADD FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
ALTER TABLE [dbo].[CommentVotes]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([BrandID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[TestDriveRegistrations]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[TestDriveRegistrations]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
USE [master]
GO
ALTER DATABASE [PRN231PROJECT] SET  READ_WRITE 
GO
