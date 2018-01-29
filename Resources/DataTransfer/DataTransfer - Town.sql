USE [Countries]
GO

INSERT INTO [Town]
           ([CityID]
           ,[TownName])
		SELECT CityCT.CityID, LTRIM(RTRIM(DT.[ilçe]))
		FROM City AS CityCT

		INNER JOIN ['Ýl-Ýlçe$'] AS DT
		ON DT.[il] = CityCT.CityName
		ORDER BY CityCT.CityName, DT.[ilçe]
GO