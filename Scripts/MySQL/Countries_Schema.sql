-- =============================================
-- Author:		Kaan HAS
-- Create date: 29.01.2018
-- Description:	MySQL için Türkiye il, ilçe ve mahalle veritabanı şemasıdır.
-- =============================================

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 Oca 2018, 10:37:28
-- Sunucu sürümü: 5.7.19
-- PHP Sürümü: 5.6.31

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
-- Tablo için tablo yapısı `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `DistrictID` int(11) NOT NULL AUTO_INCREMENT,
  `TownID` int(11) NOT NULL,
  `DistrictName` varchar(100) NOT NULL,
  PRIMARY KEY (`DistrictID`),
  KEY `FK_District_TownID` (`TownID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryID` int(11) NOT NULL,
  `CityName` varchar(100) NOT NULL,
  `PlateNo` varchar(2) NOT NULL,
  `PhoneCode` varchar(7) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `FK_City_CountryID` (`CountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `town`
--

CREATE TABLE IF NOT EXISTS `town` (
  `TownID` int(11) NOT NULL AUTO_INCREMENT,
  `CityID` int(11) NOT NULL,
  `TownName` varchar(50) NOT NULL,
  PRIMARY KEY (`TownID`),
  KEY `FK_Town_CityID` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

CREATE TABLE IF NOT EXISTS `country` (
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
  `DistrictID` int(11) NOT NULL,
  `NeighborhoodName` varchar(100) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  PRIMARY KEY (`NeighborhoodID`),
  KEY `FK_Neighborhood_DistrictID` (`DistrictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `FK_District_TownID` FOREIGN KEY (`TownID`) REFERENCES `town` (`TownID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_City_CountryID` FOREIGN KEY (`CountryID`) REFERENCES `country` (`CountryID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `town`
--
ALTER TABLE `town`
  ADD CONSTRAINT `FK_Town_CityID` FOREIGN KEY (`CityID`) REFERENCES `city` (`CityID`) ON DELETE NO ACTION;

--
-- Tablo kısıtlamaları `neighborhood`
--
ALTER TABLE `neighborhood`
  ADD CONSTRAINT `FK_Neighborhood_DistrictID` FOREIGN KEY (`DistrictID`) REFERENCES `district` (`DistrictID`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
