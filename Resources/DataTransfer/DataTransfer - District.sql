USE [Countries]
GO

INSERT INTO [District]
           ([TownID]
           ,[DistrictName])
	 SELECT TownCT.TownID, LTRIM(RTRIM(DT.[semt_bucak_belde]))
	 FROM City AS CityCT
	 INNER JOIN Town AS TownCT
	 ON TownCT.CityID = CityCT.CityID

	 INNER JOIN ['Ýl-Ýlçe-Semt$'] AS DT
	 ON [il] = CityCT.CityName AND [ilçe] = TownCT.TownName
	 ORDER BY CityCT.CityName, TownCT.TownName, DT.[semt_bucak_belde]
GO