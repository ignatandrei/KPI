drop function [dbo].[SP_CCEncrypt]
go
create function [dbo].[SP_CCEncrypt]
( @Ptext as varchar(500),@SHIFTNO as tinyint  )
returns varchar(500)
AS
BEGIN

declare @Etext as varchar(500) =''
declare @pc as varchar(1)
Declare @i as smallint = 1
Declare @n as smallint
set @n = len(@Ptext)
set @Ptext = upper(@Ptext)
while @i < = @n
BEGIN
set @pc = SUBSTRING(@Ptext, @i, 1)
if ascii(@pc) between 65 and 90
if ascii(@pc)+@SHIFTNO > 90
set @pc = char((ascii(@pc)+@SHIFTNO)-90+64)
else
set @pc = char((ascii(@pc)+@SHIFTNO))
set @Etext = @Etext + @pc
Set @i = @i + 1
END
return  @Etext
END

go
delete from ACTPL
delete from AssVAClientsCounties --where IDAssVAClientsCounties>11
delete from ClientsCategory --where id>7
delete from Category --where IDCategory>2
delete from AssVAClientsCounties --where IDAssVAClientsCounties>11
delete from [ClientsCounties] --where IDClientsCounties>11
delete from County --where IDCounty>5
delete from Clients --where IDClient>7
delete from AssVA --where IDAssVA>21
delete from Region --where IDRegion>4
  

update ImportSql$ set NumeAssVA =trim(NumeAssVA)
go
drop view viewDatePrimareAssVA
go
create view viewDatePrimareAssVA
as
SELECT  [Row],[Color]
      ,[Regiune]
      ,[NumeAssVA]
      ,[CategorieClienti/ Client mama]
      ,[Judet]
      ,[Adresa livrare]
      ,[Adresa de livrare]
      ,[Customer/Plant]
      ,[Customer Name/Plant]
      ,[Ship-to party]
      ,[Adresa de livare]
, coalesce([Adresa de livare], [Adresa de livrare],[Adresa livrare],
 [CategorieClienti/ Client mama]) as NumeFirmaLocala
  FROM  [ImportSql$]
  where Color=4142


  go

drop view viewDatePrimareAssVAManager
go

  create view viewDatePrimareAssVAManager
as
SELECT  [Row],[Color]
      ,[Regiune]
      ,[NumeAssVA]
      ,[CategorieClienti/ Client mama]
      ,[Judet]
      ,[Adresa livrare]
      ,[Adresa de livrare]
      ,[Customer/Plant]
      ,[Customer Name/Plant]
      ,[Ship-to party]
      ,[Adresa de livare]
  FROM  [ImportSql$]
  where Color=15

  --select top 10 * from viewDatePrimareAssVA
  go

  --select distinct Judet from viewDatePrimareAssVA

  --where Judet is not null 
  --and len(Judet)=2 
  --order by 1


go
INSERT INTO [dbo].[Region]
           ([ShortNameRegion]
           ,[NameRegion])

select distinct Regiune, Regiune from viewDatePrimareAssVA

  where Regiune is not null 
  --and len(Regiune)=2 
  --order by 1

GO

SET IDENTITY_INSERT [dbo].[AssVA] ON 
GO
INSERT [dbo].[AssVA] ([IDAssVA], [ShortNameAssVA], [NameAssVA], [IDManager]) VALUES (0, N'FK', N'Fake Manager', NULL)
go
SET IDENTITY_INSERT [dbo].[AssVA] OFF
go

INSERT INTO [AssVA]
          ([ShortNameAssVA]
           ,[NameAssVA]
           ,[IDManager])
           
select 'a',NumeAssVA, 0 from viewDatePrimareAssVAManager
group by NumeAssVA
having Len(NUmeAssVA)>0

go


INSERT INTO [dbo].[AssVA]
          ([ShortNameAssVA]
           ,[NameAssVA]
           ,[IDManager])
           
select 'a',NumeAssVA, null from viewDatePrimareAssVA
group by NumeAssVA
having Len(NUmeAssVA)>0
go
drop view viewNameManager1
go
create view viewNameManager1
as
select 
q.NameAssVA as ASSVA, man.NumeAssVA as Manager, a.IDAssVA as IDManager

 from(
select 
min(ass.ROw) as assRow ,ass.NumeAssVA as NameAssVA, min(man.Row) as ManRow
from viewDatePrimareAssVA ass
inner join viewDatePrimareAssVAManager man
on ass.row<man.row
where Len(ass.NUmeAssVA)>0
and len(man.NumeAssVA)>0
group by ass.NumeAssVA 
--having ass.NumeAssVA like '%ava%'
--or ass.NumeAssVA like '%rand%'
) q
inner join viewDatePrimareAssVAManager man on man.Row = q.ManRow
inner join AssVA a on a.NameAssVA = man.NumeAssVA

  go

  --select * from viewNameManager1
  go
  update AssVA
  set IDManager = m.IDManager
  from AssVA a inner join viewNameManager1 m
  on a.NameAssVA = m.ASSVA

  go
  insert into County(IDRegion, NameCounty,ShortNameCounty)

  select distinct r.IDRegion,  a.Judet , a.Judet from viewDatePrimareAssVA a
  inner join Region r on r.NameRegion = a.Regiune
	where len(a.judet)>0 and len(a.Judet)<5 --BR+TL

	go




INSERT INTO [Clients]
           ([ShortNameClient]
           ,[NameClient])
     select distinct  'a',a.NumeFirmaLocala from viewDatePrimareAssVA  a
	 where len(a.NumeFirmaLocala)>0
