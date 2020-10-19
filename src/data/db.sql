ALTER TABLE [dbo].[County] DROP CONSTRAINT [FK_County_Region]
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
/****** Object:  Table [dbo].[Region]    Script Date: 9/24/2020 8:24:23 AM ******/
DROP TABLE [dbo].[Region]
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
/****** Object:  Table [dbo].[Region]    Script Date: 9/24/2020 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[ShortNameRegion] [nvarchar](10) NOT NULL,
	[IDRegion] [int] IDENTITY(1,1) NOT NULL,
	[NameRegion] [nvarchar](100) NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[IDRegion] ASC
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
	[IDRegion] [int] NOT NULL,
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
ALTER TABLE [dbo].[County]  WITH CHECK ADD  CONSTRAINT [FK_County_Region] FOREIGN KEY([IDRegion])
REFERENCES [dbo].[Region] ([IDRegion])
GO
ALTER TABLE [dbo].[County] CHECK CONSTRAINT [FK_County_Region]
GO

GO
SET IDENTITY_INSERT [dbo].[Region] ON 
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'B', 1, N'Bucuresti')
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'RG1', 2, N'Regiunea 1')
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'RG2', 3, N'Regiunea 2')

GO
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[County] ON 
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'B', 1, N'Bucuresti', 1)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'AB', 2, N'Alba', 2)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'AR', 3, N'Arad', 2)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'Arges', 4, N'AG', 2)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'Bacau', 5, N'BC', 2)
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

GO
SET IDENTITY_INSERT [dbo].[AssVA] ON 
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (20, N'RG1', N'Reg Manager1', NULL)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (21, N'RG2', N'Reg Manager2', NULL)

GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (8, N'IW', N'Isaias Worrell', 20)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (9, N'DC', N'Denisse Chadwell', 20)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (10, N'GA', N'Gilberte Albano', 21)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (1, N'BC', N'Bess Conlan', 8)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (2, N'RB', N'Reena Burget', 9)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (3, N'SB', N'Sanjuanita Bigelow', 10)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (4, N'LF', N'Latina Faas', 9)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (5, N'IH', N'Iola Hannon', 8)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (6, N'NH', N'Nubia Holmgren', 10)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (7, N'HS', N'Hwa Speier', 8)
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


SET IDENTITY_INSERT [dbo].[ACTPL] ON 
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (17, 1, 987.0000, 160.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (18, 1, 987.0000, 200.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (19, 1, 987.0000, 827.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (20, 1, 987.0000, 192.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (21, 1, 987.0000, 658.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (22, 1, 987.0000, 712.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (23, 1, 987.0000, 665.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (24, 1, 987.0000, 781.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (25, 1, 750.0000, 137.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (26, 1, 750.0000, 244.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (27, 1, 750.0000, 231.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (28, 1, 750.0000, 749.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (29, 1, 750.0000, 307.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (30, 1, 750.0000, 402.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (31, 1, 750.0000, 590.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (32, 1, 750.0000, 241.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (33, 2, 750.0000, 633.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (34, 2, 750.0000, 856.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (35, 2, 750.0000, 174.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (36, 2, 750.0000, 687.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (37, 2, 750.0000, 237.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (38, 2, 750.0000, 935.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (39, 2, 750.0000, 830.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (40, 2, 750.0000, 694.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (41, 3, 750.0000, 424.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (42, 3, 750.0000, 344.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (43, 3, 750.0000, 663.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (44, 3, 750.0000, 490.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (45, 3, 750.0000, 382.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (46, 3, 750.0000, 862.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (47, 3, 750.0000, 188.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (48, 3, 750.0000, 105.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (49, 4, 750.0000, 107.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (50, 4, 750.0000, 637.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (51, 4, 750.0000, 639.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (52, 4, 750.0000, 928.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (53, 4, 750.0000, 993.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (54, 4, 750.0000, 831.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (55, 4, 750.0000, 833.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (56, 4, 750.0000, 256.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (57, 5, 750.0000, 840.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (58, 5, 750.0000, 339.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (59, 5, 750.0000, 100.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (60, 5, 750.0000, 464.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (61, 5, 750.0000, 521.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (62, 5, 750.0000, 949.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (63, 5, 750.0000, 357.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (64, 5, 750.0000, 229.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (65, 6, 750.0000, 651.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (66, 6, 750.0000, 531.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (67, 6, 750.0000, 777.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (68, 6, 750.0000, 281.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (69, 6, 750.0000, 783.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (70, 6, 750.0000, 786.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (71, 6, 750.0000, 248.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (72, 6, 750.0000, 968.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (73, 7, 750.0000, 805.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (74, 7, 750.0000, 850.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (75, 7, 750.0000, 353.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (76, 7, 750.0000, 570.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (77, 7, 750.0000, 743.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (78, 7, 750.0000, 578.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (79, 7, 750.0000, 744.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (80, 7, 750.0000, 499.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (81, 8, 750.0000, 471.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (82, 8, 750.0000, 332.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (83, 8, 750.0000, 597.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (84, 8, 750.0000, 459.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (85, 8, 750.0000, 886.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (86, 8, 750.0000, 339.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (87, 8, 750.0000, 719.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (88, 8, 750.0000, 779.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (89, 9, 750.0000, 414.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (90, 9, 750.0000, 287.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (91, 9, 750.0000, 186.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (92, 9, 750.0000, 936.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (93, 9, 750.0000, 976.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (94, 9, 750.0000, 845.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (95, 9, 750.0000, 201.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (96, 9, 750.0000, 257.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (97, 10, 750.0000, 525.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (98, 10, 750.0000, 634.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (99, 10, 750.0000, 460.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (100, 10, 750.0000, 812.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (101, 10, 750.0000, 698.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (102, 10, 750.0000, 619.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (103, 10, 750.0000, 322.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (104, 10, 750.0000, 534.0000, 8, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (105, 11, 750.0000, 643.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (106, 11, 750.0000, 1000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (107, 11, 750.0000, 641.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (108, 11, 750.0000, 896.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (109, 11, 750.0000, 613.0000, 5, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (110, 11, 750.0000, 358.0000, 6, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (111, 11, 750.0000, 269.0000, 7, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (112, 11, 750.0000, 854.0000, 8, 2020)
GO
SET IDENTITY_INSERT [dbo].[ACTPL] OFF
GO

