USE [master]
GO
/****** Object:  Database [SydvästMedMer]    Script Date: 2018-08-30 16:08:59 ******/
CREATE DATABASE [SydvästMedMer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BestStore', FILENAME = N'C:\Users\Administrator\BestStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BestStore_log', FILENAME = N'C:\Users\Administrator\BestStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SydvästMedMer] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SydvästMedMer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SydvästMedMer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SydvästMedMer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SydvästMedMer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SydvästMedMer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SydvästMedMer] SET ARITHABORT OFF 
GO
ALTER DATABASE [SydvästMedMer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SydvästMedMer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SydvästMedMer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SydvästMedMer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SydvästMedMer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SydvästMedMer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SydvästMedMer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SydvästMedMer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SydvästMedMer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SydvästMedMer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SydvästMedMer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SydvästMedMer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SydvästMedMer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SydvästMedMer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SydvästMedMer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SydvästMedMer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SydvästMedMer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SydvästMedMer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SydvästMedMer] SET  MULTI_USER 
GO
ALTER DATABASE [SydvästMedMer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SydvästMedMer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SydvästMedMer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SydvästMedMer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SydvästMedMer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SydvästMedMer] SET QUERY_STORE = OFF
GO
USE [SydvästMedMer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SydvästMedMer]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gata] [varchar](50) NOT NULL,
	[Nummer] [varchar](50) NOT NULL,
	[Postnummer] [varchar](50) NOT NULL,
	[Ort] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anställd]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anställd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Chef] [int] NULL,
	[ButikId] [int] NULL,
 CONSTRAINT [PK_Anställd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Betalning]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Betalning](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BetalningsmetodId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[FakturaAdressId] [int] NOT NULL,
 CONSTRAINT [PK_Betalning] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Betalningsmetod]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Betalningsmetod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Betalningsmetod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Butik]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butik](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[AdressId] [int] NOT NULL,
 CONSTRAINT [PK_Butik] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Färg]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Färg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Färg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kund]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kund](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[KundNivåId] [int] NOT NULL,
 CONSTRAINT [PK_Kund] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KundNivå]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KundNivå](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[Poäng] [int] NOT NULL,
	[Rabatt] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_KundNivå] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lager]    Script Date: 2018-08-30 16:09:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[AdressId] [int] NOT NULL,
 CONSTRAINT [PK_Lager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leverantör]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leverantör](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[AdressId] [int] NOT NULL,
	[KontaktPersonId] [int] NULL,
 CONSTRAINT [PK_Leverantör] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Märke]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Märke](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Märke] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KundId] [int] NOT NULL,
	[AnställdId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Förnamn] [varchar](50) NULL,
	[Efternamn] [varchar](50) NULL,
	[Personnummer] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Mobilnummer] [int] NULL,
	[AdressId] [int] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkt]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[LeverantörId] [int] NOT NULL,
	[MärkeId] [int] NOT NULL,
	[TypId] [int] NOT NULL,
	[FärgId] [int] NOT NULL,
	[ButikId] [int] NULL,
	[LagerId] [int] NULL,
	[StorleksId] [int] NOT NULL,
	[Inköpspris] [decimal](18, 2) NOT NULL,
	[Försäljningsfaktor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Produkt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProdukterIOrder]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProdukterIOrder](
	[ProduktId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_ProdukterIOrder] PRIMARY KEY CLUSTERED 
(
	[ProduktId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Storlek]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storlek](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Storlek] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Typ]    Script Date: 2018-08-30 16:09:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Namn] [varchar](50) NOT NULL,
	[KategoriId] [int] NOT NULL,
 CONSTRAINT [PK_Typ_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (1, N'Sveavägen', N'5', N'255 65', N'Kista')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (2, N'Hallonvägen', N'7', N'526 97', N'Linköping')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (3, N'Vintergatan', N'78', N'892 54', N'Göteborg')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (4, N'Jordgubbsgatan', N'10', N'123 45', N'Stockholm')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (5, N'Rosmarinvägen', N'159', N'258 95', N'Storvreta')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (6, N'Salviavägen', N'98', N'657 89', N'Storvreta')
INSERT [dbo].[Adress] ([Id], [Gata], [Nummer], [Postnummer], [Ort]) VALUES (7, N'Ringvägen', N'54', N'842 42', N'Hudiksvall')
SET IDENTITY_INSERT [dbo].[Adress] OFF
SET IDENTITY_INSERT [dbo].[Anställd] ON 

INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (2, 1, NULL, 1)
INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (5, 2, 2, 2)
INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (6, 3, 5, 3)
INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (7, 4, 6, 4)
INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (8, 5, 7, 1)
INSERT [dbo].[Anställd] ([Id], [PersonId], [Chef], [ButikId]) VALUES (9, 6, 7, 2)
SET IDENTITY_INSERT [dbo].[Anställd] OFF
SET IDENTITY_INSERT [dbo].[Betalningsmetod] ON 

INSERT [dbo].[Betalningsmetod] ([Id], [Namn]) VALUES (1, N'Kort')
INSERT [dbo].[Betalningsmetod] ([Id], [Namn]) VALUES (2, N'Konstant')
INSERT [dbo].[Betalningsmetod] ([Id], [Namn]) VALUES (3, N'Faktura')
SET IDENTITY_INSERT [dbo].[Betalningsmetod] OFF
SET IDENTITY_INSERT [dbo].[Butik] ON 

INSERT [dbo].[Butik] ([Id], [Namn], [AdressId]) VALUES (1, N'Sydväst m.m I Stockholm', 4)
INSERT [dbo].[Butik] ([Id], [Namn], [AdressId]) VALUES (2, N'Sydväst m.m I Storvreta', 5)
INSERT [dbo].[Butik] ([Id], [Namn], [AdressId]) VALUES (3, N'Sydväst m.m I Storvreta2', 6)
INSERT [dbo].[Butik] ([Id], [Namn], [AdressId]) VALUES (4, N'Sydväst m.m I Hudiksvall', 7)
SET IDENTITY_INSERT [dbo].[Butik] OFF
SET IDENTITY_INSERT [dbo].[Färg] ON 

INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (1, N'Svart')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (2, N'Vit')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (3, N'Röd')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (4, N'Rosa')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (5, N'Grön')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (6, N'Blå')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (7, N'Grå')
INSERT [dbo].[Färg] ([Id], [Namn]) VALUES (8, N'Gul')
SET IDENTITY_INSERT [dbo].[Färg] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([Id], [Namn]) VALUES (1, N'Överdel')
INSERT [dbo].[Kategori] ([Id], [Namn]) VALUES (2, N'Underdel')
INSERT [dbo].[Kategori] ([Id], [Namn]) VALUES (3, N'Skor')
INSERT [dbo].[Kategori] ([Id], [Namn]) VALUES (4, N'Underkläder')
INSERT [dbo].[Kategori] ([Id], [Namn]) VALUES (5, N'Accessoarer')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Kund] ON 

INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (1, 1, 1)
INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (2, 2, 1)
INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (3, 3, 2)
INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (4, 4, 1)
INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (5, 5, 3)
INSERT [dbo].[Kund] ([Id], [PersonId], [KundNivåId]) VALUES (6, 6, 4)
SET IDENTITY_INSERT [dbo].[Kund] OFF
SET IDENTITY_INSERT [dbo].[KundNivå] ON 

INSERT [dbo].[KundNivå] ([Id], [Namn], [Poäng], [Rabatt]) VALUES (1, N'Standard', 0, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[KundNivå] ([Id], [Namn], [Poäng], [Rabatt]) VALUES (2, N'Brons', 500, CAST(0.05 AS Decimal(18, 2)))
INSERT [dbo].[KundNivå] ([Id], [Namn], [Poäng], [Rabatt]) VALUES (3, N'Silver', 1000, CAST(0.10 AS Decimal(18, 2)))
INSERT [dbo].[KundNivå] ([Id], [Namn], [Poäng], [Rabatt]) VALUES (4, N'Guld', 2000, CAST(0.15 AS Decimal(18, 2)))
INSERT [dbo].[KundNivå] ([Id], [Namn], [Poäng], [Rabatt]) VALUES (5, N'Platina', 5000, CAST(0.20 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[KundNivå] OFF
SET IDENTITY_INSERT [dbo].[Lager] ON 

INSERT [dbo].[Lager] ([Id], [Namn], [AdressId]) VALUES (1, N'Kista', 1)
INSERT [dbo].[Lager] ([Id], [Namn], [AdressId]) VALUES (2, N'Linköping', 2)
INSERT [dbo].[Lager] ([Id], [Namn], [AdressId]) VALUES (3, N'Göteborg', 3)
SET IDENTITY_INSERT [dbo].[Lager] OFF
SET IDENTITY_INSERT [dbo].[Leverantör] ON 

INSERT [dbo].[Leverantör] ([Id], [Namn], [AdressId], [KontaktPersonId]) VALUES (1, N'Klädgrossisten i Göteborg', 3, 5)
INSERT [dbo].[Leverantör] ([Id], [Namn], [AdressId], [KontaktPersonId]) VALUES (2, N'Pelles Skor', 2, 6)
INSERT [dbo].[Leverantör] ([Id], [Namn], [AdressId], [KontaktPersonId]) VALUES (4, N'Sydväst Store', 1, 1)
SET IDENTITY_INSERT [dbo].[Leverantör] OFF
SET IDENTITY_INSERT [dbo].[Märke] ON 

INSERT [dbo].[Märke] ([Id], [Namn]) VALUES (1, N'Versace')
INSERT [dbo].[Märke] ([Id], [Namn]) VALUES (2, N'Adidas')
INSERT [dbo].[Märke] ([Id], [Namn]) VALUES (3, N'Reebok')
INSERT [dbo].[Märke] ([Id], [Namn]) VALUES (4, N'Tiger of Sweden')
SET IDENTITY_INSERT [dbo].[Märke] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (1, 1, 8)
INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (4, 2, 5)
INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (5, 3, 6)
INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (6, 4, 7)
INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (8, 1, 2)
INSERT [dbo].[Order] ([Id], [KundId], [AnställdId]) VALUES (11, 5, 9)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (1, N'Astrid', N'Rehnström', N'9203194205', N'astrid.rehnstrom@gmail.com', 730937971, 2)
INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (2, N'Sofia', N'Ruthberg', N'9005265146', N'sofia.ruthberg@gmail.com', 76098880, 1)
INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (3, N'Johan', N'Sjögren', N'8202091111', N'johan.sjogren@gmail.com', 707895216, 3)
INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (4, N'Boris', N'Bumbic', N'9103310497', N'boris.bumbic@gmail.com', 769845689, 2)
INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (5, N'Sara', N'Larsson', N'9806165289', N'sara.l@gmail.com', 708956968, 3)
INSERT [dbo].[Person] ([Id], [Förnamn], [Efternamn], [Personnummer], [Email], [Mobilnummer], [AdressId]) VALUES (6, N'Fredrik', N'Pettersson', N'5608206459', N'fredrik.p@hotmail.com', 735689899, 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Produkt] ON 

INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (1, N'Iggy', 1, 4, 1, 1, 1, NULL, 1, CAST(899.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (2, N'Iggy', 1, 4, 1, 1, 1, NULL, 2, CAST(899.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (3, N'Iggy', 1, 4, 1, 1, NULL, 1, 3, CAST(899.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (4, N'Linne', 1, 1, 13, 2, 1, NULL, 1, CAST(199.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (5, N'Linne', 1, 1, 13, 2, 1, NULL, 2, CAST(199.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (6, N'Linne', 1, 1, 13, 2, NULL, 2, 3, CAST(199.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (7, N'Skjorta', 1, 1, 5, 4, NULL, 3, 2, CAST(499.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (8, N'Skjorta', 1, 1, 5, 5, 2, NULL, 3, CAST(499.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (11, N'Shorts', 1, 2, 3, 5, 3, NULL, 1, CAST(249.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (12, N'Shorts', 1, 2, 3, 6, 1, NULL, 2, CAST(249.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (15, N'Sneakers', 2, 3, 7, 3, 2, NULL, 12, CAST(1299.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (16, N'Sneakers', 2, 3, 7, 7, 4, NULL, 11, CAST(1299.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (17, N'Sneakers', 2, 2, 7, 4, NULL, 1, 3, CAST(1299.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (19, N'Sydväst', 4, 4, 8, 4, 3, NULL, 2, CAST(2999.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (20, N'Sydväst', 4, 4, 8, 1, 3, NULL, 1, CAST(2999.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[Produkt] ([Id], [Namn], [LeverantörId], [MärkeId], [TypId], [FärgId], [ButikId], [LagerId], [StorleksId], [Inköpspris], [Försäljningsfaktor]) VALUES (21, N'Sydväst', 4, 4, 8, 3, 2, NULL, 3, CAST(2999.00 AS Decimal(18, 2)), CAST(1.20 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Produkt] OFF
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (1, 1)
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (2, 1)
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (4, 8)
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (6, 4)
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (8, 4)
INSERT [dbo].[ProdukterIOrder] ([ProduktId], [OrderId]) VALUES (21, 8)
SET IDENTITY_INSERT [dbo].[Storlek] ON 

INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (1, N'Small')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (2, N'Medium')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (3, N'Large')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (4, N'36')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (5, N'37')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (6, N'38')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (7, N'39')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (8, N'40')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (9, N'41')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (10, N'42')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (11, N'43')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (12, N'44')
INSERT [dbo].[Storlek] ([ID], [Namn]) VALUES (13, N'45')
SET IDENTITY_INSERT [dbo].[Storlek] OFF
SET IDENTITY_INSERT [dbo].[Typ] ON 

INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (1, N'Jeans', 2)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (2, N'T-shirt', 1)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (3, N'Shorts', 2)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (4, N'Blus', 1)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (5, N'Skjorta', 1)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (6, N'Gummistövlar', 3)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (7, N'Sneakers', 3)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (8, N'Sydväst', 5)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (9, N'Keps', 5)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (10, N'Sjal', 5)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (11, N'Vantar', 5)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (12, N'Strumpor', 4)
INSERT [dbo].[Typ] ([Id], [Namn], [KategoriId]) VALUES (13, N'Topp', 1)
SET IDENTITY_INSERT [dbo].[Typ] OFF
ALTER TABLE [dbo].[Anställd]  WITH CHECK ADD  CONSTRAINT [FK_Anställd_Anställd1] FOREIGN KEY([Chef])
REFERENCES [dbo].[Anställd] ([Id])
GO
ALTER TABLE [dbo].[Anställd] CHECK CONSTRAINT [FK_Anställd_Anställd1]
GO
ALTER TABLE [dbo].[Anställd]  WITH CHECK ADD  CONSTRAINT [FK_Anställd_Butik] FOREIGN KEY([ButikId])
REFERENCES [dbo].[Butik] ([Id])
GO
ALTER TABLE [dbo].[Anställd] CHECK CONSTRAINT [FK_Anställd_Butik]
GO
ALTER TABLE [dbo].[Anställd]  WITH CHECK ADD  CONSTRAINT [FK_Anställd_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Anställd] CHECK CONSTRAINT [FK_Anställd_Person]
GO
ALTER TABLE [dbo].[Betalning]  WITH CHECK ADD  CONSTRAINT [FK_Betalning_Adress] FOREIGN KEY([FakturaAdressId])
REFERENCES [dbo].[Adress] ([Id])
GO
ALTER TABLE [dbo].[Betalning] CHECK CONSTRAINT [FK_Betalning_Adress]
GO
ALTER TABLE [dbo].[Betalning]  WITH CHECK ADD  CONSTRAINT [FK_Betalning_Betalningsmetod] FOREIGN KEY([BetalningsmetodId])
REFERENCES [dbo].[Betalningsmetod] ([Id])
GO
ALTER TABLE [dbo].[Betalning] CHECK CONSTRAINT [FK_Betalning_Betalningsmetod]
GO
ALTER TABLE [dbo].[Betalning]  WITH CHECK ADD  CONSTRAINT [FK_Betalning_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Betalning] CHECK CONSTRAINT [FK_Betalning_Order]
GO
ALTER TABLE [dbo].[Butik]  WITH CHECK ADD  CONSTRAINT [FK_Butik_Adress] FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adress] ([Id])
GO
ALTER TABLE [dbo].[Butik] CHECK CONSTRAINT [FK_Butik_Adress]
GO
ALTER TABLE [dbo].[Kund]  WITH CHECK ADD  CONSTRAINT [FK_Kund_KundNivå] FOREIGN KEY([KundNivåId])
REFERENCES [dbo].[KundNivå] ([Id])
GO
ALTER TABLE [dbo].[Kund] CHECK CONSTRAINT [FK_Kund_KundNivå]
GO
ALTER TABLE [dbo].[Kund]  WITH CHECK ADD  CONSTRAINT [FK_Kund_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Kund] CHECK CONSTRAINT [FK_Kund_Person]
GO
ALTER TABLE [dbo].[Lager]  WITH CHECK ADD  CONSTRAINT [FK_Lager_Adress] FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adress] ([Id])
GO
ALTER TABLE [dbo].[Lager] CHECK CONSTRAINT [FK_Lager_Adress]
GO
ALTER TABLE [dbo].[Leverantör]  WITH CHECK ADD  CONSTRAINT [FK_Leverantör_Adress] FOREIGN KEY([AdressId])
REFERENCES [dbo].[Adress] ([Id])
GO
ALTER TABLE [dbo].[Leverantör] CHECK CONSTRAINT [FK_Leverantör_Adress]
GO
ALTER TABLE [dbo].[Leverantör]  WITH CHECK ADD  CONSTRAINT [FK_Leverantör_Person] FOREIGN KEY([KontaktPersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Leverantör] CHECK CONSTRAINT [FK_Leverantör_Person]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Anställd1] FOREIGN KEY([AnställdId])
REFERENCES [dbo].[Anställd] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Anställd1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Kund1] FOREIGN KEY([KundId])
REFERENCES [dbo].[Kund] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Kund1]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Butik] FOREIGN KEY([ButikId])
REFERENCES [dbo].[Butik] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Butik]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Färg] FOREIGN KEY([FärgId])
REFERENCES [dbo].[Färg] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Färg]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Lager1] FOREIGN KEY([LagerId])
REFERENCES [dbo].[Lager] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Lager1]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Leverantör] FOREIGN KEY([LeverantörId])
REFERENCES [dbo].[Leverantör] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Leverantör]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Märke] FOREIGN KEY([MärkeId])
REFERENCES [dbo].[Märke] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Märke]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Storlek] FOREIGN KEY([StorleksId])
REFERENCES [dbo].[Storlek] ([ID])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Storlek]
GO
ALTER TABLE [dbo].[Produkt]  WITH CHECK ADD  CONSTRAINT [FK_Produkt_Typ1] FOREIGN KEY([TypId])
REFERENCES [dbo].[Typ] ([Id])
GO
ALTER TABLE [dbo].[Produkt] CHECK CONSTRAINT [FK_Produkt_Typ1]
GO
ALTER TABLE [dbo].[ProdukterIOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProdukterIOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[ProdukterIOrder] CHECK CONSTRAINT [FK_ProdukterIOrder_Order]
GO
ALTER TABLE [dbo].[ProdukterIOrder]  WITH CHECK ADD  CONSTRAINT [FK_ProdukterIOrder_Produkt] FOREIGN KEY([ProduktId])
REFERENCES [dbo].[Produkt] ([Id])
GO
ALTER TABLE [dbo].[ProdukterIOrder] CHECK CONSTRAINT [FK_ProdukterIOrder_Produkt]
GO
ALTER TABLE [dbo].[Typ]  WITH CHECK ADD  CONSTRAINT [FK_Typ_Kategori] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[Typ] CHECK CONSTRAINT [FK_Typ_Kategori]
GO
USE [master]
GO
ALTER DATABASE [SydvästMedMer] SET  READ_WRITE 
GO
