USE [tests]
GO
/****** Object:  View [dbo].[vwCounty]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwCounty]
GO
/****** Object:  View [dbo].[vwClientsCountryCategory]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwClientsCountryCategory]
GO
/****** Object:  View [dbo].[vwClientsBase]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwClientsBase]
GO
/****** Object:  View [dbo].[vwAssManager]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwAssManager]
GO
/****** Object:  View [dbo].[vwACTPL_Ass_Clients]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwACTPL_Ass_Clients]
GO
/****** Object:  View [dbo].[vwAssClients]    Script Date: 9/26/2020 9:54:46 AM ******/
DROP VIEW [dbo].[vwAssClients]
GO
/****** Object:  View [dbo].[vwAssClients]    Script Date: 9/26/2020 9:54:46 AM ******/
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
/****** Object:  View [dbo].[vwACTPL_Ass_Clients]    Script Date: 9/26/2020 9:54:46 AM ******/
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
/****** Object:  View [dbo].[vwAssManager]    Script Date: 9/26/2020 9:54:46 AM ******/
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
/****** Object:  View [dbo].[vwClientsBase]    Script Date: 9/26/2020 9:54:46 AM ******/
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
/****** Object:  View [dbo].[vwClientsCountryCategory]    Script Date: 9/26/2020 9:54:46 AM ******/
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
/****** Object:  View [dbo].[vwCounty]    Script Date: 9/26/2020 9:54:46 AM ******/
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
