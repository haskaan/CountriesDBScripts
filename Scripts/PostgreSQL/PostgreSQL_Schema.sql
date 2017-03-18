-- =============================================
-- Author:		Kaan HAS
-- Create date: 18.03.2017
-- Description:	PostgreSQL için Türkiye il, ilçe ve mahalle veritabanı şemasıdır.
-- =============================================

--
-- Veritabanı: `Countries`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Areas`
--

CREATE SEQUENCE Areas_seq;

CREATE TABLE IF NOT EXISTS Areas (
  AreaID int NOT NULL DEFAULT NEXTVAL ('Areas_seq'),
  CountyID int NOT NULL,
  AreaName varchar(100) NOT NULL,
  PRIMARY KEY (AreaID)
)   ;
 
ALTER SEQUENCE Areas_seq RESTART WITH 1;

CREATE INDEX FK_Area_CountyID ON Areas (CountyID);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Cities`
--

CREATE SEQUENCE Cities_seq;

CREATE TABLE IF NOT EXISTS Cities (
  CityID int NOT NULL DEFAULT NEXTVAL ('Cities_seq'),
  CountryID int NOT NULL,
  CityName varchar(100) NOT NULL,
  PlateNo varchar(2) NOT NULL,
  PhoneCode varchar(7) NOT NULL,
  PRIMARY KEY (CityID)
)   ;
 
ALTER SEQUENCE Cities_seq RESTART WITH 1;

CREATE INDEX FK_Cities_CountryID ON Cities (CountryID);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Counties`
--

CREATE SEQUENCE Counties_seq;

CREATE TABLE IF NOT EXISTS Counties (
  CountyID int NOT NULL DEFAULT NEXTVAL ('Counties_seq'),
  CityID int NOT NULL,
  CountyName varchar(50) NOT NULL,
  PRIMARY KEY (CountyID)
)   ;
 
ALTER SEQUENCE Counties_seq RESTART WITH 1;

CREATE INDEX FK_Counties_CityID ON Counties (CityID);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Countries`
--

CREATE SEQUENCE Countries_seq;

CREATE TABLE IF NOT EXISTS Countries (
  CountryID int NOT NULL DEFAULT NEXTVAL ('Countries_seq'),
  BinaryCode varchar(2) NOT NULL,
  TripleCode varchar(3) NOT NULL,
  CountryName varchar(100) NOT NULL,
  PhoneCode varchar(6) NOT NULL,
  PRIMARY KEY (CountryID)
)   ;
 
ALTER SEQUENCE Countries_seq RESTART WITH 1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Neighborhoods`
--

CREATE SEQUENCE Neighborhoods_seq;

CREATE TABLE IF NOT EXISTS Neighborhoods (
  NeighborhoodID int NOT NULL DEFAULT NEXTVAL ('Neighborhoods_seq'),
  AreaID int NOT NULL,
  NeighborhoodName varchar(100) NOT NULL,
  ZipCode varchar(20) NOT NULL,
  PRIMARY KEY (NeighborhoodID)
)   ;
 
ALTER SEQUENCE Neighborhoods_seq RESTART WITH 1;

CREATE INDEX FK_Neighborhood_AreaID ON Neighborhoods (AreaID);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Areas`
--
ALTER TABLE Areas
  ADD CONSTRAINT FK_Area_CountyID FOREIGN KEY (CountyID) REFERENCES Counties (CountyID) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `Cities`
--
ALTER TABLE Cities
  ADD CONSTRAINT FK_Cities_CountryID FOREIGN KEY (CountryID) REFERENCES Countries (CountryID) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `Counties`
--
ALTER TABLE Counties
  ADD CONSTRAINT FK_Counties_CityID FOREIGN KEY (CityID) REFERENCES Cities (CityID) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `Neighborhoods`
--
ALTER TABLE Neighborhoods
  ADD CONSTRAINT FK_Neighborhood_AreaID FOREIGN KEY (AreaID) REFERENCES Areas (AreaID) ON DELETE NO ACTION;
