-- phpMyAdmin SQL Dump
-- version 5.2.2deb1+deb13u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 28, 2026 at 11:06 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `Anime_Genres`
--

CREATE TABLE `Anime_Genres` (
  `anime_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Anime_Genres`
--

INSERT INTO `Anime_Genres` (`anime_id`, `genre_id`) VALUES
(3, 1),
(3, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(33, 2),
(35, 2),
(37, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(3, 3),
(28, 3),
(29, 3),
(33, 3),
(37, 3),
(39, 3),
(40, 3),
(41, 3),
(43, 3),
(45, 3),
(48, 3),
(50, 3),
(3, 4),
(28, 4),
(29, 4),
(33, 4),
(37, 4),
(39, 4),
(40, 4),
(41, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(50, 4),
(30, 5),
(31, 5),
(32, 5),
(40, 5),
(42, 5),
(49, 5),
(30, 6),
(32, 6),
(34, 6),
(35, 6),
(36, 6),
(38, 6),
(42, 6),
(44, 6),
(45, 6),
(48, 6),
(29, 7),
(34, 7),
(36, 7),
(30, 8),
(40, 8),
(31, 9),
(32, 9),
(35, 9),
(37, 9),
(51, 9),
(32, 10),
(46, 10),
(49, 10),
(51, 10),
(32, 11),
(51, 11),
(34, 12),
(36, 12),
(38, 12),
(3, 13),
(28, 13),
(34, 13),
(50, 13),
(30, 14),
(31, 14),
(31, 15),
(46, 15),
(48, 15),
(41, 16),
(47, 16),
(49, 16),
(51, 16),
(39, 17),
(47, 17),
(35, 19),
(51, 19),
(42, 20),
(33, 21),
(36, 21),
(38, 21),
(44, 21),
(39, 23),
(42, 23),
(35, 24),
(46, 24);

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `Genre_id` int(11) NOT NULL,
  `genre_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`Genre_id`, `genre_name`, `description`) VALUES
(1, 'Shonen', 'a demographic category of Japanese comics and animation that traditionally targets adolescent boys roughly between the ages of 12 and 18'),
(2, 'Action', 'Anime featuring physical combat, battles, intense confrontations, and high-stakes challenges.'),
(3, 'Adventure', 'Anime centered on exploration, journeys, quests, and discovering new places.'),
(4, 'Fantasy', 'Anime featuring magic, supernatural worlds, mythical creatures, or extraordinary abilities.'),
(5, 'Science Fiction', 'Anime exploring advanced technology, futuristic settings, scientific concepts, or alternate realities.'),
(6, 'Drama', 'Anime focusing on emotional conflicts, character development, and serious life experiences.'),
(7, 'Comedy', 'Anime featuring humor, funny situations, and comedic characters.'),
(8, 'Romance', 'Anime focusing on romantic relationships and emotional connections.'),
(9, 'Thriller', 'Anime featuring suspense, tension, danger, and unpredictable developments.'),
(10, 'Mystery', 'Anime centered on unexplained events, investigations, secrets, or solving puzzles.'),
(11, 'Psychological', 'Anime exploring human behavior, mental conflict, manipulation, and complex decision-making.'),
(12, 'Sports', 'Anime centered on athletic competition, training, teamwork, and sporting achievements.'),
(13, 'Martial Arts', 'Anime emphasizing hand-to-hand combat, fighting techniques, and martial arts competitions.'),
(14, 'Mecha', 'Anime featuring giant robots, mechanical suits, or advanced combat machines.'),
(15, 'Military', 'Anime involving armed forces, warfare, military strategy, or organized combat.'),
(16, 'Supernatural', 'Anime involving paranormal events, spirits, curses, or supernatural powers.'),
(17, 'Horror', 'Anime designed to create fear or unease through disturbing events, creatures, or situations.'),
(18, 'Historical', 'Anime set in a historical period or featuring historical influences.'),
(19, 'Crime', 'Anime involving criminal organizations, illegal activities, investigations, or underworld conflicts.'),
(20, 'Cyberpunk', 'Anime featuring advanced technology, cybernetics, dystopian societies, and corporate power.'),
(21, 'Coming of Age', 'Anime following characters as they mature, develop their identities, and face personal challenges.'),
(22, 'Slice of Life', 'Anime depicting everyday experiences, relationships, and ordinary life.'),
(23, 'Tragedy', 'Anime featuring devastating events, loss, suffering, or tragic character arcs.'),
(24, 'Post-Apocalyptic', 'Anime set after a civilization-ending catastrophe or societal collapse.'),
(25, 'Time Travel', 'Anime involving travel through time, altered timelines, or attempts to change past events.'),
(26, 'Isekai', 'Anime in which characters are transported, reincarnated, or trapped in another world.'),
(27, 'Dystopian', 'Anime set in oppressive, controlled, or deeply flawed societies.'),
(28, 'Music', 'Anime incorporating music, musical performances, or musicians as central themes.');

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `review_text` varchar(255) NOT NULL,
  `review_date` date NOT NULL,
  `last_updated` date NOT NULL
) ;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`review_id`, `user_id`, `anime_id`, `rating`, `review_text`, `review_date`, `last_updated`) VALUES
(1, 1, 3, 8.9, 'Naruto has an excellent story and great character development.', '2026-07-26', '2026-10-26'),
(2, 2, 28, 9.2, 'Dragon Ball Z has incredible battles, memorable characters, and iconic transformations.', '2026-06-05', '2026-06-05'),
(3, 3, 29, 9.8, 'One Piece has excellent world building, emotional storytelling, and unforgettable adventures.', '2026-06-10', '2026-06-10'),
(4, 4, 30, 8.2, 'Darling in the Franxx combines mecha action with romance and emotional character development.', '2026-06-15', '2026-06-15'),
(5, 5, 31, 9.4, 'Code Geass has strategic battles, political conflicts, and an outstanding main character.', '2026-06-20', '2026-06-20'),
(6, 6, 32, 9.7, 'Steins;Gate tells a suspenseful time travel story with excellent character development.', '2026-06-25', '2026-06-25'),
(7, 7, 33, 6.4, 'My Hero Academia features exciting superhero battles and an inspiring journey toward becoming a hero.', '2026-07-01', '2026-07-01'),
(8, 8, 34, 9.1, 'Hajime no Ippo is a great boxing anime with realistic training and exciting matches.', '2026-07-05', '2026-07-05'),
(9, 9, 35, 8.6, 'Tokyo Revengers combines time travel, gang conflicts, friendship, and suspense.', '2026-07-10', '2026-07-10'),
(10, 10, 36, 9, 'Slam Dunk captures the excitement of basketball through humor, competition, and character growth.', '2026-07-15', '2026-07-15'),
(11, 1, 37, 9.2, 'Re:Zero delivers dark fantasy, psychological tension, and meaningful character development.', '2026-07-16', '2026-07-16'),
(12, 2, 38, 8.9, 'Initial D features thrilling street racing, memorable rivalries, and an excellent soundtrack.', '2026-07-17', '2026-07-17'),
(13, 3, 39, 9.3, 'Berserk explores dark fantasy through complex characters, tragedy, and overwhelming adversity.', '2026-07-18', '2026-07-18'),
(14, 4, 40, 8.4, 'Sword Art Online explores virtual reality, survival, and relationships through exciting action.', '2026-07-19', '2026-07-19'),
(15, 5, 41, 9, 'Bleach has stylish sword fights, memorable characters, and an engaging supernatural world.', '2026-07-20', '2026-07-20'),
(16, 6, 42, 9.1, 'Cyberpunk: Edgerunners delivers intense action, impressive animation, and an emotional story.', '2026-07-21', '2026-07-21'),
(17, 7, 43, 8.5, 'Magi combines magical adventures, dangerous dungeons, and interesting political conflicts.', '2026-07-22', '2026-07-22'),
(18, 8, 44, 9.6, 'Violet Evergarden is an emotional story about healing, communication, and understanding others.', '2026-07-23', '2026-07-23'),
(19, 9, 45, 9.7, 'Frieren explores friendship, time, and the meaning of life through thoughtful storytelling.', '2026-07-24', '2026-07-24'),
(20, 10, 46, 9.5, 'Attack on Titan features intense battles, shocking revelations, and complex political conflicts.', '2026-07-25', '2026-07-25'),
(21, 1, 47, 9, 'Jujutsu Kaisen combines excellent animation, supernatural abilities, and exciting battles.', '2026-07-26', '2026-07-26'),
(22, 2, 48, 9.8, 'Fullmetal Alchemist: Brotherhood delivers outstanding storytelling and meaningful themes about sacrifice and responsibility.', '2026-07-27', '2026-07-27'),
(23, 3, 49, 7, 'Fire Force features impressive animation, creative fire abilities, and an intriguing mystery.', '2026-07-28', '2026-07-28'),
(24, 4, 50, 9.6, 'Hunter x Hunter offers excellent world building, strategic battles, and complex characters.', '2026-07-29', '2026-07-29'),
(25, 5, 51, 9.4, 'Death Note is a psychological thriller with clever mind games and moral dilemmas.', '2026-07-30', '2026-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `Studios`
--

CREATE TABLE `Studios` (
  `Studio_id` int(11) NOT NULL,
  `Studio_name` varchar(255) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `founded_year` year(4) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Studios`
--

INSERT INTO `Studios` (`Studio_id`, `Studio_name`, `Country`, `founded_year`, `website`) VALUES
(1, 'Studio Pierrot', 'Japan', '1979', 'https://en.pierrot.jp/'),
(2, 'Toei Animation', 'Japan', '1948', 'https://www.toei-animation.com/'),
(3, 'Madhouse', 'Japan', '1972', 'https://www.madhouse.co.jp/'),
(4, 'Studio Pierrot', 'Japan', '1979', 'https://pierrot.jp/'),
(5, 'Sunrise', 'Japan', '1972', 'https://www.sunrise-inc.co.jp/'),
(6, 'White Fox', 'Japan', '2007', 'https://w-fox.co.jp/'),
(7, 'Bones', 'Japan', '1998', 'https://www.bones.co.jp/'),
(8, 'MAPPA', 'Japan', '2011', 'https://www.mappa.co.jp/'),
(9, 'Liden Films', 'Japan', '2012', 'https://lidenfilms.jp/'),
(10, 'Toei Animation', 'Japan', '1948', 'https://www.toei-animation.com/'),
(11, 'White Fox', 'Japan', '2007', 'https://w-fox.co.jp/'),
(12, 'Gallop', 'Japan', '1979', NULL),
(13, 'OLM', 'Japan', '1990', 'https://www.olm.co.jp/'),
(14, 'A-1 Pictures', 'Japan', '2005', 'https://a1p.jp/'),
(15, 'Studio Pierrot', 'Japan', '1979', 'https://pierrot.jp/'),
(16, 'Trigger', 'Japan', '2011', 'https://www.st-trigger.co.jp/'),
(17, 'A-1 Pictures', 'Japan', '2005', 'https://a1p.jp/'),
(18, 'Kyoto Animation', 'Japan', '1981', 'https://www.kyotoanimation.co.jp/'),
(19, 'Madhouse', 'Japan', '1972', 'https://www.madhouse.co.jp/'),
(20, 'Wit Studio', 'Japan', '2012', 'https://www.witstudio.co.jp/'),
(21, 'MAPPA', 'Japan', '2011', 'https://www.mappa.co.jp/'),
(22, 'Bones', 'Japan', '1998', 'https://www.bones.co.jp/'),
(23, 'David Production', 'Japan', '2007', 'https://davidproduction.jp/'),
(24, 'Madhouse', 'Japan', '1972', 'https://www.madhouse.co.jp/'),
(25, 'Madhouse', 'Japan', '1972', 'https://www.madhouse.co.jp/');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `User_id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password_hash` varchar(255) NOT NULL,
  `Date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`User_id`, `Username`, `Email`, `Password_hash`, `Date_created`) VALUES
(1, 'Markjr', 'Makrodjr@me.com', '$2y$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', '2026-06-01'),
(2, 'AnimeFan23', 'animefan23@example.com', '$2y$10$ExampleHashForUser2', '2026-06-05'),
(3, 'OtakuLife', 'otakulife@example.com', '$2y$10$ExampleHashForUser3', '2026-06-10'),
(4, 'MangaReader', 'mangareader@example.com', '$2y$10$ExampleHashForUser4', '2026-06-15'),
(5, 'NinjaFan', 'ninjafan@example.com', '$2y$10$ExampleHashForUser5', '2026-06-20'),
(6, 'AnimeExplorer', 'animeexplorer@example.com', '$2y$10$ExampleHashForUser6', '2026-06-25'),
(7, 'ShonenLover', 'shonenlover@example.com', '$2y$10$ExampleHashForUser7', '2026-07-01'),
(8, 'MechaMaster', 'mechamaster@example.com', '$2y$10$ExampleHashForUser8', '2026-07-05'),
(9, 'FantasyOtaku', 'fantasyotaku@example.com', '$2y$10$ExampleHashForUser9', '2026-07-10'),
(10, 'AnimeCritic', 'animecritic@example.com', '$2y$10$ExampleHashForUser10', '2026-07-15');

-- --------------------------------------------------------

--
-- Table structure for table `WatchList`
--

CREATE TABLE `WatchList` (
  `WatchList_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `anime_id` int(11) NOT NULL,
  `watch_status` varchar(255) NOT NULL,
  `date_added` date NOT NULL,
  `last_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `WatchList`
--

INSERT INTO `WatchList` (`WatchList_id`, `user_id`, `anime_id`, `watch_status`, `date_added`, `last_updated`) VALUES
(1, 1, 3, 'Watching', '2026-10-28', '2026-10-28'),
(2, 2, 29, 'Watching', '2026-06-05', '2026-06-05'),
(3, 3, 30, 'Completed', '2026-06-10', '2026-06-10'),
(4, 4, 31, 'Completed', '2026-06-15', '2026-06-15'),
(5, 5, 32, 'Watching', '2026-06-20', '2026-06-20'),
(6, 6, 33, 'Plan to Watch', '2026-06-25', '2026-06-25'),
(7, 7, 34, 'Completed', '2026-07-01', '2026-07-01'),
(8, 8, 35, 'Watching', '2026-07-05', '2026-07-05'),
(9, 9, 36, 'Completed', '2026-07-10', '2026-07-10'),
(10, 10, 37, 'Plan to Watch', '2026-07-15', '2026-07-15'),
(11, 1, 38, 'Watching', '2026-07-16', '2026-07-16'),
(12, 2, 39, 'Plan to Watch', '2026-07-17', '2026-07-17'),
(13, 3, 40, 'Completed', '2026-07-18', '2026-07-18'),
(14, 4, 41, 'Watching', '2026-07-19', '2026-07-19'),
(15, 5, 42, 'Completed', '2026-07-20', '2026-07-20'),
(16, 6, 43, 'Plan to Watch', '2026-07-21', '2026-07-21'),
(17, 7, 44, 'Completed', '2026-07-22', '2026-07-22'),
(18, 8, 45, 'Watching', '2026-07-23', '2026-07-23'),
(19, 9, 46, 'Completed', '2026-07-24', '2026-07-24'),
(20, 10, 47, 'Plan to Watch', '2026-07-25', '2026-07-25'),
(21, 1, 48, 'Completed', '2026-07-26', '2026-07-26'),
(22, 2, 49, 'Watching', '2026-07-27', '2026-07-27'),
(23, 3, 50, 'Completed', '2026-07-28', '2026-07-28'),
(24, 4, 51, 'Plan to Watch', '2026-07-29', '2026-07-29');

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
-- Indexes for table `Anime_Genres`
--
ALTER TABLE `Anime_Genres`
  ADD PRIMARY KEY (`anime_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`Genre_id`),
  ADD UNIQUE KEY `unique_genre_name` (`genre_name`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD UNIQUE KEY `unique_user_anime_review` (`user_id`,`anime_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `Studios`
--
ALTER TABLE `Studios`
  ADD PRIMARY KEY (`Studio_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Email_2` (`Email`),
  ADD UNIQUE KEY `unique_username` (`Username`);

--
-- Indexes for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD PRIMARY KEY (`WatchList_id`),
  ADD UNIQUE KEY `unique_user_anime_watchlist` (`user_id`,`anime_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Anime`
--
ALTER TABLE `Anime`
  MODIFY `Anime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `Genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Reviews`
--
ALTER TABLE `Reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Studios`
--
ALTER TABLE `Studios`
  MODIFY `Studio_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `WatchList`
--
ALTER TABLE `WatchList`
  MODIFY `WatchList_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Anime`
--
ALTER TABLE `Anime`
  ADD CONSTRAINT `Anime_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `Studios` (`Studio_id`);

--
-- Constraints for table `Anime_Genres`
--
ALTER TABLE `Anime_Genres`
  ADD CONSTRAINT `Anime_Genres_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `Anime` (`Anime_id`),
  ADD CONSTRAINT `Anime_Genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`Genre_id`);

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `Anime` (`Anime_id`);

--
-- Constraints for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD CONSTRAINT `WatchList_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`User_id`),
  ADD CONSTRAINT `WatchList_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `Anime` (`Anime_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
