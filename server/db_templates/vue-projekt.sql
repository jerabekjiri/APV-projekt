-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 05. čen 2018, 17:06
-- Verze serveru: 10.1.16-MariaDB
-- Verze PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `vue-projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `contact` varchar(200) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `contacts`
--

INSERT INTO `contacts` (`contact_id`, `user_id`, `contact_type_id`, `contact`) VALUES
(1, 10, 1, '123 456 789'),
(2, 10, 2, 'test@test.test'),
(3, 10, 3, 'Pekelna Brambora'),
(4, 3, 1, 'chleba');

-- --------------------------------------------------------

--
-- Struktura tabulky `contact_type`
--

CREATE TABLE `contact_type` (
  `contact_type_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `contact_type`
--

INSERT INTO `contact_type` (`contact_type_id`, `name`, `icon`) VALUES
(1, 'Mobile', 'phone'),
(2, 'Email', 'email'),
(3, 'Skype', 'message'),
(4, 'ICQ', 'message');

-- --------------------------------------------------------

--
-- Struktura tabulky `discussion`
--

CREATE TABLE `discussion` (
  `discussion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `meetup_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_czech_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `discussion`
--

INSERT INTO `discussion` (`discussion_id`, `user_id`, `meetup_id`, `comment`, `date`) VALUES
(22, 10, 1, 'test komentář', 1524479779),
(23, 10, 2, 'hsdhshsh', 1528209681),
(24, 10, 2, 'sagasgasgsag', 1528209686);

-- --------------------------------------------------------

--
-- Struktura tabulky `joined_meetups`
--

CREATE TABLE `joined_meetups` (
  `joined_id` int(11) NOT NULL,
  `meetup_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `joined_meetups`
--

INSERT INTO `joined_meetups` (`joined_id`, `meetup_id`, `user_id`) VALUES
(133, 2, 10),
(134, 21, 10),
(135, 1, 1),
(136, 1, 10),
(137, 23, 10),
(138, 23, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `meetups`
--

CREATE TABLE `meetups` (
  `meetup_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `location` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `img` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `date` int(11) NOT NULL,
  `information` text COLLATE utf8_czech_ci NOT NULL,
  `url` varchar(120) COLLATE utf8_czech_ci NOT NULL,
  `published` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `meetups`
--

INSERT INTO `meetups` (`meetup_id`, `title`, `location`, `img`, `date`, `information`, `url`, `published`, `author_id`) VALUES
(1, 'Test', 'Brno', 'background1.jpg', 1527738900, 'informace budou zobrazovany zde', 'go-lang-brno', 0, 10),
(2, 'test', 'Slavkov u Brnaěč', 'background2.jpg', 1527738600, 'test', 'test', 0, 10),
(21, 'TZI zkouška', 'Mendelova univerzita, Brno', '', 1527228000, 'zkouška z předmětu TZI', 'tzi-zkouska', 0, 10),
(22, 'oss', 'oss', '', 1529993000, 'oss', 'oss', 0, 10),
(23, 's', 's', '', 1529679600, 's', 's', 0, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `relations`
--

CREATE TABLE `relations` (
  `relation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `relations`
--

INSERT INTO `relations` (`relation_id`, `user_id`, `user2_id`, `description`) VALUES
(2, 10, 2, ''),
(5, 10, 1, '');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_czech_ci NOT NULL,
  `avatar` varchar(150) COLLATE utf8_czech_ci NOT NULL,
  `information` text COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_czech_ci NOT NULL,
  `href` varchar(100) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `avatar`, `information`, `password`, `href`) VALUES
(1, 'Jiří Jeřábek', 'jiri-jerabek@mail.cz', 'CCme.jpg', 'Ahoj, jsem Jirka', '$2y$10$k3DfVT.owhl1QBb/vhhTauyOMLrLBydn1b2tm4QYPSY0k1lLZonZi', 'jiri-jerabek'),
(2, 'David Krček', 'david-krcek@mail.cz', '', 'Ahoj, jsem David', '$2y$10$YanSPyP1SSKOQjB4GSB04.mlJKvDchyicobfCaM3VIdKf2jFLiOcK', 'david-krcek'),
(10, 'test', 'test@test.test', 'CCme.jpg', '', '$2y$10$4pt8IgGmqyDg1uJ281n.Pew.FjMH5FzO0a9J.qIBKFQ8r3n5h59Se', 'test');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Klíče pro tabulku `contact_type`
--
ALTER TABLE `contact_type`
  ADD PRIMARY KEY (`contact_type_id`);

--
-- Klíče pro tabulku `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`discussion_id`);

--
-- Klíče pro tabulku `joined_meetups`
--
ALTER TABLE `joined_meetups`
  ADD PRIMARY KEY (`joined_id`);

--
-- Klíče pro tabulku `meetups`
--
ALTER TABLE `meetups`
  ADD PRIMARY KEY (`meetup_id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Klíče pro tabulku `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`relation_id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `contact_type`
--
ALTER TABLE `contact_type`
  MODIFY `contact_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pro tabulku `discussion`
--
ALTER TABLE `discussion`
  MODIFY `discussion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pro tabulku `joined_meetups`
--
ALTER TABLE `joined_meetups`
  MODIFY `joined_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT pro tabulku `meetups`
--
ALTER TABLE `meetups`
  MODIFY `meetup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pro tabulku `relations`
--
ALTER TABLE `relations`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
