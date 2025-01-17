USE [master]
GO
/****** Object:  Database [MantenimientoElectronicos]    Script Date: 13/11/2024 11:55:30 ******/
CREATE DATABASE [MantenimientoElectronicos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MantenimientoElectronicos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MantenimientoElectronicos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MantenimientoElectronicos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MantenimientoElectronicos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MantenimientoElectronicos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MantenimientoElectronicos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MantenimientoElectronicos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ARITHABORT OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MantenimientoElectronicos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MantenimientoElectronicos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MantenimientoElectronicos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MantenimientoElectronicos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET RECOVERY FULL 
GO
ALTER DATABASE [MantenimientoElectronicos] SET  MULTI_USER 
GO
ALTER DATABASE [MantenimientoElectronicos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MantenimientoElectronicos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MantenimientoElectronicos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MantenimientoElectronicos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MantenimientoElectronicos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MantenimientoElectronicos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MantenimientoElectronicos', N'ON'
GO
ALTER DATABASE [MantenimientoElectronicos] SET QUERY_STORE = ON
GO
ALTER DATABASE [MantenimientoElectronicos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MantenimientoElectronicos]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[TecnicoID] [int] NULL,
	[FechaAsignacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesReparacion]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesReparacion](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[ReparacionID] [int] NULL,
	[Descripcion] [varchar](200) NULL,
	[FechaInicio] [varchar](40) NULL,
	[FechaFin] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[EquipoID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEquipo] [varchar](100) NULL,
	[Modelo] [varchar](100) NULL,
	[UsuarioID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EquipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[ReparacionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipoID] [int] NULL,
	[FechaSolicitud] [varchar](40) NULL,
	[Estado] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReparacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnicos]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnicos](
	[TecnicoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](70) NULL,
	[Especialidad] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TecnicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/11/2024 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Telefono] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] ON 

INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (1, 1, 1, N'13 noviembre 2024')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (2, 2, 2, N'07 noviembre 2024')
INSERT [dbo].[Asignaciones] ([AsignacionID], [ReparacionID], [TecnicoID], [FechaAsignacion]) VALUES (3, 3, 3, N'11 de noviembre')
SET IDENTITY_INSERT [dbo].[Asignaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesReparacion] ON 

INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (1, 1, N'No enfria correctamente', N'13 noviembre 2024', N'17 de noviembre')
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (2, 2, N'No enciende', N'07 noviembre 2024', N'10 de noviembre')
INSERT [dbo].[DetallesReparacion] ([DetalleID], [ReparacionID], [Descripcion], [FechaInicio], [FechaFin]) VALUES (3, 3, N'Pantalla quebrada y no enciende', N'12 noviembre 2024', N'15 de noviembre')
SET IDENTITY_INSERT [dbo].[DetallesReparacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (1, N'Electrodomestico', N'Samsung', 1)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (2, N'Televisor Inteligente', N'Skyworth', 2)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (3, N'Dispositivo Movil', N'Apple', 3)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (4, N'Electrodomestico', N'Samsung', 1)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (5, N'Televisor Inteligente', N'Skyworth', 2)
INSERT [dbo].[Equipos] ([EquipoID], [TipoEquipo], [Modelo], [UsuarioID]) VALUES (6, N'Dispositivo Movil', N'Apple', 3)
SET IDENTITY_INSERT [dbo].[Equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[Reparaciones] ON 

INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (1, 1, N'12 noviembre 2024', N'pendiente')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (2, 2, N'11 de noviembre de 2024', N'en proceso')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (3, 3, N'10 noviembre 2024', N'en proceso')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (4, 1, N'12 noviembre 2024', N'pendiente')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (5, 2, N'05 noviembre 2024', N'arreglado')
INSERT [dbo].[Reparaciones] ([ReparacionID], [EquipoID], [FechaSolicitud], [Estado]) VALUES (6, 3, N'10 noviembre 2024', N'en proceso')
SET IDENTITY_INSERT [dbo].[Reparaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Tecnicos] ON 

INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (1, N'Axel', N'Electrodomesticos')
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (2, N'Mario', N'Televisores')
INSERT [dbo].[Tecnicos] ([TecnicoID], [Nombre], [Especialidad]) VALUES (3, N'Paula', N'Dispositivos moviles')
SET IDENTITY_INSERT [dbo].[Tecnicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (1, N'Fiorella', N'fiorella0909@gmail.com', N'8778 6447')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (2, N'Maria', N'maria123@gmail.com', N'7658 4536')
INSERT [dbo].[Usuarios] ([UsuarioID], [Nombre], [CorreoElectronico], [Telefono]) VALUES (3, N'Ana', N'anamr90@gmail.com', N'8329 0201')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indice1]    Script Date: 13/11/2024 11:55:30 ******/
CREATE NONCLUSTERED INDEX [indice1] ON [dbo].[Equipos]
(
	[Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([TecnicoID])
REFERENCES [dbo].[Tecnicos] ([TecnicoID])
GO
ALTER TABLE [dbo].[DetallesReparacion]  WITH CHECK ADD FOREIGN KEY([ReparacionID])
REFERENCES [dbo].[Reparaciones] ([ReparacionID])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD FOREIGN KEY([EquipoID])
REFERENCES [dbo].[Equipos] ([EquipoID])
GO
USE [master]
GO
ALTER DATABASE [MantenimientoElectronicos] SET  READ_WRITE 
GO
