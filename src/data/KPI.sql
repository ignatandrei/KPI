
USE [tests]
GO
/****** Object:  StoredProcedure [dbo].[createKPI11]    Script Date: 2/13/2021 12:16:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[createKPI11](
@userId nvarchar(1000),
@yearStart int,
@monthStart int,
@yearEnd int,
@monthEnd int,
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
(select  m.IDManager, kpi.Year, kpi.Month
,sum([Plan]) as PlanYTD
,sum(Actual) as ActualYTD 
from vwKPI11Data kpi
inner join KPI11Managers m on kpi.IDAssVA = m.IDAssVA and m.UserId= @userId
inner join @clientsId c on kpi.IDClient= c.Client
group by  m.IDManager, kpi.Year, kpi.Month
)
select 
LAG(ActualYTD) OVER (ORDER BY IDManager, yearToData) PreviousValueActualYTD,
LAG(PlanYTD) OVER (ORDER BY IDManager, yearToData) PreviousValuePlanYTD,
--LEAD(Value) OVER (ORDER BY IDManager, yearToData) NextValue,
* from Data d
where
(d.yearToData >= @yearStart   and d.MonthToData>= @monthStart)

and 
( d.yearToData<=@yearEnd and d.MonthToData<= @monthEnd)


END

go

exec sp_executesql N'exec createKPI11 @p0,@p1, @p2, @p3
',N'@p0 nvarchar(4000),@p1 int,@p2 nvarchar(4000),@p3 nvarchar(4000)',
@p0=N'userAndrei',@p1=2020,@p2=N'22',@p3=N''

