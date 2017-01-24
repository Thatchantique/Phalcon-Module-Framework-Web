-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 18 Janvier 2017 à 12:11
-- Version du serveur :  10.1.16-MariaDB
-- Version de PHP :  7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `phalcon-td0`
--

CREATE DATABASE IF NOT EXISTS `phalcon-td0` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phalcon-td0`;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'superadmin');

-- --------------------------------------------------------

--
-- Structure de la table `url`
--

CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `controller` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `url`
--

INSERT INTO `url` (`id`, `icon`, `title`, `controller`, `action`, `roles`) VALUES
(1, 'home', 'Accueil', 'Index', 'index', '1,2,3'),
(2, 'users', 'Utilisateurs', 'users', 'index', '1,3'),
(3, 'add square', 'Ajout d''utilisateur', 'users', 'add', '1,3'),
(4, 'edit', 'Modification d''utilisateur', 'users', 'update', '1,3');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `firstname`, `lastname`, `email`, `image`, `idrole`) VALUES
(43, 'Benjamin.Sherman@company.net', 'OWC09RSW6AE', 'Benjamin', 'Sherman', 'Benjamin.Sherman@gmail.com', NULL, 1),
(44, 'Acton.Carrillo@company.net', 'HIO59BHB8HB', 'Acton', 'Carrillo', 'Acton.Carrillo@gmail.com', NULL, 3),
(45, 'Zorita.Rodriguez@company.net', 'GNW04ZAO6HP', 'Zorita', 'Rodriguez', 'Zorita.Rodriguez@gmail.com', NULL, 1),
(46, 'Henry.Beasley@company.net', 'UZK64PCR2UN', 'Henry', 'Beasley', 'Henry.Beasley@gmail.com', NULL, 2),
(47, 'Kelsey.Weber@company.net', 'CGR68MCJ3SN', 'Kelsey', 'Weber', 'Kelsey.Weber@gmail.com', NULL, 1),
(48, 'Olympia.Huber@company.net', 'HNP83HAE0FM', 'Olympia', 'Huber', 'Olympia.Huber@gmail.com', NULL, 2),
(49, 'Carolyn.Pace@company.net', 'YIX45RKH5MR', 'Carolyn', 'Pace', 'Carolyn.Pace@gmail.com', NULL, 2),
(50, 'Levi.Bishop@company.net', 'IKY43FHZ6VT', 'Levi', 'Bishop', 'Levi.Bishop@gmail.com', NULL, 2),
(51, 'Wyatt.Higgins@company.net', 'ZIO64ZJU9HY', 'Wyatt', 'Higgins', 'Wyatt.Higgins@gmail.com', NULL, 1),
(52, 'Lionel.Mccray@company.net', 'VKW78FSB6PJ', 'Lionel', 'Mccray', 'Lionel.Mccray@gmail.com', NULL, 2),
(53, 'Jeremy.Bryan@company.net', 'TTV64OAQ9AN', 'Jeremy', 'Bryan', 'Jeremy.Bryan@gmail.com', NULL, 2),
(54, 'Ava.Pollard@company.net', 'ZKV02QCQ5GZ', 'Ava', 'Pollard', 'Ava.Pollard@gmail.com', NULL, 2),
(55, 'Jane.Leon@company.net', 'AQD96ABI2WQ', 'Jane', 'Leon', 'Jane.Leon@gmail.com', NULL, 2),
(56, 'Baxter.Wise@company.net', 'PJG36JAP3GU', 'Baxter', 'Wise', 'Baxter.Wise@gmail.com', NULL, 2),
(57, 'Cyrus.Rosario@company.net', 'ZDU33RYL2AK', 'Cyrus', 'Rosario', 'Cyrus.Rosario@gmail.com', NULL, 2),
(58, 'Amos.Travis@company.net', 'UIP43SJH2IK', 'Amos', 'Travis', 'Amos.Travis@gmail.com', NULL, 2),
(59, 'Whitney.Hale@company.net', 'PCA69ZZG9HD', 'Whitney', 'Hale', 'Whitney.Hale@gmail.com', NULL, 2),
(60, 'Fletcher.Fischer@company.net', 'BJM28BRO9SX', 'Fletcher', 'Fischer', 'Fletcher.Fischer@gmail.com', NULL, 2),
(61, 'Rhiannon.Dickerson@company.net', 'ZUM07JRG0JH', 'Rhiannon', 'Dickerson', 'Rhiannon.Dickerson@gmail.com', NULL, 2),
(62, 'Maggy.Weber@company.net', 'MWW53SWA2WH', 'Maggy', 'Weber', 'Maggy.Weber@gmail.com', NULL, 2),
(63, 'Kyle.Craig@company.net', 'KAD56XAM2KY', 'Kyle', 'Craig', 'Kyle.Craig@gmail.com', NULL, 2),
(64, 'Burton.Sanford@company.net', 'LYO83OLV8TF', 'Burton', 'Sanford', 'Burton.Sanford@gmail.com', NULL, 2),
(65, 'Cooper.Callahan@company.net', 'WKF09LDB4AF', 'Cooper', 'Callahan', 'Cooper.Callahan@gmail.com', NULL, 2),
(66, 'Urielle.Moreno@company.net', 'DTB04DDU0KV', 'Urielle', 'Moreno', 'Urielle.Moreno@gmail.com', NULL, 2),
(67, 'Aristotle.Reese@company.net', 'QPN11PVQ7TR', 'Aristotle', 'Reese', 'Aristotle.Reese@gmail.com', NULL, 2),
(68, 'Camille.Blevins@company.net', 'CLQ63RXB3VB', 'Camille', 'Blevins', 'Camille.Blevins@gmail.com', NULL, 2),
(69, 'Colleen.Blevins@company.net', 'EOO51HIZ0PG', 'Colleen', 'Blevins', 'Colleen.Blevins@gmail.com', NULL, 2),
(70, 'Martina.Holder@company.net', 'QZW21CRI9ZY', 'Martina', 'Holder', 'Martina.Holder@gmail.com', NULL, 2),
(71, 'Allistair.Leon@company.net', 'ZAW47BFF3DM', 'Allistair', 'Leon', 'Allistair.Leon@gmail.com', NULL, 2),
(72, 'Driscoll.Dickson@company.net', 'YNN51MQQ4II', 'Driscoll', 'Dickson', 'Driscoll.Dickson@gmail.com', NULL, 2),
(73, 'Magee.Marquez@company.net', 'SHX59YVP7XU', 'Magee', 'Marquez', 'Magee.Marquez@gmail.com', NULL, 2),
(74, 'Angelica.Serrano@company.net', 'XRJ73PFL2WQ', 'Angelica', 'Serrano', 'Angelica.Serrano@gmail.com', NULL, 2),
(75, 'Nomlanga.Bowen@company.net', 'SSH13DSE6TU', 'Nomlanga', 'Bowen', 'Nomlanga.Bowen@gmail.com', NULL, 2),
(76, 'Gil.Bright@company.net', 'BEH66TUK0UL', 'Gil', 'Bright', 'Gil.Bright@gmail.com', NULL, 2),
(77, 'Alvin.Hatfield@company.net', 'MBO67IAK8UM', 'Alvin', 'Hatfield', 'Alvin.Hatfield@gmail.com', NULL, 2),
(78, 'Curran.Knowles@company.net', 'QNW26QIE9RW', 'Curran', 'Knowles', 'Curran.Knowles@gmail.com', NULL, 2),
(79, 'Charissa.David@company.net', 'RTM13TXT9AK', 'Charissa', 'David', 'Charissa.David@gmail.com', NULL, 2),
(80, 'Lev.Kennedy@company.net', 'EYG45KQT2IU', 'Lev', 'Kennedy', 'Lev.Kennedy@gmail.com', NULL, 2),
(81, 'Lynn.Jacobs@company.net', 'ZHW67JUR3DI', 'Lynn', 'Jacobs', 'Lynn.Jacobs@gmail.com', NULL, 2),
(82, 'Lois.Wiley@company.net', 'SIU35PZI0BT', 'Lois', 'Wiley', 'Lois.Wiley@gmail.com', NULL, 2),
(83, 'Deborah.Wheeler@company.net', 'WUD38KWN1LI', 'Deborah', 'Wheeler', 'Deborah.Wheeler@gmail.com', NULL, 2),
(84, 'Renee.Olson@company.net', 'BXT76DJI2KA', 'Renee', 'Olson', 'Renee.Olson@gmail.com', NULL, 2),
(85, 'Philip.English@company.net', 'OLM46WUL5QC', 'Philip', 'English', 'Philip.English@gmail.com', NULL, 2),
(86, 'Kevin.Johns@company.net', 'IKJ83UQO4LP', 'Kevin', 'Johns', 'Kevin.Johns@gmail.com', NULL, 2),
(87, 'Jane.Holden@company.net', 'BVG22IMJ7UO', 'Jane', 'Holden', 'Jane.Holden@gmail.com', NULL, 2),
(88, 'Kendall.Collier@company.net', 'PPQ01KRW4QU', 'Kendall', 'Collier', 'Kendall.Collier@gmail.com', NULL, 2),
(89, 'Solomon.Tucker@company.net', 'LLI65CKR1FM', 'Solomon', 'Tucker', 'Solomon.Tucker@gmail.com', NULL, 2),
(90, 'Richard.Higgins@company.net', 'QXP09FYD8IJ', 'Richard', 'Higgins', 'Richard.Higgins@gmail.com', NULL, 2),
(91, 'Carly.David@company.net', 'ORG15ORK7NR', 'Carly', 'David', 'Carly.David@gmail.com', NULL, 2),
(92, 'Ursa.Barry@company.net', 'SDJ66QPG1VS', 'Ursa', 'Barry', 'Ursa.Barry@gmail.com', NULL, 2),
(93, 'Steven.Norman@company.net', 'HVH32HVT8MR', 'Steven', 'Norman', 'Steven.Norman@gmail.com', NULL, 2),
(94, 'Joan.Hatfield@company.net', 'RNF84ENW1FC', 'Joan', 'Hatfield', 'Joan.Hatfield@gmail.com', NULL, 2),
(95, 'Simon.Pacheco@company.net', 'JTD92HBV6LY', 'Simon', 'Pacheco', 'Simon.Pacheco@gmail.com', NULL, 2),
(96, 'Price.Sears@company.net', 'ARD22CYJ7DJ', 'Price', 'Sears', 'Price.Sears@gmail.com', NULL, 2),
(97, 'Melodie.Burton@company.net', 'MJB89OEN9YD', 'Melodie', 'Burton', 'Melodie.Burton@gmail.com', NULL, 2),
(98, 'Amela.Burks@company.net', 'COY70COZ0HP', 'Amela', 'Burks', 'Amela.Burks@gmail.com', NULL, 2),
(99, 'Melvin.Jacobs@company.net', 'ERJ13FFZ9IS', 'Melvin', 'Jacobs', 'Melvin.Jacobs@gmail.com', NULL, 2),
(100, 'Ivory.Morin@company.net', 'VCA67DEG0LI', 'Ivory', 'Morin', 'Ivory.Morin@gmail.com', NULL, 2),
(101, 'Quentin.Clements@company.net', 'BCU26BTI1ZC', 'Quentin', 'Clements', 'Quentin.Clements@gmail.com', NULL, 2),
(102, 'Colton.Mcintyre@company.net', 'DPM10ODN4MK', 'Colton', 'Mcintyre', 'Colton.Mcintyre@gmail.com', NULL, 2),
(103, 'Talon.Boyle@company.net', 'EAC10BKA9FZ', 'Talon', 'Boyle', 'Talon.Boyle@gmail.com', NULL, 2),
(104, 'Kyra.Rocha@company.net', 'VJW60ULA7YW', 'Kyra', 'Rocha', 'Kyra.Rocha@gmail.com', NULL, 2),
(105, 'Stella.Cole@company.net', 'RJH68PRO4SW', 'Stella', 'Cole', 'Stella.Cole@gmail.com', NULL, 2),
(106, 'Brock.Lucas@company.net', 'GZI54FAF2QV', 'Brock', 'Lucas', 'Brock.Lucas@gmail.com', NULL, 2),
(107, 'Lila.Lewis@company.net', 'PMM40BGE7EZ', 'Lila', 'Lewis', 'Lila.Lewis@gmail.com', NULL, 2),
(108, 'Hu.Key@company.net', 'MHN02DRZ2QK', 'Hu', 'Key', 'Hu.Key@gmail.com', NULL, 2),
(109, 'Kuame.James@company.net', 'PAN51UII5EK', 'Kuame', 'James', 'Kuame.James@gmail.com', NULL, 2),
(110, 'Xenos.Padilla@company.net', 'RSO17VKK9PN', 'Xenos', 'Padilla', 'Xenos.Padilla@gmail.com', NULL, 2),
(111, 'Sade.Owens@company.net', 'XIH02LWO2MI', 'Sade', 'Owens', 'Sade.Owens@gmail.com', NULL, 2),
(112, 'Ivor.Logan@company.net', 'BJQ09KDN8WK', 'Ivor', 'Logan', 'Ivor.Logan@gmail.com', NULL, 2),
(113, 'Eleanor.Cabrera@company.net', 'ECW85CUY3ZR', 'Eleanor', 'Cabrera', 'Eleanor.Cabrera@gmail.com', NULL, 2),
(114, 'Clare.Macdonald@company.net', 'VPQ45ENN0NH', 'Clare', 'Macdonald', 'Clare.Macdonald@gmail.com', NULL, 2),
(115, 'Malcolm.Burke@company.net', 'PLO48UGZ5XA', 'Malcolm', 'Burke', 'Malcolm.Burke@gmail.com', NULL, 2),
(116, 'Kitra.Delaney@company.net', 'SQU50ZAG7OI', 'Kitra', 'Delaney', 'Kitra.Delaney@gmail.com', NULL, 2),
(117, 'Barrett.Holcomb@company.net', 'SBA21QWP2YR', 'Barrett', 'Holcomb', 'Barrett.Holcomb@gmail.com', NULL, 2),
(118, 'Haley.Reed@company.net', 'GPK80XRK7JZ', 'Haley', 'Reed', 'Haley.Reed@gmail.com', NULL, 2),
(119, 'Grant.Townsend@company.net', 'YAL32HDT0UA', 'Grant', 'Townsend', 'Grant.Townsend@gmail.com', NULL, 2),
(120, 'Derek.Hays@company.net', 'OVD66OAJ2UH', 'Derek', 'Hays', 'Derek.Hays@gmail.com', NULL, 2),
(121, 'Keiko.Benson@company.net', 'HPV72ZLP6MQ', 'Keiko', 'Benson', 'Keiko.Benson@gmail.com', NULL, 2),
(122, 'Mara.Benjamin@company.net', 'XCQ79LJC5LQ', 'Mara', 'Benjamin', 'Mara.Benjamin@gmail.com', NULL, 2),
(123, 'Hyacinth.Finley@company.net', 'UIV27LYU6SW', 'Hyacinth', 'Finley', 'Hyacinth.Finley@gmail.com', NULL, 2),
(124, 'Ramona.Solomon@company.net', 'MYJ31VYH0GV', 'Ramona', 'Solomon', 'Ramona.Solomon@gmail.com', NULL, 2),
(125, 'Ezra.Anderson@company.net', 'NKN68ETH4OM', 'Ezra', 'Anderson', 'Ezra.Anderson@gmail.com', NULL, 2),
(126, 'Alana.Lambert@company.net', 'IXT00JND7YK', 'Alana', 'Lambert', 'Alana.Lambert@gmail.com', NULL, 2),
(127, 'Lillian.Wright@company.net', 'LBJ92OFT4IT', 'Lillian', 'Wright', 'Lillian.Wright@gmail.com', NULL, 2),
(128, 'Brenna.Trevino@company.net', 'QJO38DEX1TM', 'Brenna', 'Trevino', 'Brenna.Trevino@gmail.com', NULL, 2),
(129, 'Madeson.Larsen@company.net', 'QFL74NXO4UR', 'Madeson', 'Larsen', 'Madeson.Larsen@gmail.com', NULL, 2),
(130, 'Kenyon.Hinton@company.net', 'OJN19NDN7HR', 'Kenyon', 'Hinton', 'Kenyon.Hinton@gmail.com', NULL, 2),
(131, 'Vera.Powers@company.net', 'VIR06MOZ2JV', 'Vera', 'Powers', 'Vera.Powers@gmail.com', NULL, 2),
(132, 'Natalie.Brown@company.net', 'YKD61DCY5IF', 'Natalie', 'Brown', 'Natalie.Brown@gmail.com', NULL, 2),
(133, 'Claudia.Savage@company.net', 'KFN84UVA1SG', 'Claudia', 'Savage', 'Claudia.Savage@gmail.com', NULL, 2),
(134, 'Lucas.Bush@company.net', 'ZFS09NFU7DO', 'Lucas', 'Bush', 'Lucas.Bush@gmail.com', NULL, 2),
(135, 'Kenyon.Neal@company.net', 'OWG74JRY9KV', 'Kenyon', 'Neal', 'Kenyon.Neal@gmail.com', NULL, 2),
(136, 'Tyrone.Hurley@company.net', 'GHE80GQD6EU', 'Tyrone', 'Hurley', 'Tyrone.Hurley@gmail.com', NULL, 2),
(137, 'Maris.Mosley@company.net', 'NEX48LLK6CD', 'Maris', 'Mosley', 'Maris.Mosley@gmail.com', NULL, 2),
(138, 'Elaine.Norton@company.net', 'STY09EPG0GD', 'Elaine', 'Norton', 'Elaine.Norton@gmail.com', NULL, 2),
(139, 'Vernon.Tanner@company.net', 'VMZ45SGA2NV', 'Vernon', 'Tanner', 'Vernon.Tanner@gmail.com', NULL, 2),
(140, 'Brennan.Shaw@company.net', 'XMG63KHO3JY', 'Brennan', 'Shaw', 'Brennan.Shaw@gmail.com', NULL, 2),
(141, 'Victoria.Whitehead@company.net', 'LAF73KHK8FZ', 'Victoria', 'Whitehead', 'Victoria.Whitehead@gmail.com', NULL, 2),
(142, 'Allistair.Johnson@company.net', 'RUN58DYH4RN', 'Allistair', 'Johnson', 'Allistair.Johnson@gmail.com', NULL, 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `fk_User_role1_idx` (`idrole`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `url`
--
ALTER TABLE `url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_User_role1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
