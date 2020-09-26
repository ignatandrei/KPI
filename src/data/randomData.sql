

DELETE FROM [dbo].[ACTPL]

declare @maxRecordsACTPL int, @RecordsACTPLLoop int
set @maxRecordsACTPL =11
set @RecordsACTPLLoop = 0


declare @year int, @month int
set @year = Year(getdate())
set @month = MONTH(getdate())-1
declare @max int, @min int
set @min = 100
set @max = 1000

print @month
declare @monthLoop int


declare @actual money , @plan money
set @actual   = ABS(CHECKSUM(NEWID()) % (@max - @min + 1)) + @min
while @RecordsACTPLLoop<@maxRecordsACTPL
begin
set @RecordsACTPLLoop = @RecordsACTPLLoop+1
set @monthLoop = 0

	while(@monthLoop < @month)
	begin
	set @monthLoop= @monthLoop+1
	set @plan   = ABS(CHECKSUM(NEWID()) % (@max - @min + 1)) + @min

	INSERT INTO [dbo].[ACTPL]
			   ([IDAssVAClientsCounties]
			   ,[Actual]
			   ,[Plan]
			   ,[Month]
			   ,[Year])
		 VALUES
			   (@RecordsACTPLLoop
			   ,@actual
			   ,@plan
			   ,@monthLoop
			   ,@year)

	end

end

