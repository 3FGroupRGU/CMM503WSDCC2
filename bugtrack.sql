-- Adminer 4.2.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `attachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(64) NOT NULL,
  `userID` int(11) NOT NULL,
  `bugID` int(11) NOT NULL,
  PRIMARY KEY (`attachmentID`),
  KEY `userID` (`userID`),
  KEY `bugID` (`bugID`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`bugID`) REFERENCES `bugs` (`bugID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
  `bugID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text,
  `postDate` date NOT NULL,
  `fixDate` date NOT NULL,
  `fixed` int(11) DEFAULT '0',
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`bugID`),
  KEY `userID` (`userID`),
  CONSTRAINT `bugs_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `desc` text NOT NULL,
  `postDate` date NOT NULL,
  `userID` int(11) NOT NULL,
  `bugID` int(11) NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `userID` (`userID`),
  KEY `bugID` (`bugID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`bugID`) REFERENCES `bugs` (`bugID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `phone`) VALUES
(11,	'testuser',	'e16b2ab8d12314bf4efbd6203906ea6c',	'ello@here.com',	NULL);

-- 2016-03-15 20:23:59
