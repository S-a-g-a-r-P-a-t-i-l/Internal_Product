USE [master]
GO
/****** Object:  Database [ChemicalReportsDB]    Script Date: 09-04-2025 05:56:51 ******/
CREATE DATABASE [ChemicalReportsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChemicalReportsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ChemicalReportsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChemicalReportsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ChemicalReportsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ChemicalReportsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChemicalReportsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChemicalReportsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ChemicalReportsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChemicalReportsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChemicalReportsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChemicalReportsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChemicalReportsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChemicalReportsDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChemicalReportsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChemicalReportsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChemicalReportsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChemicalReportsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChemicalReportsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChemicalReportsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ChemicalReportsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ChemicalReportsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ChemicalReportsDB]
GO
/****** Object:  Table [dbo].[COAReports]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COAReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[IsExternal] [bit] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[BatchNo] [nvarchar](100) NULL,
	[TestParameters] [nvarchar](1000) NULL,
	[Results] [nvarchar](1000) NULL,
	[ApprovedByUserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MSDSReports]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSDSReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Hazards] [nvarchar](1000) NULL,
	[HandlingAndStorage] [nvarchar](1000) NULL,
	[ExposureControls] [nvarchar](1000) NULL,
	[StabilityAndReactivity] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductLabels]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLabels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[LabelText] [nvarchar](1000) NULL,
	[Barcode] [nvarchar](100) NULL,
	[PrintDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Manufacturer] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09-04-2025 05:56:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COAReports] ON 
GO
INSERT [dbo].[COAReports] ([Id], [ProductId], [IsExternal], [CustomerName], [BatchNo], [TestParameters], [Results], [ApprovedByUserId], [CreatedDate]) VALUES (1, 1, 0, NULL, N'BATCH-AC-001', N'Purity, Color, pH', N'99.5%, Clear, 7.0', 2, CAST(N'2025-04-06T17:46:40.633' AS DateTime))
GO
INSERT [dbo].[COAReports] ([Id], [ProductId], [IsExternal], [CustomerName], [BatchNo], [TestParameters], [Results], [ApprovedByUserId], [CreatedDate]) VALUES (2, 2, 1, N'Global Pharma Inc.', N'ETH-2024-08', N'Purity, Density, Odor', N'96%, 0.789 g/cm³, Neutral', 3, CAST(N'2025-04-06T17:46:40.633' AS DateTime))
GO
INSERT [dbo].[COAReports] ([Id], [ProductId], [IsExternal], [CustomerName], [BatchNo], [TestParameters], [Results], [ApprovedByUserId], [CreatedDate]) VALUES (3, 3, 1, N'BioClean Pvt Ltd.', N'HP-2024-05', N'Concentration, Appearance', N'35%, Colorless', 2, CAST(N'2025-04-06T17:46:40.633' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[COAReports] OFF
GO
SET IDENTITY_INSERT [dbo].[MSDSReports] ON 
GO
INSERT [dbo].[MSDSReports] ([Id], [ProductId], [Hazards], [HandlingAndStorage], [ExposureControls], [StabilityAndReactivity], [CreatedDate]) VALUES (1, 1, N'Highly flammable liquid and vapor.', N'Store in cool, dry place. Avoid ignition sources.', N'Wear gloves, goggles, and respirator.', N'Stable under normal conditions.', CAST(N'2025-04-06T17:46:40.630' AS DateTime))
GO
INSERT [dbo].[MSDSReports] ([Id], [ProductId], [Hazards], [HandlingAndStorage], [ExposureControls], [StabilityAndReactivity], [CreatedDate]) VALUES (2, 2, N'Flammable. Can cause eye and skin irritation.', N'Keep container tightly closed. Store below 25°C.', N'Ensure ventilation. Use eye protection.', N'Can decompose with heat.', CAST(N'2025-04-06T17:46:40.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MSDSReports] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductLabels] ON 
GO
INSERT [dbo].[ProductLabels] ([Id], [ProductId], [LabelText], [Barcode], [PrintDate]) VALUES (1, 1, N'Acetone - Flammable Liquid. Handle with care.', N'ACET0012024', CAST(N'2025-04-06T17:46:40.637' AS DateTime))
GO
INSERT [dbo].[ProductLabels] ([Id], [ProductId], [LabelText], [Barcode], [PrintDate]) VALUES (2, 2, N'Ethanol - For External Use Only. Highly Flammable.', N'ETH0022024', CAST(N'2025-04-06T17:46:40.637' AS DateTime))
GO
INSERT [dbo].[ProductLabels] ([Id], [ProductId], [LabelText], [Barcode], [PrintDate]) VALUES (3, 3, N'Hydrogen Peroxide - Store in cool place. Avoid light.', N'HP0032024', CAST(N'2025-04-06T17:46:40.637' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductLabels] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Code], [Description], [Manufacturer], [CreatedDate]) VALUES (1, N'Acetone', N'CHEM-001', N'Solvent for cleaning and lab use', N'ChemCorp', CAST(N'2025-04-06T17:46:40.623' AS DateTime))
GO
INSERT [dbo].[Products] ([Id], [Name], [Code], [Description], [Manufacturer], [CreatedDate]) VALUES (2, N'Ethanol', N'CHEM-002', N'Used in sanitizers and lab processes', N'LabMeds Ltd.', CAST(N'2025-04-06T17:46:40.623' AS DateTime))
GO
INSERT [dbo].[Products] ([Id], [Name], [Code], [Description], [Manufacturer], [CreatedDate]) VALUES (3, N'Hydrogen Peroxide', N'CHEM-003', N'Oxidizer and disinfectant', N'Oxidyne Chemicals', CAST(N'2025-04-06T17:46:40.623' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([Id], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[UserRoles] ([Id], [RoleName]) VALUES (2, N'Quality')
GO
INSERT [dbo].[UserRoles] ([Id], [RoleName]) VALUES (3, N'User')
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Name], [Email], [PasswordHash], [RoleId]) VALUES (1, N'Admin User', N'admin@example.com', N'hashed123', 1)
GO
INSERT [dbo].[Users] ([Id], [Name], [Email], [PasswordHash], [RoleId]) VALUES (2, N'Dr. Smith', N'smith@example.com', N'hashed456', 2)
GO
INSERT [dbo].[Users] ([Id], [Name], [Email], [PasswordHash], [RoleId]) VALUES (3, N'Dr. Emily Stone', N'emily@example.com', N'hashed789', 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [ChemicalReportsDB] SET  READ_WRITE 
GO
