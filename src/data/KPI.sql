DROP TABLE [dbo].[KPI11]
GO

/****** Object:  Table [dbo].[KPI11]    Script Date: 9/26/2020 11:43:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KPI11](
	[IDClient] [bigint] NOT NULL,
	[IDAssVA] [bigint] NOT NULL,
	[IDManager] [bigint] NULL,
	[IDCounty] [bigint] NOT NULL,
	[PlanYTD] [money] NULL,
	[ActualYTD] [money] NULL
) ON [PRIMARY]

go
drop procedure createKPI11
--DROP TABLE KPI11
go
CREATE PROCEDURE createKPI11
AS
BEGIN
	SET NOCOUNT ON;
	
declare @year int, @month int
set @year = Year(getdate())
set @month = MONTH(getdate())

delete from KPI11

INSERT INTO [KPI11]
           ([IDClient]
           ,[IDAssVA]
           ,[IDManager]
           ,[IDCounty]
           ,[PlanYTD]
           ,[ActualYTD])
select IDClient, c.IDAssVA,m.IDManager, IDCounty,sum([Plan]) as PlanYTD,sum(Actual) as ActualYTD 
--sinto KPI11
from vwACTPL_Ass_Clients c 
inner join AssVA m on c.IDAssVA = m.IDManager
where c.Year =Year and c.Month <@Month
group by IDClient, c.IDAssVA,IDCounty, m.IDManager



END
GO

exec createKPI11
