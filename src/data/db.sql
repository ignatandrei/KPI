USE tests
GO
ALTER TABLE [dbo].[County] DROP CONSTRAINT [FK_County_Country]
GO
ALTER TABLE [dbo].[ClientsCounties] DROP CONSTRAINT [FK_ClientsCounties_County]
GO
ALTER TABLE [dbo].[ClientsCounties] DROP CONSTRAINT [FK_ClientsCounties_Clients]
GO
ALTER TABLE [dbo].[ClientsCategory] DROP CONSTRAINT [FK_ClientsCategory_Clients]
GO
ALTER TABLE [dbo].[ClientsCategory] DROP CONSTRAINT [FK_ClientsCategory_Category]
GO
ALTER TABLE [dbo].[AssVAClientsCounties] DROP CONSTRAINT [FK_AssVAClientsCounties_ClientsCounties]
GO
ALTER TABLE [dbo].[AssVAClientsCounties] DROP CONSTRAINT [FK_AssVAClientsCounties_AssVA]
GO
ALTER TABLE [dbo].[AssVA] DROP CONSTRAINT [FK_AssVA_AssVA]
GO
ALTER TABLE [dbo].[ACTPL] DROP CONSTRAINT [FK_ACTPL_AssVAClientsCounties]
GO
/****** Object:  Table [dbo].[County]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[County]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[ClientsCounties]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[ClientsCounties]
GO
/****** Object:  Table [dbo].[ClientsCategory]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[ClientsCategory]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[Clients]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[AssVAClientsCounties]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[AssVAClientsCounties]
GO
/****** Object:  Table [dbo].[AssVA]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[AssVA]
GO
/****** Object:  Table [dbo].[ACTPL]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[ACTPL]
GO
/****** Object:  Table [dbo].[ACTPL]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTPL](
	[IDACTPL] [bigint] IDENTITY(1,1) NOT NULL,
	[IDAssVAClientsCounties] [bigint] NOT NULL,
	[Actual] [money] NOT NULL,
	[Plan] [money] NOT NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_ACTPL] PRIMARY KEY CLUSTERED 
(
	[IDACTPL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssVA]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssVA](
	[IDAssVA] [bigint] IDENTITY(1,1) NOT NULL,
	[ShortNameAssVA] [nvarchar](10) NULL,
	[NameAssVA] [nvarchar](100) NOT NULL,
	[IDManager] [bigint] NULL,
 CONSTRAINT [PK_AssVA] PRIMARY KEY CLUSTERED 
(
	[IDAssVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssVAClientsCounties]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssVAClientsCounties](
	[IDAssVAClientsCounties] [bigint] IDENTITY(1,1) NOT NULL,
	[IDClientsCounties] [bigint] NOT NULL,
	[IDAssVA] [bigint] NOT NULL,
 CONSTRAINT [PK_AssVAClientsCounties] PRIMARY KEY CLUSTERED 
(
	[IDAssVAClientsCounties] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ShortNameCategory] [nvarchar](10) NULL,
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[NameCategory] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[IDClient] [bigint] IDENTITY(1,1) NOT NULL,
	[ShortNameClient] [nvarchar](10) NULL,
	[NameClient] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[IDClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsCategory]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDClient] [bigint] NOT NULL,
	[IDCategory] [int] NOT NULL,
 CONSTRAINT [PK_ClientsCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsCounties]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsCounties](
	[IDClientsCounties] [bigint] IDENTITY(1,1) NOT NULL,
	[IDClient] [bigint] NOT NULL,
	[IDCounty] [bigint] NOT NULL,
 CONSTRAINT [PK_ClientsCounties] PRIMARY KEY CLUSTERED 
(
	[IDClientsCounties] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ShortNameCountry] [nvarchar](10) NOT NULL,
	[IDCountry] [int] IDENTITY(1,1) NOT NULL,
	[NameCountry] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[IDCountry] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[County]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[ShortNameCounty] [nvarchar](10) NOT NULL,
	[IDCounty] [bigint] IDENTITY(1,1) NOT NULL,
	[NameCounty] [nvarchar](100) NULL,
	[IDCountry] [int] NOT NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[IDCounty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTPL]  WITH CHECK ADD  CONSTRAINT [FK_ACTPL_AssVAClientsCounties] FOREIGN KEY([IDAssVAClientsCounties])
REFERENCES [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties])
GO
ALTER TABLE [dbo].[ACTPL] CHECK CONSTRAINT [FK_ACTPL_AssVAClientsCounties]
GO
ALTER TABLE [dbo].[AssVA]  WITH CHECK ADD  CONSTRAINT [FK_AssVA_AssVA] FOREIGN KEY([IDManager])
REFERENCES [dbo].[AssVA] ([IDAssVA])
GO
ALTER TABLE [dbo].[AssVA] CHECK CONSTRAINT [FK_AssVA_AssVA]
GO
ALTER TABLE [dbo].[AssVAClientsCounties]  WITH CHECK ADD  CONSTRAINT [FK_AssVAClientsCounties_AssVA] FOREIGN KEY([IDAssVA])
REFERENCES [dbo].[AssVA] ([IDAssVA])
GO
ALTER TABLE [dbo].[AssVAClientsCounties] CHECK CONSTRAINT [FK_AssVAClientsCounties_AssVA]
GO
ALTER TABLE [dbo].[AssVAClientsCounties]  WITH CHECK ADD  CONSTRAINT [FK_AssVAClientsCounties_ClientsCounties] FOREIGN KEY([IDClientsCounties])
REFERENCES [dbo].[ClientsCounties] ([IDClientsCounties])
GO
ALTER TABLE [dbo].[AssVAClientsCounties] CHECK CONSTRAINT [FK_AssVAClientsCounties_ClientsCounties]
GO
ALTER TABLE [dbo].[ClientsCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClientsCategory_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([IDCategory])
GO
ALTER TABLE [dbo].[ClientsCategory] CHECK CONSTRAINT [FK_ClientsCategory_Category]
GO
ALTER TABLE [dbo].[ClientsCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClientsCategory_Clients] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Clients] ([IDClient])
GO
ALTER TABLE [dbo].[ClientsCategory] CHECK CONSTRAINT [FK_ClientsCategory_Clients]
GO
ALTER TABLE [dbo].[ClientsCounties]  WITH CHECK ADD  CONSTRAINT [FK_ClientsCounties_Clients] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Clients] ([IDClient])
GO
ALTER TABLE [dbo].[ClientsCounties] CHECK CONSTRAINT [FK_ClientsCounties_Clients]
GO
ALTER TABLE [dbo].[ClientsCounties]  WITH CHECK ADD  CONSTRAINT [FK_ClientsCounties_County] FOREIGN KEY([IDCounty])
REFERENCES [dbo].[County] ([IDCounty])
GO
ALTER TABLE [dbo].[ClientsCounties] CHECK CONSTRAINT [FK_ClientsCounties_County]
GO
ALTER TABLE [dbo].[County]  WITH CHECK ADD  CONSTRAINT [FK_County_Country] FOREIGN KEY([IDCountry])
REFERENCES [dbo].[Country] ([IDCountry])
GO
ALTER TABLE [dbo].[County] CHECK CONSTRAINT [FK_County_Country]
GO

GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([ShortNameCountry], [IDCountry], [NameCountry]) VALUES (N'RO', 1, N'Romania')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[County] ON 
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDCountry]) VALUES (N'B', 1, N'Bucuresti', 1)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDCountry]) VALUES (N'AB', 2, N'Alba', 1)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDCountry]) VALUES (N'AR', 3, N'Arad', 1)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDCountry]) VALUES (N'Arges', 4, N'AG', 1)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDCountry]) VALUES (N'Bacau', 5, N'BC', 1)
GO
SET IDENTITY_INSERT [dbo].[County] OFF
GO
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ShortNameCategory], [IDCategory], [NameCategory]) VALUES (N'BG', 1, N'BIG')
GO
INSERT [dbo].[Category] ([ShortNameCategory], [IDCategory], [NameCategory]) VALUES (N'SM', 2, N'SMALL')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (1, N'AR', N'Arabesque')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (2, N'LM', N'Leroy Merlin')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (3, N'DD', N'Dedeman')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (4, N'PK', N'Praktiker')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (5, N'AC', N'Azur Cluj')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (6, N'VT', N'Vega Tehnometal')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (7, N'VC', N'Vemark Construct')
GO
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientsCategory] ON 
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (1, 1, 1)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (2, 2, 1)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (3, 3, 1)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (4, 4, 1)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (5, 5, 2)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (6, 6, 2)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (7, 7, 2)
GO
SET IDENTITY_INSERT [dbo].[ClientsCategory] OFF
GO
USE [tests]
GO
SET IDENTITY_INSERT [dbo].[AssVA] ON 
GO
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (8, N'IW', N'Isaias Worrell  ', NULL)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (9, N'DC', N'Denisse Chadwell  ', NULL)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (10, N'GA', N'Gilberte Albano  ', NULL)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (1, N'BC', N'Bess Conlan  ', 8)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (2, N'RB', N'Reena Burget  ', 9)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (3, N'SB', N'Sanjuanita Bigelow  ', 10)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (4, N'LF', N'Latina Faas  ', 9)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (5, N'IH', N'Iola Hannon  ', 8)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (6, N'NH', N'Nubia Holmgren  ', 10)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (7, N'HS', N'Hwa Speier  ', 8)
SET IDENTITY_INSERT [dbo].[AssVA] OFF
GO
GO
SET IDENTITY_INSERT [dbo].[ClientsCounties] ON 
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (1, 1, 4)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (2, 2, 3)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (3, 1, 5)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (4, 4, 3)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (5, 1, 4)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (6, 6, 3)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (7, 7, 4)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (8, 1, 5)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (9, 2, 5)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (10, 1, 4)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (11, 4, 4)
GO
SET IDENTITY_INSERT [dbo].[ClientsCounties] OFF
GO

GO
SET IDENTITY_INSERT [dbo].[AssVAClientsCounties] ON 
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (1, 1, 8)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (2, 2, 8)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (3, 3, 8)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (4, 4, 9)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (5, 5, 9)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (6, 6, 9)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (7, 7, 10)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (8, 8, 10)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (9, 9, 10)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (10, 10, 10)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (11, 11, 10)
GO
SET IDENTITY_INSERT [dbo].[AssVAClientsCounties] OFF
GO
