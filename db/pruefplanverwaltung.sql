-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 12 2013 г., 16:42
-- Версия сервера: 5.5.27
-- Версия PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `pruefplanverwaltung`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `AccID` int(6) NOT NULL AUTO_INCREMENT,
  `AccName` varchar(50) NOT NULL,
  `AccPwd` varchar(20) NOT NULL,
  `GroupID` tinyint(4) NOT NULL,
  PRIMARY KEY (`AccID`),
  KEY `fk_accounts_benutzergruppe1` (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`AccID`, `AccName`, `AccPwd`, `GroupID`) VALUES
(1, 'Administrator', '12345678', 1),
(2, 'Bentrup', '12345678', 2),
(3, 'Engert', '0000', 2),
(4, 'Giard', '0000', 2),
(5, 'Tackmann', '0000', 2),
(6, 'Vemmer', '0000', 2),
(7, 'Weber', '0000', 2),
(8, 'Bunse', '12345678', 3),
(9, 'Grünwoldt', '12345678', 3),
(10, 'Schröder', '0000', 3),
(16, 'Jäckel', '00000000', 3),
(25, 'Falkenberg', '12345678', 2),
(26, 'aepp', '261188', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `benutzergruppe`
--

CREATE TABLE IF NOT EXISTS `benutzergruppe` (
  `GroupID` tinyint(4) NOT NULL AUTO_INCREMENT,
  `BGName` varchar(50) NOT NULL,
  `BGRechte` tinyint(4) NOT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `benutzergruppe`
--

INSERT INTO `benutzergruppe` (`GroupID`, `BGName`, `BGRechte`) VALUES
(1, 'Administrator', 127),
(2, 'Mitarbeiter', 63),
(3, 'Pruefer', 63);

-- --------------------------------------------------------

--
-- Структура таблицы `conflicts`
--

CREATE TABLE IF NOT EXISTS `conflicts` (
  `current` int(5) NOT NULL,
  `conflict` int(5) NOT NULL,
  PRIMARY KEY (`current`,`conflict`),
  KEY `fk_conflicts_pruefplaneintrag1` (`current`),
  KEY `fk_conflicts_pruefplaneintrag2` (`conflict`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mitarbeiter`
--

CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `MaID` int(6) NOT NULL AUTO_INCREMENT,
  `MaName` varchar(60) NOT NULL,
  `MaVorname` varchar(60) NOT NULL,
  `MaTitel` varchar(40) DEFAULT NULL,
  `MaKurz` varchar(4) DEFAULT NULL,
  `AccID` int(6) DEFAULT NULL,
  `SperrDatZeitVon` datetime DEFAULT NULL,
  `SperrDatZeitBis` datetime DEFAULT NULL,
  PRIMARY KEY (`MaID`),
  KEY `fk_mitarbeiter_accounts1` (`AccID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Дамп данных таблицы `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`MaID`, `MaName`, `MaVorname`, `MaTitel`, `MaKurz`, `AccID`, `SperrDatZeitVon`, `SperrDatZeitBis`) VALUES
(1, 'Administrator', 'Admini', 'Dr.', 'AA', 1, '2011-04-05 00:00:00', '2014-04-05 00:00:00'),
(4, 'Böwingloh', 'Brigitte', 'Sozial-Betriebsw., Dipl.-Sozial-Päd.', 'Bö', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(5, 'Braun', 'Willi', 'Dipl.-Math.', 'Br', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(6, 'Brikmann', 'Johannes', 'B.Eng.', 'Bm', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(7, 'Brüggehofe', 'Peter', '', 'Bh', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(8, 'Derdau', 'Ralf', 'Dipl.-Wirt.Math.', 'De', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(9, 'Dewart', 'Heinrich', 'Dipl.-Ing.', 'Dw', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(11, 'Engert', 'Frank', 'Dipl.-Ing.', 'En', 5, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(12, 'Englisch', 'Thomas', 'Dipl.-Phys.', '~En', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(13, 'Falkenberg', 'Monika', '', 'Fa', 25, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(14, 'Fangerow', 'Maria', 'Dipl.-Ing.', 'Fr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(15, 'Fingberg', 'Manfred', 'Dipl.-Ing.', 'Fi', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(16, 'Foth', 'Roland', '', 'Fo', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(17, 'Franzen', 'Ludger', 'Dipl.-Inf.', 'Fz', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(18, 'Fromm', 'Carsten', 'Dipl.-Ing.', 'Fm', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(19, 'Giard', 'Nicole', 'Dr.', 'Gi', 6, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(20, 'Grimpe', 'Norbert', 'Dipl.-Ing.', 'Gr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(21, 'Hanitzsch', 'Miriam', 'Dr. rer. nat.', '', NULL, '2011-04-05 00:00:00', '2011-04-05 00:01:00'),
(23, 'Heidsiek', 'Anja', '', 'He', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(24, 'Heinze', 'Joscha', 'Dipl.-Ing.', 'Hz', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(25, 'Hense', 'Andreas', 'Dipl.-Ing.', '~He', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(26, 'Hermanski', 'Manfred', 'Dipl.-Ing.', 'Hm', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(27, 'Herrmann', 'Andreas', 'Dipl.-Ing. MSc.', 'Hn', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(28, 'Hilbig', 'Thomas', 'Dipl.-Ing.', 'Hi', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(29, 'Hilbig', 'Yana', 'Dipl.-Ing.', 'Hb', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(30, 'Horstmann', 'Manfred', 'Dipl.-Ing.', 'Ho', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(31, 'Jakobs-Schönwandt', 'Desirée', 'Dr. rer. nat.', 'Ja', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(32, 'Kastrup', 'Friedrich-Wilhelm', 'Dipl.-Ing.', 'Ka', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(33, 'Klaus', 'Frieda', '', 'Kl', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(34, 'Klöcker', 'Michaela', 'Dipl.-Ing.', 'Kö', NULL, '2000-04-05 00:00:00', '2011-04-05 00:00:00'),
(35, 'Klose', 'Werner', 'Dipl.-Ing.', 'Ks', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(36, 'Koch', 'Harald', 'Dipl.-Ing.', 'Ko', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(37, 'Koppenrade', 'Elke', 'Prof. (i.V.) Dr. math.', 'Kp', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(38, 'Kreuzmann', 'Hans-Ulrich', '', 'Kr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(39, 'Krome', 'Rainer', 'Dipl.-Ing.', 'Km', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(40, 'Lenz', 'Almut', 'MPH', 'Le', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(41, 'Lohse', 'Rieke', 'M.Sc.', '~Lo', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(42, 'Mechirgui', 'Ridha', '', 'Me', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(43, 'Meissner', 'Hubert', 'Dipl.-Ing.', 'Ms', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(44, 'Mindlina', 'Ekatarina', 'B.Sc.', 'Mi', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(45, 'Müller', 'Christiane', 'M.Sc.', 'Mü', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(46, 'Müller', 'Dieter', '', 'Mr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(47, 'Nowikow', 'Sandra', 'Dipl.-Betrieb', 'No', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(48, 'Özdemir', 'Cigdem', 'Mag. Art.', 'Öz', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(49, 'Panienka', 'Johannes', 'Dipl.-Math.', 'Pa', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(50, 'Pascher', 'Nikolas', 'Dipl.-Ing.', 'Ps', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(51, 'Penning', 'Karl-Friedrich', 'Dipl-Ing.', 'Pe', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(52, 'Pohl', 'Tabea-Dominika', '', 'Po', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(53, 'Proß', 'Sabrina', 'Dipl.-Math.', 'Pr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(54, 'Rattenholl', 'Anke', 'Dr. rer. nat', 'Ra', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(55, 'Rieke', 'Christian', 'Dipl.-Ing.', 'Ri', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(56, 'Ries', 'Christian Benjamin', 'Dipl.-Ing., M.Sc.', 'Rs', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(57, 'Scheele', 'Christine', '', 'Sc', 1, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(58, 'Schenck', 'Tatiana', 'Dipl.-Math.', 'Sh', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(59, 'Schneidereit', 'Uwe', '', 'Sn', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(60, 'Schönbohm', 'Jens', 'Dipl.-Ing.', 'Sö', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(61, 'Schubert', 'Axel', 'Dipl.-Ing.', 'Su', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(62, 'Schüler', 'Susanne', '', 'Sü', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(63, 'Schünemann', 'Ronald', 'Dipl.-Ing.', 'Sm', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(64, 'Spiller-Bohnenkamp', 'Iris', 'Dipl.-Ing.', 'Sp', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(65, 'Springer', 'Annegret', '', 'Sg', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(66, 'Stark', 'Silja', '', 'St', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(67, 'Stockhaus', 'Tim', 'Dipl.-Ing., M.Sc.', 'Sk', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(68, 'Tackmann', 'Pirkko', '', 'Ta', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(69, 'Tiemann', 'Heinz-Wilhelm', 'Dipl.-Ing.', 'Ti', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(70, 'Tolstykh', 'Mikhail', 'Dipl.-Ing.', 'To', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(71, 'Trakies', 'Eckhard', 'Dipl.-Ing.', 'Tr', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(72, 'Vemmer', 'Marina', 'M.Sc.', '~Ve', 16, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(73, 'Viez', 'Vanessa', '', 'Vi', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(74, 'Vorderbrüggen', 'Norbert', '', 'Vo', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(75, 'Weber', 'Marina', 'B.Sc.', 'We', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(76, 'Weinert', 'Gerhard', 'Dipl.-Ing.', 'Wi', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(77, 'Werner', 'Daniel', 'Dipl.-Ing.', 'Wn', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(78, 'Wiegräbe', 'Frauke', 'B.Sc.', 'Wg', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00'),
(79, 'Wollensak', 'Andreas', 'Dipl.-Ing.', 'Wo', NULL, '2011-04-05 00:00:00', '2011-04-05 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `ModID` int(5) NOT NULL AUTO_INCREMENT,
  `ModName` varchar(50) NOT NULL,
  `ModKuerzel` char(5) NOT NULL,
  `PCID` int(3) DEFAULT NULL,
  PRIMARY KEY (`ModID`),
  KEY `fk_modul_pruefcodes1` (`PCID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- Дамп данных таблицы `modul`
--

INSERT INTO `modul` (`ModID`, `ModName`, `ModKuerzel`, `PCID`) VALUES
(2, 'Elektrische Energieerzeugung und -verteilung I', 'EV1', 27),
(3, 'Dezentrale Energiesysteme', 'DEZ', 10),
(5, 'Automatisierung von Energiesystemen', 'ATE', 11),
(6, 'Automatisierungstechnik', 'AT', 43),
(7, 'Betriebswirtschaftslehre', 'BW', 41),
(8, 'Elektrische Energieerzeugung und -verteilung II', 'EV2', 15),
(9, 'Elektrische Maschinen', 'EM', 5),
(10, 'Elektromagnetische Verträglichkeit', 'EMV', 14),
(11, 'Elektronik I', 'EL1', 2),
(12, 'Elektronik II', 'EL2', 3),
(13, 'Elektrotraktion', 'ETR', 19),
(14, 'Energietechnik', 'EN', 9),
(15, 'Energiewirtschaft', 'EW', 21),
(16, 'Investition und Finanzierung', 'FIN', 47),
(17, 'Klima und Ressourcen', 'KLI', 24),
(18, 'Kommunikationstechnik', 'KOM', 18),
(19, 'Leistungselektronik', 'LE', 13),
(20, 'Mess- und Prüfsysteme', 'MPS', 17),
(21, 'Messtechnik', 'MT', 4),
(22, 'Mikrosystemtechnik', 'MST', 26),
(23, 'Moderne Energiepolitik', 'MEP', 25),
(24, 'Photovoltaik', 'PTV', 20),
(25, 'Regelungstechnik', 'RT', 6),
(26, 'Sensorik', 'SEN', 7),
(27, 'Technical English I', 'FSE1', 42),
(28, 'Technical English II', 'FSE2', 48),
(29, 'Technische Nutzung regenerativer Energien I', 'RN1', 22),
(30, 'Technische Nutzung regenerativer Energien II', 'RN2', 23),
(31, 'Werkstoffe der Elektrotechnik und Elektronik', 'WEE', 1),
(54, 'Datenbankanwendungen', 'DBA', 67),
(55, 'Simulationstechnik', 'SIM', 61),
(56, 'Programmieren mit Java', 'JAV', 51),
(57, 'Angewandte Informatik', 'AIN', 62),
(58, 'Computergrafik I', 'GD1', 63),
(59, 'Computergrafik II', 'GD2', 68),
(60, 'Bildverarbeitung/Mustererkennung I', 'MDB1', 64),
(61, 'Bildverarbeitung/Mustererkennung II', 'MDB2', 50),
(62, 'Softwareengineering', 'SWE', 66),
(63, 'Betriebssysteme I', 'BS1', 65),
(64, 'Betriebssysteme II', 'BS2', 69),
(71, 'Elektronik I', 'ETE1', 72),
(72, 'Elektronik II', 'ETE2', 34),
(75, 'Angewandte Mathematik I', 'AM1', 37),
(76, 'Angewandte Mathematik II', 'AM2', 45),
(78, 'Digitalelektronik', 'DIG', 38),
(79, 'Hochfrequenztechnik', 'HFT', 39),
(81, 'Netzwerktechnik', 'NW', 40),
(82, 'Reglerentwurf', 'REE', 54),
(83, 'Computer Aided Design', 'CAD', 55),
(84, 'Mikrocontroller', 'MC', 49),
(85, 'Digitale Signalverarbeitung', 'DS', 56),
(86, 'Lasertechnik I', 'LAS1', 57),
(87, 'Lasertechnik II', 'LAS2', 60),
(88, 'Alternative Kraftstoffe', 'AK', 90),
(89, 'Anlagenplanung', 'APL', 89),
(94, 'Biochemie und Mikrobiologie', 'BCM', 74),
(95, 'Chemie', 'CH', 71),
(98, 'Elektronik', 'ETE', 73),
(99, 'Elektrotechnik I', 'ET1', 72),
(100, 'Elektrotechnik II', 'ET2', 75),
(103, 'Informatik I', 'INF1', 77),
(104, 'Informatik II', 'INF2', 80),
(107, 'Mathematik I', 'MA1', 27),
(108, 'Mathematik II', 'MA2', 32),
(109, 'Mechanische Verfahrenstechnik', 'MVT', 76),
(112, 'Physik I', 'PHY1', 28),
(113, 'Physik II', 'PHY2', 33),
(115, 'Regenerative Energiewirtschaft', 'RW', 70),
(120, 'Thermische Verfahrenstechnik', 'TVT', 79),
(121, 'Kernenergie', 'KER', 87),
(125, 'Recht für Ingenieure', 'RFI', 91),
(127, 'Windkraftanlagen', 'WEA', NULL),
(128, 'Mathematik I', 'MA1', 27),
(129, 'Mathematik II', 'MA2', 32),
(130, 'Physik I', 'PHY1', 28),
(131, 'Physik II', 'PHY2', 33),
(132, 'Informatik I', 'INF1', 31),
(133, 'Informatik II', 'INF2', 36),
(134, 'Elektrotechnik I', 'ET1', 29),
(135, 'Elektrotechnik II', 'ET2', 73),
(136, 'Elektronik I', 'EL1', 2),
(137, 'Elektronik II', 'ET2', 3),
(138, 'Mathematik I', 'MA1', 27),
(139, 'Mathematik II', 'MA2', 32),
(140, 'Informatik I', 'INF1', 31),
(141, 'Informatik II', 'INF2', 36),
(142, 'Physik I', 'PHY1', 28),
(143, 'Physik II', 'PHY2', 33),
(144, 'Algorithmen und Datenstrukturen', 'AUD', 1),
(145, 'Rechnerarchitekturen', 'RAR', NULL),
(146, 'Nebenläufige Programmierung', 'NEP', NULL),
(147, 'Leistungselektronik', 'LE', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `pruefcodes`
--

CREATE TABLE IF NOT EXISTS `pruefcodes` (
  `PCID` int(3) NOT NULL AUTO_INCREMENT,
  `PrCode` int(4) NOT NULL,
  `PrAbschnitt` char(1) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `PrPflicht` char(2) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `PrArt` char(1) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `PrForm` char(2) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`PCID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- Дамп данных таблицы `pruefcodes`
--

INSERT INTO `pruefcodes` (`PCID`, `PrCode`, `PrAbschnitt`, `PrPflicht`, `PrArt`, `PrForm`) VALUES
(1, 1400, 'G', 'PF', 'S', 'MP'),
(2, 1900, 'G', 'PF', 'S', 'MP'),
(3, 2100, 'H', 'PF', 'S', 'MP'),
(4, 2200, 'H', 'PF', 'S', 'MP'),
(5, 2300, 'H', 'PF', 'S', 'MP'),
(6, 2400, 'H', 'PF', 'S', 'MP'),
(7, 2800, 'H', 'PF', 'S', 'MP'),
(8, 2900, 'H', 'PF', 'S', 'MP'),
(9, 3100, 'H', 'PF', 'S', 'MP'),
(10, 3500, 'H', 'PF', 'M', 'MP'),
(11, 3600, 'H', 'PF', 'M', 'MP'),
(12, 3400, 'H', 'PF', 'S', 'MP'),
(13, 3700, 'H', 'PF', 'S', 'MP'),
(14, 3800, 'H', 'WG', 'M', 'MP'),
(15, 4000, 'H', 'PF', 'S', 'MP'),
(16, 4100, 'H', 'PF', 'M', 'MP'),
(17, 4200, 'H', 'WG', 'M', 'MP'),
(18, 4300, 'H', 'PF', 'S', 'MP'),
(19, 4400, 'H', 'WG', 'M', 'MP'),
(20, 3700, 'H', 'PF', 'M', 'MP'),
(21, 3800, 'H', 'PF', 'S', 'MP'),
(22, 3900, 'H', 'PF', 'S', 'MP'),
(23, 4100, 'H', 'WG', 'S', 'MP'),
(24, 4200, 'H', 'PF', 'S', 'MP'),
(25, 4300, 'H', 'PF', 'S', 'MP'),
(26, 4400, 'H', 'WG', 'S', 'MP'),
(27, 1500, 'G', 'PF', 'S', 'MP'),
(28, 1200, 'G', 'PF', 'S', 'MP'),
(29, 1300, 'G', 'PF', 'S', 'MP'),
(30, 1400, 'G', 'PF', 'S', 'MP'),
(31, 1500, 'G', 'PF', 'S', 'MP'),
(32, 1600, 'G', 'PF', 'S', 'MP'),
(33, 1700, 'G', 'PF', 'S', 'MP'),
(34, 1800, 'G', 'PF', 'S', 'MP'),
(35, 1900, 'G', 'PF', 'S', 'MP'),
(36, 2000, 'G', 'PF', 'S', 'MP'),
(37, 2100, 'H', 'PF', 'S', 'MP'),
(38, 2200, 'H', 'PF', 'S', 'MP'),
(39, 2300, 'H', 'PF', 'S', 'MP'),
(40, 2400, 'H', 'PF', 'S', 'MP'),
(41, 2500, 'H', 'PF', 'S', 'MP'),
(42, 2600, 'H', 'PF', 'S', 'MP'),
(43, 2700, 'H', 'PF', 'S', 'MP'),
(44, 2800, 'H', 'PF', 'S', 'MP'),
(45, 2900, 'H', 'PF', 'S', 'MP'),
(46, 3100, 'H', 'PF', 'S', 'MP'),
(47, 3200, 'H', 'PF', 'S', 'MP'),
(48, 3300, 'H', 'PF', 'S', 'MP'),
(49, 4200, 'H', 'WG', 'S', 'MP'),
(50, 4300, 'H', 'PF', 'S', 'MP'),
(51, 4500, 'H', 'WG', 'S', 'MP'),
(52, 4600, 'H', 'WG', 'S', 'MP'),
(53, 3400, 'H', 'PF', 'S', 'MP'),
(54, 3500, 'H', 'PF', 'S', 'MP'),
(55, 3600, 'H', 'PF', 'M', 'MP'),
(56, 3700, 'H', 'PF', 'M', 'MP'),
(57, 3800, 'H', 'WG', 'S', 'MP'),
(58, 3900, 'H', 'WG', 'M', 'MP'),
(59, 4100, 'H', 'PF', 'S', 'MP'),
(60, 4300, 'H', 'WG', 'S', 'MP'),
(61, 4400, 'H', 'PF', 'M', 'MP'),
(62, 3400, 'H', 'PF', 'H', 'MP'),
(63, 3500, 'H', 'PF', 'H', 'MP'),
(64, 3600, 'H', 'PF', 'S', 'MP'),
(65, 3700, 'H', 'PF', 'S', 'MP'),
(66, 3800, 'H', 'WG', 'H', 'MP'),
(67, 4000, 'H', 'PF', 'S', 'MP'),
(68, 4100, 'H', 'PF', 'H', 'MP'),
(69, 4500, 'H', 'WG', 'H', 'MP'),
(70, 1000, 'G', 'PF', 'S', 'MP'),
(71, 1300, 'G', 'PF', 'S', 'MP'),
(72, 1400, 'G', 'PF', 'S', 'MP'),
(73, 1800, 'G', 'PF', 'S', 'MP'),
(74, 1900, 'G', 'PF', 'S', 'MP'),
(75, 2000, 'G', 'PF', 'S', 'MP'),
(76, 2100, 'H', 'PF', 'S', 'MP'),
(77, 2200, 'H', 'PF', 'S', 'MP'),
(78, 2300, 'H', 'PF', 'S', 'MP'),
(79, 2700, 'H', 'PF', 'S', 'MP'),
(80, 2800, 'H', 'PF', 'S', 'MP'),
(81, 2900, 'H', 'PF', 'S', 'MP'),
(82, 3400, 'H', 'PF', 'S', 'MP'),
(83, 3600, 'H', 'PF', 'S', 'MP'),
(84, 3800, 'H', 'PF', 'S', 'MP'),
(85, 4001, 'H', 'WG', 'S', 'MP'),
(86, 4002, 'H', 'WG', 'S', 'MP'),
(87, 4003, 'H', 'WG', 'S', 'MP'),
(88, 4004, 'H', 'WG', 'S', 'MP'),
(89, 4005, 'H', 'WG', 'S', 'MP'),
(90, 4006, 'H', 'WG', 'S', 'MP'),
(91, 4007, 'H', 'WG', 'S', 'MP');

-- --------------------------------------------------------

--
-- Структура таблицы `pruefer`
--

CREATE TABLE IF NOT EXISTS `pruefer` (
  `PrID` int(6) NOT NULL AUTO_INCREMENT,
  `PrName` varchar(60) NOT NULL,
  `PrVorname` varchar(60) NOT NULL,
  `PrTitel` varchar(40) NOT NULL,
  `PrKurz` varchar(6) NOT NULL,
  `AccId` int(6) DEFAULT NULL,
  PRIMARY KEY (`PrID`),
  KEY `fk_pruefer_accounts1` (`AccId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Дамп данных таблицы `pruefer`
--

INSERT INTO `pruefer` (`PrID`, `PrName`, `PrVorname`, `PrTitel`, `PrKurz`, `AccId`) VALUES
(1, 'Albrecht', 'Rainer', 'Prof. Dr.-Ing', 'Al', NULL),
(2, 'Bachmann', 'Bernhard', 'Prof. Dr. phil.', 'Bm', NULL),
(3, 'Barbey', 'Hans-Peter', 'Prof. Dr.-Ing.', 'By', NULL),
(4, 'Biegler-König', 'Cornelia', 'OStR.in', 'Bk', NULL),
(5, 'Biegler-König', 'Friedrich', 'Prof. Dr. math.', 'Bö', NULL),
(6, 'Budde', 'Lothar', 'Prof. Dr.-Ing. Prof. h.c.', 'Bd', NULL),
(7, 'Bunse', 'Wolfgang', 'Prof. Dr. math.', 'Bu', NULL),
(8, 'Busch', 'Wolf-Berend', 'Prof. Dr.-Ing.', 'Bs', NULL),
(9, 'Cevik', 'Kemal', 'Prof. Dr.-Ing.', 'Ck', NULL),
(10, 'Cottin', 'Claudia', 'Prof. Dr. rer. nat.', 'Co', NULL),
(11, 'Diekmann', 'Paul', 'Prof. Dr.-Ing.', 'Di', NULL),
(12, 'Dormeier', 'Stefan', 'Prof. Dr.-Ing.', '~Do', NULL),
(13, 'Dornseifer-Seitz', 'Adelheid', 'Dipl. Übersetzerin', 'Ds', NULL),
(14, 'Draxl', 'Sybille', 'Dipl. math.', 'Dx', NULL),
(15, 'Dürkopp', 'Klaus', 'Prof. Dr.-Ing.', 'Dü', NULL),
(16, 'Feyerabend', 'Franz', 'Prof. Dr.-Ing.', 'Fb', NULL),
(17, 'Friedrich', 'Roland', 'Prof. Dr.-Ing.', 'Fr', NULL),
(18, 'Grünwoldt', 'Lutz', 'Prof. Dr.-Ing.', 'Gr', NULL),
(19, 'Gudermann', 'Frank', 'Prof. Dr. rer. nat.', 'Gm', NULL),
(20, 'Haubrok', 'Dietmar', 'Prof. Dr.-Ing.', '~Hb', NULL),
(21, 'Haubrock', 'Jens', 'Prof. Dr.-Ing.', 'Ho', NULL),
(22, 'Schöning', 'Sonja', 'Prof. Dr. rer. nat.', 'Sh', NULL),
(23, 'Hörstmeier', 'Ralf', 'Prof. Dr.-Ing.', 'Hö', NULL),
(24, 'Hofer', 'Klaus', 'Prof. Dr. Ing. habil.', 'Hf', NULL),
(25, 'Hoffmann', 'Sebastian', 'Prof. Dr.-Ing.', 'Hm', NULL),
(26, 'Hüsgen', 'Bruno', 'Prof. Dr.-Ing.', 'Hü', NULL),
(27, 'Jäckel', 'Gisbert', 'Prof. Dr.-Ing.', 'Jä', NULL),
(28, 'Jaroschek', 'Christoph', 'Prof. Dr.-Ing.', 'Jk', NULL),
(29, 'Karger', 'Michael', 'Prof. Dr. rer. nat.', 'Ka', NULL),
(30, 'Kaschuba', 'Reinhard', 'Prof. Dr.-Ing.', 'Kb', NULL),
(31, 'Kettner', 'Karl-Ulrich', 'Prof. Dr. rer. nat.', 'Ke', NULL),
(32, 'Kisse', 'Raimund', 'Prof. Dr.-Ing.', 'Ki', NULL),
(33, 'Klar', 'Anton', 'Prof. Dr.-Ing.', 'Kl', NULL),
(34, 'Kramer', 'Ulrich', 'Prof. Dr.-Ing. habil', 'Ka', NULL),
(35, 'Kruse', 'Hermann-Josef', 'Prof. Dr. rer. pol.', 'Ke', NULL),
(36, 'Kühlert', 'Heinrich', 'Prof. Dr.-Ing.', 'Kü', NULL),
(37, 'Lajios', 'Georgios', 'Prof. Dr. rer. nat.', 'La', NULL),
(38, 'Loviscach', 'Jörn', 'Prof. Dr. rer. nat.', 'Lo', NULL),
(39, 'Lütkemeyer', 'Dirk', 'Prof. Dr. rer. nat.', 'Lü', NULL),
(40, 'Manz-Schumacher', 'Hildegard', 'Prof. Dr. rer. pol.', 'Ma', NULL),
(41, 'Naumann', 'Rolf', 'Prof. Dr.-Ing.', 'Na', NULL),
(42, 'Nowacki', 'Horst-Felix', 'Honorarprof. Dipl.-Ing.', 'No', NULL),
(43, 'Ohlhoff', 'Antje', 'Prof. Dr. rer. nat.', 'Oh', NULL),
(44, 'Panreck', 'Klaus', 'Prof. Dr.-Ing.', 'Pa', NULL),
(45, 'Patel', 'Anant', 'Prof. Dr. rer. nat.', 'Pa', NULL),
(46, 'Petrova', 'Svetozara', 'Prof. Dr. rer. nat.', 'Pt', NULL),
(47, 'Petry', 'Martin', 'Prof. Dr. rer. nat.', 'Pe', NULL),
(48, 'Quante', 'Franz', 'Prof. Dr.-Ing.', 'Qu', NULL),
(49, 'Schierenberg', 'Marc-Oliver', 'Prof. Dr. rer. nat.', 'Si', NULL),
(50, 'Schlabbach', 'Jürgen', 'Prof. Dr.-Ing.', 'Sb', NULL),
(51, 'Schmidt', 'Norbert', 'Prof. Dr.-Ing.', 'Sd', NULL),
(52, 'Schmiedl', 'Roland', 'Prof. Dr. rer. nat.', 'Sm', NULL),
(53, 'Schröder', 'Christian', 'Prof. Dr. rer. nat.', 'Sö', NULL),
(54, 'Schultheis', 'Rüdiger', 'Prof. Dr.-Ing.', 'Sl', NULL),
(55, 'Schumacher', 'Bernd-Josef', 'Prof. Dr. rer. nat.', 'Sc', NULL),
(56, 'Schwenzfeier-Hellkamp', 'Eva', 'Prof. Dr.-Ing.', 'Sp', NULL),
(57, 'Tenzler', 'Andreas', 'Prof. Dr.-Ing.', 'Te', NULL),
(58, 'Ueckerdt', 'Rainer', 'Prof. Dr. sc. techn. Dr. rer. nat.', 'Ue', NULL),
(59, 'Vucetic', 'Dragan', 'Dr.', 'Vu', NULL),
(60, 'Wameling', 'Hubertus', 'Dr.', 'Wm', NULL),
(61, 'Waßmuth', 'Joachim', 'Prof. Dr.-Ing.', 'Wu', NULL),
(62, 'Weber', 'Gerhard', 'Prof. Dr.-Ing.', 'We', NULL),
(63, 'Weidemann', 'Dirk', 'Prof. Dr.-Ing.', 'Wn', NULL),
(64, 'Westerholz', 'Arno', 'Prof. Dr.-Ing.', 'Wz', NULL),
(65, 'Zielke', 'Dirk', 'Prof. Dr.-Ing.', 'Zi', NULL),
(69, 'Tester', 'Peter', 'Dr.', 'PT', NULL),
(70, 'Schöning', 'S', 'Prof. Dr.', '--', NULL),
(71, 'Bunte', 'Daniela', 'Dr.', 'Bn', NULL),
(72, 'Bakon', 'Egg ', '', '', NULL),
(73, 'Liebing', '', '', '', NULL),
(74, 'Niemann', '', 'Dr.', 'Ni', NULL),
(75, 'Jakobs-Schönwandt', '', 'Prof. Dr.', 'Js', NULL),
(76, 'Hanitzsch', '', 'Prof. Dr.', '', NULL),
(77, 'Assion', 'Vorname', 'Prof. Dr.', 'As', NULL),
(78, 'Schneider', 'Axel', 'Prof. Dr. rer. nat.', 'Sr', NULL),
(79, 'Marsch', 'Cornelius', 'Dr.-Ing.', 'Mr', NULL),
(80, 'Nerz', '', 'Prof. Dr.', 'Ne', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pruefperioden`
--

CREATE TABLE IF NOT EXISTS `pruefperioden` (
  `PrPeID` int(4) NOT NULL AUTO_INCREMENT,
  `PPKw` int(2) NOT NULL,
  `PPWoche` tinyint(1) NOT NULL,
  `PruefSemester` char(4) NOT NULL,
  `PruefTermin` char(4) NOT NULL,
  `PPJahr` int(4) NOT NULL,
  `PPotherKw` int(2) NOT NULL,
  PRIMARY KEY (`PrPeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Дамп данных таблицы `pruefperioden`
--

INSERT INTO `pruefperioden` (`PrPeID`, `PPKw`, `PPWoche`, `PruefSemester`, `PruefTermin`, `PPJahr`, `PPotherKw`) VALUES
(3, 10, 1, 'WiSe', 'T1', 2011, 11),
(5, 11, 2, 'WiSe', 'T1', 2011, 10),
(10, 5, 1, 'WiSe', 'T1', 2012, 6),
(11, 6, 2, 'WiSe', 'T1', 2012, 5),
(12, 11, 1, 'WiSe', 'T2', 2012, 12),
(13, 12, 2, 'WiSe', 'T2', 2012, 11),
(20, 26, 1, 'SoSe', 'T1', 2011, 27),
(21, 27, 2, 'SoSe', 'T1', 2011, 26),
(22, 27, 1, 'SoSe', 'T1', 2012, 28),
(23, 28, 2, 'SoSe', 'T1', 2012, 27),
(25, 37, 1, 'SoSe', 'T2', 2012, 38),
(26, 38, 2, 'SoSe', 'T2', 2012, 37),
(27, 38, 1, 'SoSe', 'T2', 2011, 39),
(28, 39, 2, 'SoSe', 'T2', 2011, 38),
(30, 18, 2, 'WiSe', 'T1', 2013, 17),
(31, 29, 1, 'SoSe', 'T1', 2013, 30),
(32, 30, 2, 'SoSe', 'T1', 2013, 29),
(33, 19, 2, 'WiSe', 'T1', 2013, 18),
(34, 18, 1, 'WiSe', 'T1', 2013, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `pruefplaneintrag`
--

CREATE TABLE IF NOT EXISTS `pruefplaneintrag` (
  `PPID` int(5) NOT NULL AUTO_INCREMENT,
  `PPEDatZeit` datetime NOT NULL,
  `PPTermin` int(1) NOT NULL,
  `SGMID` int(6) NOT NULL,
  `ErstPruefID` int(6) NOT NULL,
  `ZweitPruefID` int(6) DEFAULT NULL,
  `MaID` int(6) DEFAULT NULL,
  `PFID` tinyint(2) DEFAULT NULL,
  `RID` int(3) DEFAULT NULL,
  `PruefPeriode` int(4) NOT NULL,
  `AnmeldeZahl` int(3) NOT NULL,
  `AnzMdlPr` int(3) NOT NULL,
  `Status` int(11) NOT NULL,
  `zeitStempel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PPID`),
  KEY `fk_pruefplaneintrag_raum1` (`RID`),
  KEY `fk_pruefplaneintrag_pruefungsform1` (`PFID`),
  KEY `fk_pruefplaneintrag_mitarbeiter1` (`MaID`),
  KEY `fk_pruefplaneintrag_pruefperioden1` (`PruefPeriode`),
  KEY `fk_pruefplaneintrag_pruefer1` (`ErstPruefID`),
  KEY `fk_pruefplaneintrag_pruefer2` (`ZweitPruefID`),
  KEY `fk_pruefplaneintrag_sgmodul1` (`SGMID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1108 ;

--
-- Дамп данных таблицы `pruefplaneintrag`
--

INSERT INTO `pruefplaneintrag` (`PPID`, `PPEDatZeit`, `PPTermin`, `SGMID`, `ErstPruefID`, `ZweitPruefID`, `MaID`, `PFID`, `RID`, `PruefPeriode`, `AnmeldeZahl`, `AnzMdlPr`, `Status`, `zeitStempel`) VALUES
(978, '2011-03-08 15:00:00', 0, 54, 53, NULL, NULL, 2, 5, 3, 0, 0, 0, '2013-04-29 11:21:34'),
(980, '2011-03-11 11:00:00', 0, 56, 54, NULL, NULL, 2, NULL, 3, 0, 0, 0, '2013-05-09 18:23:15'),
(981, '2011-03-07 10:00:00', 0, 47, 63, NULL, NULL, 2, 16, 3, 0, 0, 0, '2013-04-21 16:11:34'),
(983, '2011-03-07 12:00:00', 0, 39, 56, NULL, NULL, 2, 5, 3, 0, 0, 0, '2013-05-09 17:46:52'),
(1052, '2011-09-28 12:00:00', 0, 57, 51, 3, NULL, 2, 19, 3, 0, 0, 0, '2013-05-09 17:29:21'),
(1055, '2011-09-28 12:00:00', 0, 63, 54, 3, NULL, 3, 19, 28, 51, 0, 0, '2013-04-22 18:29:52'),
(1056, '2011-09-19 09:00:00', 0, 120, 45, 77, NULL, 2, 4, 27, 12, 0, 0, '2013-04-22 18:34:12'),
(1060, '2012-02-02 08:00:00', 0, 64, 43, 2, NULL, 5, 11, 10, 0, 0, 0, '2013-05-04 15:03:01'),
(1061, '2011-03-08 11:00:00', 0, 39, 56, 13, NULL, 2, 1, 3, 0, 0, 0, '2013-05-06 10:42:36'),
(1062, '2011-03-10 09:00:00', 0, 39, 56, 2, NULL, 2, 1, 3, 0, 0, 0, '2013-05-06 10:42:29'),
(1063, '2011-03-15 08:00:00', 0, 48, 34, NULL, NULL, 2, 1, 5, 0, 0, 0, '2013-05-05 17:19:29'),
(1065, '2011-03-16 10:00:00', 0, 52, 7, NULL, NULL, 2, 1, 5, 0, 0, 0, '2013-05-05 17:19:39'),
(1066, '2011-03-17 12:00:00', 0, 47, 63, NULL, NULL, 2, 1, 5, 0, 0, 0, '2013-05-05 17:19:44'),
(1067, '2011-03-16 11:00:00', 0, 57, 51, NULL, NULL, 2, 4, 5, 0, 0, 0, '2013-05-05 17:20:13'),
(1068, '2011-03-17 11:00:00', 0, 78, 34, NULL, NULL, 2, 15, 5, 0, 0, 0, '2013-05-05 17:20:47'),
(1069, '2011-03-18 12:00:00', 0, 162, 24, NULL, NULL, 2, 20, 5, 0, 0, 0, '2013-05-05 17:20:55'),
(1070, '2011-03-18 08:00:00', 0, 158, 7, 18, NULL, 2, 21, 5, 0, 0, 0, '2013-05-05 17:21:06'),
(1071, '2011-03-18 09:00:00', 0, 39, 56, NULL, NULL, 2, 1, 5, 0, 0, 0, '2013-05-05 17:21:13'),
(1072, '2011-03-09 09:00:00', 0, 132, 50, 5, NULL, 2, 1, 3, 0, 0, 0, '2013-05-06 10:47:10'),
(1080, '2011-03-10 09:00:00', 0, 75, 40, NULL, NULL, 2, 18, 3, 0, 0, 0, '2013-05-09 13:13:45'),
(1081, '2011-03-08 09:00:00', 0, 72, 4, NULL, NULL, 2, 8, 3, 0, 0, 0, '2013-05-09 13:33:30'),
(1096, '2011-03-08 09:00:00', 0, 64, 43, NULL, NULL, 2, 1, 3, 0, 0, 0, '2013-05-09 14:55:05'),
(1097, '2011-03-09 09:00:00', 0, 64, 43, NULL, NULL, 2, 1, 5, 0, 0, 0, '2013-05-09 14:55:11'),
(1098, '2011-03-08 08:00:00', 0, 62, 54, NULL, NULL, 2, 4, 3, 0, 0, 0, '2013-05-09 14:58:48'),
(1099, '2011-03-08 10:00:00', 0, 114, 45, NULL, NULL, 2, 19, 3, 0, 0, 0, '2013-05-09 14:59:22'),
(1100, '2011-03-08 10:00:00', 0, 131, 21, NULL, NULL, 2, 17, 3, 0, 0, 0, '2013-05-09 14:59:54'),
(1101, '2011-03-09 15:00:00', 0, 130, 63, NULL, NULL, 2, 1, 3, 0, 0, 0, '2013-05-09 15:00:11'),
(1104, '2011-03-07 08:00:00', 0, 64, 43, NULL, NULL, 3, NULL, 3, 0, 0, 0, '2013-05-09 17:51:25'),
(1105, '2012-02-10 08:00:00', 0, 64, 43, NULL, NULL, 2, NULL, 11, 0, 0, 0, '2013-05-09 17:57:09'),
(1106, '2011-03-10 11:00:00', 0, 152, 70, NULL, NULL, 2, 1, 3, 0, 0, 0, '2013-05-12 14:12:37'),
(1107, '2012-09-17 10:00:00', 0, 55, 53, NULL, NULL, 2, 1, 26, 0, 0, 0, '2013-05-12 14:18:48');

-- --------------------------------------------------------

--
-- Структура таблицы `pruefungsform`
--

CREATE TABLE IF NOT EXISTS `pruefungsform` (
  `PFID` tinyint(2) NOT NULL AUTO_INCREMENT,
  `PForm` char(5) NOT NULL,
  PRIMARY KEY (`PFID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `pruefungsform`
--

INSERT INTO `pruefungsform` (`PFID`, `PForm`) VALUES
(2, 'K_90'),
(3, 'K_120'),
(4, 'K_180'),
(5, 'M_30');

-- --------------------------------------------------------

--
-- Структура таблицы `raum`
--

CREATE TABLE IF NOT EXISTS `raum` (
  `RID` int(3) NOT NULL AUTO_INCREMENT,
  `RName` char(5) NOT NULL,
  `Kapazitaet` int(3) NOT NULL,
  `NachbarRaum` tinyint(1) NOT NULL,
  PRIMARY KEY (`RID`),
  UNIQUE KEY `RName` (`RName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `raum`
--

INSERT INTO `raum` (`RID`, `RName`, `Kapazitaet`, `NachbarRaum`) VALUES
(1, '139', 525, 0),
(2, '212', 100, 0),
(3, '214', 100, 0),
(4, '221', 70, 0),
(5, '232', 70, 0),
(6, '234', 20, 0),
(7, '241', 100, 0),
(8, '242', 60, 0),
(9, '251', 48, 0),
(10, '252', 60, 0),
(11, '311', 48, 0),
(12, '312', 100, 0),
(13, '313', 60, 0),
(14, '314', 70, 0),
(15, '315', 48, 0),
(16, '321', 48, 0),
(17, '322', 70, 11),
(18, '323', 60, 0),
(19, '325', 48, 0),
(20, '331', 48, 0),
(21, '342', 70, 0),
(22, '351', 44, 0),
(23, '352', 70, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `sgmodul`
--

CREATE TABLE IF NOT EXISTS `sgmodul` (
  `SGMID` int(6) NOT NULL AUTO_INCREMENT,
  `ModID` int(5) NOT NULL,
  `SGID` tinyint(3) DEFAULT NULL,
  `PrID` int(5) DEFAULT NULL,
  `ModSem` int(1) NOT NULL,
  `PruefLeistung` enum('K','M','HA') NOT NULL,
  `nichtGeprueft` int(1) NOT NULL DEFAULT '1',
  `ModGrp` int(11) NOT NULL,
  `zeitStempel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SGMNotiz` varchar(256) NOT NULL,
  PRIMARY KEY (`SGMID`),
  KEY `fk_sgmodul_modul1` (`ModID`),
  KEY `fk_sgmodul_studiengang1` (`SGID`),
  KEY `fk_sgmodul_pruefer1` (`PrID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- Дамп данных таблицы `sgmodul`
--

INSERT INTO `sgmodul` (`SGMID`, `ModID`, `SGID`, `PrID`, `ModSem`, `PruefLeistung`, `nichtGeprueft`, `ModGrp`, `zeitStempel`, `SGMNotiz`) VALUES
(39, 63, 1, 56, 5, 'M', 1, 0, '2011-04-14 08:19:04', '86'),
(47, 6, 1, 63, 4, 'K', 1, 0, '2011-10-27 07:02:55', '86'),
(48, 25, 1, 34, 4, 'K', 1, 0, '2011-10-27 07:08:23', '86'),
(49, 54, 1, 18, 6, 'K', 1, 0, '2011-10-27 07:15:56', '86'),
(50, 55, 1, 34, 6, 'K', 1, 0, '2011-10-27 07:19:00', '86'),
(51, 58, 1, 7, 5, 'HA', 1, 0, '2011-10-27 07:19:00', '86'),
(52, 59, 1, 7, 6, 'HA', 1, 0, '2011-10-27 07:22:17', '86'),
(53, 64, 1, 56, 6, 'M', 1, 0, '2011-10-27 07:22:17', '86'),
(54, 75, 1, 53, 4, 'K', 2, 0, '2013-05-09 14:18:10', '86'),
(55, 76, 1, 53, 4, 'K', 3, 0, '2011-10-27 07:28:35', '86'),
(56, 79, 1, 54, 3, 'K', 1, 0, '2011-10-27 07:30:47', '86'),
(57, 78, 1, 51, 3, 'K', 1, 0, '2011-10-27 07:30:47', '86'),
(58, 83, 1, 48, 5, 'K', 1, 0, '2011-10-27 07:32:55', '86'),
(59, 81, 1, 18, 3, 'K', 1, 0, '2011-10-27 07:32:55', '86'),
(60, 86, 1, 52, 5, 'K', 1, 0, '2011-10-27 07:34:25', '86'),
(61, 87, 1, 52, 6, 'K', 1, 0, '2011-10-27 07:34:25', '86'),
(62, 134, 2, 54, 1, 'K', 1, 0, '2011-10-27 07:37:01', '86'),
(63, 135, 2, 54, 2, 'K', 1, 0, '2011-10-27 07:37:01', '86'),
(64, 107, 1, 43, 1, 'K', 1, 0, '2011-10-27 07:38:16', '86'),
(65, 108, 1, 43, 2, 'K', 1, 0, '2011-10-27 07:38:16', '86'),
(66, 112, 1, 52, 1, 'K', 1, 0, '2011-10-27 07:39:54', '86'),
(67, 113, 1, 52, 2, 'K', 1, 0, '2011-10-27 07:39:54', '86'),
(68, 132, 2, 18, 1, 'K', 1, 0, '2011-10-27 14:53:47', '86'),
(69, 133, 2, 18, 2, 'K', 1, 0, '2011-10-27 14:53:47', '86'),
(70, 136, 2, 65, 2, 'K', 1, 0, '2011-10-27 14:56:03', '86'),
(71, 137, 2, 65, 3, 'K', 1, 0, '2011-10-27 14:56:03', '86'),
(72, 27, 7, 4, 3, 'K', 1, 0, '2011-10-27 14:57:52', '86'),
(73, 28, 7, 4, 4, 'K', 1, 0, '2011-10-27 14:57:52', '86'),
(74, 7, 7, 40, 3, 'K', 1, 0, '2011-10-27 15:00:24', '86'),
(75, 16, 7, 40, 4, 'K', 1, 0, '2011-10-27 15:00:24', '86'),
(76, 85, 1, 34, 5, 'K', 1, 0, '2011-10-27 15:03:04', '86'),
(77, 19, 2, 24, 5, 'K', 1, 0, '2011-10-27 15:03:04', '86'),
(78, 82, 1, 34, 5, 'K', 1, 0, '2011-10-27 15:06:25', '86'),
(79, 60, 1, 43, 5, 'K', 1, 0, '2011-10-27 15:06:25', '86'),
(80, 61, 1, 43, 6, 'K', 1, 0, '2011-10-27 15:07:40', '86'),
(81, 62, 1, 53, 5, 'HA', 1, 0, '2011-10-27 15:07:40', '86'),
(82, 84, 1, 51, 6, 'K', 1, 0, '2011-10-27 15:10:25', '86'),
(83, 22, 1, 65, 6, 'K', 1, 0, '2011-10-27 15:10:25', '86'),
(84, 10, 2, 55, 5, 'M', 1, 0, '2011-10-27 15:14:55', '86'),
(85, 56, 1, 7, 5, 'K', 1, 0, '2011-10-27 15:14:55', '86'),
(86, 57, 1, 53, 6, 'HA', 1, 0, '2011-10-27 15:18:03', 'Testkommentar'),
(87, 21, 1, 48, 4, 'K', 1, 0, '2011-10-27 15:19:05', '86'),
(88, 18, 2, 54, 6, 'K', 1, 0, '2012-04-18 16:13:07', '86'),
(90, 2, 2, 50, 5, 'K', 1, 0, '2013-05-03 18:25:08', 'awdawdadadawdawd'),
(91, 3, 2, 55, 5, 'M', 1, 0, '2012-04-22 09:37:52', '86'),
(98, 5, 2, 63, 5, 'K', 1, 0, '2012-04-22 09:38:00', '86'),
(99, 8, 2, 50, 6, 'K', 1, 0, '2012-04-22 09:39:15', '86'),
(100, 9, 2, 24, 3, 'K', 1, 0, '2012-04-22 09:39:15', '86'),
(101, 13, 2, 24, 6, 'M', 1, 0, '2012-04-22 09:40:33', '86'),
(102, 14, 2, 50, 4, 'K', 1, 0, '2012-04-22 09:40:33', '86'),
(103, 15, 2, 40, 5, 'K', 1, 0, '2012-04-22 09:40:33', '86'),
(104, 17, 2, 71, 6, 'K', 1, 0, '2012-04-22 09:40:33', '86'),
(105, 20, 2, 55, 6, 'M', 1, 0, '2012-04-22 09:40:33', '86'),
(106, 23, 2, 40, 6, 'M', 1, 0, '2012-04-22 09:41:38', '86'),
(107, 24, 2, 56, 5, 'M', 1, 0, '2012-04-22 09:41:38', '86'),
(108, 26, 2, 55, 4, 'K', 1, 0, '2012-04-22 09:41:38', '86'),
(109, 29, 2, 50, 5, 'K', 1, 0, '2012-04-22 09:43:36', '86'),
(110, 30, 2, 50, 6, 'K', 1, 0, '2012-04-22 09:43:36', '86'),
(111, 31, 2, 65, 1, 'K', 1, 0, '2012-04-22 09:43:36', '86'),
(112, 71, 1, 51, 1, 'K', 1, 0, '2012-04-22 09:43:36', '86'),
(113, 72, 1, 51, 2, 'K', 1, 0, '2012-04-22 09:43:36', '86'),
(114, 88, 4, 45, 6, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(115, 89, 4, 63, 6, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(116, 94, 4, 45, 2, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(117, 95, 4, 45, 1, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(118, 109, 4, 45, 3, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(119, 115, 4, 56, 1, 'HA', 1, 0, '2012-04-22 09:46:52', '86'),
(120, 120, 4, 45, 4, 'K', 1, 0, '2012-04-22 09:46:52', '86'),
(121, 121, 4, 56, 6, 'M', 1, 0, '2012-04-22 09:46:52', '86'),
(124, 127, 4, 21, 6, 'K', 1, 0, '2012-04-22 10:35:49', '86'),
(125, 22, 2, 65, 6, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(126, 6, 4, 63, 4, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(127, 25, 2, 34, 3, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(128, 25, 4, 63, 3, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(130, 5, 4, 63, 5, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(131, 3, 4, 21, 5, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(132, 2, 4, 50, 5, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(133, 98, 4, 56, 2, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(134, 99, 4, 21, 1, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(135, 100, 4, 21, 2, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(136, 14, 4, 50, 4, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(137, 103, 4, 38, 3, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(138, 104, 4, 38, 4, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(139, 17, 4, 1, 5, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(140, 138, 4, 38, 1, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(141, 128, 2, 77, 1, 'K', 1, 0, '2013-05-03 18:32:12', '86'),
(142, 139, 4, 38, 2, 'K', 0, 0, '2012-04-22 10:45:04', '86'),
(143, 129, 2, 77, 2, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(144, 21, 4, 55, 3, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(145, 21, 2, 55, 3, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(146, 24, 4, 56, 5, 'M', 1, 0, '2012-04-22 10:45:04', '86'),
(147, 142, 4, 70, 1, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(148, 130, 2, 52, 1, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(149, 143, 4, 70, 2, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(150, 131, 2, 52, 2, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(151, 29, 4, 50, 5, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(152, 30, 4, 70, 6, 'K', 1, 0, '2012-04-22 10:45:04', '86'),
(153, 6, 2, 63, 4, 'K', 1, 0, '2012-04-22 11:02:38', '86'),
(154, 10, 1, 55, 5, 'M', 1, 0, '2012-04-22 11:05:09', '86'),
(155, 99, 1, 48, 1, 'K', 1, 0, '2012-04-22 11:07:13', '86'),
(156, 100, 1, 48, 2, 'K', 1, 0, '2012-04-22 11:07:13', '86'),
(157, 140, 1, 7, 1, 'K', 1, 0, '2012-04-22 11:10:54', '86'),
(158, 141, 1, 7, 2, 'K', 1, 0, '2012-04-22 11:10:54', '86'),
(159, 144, 4, 78, 2, 'K', 0, 0, '2013-05-09 14:18:05', ''),
(160, 145, 1, 78, 5, 'K', 0, 0, '2012-04-25 17:23:50', '86'),
(161, 146, 1, 80, 6, 'K', 0, 0, '2012-04-25 17:42:36', '86'),
(162, 147, 1, 24, 5, 'M', 0, 0, '2012-04-27 10:25:14', '86');

-- --------------------------------------------------------

--
-- Структура таблицы `studiengang`
--

CREATE TABLE IF NOT EXISTS `studiengang` (
  `SGID` tinyint(3) NOT NULL AUTO_INCREMENT,
  `SGName` varchar(30) NOT NULL,
  `SGKurz` varchar(30) NOT NULL,
  PRIMARY KEY (`SGID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `studiengang`
--

INSERT INTO `studiengang` (`SGID`, `SGName`, `SGKurz`) VALUES
(1, 'Informationstechnik', 'IT'),
(2, 'Elektrotechnik', 'ET'),
(4, 'Regenerative Energien', 'RE'),
(6, 'Ingenieursinformatik', 'IgI'),
(7, 'Übergreifend', 'Üg');

-- --------------------------------------------------------

--
-- Структура таблицы `temp`
--

CREATE TABLE IF NOT EXISTS `temp` (
  `nidentid` varchar(255) NOT NULL,
  `nanzbelegt` int(11) DEFAULT NULL,
  `nanzspalten` int(11) DEFAULT NULL,
  `nbelegt` float DEFAULT NULL,
  `ndatum` varchar(255) DEFAULT NULL,
  `nlfdevent` int(11) DEFAULT NULL,
  `nposbelegt` int(11) DEFAULT NULL,
  `szelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nidentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `fk_accounts_benutzergruppe1` FOREIGN KEY (`GroupID`) REFERENCES `benutzergruppe` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_accounts_GroupID` FOREIGN KEY (`GroupID`) REFERENCES `benutzergruppe` (`GroupID`);

--
-- Ограничения внешнего ключа таблицы `conflicts`
--
ALTER TABLE `conflicts`
  ADD CONSTRAINT `fk_conflicts_pruefplaneintrag1` FOREIGN KEY (`current`) REFERENCES `pruefplaneintrag` (`PPID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_conflicts_pruefplaneintrag2` FOREIGN KEY (`conflict`) REFERENCES `pruefplaneintrag` (`PPID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `FK_mitarbeiter_AccID` FOREIGN KEY (`AccID`) REFERENCES `accounts` (`AccID`),
  ADD CONSTRAINT `fk_mitarbeiter_accounts1` FOREIGN KEY (`AccID`) REFERENCES `accounts` (`AccID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `modul`
--
ALTER TABLE `modul`
  ADD CONSTRAINT `FK_modul_PCID` FOREIGN KEY (`PCID`) REFERENCES `pruefcodes` (`PCID`),
  ADD CONSTRAINT `fk_modul_pruefcodes1` FOREIGN KEY (`PCID`) REFERENCES `pruefcodes` (`PCID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `pruefer`
--
ALTER TABLE `pruefer`
  ADD CONSTRAINT `FK_pruefer_AccID` FOREIGN KEY (`AccId`) REFERENCES `accounts` (`AccID`),
  ADD CONSTRAINT `fk_pruefer_accounts1` FOREIGN KEY (`AccId`) REFERENCES `accounts` (`AccID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `pruefplaneintrag`
--
ALTER TABLE `pruefplaneintrag`
  ADD CONSTRAINT `FK_pruefplaneintrag_ErstPruefID` FOREIGN KEY (`ErstPruefID`) REFERENCES `pruefer` (`PrID`),
  ADD CONSTRAINT `FK_pruefplaneintrag_MaID` FOREIGN KEY (`MaID`) REFERENCES `mitarbeiter` (`MaID`),
  ADD CONSTRAINT `fk_pruefplaneintrag_mitarbeiter1` FOREIGN KEY (`MaID`) REFERENCES `mitarbeiter` (`MaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_pruefplaneintrag_PFID` FOREIGN KEY (`PFID`) REFERENCES `pruefungsform` (`PFID`),
  ADD CONSTRAINT `fk_pruefplaneintrag_pruefer1` FOREIGN KEY (`ErstPruefID`) REFERENCES `pruefer` (`PrID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pruefplaneintrag_pruefer2` FOREIGN KEY (`ZweitPruefID`) REFERENCES `pruefer` (`PrID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_pruefplaneintrag_PruefPeriode` FOREIGN KEY (`PruefPeriode`) REFERENCES `pruefperioden` (`PrPeID`),
  ADD CONSTRAINT `fk_pruefplaneintrag_pruefperioden1` FOREIGN KEY (`PruefPeriode`) REFERENCES `pruefperioden` (`PrPeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pruefplaneintrag_pruefungsform1` FOREIGN KEY (`PFID`) REFERENCES `pruefungsform` (`PFID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pruefplaneintrag_raum1` FOREIGN KEY (`RID`) REFERENCES `raum` (`RID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_pruefplaneintrag_RID` FOREIGN KEY (`RID`) REFERENCES `raum` (`RID`),
  ADD CONSTRAINT `FK_pruefplaneintrag_SGMID` FOREIGN KEY (`SGMID`) REFERENCES `sgmodul` (`SGMID`),
  ADD CONSTRAINT `fk_pruefplaneintrag_sgmodul1` FOREIGN KEY (`SGMID`) REFERENCES `sgmodul` (`SGMID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_pruefplaneintrag_ZweitPruefID` FOREIGN KEY (`ZweitPruefID`) REFERENCES `pruefer` (`PrID`);

--
-- Ограничения внешнего ключа таблицы `sgmodul`
--
ALTER TABLE `sgmodul`
  ADD CONSTRAINT `FK_sgmodul_ModID` FOREIGN KEY (`ModID`) REFERENCES `modul` (`ModID`),
  ADD CONSTRAINT `fk_sgmodul_modul1` FOREIGN KEY (`ModID`) REFERENCES `modul` (`ModID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sgmodul_PrID` FOREIGN KEY (`PrID`) REFERENCES `pruefer` (`PrID`),
  ADD CONSTRAINT `fk_sgmodul_pruefer1` FOREIGN KEY (`PrID`) REFERENCES `pruefer` (`PrID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sgmodul_SGID` FOREIGN KEY (`SGID`) REFERENCES `studiengang` (`SGID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
