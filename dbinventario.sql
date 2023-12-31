USE [master]
GO
/****** Object:  Database [dbinventario]    Script Date: 21/8/2023 11:33:59 p. m. ******/
CREATE DATABASE [dbinventario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbinventario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbinventario.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbinventario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\dbinventario_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbinventario] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbinventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbinventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbinventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbinventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbinventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbinventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbinventario] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbinventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbinventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbinventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbinventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbinventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbinventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbinventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbinventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbinventario] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbinventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbinventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbinventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbinventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbinventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbinventario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbinventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbinventario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbinventario] SET  MULTI_USER 
GO
ALTER DATABASE [dbinventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbinventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbinventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbinventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbinventario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbinventario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbinventario] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbinventario] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbinventario]
GO
/****** Object:  User [juniorgcv]    Script Date: 21/8/2023 11:34:00 p. m. ******/
CREATE USER [juniorgcv] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[IdMarca] [int] NULL,
	[IdMedida] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[StockMin] [decimal](10, 2) NULL,
	[StockMax] [decimal](10, 2) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UndadMedidas]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UndadMedidas](
	[IdMedida] [int] IDENTITY(1,1) NOT NULL,
	[BreviaturaMedida] [varchar](5) NULL,
	[Descripicion] [varchar](50) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_UndadMedidas] PRIMARY KEY CLUSTERED 
(
	[IdMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (1, N'Abarrotes', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (2, N'Articulos de limpieza', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (3, N'Articuos de hiegene perzonal', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (4, N'Articulos del hogar', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (5, N'Juguetes', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (6, N'caca', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (7, N'caca', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (8, N'todo', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (9, N'calor', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (10, N'calores', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (11, N'yyyy', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (12, N'fghd', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (13, N'fghd', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (14, N'fghd', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (15, N'fghd', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (16, N'fyyjhf', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (17, N'erert', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (18, N'rfdsgbdrb', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (19, N'ggggtttttt55555', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (20, N'klok', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (21, N'siiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (22, N'fhthy  ertgertg', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (23, N'cuco', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (24, N'rgfggfgr4444t666', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (25, N'dcvdfedfgdege444', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (26, N'Abarrotes', 0)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (27, N'Arroz Bizono', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (28, N'Azucar papagallo', 1)
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Estado]) VALUES (29, N'Leche 2 pinos', 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categoria]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marcas] ([IdMarca])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_UndadMedidas] FOREIGN KEY([IdMedida])
REFERENCES [dbo].[UndadMedidas] ([IdMedida])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_UndadMedidas]
GO
/****** Object:  StoredProcedure [dbo].[EliminarCa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarCa]
@nCodigoca int = 0
as

update Categoria set Estado = 0 where IdCategoria = @nCodigoca;
GO
/****** Object:  StoredProcedure [dbo].[EliminarMa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarMa]
@nCodigoma int = 0
as

update Marcas set Estado = 0 where IdMarca = @nCodigoma;
GO
/****** Object:  StoredProcedure [dbo].[GuardaCa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GuardaCa]
@nOpcion int = 0,
@nCodigoca int = 0,
@cDescripcion varchar(50)=''
as
if @nOpcion=1 --nuevo registro
begin
insert into Categoria(Descripcion,Estado) values(@cDescripcion,1);
end;
else -- Actualizar resgistro
begin
update Categoria set Descripcion = @cDescripcion where IdCategoria = @nCodigoca;
end;
GO
/****** Object:  StoredProcedure [dbo].[GuardaMa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GuardaMa]
@nOpcion int = 0,
@nCodigoma int = 0,
@cDescripcion varchar(50)=''
as
if @nOpcion=1 --nuevo registro
begin
insert into Marcas(Descripcion,Estado) values(@cDescripcion,1);
end;
else -- Actualizar resgistro
begin
update Marcas set Descripcion = @cDescripcion where IdMarca = @nCodigoma;
end;
GO
/****** Object:  StoredProcedure [dbo].[ListarCa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarCa]
@cTexto varchar(100)= ''
as
select IdCategoria, Descripcion
from Categoria
where Estado = 1 and 
UPPER(trim(CAST(IdCategoria as char))+trim(Descripcion)) like '%'+upper(TRIM(@cTexto))+'%';
GO
/****** Object:  StoredProcedure [dbo].[ListarMa]    Script Date: 21/8/2023 11:34:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListarMa]
@cTexto varchar(50)= ''
as
select IdMarca, Descripcion
from [dbo].[Marcas]
where Estado = 1 and 
UPPER(trim(CAST(IdMarca as char))+trim(Descripcion)) like '%'+upper(TRIM(@cTexto))+'%';
GO
USE [master]
GO
ALTER DATABASE [dbinventario] SET  READ_WRITE 
GO
