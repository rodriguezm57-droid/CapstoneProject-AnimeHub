-- phpMyAdmin SQL Dump
-- version 5.2.2deb1+deb13u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2026 at 10:57 PM
-- Server version: 11.8.6-MariaDB-0+deb13u1 from Debian
-- PHP Version: 8.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AnimeHub`
--

-- --------------------------------------------------------

--
-- Table structure for table `Anime`
--

CREATE TABLE `Anime` (
  `Anime_id` int(11) NOT NULL,
  `Anime_title` varchar(300) NOT NULL,
  `Description` text DEFAULT NULL,
  `Release_year` year(4) NOT NULL,
  `episode_count` int(11) NOT NULL,
  `anime_type` varchar(255) NOT NULL,
  `studio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Anime`
--

INSERT INTO `Anime` (`Anime_id`, `Anime_title`, `Description`, `Release_year`, `episode_count`, `anime_type`, `studio_id`) VALUES
(3, 'Naruto', 'Naruto Uzumaki, a spirited, optimistic orphan ninja from the Hidden Leaf Village (Konohagakure) who dreams of becoming the Hokage, the leader and strongest ninja of his village', '2002', 220, 'TV', 1),
(28, 'Dragon Ball Z', 'Goku and his allies defend Earth against powerful enemies while discovering new levels of strength.', '1989', 291, 'TV', 2),
(29, 'One Piece', 'Monkey D. Luffy and his pirate crew travel across the seas in search of the legendary treasure known as One Piece.', '1999', 1180, 'TV', 3),
(30, 'Darling in the Franxx', 'In a dystopian future, young pilots known as parasites operate giant mechs to defend humanity against mysterious creatures.', '2018', 24, 'TV', 4),
(31, 'Code Geass: Lelouch of the Rebellion', 'Lelouch vi Britannia gains a mysterious power called Geass and leads a rebellion against the Holy Britannian Empire.', '2006', 25, 'TV', 5),
(32, 'Steins;Gate', 'A group of friends accidentally discovers a way to send messages to the past, leading to dangerous consequences involving time travel.', '2011', 24, 'TV', 6),
(33, 'My Hero Academia', 'In a world where most people possess superpowers called Quirks, Izuku Midoriya works toward becoming a professional hero.', '2016', 159, 'TV', 7),
(34, 'Hajime no Ippo', 'Ippo Makunouchi discovers boxing and begins a journey to become a stronger fighter and understand what it means to be strong.', '2000', 75, 'TV', 8),
(35, 'Tokyo Revengers', 'Takemichi Hanagaki discovers he can travel into the past and attempts to prevent tragedies involving a Tokyo delinquent gang.', '2021', 50, 'TV', 9),
(36, 'Slam Dunk', 'Hanamichi Sakuragi joins his high school basketball team and gradually develops a passion for the sport.', '1993', 101, 'TV', 10),
(37, 'Re:Zero - Starting Life in Another World', 'Subaru Natsuki is transported to another world and discovers that he can return to an earlier point in time after dying.', '2016', 66, 'TV', 10),
(38, 'Initial D', 'Takumi Fujiwara becomes involved in the underground street-racing scene while driving his fathers Toyota AE86.', '1998', 26, 'TV', 11),
(39, 'Berserk', 'Guts, a skilled mercenary, struggles to survive in a brutal medieval world filled with betrayal, war, and supernatural horrors.', '1997', 25, 'TV', 12),
(40, 'Sword Art Online', 'Players become trapped inside a virtual reality MMORPG and must survive its deadly challenges to escape.', '2012', 96, 'TV', 13),
(41, 'Bleach', 'Ichigo Kurosaki gains the powers of a Soul Reaper and protects humans from evil spirits while confronting supernatural threats.', '2004', 366, 'TV', 14),
(42, 'Cyberpunk: Edgerunners', 'In the futuristic city of Night City, David Martinez becomes a mercenary known as an edgerunner while navigating violence and corporate power.', '2022', 10, 'TV', 15),
(43, 'Magi: The Labyrinth of Magic', 'Aladdin, Alibaba, and their companions explore mysterious dungeons and become involved in conflicts involving magic and kingdoms.', '2012', 25, 'TV', 16),
(44, 'Violet Evergarden', 'Violet Evergarden, a former soldier, becomes a letter writer and learns about human emotions while helping others express their feelings.', '2018', 13, 'TV', 17),
(45, 'Frieren: Beyond Journeys End', 'After the defeat of the Demon King, the elf mage Frieren reflects on the passage of time and begins a journey to better understand humanity.', '2023', 38, 'TV', 18),
(46, 'Attack on Titan', 'Humanity fights for survival behind enormous walls while defending itself against giant humanoid creatures known as Titans.', '2013', 89, 'TV', 19),
(47, 'Jujutsu Kaisen', 'Yuji Itadori becomes involved in the world of jujutsu sorcerers after consuming a powerful cursed object.', '2020', 59, 'TV', 20),
(48, 'Fullmetal Alchemist: Brotherhood', 'Brothers Edward and Alphonse Elric search for the Philosophers Stone after a failed alchemical experiment costs them parts of their bodies.', '2009', 64, 'TV', 21),
(49, 'Fire Force', 'Shinra Kusakabe joins a special firefighting company tasked with combating spontaneous human combustion and investigating its mysterious origins.', '2019', 48, 'TV', 22),
(50, 'Hunter x Hunter (2011)', 'Gon Freecss becomes a Hunter and embarks on dangerous adventures while searching for his father and developing his abilities.', '2011', 148, 'TV', 23),
(51, 'Death Note', 'Light Yagami discovers a supernatural notebook that allows him to kill anyone whose name he writes in it, leading to a battle of intelligence with detective L.', '2006', 37, 'TV', 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Anime`
--
ALTER TABLE `Anime`
  ADD PRIMARY KEY (`Anime_id`),
  ADD KEY `studio_id` (`studio_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Anime`
--
ALTER TABLE `Anime`
  MODIFY `Anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Anime`
--
ALTER TABLE `Anime`
  ADD CONSTRAINT `Anime_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `Studios` (`Studio_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
