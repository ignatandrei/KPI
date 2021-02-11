drop view viewDatePrimareAssVA
go
create view viewDatePrimareAssVA
as
SELECT  [Color]
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
      ,[Sales IAN 2019 ACT]
      ,[Sales Ian 2020 PL]
      ,[Sales IAN 2020 ACT]
      ,[Volume Ian 2019 ACT]
      ,[Volume Ian 2020 ACT]
      ,[Sales FEB 2019 ACT]
      ,[Sales Feb 2020 PL]
      ,[Sales Feb 2020 ACT]
      ,[Volume 2019 ACT]
      ,[Volume 2020 ACT]
  FROM  [ImportSql$]
  where Color=4142

  go
  --select top 10 * from viewDatePrimareAssVA

  select distinct Judet from viewDatePrimareAssVA

  where Judet is not null 
  and len(Judet)=2 
  order by 1

  USE [tests]
GO
delete from Region where IDRegion>3
go
INSERT INTO [dbo].[Region]
           ([ShortNameRegion]
           ,[NameRegion])

select distinct Judet, Judet from viewDatePrimareAssVA

  where Judet is not null 
  and len(Judet)=2 
  order by 1

GO
delete from AssVA where IDAssVA>21
go
INSERT INTO [dbo].[AssVA]
          ([ShortNameAssVA]
           ,[NameAssVA]
           ,[IDManager])
           
select 'a',NumeAssVA, null from viewDatePrimareAssVA
group by NumeAssVA
having Len(NUmeAssVA)>0
go
select top 1005* from AssVA


           


  