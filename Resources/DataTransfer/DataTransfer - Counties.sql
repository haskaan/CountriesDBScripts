USE [Countries]
GO

INSERT INTO [Counties]
           ([CityID]
           ,[CountyName])
		SELECT CitiesCT.CityID, LTRIM(RTRIM(DT.[ilçe]))
		FROM Cities AS CitiesCT

		INNER JOIN ['Ýl-Ýlçe$'] AS DT
		ON DT.[il] = CitiesCT.CityName
		ORDER BY CitiesCT.CityName, DT.[ilçe]
GO