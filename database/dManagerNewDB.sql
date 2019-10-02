-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 02 Paź 2019, 18:37
-- Wersja serwera: 5.7.27-0ubuntu0.19.04.1
-- Wersja PHP: 7.2.19-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dManagerNewDB`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contests`
--

CREATE TABLE `contests` (
  `contestId` int(11) NOT NULL,
  `stadiumId` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `contests`
--

INSERT INTO `contests` (`contestId`, `stadiumId`, `name`, `finished`, `date`) VALUES
(156, 7, 'sdf', 0, '2019-10-05'),
(157, 7, 'test', 0, '2019-10-25');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contestsUsers`
--

CREATE TABLE `contestsUsers` (
  `contestsUsersId` int(11) NOT NULL,
  `contestId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `relation` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `contestsUsers`
--

INSERT INTO `contestsUsers` (`contestsUsersId`, `contestId`, `userId`, `relation`) VALUES
(0, 155, 1, 0),
(2, 155, 2, 0),
(3, 155, 1, 0),
(4, 155, 1, 0),
(5, 156, 1, 0);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `contestsUsersView`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `contestsUsersView` (
`contestsUsersId` int(11)
,`relation` int(11)
,`contestId` int(11)
,`userId` int(11)
,`login` text
,`firstName` varchar(100)
,`lastName` text
,`email` text
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `countries`
--

CREATE TABLE `countries` (
  `countryId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `taken` int(11) DEFAULT NULL,
  `image_round` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `countries`
--

INSERT INTO `countries` (`countryId`, `name`, `taken`, `image_round`) VALUES
(1, 'Abkhazia', 0, 'assets/images/flags/abkhazia.svg'),
(2, 'Afghanistan', 0, 'assets/images/flags/afghanistan.svg'),
(3, 'Aland Islands', 0, 'assets/images/flags/aland-islands.svg'),
(4, 'Albania', 0, 'assets/images/flags/albania.svg'),
(5, 'Algeria', 0, 'assets/images/flags/algeria.svg'),
(6, 'American Samoa', 0, 'assets/images/flags/american-samoa.svg'),
(7, 'Andorra', 0, 'assets/images/flags/andorra.svg'),
(8, 'Angola', 0, 'assets/images/flags/angola.svg'),
(9, 'Anguilla', 1, 'assets/images/flags/anguilla.svg'),
(10, 'Antigua And Barbuda', 0, 'assets/images/flags/antigua-and-barbuda.svg'),
(11, 'Argentina', 0, 'assets/images/flags/argentina.svg'),
(12, 'Armenia', 0, 'assets/images/flags/armenia.svg'),
(13, 'Aruba', 0, 'assets/images/flags/aruba.svg'),
(14, 'Australia', 0, 'assets/images/flags/australia.svg'),
(15, 'Austria', 0, 'assets/images/flags/austria.svg'),
(16, 'Azerbaijan', 0, 'assets/images/flags/azerbaijan.svg'),
(17, 'Azores Islands', 0, 'assets/images/flags/azores-islands.svg'),
(18, 'Bahamas', 0, 'assets/images/flags/bahamas.svg'),
(19, 'Bahrain', 0, 'assets/images/flags/bahrain.svg'),
(20, 'Balearic Islands', 0, 'assets/images/flags/balearic-islands.svg'),
(21, 'Bangladesh', 0, 'assets/images/flags/bangladesh.svg'),
(22, 'Barbados', 0, 'assets/images/flags/barbados.svg'),
(23, 'Basque Country', 0, 'assets/images/flags/basque-country.svg'),
(24, 'Belarus', 0, 'assets/images/flags/belarus.svg'),
(25, 'Belgium', 1, 'assets/images/flags/belgium.svg'),
(26, 'Belize', 0, 'assets/images/flags/belize.svg'),
(27, 'Benin', 0, 'assets/images/flags/benin.svg'),
(28, 'Bermuda', 0, 'assets/images/flags/bermuda.svg'),
(29, 'Bhutan 1', 0, 'assets/images/flags/bhutan-1.svg'),
(30, 'Bhutan', 0, 'assets/images/flags/bhutan.svg'),
(31, 'Bolivia', 0, 'assets/images/flags/bolivia.svg'),
(32, 'Bonaire', 0, 'assets/images/flags/bonaire.svg'),
(33, 'Bosnia And Herzegovina', 0, 'assets/images/flags/bosnia-and-herzegovina.svg'),
(34, 'Botswana', 0, 'assets/images/flags/botswana.svg'),
(35, 'Brazil', 0, 'assets/images/flags/brazil.svg'),
(36, 'British Columbia', 0, 'assets/images/flags/british-columbia.svg'),
(37, 'British Indian Ocean Territory', 0, 'assets/images/flags/british-indian-ocean-territory.svg'),
(38, 'British Virgin Islands', 0, 'assets/images/flags/british-virgin-islands.svg'),
(39, 'Brunei', 0, 'assets/images/flags/brunei.svg'),
(40, 'Bulgaria', 0, 'assets/images/flags/bulgaria.svg'),
(41, 'Burkina Faso', 0, 'assets/images/flags/burkina-faso.svg'),
(42, 'Burundi', 0, 'assets/images/flags/burundi.svg'),
(43, 'Cambodia', 0, 'assets/images/flags/cambodia.svg'),
(44, 'Cameroon', 0, 'assets/images/flags/cameroon.svg'),
(45, 'Canada', 0, 'assets/images/flags/canada.svg'),
(46, 'Canary Islands', 0, 'assets/images/flags/canary-islands.svg'),
(47, 'Cape Verde', 0, 'assets/images/flags/cape-verde.svg'),
(48, 'Cayman Islands', 0, 'assets/images/flags/cayman-islands.svg'),
(49, 'Central African Republic', 0, 'assets/images/flags/central-african-republic.svg'),
(50, 'Ceuta', 0, 'assets/images/flags/ceuta.svg'),
(51, 'Chad', 0, 'assets/images/flags/chad.svg'),
(52, 'Chile', 0, 'assets/images/flags/chile.svg'),
(53, 'China', 0, 'assets/images/flags/china.svg'),
(54, 'Christmas Island', 0, 'assets/images/flags/christmas-island.svg'),
(55, 'Cocos Island', 0, 'assets/images/flags/cocos-island.svg'),
(56, 'Colombia', 0, 'assets/images/flags/colombia.svg'),
(57, 'Comoros', 0, 'assets/images/flags/comoros.svg'),
(58, 'Cook Islands', 0, 'assets/images/flags/cook-islands.svg'),
(59, 'Corsica', 0, 'assets/images/flags/corsica.svg'),
(60, 'Costa Rica', 0, 'assets/images/flags/costa-rica.svg'),
(61, 'Croatia', 0, 'assets/images/flags/croatia.svg'),
(62, 'Cuba', 0, 'assets/images/flags/cuba.svg'),
(63, 'Curacao', 0, 'assets/images/flags/curacao.svg'),
(64, 'Cyprus', 0, 'assets/images/flags/cyprus.svg'),
(65, 'Czech Republic', 0, 'assets/images/flags/czech-republic.svg'),
(66, 'Democratic Republic Of Congo', 0, 'assets/images/flags/democratic-republic-of-congo.svg'),
(67, 'Denmark', 0, 'assets/images/flags/denmark.svg'),
(68, 'Djibouti', 0, 'assets/images/flags/djibouti.svg'),
(69, 'Dominica', 0, 'assets/images/flags/dominica.svg'),
(70, 'Dominican Republic', 0, 'assets/images/flags/dominican-republic.svg'),
(71, 'East Timor', 0, 'assets/images/flags/east-timor.svg'),
(72, 'Ecuador', 0, 'assets/images/flags/ecuador.svg'),
(73, 'Egypt', 0, 'assets/images/flags/egypt.svg'),
(74, 'England', 0, 'assets/images/flags/england.svg'),
(75, 'Equatorial Guinea', 0, 'assets/images/flags/equatorial-guinea.svg'),
(76, 'Eritrea', 1, 'assets/images/flags/eritrea.svg'),
(77, 'Estonia', 0, 'assets/images/flags/estonia.svg'),
(78, 'Ethiopia', 0, 'assets/images/flags/ethiopia.svg'),
(79, 'European Union', 0, 'assets/images/flags/european-union.svg'),
(80, 'Falkland Islands', 0, 'assets/images/flags/falkland-islands.svg'),
(81, 'Faroe Islands', 0, 'assets/images/flags/faroe-islands.svg'),
(82, 'Fiji', 0, 'assets/images/flags/fiji.svg'),
(83, 'Finland', 0, 'assets/images/flags/finland.svg'),
(84, 'France', 0, 'assets/images/flags/france.svg'),
(85, 'French Polynesia', 0, 'assets/images/flags/french-polynesia.svg'),
(86, 'Gabon', 0, 'assets/images/flags/gabon.svg'),
(87, 'Galapagos Islands', 0, 'assets/images/flags/galapagos-islands.svg'),
(88, 'Gambia', 0, 'assets/images/flags/gambia.svg'),
(89, 'Georgia', 0, 'assets/images/flags/georgia.svg'),
(90, 'Germany', 0, 'assets/images/flags/germany.svg'),
(91, 'Ghana', 0, 'assets/images/flags/ghana.svg'),
(92, 'Gibraltar', 0, 'assets/images/flags/gibraltar.svg'),
(93, 'Greece', 0, 'assets/images/flags/greece.svg'),
(94, 'Greenland', 0, 'assets/images/flags/greenland.svg'),
(95, 'Grenada', 0, 'assets/images/flags/grenada.svg'),
(96, 'Guam', 0, 'assets/images/flags/guam.svg'),
(97, 'Guatemala', 0, 'assets/images/flags/guatemala.svg'),
(98, 'Guernsey', 0, 'assets/images/flags/guernsey.svg'),
(99, 'Guinea Bissau', 0, 'assets/images/flags/guinea-bissau.svg'),
(100, 'Guinea', 0, 'assets/images/flags/guinea.svg'),
(101, 'Guyana', 0, 'assets/images/flags/guyana.svg'),
(102, 'Haiti', 0, 'assets/images/flags/haiti.svg'),
(103, 'Hawaii', 0, 'assets/images/flags/hawaii.svg'),
(104, 'Honduras', 0, 'assets/images/flags/honduras.svg'),
(105, 'Hong Kong', 0, 'assets/images/flags/hong-kong.svg'),
(106, 'Hungary', 0, 'assets/images/flags/hungary.svg'),
(107, 'Iceland', 0, 'assets/images/flags/iceland.svg'),
(108, 'India', 0, 'assets/images/flags/india.svg'),
(109, 'Indonesia', 0, 'assets/images/flags/indonesia.svg'),
(110, 'Iran', 0, 'assets/images/flags/iran.svg'),
(111, 'Iraq', 0, 'assets/images/flags/iraq.svg'),
(112, 'Ireland', 0, 'assets/images/flags/ireland.svg'),
(113, 'Isle Of Man', 0, 'assets/images/flags/isle-of-man.svg'),
(114, 'Israel', 0, 'assets/images/flags/israel.svg'),
(115, 'Italy', 0, 'assets/images/flags/italy.svg'),
(116, 'Ivory Coast', 0, 'assets/images/flags/ivory-coast.svg'),
(117, 'Jamaica', 0, 'assets/images/flags/jamaica.svg'),
(118, 'Japan', 0, 'assets/images/flags/japan.svg'),
(119, 'Jersey', 0, 'assets/images/flags/jersey.svg'),
(120, 'Jordan', 0, 'assets/images/flags/jordan.svg'),
(121, 'Kazakhstan', 0, 'assets/images/flags/kazakhstan.svg'),
(122, 'Kenya', 0, 'assets/images/flags/kenya.svg'),
(123, 'Kiribati', 0, 'assets/images/flags/kiribati.svg'),
(124, 'Kosovo', 0, 'assets/images/flags/kosovo.svg'),
(125, 'Kuwait', 0, 'assets/images/flags/kuwait.svg'),
(126, 'Kyrgyzstan', 0, 'assets/images/flags/kyrgyzstan.svg'),
(127, 'Laos', 0, 'assets/images/flags/laos.svg'),
(128, 'Latvia', 0, 'assets/images/flags/latvia.svg'),
(129, 'Lebanon', 0, 'assets/images/flags/lebanon.svg'),
(130, 'Lesotho', 0, 'assets/images/flags/lesotho.svg'),
(131, 'Liberia', 0, 'assets/images/flags/liberia.svg'),
(132, 'Libya', 0, 'assets/images/flags/libya.svg'),
(133, 'Liechtenstein', 0, 'assets/images/flags/liechtenstein.svg'),
(134, 'Lithuania', 0, 'assets/images/flags/lithuania.svg'),
(135, 'Luxembourg', 0, 'assets/images/flags/luxembourg.svg'),
(136, 'Macao', 0, 'assets/images/flags/macao.svg'),
(137, 'Madagascar', 0, 'assets/images/flags/madagascar.svg'),
(138, 'Madeira', 0, 'assets/images/flags/madeira.svg'),
(139, 'Malawi', 0, 'assets/images/flags/malawi.svg'),
(140, 'Malaysia', 0, 'assets/images/flags/malaysia.svg'),
(141, 'Maldives', 0, 'assets/images/flags/maldives.svg'),
(142, 'Mali', 0, 'assets/images/flags/mali.svg'),
(143, 'Malta', 0, 'assets/images/flags/malta.svg'),
(144, 'Marshall Island', 0, 'assets/images/flags/marshall-island.svg'),
(145, 'Martinique', 0, 'assets/images/flags/martinique.svg'),
(146, 'Mauritania', 0, 'assets/images/flags/mauritania.svg'),
(147, 'Mauritius', 0, 'assets/images/flags/mauritius.svg'),
(148, 'Melilla', 0, 'assets/images/flags/melilla.svg'),
(149, 'Mexico', 0, 'assets/images/flags/mexico.svg'),
(150, 'Micronesia', 0, 'assets/images/flags/micronesia.svg'),
(151, 'Moldova', 0, 'assets/images/flags/moldova.svg'),
(152, 'Monaco', 0, 'assets/images/flags/monaco.svg'),
(153, 'Mongolia', 0, 'assets/images/flags/mongolia.svg'),
(154, 'Montenegro', 0, 'assets/images/flags/montenegro.svg'),
(155, 'Montserrat', 0, 'assets/images/flags/montserrat.svg'),
(156, 'Morocco', 0, 'assets/images/flags/morocco.svg'),
(157, 'Mozambique', 0, 'assets/images/flags/mozambique.svg'),
(158, 'Myanmar', 0, 'assets/images/flags/myanmar.svg'),
(159, 'Namibia', 0, 'assets/images/flags/namibia.svg'),
(160, 'Nato', 0, 'assets/images/flags/nato.svg'),
(161, 'Nauru', 0, 'assets/images/flags/nauru.svg'),
(162, 'Nepal', 0, 'assets/images/flags/nepal.svg'),
(163, 'Netherlands', 0, 'assets/images/flags/netherlands.svg'),
(164, 'New Zealand', 0, 'assets/images/flags/new-zealand.svg'),
(165, 'Nicaragua', 0, 'assets/images/flags/nicaragua.svg'),
(166, 'Niger', 0, 'assets/images/flags/niger.svg'),
(167, 'Nigeria', 0, 'assets/images/flags/nigeria.svg'),
(168, 'Niue', 0, 'assets/images/flags/niue.svg'),
(169, 'Norfolk Island', 0, 'assets/images/flags/norfolk-island.svg'),
(170, 'North Korea', 0, 'assets/images/flags/north-korea.svg'),
(171, 'Northen Cyprus', 0, 'assets/images/flags/northen-cyprus.svg'),
(172, 'Northern Marianas Islands', 0, 'assets/images/flags/northern-marianas-islands.svg'),
(173, 'Norway', 0, 'assets/images/flags/norway.svg'),
(174, 'Oman', 0, 'assets/images/flags/oman.svg'),
(175, 'Orkney Islands', 0, 'assets/images/flags/orkney-islands.svg'),
(176, 'Ossetia', 0, 'assets/images/flags/ossetia.svg'),
(177, 'Pakistan', 0, 'assets/images/flags/pakistan.svg'),
(178, 'Palau', 0, 'assets/images/flags/palau.svg'),
(179, 'Palestine', 0, 'assets/images/flags/palestine.svg'),
(180, 'Panama', 0, 'assets/images/flags/panama.svg'),
(181, 'Papua New Guinea', 0, 'assets/images/flags/papua-new-guinea.svg'),
(182, 'Paraguay', 0, 'assets/images/flags/paraguay.svg'),
(183, 'Peru', 0, 'assets/images/flags/peru.svg'),
(184, 'Philippines', 0, 'assets/images/flags/philippines.svg'),
(185, 'Pitcairn Islands', 0, 'assets/images/flags/pitcairn-islands.svg'),
(186, 'Portugal', 0, 'assets/images/flags/portugal.svg'),
(187, 'Puerto Rico', 0, 'assets/images/flags/puerto-rico.svg'),
(188, 'Qatar', 0, 'assets/images/flags/qatar.svg'),
(189, 'Rapa Nui', 0, 'assets/images/flags/rapa-nui.svg'),
(190, 'Republic Of Macedonia', 0, 'assets/images/flags/republic-of-macedonia.svg'),
(191, 'Poland', 1, 'assets/images/flags/republic-of-poland.svg'),
(192, 'Republic Of The Congo', 0, 'assets/images/flags/republic-of-the-congo.svg'),
(193, 'Romania', 0, 'assets/images/flags/romania.svg'),
(194, 'Russia', 0, 'assets/images/flags/russia.svg'),
(195, 'Rwanda', 0, 'assets/images/flags/rwanda.svg'),
(196, 'Saba Island', 0, 'assets/images/flags/saba-island.svg'),
(197, 'Saint Kitts And Nevis', 0, 'assets/images/flags/saint-kitts-and-nevis.svg'),
(198, 'Salvador', 0, 'assets/images/flags/salvador.svg'),
(199, 'Samoa', 0, 'assets/images/flags/samoa.svg'),
(200, 'San Marino', 0, 'assets/images/flags/san-marino.svg'),
(201, 'Sao Tome And Principe', 0, 'assets/images/flags/sao-tome-and-principe.svg'),
(202, 'Sardinia', 0, 'assets/images/flags/sardinia.svg'),
(203, 'Saudi Arabia', 0, 'assets/images/flags/saudi-arabia.svg'),
(204, 'Scotland', 0, 'assets/images/flags/scotland.svg'),
(205, 'Senegal', 0, 'assets/images/flags/senegal.svg'),
(206, 'Serbia', 0, 'assets/images/flags/serbia.svg'),
(207, 'Seychelles', 0, 'assets/images/flags/seychelles.svg'),
(208, 'Sierra Leone', 0, 'assets/images/flags/sierra-leone.svg'),
(209, 'Singapore', 0, 'assets/images/flags/singapore.svg'),
(210, 'Sint Eustatius', 0, 'assets/images/flags/sint-eustatius.svg'),
(211, 'Sint Maarten', 0, 'assets/images/flags/sint-maarten.svg'),
(212, 'Slovakia', 0, 'assets/images/flags/slovakia.svg'),
(213, 'Slovenia', 0, 'assets/images/flags/slovenia.svg'),
(214, 'Solomon Islands', 0, 'assets/images/flags/solomon-islands.svg'),
(215, 'Somalia', 0, 'assets/images/flags/somalia.svg'),
(216, 'Somaliland', 0, 'assets/images/flags/somaliland.svg'),
(217, 'South Africa', 0, 'assets/images/flags/south-africa.svg'),
(218, 'South Korea', 0, 'assets/images/flags/south-korea.svg'),
(219, 'South Sudan', 0, 'assets/images/flags/south-sudan.svg'),
(220, 'Spain', 0, 'assets/images/flags/spain.svg'),
(221, 'Sri Lanka', 0, 'assets/images/flags/sri-lanka.svg'),
(222, 'St Barts', 0, 'assets/images/flags/st-barts.svg'),
(223, 'St Lucia', 0, 'assets/images/flags/st-lucia.svg'),
(224, 'St Vincent And The Grenadines', 0, 'assets/images/flags/st-vincent-and-the-grenadines.svg'),
(225, 'Sudan', 0, 'assets/images/flags/sudan.svg'),
(226, 'Suriname', 0, 'assets/images/flags/suriname.svg'),
(227, 'Swaziland', 0, 'assets/images/flags/swaziland.svg'),
(228, 'Sweden', 0, 'assets/images/flags/sweden.svg'),
(229, 'Switzerland', 0, 'assets/images/flags/switzerland.svg'),
(230, 'Syria', 0, 'assets/images/flags/syria.svg'),
(231, 'Taiwan', 0, 'assets/images/flags/taiwan.svg'),
(232, 'Tajikistan', 0, 'assets/images/flags/tajikistan.svg'),
(233, 'Tanzania', 0, 'assets/images/flags/tanzania.svg'),
(234, 'Thailand', 0, 'assets/images/flags/thailand.svg'),
(235, 'Tibet', 0, 'assets/images/flags/tibet.svg'),
(236, 'Togo', 0, 'assets/images/flags/togo.svg'),
(237, 'Tokelau', 0, 'assets/images/flags/tokelau.svg'),
(238, 'Tonga', 0, 'assets/images/flags/tonga.svg'),
(239, 'Transnistria', 0, 'assets/images/flags/transnistria.svg'),
(240, 'Trinidad And Tobago', 0, 'assets/images/flags/trinidad-and-tobago.svg'),
(241, 'Tunisia', 0, 'assets/images/flags/tunisia.svg'),
(242, 'Turkey', 0, 'assets/images/flags/turkey.svg'),
(243, 'Turkmenistan', 0, 'assets/images/flags/turkmenistan.svg'),
(244, 'Turks And Caicos', 0, 'assets/images/flags/turks-and-caicos.svg'),
(245, 'Tuvalu', 0, 'assets/images/flags/tuvalu.svg'),
(246, 'Uganda', 0, 'assets/images/flags/uganda.svg'),
(247, 'Ukraine', 0, 'assets/images/flags/ukraine.svg'),
(248, 'United Arab Emirates', 0, 'assets/images/flags/united-arab-emirates.svg'),
(249, 'United Kingdom', 0, 'assets/images/flags/united-kingdom.svg'),
(250, 'United Nations', 0, 'assets/images/flags/united-nations.svg'),
(251, 'United States Of America', 0, 'assets/images/flags/united-states-of-america.svg'),
(252, 'Uruguay', 0, 'assets/images/flags/uruguay.svg'),
(253, 'Uzbekistn', 0, 'assets/images/flags/uzbekistn.svg'),
(254, 'Vanuatu', 0, 'assets/images/flags/vanuatu.svg'),
(255, 'Vatican City', 0, 'assets/images/flags/vatican-city.svg'),
(256, 'Venezuela', 0, 'assets/images/flags/venezuela.svg'),
(257, 'Vietnam', 0, 'assets/images/flags/vietnam.svg'),
(258, 'Virgin Islands', 0, 'assets/images/flags/virgin-islands.svg'),
(259, 'Wales', 0, 'assets/images/flags/wales.svg'),
(260, 'Western Sahara', 0, 'assets/images/flags/western-sahara.svg'),
(261, 'Yemen', 0, 'assets/images/flags/yemen.svg'),
(262, 'Zambia', 0, 'assets/images/flags/zambia.svg'),
(263, 'Zimbabwe', 0, 'assets/images/flags/zimbabwe.svg');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `countryGroup`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `countryGroup` (
`country` varchar(45)
,`cId` int(11)
,`group` varchar(45)
,`groupId` int(11)
,`phaseId` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `goals`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `goals` (
`id` int(11)
,`matchId` int(11)
,`playerId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`countryId` int(11)
,`countryName` varchar(45)
,`groupId` int(11)
,`groupName` varchar(45)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `groupData`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `groupData` (
`country` varchar(45)
,`cid` int(11)
,`group` varchar(45)
,`groupId` int(11)
,`phaseId` int(11)
,`M` bigint(21)
,`W` bigint(21)
,`P` bigint(21)
,`R` bigint(21)
,`BP` bigint(21)
,`BM` bigint(21)
,`Bilans` bigint(22)
,`Points` bigint(23)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `groupdataBase`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `groupdataBase` (
`country` varchar(45)
,`cid` int(11)
,`group` varchar(45)
,`groupId` int(11)
,`phaseId` int(11)
,`M` bigint(21)
,`W` bigint(21)
,`P` bigint(21)
,`R` bigint(21)
,`BP` bigint(21)
,`BM` bigint(21)
,`Bilans` bigint(22)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `phaseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `groups`
--

INSERT INTO `groups` (`groupId`, `name`, `phaseId`) VALUES
(1, NULL, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `humanPlayers`
--

CREATE TABLE `humanPlayers` (
  `humanPlayerId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  `contestId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `humanPlayers`
--

INSERT INTO `humanPlayers` (`humanPlayerId`, `countryId`, `contestId`, `userId`) VALUES
(1, 25, 157, 3),
(2, 191, 156, 2),
(3, 25, 156, 5);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `injuries`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `injuries` (
`id` int(11)
,`matchId` int(11)
,`playerId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`countryId` int(11)
,`countryName` varchar(45)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `matches`
--

CREATE TABLE `matches` (
  `matchId` int(11) NOT NULL,
  `t1` int(11) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `p1` int(11) DEFAULT NULL,
  `p2` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `played` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `matches`
--

INSERT INTO `matches` (`matchId`, `t1`, `t2`, `p1`, `p2`, `groupId`, `played`) VALUES
(1, 191, 25, 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `matchesTable`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `matchesTable` (
`matchid` int(11)
,`p1id` int(11)
,`p1name` varchar(100)
,`p1surname` text
,`p2id` int(11)
,`p2name` varchar(100)
,`p2surname` text
,`c1id` int(11)
,`c1` varchar(45)
,`c2id` int(11)
,`c2` varchar(45)
,`groupid` int(11)
,`GROUP` varchar(45)
,`phaseid` int(11)
,`phase` varchar(45)
,`contestid` int(11)
,`contest` varchar(45)
,`played` int(11)
,`c1image` text
,`c2image` text
,`goalsd1` bigint(21)
,`goalsd2` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `phases`
--

CREATE TABLE `phases` (
  `phaseId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `contestId` int(11) DEFAULT NULL,
  `groupPhase` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `phases`
--

INSERT INTO `phases` (`phaseId`, `name`, `contestId`, `groupPhase`) VALUES
(1, 'Grupowa', 156, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `playerId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`playerId`, `name`, `surname`, `countryId`, `position`) VALUES
(1, 'Joe', 'Hart', 74, 0),
(2, 'Tom', 'Heaton', 74, 0),
(3, 'Jack', 'Butland', 74, 0),
(4, 'Garry', 'Cahill', 74, 1),
(5, 'John', 'Stones', 74, 1),
(6, 'Roby', 'Keane', 74, 1),
(7, 'Eric', 'Dier', 74, 1),
(8, 'Vinnie', 'Jones', 74, 1),
(9, 'Kyle', 'Walker', 74, 2),
(10, 'Nathaniel', 'Clyne', 74, 2),
(11, 'Danny', 'Rose', 74, 3),
(12, 'Ryan', 'Bertrand', 74, 3),
(13, 'Jordan', 'Henderson', 74, 4),
(14, 'Adam', 'Lallana', 74, 5),
(15, 'Jake', 'Livermore', 74, 5),
(16, 'Alex', 'Oxlade-Chamberlain', 74, 6),
(17, 'Jesse', 'Lingard', 74, 6),
(18, 'Marcus', 'Rashford', 74, 7),
(19, 'Dele', 'Alli', 74, 8),
(20, 'Harry', 'Kane', 74, 11),
(21, 'Danny', 'Welbeck', 74, 11),
(22, 'Jamie', 'Vardy', 74, 11),
(23, 'Rahem', 'Sterling', 74, 10),
(24, 'Sergio', 'Romero', 11, 0),
(25, 'Augustin', 'Marchesin', 11, 0),
(26, 'Jonathan', 'Guzman', 11, 0),
(27, 'German', 'Pazzella', 11, 1),
(28, 'Javier', 'Mascherano', 11, 1),
(29, 'Nicolas', 'Otamendi', 11, 1),
(30, 'Federico', 'Fazio', 11, 1),
(31, 'Matias', 'Kranevitter', 11, 4),
(32, 'Diego', 'Perez', 11, 5),
(33, 'Leonardo', 'Peredes', 11, 5),
(34, 'Emiliano', 'Rigoni', 11, 6),
(35, 'Eduardo', 'Salvio', 11, 6),
(36, 'Ever', 'Banega', 11, 8),
(37, 'Giovani', 'Lo Celso', 11, 8),
(38, 'Paulo', 'Dybala', 11, 8),
(39, 'Sergio', 'Aguero', 11, 11),
(40, 'Mario', 'Gomez', 11, 11),
(41, 'Dario', 'Benedetto', 11, 11),
(42, 'Mauro', 'Icardi', 11, 11),
(43, 'Diego', 'Perotti', 11, 10),
(44, 'Lionel', 'Messi', 11, 11),
(45, 'Angel', 'Di Marria', 11, 11),
(46, 'Francisco', 'Pavon', 11, 11),
(47, 'Thibaut', 'Courtois', 25, 0),
(48, 'Simon', 'Mignolet', 25, 0),
(49, 'Koen', 'Casteels', 25, 0),
(50, 'Vincent', 'Kompany', 25, 1),
(51, 'Jan', 'Vertonghen', 25, 1),
(52, 'Toby', 'Alderweireld', 25, 1),
(53, 'Thomas', 'Vermaelen', 25, 1),
(54, 'Thomas', 'Meunier', 25, 3),
(55, 'Leander', 'Dendoncker', 25, 4),
(56, 'Ousmane', 'Dembele', 25, 5),
(57, 'Axel', 'Witsel', 25, 5),
(58, 'Youri', 'Tielemans', 25, 5),
(59, 'Marouane', 'Fellaini', 25, 5),
(60, 'Steven', 'Defour', 25, 5),
(61, 'Yannick', 'Carrasco', 25, 7),
(62, 'Nacer', 'Chadli', 25, 7),
(63, 'Kevin', 'de Bruyne', 25, 8),
(64, 'Romelu', 'Lukaku', 25, 11),
(65, 'Christian', 'Benteke', 25, 11),
(66, 'Michy', 'Batshuayi', 25, 11),
(67, 'Dries', 'Mertens', 25, 11),
(68, 'Thorgan', 'Hazard', 25, 11),
(69, 'Eden', 'Hazard', 25, 10),
(70, 'Becker', 'Alisson', 35, 0),
(71, 'Moraes', 'Ederson', 35, 0),
(72, 'Norberto', 'Neto', 35, 0),
(73, 'Joao', 'Miranda', 35, 1),
(74, 'Marcos', 'Marquinhos', 35, 1),
(75, 'David', 'Silva', 35, 1),
(76, 'Carlos', 'Gil', 35, 1),
(77, 'Dani', 'Alves', 35, 2),
(78, 'Filipe', 'Luis', 35, 3),
(79, 'Vieira', 'Mercelo', 35, 3),
(80, 'Carlos', 'Casemiro', 35, 4),
(81, 'Fernando', 'Fernandinho', 35, 4),
(82, 'Jose', 'Paulinho', 35, 5),
(83, 'Renato', 'Augusto', 35, 5),
(84, 'Barcellos', 'Taison', 35, 7),
(85, 'Diego', 'Costa', 35, 7),
(86, 'Victor', 'Giuliano', 35, 8),
(87, 'Emboaba', 'Oscar', 35, 8),
(88, 'Gabriel', 'Jesus', 35, 11),
(89, 'Roberto', 'Firmino', 35, 11),
(90, '', 'Neymar', 35, 10),
(91, 'Philippe', 'Coutinho', 35, 10),
(92, '', 'Wilian', 35, 11),
(93, 'Hugo', 'Lloris', 84, 0),
(94, 'Steve', 'Mandanda', 84, 0),
(95, 'Benoit', 'Costil', 84, 0),
(96, 'Laurent', 'Koscielny', 84, 1),
(97, 'Samuel', 'Umtiti', 84, 1),
(98, 'Raphael', 'Varane', 84, 1),
(99, 'Presnel', 'Kimpembe', 84, 1),
(100, 'Djibril', 'Sidibe', 84, 2),
(101, 'Christophe', 'Jallet', 84, 2),
(102, 'Layvin', 'Kurzawa', 84, 3),
(103, 'Lucas', 'Digne', 84, 3),
(104, 'N\'Golo', 'Kanta', 84, 4),
(105, 'Blaise', 'Matuidi', 84, 4),
(106, 'Paul', 'Pogba', 84, 5),
(107, 'Corentin', 'Tolisso', 84, 5),
(108, 'Adrien', 'Rabiot', 84, 5),
(109, 'Kingsley', 'Coman', 84, 6),
(110, 'Thomas', 'Lemar', 84, 7),
(111, 'Antoine', 'Griezmann', 84, 11),
(112, 'Olivier', 'Giroud', 84, 11),
(113, 'Kylian', 'Mbappe', 84, 8),
(114, 'Alexandre', 'Lacazette', 84, 11),
(115, 'Dimitri', 'Payet', 84, 10),
(116, 'David', 'de Gea', 220, 0),
(117, 'Pepe', 'Reina', 220, 0),
(118, 'Kepa', 'Arrizabalage', 220, 0),
(119, 'Gerard', 'Pique', 220, 1),
(120, 'Sergio', 'Ramos', 220, 1),
(121, 'Roberto', 'Fernandez', 220, 1),
(122, 'Daniel', 'Carvajal', 220, 2),
(123, 'Jordi', 'Alba', 220, 3),
(124, 'Sergio', 'Busquets', 220, 4),
(125, 'Jorge', '\"\"\"Koke\"\" Merodio\"', 220, 5),
(126, 'Andres', 'Iniesta', 220, 5),
(127, 'Francisco', '\"\"\"Isco\"\" Suarez\"', 220, 5),
(128, 'Alcantara', 'Thiago', 220, 5),
(129, 'Asier', 'Illarramendi', 220, 5),
(130, 'Victor', '\"\"\"Vitolo\"\" Perez\"', 220, 7),
(131, 'David', 'Silva', 220, 8),
(132, 'Marco', 'Asensio', 220, 8),
(133, 'Alvaro', 'Morata', 220, 11),
(134, 'Moreno', 'Rodrigo', 220, 11),
(135, 'Luis', 'Alberto', 220, 11),
(136, 'Iago', 'Aspas', 220, 12),
(137, 'Jesus', '\"\"\"Suso\"\" Saez de la Torre\"', 220, 12),
(138, 'Jose', 'Callejon', 220, 12),
(139, 'Jasper', 'Cillessen', 163, 0),
(140, 'Jeroen', 'Zoet', 163, 0),
(141, 'Maarten', 'Stekelenburg', 163, 0),
(142, 'Nathan', 'Ake', 163, 1),
(143, 'Virgil', 'van Dijk', 163, 1),
(144, 'Stefan', 'de Vrij', 163, 1),
(145, 'Matthijs', 'de Ligt', 163, 1),
(146, 'Bruno', 'Martins Indi', 163, 1),
(147, 'Kenny', 'Tete', 163, 2),
(148, 'Joel', 'Veltman', 163, 2),
(149, 'Daley', 'Blind', 163, 3),
(150, 'Davy', 'Propper', 163, 5),
(151, 'Kevin', 'Strootman', 163, 5),
(152, 'Georginio', 'Wijnaldum', 163, 5),
(153, 'Tonny', 'Vilhena', 163, 5),
(154, 'Davy', 'Klaassen', 163, 5),
(155, 'Marco', 'van Ginkel', 163, 5),
(156, 'Quincy', 'Promes', 163, 6),
(157, 'Rayan', 'Babel', 163, 7),
(158, 'Bas', 'Dost', 163, 11),
(159, 'Vincent', 'Janssen', 163, 11),
(160, 'Robin', 'van Persie', 163, 11),
(161, 'Memphis', 'Depay', 163, 11),
(162, 'Manuel', 'Neuer', 90, 0),
(163, 'Marc Andre', 'ter Stegen', 90, 0),
(164, 'Bernd', 'Leno', 90, 0),
(165, 'Jerome', 'Boateng', 90, 1),
(166, 'Mats', 'Hummels', 90, 1),
(167, 'Niklas', 'Sule', 90, 1),
(168, 'Shkodran', 'Mustafi', 90, 1),
(169, 'Benedikt', 'Howedes', 90, 1),
(170, 'Jonathan', 'Tah', 90, 1),
(171, 'Joshua', 'Kimmich', 90, 2),
(172, 'Julian', 'Weigl', 90, 4),
(173, 'Jonas', 'Hector', 90, 4),
(174, 'Sami', 'Khadira', 90, 5),
(175, 'Toni', 'Kroos', 90, 5),
(176, 'Emre', 'Can', 90, 5),
(177, 'Karim', 'Bellarabi', 90, 6),
(178, 'Andre', 'Schurrle', 90, 7),
(179, 'Julian', 'Brandt', 90, 7),
(180, 'Mesut', 'Ozil', 90, 8),
(181, 'Max', 'Meyer', 90, 8),
(182, 'Mario', 'Gomez', 90, 11),
(183, 'Thomas', 'Muller', 90, 11),
(184, 'Julian', 'Draxler', 90, 10),
(185, 'Wojciech', 'Szczęsny', 191, 0),
(186, 'Łukasz', 'Fabiański', 191, 0),
(187, 'Łukasz', 'Skorupski', 191, 0),
(188, 'Kamil', 'Glik', 191, 1),
(189, 'Michał', 'Pazdan', 191, 1),
(190, 'Thiago', 'Cionek', 191, 1),
(191, 'Łukasz', 'Piszczek', 191, 2),
(192, 'Bartosz', 'Bereszyński', 191, 2),
(193, 'Artur', 'Jędrzejczyk', 191, 2),
(194, 'Tomasz', 'Kędziora', 191, 2),
(195, 'Maciej', 'Rybus', 191, 3),
(196, 'Grzegorz', 'Krychowiak', 191, 4),
(197, 'Krzysztof', 'Mączyński', 191, 4),
(198, 'Jacek', 'Góralski', 191, 4),
(199, 'Piotr', 'Zieliński', 191, 5),
(200, 'Rafał', 'Wolski', 191, 5),
(201, 'Jakub', 'Błaszczykowski', 191, 6),
(202, 'Rafał', 'Wolski', 191, 6),
(203, 'Damian', 'Kądzior', 191, 6),
(204, 'Kamil', 'Grosicki', 191, 7),
(205, 'Robert', 'Lewandowski', 191, 11),
(206, 'Łukasz', 'Teodorczyk', 191, 11),
(207, 'Paweł', 'Wszołek', 191, 11),
(208, 'Jaki', 'pan', 37, 0);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `reds`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `reds` (
`id` int(11)
,`matchId` int(11)
,`playerId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`countryId` int(11)
,`countryName` varchar(45)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

CREATE TABLE `sessions` (
  `sessionId` int(11) NOT NULL,
  `apiKey` text NOT NULL,
  `authKey` text NOT NULL,
  `expire` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `ip` text NOT NULL,
  `creationTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `sessions`
--

INSERT INTO `sessions` (`sessionId`, `apiKey`, `authKey`, `expire`, `userId`, `ip`, `creationTime`) VALUES
(98, '6ac244f16332887013d3b7b12b596547', 'cc51f5c0a12b789637efa9e6b59adaa7', '2019-10-01 17:21:29', 1, '192.168.0.24', '2019-10-01 17:06:29'),
(99, '45a6a9b20dad7069d9dd7e38f85c55f3', '9c7f64abc7e13f583e533597148167db', '2019-10-01 18:38:35', 1, '192.168.0.24', '2019-10-01 18:23:35'),
(100, '8b2265e819d7b7d5ca0f0b4cbae1ba8a', '26cd00494b4380e62f3c9620f7c029d9', '2019-10-01 18:54:25', 1, '192.168.0.24', '2019-10-01 18:39:25'),
(101, '15caba26b3d4ed5ee4e9e572eb7b1a25', '1359d09fa9fad4a263d1e704152e16f7', '2019-10-01 19:10:26', 1, '192.168.0.24', '2019-10-01 18:55:26'),
(102, 'e952b7865945f225983b55699380b7b6', 'a60dd89c0a19104bc9ef6059c217910b', '2019-10-01 19:25:39', 1, '192.168.0.24', '2019-10-01 19:10:39'),
(103, '46bffb7399581b4073d9cc1c135ef3a4', '950d38626190900c02a338e85ee6bc3b', '2019-09-17 19:57:08', 1, '192.168.0.24', '2019-10-01 19:42:08'),
(104, 'd36de1ba50730c7a745b6ad40a09d858', 'fd6d3c4d04e215a1b4955943f2c44972', '2019-10-02 15:29:00', 1, '192.168.0.24', '2019-10-02 15:09:11'),
(105, 'ba066453bd6871ce4dc001a7cc1242fb', '64280e1685d34e898e3b9414c7015bb0', '2019-10-02 15:29:19', 1, '192.168.0.24', '2019-10-02 15:29:00'),
(106, 'fc47fd31b273ac9a4b5f82039b671ec0', 'bd0a66117d26b8d0a6ec811c4ace794f', '2019-10-02 15:29:21', 1, '192.168.0.24', '2019-10-02 15:29:19'),
(107, '2ae28ca0d12a225eece6f9be62ccd3e7', 'eef3d08916c88cc921e9584b48a2c76a', '2019-10-02 15:44:21', 1, '192.168.0.24', '2019-10-02 15:29:21'),
(108, '4edcb30079cb307978ec4c195d8d9dda', 'c44dbf2837aaeb5d4564cade85285426', '2019-10-02 16:00:19', 1, '192.168.0.24', '2019-10-02 15:45:19'),
(109, '6ddc449a97448dc42463aaa6df78d05c', '3682972789ccafb46aa2a98b143322a5', '2019-10-02 16:15:58', 1, '192.168.0.24', '2019-10-02 16:00:58'),
(110, '1c1d1f426d56ef82eaf29f8a3d9f8846', '4926897382ddaafbd052353e366dd5a2', '2019-10-02 16:31:34', 1, '192.168.0.24', '2019-10-02 16:16:34'),
(111, '796f611944924c59481622e781d64d40', '74ab0340481f0f0382bce066230b550d', '2019-10-02 16:47:02', 1, '192.168.0.24', '2019-10-02 16:32:02');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `shooters`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `shooters` (
`playerId` int(11)
,`contestId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`country` varchar(45)
,`goals` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `shootKings`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `shootKings` (
`playerId` int(11)
,`contestId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`country` varchar(45)
,`goals` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stadiums`
--

CREATE TABLE `stadiums` (
  `stadiumID` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `adress` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `icon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stadiums`
--

INSERT INTO `stadiums` (`stadiumID`, `name`, `adress`, `issueDate`, `icon`) VALUES
(7, 'Marsa', 'Marsa 124', '1936-12-05', 0),
(9, 'Halinów', 'Warszawska', '2019-08-22', 34);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statistics`
--

CREATE TABLE `statistics` (
  `statisticId` int(11) NOT NULL,
  `type` varchar(4) COLLATE utf8_polish_ci DEFAULT NULL,
  `matchId` int(11) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `login` text NOT NULL,
  `firstName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `lastName` text CHARACTER SET utf8 COLLATE utf8_polish_ci,
  `password` text NOT NULL,
  `type` int(11) NOT NULL,
  `email` text NOT NULL,
  `lastLogin` datetime NOT NULL,
  `creationTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`userId`, `login`, `firstName`, `lastName`, `password`, `type`, `email`, `lastLogin`, `creationTime`) VALUES
(1, 'kubwlo', 'Kuba', 'Włodarczyk', '66c959aef7d3ba2168aaa6d044e4ee3d', 0, 'kubw19@gmail.com', '2019-10-02 16:32:02', '2019-09-08 09:10:10'),
(2, 'szyga', 'Stanisław', 'Zyga', '', 3, '', '2019-09-09 00:00:00', '2019-09-09 00:00:00'),
(3, 'mikus12345', 'Mikołaj', 'Wysocki', '', 3, '', '2019-09-09 00:00:00', '2019-09-09 00:00:00'),
(5, 'kazruks98', 'Janek', 'Skurzak', '', 3, '', '2019-09-10 00:00:00', '2019-09-12 00:00:00');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `yellows`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `yellows` (
`id` int(11)
,`matchId` int(11)
,`playerId` int(11)
,`name` varchar(45)
,`surname` varchar(45)
,`countryId` int(11)
,`countryName` varchar(45)
);

-- --------------------------------------------------------

--
-- Struktura widoku `contestsUsersView`
--
DROP TABLE IF EXISTS `contestsUsersView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `contestsUsersView`  AS  select `contestsUsers`.`contestsUsersId` AS `contestsUsersId`,`contestsUsers`.`relation` AS `relation`,`contestsUsers`.`contestId` AS `contestId`,`users`.`userId` AS `userId`,`users`.`login` AS `login`,`users`.`firstName` AS `firstName`,`users`.`lastName` AS `lastName`,`users`.`email` AS `email` from (`contestsUsers` join `users` on((`contestsUsers`.`userId` = `users`.`userId`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `countryGroup`
--
DROP TABLE IF EXISTS `countryGroup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `countryGroup`  AS  select `mt`.`c1` AS `country`,`mt`.`c1id` AS `cId`,`mt`.`GROUP` AS `group`,`mt`.`groupid` AS `groupId`,`mt`.`phaseid` AS `phaseId` from `matchesTable` `mt` union select `mt`.`c2` AS `country`,`mt`.`c2id` AS `cId`,`mt`.`GROUP` AS `group`,`mt`.`groupid` AS `groupId`,`mt`.`phaseid` AS `phaseId` from `matchesTable` `mt` ;

-- --------------------------------------------------------

--
-- Struktura widoku `goals`
--
DROP TABLE IF EXISTS `goals`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `goals`  AS  select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName`,`gr`.`groupId` AS `groupId`,`gr`.`name` AS `groupName` from ((((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) join `groups` `gr` on((`gr`.`groupId` = `m`.`groupId`))) where (`s`.`type` = 'GOAL') ;

-- --------------------------------------------------------

--
-- Struktura widoku `groupData`
--
DROP TABLE IF EXISTS `groupData`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `groupData`  AS  select `gdb`.`country` AS `country`,`gdb`.`cid` AS `cid`,`gdb`.`group` AS `group`,`gdb`.`groupId` AS `groupId`,`gdb`.`phaseId` AS `phaseId`,`gdb`.`M` AS `M`,`gdb`.`W` AS `W`,`gdb`.`P` AS `P`,`gdb`.`R` AS `R`,`gdb`.`BP` AS `BP`,`gdb`.`BM` AS `BM`,`gdb`.`Bilans` AS `Bilans`,((`gdb`.`W` * 3) + `gdb`.`R`) AS `Points` from `groupdataBase` `gdb` ;

-- --------------------------------------------------------

--
-- Struktura widoku `groupdataBase`
--
DROP TABLE IF EXISTS `groupdataBase`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `groupdataBase`  AS  select `c`.`country` AS `country`,`c`.`cId` AS `cid`,`c`.`group` AS `group`,`c`.`groupId` AS `groupId`,`c`.`phaseId` AS `phaseId`,(select count(0) from `matches` `m` where ((`m`.`groupId` = `c`.`groupId`) and ((`m`.`t1` = `c`.`cId`) or (`m`.`t2` = `c`.`cId`)))) AS `M`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1id` = `c`.`cId`) and (`matchesTable`.`goalsd1` > `matchesTable`.`goalsd2`)) or ((`matchesTable`.`c2id` = `c`.`cId`) and (`matchesTable`.`goalsd2` > `matchesTable`.`goalsd1`))) and (`matchesTable`.`groupid` = `c`.`groupId`))) AS `W`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1id` = `c`.`cId`) and (`matchesTable`.`goalsd1` < `matchesTable`.`goalsd2`)) or ((`matchesTable`.`c2id` = `c`.`cId`) and (`matchesTable`.`goalsd2` < `matchesTable`.`goalsd1`))) and (`matchesTable`.`groupid` = `c`.`groupId`))) AS `P`,(select count(0) from `matchesTable` where ((((`matchesTable`.`c1id` = `c`.`cId`) and (`matchesTable`.`goalsd1` = `matchesTable`.`goalsd2`)) or ((`matchesTable`.`c2id` = `c`.`cId`) and (`matchesTable`.`goalsd2` = `matchesTable`.`goalsd1`))) and (`matchesTable`.`groupid` = `c`.`groupId`) and (`matchesTable`.`played` = 1))) AS `R`,(select count(0) from `goals` where ((`goals`.`countryId` = `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) AS `BP`,(select count(0) from (`goals` join `matches` `m2` on((`m2`.`matchId` = `goals`.`matchId`))) where (((`m2`.`t1` = `c`.`cId`) or (`m2`.`t2` = `c`.`cId`)) and (`goals`.`countryId` <> `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) AS `BM`,((select count(0) from `goals` where ((`goals`.`countryId` = `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`))) - (select count(0) from (`goals` join `matches` `m2` on((`m2`.`matchId` = `goals`.`matchId`))) where (((`m2`.`t1` = `c`.`cId`) or (`m2`.`t2` = `c`.`cId`)) and (`goals`.`countryId` <> `c`.`cId`) and (`goals`.`groupId` = `c`.`groupId`)))) AS `Bilans` from `countryGroup` `c` ;

-- --------------------------------------------------------

--
-- Struktura widoku `injuries`
--
DROP TABLE IF EXISTS `injuries`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `injuries`  AS  select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'INJ') ;

-- --------------------------------------------------------

--
-- Struktura widoku `matchesTable`
--
DROP TABLE IF EXISTS `matchesTable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `matchesTable`  AS  select `m`.`matchId` AS `matchid`,`p1`.`humanPlayerId` AS `p1id`,`u1`.`firstName` AS `p1name`,`u1`.`lastName` AS `p1surname`,`p2`.`humanPlayerId` AS `p2id`,`u2`.`firstName` AS `p2name`,`u2`.`lastName` AS `p2surname`,`c1`.`countryId` AS `c1id`,`c1`.`name` AS `c1`,`c2`.`countryId` AS `c2id`,`c2`.`name` AS `c2`,`g`.`groupId` AS `groupid`,`g`.`name` AS `GROUP`,`ph`.`phaseId` AS `phaseid`,`ph`.`name` AS `phase`,`co`.`contestId` AS `contestid`,`co`.`name` AS `contest`,`m`.`played` AS `played`,`c1`.`image_round` AS `c1image`,`c2`.`image_round` AS `c2image`,(select count(0) from `goals` where ((`goals`.`countryId` = `c1`.`countryId`) and (`goals`.`matchId` = `m`.`matchId`))) AS `goalsd1`,(select count(0) from `goals` where ((`goals`.`countryId` = `c2`.`countryId`) and (`goals`.`matchId` = `m`.`matchId`))) AS `goalsd2` from (((((((((`matches` `m` join `humanPlayers` `p1` on((`m`.`p1` = `p1`.`humanPlayerId`))) join `humanPlayers` `p2` on((`m`.`p2` = `p2`.`humanPlayerId`))) join `countries` `c1` on((`m`.`t1` = `c1`.`countryId`))) join `countries` `c2` on((`m`.`t2` = `c2`.`countryId`))) join `groups` `g` on((`m`.`groupId` = `g`.`groupId`))) join `phases` `ph` on((`g`.`phaseId` = `ph`.`phaseId`))) join `contests` `co` on((`ph`.`contestId` = `co`.`contestId`))) join `users` `u1` on((`u1`.`userId` = `p1`.`userId`))) join `users` `u2` on((`u2`.`userId` = `p2`.`userId`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `reds`
--
DROP TABLE IF EXISTS `reds`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reds`  AS  select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'RED') ;

-- --------------------------------------------------------

--
-- Struktura widoku `shooters`
--
DROP TABLE IF EXISTS `shooters`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shooters`  AS  select `pil`.`playerId` AS `playerId`,`con`.`contestId` AS `contestId`,`pil`.`name` AS `name`,`pil`.`surname` AS `surname`,`c`.`name` AS `country`,count(0) AS `goals` from (((((((`statistics` `s` join `players` `pil` on((`s`.`playerId` = `pil`.`playerId`))) join `countries` `cou` on((`pil`.`countryId` = `cou`.`countryId`))) join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `groups` `gr` on((`m`.`groupId` = `gr`.`groupId`))) join `phases` `ph` on((`ph`.`phaseId` = `gr`.`phaseId`))) join `contests` `con` on((`con`.`contestId` = `ph`.`contestId`))) join `countries` `c` on((`c`.`countryId` = `pil`.`countryId`))) where (`s`.`type` = 'GOAL') group by `pil`.`playerId`,`con`.`contestId` ;

-- --------------------------------------------------------

--
-- Struktura widoku `shootKings`
--
DROP TABLE IF EXISTS `shootKings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shootKings`  AS  select `s`.`playerId` AS `playerId`,`s`.`contestId` AS `contestId`,`s`.`name` AS `name`,`s`.`surname` AS `surname`,`s`.`country` AS `country`,`s`.`goals` AS `goals` from `shooters` `s` where (`s`.`goals` = (select max(`shooters`.`goals`) from `shooters` where (`shooters`.`contestId` = `s`.`contestId`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `yellows`
--
DROP TABLE IF EXISTS `yellows`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `yellows`  AS  select `s`.`statisticId` AS `id`,`m`.`matchId` AS `matchId`,`p`.`playerId` AS `playerId`,`p`.`name` AS `name`,`p`.`surname` AS `surname`,`c`.`countryId` AS `countryId`,`c`.`name` AS `countryName` from (((`statistics` `s` join `matches` `m` on((`s`.`matchId` = `m`.`matchId`))) join `players` `p` on((`s`.`playerId` = `p`.`playerId`))) join `countries` `c` on((`p`.`countryId` = `c`.`countryId`))) where (`s`.`type` = 'YEL') ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`contestId`),
  ADD KEY `fk_contest_stadium` (`stadiumId`);

--
-- Indeksy dla tabeli `contestsUsers`
--
ALTER TABLE `contestsUsers`
  ADD PRIMARY KEY (`contestsUsersId`);

--
-- Indeksy dla tabeli `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryId`);

--
-- Indeksy dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupId`),
  ADD KEY `fk_group_phase` (`phaseId`);

--
-- Indeksy dla tabeli `humanPlayers`
--
ALTER TABLE `humanPlayers`
  ADD PRIMARY KEY (`humanPlayerId`),
  ADD KEY `fk_humanPlayer_country` (`countryId`),
  ADD KEY `fk_humanPlayers_users` (`userId`);

--
-- Indeksy dla tabeli `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`matchId`),
  ADD KEY `fk_t1_countries` (`t1`),
  ADD KEY `fk_t2_countries` (`t2`),
  ADD KEY `fk_p1_countries` (`p1`),
  ADD KEY `fk_p2_countries` (`p2`),
  ADD KEY `fk_matches_group` (`groupId`);

--
-- Indeksy dla tabeli `phases`
--
ALTER TABLE `phases`
  ADD PRIMARY KEY (`phaseId`),
  ADD KEY `fk_phase_contest` (`contestId`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`playerId`),
  ADD KEY `fk_players_countries` (`countryId`);

--
-- Indeksy dla tabeli `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`);

--
-- Indeksy dla tabeli `stadiums`
--
ALTER TABLE `stadiums`
  ADD PRIMARY KEY (`stadiumID`);

--
-- Indeksy dla tabeli `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`statisticId`),
  ADD KEY `fk_statistics_player` (`playerId`),
  ADD KEY `fk_statistic_match` (`matchId`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `contests`
--
ALTER TABLE `contests`
  MODIFY `contestId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT dla tabeli `contestsUsers`
--
ALTER TABLE `contestsUsers`
  MODIFY `contestsUsersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `countries`
--
ALTER TABLE `countries`
  MODIFY `countryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `humanPlayers`
--
ALTER TABLE `humanPlayers`
  MODIFY `humanPlayerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `matches`
--
ALTER TABLE `matches`
  MODIFY `matchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `phases`
--
ALTER TABLE `phases`
  MODIFY `phaseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `playerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT dla tabeli `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT dla tabeli `stadiums`
--
ALTER TABLE `stadiums`
  MODIFY `stadiumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `statistics`
--
ALTER TABLE `statistics`
  MODIFY `statisticId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `contests`
--
ALTER TABLE `contests`
  ADD CONSTRAINT `fk_contest_stadium` FOREIGN KEY (`stadiumId`) REFERENCES `stadiums` (`stadiumID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `fk_group_phase` FOREIGN KEY (`phaseId`) REFERENCES `phases` (`phaseId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `humanPlayers`
--
ALTER TABLE `humanPlayers`
  ADD CONSTRAINT `fk_humanPlayers_users` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `fk_matches_group` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p1_countries` FOREIGN KEY (`p1`) REFERENCES `humanPlayers` (`humanPlayerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p2_countries` FOREIGN KEY (`p2`) REFERENCES `humanPlayers` (`humanPlayerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t1_countries` FOREIGN KEY (`t1`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t2_countries` FOREIGN KEY (`t2`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `phases`
--
ALTER TABLE `phases`
  ADD CONSTRAINT `fk_phase_contest` FOREIGN KEY (`contestId`) REFERENCES `contests` (`contestId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_players_countries` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `fk_statistic_match` FOREIGN KEY (`matchId`) REFERENCES `matches` (`matchId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_statistics_player` FOREIGN KEY (`playerId`) REFERENCES `players` (`playerId`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
