drop procedure createKPI11
go
CREATE PROCEDURE createKPI11
AS
BEGIN
	SET NOCOUNT ON;
declare @year int, @month int
set @year = Year(getdate())
set @month = MONTH(getdate())
--select c.Month, * from vwACTPL_Ass_Clients c where c.Year =Year and c.Month <@Month
select IDClient, c.IDAssVA,m.IDManager, IDCounty,sum([Plan]) as PlanYTD,sum(Actual) as ActualYTD 
into KPI11
from vwACTPL_Ass_Clients c 
inner join AssVA m on c.IDAssVA = m.IDManager
where c.Year =Year and c.Month <@Month
group by IDClient, c.IDAssVA,IDCounty, m.IDManager

END
GO

exec createKPI11
