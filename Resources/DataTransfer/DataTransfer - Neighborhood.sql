USE [Countries]
GO

INSERT INTO [dbo].[Neighborhood]
           ([AreaID]
           ,[NeighborhoodName]
           ,[ZipCode])
	 SELECT AreaCT.AreaID, LTRIM(RTRIM(DT.[Mahalle])), LTRIM(RTRIM(DT.[PK]))
	 FROM Cities AS CitiesCT
	 INNER JOIN Counties AS CountiesCT
	 ON CountiesCT.CityID = CitiesCT.CityID
	 INNER JOIN Area AS AreaCT
	 ON AreaCT.CountyID = CountiesCT.CountyID

	 INNER JOIN ['Ýl-Ýlçe-Semt-Mahalle-PK$'] AS DT
	 ON [il] = CitiesCT.CityName AND [ilçe] = CountiesCT.CountyName AND [semt_bucak_belde] = AreaCT.AreaName
	 ORDER BY CitiesCT.CityName, CountiesCT.CountyName, AreaCT.AreaName, DT.[Mahalle]
GO