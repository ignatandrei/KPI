USE [tests]
GO
DROP PROCEDURE [dbo].[createKPI11]
GO
ALTER TABLE [dbo].[RE] DROP CONSTRAINT [FK_RE_Room]
GO
ALTER TABLE [dbo].[RE] DROP CONSTRAINT [FK_RE_Employee]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Department]
GO
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type in (N'U'))
DROP TABLE [dbo].[test]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Room]') AND type in (N'U'))
DROP TABLE [dbo].[Room]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Region]') AND type in (N'U'))
DROP TABLE [dbo].[Region]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RE]') AND type in (N'U'))
DROP TABLE [dbo].[RE]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KPI11Managers]') AND type in (N'U'))
DROP TABLE [dbo].[KPI11Managers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KPI11Clients]') AND type in (N'U'))
DROP TABLE [dbo].[KPI11Clients]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND type in (N'U'))
DROP TABLE [dbo].[County]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientsCounties]') AND type in (N'U'))
DROP TABLE [dbo].[ClientsCounties]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClientsCategory]') AND type in (N'U'))
DROP TABLE [dbo].[ClientsCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clients]') AND type in (N'U'))
DROP TABLE [dbo].[Clients]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssVAClientsCounties]') AND type in (N'U'))
DROP TABLE [dbo].[AssVAClientsCounties]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AssVA]') AND type in (N'U'))
DROP TABLE [dbo].[AssVA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACTPL]') AND type in (N'U'))
DROP TABLE [dbo].[ACTPL]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[IDDepartment] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[IDDepartment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IDEmployee] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IDDepartment] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPI11Clients](
	[UserId] [nvarchar](1000) NOT NULL,
	[IDClient] [bigint] NOT NULL,
	[IDRegion] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KPI11Managers](
	[UserId] [nvarchar](1000) NOT NULL,
	[IDAssVA] [bigint] NOT NULL,
	[IDManager] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RE](
	[IDRoom] [int] NOT NULL,
	[IDEmp] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RE] PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC,
	[IDEmp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[id] [int] NULL,
	[name] [varchar](200) NULL,
	[createdOn] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACTPL] ON 
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1113, 93, 589506.7500, 65500.7500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1114, 172, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1115, 213, -477314.0100, -53034.8900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1116, 218, 467046.0000, 51894.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1117, 224, 552092.7600, 61343.6400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1118, 225, 771265.8234, 85696.2026, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1119, 196, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1120, 30, 380113.9200, 42234.8800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1121, 31, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1122, 32, 447239.7000, 49693.3000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1123, 124, 1319897.7900, 146655.3100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1124, 126, 811380.1500, 90153.3500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1125, 127, 571729.1400, 63525.4600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1126, 152, 344413.7100, 38268.1900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1127, 188, 308165.4000, 34240.6000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1128, 73, 50947.7400, 5660.8600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1129, 74, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1130, 75, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1131, 13, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1132, 153, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1133, 197, 254389.3200, 28265.4800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1134, 204, 225104.7600, 25011.6400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1135, 205, 352102.8600, 39122.5400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1136, 24, 19620.1800, 2180.0200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1137, 142, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1138, 55, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1139, 56, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1140, 118, 176715.0000, 19635.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1141, 119, 120181.2300, 13353.4700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1142, 115, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1143, 185, 96653.8800, 10739.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1144, 70, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1145, 15, 1643004.0000, 182556.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1146, 16, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1147, 210, 2673682.2000, 297075.8000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1148, 219, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1149, 85, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1150, 100, 307235.8800, 34137.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1151, 101, 577725.6600, 64191.7400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1152, 117, 272516.4000, 30279.6000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1153, 130, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1154, 131, 349135.2900, 38792.8100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1155, 104, 1774481.0400, 197164.5600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1156, 133, 276336.0000, 30704.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1157, 138, 967202.5500, 107466.9500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1158, 144, 3692575.9800, 410286.2200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1159, 177, 184345.1100, 20482.7900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1160, 192, 762075.9000, 84675.1000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1161, 209, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1162, 63, 32367.6900, 3596.4100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1163, 77, 39820.5900, 4424.5100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1164, 231, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1165, 226, 317745.3600, 35305.0400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1166, 227, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1167, 228, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1168, 229, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1169, 230, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1170, 27, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1171, 26, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1172, 89, 547897.8600, 60877.5400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1173, 199, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1174, 201, 107855.8200, 11983.9800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1175, 29, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1176, 58, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1177, 123, 503723.8800, 55969.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1178, 48, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1179, 105, 1054316.3400, 117146.2600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1180, 150, 326171.6100, 36241.2900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1181, 64, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1182, 159, 241767.4500, 26863.0500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1183, 164, 801519.8400, 89057.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1184, 211, 11156.7600, 1239.6400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1185, 198, 149314.6800, 16590.5200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1186, 223, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1187, 214, 46270.9800, 5141.2200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1188, 220, 480.2400, 53.3600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1189, 90, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1190, 91, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1191, 19, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1192, 49, 214125.7500, 23791.7500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1193, 65, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1194, 81, 66436.6500, 7381.8500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1195, 106, 1244614.4100, 138290.4900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1196, 129, 330480.1800, 36720.0200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1197, 147, 864678.6000, 96075.4000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1198, 178, 301429.3500, 33492.1500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1199, 193, 318843.0900, 35427.0100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1200, 168, 731194.0200, 81243.7800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1201, 42, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1202, 207, 105207.0300, 11689.6700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1203, 232, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1204, 158, 59826.6000, 6647.4000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1205, 39, 109724.0400, 12191.5600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1206, 14, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1207, 170, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1208, 200, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1209, 33, 133722.0000, 14858.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1210, 59, 18297.5400, 2033.0600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1211, 132, 1598709.1500, 177634.3500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1212, 143, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1213, 189, 114663.4200, 12740.3800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1214, 76, 67136.8500, 7459.6500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1215, 47, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1216, 61, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1217, 99, 714750.1200, 79416.6800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1218, 202, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1219, 203, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1220, 86, 689404.6800, 76600.5200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1221, 174, 81454.1400, 9050.4600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1222, 217, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1223, 103, 726200.9100, 80688.9900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1224, 102, 841784.2200, 93531.5800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1225, 139, 613906.2000, 68211.8000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1226, 62, 46349.9100, 5149.9900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1227, 79, 61282.4400, 6809.1600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1228, 165, 802336.4820, 89148.4980, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1229, 12, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1230, 155, 69695.1900, 7743.9100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1231, 160, -51706.7820, -5745.1980, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1232, 176, 435892.8600, 48432.5400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1233, 45, 9686.1600, 1076.2400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1234, 175, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1235, 28, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1236, 137, 512252.9100, 56916.9900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1237, 121, 1090071.4500, 121119.0500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1238, 125, 617268.6000, 68585.4000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1239, 148, 1574500.2300, 174944.4700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1240, 149, 1260981.0000, 140109.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1241, 194, 174252.0600, 19361.3400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1242, 72, 39470.6700, 4385.6300, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1243, 82, 42697.5300, 4744.1700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1244, 83, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1245, 128, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1246, 18, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1247, 40, 7362.3600, 818.0400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1248, 44, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1249, 88, 1247019.6600, 138557.7400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1250, 96, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1251, 140, 1089386.3700, 121042.9300, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1252, 191, 324156.0600, 36017.3400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1253, 23, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1254, 37, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1255, 98, 380135.7900, 42237.3100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1256, 116, 352109.1600, 39123.2400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1257, 151, 269200.0800, 29911.1200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1258, 183, 169114.5900, 18790.5100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1259, 184, 656069.8500, 72896.6500, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1260, 69, 118046.6100, 13116.2900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1261, 169, 542816.6400, 60312.9600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1262, 20, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1263, 21, 36115.2000, 4012.8000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1264, 38, 244041.6600, 27115.7400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1265, 22, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1266, 36, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1267, 52, 35069.7600, 3896.6400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1268, 53, 35069.7600, 3896.6400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1269, 54, 29224.8000, 3247.2000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1270, 51, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1271, 84, 17534.8800, 1948.3200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1272, 50, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1273, 107, 939155.6700, 104350.6300, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1274, 108, 974094.4800, 108232.7200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1275, 109, 390837.7800, 43426.4200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1276, 110, 489281.4000, 54364.6000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1277, 111, 180983.7900, 20109.3100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1278, 112, 329187.3300, 36576.3700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1279, 135, 323773.0200, 35974.7800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1280, 113, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1281, 180, 404559.6300, 44951.0700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1282, 181, 351623.4300, 39069.2700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1283, 182, 274636.8000, 30515.2000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1284, 190, 205721.9100, 22857.9900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1285, 179, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1286, 66, 82729.8900, 9192.2100, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1287, 67, 68633.1000, 7625.9000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1288, 206, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1289, 173, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1290, 17, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1291, 94, 1137035.1600, 126337.2400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1292, 167, 263062.8000, 29229.2000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1293, 171, 344271.6000, 38252.4000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1294, 208, 153759.2400, 17084.3600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1295, 157, 1162013.3100, 129112.5900, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1296, 221, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1297, 92, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1298, 162, 2340739.2600, 260082.1400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1299, 87, 218383.2000, 24264.8000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1300, 35, 328982.4000, 36553.6000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1301, 34, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1302, 60, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1303, 134, 907158.0600, 100795.3400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1304, 136, 2216883.6000, 246320.4000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1305, 146, 743480.1000, 82608.9000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1306, 78, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1307, 41, 397087.3800, 44120.8200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1308, 216, 8877.9600, 986.4400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1309, 222, 1390291.4754, 154476.8306, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1310, 161, 1729689.0300, 192187.6700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1311, 215, 15198.1200, 1688.6800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1312, 114, 491356.5300, 54595.1700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1313, 145, 828833.1300, 92092.5700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1314, 68, 23379.8400, 2597.7600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1315, 80, 61986.2400, 6887.3600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1316, 97, 269332.0200, 29925.7800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1317, 154, 112185.7200, 12465.0800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1318, 156, 2463282.3600, 273698.0400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1319, 46, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1320, 163, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1321, 195, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1322, 212, 28754.8200, 3194.9800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1323, 166, 0.0000, 0.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1324, 95, 20034.0000, 2226.0000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1325, 43, 102274.2000, 11363.8000, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1326, 25, 39555.7200, 4395.0800, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1327, 57, 26979.5700, 2997.7300, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1328, 120, 718537.1400, 79837.4600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1329, 122, 431114.0400, 47901.5600, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1330, 141, 1026541.9800, 114060.2200, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1331, 186, 394653.3300, 43850.3700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1332, 187, 116479.2600, 12942.1400, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1333, 71, 81737.7300, 9081.9700, 1, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1334, 93, 542745.4500, 32449.0141, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1335, 172, 0.0000, 12652.4022, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1336, 213, 0.0000, 10199.8302, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1337, 218, -5269.3200, 57398.8716, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1338, 224, 1821379.1400, 71850.9214, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1339, 225, 340753.5360, 96271.2464, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1340, 196, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1341, 30, 203452.3800, 48570.1120, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1342, 31, 0.0000, 2515.5647, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1343, 32, 961887.9600, 57147.2950, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1344, 124, 1106085.0600, 168653.6065, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1345, 126, 516004.2900, 103676.3525, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1346, 127, 938433.7800, 73054.2790, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1347, 152, 106912.5300, 44008.4185, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1348, 188, 404683.9200, 39376.6900, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1349, 73, 103123.8000, 6509.9890, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1350, 74, 58764.4200, 2040.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1351, 75, 31761.9900, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1352, 13, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1353, 153, 0.0000, 27592.7474, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1354, 197, 531248.5800, 51011.8019, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1355, 204, 1972761.4800, 28761.8635, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1356, 205, 0.0000, 22885.7493, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1357, 24, 15732.0000, 2507.0230, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1358, 142, 628726.6800, 80000.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1359, 55, 123111.7200, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1360, 56, 92307.9600, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1361, 118, 433103.4900, 22580.2500, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1362, 119, 530574.7500, 15356.4905, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1363, 115, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1364, 185, 253562.0400, 12350.2180, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1365, 70, 79634.8800, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1366, 15, 1155009.6000, 166497.4616, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1367, 16, 72814.3200, 3127.4105, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1368, 210, 3547910.3400, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1369, 219, 0.0000, 20000.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1370, 85, 55021.2300, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1371, 100, 716291.1000, 39257.9180, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1372, 101, 1004175.5400, 73820.5010, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1373, 117, 293284.7100, 34821.5400, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1374, 130, 336685.1400, 500.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1375, 131, 0.0000, 44611.7315, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1376, 104, 211032.7200, 226739.2440, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1377, 133, 234335.4300, 35309.6000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1378, 138, 732579.7500, 123586.9925, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1379, 144, 505872.0000, 471829.1530, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1380, 177, 316889.7300, 23555.2085, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1381, 192, 822188.0700, 97376.3650, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1382, 209, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1383, 63, 53371.1700, 4135.8715, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1384, 77, 65268.4500, 5088.1865, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1385, 231, 0.0000, 19.1704, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1386, 226, 0.0000, 1335.0922, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1387, 227, 353894.7600, 27541.6015, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1388, 228, 0.0000, 2308.0056, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1389, 229, 0.0000, 1732.2757, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1390, 230, 0.0000, 962.5238, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1391, 27, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1392, 26, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1393, 89, 193969.8000, 71344.0934, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1394, 199, 0.0000, 16200.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1395, 201, 125469.1800, 14079.2573, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1396, 29, 78848.6400, 500.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1397, 58, 182062.2600, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1398, 123, 123291.9000, 64364.7180, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1399, 48, 149393.0700, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1400, 105, 606200.8500, 134718.1990, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1401, 150, 356883.3900, 41677.4835, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1402, 64, 88645.0500, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1403, 159, 468012.1500, 31000.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1404, 164, 1925164.8000, 102433.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1405, 211, 135172.6200, 1425.5860, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1406, 198, 0.0000, 19100.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1407, 223, 0.0000, 7311.1294, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1408, 214, 0.0000, 5912.4030, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1409, 220, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1410, 90, 0.0000, 3709.9492, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1411, 91, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1412, 19, 0.0000, 128.3648, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1413, 49, 493016.9400, 27360.5125, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1414, 65, 94238.4600, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1415, 81, 59069.7900, 5489.1275, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1416, 106, 403521.3000, 159034.0635, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1417, 129, 178611.9300, 42228.0230, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1418, 147, 191937.0600, 110486.7100, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1419, 178, 304754.9400, 38515.9725, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1420, 193, 307010.4300, 40741.0615, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1421, 168, 1714065.3000, 93400.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1422, 42, 701584.7400, 5000.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1423, 207, 0.0000, 13443.1205, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1424, 232, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1425, 158, 166972.5000, 7644.5100, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1426, 39, 30607.2000, 12020.2940, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1427, 14, -102124.4400, 6492.4112, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1428, 170, 0.0000, 5564.9238, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1429, 200, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1430, 33, 0.0000, 17086.7000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1431, 59, 175581.6300, 2338.0190, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1432, 132, 2136733.4700, 204279.5025, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1433, 143, 192553.2900, 61140.6879, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1434, 189, 236337.7500, 14651.4370, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1435, 76, 55405.3500, 3578.5975, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1436, 47, 127947.4200, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1437, 61, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1438, 99, 540782.1900, 91329.1820, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1439, 202, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1440, 203, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1441, 86, 1849906.6200, 85644.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1442, 174, 741588.4800, 26600.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1443, 217, 0.0000, 16694.7715, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1444, 103, 147719.0700, 92792.3385, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1445, 102, 153275.6700, 107561.3170, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1446, 139, 164732.7600, 78443.5700, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1447, 62, 94341.7800, 5922.4885, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1448, 79, 95394.7800, 7830.5340, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1449, 165, 418857.0300, 102520.7727, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1450, 12, 632202.6600, 5000.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1451, 155, 50489.2800, 8905.4965, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1452, 160, 227273.4000, 3393.0223, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1453, 176, 121278.7800, 15697.4210, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1454, 45, 72947.2500, 1150.6760, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1455, 175, 212293.8000, 6260.5393, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1456, 28, 0.0000, 124.3781, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1457, 137, 390503.8800, 65454.5385, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1458, 121, 395586.9900, 139286.9075, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1459, 125, -9295.2000, 78873.2100, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1460, 148, 981518.1300, 201186.1405, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1461, 149, 892248.4800, 161125.3500, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1462, 194, 247069.1700, 22265.5410, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1463, 72, 22435.9200, 5043.4745, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1464, 82, 61144.2000, 5455.7955, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1465, 83, 26805.8700, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1466, 128, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1467, 18, 0.0000, 8347.3858, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1468, 40, 590737.8600, 900.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1469, 44, 0.0000, 4600.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1470, 88, 607758.4800, 159300.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1471, 96, 10576.8000, 20868.4644, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1472, 140, 121912.0200, 139199.3695, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1473, 191, 289239.6600, 41419.9410, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1474, 23, 12195.7200, 1114.1679, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1475, 37, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1476, 98, 538793.5500, 48572.9065, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1477, 116, 912947.8500, 44991.7260, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1478, 151, 152587.7100, 34397.7880, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1479, 183, 308671.2000, 21609.0865, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1480, 184, 490988.6100, 83831.1475, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1481, 69, 149733.0900, 15083.7335, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1482, 169, 837856.2600, 79751.9040, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1483, 20, 0.0000, 4521.8561, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1484, 21, 0.0000, 147.0134, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1485, 38, 151900.2000, 31183.1010, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1486, 22, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1487, 36, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1488, 52, 154322.1000, 4481.1360, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1489, 53, 346869.7200, 4481.1360, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1490, 54, 95475.9600, 3734.2800, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1491, 51, 112913.1900, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1492, 84, 156012.9300, 2240.5680, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1493, 50, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1494, 107, 990484.3800, 120003.2245, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1495, 108, 1130297.6700, 124467.6280, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1496, 109, 653685.2100, 49940.3830, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1497, 110, 1088768.9700, 62519.2900, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1498, 111, 1265054.3100, 23125.7065, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1499, 112, 771582.7800, 42062.8255, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1500, 135, 699750.3600, 41370.9970, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1501, 113, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1502, 180, 432033.6600, 51693.7305, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1503, 181, 357775.3800, 44929.6605, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1504, 182, 331139.7000, 35092.4800, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1505, 190, 520529.2200, 26286.6885, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1506, 179, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1507, 66, 0.0000, 9571.0415, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1508, 67, 39024.1800, 7769.7850, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1509, 206, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1510, 173, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1511, 17, 180249.3900, 19477.2335, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1512, 94, 2575928.7900, 145287.8260, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1513, 167, 155680.3800, 33613.5800, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1514, 171, 373804.0200, 43990.2600, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1515, 208, 132740.1000, 19647.0140, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1516, 157, 1665685.0800, 148479.4785, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1517, 221, 21759.1200, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1518, 92, 85723.2000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1519, 162, 2132098.0200, 299094.4610, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1520, 87, 195381.0000, 27904.5200, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1521, 35, 942644.8800, 42036.6400, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1522, 34, 225884.1600, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1523, 60, 231421.1400, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1524, 134, 1731005.0100, 115914.6410, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1525, 136, 2434651.2000, 283268.4600, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1526, 146, 618466.6800, 95000.2350, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1527, 78, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1528, 41, 365839.0200, 50738.9430, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1529, 216, 15238.8000, 1134.4060, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1530, 222, 1850702.1300, 177600.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1531, 161, 1146429.7200, 221015.8205, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1532, 215, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1533, 114, 1143436.6800, 62784.4455, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1534, 145, 2112665.4000, 105906.4555, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1535, 68, 104812.1100, 2987.4240, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1536, 80, 109420.7400, 7920.4640, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1537, 97, 68405.1300, 22213.6470, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1538, 154, 213064.0200, 14334.8420, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1539, 156, 2839407.6600, 298800.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1540, 46, 0.0000, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1541, 163, 434676.3300, 40577.5697, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1542, 195, 26035.2900, 0.0000, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1543, 212, 139774.1400, 3674.2270, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1544, 166, 0.0000, 4637.4365, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1545, 95, 0.0000, 556.4924, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1546, 43, 0.0000, 12846.4136, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1547, 25, 166541.7600, 5054.3420, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1548, 57, 148660.6500, 3447.3895, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1549, 120, 939577.3200, 91813.0790, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1550, 122, 722566.9800, 55086.7940, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1551, 141, 761486.3100, 131169.2530, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1552, 186, 478798.7400, 50427.9255, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1553, 187, 342965.8800, 14883.4610, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1554, 71, 30298.3200, 10658.7216, 1, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1555, 93, 0.0000, 45000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1556, 172, 242699.0400, 11923.5620, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1557, 213, -4262.4000, 14159.3684, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1558, 218, 532275.9300, 21046.7838, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1559, 224, 612171.4500, 177205.5425, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1560, 225, 1449697.5936, 87637.1367, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1561, 196, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1562, 30, 165825.7200, 16786.4810, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1563, 31, 0.0000, 3342.3215, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1564, 32, -5489.1000, 4124.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1565, 124, 2423044.9800, 106305.3497, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1566, 126, 1976009.7600, 75868.0716, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1567, 127, 3776040.4500, 183299.7705, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1568, 152, 779326.2000, 37342.0745, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1569, 188, 543427.5600, 88277.4845, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1570, 73, 267521.8500, 20697.7824, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1571, 74, 0.0000, 10985.0080, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1572, 75, 0.0000, 12622.0976, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1573, 13, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1574, 153, 0.0000, 26453.4858, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1575, 197, 227100.9600, 48905.6040, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1576, 204, 2056295.2500, 282065.6938, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1577, 205, 0.0000, 21940.8323, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1578, 24, 0.0000, 28554.7950, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1579, 142, 1383685.3800, 120000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1580, 55, 302178.2400, 33325.2624, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1581, 56, 43369.5600, 13068.4176, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1582, 118, 1157291.7300, 96122.0606, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1583, 119, 2206118.0700, 95940.2635, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1584, 115, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1585, 185, 233388.4500, 16772.1635, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1586, 70, 74375.0100, 27633.3232, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1587, 15, 2057811.9300, 87838.5600, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1588, 16, 0.0000, 2998.2846, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1589, 210, 1652231.9700, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1590, 219, 0.0000, 33662.1520, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1591, 85, 45389.7900, 24779.9431, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1592, 100, 502927.0200, 89051.4970, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1593, 101, 2108036.7000, 212879.1119, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1594, 117, 325682.8200, 31862.0120, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1595, 130, 918506.1600, 28313.7644, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1596, 131, 0.0000, 24479.1571, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1597, 104, 3117439.7100, 67899.2223, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1598, 133, 1385390.5200, 82826.8883, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1599, 138, 2476712.6100, 68532.2989, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1600, 144, 3154376.7000, 29756.9981, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1601, 177, 302712.7500, 31625.3450, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1602, 192, 1363476.9600, 159636.2725, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1603, 209, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1604, 63, 21702.3300, 15260.1416, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1605, 77, 49659.4800, 17849.3978, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1606, 231, 0.0000, 25.4709, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1607, 226, 0.0000, 1773.8790, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1608, 227, 194912.1000, 36593.3292, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1609, 228, 0.0000, 3066.5467, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1610, 229, 0.0000, 2301.5995, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1611, 230, 0.0000, 1278.8636, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1612, 27, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1613, 26, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1614, 89, 510092.3700, 21004.1079, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1615, 199, 5355.0000, 15600.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1616, 201, 113593.3200, 13497.9467, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1617, 29, -13543.2000, 2551.8814, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1618, 58, 168183.0900, 20747.2566, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1619, 123, 762490.0800, 76661.5716, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1620, 48, 93860.9100, 45696.2738, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1621, 105, 1017728.6400, 73263.5745, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1622, 150, 1228443.4800, 41788.0613, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1623, 64, 60273.7200, 14867.8934, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1624, 159, 568332.4500, 41505.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1625, 164, 345619.8900, 129566.5291, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1626, 211, 67283.2800, 1509.9400, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1627, 198, 167843.1600, 9800.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1628, 223, 130132.8000, 8447.3316, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1629, 214, 0.0000, 3556.7712, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1630, 220, 3830.4000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1631, 90, 0.0000, 3556.7712, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1632, 91, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1633, 19, 0.0000, 170.5527, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1634, 49, 281945.6100, 37739.4752, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1635, 65, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1636, 81, 49540.1400, 17008.6256, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1637, 106, 2100328.4700, 92570.1374, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1638, 129, 576374.7600, 44942.3169, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1639, 147, 1491541.9200, 87234.3797, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1640, 178, 347521.4100, 49039.8295, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1641, 193, 248145.5700, 31640.5365, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1642, 168, 1220449.0500, 38900.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1643, 42, 0.0000, 13281.6916, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1644, 207, 387174.1500, 27012.6031, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1645, 232, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1646, 158, 536598.1800, 60868.8680, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1647, 39, 17301.4200, 12884.5769, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1648, 14, 0.0000, 6224.3496, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1649, 170, 0.0000, 5335.1568, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1650, 200, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1651, 33, -239.4000, 14821.1208, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1652, 59, 71145.8100, 30094.5569, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1653, 132, 1743831.0000, 189996.4762, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1654, 143, 321991.2000, 69375.2789, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1655, 189, 173869.6500, 17553.2635, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1656, 76, 157195.8000, 20118.8990, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1657, 47, 170348.1300, 23147.0184, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1658, 61, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1659, 99, 1225228.2300, 151134.0938, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1660, 202, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1661, 203, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1662, 86, 730991.5200, 117000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1663, 174, 22989.6000, 66500.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1664, 217, 0.0000, 16005.4704, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1665, 103, 2076126.2100, 136352.6211, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1666, 102, 1583887.6800, 69119.7169, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1667, 139, 1466919.3600, 54418.4323, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1668, 62, 22472.6400, 18360.7872, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1669, 79, 53474.8500, 19134.8192, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1670, 165, 701976.3300, 165248.3473, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1671, 12, 1109547.2700, 125337.8206, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1672, 155, 44179.9200, 31071.1680, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1673, 160, 39773.8800, 25280.7076, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1674, 176, 191016.1800, 20000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1675, 45, 106591.8600, 50514.6825, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1676, 175, 0.0000, 6002.0514, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1677, 28, 0.0000, 165.2558, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1678, 137, 396019.8900, 64538.6852, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1679, 121, 1253722.5000, 100950.1812, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1680, 125, 1129558.7700, 16101.6069, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1681, 148, 2655975.9600, 202114.8097, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1682, 149, 1106824.5900, 92516.4123, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1683, 194, 116566.2900, 20019.3840, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1684, 72, 22239.3600, 14416.3600, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1685, 82, 73006.4700, 12273.3680, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1686, 83, 37065.6000, 13952.3008, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1687, 128, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1688, 18, 0.0000, 8002.7352, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1689, 40, 676972.4400, 153000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1690, 44, 54333.7200, 4400.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1691, 88, 508673.4300, 110400.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1692, 96, 9577.6200, 20006.8380, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1693, 140, 2262316.1400, 167649.3384, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1694, 191, 155760.5700, 38863.4220, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1695, 23, 0.0000, 1480.3465, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1696, 37, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1697, 98, 595909.1700, 165799.3569, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1698, 116, 2256138.2700, 215874.5538, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1699, 151, 1189403.1900, 133557.0769, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1700, 183, 377780.5800, 32225.2770, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1701, 184, 191432.0700, 38042.5290, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1702, 69, 171061.4700, 34446.1600, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1703, 169, 2000394.9000, 184570.2908, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1704, 20, 0.0000, 30065.3372, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1705, 21, 0.0000, 437.3303, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1706, 38, 743958.5400, 22675.3090, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1707, 22, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1708, 36, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1709, 52, 208837.2600, 50398.9088, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1710, 53, 511237.0800, 93324.8464, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1711, 54, 116360.0100, 28555.6208, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1712, 51, 150532.3800, 19064.3488, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1713, 84, 113494.8600, 18371.9760, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1714, 50, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1715, 107, 1772235.7200, 192079.0996, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1716, 108, 2947723.1100, 308872.1580, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1717, 109, 2065387.3200, 190119.7514, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1718, 110, 2340315.2700, 191843.3676, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1719, 111, 3694024.5300, 248350.0312, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1720, 112, 2132138.1600, 195422.8570, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1721, 135, 1895667.3000, 205917.8389, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1722, 113, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1723, 180, 372445.4700, 80513.5254, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1724, 181, 328671.6300, 46584.0837, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1725, 182, 466211.8800, 83026.5975, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1726, 190, 333580.9500, 32983.8656, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1727, 179, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1728, 66, 137962.2600, 24485.6032, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1729, 67, 79085.4300, 33995.4080, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1730, 206, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1731, 173, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1732, 17, 14901.6600, 18673.0488, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1733, 94, 901306.0800, 139668.9866, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1734, 167, 118057.2300, 6969.0647, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1735, 171, 0.0000, 23011.6300, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1736, 208, 237541.6800, 2387.8645, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1737, 157, 895123.8000, 87569.3096, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1738, 221, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1739, 92, 111769.6500, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1740, 162, 1545746.0400, 21102.3369, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1741, 87, 194895.7200, 23019.8500, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1742, 35, 208308.1500, 93324.6124, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1743, 34, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1744, 60, 166916.4300, 24610.4096, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1745, 134, 1834462.1700, 234515.3420, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1746, 136, 2262790.8900, 78275.6040, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1747, 146, 1247612.0400, 54084.1952, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1748, 78, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1749, 41, 463224.3300, 57160.2874, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1750, 216, 0.0000, 938.8692, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1751, 222, 1416319.2000, 208800.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1752, 161, 528851.4300, 122047.0233, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1753, 215, 226614.4200, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1754, 114, 1915025.6700, 170527.7024, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1755, 145, 2245126.9500, 274860.5213, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1756, 68, 36690.0300, 18028.0688, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1757, 80, 138208.3200, 21480.3344, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1758, 97, 62104.3200, 14124.7123, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1759, 154, 162423.9000, 12748.0737, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1760, 156, 3322229.4000, 235000.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1761, 46, 0.0000, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1762, 163, 95826.2400, 38902.1850, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1763, 195, -45663.5700, 0.0000, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1764, 212, 112656.9600, 4464.3676, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1765, 166, 0.0000, 4445.9640, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1766, 95, 0.0000, 533.5157, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1767, 43, 0.0000, 7345.1035, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1768, 25, 0.0000, 41603.6498, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1769, 57, 90228.9600, 28811.8768, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1770, 120, 1868872.1400, 193647.7312, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1771, 122, 750740.7600, 103956.8656, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1772, 141, 1236489.6600, 58896.1632, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1773, 186, 539153.1900, 52975.1932, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1774, 187, 463590.2700, 57126.5896, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1775, 71, 20326.4100, 14161.7803, 2, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1776, 93, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1777, 172, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1778, 213, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1779, 218, 171254.5200, 19028.2800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1780, 224, 1584615.2400, 176068.3600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1781, 225, 688747.6998, 76527.5222, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1782, 196, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1783, 30, 130127.7600, 14458.6400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1784, 31, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1785, 32, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1786, 124, 863292.3300, 95921.3700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1787, 126, 619612.2000, 68845.8000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1788, 127, 1497003.5700, 166333.7300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1789, 152, 304971.5700, 33885.7300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1790, 188, 690867.2700, 76763.0300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1791, 73, 174357.1800, 19373.0200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1792, 74, 96308.1000, 10700.9000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1793, 75, 101427.5700, 11269.7300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1794, 13, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1795, 153, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1796, 197, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1797, 204, 2207587.5000, 245287.5000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1798, 205, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1799, 24, 221355.0000, 24595.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1800, 142, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1801, 55, 264899.4300, 29433.2700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1802, 56, 105014.0700, 11668.2300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1803, 118, 826610.8500, 91845.6500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1804, 119, 825124.7700, 91680.5300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1805, 115, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1806, 185, 131260.4100, 14584.4900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1807, 70, 222053.4900, 24672.6100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1808, 15, 579852.0000, 64428.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1809, 16, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1810, 210, 1379161.4400, 153240.1600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1811, 219, 282382.2000, 31375.8000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1812, 85, 199369.9800, 22152.2200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1813, 100, 725306.3100, 80589.5900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1814, 101, 1733857.0200, 192650.7800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1815, 117, 259509.6000, 28834.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1816, 130, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1817, 131, 328539.6000, 36504.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1818, 104, 553025.3400, 61447.2600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1819, 133, 674608.1400, 74956.4600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1820, 138, 558181.6200, 62020.1800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1821, 144, 242364.6900, 26929.4100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1822, 177, 247502.7000, 27500.3000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1823, 192, 1249327.3500, 138814.1500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1824, 209, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1825, 63, 130312.8000, 14479.2000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1826, 77, 151063.7400, 16784.8600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1827, 231, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1828, 226, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1829, 227, 102319.5600, 11368.8400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1830, 228, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1831, 229, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1832, 230, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1833, 27, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1834, 26, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1835, 89, 7711.2000, 856.8000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1836, 199, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1837, 201, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1838, 29, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1839, 58, 166273.6500, 18474.8500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1840, 123, 648827.2800, 72091.9200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1841, 48, 366221.2500, 40691.2500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1842, 105, 588572.1000, 65396.9000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1843, 150, 340355.2500, 37817.2500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1844, 64, 131176.3500, 14575.1500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1845, 159, 268395.3900, 29821.7100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1846, 164, 1018201.4262, 113133.4918, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1847, 211, 13589.4600, 1509.9400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1848, 198, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1849, 223, 49760.5500, 5528.9500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1850, 214, 22429.8000, 2492.2000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1851, 220, 2195.6400, 243.9600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1852, 90, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1853, 91, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1854, 19, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1855, 49, 303263.6400, 33695.9600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1856, 65, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1857, 81, 144712.1700, 16079.1300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1858, 106, 753964.9200, 83773.8800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1859, 129, 366046.0200, 40671.7800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1860, 147, 710506.2600, 78945.1400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1861, 178, 383789.9700, 42643.3300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1862, 193, 247621.5900, 27513.5100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1863, 168, 313512.8400, 34834.7600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1864, 42, 102326.4000, 11369.6000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1865, 207, 225707.4000, 25078.6000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1866, 232, -22352.2200, -2483.5800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1867, 158, 466907.4000, 51878.6000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1868, 39, 110339.9100, 12259.9900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1869, 14, 86829.7500, 9647.7500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1870, 170, 41420.5200, 4602.2800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1871, 200, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1872, 33, 111016.4400, 12335.1600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1873, 59, 243790.2900, 27087.8100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1874, 132, 1553104.7100, 172567.1900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1875, 143, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1876, 189, 136071.8100, 15119.0900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1877, 76, 179181.0000, 19909.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1878, 47, 187509.6000, 20834.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1879, 61, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1880, 99, 1235428.5600, 137269.8400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1881, 202, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1882, 203, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1883, 86, 925816.7700, 102868.5300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1884, 174, 639953.5500, 71105.9500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1885, 217, 216223.9200, 24024.8800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1886, 103, 1131170.6700, 125685.6300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1887, 102, 562966.0200, 62551.7800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1888, 139, 443227.0500, 49247.4500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1889, 62, 147542.0400, 16393.5600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1890, 79, 153761.9400, 17084.6600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1891, 165, 1136245.4280, 126249.4920, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1892, 12, 992155.3200, 110239.4800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1893, 155, 240536.8800, 26726.3200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1894, 160, 184273.5420, 20474.8380, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1895, 176, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1896, 45, 425388.6000, 47265.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1897, 175, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1898, 28, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1899, 137, 525654.4500, 58406.0500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1900, 121, 822218.6700, 91357.6300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1901, 125, 131144.3100, 14571.5900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1902, 148, 1646183.9700, 182909.3300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1903, 149, 753527.3400, 83725.2600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1904, 194, 156673.4400, 17408.1600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1905, 72, 115845.7500, 12871.7500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1906, 82, 110678.8500, 12297.6500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1907, 83, 144259.5600, 16028.8400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1908, 128, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1909, 18, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1910, 40, 1267703.7300, 140855.9700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1911, 44, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1912, 88, 918658.3500, 102073.1500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1913, 96, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1914, 140, 1359318.9600, 151035.4400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1915, 191, 304148.5200, 33794.2800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1916, 23, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1917, 37, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1918, 98, 1344319.1100, 149368.7900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1919, 116, 1750334.2200, 194481.5800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1920, 151, 1074787.1100, 119420.7900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1921, 183, 252197.8200, 28021.9800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1922, 184, 297724.1400, 33080.4600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1923, 69, 276799.5000, 30755.5000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1924, 169, 1507505.4000, 167500.6000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1925, 20, 615570.4800, 68396.7200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1926, 21, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1927, 38, 177458.9400, 19717.6600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1928, 22, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1929, 36, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1930, 52, 421062.6600, 46784.7400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1931, 53, 766003.2300, 85111.4700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1932, 54, 229464.8100, 25496.0900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1933, 51, 153195.6600, 17021.7400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1934, 84, 147631.9500, 16403.5500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1935, 50, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1936, 107, 1561245.4800, 173471.7200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1937, 108, 2515523.7600, 279502.6400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1938, 109, 1545236.2800, 171692.9200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1939, 110, 1559319.3900, 173257.7100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1940, 111, 2021017.0500, 224557.4500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1941, 112, 1588566.2400, 176507.3600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1942, 135, 1674317.3400, 186035.2600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1943, 113, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1944, 180, 627378.1200, 69708.6800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1945, 181, 362992.8600, 40332.5400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1946, 182, 646960.5000, 71884.5000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1947, 190, 253471.6800, 28163.5200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1948, 179, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1949, 66, 212830.7400, 23647.8600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1950, 67, 281213.1000, 31245.9000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1951, 206, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1952, 173, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1953, 17, 23921.7300, 2657.9700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1954, 94, 1121520.4200, 124613.3800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1955, 167, 61707.9600, 6856.4400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1956, 171, 191271.7800, 21252.4200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1957, 208, 18869.2200, 2096.5800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1958, 157, 731494.8900, 81277.2100, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1959, 221, 63787.5000, 7087.5000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1960, 92, 58851.4500, 6539.0500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1961, 162, 172145.4300, 19127.2700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1962, 87, 207178.6500, 23019.8500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1963, 35, 722824.0200, 80313.7800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1964, 34, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1965, 60, 197762.2200, 21973.5800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1966, 134, 1869670.9800, 207741.2200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1967, 136, 640436.7600, 71159.6400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1968, 146, 434605.1400, 48289.4600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1969, 78, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1970, 41, 476115.6600, 52901.7400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1971, 216, 7986.6000, 887.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1972, 222, 1651155.4800, 183461.7200, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1973, 161, 1001745.9000, 111305.1000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1974, 215, 285980.4000, 31775.6000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1975, 114, 1393959.4200, 154884.3800, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1976, 145, 2246816.2500, 249646.2500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1977, 68, 144868.4100, 16096.4900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1978, 80, 172609.8300, 19178.8700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1979, 97, -51520.4280, -5724.4920, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1980, 154, 95864.8500, 10651.6500, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1981, 156, 1875487.2930, 208387.4770, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1982, 46, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1983, 163, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1984, 195, 298794.9600, 33199.4400, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1985, 212, 110350.4400, 12261.1600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1986, 166, 60361.2000, 6706.8000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1987, 95, 0.0000, 0.0000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1988, 43, 58476.6000, 6497.4000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1989, 25, 314486.1000, 34942.9000, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1990, 57, 231524.0100, 25724.8900, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1991, 120, 1556097.8400, 172899.7600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1992, 122, 835367.6700, 92818.6300, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1993, 141, 473272.7400, 52585.8600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1994, 186, 411014.4300, 45668.2700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1995, 187, 443223.5400, 49247.0600, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1996, 71, 131117.1300, 14568.5700, 2, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1997, 93, 523583.2341, 99108.5700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1998, 172, 344975.7672, 24276.3500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (1999, 213, 286776.9126, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2000, 218, 1190946.9474, 88700.1200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2001, 224, 1924054.9362, 186029.3800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2002, 225, 1262998.7793, 260134.0544, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2003, 196, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2004, 30, 1090603.6020, 49405.7000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2005, 31, 51304.9437, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2006, 32, 1600152.7545, 59633.7200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2007, 124, 3202268.8941, 180668.8600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2008, 126, 782536.2732, 146508.9500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2009, 127, 1674754.0749, 158509.5600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2010, 152, 1136911.6413, 87574.3800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2011, 188, 864213.6375, 143629.2500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2012, 73, 631870.9056, 11224.4200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2013, 74, 408529.2096, 12773.8500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2014, 75, 480653.0784, 13245.7500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2015, 13, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2016, 153, 511100.9631, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2017, 197, 944892.5364, 37287.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2018, 204, 3031069.4721, 309406.5600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2019, 205, 423913.1517, 9434.8800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2020, 24, 858319.3125, 36734.9600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2021, 142, 270000.0000, 34936.0200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2022, 55, 819127.0800, 36310.7800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2023, 56, 539267.0688, -3827.2800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2024, 118, 927914.0652, 125927.4400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2025, 119, 1730005.4376, 158096.6700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2026, 115, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2027, 185, 628397.9145, 54761.2600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2028, 70, 362396.3904, 26672.7100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2029, 15, 3840972.8598, 375036.6000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2030, 16, 57929.0814, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2031, 210, 0.0000, 736369.6200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2032, 219, 708046.6185, 168658.8000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2033, 85, 468718.9164, 12932.7900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2034, 100, 905424.6240, 115101.1100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2035, 101, 1773126.3924, 241298.6600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2036, 117, 742088.3445, 69579.1500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2037, 130, 588119.8158, 76768.8700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2038, 131, 240757.3179, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2039, 104, 674089.6032, 74084.2000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2040, 133, 1147019.3622, 98327.9100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2041, 138, 1796321.2356, 151958.8600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2042, 144, 1439212.8195, 115527.3800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2043, 177, 942838.4250, 89109.1500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2044, 192, 987106.0365, 68898.1900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2045, 209, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2046, 63, 341788.3794, 14419.8700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2047, 77, 347379.6339, 13672.0700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2048, 231, 390.9807, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2049, 226, 27229.2066, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2050, 227, 561710.9763, 36801.4400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2051, 228, 47071.7748, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2052, 229, 35329.7646, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2053, 230, 19630.6740, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2054, 27, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2055, 26, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2056, 89, 1513366.1766, 143421.9600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2057, 199, 300600.0000, 76403.9000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2058, 201, 260790.3396, 33661.7000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2059, 29, 16007.2830, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2060, 58, 607697.8092, 14672.6800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2061, 123, 1858976.5005, 107371.7300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2062, 48, 679793.9175, 2744.6600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2063, 105, 1989946.5651, 228989.7800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2064, 150, 1251474.3297, 60890.3300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2065, 64, 574026.3801, 39513.6400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2066, 159, 1629000.0000, 141963.5700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2067, 164, 1521000.0000, 126448.2700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2068, 211, 711863.1000, 19823.0200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2069, 198, 189000.0000, 11013.9600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2070, 223, 163208.7108, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2071, 214, 68719.4568, 1917.6000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2072, 220, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2073, 90, 68719.4568, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2074, 91, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2075, 19, 2618.0001, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2076, 49, 826792.0128, 35531.6100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2077, 65, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2078, 81, 353243.8368, 21646.5600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2079, 106, 1452499.9659, 96569.0100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2080, 129, 387847.8396, 62480.4000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2081, 147, 1644218.6166, 114479.9000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2082, 178, 764545.5990, 67550.4100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2083, 193, 499483.9620, 70272.1300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2084, 168, 2208600.0000, 193398.4600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2085, 42, 862449.7536, 166255.3400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2086, 207, 568888.4835, 116829.7200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2087, 232, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2088, 158, 1203139.9134, 197960.1200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2089, 39, 83109.9132, 13820.6500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2090, 14, 120259.0503, -875.0500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2091, 170, 103079.1861, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2092, 200, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2093, 33, 537966.6840, 22416.9600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2094, 59, 604701.8109, 13172.0800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2095, 132, 1330921.7478, 52316.8700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2096, 143, 581114.3454, 127383.7400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2097, 189, 404747.9424, 35113.5500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2098, 76, 415717.7346, 30654.2700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2099, 47, 574311.2193, 6101.6000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2100, 61, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2101, 99, 1821974.8356, 188762.7700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2102, 202, 0.0000, 19238.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2103, 203, 0.0000, 14203.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2104, 86, 1474200.0000, 152692.4000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2105, 174, 897750.0000, 130762.9800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2106, 217, 309237.5574, 55026.7200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2107, 103, 1127112.1002, 121305.9900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2108, 102, 1641027.1356, 68594.9800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2109, 139, 1062984.8502, 73916.8000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2110, 62, 412649.4384, 19057.5700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2111, 79, 390374.0208, 19501.1700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2112, 165, 1274518.2672, 229638.6300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2113, 12, 1298461.8555, 158424.3600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2114, 155, 464062.9266, 19960.4200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2115, 160, 739353.7557, 42717.3600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2116, 176, 180000.0000, 101953.5200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2117, 45, 127572.7923, 60999.4800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2118, 175, 115964.0838, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2119, 28, 2536.6914, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2120, 137, 1205401.2498, 31991.2100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2121, 121, 1581526.6677, 72218.2800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2122, 125, 914656.3281, 44659.6100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2123, 148, 2239420.5774, 193679.1000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2124, 149, 1414962.5310, 110259.6600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2125, 194, 392412.4875, 61693.5400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2126, 72, 311771.6640, 18767.5900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2127, 82, 292483.4400, 14000.8000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2128, 83, 245456.6976, 18839.1300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2129, 128, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2130, 18, 154618.7787, 68161.8400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2131, 40, 953100.0000, 80858.1200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2132, 44, 85500.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2133, 88, 1325700.0000, 120987.6400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2134, 96, 386546.9463, 10892.5600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2135, 140, 1641599.6220, 129436.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2136, 191, 689055.9615, 76554.6800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2137, 23, 22723.4556, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2138, 37, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2139, 98, 1075234.8888, 200675.0700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2140, 116, 1484583.8076, 134424.9000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2141, 151, 511828.5591, 85246.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2142, 183, 790140.3192, 89158.6300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2143, 184, 1191766.7556, 128245.7700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2144, 69, 878984.6256, 26528.1200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2145, 169, 4606605.6093, 376384.5400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2146, 20, 80828.2566, 5490.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2147, 21, 2998.3374, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2148, 38, 1505825.0550, 76772.8600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2149, 22, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2150, 36, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2151, 52, 1199039.5872, 12710.5500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2152, 53, 1131224.6016, 49887.6000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2153, 54, 860644.3104, 18113.4300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2154, 51, 621457.0992, 14578.0400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2155, 84, 736771.8816, 11181.6900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2156, 50, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2157, 107, 2705176.8810, 308355.9000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2158, 108, 3078563.5575, 266399.6700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2159, 109, 2456509.5414, 151380.7200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2160, 110, 1893752.8416, 142080.3000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2161, 111, 2752027.6149, 130093.2500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2162, 112, 1692289.0089, 80264.7600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2163, 135, 1807447.5954, 272638.0200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2164, 113, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2165, 180, 1615334.1543, 90860.4400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2166, 181, 715706.2584, 74396.1500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2167, 182, 1134397.7334, 63278.3200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2168, 190, 1411888.5162, 124604.2200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2169, 179, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2170, 66, 251961.8112, 13650.6200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2171, 67, 593646.3792, 14019.5500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2172, 206, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2173, 173, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2174, 17, 360777.1500, 17698.0200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2175, 94, 2991136.2831, 343192.1200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2176, 167, 154096.4718, 16740.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2177, 171, 71002.0674, 13389.5400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2178, 208, 302025.6324, 10946.6800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2179, 157, 1848159.8595, 385617.4800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2180, 221, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2181, 92, 0.0000, 10407.9500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2182, 162, 2752349.2344, 460140.5500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2183, 87, 514802.6100, 154261.4500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2184, 35, 1337718.9879, 163743.7400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2185, 34, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2186, 60, 827598.1680, 25734.4700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2187, 134, 3340282.9680, 367909.6700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2188, 136, 2847292.2720, 194846.6800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2189, 146, 1550427.5232, 153279.8100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2190, 78, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2191, 41, 903955.5369, 79840.8200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2192, 216, 2274.0444, 4948.0200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2193, 222, 3411000.0000, 334985.5400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2194, 161, 3517317.6984, 158152.2400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2195, 215, 0.0000, 2544.8000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2196, 114, 2888692.0344, 163498.1700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2197, 145, 3537047.3877, 227771.2300, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2198, 68, 602020.1232, 31135.6600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2199, 80, 530948.9088, 27801.5400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2200, 97, 476802.2457, 26628.9200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2201, 154, 28404.4842, 27301.6600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2202, 156, 4111200.0000, 161023.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2203, 46, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2204, 163, 751619.0628, 79422.0600, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2205, 195, 0.0000, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2206, 212, 77309.3889, 17339.3200, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2207, 166, 85899.3219, 15048.1500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2208, 95, 10307.9187, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2209, 43, 402931.3941, 0.0000, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2210, 25, 927722.9367, 68523.8800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2211, 57, 620424.7056, 24159.9400, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2212, 120, 3267344.0592, 220803.9700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2213, 122, 1833978.0672, 205744.0800, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2214, 141, 2392528.5216, 127615.8900, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2215, 186, 929273.5044, 109020.5100, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2216, 187, 1084447.7208, 146892.1700, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2217, 71, 217384.6329, 22765.6500, 3, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2218, 93, 766295.2800, 85143.9200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2219, 172, 412577.5500, 45841.9500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2220, 213, -16117.2000, -1790.8000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2221, 218, 1076728.5000, 119636.5000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2222, 224, 1617474.6000, 179719.4000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2223, 225, 1092217.4577, 121357.4953, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2224, 196, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2225, 30, 925520.7600, 102835.6400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2226, 31, 429632.2800, 47736.9200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2227, 32, 1378253.8800, 153139.3200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2228, 124, 2905870.1400, 322874.4600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2229, 126, 707655.4200, 78628.3800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2230, 127, 1519740.5400, 168860.0600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2231, 152, 1051689.3300, 116854.3700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2232, 188, 717329.2500, 79703.2500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2233, 73, 622766.8800, 69196.3200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2234, 74, 400276.0800, 44475.1200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2235, 75, 464262.5700, 51584.7300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2236, 13, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2237, 153, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2238, 197, 238375.0800, 26486.1200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2239, 204, 2847167.6400, 316351.9600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2240, 205, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2241, 24, 739293.1200, 82143.6800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2242, 142, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2243, 55, 723327.7500, 80369.7500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2244, 56, 473452.7400, 52605.8600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2245, 118, 866528.1900, 96280.9100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2246, 119, 1594378.8000, 177153.2000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2247, 115, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2248, 185, 569911.2300, 63323.4700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2249, 70, 387853.9200, 43094.8800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2250, 15, 3043762.6500, 338195.8500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2251, 16, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2252, 210, 7711252.0200, 856805.7800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2253, 219, 827730.0000, 91970.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2254, 85, 409366.8000, 45485.2000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2255, 100, 819388.8000, 91043.2000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2256, 101, 1580204.8800, 175578.3200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2257, 117, 689735.3400, 76637.2600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2258, 130, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2259, 131, 589988.1600, 65554.2400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2260, 104, 610035.8400, 67781.7600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2261, 133, 1086895.3500, 120766.1500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2262, 138, 1731512.4300, 192390.2700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2263, 144, 1416482.1900, 157386.9100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2264, 177, 819859.5000, 91095.5000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2265, 192, 897483.5100, 99720.3900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2266, 209, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2267, 63, 320381.4600, 35597.9400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2268, 77, 341388.8100, 37932.0900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2269, 231, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2270, 226, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2271, 227, 704022.3000, 78224.7000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2272, 228, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2273, 229, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2274, 230, 86854.3200, 9650.4800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2275, 27, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2276, 26, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2277, 89, 1444940.4600, 160548.9400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2278, 199, 354814.2900, 39423.8100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2279, 201, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2280, 29, 93992.4000, 10443.6000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2281, 58, 530060.4900, 58895.6100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2282, 123, 1625318.1000, 180590.9000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2283, 48, 578317.5000, 64257.5000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2284, 105, 1800856.6200, 200095.1800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2285, 150, 1165135.1400, 129459.4600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2286, 64, 543211.3800, 60356.8200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2287, 159, 1072031.5512, 119114.6168, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2288, 164, 1369324.8000, 152147.2000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2289, 211, 711863.1000, 79095.9000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2290, 198, 143747.3700, 15971.9300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2291, 223, 219812.4000, 24423.6000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2292, 214, 30324.6000, 3369.4000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2293, 220, 1254.6000, 139.4000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2294, 90, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2295, 91, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2296, 19, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2297, 49, 758296.4400, 84255.1600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2298, 65, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2299, 81, 347539.1400, 38615.4600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2300, 106, 1375565.5800, 152840.6200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2301, 129, 350993.5200, 38999.2800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2302, 147, 1528704.6300, 169856.0700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2303, 178, 664822.2600, 73869.1400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2304, 193, 434333.8800, 48259.3200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2305, 168, 1975481.0100, 219497.8900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2306, 42, 773405.6400, 85933.9600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2307, 207, 528158.1600, 58684.2400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2308, 232, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2309, 158, 1025437.4100, 113937.4900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2310, 39, 82340.7300, 9148.9700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2311, 14, 107928.6300, 11992.0700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2312, 170, 56685.6900, 6298.4100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2313, 200, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2314, 33, 488529.9000, 54281.1000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2315, 59, 528560.1900, 58728.9100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2316, 132, 1204454.0700, 133828.2300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2317, 143, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2318, 189, 348920.6400, 38768.9600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2319, 76, 402898.8600, 44766.5400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2320, 47, 512532.6300, 56948.0700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2321, 61, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2322, 99, 1591832.4300, 176870.2700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2323, 202, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2324, 203, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2325, 86, 1317266.6400, 146362.9600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2326, 174, 859268.4300, 95474.2700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2327, 217, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2328, 103, 1020010.9500, 113334.5500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2329, 102, 1485092.4300, 165010.2700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2330, 139, 961977.2400, 106886.3600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2331, 62, 408615.5700, 45401.7300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2332, 79, 380691.0900, 42299.0100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2333, 165, 931332.7305, 103481.4145, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2334, 12, 1142047.6200, 126894.1800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2335, 155, 399170.5200, 44352.2800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2336, 160, 598802.4000, 66533.6000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2337, 176, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2338, 45, 119366.8605, 13262.9845, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2339, 175, 203443.7400, 22604.8600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2340, 28, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2341, 137, 1113364.3500, 123707.1500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2342, 121, 1474911.8100, 163879.0900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2343, 125, 824014.7100, 91557.1900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2344, 148, 2137596.9300, 237510.7700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2345, 149, 1355822.1000, 150646.9000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2346, 194, 341228.2500, 37914.2500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2347, 72, 358724.7000, 39858.3000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2348, 82, 357574.5000, 39730.5000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2349, 83, 339693.4800, 37743.7200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2350, 128, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2351, 18, 154294.3800, 17143.8200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2352, 40, 979781.8500, 108864.6500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2353, 44, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2354, 88, 1225453.8600, 136161.5400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2355, 96, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2356, 140, 1509640.2000, 167737.8000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2357, 191, 593502.1200, 65944.6800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2358, 23, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2359, 37, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2360, 98, 968680.0800, 107631.1200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2361, 116, 1374833.1600, 152759.2400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2362, 151, 461106.8100, 51234.0900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2363, 183, 680568.7500, 75618.7500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2364, 184, 1026500.2200, 114055.5800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2365, 69, 790079.1300, 87786.5700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2366, 169, 4209939.3600, 467771.0400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2367, 20, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2368, 21, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2369, 38, 1292195.7000, 143577.3000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2370, 22, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2371, 36, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2372, 52, 1070571.0600, 118952.3400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2373, 53, 1012432.6800, 112492.5200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2374, 54, 768432.4200, 85381.3800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2375, 51, 554872.4100, 61652.4900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2376, 84, 648189.1800, 72021.0200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2377, 50, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2378, 107, 2446097.9400, 271788.6600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2379, 108, 2770370.9100, 307818.9900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2380, 109, 2211675.4800, 245741.7200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2381, 110, 1709444.2500, 189938.2500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2382, 111, 2480460.8400, 275606.7600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2383, 112, 1526544.7200, 169616.0800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2384, 135, 1631091.7800, 181232.4200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2385, 113, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2386, 180, 1389207.0600, 154356.3400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2387, 181, 611866.8900, 67985.2100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2388, 182, 972811.8900, 108090.2100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2389, 190, 1213063.6500, 134784.8500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2390, 179, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2391, 66, 228983.7600, 25442.6400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2392, 67, 566772.6600, 62974.7400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2393, 206, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2394, 173, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2395, 17, 375500.7000, 41722.3000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2396, 94, 2668707.0000, 296523.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2397, 167, 151606.1700, 16845.1300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2398, 171, 65574.0495, 7286.0055, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2399, 208, 265182.9300, 29464.7700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2400, 157, 1741243.4100, 193471.4900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2401, 221, 155238.3000, 17248.7000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2402, 92, 62804.7000, 6978.3000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2403, 162, 2494743.9300, 277193.7700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2404, 87, 514802.6100, 57200.2900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2405, 35, 1162839.0600, 129204.3400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2406, 34, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2407, 60, 746962.6500, 82995.8500, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2408, 134, 3036620.8800, 337402.3200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2409, 136, 2588447.5200, 287605.2800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2410, 146, 1424488.8600, 158276.5400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2411, 78, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2412, 41, 833692.1400, 92632.4600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2413, 216, 2149.3800, 238.8200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2414, 222, 2996923.2300, 332991.4700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2415, 161, 3207742.2900, 356415.8100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2416, 215, 526692.7800, 58521.4200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2417, 114, 2666597.6700, 296288.6300, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2418, 145, 3253718.7900, 361524.3100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2419, 68, 561625.1100, 62402.7900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2420, 80, 510222.2400, 56691.3600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2421, 97, 490871.6100, 54541.2900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2422, 154, 23733.3600, 2637.0400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2423, 156, 3721492.5300, 413499.1700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2424, 46, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2425, 163, 0.0000, 0.0000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2426, 195, 520039.5300, 57782.1700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2427, 212, 19917.5400, 2213.0600, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2428, 166, 33555.4200, 3728.3800, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2429, 95, 6728.4000, 747.6000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2430, 43, 356428.8000, 39603.2000, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2431, 25, 779021.4600, 86557.9400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2432, 57, 553950.6300, 61550.0700, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2433, 120, 3102092.9100, 344676.9900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2434, 122, 1661587.5600, 184620.8400, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2435, 141, 2192436.1800, 243604.0200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2436, 186, 816615.0900, 90735.0100, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2437, 187, 948058.3800, 105339.8200, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2438, 71, 501679.7100, 55742.1900, 3, 2019)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2439, 93, 527802.2973, 198971.5700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2440, 172, 632248.1964, 36474.0600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2441, 213, 568394.7723, 44256.9600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2442, 218, 1950623.3808, 139211.0400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2443, 224, 5257156.3209, 11408.9000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2444, 225, 3537714.4011, 146067.6992, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2445, 196, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2446, 30, 592590.0249, 21177.4000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2447, 31, 61405.3053, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2448, 32, 472191.6546, 11245.7200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2449, 124, 4083948.0009, 163268.6600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2450, 126, 2063048.4855, 59411.2800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2451, 127, 2663099.1180, 52625.3900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2452, 152, 831145.5081, 56917.8900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2453, 188, 1417966.3530, 42744.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2454, 73, 347337.8064, 16909.4500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2455, 74, 58855.4640, 9624.6400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2456, 75, 374842.6272, 18257.5600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2457, 13, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2458, 153, 819460.5993, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2459, 197, 1514969.1747, 189614.6400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2460, 204, 5060819.1843, 112507.4600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2461, 205, 679670.2611, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2462, 24, 50029.9992, 3408.2000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2463, 142, 270000.0000, 55693.3000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2464, 55, 1190641.3344, 40004.5200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2465, 56, 334418.8320, 22415.4000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2466, 118, 3140490.9114, 65580.1500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2467, 119, 2553953.4342, 152325.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2468, 115, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2469, 185, 975347.5095, 22568.5700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2470, 70, 274816.9008, 19668.9200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2471, 15, 6993978.8166, 540782.6800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2472, 16, 92879.1045, 762.6200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2473, 210, 0.0000, 403436.9600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2474, 219, 1369483.5618, -1893.1200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2475, 85, 155464.0551, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2476, 100, 1817548.4619, 93366.2900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2477, 101, 2694867.5583, 155317.1300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2478, 117, 1269816.9129, 43858.4700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2479, 130, 595902.4713, 35924.8100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2480, 131, 314732.3463, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2481, 104, 1656551.1807, 54155.4400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2482, 133, 2250136.3068, 86724.9000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2483, 138, 3000626.6661, 242569.8800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2484, 144, 2011351.4496, 77113.2400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2485, 177, 1191222.4950, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2486, 192, 2375115.8310, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2487, 209, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2488, 63, 155371.8591, 9376.8200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2489, 77, 236816.8344, 19425.1700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2490, 231, 467.9523, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2491, 226, 32589.7974, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2492, 227, 699294.5451, 108594.6400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2493, 228, 56338.7562, 26994.7200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2494, 229, 42285.1059, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2495, 230, 23495.3478, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2496, 27, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2497, 26, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2498, 89, 1050500.5002, 69735.3600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2499, 199, 482400.0000, 157.7600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2500, 201, 418131.4923, 26587.6600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2501, 29, 19158.6231, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2502, 58, 550906.9290, 26188.5500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2503, 123, 4808410.7823, 83582.4400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2504, 48, 581395.9779, 31855.6400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2505, 105, 3160794.8007, 206561.9800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2506, 150, 1732288.3749, 88349.1900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2507, 64, 555339.7899, 18839.3900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2508, 159, 1894455.0000, 190492.5300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2509, 164, 1665000.0000, 237118.3900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2510, 211, 500021.8200, 104828.8000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2511, 198, 214200.0000, 46372.6200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2512, 223, 171676.4940, 26321.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2513, 214, 103861.5759, 5693.6800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2514, 220, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2515, 90, 110179.5759, 1415.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2516, 91, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2517, 19, 3133.4031, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2518, 49, 723719.2752, 75989.4100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2519, 65, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2520, 81, 178041.5712, 12331.2400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2521, 106, 2749004.2116, 120799.8300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2522, 129, 707362.4169, 46262.7600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2523, 147, 1158743.5434, 128713.8900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2524, 178, 1278255.4695, 30199.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2525, 193, 1120885.2270, 13508.9900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2526, 168, 2230200.0000, 119110.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2527, 42, 2772869.9805, 151919.4800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2528, 207, 855977.4846, 41566.3200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2529, 232, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2530, 158, 2210262.4332, 180086.2800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2531, 39, 78648.1155, 16078.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2532, 14, 192814.2585, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2533, 170, 165269.3643, 13908.8500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2534, 200, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2535, 33, 383083.9200, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2536, 59, 270143.1864, 19467.9500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2537, 132, 1500146.5050, 89812.0600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2538, 143, 625148.7741, 26997.5800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2539, 189, 536531.7492, 13734.7000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2540, 76, 510075.8505, 20826.8300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2541, 47, 214778.6064, 17992.4100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2542, 61, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2543, 99, 2475914.7213, 151234.4500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2544, 202, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2545, 203, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2546, 86, 2106000.0000, 227612.8000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2547, 174, 1436400.0000, 147230.5400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2548, 217, 495808.0938, 21045.3200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2549, 103, 3088902.7107, 146083.3400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2550, 102, 1676490.7068, 70010.0200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2551, 139, 1469633.7780, 61729.3100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2552, 62, 246251.2464, 20665.3700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2553, 79, 271474.5168, 17424.2500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2554, 165, 2876009.6718, 143674.0100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2555, 12, 1964775.1023, 151070.9400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2556, 155, 211196.0142, 22753.1800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2557, 160, 900639.1683, 61463.0100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2558, 176, 597950.8857, 34094.1800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2559, 45, 856663.9884, 41569.4200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2560, 175, 185928.0354, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2561, 28, 3036.0879, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2562, 137, 2210635.9404, 54152.6900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2563, 121, 2152917.0279, 23082.2800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2564, 125, 508130.0613, 11514.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2565, 148, 4446494.8524, 159613.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2566, 149, 2837727.5319, 135860.6000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2567, 194, 806828.7645, 23188.0400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2568, 72, 164980.6704, 6112.5200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2569, 82, 169883.3808, 3904.9000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2570, 83, 79032.8448, 4537.2600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2571, 128, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2572, 18, 247904.0469, 20644.8000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2573, 40, 1330200.0000, 51738.1400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2574, 44, 137700.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2575, 88, 3971700.0000, 209942.4700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2576, 96, 529760.1168, 18427.8400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2577, 140, 2954170.5336, 146722.7500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2578, 191, 952027.3845, 47625.2300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2579, 23, 27197.0037, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2580, 37, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2581, 98, 3349676.8071, 129298.0700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2582, 116, 2485218.0591, 148481.5600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2583, 151, 1669601.8503, 50387.2800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2584, 183, 605862.6948, 67292.8600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2585, 184, 572807.9106, 22080.2800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2586, 69, 301377.5856, 27456.4400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2587, 169, 4669496.2098, 269868.8600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2588, 20, 58969.0260, 2745.1200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2589, 21, 4488.6177, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2590, 38, 712446.1263, 48906.3400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2591, 22, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2592, 36, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2593, 52, 935322.6672, 108621.7800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2594, 53, 1074606.9696, 46876.5900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2595, 54, 362002.4352, 41621.7300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2596, 51, 562482.7488, 44825.5800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2597, 84, 469821.4272, 35152.8000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2598, 50, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2599, 107, 3391396.3692, 212912.1000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2600, 108, 3516602.8824, 183743.8800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2601, 109, 2973175.2882, 180935.7000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2602, 110, 2177678.8728, 126880.1200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2603, 111, 2322243.0810, 210581.7900, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2604, 112, 2002168.7811, 130565.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2605, 135, 3260276.3943, 166526.1800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2606, 113, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2607, 180, 1972562.4909, 81703.1400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2608, 181, 1682633.9772, 95203.6600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2609, 182, 1037367.3618, 8347.5200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2610, 190, 1761917.3694, 109375.7500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2611, 179, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2612, 66, 187200.7776, 21246.4700, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2613, 67, 232767.5616, 13713.2300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2614, 206, 855000.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2615, 173, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2616, 17, 578700.0000, 68041.1400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2617, 94, 5318100.0000, 445084.3400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2618, 167, 139500.0000, 28659.2600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2619, 171, 225900.0000, 47648.9600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2620, 208, 89100.0000, 37464.8000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2621, 157, 4218666.5601, 350055.7000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2622, 221, 151200.0000, 7715.7500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2623, 92, 92700.0000, 2903.2500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2624, 162, 7674303.1671, 492981.5800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2625, 87, 976500.0000, 60539.9200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2626, 35, 1263476.3283, 33679.0200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2627, 34, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2628, 60, 856308.9600, 43757.7600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2629, 134, 4313517.5160, 232273.1200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2630, 136, 3649120.8930, 177788.0400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2631, 146, 2567273.0544, 173455.7300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2632, 78, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2633, 41, 1630235.8881, 101010.2200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2634, 216, 31500.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2635, 222, 5872500.0000, 303372.1600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2636, 161, 3882370.1958, 281825.4300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2637, 215, 492300.0000, 8612.1200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2638, 114, 3653041.7682, 146483.2000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2639, 145, 5687661.7962, 223990.1300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2640, 68, 415686.6576, 24206.1800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2641, 80, 459796.5216, 18163.5200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2642, 97, 381600.0000, 55979.2100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2643, 154, 7200.0000, 13038.3200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2644, 156, 6276600.0000, 384260.8600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2645, 46, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2646, 163, 1205089.1163, 89567.8800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2647, 195, 0.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2648, 212, 124200.0000, 14679.8400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2649, 166, 137724.4701, 13855.1400, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2650, 95, 16200.0000, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2651, 43, 536446.5750, 0.0000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2652, 25, 937719.6966, 25777.6600, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2653, 57, 397499.3568, 31853.1300, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2654, 120, 3644000.3376, 252520.9000, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2655, 122, 2601312.1200, 172886.7100, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2656, 141, 3568204.3680, 269278.7800, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2657, 186, 2264769.8424, 75176.4500, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2658, 187, 1861893.6660, 80805.6200, 4, 2020)
GO
INSERT [dbo].[ACTPL] ([IDACTPL], [IDAssVAClientsCounties], [Actual], [Plan], [Month], [Year]) VALUES (2659, 71, 233180.9640, 7802.0000, 4, 2020)
GO
SET IDENTITY_INSERT [dbo].[ACTPL] OFF
GO
SET IDENTITY_INSERT [dbo].[AssVA] ON 
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (0, N'I P', N'Fake Manager', NULL)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (22, N'G E', N'GDQLHO EDOWD', 0)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (23, N'G U', N'GUDJRV UDGRLX', 0)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (24, N'L D', N'LDOFLQ DOL', 0)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (25, N'D Q', N'DOEHUWR QLWD', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (26, N'E G', N'ERJGDQ GRJDUX', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (27, N'E J', N'ERJGDQ JUDGLQDUX', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (28, N'F P', N'FDWDOLQ PXQWHDQX', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (29, N'F S', N'FDWDOLQ SHWUH', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (30, N'F S', N'FDWDOLQ SRSD', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (31, N'F V', N'FODXGLX VDYD', 22)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (32, N'F Y', N'FRUQHO YDVLOH', 22)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (33, N'F E', N'FULVWLDQ EODJD', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (34, N'G P', N'GDQ PDCLOX', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (35, N'G W', N'GDQD WULI', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (36, N'G S', N'GDQLHO SRWURFD', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (37, N'G G', N'GUDJRV GXPLWUDFKH', 22)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (38, N'H F', N'HPLOLDQ FULVWHD', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (39, N'P P', N'PDGDOLQ PRGUHDQX', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (40, N'P W', N'PDULDQ WDUDQWLV', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (41, N'P D', N'PDULXV DOGHD', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (42, N'P Y', N'PLUFHD YODGX', 24)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (43, N'Q W', N'QDGLD WUDQGDILU', 22)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (44, N'S F', N'SDXO FULVWHD', 23)
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (45, N'V D', N'VWDPDWH DQGUHL', 24)
GO
SET IDENTITY_INSERT [dbo].[AssVA] OFF
GO
SET IDENTITY_INSERT [dbo].[AssVAClientsCounties] ON 
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (12, 12, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (13, 13, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (14, 14, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (15, 15, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (16, 16, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (17, 17, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (18, 18, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (19, 19, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (20, 20, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (21, 21, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (22, 22, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (23, 23, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (24, 24, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (25, 25, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (26, 26, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (27, 27, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (28, 28, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (29, 29, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (30, 30, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (31, 31, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (32, 32, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (33, 33, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (34, 34, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (35, 35, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (36, 36, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (37, 37, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (38, 38, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (39, 39, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (40, 40, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (41, 41, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (42, 42, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (43, 43, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (44, 44, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (45, 45, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (46, 46, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (47, 47, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (48, 48, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (49, 49, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (50, 50, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (51, 51, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (52, 52, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (53, 53, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (54, 54, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (55, 55, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (56, 56, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (57, 57, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (58, 58, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (59, 59, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (60, 60, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (61, 61, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (62, 62, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (63, 63, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (64, 64, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (65, 65, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (66, 66, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (67, 67, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (68, 68, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (69, 69, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (70, 70, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (71, 71, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (72, 72, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (73, 73, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (74, 74, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (75, 75, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (76, 76, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (77, 77, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (78, 78, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (79, 79, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (80, 80, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (81, 81, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (82, 82, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (83, 83, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (84, 84, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (85, 85, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (86, 86, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (87, 87, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (88, 88, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (89, 89, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (90, 90, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (91, 91, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (92, 92, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (93, 93, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (94, 94, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (95, 95, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (96, 96, 44)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (97, 97, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (98, 98, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (99, 99, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (100, 100, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (101, 101, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (102, 102, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (103, 103, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (104, 104, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (105, 105, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (106, 106, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (107, 107, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (108, 108, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (109, 109, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (110, 110, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (111, 111, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (112, 112, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (113, 113, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (114, 114, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (115, 115, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (116, 116, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (117, 117, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (118, 118, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (119, 119, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (120, 120, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (121, 121, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (122, 122, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (123, 123, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (124, 124, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (125, 125, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (126, 126, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (127, 127, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (128, 128, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (129, 129, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (130, 130, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (131, 131, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (132, 132, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (133, 133, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (134, 134, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (135, 135, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (136, 136, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (137, 137, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (138, 138, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (139, 139, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (140, 140, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (141, 141, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (142, 142, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (143, 143, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (144, 144, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (145, 145, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (146, 146, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (147, 147, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (148, 148, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (149, 149, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (150, 150, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (151, 151, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (152, 152, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (153, 153, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (154, 154, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (155, 155, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (156, 156, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (157, 157, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (158, 158, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (159, 159, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (160, 160, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (161, 161, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (162, 162, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (163, 163, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (164, 164, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (165, 165, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (166, 166, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (167, 167, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (168, 168, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (169, 169, 38)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (170, 170, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (171, 171, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (172, 172, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (173, 173, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (174, 174, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (175, 175, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (176, 176, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (177, 177, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (178, 178, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (179, 179, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (180, 180, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (181, 181, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (182, 182, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (183, 183, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (184, 184, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (185, 185, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (186, 186, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (187, 187, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (188, 188, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (189, 189, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (190, 190, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (191, 191, 41)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (192, 192, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (193, 193, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (194, 194, 36)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (195, 195, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (196, 196, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (197, 197, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (198, 198, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (199, 199, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (200, 200, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (201, 201, 31)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (202, 202, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (203, 203, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (204, 204, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (205, 205, 37)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (206, 206, 26)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (207, 207, 33)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (208, 208, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (209, 209, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (210, 210, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (211, 211, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (212, 212, 42)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (213, 213, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (214, 214, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (215, 215, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (216, 216, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (217, 217, 35)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (218, 218, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (219, 219, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (220, 220, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (221, 221, 40)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (222, 222, 39)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (223, 223, 28)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (224, 224, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (225, 225, 32)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (226, 226, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (227, 227, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (228, 228, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (229, 229, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (230, 230, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (231, 231, 43)
GO
INSERT [dbo].[AssVAClientsCounties] ([IDAssVAClientsCounties], [IDClientsCounties], [IDAssVA]) VALUES (232, 232, 33)
GO
SET IDENTITY_INSERT [dbo].[AssVAClientsCounties] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ShortNameCategory], [IDCategory], [NameCategory]) VALUES (N'DIS', 3, N'DIS')
GO
INSERT [dbo].[Category] ([ShortNameCategory], [IDCategory], [NameCategory]) VALUES (N'KA', 4, N'KA')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (8, N'A D S -', N'ABS DECOR SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (9, N'A S  –', N'ADMET SRL  –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (10, N'A C S -', N'ADULT CONSTRUCT SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (11, N'A S -', N'AKIRE SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (12, N'A S S -', N'ALCROMAL SERVICE SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (13, N'A I S -', N'ALEF IMPEX SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (14, N'A C S -', N'ALVVIMAR COMIMPEX SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (15, N'A T S -', N'APONTI TRADING SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (16, N'A S', N'ARABESQUE SRLBRASOV')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (17, N'A B', N'ARABESQUES BUCURESTI-GLINA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (18, N'A B', N'ARABESQUES BUCURESTI-MILITARI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (19, N'A B', N'ARABESQUES BUCURESTI-OTOPENI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (20, N'A C', N'ARABESQUES CLUJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (21, N'A C', N'ARABESQUES CONSTANTA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (22, N'A C', N'ARABESQUES CRAIOVA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (23, N'A D B', N'ARABESQUES DEPOZIT BACAU')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (24, N'A D P N', N'ARABESQUES DEPOZIT PIATRA NEAMT')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (25, N'A D', N'ARABESQUES DEVA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (26, N'A F', N'ARABESQUES FOCSANI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (27, N'A G', N'ARABESQUES GALATI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (28, N'A I M', N'ARABESQUES IASI MIROSLAVA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (29, N'A I M', N'ARABESQUES IASI MRB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (30, N'A O', N'ARABESQUES ORADEA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (31, N'A P 2', N'ARABESQUES PITESTI 2')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (32, N'A P M', N'ARABESQUES PITESTI MRB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (33, N'A P', N'ARABESQUES PLOIESTI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (34, N'A S G', N'ARABESQUES SEDIU GALATI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (35, N'A S', N'ARABESQUES SIBIU')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (36, N'A V M', N'ARABESQUES VITAN MRB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (37, N'A S -', N'ARCHIMINA SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (38, N'A D G S -', N'ARTEK DECOR GROUP SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (39, N'A C S -', N'ARTSANI COM SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (40, N'A -', N'AVRIL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (41, N'B', N'BASICRA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (42, N'B C S -', N'BATSON CONSTRUCT SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (43, N'B & B', N'BBI &DD B2B')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (44, N'B D S', N'BIEMAR DESIGN SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (45, N'B F H S', N'BRENADO FOR HOUSE SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (46, N'B A (', N'BRICOSTORE ARAD (1620)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (47, N'B B (', N'BRICOSTORE BRAILA (1619)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (48, N'B B (', N'BRICOSTORE BRASOV (1614)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (49, N'B B', N'BRICOSTORE BRICOSTORE')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (50, N'B B 1 C', N'BRICOSTORE BUCURESTI 1 CHIAJNA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (51, N'B B 2 P', N'BRICOSTORE BUCURESTI 2 PANTELIMON')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (52, N'B B 3 O', N'BRICOSTORE BUCURESTI 3 ORHIDEEA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (53, N'B B 4 B', N'BRICOSTORE BUCURESTI 4 BANEASA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (54, N'B C (', N'BRICOSTORE CALARASI (1625)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (55, N'B C (', N'BRICOSTORE CONSTANTA (1617)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (56, N'B D (', N'BRICOSTORE DROBETA (1624)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (57, N'B F (', N'BRICOSTORE FOCSANI (1621)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (58, N'B O (', N'BRICOSTORE ORADEA (1623)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (59, N'B P (', N'BRICOSTORE PITESTI (1618)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (60, N'B P A (', N'BRICOSTORE PKT ARAD (516)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (61, N'B P B M (', N'BRICOSTORE PKT BAIA MARE (2556)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (62, N'B P B (', N'BRICOSTORE PKT BOTOSANI (2549)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (63, N'B P B (', N'BRICOSTORE PKT BRAILA (2559)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (64, N'B P B (', N'BRICOSTORE PKT BRASOV (505)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (65, N'B P B 2', N'BRICOSTORE PKT BUCURESTI 2')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (66, N'B P B 3', N'BRICOSTORE PKT BUCURESTI 3')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (67, N'B P B (', N'BRICOSTORE PKT BUZAU (2558)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (68, N'B P C (', N'BRICOSTORE PKT CLUJ (2541)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (69, N'B P C (', N'BRICOSTORE PKT CONSTANTA (2545)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (70, N'B P C (', N'BRICOSTORE PKT CRAIOVA (2553)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (71, N'B P D (', N'BRICOSTORE PKT DEVA (2562)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (72, N'B P G (', N'BRICOSTORE PKT GALATI (2551)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (73, N'B P I 1', N'BRICOSTORE PKT IASI 1')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (74, N'B P I 2 (', N'BRICOSTORE PKT IASI 2 (2564)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (75, N'B P O (', N'BRICOSTORE PKT ORADEA (510)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (76, N'B P P N (', N'BRICOSTORE PKT PIATRA NEAMT (2563)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (77, N'B P P (', N'BRICOSTORE PKT PITESTI (517)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (78, N'B P S M (', N'BRICOSTORE PKT SATU MARE (2557)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (79, N'B P T (', N'BRICOSTORE PKT TARGOVISTE (2560)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (80, N'B P T M (', N'BRICOSTORE PKT TARGU MURES (2552)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (81, N'B P T 1', N'BRICOSTORE PKT TIMISOARA 1')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (82, N'B P T 2', N'BRICOSTORE PKT TIMISOARA 2')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (83, N'B P (', N'BRICOSTORE PLOIESTI (1615)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (84, N'B S (', N'BRICOSTORE SUCEAVA (1622)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (85, N'B I S -', N'BULZAN IMPEX SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (86, N'C M C S', N'CIPCOS MAR COMPLEX SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (87, N'C C S -', N'COMBI COMIMPEX SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (88, N'C 9 S -', N'COMBRAT 94 SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (89, N'C S -', N'COMCOLOR SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (90, N'C S  –', N'COMKIM SRL  –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (91, N'C 2 S', N'CONALM 2005 SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (92, N'C S -', N'CRISMIH SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (93, N'D S -', N'DAMILA SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (94, N'D C S  -', N'DANEMAR COMPANY SRL  -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (95, N'D C S -', N'DAV CONSTRUCT SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (96, N'D B', N'DD B2B')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (97, N'D B B', N'DD B2B B')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (98, N'D B C', N'DD B2B CJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (99, N'D G', N'DD GR/TR')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (100, N'D I', N'DD IL/CL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (101, N'D R B', N'DD RETAIL B')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (102, N'D D S  –', N'DECORA DESIGN SRL  –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (103, N'D A I (', N'DEDEMAN ALBA IULIA (66)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (104, N'D A (', N'DEDEMAN ARAD (50)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (105, N'D B 1 R (', N'DEDEMAN BACAU 1 REPUBLICII (26)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (106, N'D B 2 A (', N'DEDEMAN BACAU 2 ABATORULUI (89)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (107, N'D B M (', N'DEDEMAN BAIA MARE (63)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (108, N'D B (', N'DEDEMAN BISTRITA (71)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (109, N'D B (', N'DEDEMAN BOTOSANI (37)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (110, N'D B (', N'DEDEMAN BRAILA (25)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (111, N'D B (', N'DEDEMAN BRASOV (55)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (112, N'D B 1 A (', N'DEDEMAN BUCURESTI 1 ACTIUNII (35)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (113, N'D B 2 V', N'DEDEMAN BUCURESTI 2 VALEA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (114, N'D B 3 C (', N'DEDEMAN BUCURESTI 3 COLENTINA (76)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (115, N'D B 4 P (', N'DEDEMAN BUCURESTI 4 PALLADY (81)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (116, N'D B 5 B (', N'DEDEMAN BUCURESTI 5 BANEASA (86)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (117, N'D B 6 P (', N'DEDEMAN BUCURESTI 6 PANTELIMON (84)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (118, N'D B 7 G', N'DEDEMAN BUCURESTI 7 GHENCEA(97)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (119, N'D B (', N'DEDEMAN BUZAU (48)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (120, N'D C (', N'DEDEMAN CALARASI (99)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (121, N'D C (', N'DEDEMAN CLUJ (61)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (122, N'D C (', N'DEDEMAN COMANESTI (31)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (123, N'D C 1 A (', N'DEDEMAN CONSTANTA 1 AGIGEA (49)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (124, N'D C 2 T (', N'DEDEMAN CONSTANTA 2 TOMIS (70)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (125, N'D C (', N'DEDEMAN CRAIOVA (52)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (126, N'D D (', N'DEDEMAN DEVA (78)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (127, N'D D T S (', N'DEDEMAN DROBETA TURNU SEVERIN (64)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (128, N'D F (', N'DEDEMAN FOCSANI (42)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (129, N'D G (', N'DEDEMAN GALATI (72)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (130, N'D H (', N'DEDEMAN HUNEDOARA (85)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (131, N'D I 2 M (', N'DEDEMAN IASI 2 MIROSLAVA (47)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (132, N'D I 3 P (', N'DEDEMAN IASI 3 PRIMAVERII (87)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (133, N'D L (', N'DEDEMAN LUGOJ (92)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (134, N'D M C (', N'DEDEMAN MIERCUREA CIUC (62)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (135, N'D O (', N'DEDEMAN ONESTI (29)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (136, N'D O (', N'DEDEMAN ONESTI (40)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (137, N'D O (', N'DEDEMAN ORADEA (73)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (138, N'D P N (', N'DEDEMAN PIATRA NEAMT (46)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (139, N'D P (', N'DEDEMAN PITESTI (75)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (140, N'D P (', N'DEDEMAN PLOIESTI (74)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (141, N'D R V (', N'DEDEMAN RAMNICU VALCEA (69)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (142, N'D R (', N'DEDEMAN RESITA (59)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (143, N'D R (', N'DEDEMAN ROMAN (44)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (144, N'D S M (', N'DEDEMAN SATU MARE (91)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (145, N'D S (', N'DEDEMAN SIBIU (77)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (146, N'D S (', N'DEDEMAN SLATINA (67)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (147, N'D S (', N'DEDEMAN SLOBOZIA (94)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (148, N'D S (', N'DEDEMAN SRL-ZALAU (83)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (149, N'D S 1 U (', N'DEDEMAN SUCEAVA 1 UNIRII (80)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (150, N'D T (', N'DEDEMAN TARGOVISTE (45)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (151, N'D T J (', N'DEDEMAN TARGU JIU (79)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (152, N'D T M (', N'DEDEMAN TARGU MURES (65)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (153, N'D T 1 D', N'DEDEMAN TIMISOARA 1 DIVIZIA9')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (154, N'D T 2 S (', N'DEDEMAN TIMISOARA 2 SAGULUI (82)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (155, N'D T (', N'DEDEMAN TULCEA (68)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (156, N'D T (', N'DEDEMAN TURDA (93)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (157, N'D V (', N'DEDEMAN VASLUI (33)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (158, N'D I S -', N'DEKOROM INTERNATIONAL SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (159, N'D S S -', N'DISTRICT SUD SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (160, N'D D S -', N'DONI DECOR SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (161, N'D T S -', N'DONI TRADE SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (162, N'D A', N'DSL AG')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (163, N'D A', N'DSL AR')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (164, N'D B A', N'DSL B2B AG')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (165, N'D B A', N'DSL B2B AR')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (166, N'D B B', N'DSL B2B BV')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (167, N'D B C', N'DSL B2B CS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (168, N'D B D', N'DSL B2B DB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (169, N'D B G', N'DSL B2B GJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (170, N'D B M', N'DSL B2B MH')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (171, N'D B M', N'DSL B2B MS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (172, N'D B T', N'DSL B2B TM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (173, N'D B', N'DSL BV')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (174, N'D C', N'DSL CS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (175, N'D D', N'DSL DB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (176, N'D G', N'DSL GJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (177, N'D M', N'DSL MH')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (178, N'D M', N'DSL MS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (179, N'D R A', N'DSL RETAIL AG')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (180, N'D R A', N'DSL RETAIL AR')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (181, N'D R B', N'DSL RETAIL BV')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (182, N'D R C', N'DSL RETAIL CS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (183, N'D R D', N'DSL RETAIL DB')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (184, N'D R D', N'DSL RETAIL DJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (185, N'D R G', N'DSL RETAIL GJ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (186, N'D R M', N'DSL RETAIL MH')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (187, N'D R M', N'DSL RETAIL MS')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (188, N'D R P', N'DSL RETAIL PH')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (189, N'D R T', N'DSL RETAIL TM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (190, N'D T', N'DSL TM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (191, N'D C S', N'DUNLITE COM SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (192, N'D C S -', N'DURABIL COM SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (193, N'E S –', N'ENDLES SRL –COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (194, N'E S T S -', N'EUROCAR SERVICE TELEORMAN SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (195, N'F S', N'FINIVOPS SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (196, N'F C G S', N'FIRST CLASS GROUP SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (197, N'G I S V -', N'GABRIS IMPEX SRL VL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (198, N'G L S –', N'GALACTIC LINES SRL –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (199, N'G', N'GHENCEA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (200, N'I S –', N'ILISCONSULT SRL –COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (201, N'I I', N'INSTANT INTERNATIONAL–REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (202, N'L S A S', N'LENU SI ALINA SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (203, N'L B (', N'LEROYMERLI BACAU (014)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (204, N'L B (', N'LEROYMERLI BRASOV (005)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (205, N'L B (', N'LEROYMERLI BUCURESTI (018)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (206, N'L B 1', N'LEROYMERLI BUCURESTI 1')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (207, N'L B 2', N'LEROYMERLI BUCURESTI 2')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (208, N'L B 3', N'LEROYMERLI BUCURESTI 3')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (209, N'L C 1 T (', N'LEROYMERLI CLUJ 1 TURZII (015)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (210, N'L C 2 A (', N'LEROYMERLI CLUJ 2 A.VLAICU (009)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (211, N'L C (', N'LEROYMERLI CONSTANTA (007)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (212, N'L C (', N'LEROYMERLI CRAIOVA (002)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (213, N'L C ( -', N'LEROYMERLI CRAIOVA (013) -CRAIOVITA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (214, N'L I (', N'LEROYMERLI IASI (010)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (215, N'L O (', N'LEROYMERLI ORADEA (019)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (216, N'L P (', N'LEROYMERLI PLOIESTI (004)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (217, N'L S (', N'LEROYMERLI SIBIU (011)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (218, N'L S (', N'LEROYMERLI SUCEAVA (017)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (219, N'L T M (', N'LEROYMERLI TARGU MURES (012)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (220, N'L T (', N'LEROYMERLI TIMISOARA (008)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (221, N'L T S', N'LIPO TEST SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (222, N'M U S -', N'MANACAT UNV SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (223, N'M S -', N'MAX SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (224, N'M R S -', N'MEMO REX SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (225, N'M I -', N'METALE INTERNATIONA -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (226, N'M C S -', N'MIRADA CONSTRUCT SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (227, N'M S -', N'MIRAGE SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (228, N'M R A', N'MOTORSTART REMARKT ARAD')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (229, N'M R O', N'MOTORSTART REMARKT ORADEA')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (230, N'N', N'NEW')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (231, N'N D S –', N'NEWEXCO DISTRIB SRL –COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (232, N'N S  –', N'NOROCOM SRL  –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (233, N'P 0', N'PALLADY 018')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (234, N'P S -', N'PANTANO SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (235, N'P F S  -', N'PEL-IND FAMILY SRL  -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (236, N'P S -', N'PEX SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (237, N'P R S (', N'PRAKTIKER ROMANIA SABACAU (512)')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (238, N'P C S -', N'PRO CASA SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (239, N'P D S -', N'PROFI DECOR-CONSULT SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (240, N'P I S -', N'PROGOPO IMPEX SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (241, N'R S -', N'RADICAL-GRUP SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (242, N'R S -', N'RECOBOL SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (243, N'R S D -', N'REGATA SRL DB -RSL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (244, N'R G 2 S', N'RGR GROUP 2002 SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (245, N'R C S -', N'ROPE CONSTRUCT SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (246, N'R C S -', N'ROSU COMPANY SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (247, N'R S -', N'ROXEMA SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (248, N'S C S -', N'SEPHARD CASA SRL -REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (249, N'S S -', N'SERSTILL SRL -BBI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (250, N'S T A S', N'SERVICE TOP AGRO SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (251, N'S C S ', N'SIPO COMIMPEX SRL ')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (252, N'S C S -', N'SYRANO CONSTRUCT SRL -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (253, N'S S –', N'SZILANK SRL –REI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (254, N'T M L -', N'TOP MASTER L.T.D. -COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (255, N'T S  –', N'TRAGET SRL  –COM')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (256, N'V B - A', N'VASION BACAU - ABATORULUI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (257, N'V B 1 - B', N'VASION BACAU 1 - BRADULUI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (258, N'V C', N'VASION COMANESTI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (259, N'V M - A', N'VASION MOINESTI - ATELIERELOR')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (260, N'V O', N'VASION ONESTI')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (261, N'V S', N'VASION SRL')
GO
INSERT [dbo].[Clients] ([IDClient], [ShortNameClient], [NameClient]) VALUES (262, N'V S -', N'VITAVERT SRL -REI')
GO
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientsCategory] ON 
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (8, 8, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (9, 9, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (10, 10, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (11, 11, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (12, 12, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (13, 13, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (14, 14, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (15, 15, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (16, 16, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (17, 17, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (18, 18, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (19, 19, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (20, 20, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (21, 21, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (22, 22, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (23, 23, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (24, 24, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (25, 25, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (26, 26, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (27, 27, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (28, 28, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (29, 29, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (30, 30, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (31, 31, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (32, 32, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (33, 33, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (34, 34, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (35, 35, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (36, 36, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (37, 37, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (38, 38, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (39, 39, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (40, 40, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (41, 41, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (42, 42, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (43, 43, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (44, 44, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (45, 45, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (46, 46, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (47, 47, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (48, 48, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (49, 49, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (50, 50, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (51, 51, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (52, 52, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (53, 53, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (54, 54, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (55, 55, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (56, 56, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (57, 57, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (58, 58, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (59, 59, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (60, 60, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (61, 61, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (62, 62, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (63, 63, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (64, 64, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (65, 65, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (66, 66, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (67, 67, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (68, 68, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (69, 69, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (70, 70, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (71, 71, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (72, 72, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (73, 73, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (74, 74, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (75, 75, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (76, 76, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (77, 77, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (78, 78, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (79, 79, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (80, 80, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (81, 81, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (82, 82, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (83, 83, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (84, 84, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (85, 85, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (86, 86, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (87, 87, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (88, 88, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (89, 89, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (90, 90, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (91, 91, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (92, 92, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (93, 93, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (94, 94, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (95, 95, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (96, 96, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (97, 97, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (98, 98, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (99, 99, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (100, 100, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (101, 101, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (102, 102, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (103, 103, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (104, 104, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (105, 105, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (106, 106, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (107, 107, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (108, 108, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (109, 109, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (110, 110, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (111, 111, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (112, 112, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (113, 113, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (114, 114, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (115, 115, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (116, 116, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (117, 117, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (118, 118, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (119, 119, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (120, 120, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (121, 121, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (122, 122, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (123, 123, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (124, 124, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (125, 125, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (126, 126, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (127, 127, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (128, 128, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (129, 129, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (130, 130, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (131, 131, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (132, 132, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (133, 133, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (134, 134, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (135, 135, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (136, 136, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (137, 137, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (138, 138, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (139, 139, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (140, 140, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (141, 141, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (142, 142, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (143, 143, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (144, 144, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (145, 145, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (146, 146, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (147, 147, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (148, 148, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (149, 149, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (150, 150, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (151, 151, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (152, 152, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (153, 153, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (154, 154, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (155, 155, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (156, 156, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (157, 157, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (158, 158, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (159, 159, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (160, 160, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (161, 161, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (162, 162, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (163, 163, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (164, 172, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (165, 173, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (166, 174, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (167, 175, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (168, 176, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (169, 177, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (170, 178, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (171, 190, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (172, 191, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (173, 192, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (174, 193, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (175, 194, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (176, 195, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (177, 196, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (178, 197, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (179, 198, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (180, 199, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (181, 200, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (182, 201, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (183, 202, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (184, 203, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (185, 204, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (186, 205, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (187, 206, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (188, 207, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (189, 208, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (190, 209, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (191, 210, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (192, 211, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (193, 212, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (194, 213, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (195, 214, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (196, 215, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (197, 216, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (198, 217, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (199, 218, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (200, 219, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (201, 220, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (202, 221, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (203, 222, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (204, 223, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (205, 224, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (206, 225, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (207, 226, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (208, 227, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (209, 228, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (210, 229, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (211, 230, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (212, 231, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (213, 232, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (214, 233, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (215, 234, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (216, 235, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (217, 236, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (218, 237, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (219, 238, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (220, 239, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (221, 240, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (222, 241, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (223, 242, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (224, 243, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (225, 244, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (226, 245, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (227, 246, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (228, 247, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (229, 248, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (230, 249, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (231, 250, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (232, 251, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (233, 252, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (234, 253, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (235, 254, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (236, 255, 3)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (237, 256, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (238, 257, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (239, 258, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (240, 259, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (241, 260, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (242, 261, 4)
GO
INSERT [dbo].[ClientsCategory] ([ID], [IDClient], [IDCategory]) VALUES (243, 262, 3)
GO
SET IDENTITY_INSERT [dbo].[ClientsCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientsCounties] ON 
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (12, 8, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (13, 9, 12)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (14, 11, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (15, 12, 14)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (16, 13, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (17, 14, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (18, 15, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (19, 16, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (20, 17, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (21, 18, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (22, 19, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (23, 20, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (24, 21, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (25, 22, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (26, 23, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (27, 24, 14)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (28, 25, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (29, 26, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (30, 27, 11)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (31, 28, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (32, 29, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (33, 30, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (34, 31, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (35, 32, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (36, 33, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (37, 35, 43)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (38, 36, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (39, 37, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (40, 38, 43)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (41, 39, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (42, 40, 44)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (43, 41, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (44, 42, 31)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (45, 44, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (46, 45, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (47, 46, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (48, 47, 7)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (49, 48, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (50, 49, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (51, 50, 25)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (52, 51, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (53, 52, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (54, 53, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (55, 54, 9)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (56, 55, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (57, 56, 26)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (58, 57, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (59, 58, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (60, 59, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (61, 60, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (62, 61, 41)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (63, 62, 8)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (64, 63, 7)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (65, 64, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (66, 65, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (67, 66, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (68, 67, 21)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (69, 68, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (70, 69, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (71, 70, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (72, 71, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (73, 72, 11)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (74, 73, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (75, 74, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (76, 75, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (77, 76, 14)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (78, 77, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (79, 78, 45)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (80, 79, 22)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (81, 80, 42)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (82, 81, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (83, 82, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (84, 83, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (85, 84, 15)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (86, 85, 41)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (87, 86, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (88, 87, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (89, 88, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (90, 89, 40)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (91, 90, 39)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (92, 91, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (93, 92, 18)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (94, 93, 30)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (95, 95, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (96, 98, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (97, 102, 27)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (98, 103, 31)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (99, 104, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (100, 105, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (101, 106, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (102, 107, 41)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (103, 108, 34)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (104, 109, 8)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (105, 110, 7)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (106, 111, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (107, 112, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (108, 113, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (109, 114, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (110, 115, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (111, 116, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (112, 117, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (113, 118, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (114, 119, 21)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (115, 120, 9)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (116, 121, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (117, 122, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (118, 123, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (119, 124, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (120, 125, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (121, 126, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (122, 127, 26)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (123, 128, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (124, 129, 11)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (125, 130, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (126, 131, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (127, 132, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (128, 133, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (129, 134, 40)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (130, 135, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (131, 136, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (132, 137, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (133, 138, 14)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (134, 139, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (135, 140, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (136, 141, 30)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (137, 142, 37)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (138, 143, 14)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (139, 144, 45)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (140, 145, 43)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (141, 146, 27)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (142, 147, 12)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (143, 148, 44)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (144, 149, 15)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (145, 150, 22)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (146, 151, 24)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (147, 152, 42)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (148, 153, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (149, 154, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (150, 155, 16)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (151, 156, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (152, 157, 18)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (153, 158, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (154, 159, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (155, 160, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (156, 161, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (157, 162, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (158, 163, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (159, 173, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (160, 174, 37)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (161, 175, 22)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (162, 176, 24)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (163, 177, 26)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (164, 178, 42)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (165, 190, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (166, 191, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (167, 192, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (168, 193, 44)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (169, 194, 29)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (170, 195, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (171, 197, 30)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (172, 198, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (173, 199, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (174, 200, 34)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (175, 201, 38)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (176, 202, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (177, 203, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (178, 204, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (179, 205, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (180, 206, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (181, 207, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (182, 208, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (183, 209, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (184, 210, 36)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (185, 211, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (186, 212, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (187, 213, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (188, 214, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (189, 215, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (190, 216, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (191, 217, 43)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (192, 218, 15)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (193, 219, 42)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (194, 220, 46)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (195, 221, 26)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (196, 222, 11)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (197, 223, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (198, 224, 40)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (199, 225, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (200, 226, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (201, 227, 17)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (202, 228, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (203, 229, 32)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (204, 231, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (205, 232, 10)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (206, 233, 20)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (207, 234, 33)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (208, 235, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (209, 237, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (210, 238, 15)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (211, 239, 40)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (212, 240, 23)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (213, 241, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (214, 242, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (215, 243, 22)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (216, 245, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (217, 246, 45)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (218, 247, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (219, 248, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (220, 249, 35)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (221, 250, 19)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (222, 252, 28)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (223, 253, 40)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (224, 254, 13)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (225, 255, 11)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (226, 256, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (227, 257, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (228, 258, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (229, 259, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (230, 260, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (231, 261, 6)
GO
INSERT [dbo].[ClientsCounties] ([IDClientsCounties], [IDClient], [IDCounty]) VALUES (232, 262, 33)
GO
SET IDENTITY_INSERT [dbo].[ClientsCounties] OFF
GO
SET IDENTITY_INSERT [dbo].[County] ON 
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BC', 6, N'BC', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BR', 7, N'BR', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BT', 8, N'BT', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'CL', 9, N'CL', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'CT', 10, N'CT', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'GL', 11, N'GL', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'IL', 12, N'IL', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'IS', 13, N'IS', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'NT', 14, N'NT', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'SV', 15, N'SV', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'TL', 16, N'TL', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'VN', 17, N'VN', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'VS', 18, N'VS', 4)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'AG', 19, N'AG', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'B', 20, N'B', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BZ', 21, N'BZ', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'DB', 22, N'DB', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'DJ', 23, N'DJ', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'GJ', 24, N'GJ', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'IF', 25, N'IF', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'MH', 26, N'MH', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'OT', 27, N'OT', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'PH', 28, N'PH', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'TR', 29, N'TR', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'VL', 30, N'VL', 5)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'AB', 31, N'AB', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'AR', 32, N'AR', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BH', 33, N'BH', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BN', 34, N'BN', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'BV', 35, N'BV', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'CJ', 36, N'CJ', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'CS', 37, N'CS', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'HD', 38, N'HD', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'HG', 39, N'HG', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'HR', 40, N'HR', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'MM', 41, N'MM', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'MS', 42, N'MS', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'SB', 43, N'SB', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'SJ', 44, N'SJ', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'SM', 45, N'SM', 6)
GO
INSERT [dbo].[County] ([ShortNameCounty], [IDCounty], [NameCounty], [IDRegion]) VALUES (N'TM', 46, N'TM', 6)
GO
SET IDENTITY_INSERT [dbo].[County] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (2, N'IT')
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (3, N'HR')
GO
INSERT [dbo].[Department] ([IDDepartment], [Name]) VALUES (4, N'asda')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([IDEmployee], [Name], [IDDepartment]) VALUES (1, N'test', 2)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'userAndrei', 31, 31)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'userAndrei', 32, 32)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'userAndrei', 37, 37)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'userAndrei', 43, 43)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 22, 22)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 31, 22)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 32, 22)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 37, 22)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 43, 22)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 23, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 27, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 28, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 33, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 35, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 36, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 41, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 44, 23)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 24, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 25, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 26, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 29, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 30, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 34, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 38, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 39, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 40, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 42, 24)
GO
INSERT [dbo].[KPI11Managers] ([UserId], [IDAssVA], [IDManager]) VALUES (N'prisasm', 45, 24)
GO
INSERT [dbo].[RE] ([IDRoom], [IDEmp], [CreatedDate]) VALUES (1, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Region] ON 
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'EST', 4, N'EST')
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'SUD', 5, N'SUD')
GO
INSERT [dbo].[Region] ([ShortNameRegion], [IDRegion], [NameRegion]) VALUES (N'VEST', 6, N'VEST')
GO
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 
GO
INSERT [dbo].[Room] ([ID], [Name]) VALUES (1, N'home      ')
GO
SET IDENTITY_INSERT [dbo].[Room] OFF
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
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([IDDepartment])
REFERENCES [dbo].[Department] ([IDDepartment])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[RE]  WITH CHECK ADD  CONSTRAINT [FK_RE_Employee] FOREIGN KEY([IDEmp])
REFERENCES [dbo].[Employee] ([IDEmployee])
GO
ALTER TABLE [dbo].[RE] CHECK CONSTRAINT [FK_RE_Employee]
GO
ALTER TABLE [dbo].[RE]  WITH CHECK ADD  CONSTRAINT [FK_RE_Room] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[RE] CHECK CONSTRAINT [FK_RE_Room]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createKPI11](
@userId nvarchar(1000),
@year int,
@managers nvarchar(1000), 
@clients nvarchar(100)
)
AS
BEGIN
	SET NOCOUNT ON;
	
declare @clientsId table(Client int)
if(len(trim(@clients)))>0
insert into @clientsId (Client)
select * from String_Split(@clients,',')
else
insert into @clientsId (Client)
select IDClient from Clients


delete from KPI11Managers  where @userId = UserId

declare @managersID table(id int identity, ManagerVar int)
insert into @managersID(ManagerVar)
select a.idassva from String_Split(@managers,',') x
inner join AssVa a on a.idManager = value 



declare @managerVar int
DECLARE @I INT, @maxManagers int
select @maxManagers  = count(*) from @managersID
print @maxManagers
set @I=1

WHILE @I <= @maxManagers
BEGIN
select @managerVar= ManagerVar from @managersID where id=@I
--print @managerVar
--select * from @managersID where id=@I
;WITH cte_org AS (
    SELECT 
		a.IDAssVA,a.IDManager, a.NameAssVA , cast ('' as nvarchar(100))  Manager
	 FROM AssVA a
	 --inner join @managersID on a.IDManager = ManagerVar
    WHERE a.IDAssVA =@managerVar
    UNION ALL
    SELECT a.IDAssVA,a.IDManager,a.NameAssVA as AssVA, c.NameAssVA as Manager
    FROM 
        AssVA a
        INNER JOIN cte_org c 
            ON a.IDManager =c.IDAssVA 
)

INSERT INTO [KPI11Managers]
           (
		   [UserId]
           ,[IDAssVA]
           ,[IDManager]
)
SELECT @userId, IDAssVA,@managerVar  FROM cte_org

Set @I= @I+1
end
--INSERT INTO [KPI11]
--           (
--		   [UserId]
--		   ,[IDClient]
--           ,[IDAssVA]
--           ,[IDManager]
--           ,[PlanYTD]
--           ,[ActualYTD])
--select IDClient, c.IDAssVA,m.IDManager, IDCounty,sum([Plan]) as PlanYTD,sum(Actual) as ActualYTD 
----sinto KPI11
--from vwACTPL_Ass_Clients c 
--inner join AssVA m on c.IDAssVA = m.IDManager
--where c.Year =Year and c.Month <@Month
--group by IDClient, c.IDAssVA,IDCounty, m.IDManager

--select * from @clientsId

;with Data(IdManager, yearToData,PlanYTD, ActualYTD ) as
(select  m.IDManager, kpi.Year
,sum([Plan]) as PlanYTD
,sum(Actual) as ActualYTD 
from vwKPI11Data kpi
inner join KPI11Managers m on kpi.IDAssVA = m.IDAssVA and m.UserId= @userId
inner join @clientsId c on kpi.IDClient= c.Client
group by  m.IDManager, kpi.Year
)
select 
LAG(ActualYTD) OVER (ORDER BY IDManager, yearToData) PreviousValueActualYTD,
LAG(PlanYTD) OVER (ORDER BY IDManager, yearToData) PreviousValuePlanYTD,
--LEAD(Value) OVER (ORDER BY IDManager, yearToData) NextValue,
* from Data d
where d.yearToData >=@year-1
END

GO



GO
/****** Object:  View [dbo].[vwAssClients]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAssClients]
AS
SELECT dbo.Clients.IDClient, dbo.Clients.ShortNameClient, dbo.Clients.NameClient, dbo.AssVA.IDAssVA, dbo.AssVA.ShortNameAssVA, dbo.AssVA.NameAssVA, dbo.AssVA.IDManager,dbo.County.IDCounty,  dbo.County.ShortNameCounty, dbo.County.NameCounty, dbo.Country.ShortNameCountry, dbo.Country.NameCountry, dbo.AssVAClientsCounties.IDAssVAClientsCounties
FROM  dbo.AssVA INNER JOIN
       dbo.AssVAClientsCounties ON dbo.AssVA.IDAssVA = dbo.AssVAClientsCounties.IDAssVA INNER JOIN
       dbo.ClientsCounties ON dbo.AssVAClientsCounties.IDClientsCounties = dbo.ClientsCounties.IDClientsCounties INNER JOIN
       dbo.Clients ON dbo.ClientsCounties.IDClient = dbo.Clients.IDClient INNER JOIN
       dbo.County ON dbo.ClientsCounties.IDCounty = dbo.County.IDCounty INNER JOIN
       dbo.Country ON dbo.County.IDCountry = dbo.Country.IDCountry
GO
/****** Object:  View [dbo].[vwACTPL_Ass_Clients]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwACTPL_Ass_Clients]
AS
SELECT dbo.vwAssClients.IDClient, dbo.vwAssClients.ShortNameClient, dbo.vwAssClients.NameClient, dbo.vwAssClients.IDAssVA, dbo.vwAssClients.ShortNameAssVA, dbo.vwAssClients.NameAssVA, dbo.vwAssClients.IDManager,dbo.vwAssClients.IDCounty, dbo.vwAssClients.ShortNameCounty, dbo.vwAssClients.NameCounty, dbo.vwAssClients.ShortNameCountry, dbo.vwAssClients.NameCountry, dbo.vwAssClients.IDAssVAClientsCounties, dbo.ACTPL.Actual, dbo.ACTPL.[Plan], dbo.ACTPL.Month, dbo.ACTPL.Year
FROM  dbo.ACTPL INNER JOIN
       dbo.vwAssClients ON dbo.ACTPL.IDAssVAClientsCounties = dbo.vwAssClients.IDAssVAClientsCounties
GO
/****** Object:  View [dbo].[vwAssManager]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAssManager]
AS
SELECT dbo.AssVA.*, AssVA_1.ShortNameAssVA AS ShortManager, AssVA_1.NameAssVA AS Manager
FROM  dbo.AssVA INNER JOIN
         dbo.AssVA AS AssVA_1 ON dbo.AssVA.IDManager = AssVA_1.IDAssVA
GO
/****** Object:  View [dbo].[vwClientsBase]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwClientsBase]
AS
SELECT dbo.ClientsCategory.*, dbo.Category.ShortNameCategory, dbo.Category.NameCategory, dbo.Clients.ShortNameClient, dbo.Clients.NameClient
FROM  dbo.Category INNER JOIN
         dbo.ClientsCategory ON dbo.Category.IDCategory = dbo.ClientsCategory.IDCategory INNER JOIN
         dbo.Clients ON dbo.ClientsCategory.IDClient = dbo.Clients.IDClient
GO
/****** Object:  View [dbo].[vwClientsCountryCategory]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwClientsCountryCategory]
AS
SELECT dbo.Clients.IDClient, dbo.Clients.ShortNameClient, dbo.Clients.NameClient, dbo.County.ShortNameCounty, dbo.County.NameCounty, dbo.Country.ShortNameCountry, dbo.Country.NameCountry, dbo.Category.ShortNameCategory, dbo.Category.NameCategory
FROM  dbo.ClientsCounties INNER JOIN
         dbo.County ON dbo.ClientsCounties.IDCounty = dbo.County.IDCounty INNER JOIN
         dbo.Country ON dbo.County.IDCountry = dbo.Country.IDCountry INNER JOIN
         dbo.Clients ON dbo.ClientsCounties.IDClient = dbo.Clients.IDClient INNER JOIN
         dbo.ClientsCategory ON dbo.Clients.IDClient = dbo.ClientsCategory.IDClient INNER JOIN
         dbo.Category ON dbo.ClientsCategory.IDCategory = dbo.Category.IDCategory
GO
/****** Object:  View [dbo].[vwCounty]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCounty]
AS
SELECT dbo.County.*, dbo.Country.ShortNameCountry, dbo.Country.NameCountry
FROM  dbo.Country INNER JOIN
         dbo.County ON dbo.Country.IDCountry = dbo.County.IDCountry
GO
/****** Object:  View [dbo].[vwKPI11Data]    Script Date: 5/9/2021 11:57:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vwKPI11Data]
AS
SELECT dbo.ACTPL.IDACTPL, dbo.ACTPL.IDAssVAClientsCounties, dbo.ACTPL.Actual, dbo.ACTPL.[Plan], dbo.AssVAClientsCounties.IDAssVA, dbo.Clients.IDClient
, dbo.ACTPL.Month, dbo.ACTPL.Year
FROM  dbo.ClientsCounties INNER JOIN
         dbo.Clients ON dbo.ClientsCounties.IDClient = dbo.Clients.IDClient INNER JOIN
         dbo.ACTPL INNER JOIN
         dbo.AssVAClientsCounties ON dbo.ACTPL.IDAssVAClientsCounties = dbo.AssVAClientsCounties.IDAssVAClientsCounties ON dbo.ClientsCounties.IDClientsCounties = dbo.AssVAClientsCounties.IDClientsCounties
GO
