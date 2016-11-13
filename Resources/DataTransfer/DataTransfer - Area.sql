USE [Countries]
GO

INSERT INTO [Area]
           ([CountyID]
           ,[AreaName])
	 SELECT CountiesCT.CountyID, LTRIM(RTRIM(DT.[semt_bucak_belde]))
	 FROM Cities AS CitiesCT
	 INNER JOIN Counties AS CountiesCT
	 ON CountiesCT.CityID = CitiesCT.CityID

	 INNER JOIN ['Ýl-Ýlçe-Semt$'] AS DT
	 ON [il] = CitiesCT.CityName AND [ilçe] = CountiesCT.CountyName
	 ORDER BY CitiesCT.CityName, CountiesCT.CountyName, DT.[semt_bucak_belde]
GO