USE [Countries]
GO

INSERT INTO [dbo].[Neighborhood]
           ([DistrictID]
           ,[NeighborhoodName]
           ,[ZipCode])
	 SELECT DistrictCT.DistrictID, LTRIM(RTRIM(DT.[Mahalle])), LTRIM(RTRIM(DT.[PK]))
	 FROM City AS CityCT
	 INNER JOIN Town AS TownCT
	 ON TownCT.CityID = CityCT.CityID
	 INNER JOIN District AS DistrictCT
	 ON DistrictCT.TownID = TownCT.TownID

	 INNER JOIN ['Ýl-Ýlçe-Semt-Mahalle-PK$'] AS DT
	 ON [il] = CityCT.CityName AND [ilçe] = TownCT.TownName AND [semt_bucak_belde] = DistrictCT.DistrictName
	 ORDER BY CityCT.CityName, TownCT.TownName, DistrictCT.DistrictName, DT.[Mahalle]
GO