GO



INSERT INTO [dbo].[ClientsCounties]
           ([IDClient]
           ,[IDCounty])
select distinct c.IDClient, co.IDCounty from viewDatePrimareAssVA a
inner join County co on co.NameCounty = a.Judet  
inner join Clients c on c.NameClient = a.NumeFirmaLocala

GO

INSERT INTO [AssVAClientsCounties]
           ([IDClientsCounties]
           ,[IDAssVA])


select cc.IDClientsCounties ,ass.IDAssVA  from viewDatePrimareAssVA a
inner join County co on co.NameCounty = a.Judet  
inner join Clients c on c.NameClient = a.NumeFirmaLocala
inner join AssVA ass on a.NumeAssVA = ass.NameAssVA
inner join ClientsCounties cc on cc.IDClient = c.IDClient and cc.IDCounty = co.IDCounty

go
drop view viewCategorie
go
create view viewCategorie
as

select row , [CategorieClienti/ Client mama] from ImportSql$ 
where Color = 24
and len([CategorieClienti/ Client mama])<5
go

insert into Category(ShortNameCategory, NameCategory)
select distinct [CategorieClienti/ Client mama] , [CategorieClienti/ Client mama]  from viewCategorie

go

drop view viewFirmaCategorie
go
create view viewFirmaCategorie
as
select 
max(ass.ROw) as assRow ,ass.NumeFirmaLocala , max(cat.Row) as CategorieRow
from viewDatePrimareAssVA ass
inner join viewCategorie cat
on cat.row<ass.row
where Len(ass.NUmeAssVA)>0
and len(cat.[CategorieClienti/ Client mama])>0
group by ass.NumeFirmaLocala 

go

INSERT INTO [dbo].[ClientsCategory]
           ([IDClient]
           ,[IDCategory])

select cl.IDClient,ca.IDCategory
from viewDatePrimareAssVA ass
inner join viewFirmaCategorie fc on ass.Row = fc.assRow
inner join viewCategorie cat on cat.Row = fc.CategorieRow
inner join Clients cl on cl.NameClient = ass.NumeFirmaLocala
inner join Category ca on ca.NameCategory = cat.[CategorieClienti/ Client mama] 


--select cl.NameClient, count(*) from Clients cl
--group by cl.NameClient
--order by 2 desc
  --select * from AssVA 
  --select * from Region
  --select * from County
  --select * from Clients
  --select * from [ClientsCounties]

  --select * from AssVAClientsCounties
  --select * from ClientsCategory

INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])



  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales IAN 2019 ACT],0),coalesce(excel.[Sales Ian 2019 ACT],0), 
  1,2019
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  

  

INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])



  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales IAN 2020 ACT],0),coalesce(excel.[Sales Ian 2020 PL],0), 
  1,2020
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  

INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])



  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales FEB 2020 ACT],0),coalesce(excel.[Sales FEB 2020 PL],0), 
  2,2020
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row

INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])



  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales FEB 2019 ACT],0),coalesce(excel.[Sales FEB 2019 ACT],0), 
  2,2019
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  


INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])

  
  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[SALES 2020 MAR PL],0),coalesce(excel.[Sales 2020 MAR ACT],0), 
  3,2020
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row

INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])



  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales 2019 MAR ACT],0),coalesce(excel.[Sales 2019 MAR ACT],0), 
  3,2019
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  
  


INSERT INTO [dbo].[ACTPL]
           ([IDAssVAClientsCounties]
           ,[Actual]
           ,[Plan]
           ,[Month]
           ,[Year])

  
  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[SALES APR 2020 PL],0),coalesce(excel.[Sales APR 2020 ACT],0), 
  4,2020
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  
  select asscc.IDAssVAClientsCounties ,
  coalesce(excel.[Sales 2019 APR ACT],0),coalesce(excel.[Sales 2019 APR ACT],0), 
  3,2019
  from AssVAClientsCounties asscc
  inner join ClientsCounties cc on cc.IDClientsCounties = asscc.IDClientsCounties
  inner join Clients cl on cl.IDClient =cc.IDClient
  inner join County co on co.IDCounty = cc.IDCounty
  inner join viewDatePrimareAssVA pr on pr.NumeFirmaLocala = cl.NameClient and co.NameCounty = pr.Judet
  inner join ImportSql$ excel on excel.Row = pr.Row
  
  

  
  --select * from ACTPL 


  update AssVA set NameAssVA = dbo.SP_CCEncrypt(NameAssVA,3)

update AssVA 
set ShortNameAssVA = sn
from 
AssVA a inner join (
SELECT nameassva, string_agg(substring(value,1,1),' ') sn FROM 
AssVA
cross apply
STRING_SPLIT(NameAssVA, ' ')

group by NameAssVA)  q on q.NameAssVA  = a.NameAssVA;

update Clients 
set ShortNameClient = sn
from 
Clients a inner join (
SELECT NameClient , string_agg(substring(value,1,1),' ') sn FROM 
Clients
cross apply
STRING_SPLIT(NameClient, ' ')

group by NameClient)  q on q.NameClient= a.NameClient;


--select distinct Month,YEAR from ACTPL order by 2, 1


update ACTPL set Actual = Actual * FLOOR(RAND()*(10-5+1)+5) 
update ACTPL set [Plan] = [Plan]* FLOOR(RAND()*(10-1+1)+1);

--select top 10 * from ACTPL where Year=2019 order by IDACTPL