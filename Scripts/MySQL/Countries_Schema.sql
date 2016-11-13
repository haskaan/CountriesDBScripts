-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Kas 2016, 22:24:28
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `countries`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `AreaID` int(11) NOT NULL AUTO_INCREMENT,
  `CountyID` int(11) NOT NULL,
  `AreaName` varchar(100) NOT NULL,
  PRIMARY KEY (`AreaID`),
  KEY `FK_Area_CountyID` (`CountyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryID` int(11) NOT NULL,
  `CityName` varchar(100) NOT NULL,
  `PlateNo` varchar(2) NOT NULL,
  `PhoneCode` varchar(7) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `FK_Cities_CountryID` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `counties`
--

CREATE TABLE IF NOT EXISTS `counties` (
  `CountyID` int(11) NOT NULL AUTO_INCREMENT,
  `CityID` int(11) NOT NULL,
  `CountyName` varchar(50) NOT NULL,
  PRIMARY KEY (`CountyID`),
  KEY `FK_Counties_CityID` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `BinaryCode` varchar(2) NOT NULL,
  `TripleCode` varchar(3) NOT NULL,
  `CountryName` varchar(100) NOT NULL,
  `PhoneCode` varchar(6) NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `neighborhood`
--

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `NeighborhoodID` int(11) NOT NULL AUTO_INCREMENT,
  `AreaID` int(11) NOT NULL,
  `NeighborhoodName` varchar(100) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  PRIMARY KEY (`NeighborhoodID`),
  KEY `FK_Neighborhood_AreaID` (`AreaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `FK_Area_CountyID` FOREIGN KEY (`CountyID`) REFERENCES `counties` (`CountyID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `FK_Cities_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `counties`
--
ALTER TABLE `counties`
  ADD CONSTRAINT `FK_Counties_CityID` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `FK_Neighborhood_AreaID` FOREIGN KEY (`AreaID`) REFERENCES `area` (`AreaID`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
