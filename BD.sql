USE [master]
GO
/****** Object:  Database [Sistecom]    Script Date: 1/03/2022 15:05:59 ******/
CREATE DATABASE [Sistecom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sistecom', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistecom.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sistecom_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sistecom_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sistecom] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sistecom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sistecom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sistecom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sistecom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sistecom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sistecom] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sistecom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sistecom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sistecom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sistecom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sistecom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sistecom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sistecom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sistecom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sistecom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sistecom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sistecom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sistecom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sistecom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sistecom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sistecom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sistecom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sistecom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sistecom] SET RECOVERY FULL 
GO
ALTER DATABASE [Sistecom] SET  MULTI_USER 
GO
ALTER DATABASE [Sistecom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sistecom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sistecom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sistecom] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sistecom] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sistecom] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sistecom', N'ON'
GO
ALTER DATABASE [Sistecom] SET QUERY_STORE = OFF
GO
USE [Sistecom]
GO
/****** Object:  Table [dbo].[article]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[idarticle] [int] IDENTITY(1,1) NOT NULL,
	[idcategory] [int] NOT NULL,
	[bar_code] [varchar](50) NULL,
	[sku_code] [varchar](50) NULL,
	[product_name] [varchar](100) NOT NULL,
	[supplier_code] [varchar](50) NULL,
	[supplier] [varchar](50) NULL,
	[product_description] [varchar](256) NULL,
	[purchase_price] [decimal](11, 2) NOT NULL,
	[unit_measure] [varchar](50) NULL,
	[tax] [decimal](11, 2) NOT NULL,
	[sale_price] [decimal](11, 2) NULL,
	[classification_product] [varchar](50) NOT NULL,
	[invoice_number] [varchar](50) NOT NULL,
	[maximum_product] [int] NOT NULL,
	[registration_date] [date] NOT NULL,
	[condicion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idarticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[product_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[idcategory] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description_category] [varchar](256) NULL,
	[registration_date] [date] NOT NULL,
	[condition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income](
	[idincome] [int] IDENTITY(1,1) NOT NULL,
	[idsupplier] [int] NOT NULL,
	[iduser] [int] NOT NULL,
	[invoice_number] [varchar](20) NOT NULL,
	[registration_date] [date] NULL,
	[tax] [decimal](11, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[income_statement] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idincome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income_detail]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income_detail](
	[idincome_detail] [int] IDENTITY(1,1) NOT NULL,
	[idincome] [int] NOT NULL,
	[idarticle] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[income_description] [varchar](100) NULL,
	[sku_code] [varchar](50) NULL,
	[price] [decimal](11, 2) NOT NULL,
	[unit_measure] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idincome_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcaje]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcaje](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
	[DateM] [date] NULL,
	[EntryTime] [datetime2](7) NOT NULL,
	[DepartureTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Marcaje] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[idperson] [int] IDENTITY(1,1) NOT NULL,
	[type_person] [varchar](20) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[second_name] [varchar](100) NOT NULL,
	[first_surname] [varchar](100) NOT NULL,
	[second_surname] [varchar](100) NOT NULL,
	[dpi] [varchar](100) NOT NULL,
	[document_type] [varchar](20) NULL,
	[address_person] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idperson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[rol_name] [varchar](30) NOT NULL,
	[rol_descripcion] [varchar](100) NULL,
	[condition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale](
	[idsale] [int] IDENTITY(1,1) NOT NULL,
	[idclient] [int] NOT NULL,
	[iduser] [int] NOT NULL,
	[invoice_series] [varchar](7) NULL,
	[invoice_number] [varchar](10) NOT NULL,
	[date_hour] [datetime] NOT NULL,
	[tax] [decimal](4, 2) NOT NULL,
	[total] [decimal](11, 2) NOT NULL,
	[status_sale] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idsale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_detail]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_detail](
	[idsale_detail] [int] IDENTITY(1,1) NOT NULL,
	[idsale] [int] NOT NULL,
	[idarticle] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](11, 2) NOT NULL,
	[discount] [decimal](11, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idsale_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/03/2022 15:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[idrol] [int] NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[second_name] [varchar](100) NOT NULL,
	[first_surname] [varchar](100) NOT NULL,
	[second_surname] [varchar](100) NOT NULL,
	[document_type] [varchar](20) NULL,
	[dpi] [varchar](20) NULL,
	[address_user] [varchar](70) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[password_hash] [varbinary](1) NOT NULL,
	[password_salt] [varbinary](1) NOT NULL,
	[condition] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[article] ADD  DEFAULT ((1)) FOR [condicion]
GO
ALTER TABLE [dbo].[category] ADD  DEFAULT ((1)) FOR [condition]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [condition]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [condition]
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([idcategory])
REFERENCES [dbo].[category] ([idcategory])
GO
ALTER TABLE [dbo].[income]  WITH CHECK ADD FOREIGN KEY([idsupplier])
REFERENCES [dbo].[person] ([idperson])
GO
ALTER TABLE [dbo].[income]  WITH CHECK ADD FOREIGN KEY([iduser])
REFERENCES [dbo].[users] ([iduser])
GO
ALTER TABLE [dbo].[income_detail]  WITH CHECK ADD FOREIGN KEY([idarticle])
REFERENCES [dbo].[article] ([idarticle])
GO
ALTER TABLE [dbo].[income_detail]  WITH CHECK ADD FOREIGN KEY([idincome])
REFERENCES [dbo].[income] ([idincome])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD FOREIGN KEY([idclient])
REFERENCES [dbo].[person] ([idperson])
GO
ALTER TABLE [dbo].[sale]  WITH CHECK ADD FOREIGN KEY([iduser])
REFERENCES [dbo].[users] ([iduser])
GO
ALTER TABLE [dbo].[sale_detail]  WITH CHECK ADD FOREIGN KEY([idarticle])
REFERENCES [dbo].[article] ([idarticle])
GO
ALTER TABLE [dbo].[sale_detail]  WITH CHECK ADD FOREIGN KEY([idsale])
REFERENCES [dbo].[sale] ([idsale])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
USE [master]
GO
ALTER DATABASE [Sistecom] SET  READ_WRITE 
GO
