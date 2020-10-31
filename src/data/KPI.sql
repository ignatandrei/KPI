DROP TABLE [dbo].[KPI11Managers]
GO

/****** Object:  Table [dbo].[KPI11]    Script Date: 9/26/2020 11:43:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KPI11Managers](
	[UserId] nvarchar(1000) not null,
--	[IDClient] [bigint] NULL,
	[IDAssVA] [bigint] NOT NULL,
	[IDManager] [bigint] NULL,
	--[PlanYTD] [money] NULL,
	--[ActualYTD] [money] NULL
-- CONSTRAINT [PK_KPI11] PRIMARY KEY CLUSTERED 
--(
--	[ID] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

go
DROP TABLE [dbo].[KPI11Clients]
GO

/****** Object:  Table [dbo].[KPI11]    Script Date: 9/26/2020 11:43:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KPI11Clients](
	[UserId] nvarchar(1000) not null,
	[IDClient] [bigint] NOT NULL,
	[IDRegion] [bigint] NULL,
) ON [PRIMARY]

drop procedure createKPI11
--DROP TABLE KPI11
go
CREATE PROCEDURE createKPI11(
@userId nvarchar(1000),
@managers nvarchar(1000), @clients nvarchar(100))
AS
BEGIN
	SET NOCOUNT ON;
	
declare @year int, @month int
set @year = Year(getdate())
set @month = MONTH(getdate())

delete from KPI11Managers  where @userId = UserId

declare @managersID table(id int identity, ManagerVar int)
insert into @managersID(ManagerVar)
select * from String_Split(@managers,',')

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
    WHERE idmanager =@managerVar
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



END
GO

exec createKPI11 'a','20,19',''
select * from KPI11Managers
select * from KPI11Clients