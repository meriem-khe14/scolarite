-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 09 avr. 2026 à 02:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `scolarite`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot de passe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `email`, `mot de passe`) VALUES
(1, 'admin', 'admin@scolarite.com', 'scolarite');

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mot de passe` varchar(100) NOT NULL,
  `specialite` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `nom`, `prenom`, `mot de passe`, `specialite`, `email`) VALUES
(1, 'chrif', 'sofiane', 'scolarite', 'archi', 'chrif.sofiane@scolarite.com'),
(2, 'gherbi', 'selma', 'scolarite', 'pweb', 'gherbi.selma@scolarite.com'),
(3, 'chahir', 'sara', 'scolarite', 'systeme d\'exploitation', 'chahir.sara@scolarite.com');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int(11) NOT NULL,
  `matricule` varchar(12) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot de passe` varchar(100) NOT NULL,
  `niveau` varchar(50) NOT NULL,
  `filiere` varchar(50) NOT NULL,
  `date_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `matricule`, `nom`, `prenom`, `email`, `mot de passe`, `niveau`, `filiere`, `date_naissance`) VALUES
(1, '212431859912', 'ABAOUI', 'LYNA-MELISSA', 'abaoui.lyna.melissa@etu.com', '10022005', 'L1', 'Informatique', '2005-02-10'),
(2, '232431546203', 'ABBAS', 'MAYA MYRIAM', 'abbas.maya.myriam@etu.com', '27042005', 'L1', 'Informatique', '2005-04-27'),
(3, '242431599204', 'ABDELHAMID', 'AKRAM', 'abdelhamid.akram@etu.com', '05042007', 'L3', 'Informatique', '2007-04-05'),
(4, '222231609707', 'ABDELLAOUI', 'YOUCEF', 'abdellaoui.youcef@etu.com', '03052004', 'L2', 'Informatique', '2004-05-03'),
(5, '242431676416', 'ABDELLATIF', 'SARA', 'abdellatif.sara@etu.com', '28112007', 'L2', 'Informatique', '2007-11-28'),
(6, '232331500107', 'AISSA', 'NIHAD', 'aissa.nihad@etu.com', '15072006', 'L2', 'Informatique', '2006-07-15'),
(7, '242431370909', 'AISSAOUI', 'IMAD EDDINE', 'aissaoui.imad.eddine@etu.com', '17122004', 'L1', 'Informatique', '2004-12-17'),
(8, '232331413601', 'AISSAOUI', 'YOUSRA', 'aissaoui.yousra@etu.com', '14032005', 'M2', 'Informatique', '2005-03-14'),
(9, '242431368913', 'AIT KACI', 'ABDELMALEK', 'ait.kaci.abdelmalek@etu.com', '11022007', 'L1', 'Informatique', '2007-02-11'),
(10, '222231413217', 'AIT MEHDI', 'FAROUK IMED', 'ait.mehdi.farouk.imed@etu.com', '20122007', 'M2', 'Informatique', '2007-12-20'),
(11, '242431438719', 'AIT OUAMAR', 'AYA', 'ait.ouamar.aya@etu.com', '05072006', 'M1', 'Informatique', '2006-07-05'),
(12, '242431577510', 'AKACEM', 'ABDENOUR', 'akacem.abdenour@etu.com', '23082004', 'L1', 'Informatique', '2004-08-23'),
(13, '222231581410', 'AKOUIRADJEMOU', 'OUAIL ABD ERRAOUF', 'akouiradjemou.ouail.abd.erraouf@etu.com', '10092007', 'L1', 'Informatique', '2007-09-10'),
(14, '242431461716', 'AKTOUF', 'IKRAM', 'aktouf.ikram@etu.com', '15072004', 'L1', 'Informatique', '2004-07-15'),
(15, '232333374911', 'ALI', 'MOHAMMED AMINE ABDERRAOUF', 'ali.mohammed.amine.abderraouf@etu.com', '09082007', 'L2', 'Informatique', '2007-08-09'),
(16, '242431453208', 'ALIM', 'KAMEL', 'alim.kamel@etu.com', '01062004', 'L2', 'Informatique', '2004-06-01'),
(17, '222231438707', 'AMDIDOUCHE', 'ASMAA', 'amdidouche.asmaa@etu.com', '09042007', 'M2', 'Informatique', '2007-04-09'),
(18, '232332170007', 'AMMICHE', 'NOUR ELHOUDA', 'ammiche.nour.elhouda@etu.com', '09022007', 'M2', 'Informatique', '2007-02-09'),
(19, '232331519001', 'AMOR', 'YOUNES', 'amor.younes@etu.com', '26092005', 'L1', 'Informatique', '2005-09-26'),
(20, '232331499219', 'ASSABAT', 'ABDELMALEK', 'assabat.abdelmalek@etu.com', '11052007', 'M2', 'Informatique', '2007-05-11'),
(21, '232333087110', 'AZZOUG', 'MELISSA', 'azzoug.melissa@etu.com', '01082007', 'L2', 'Informatique', '2007-08-01'),
(22, '232331738702', 'AZZOUZ', 'ABDENNOUR', 'azzouz.abdennour@etu.com', '02112007', 'M2', 'Informatique', '2007-11-02'),
(23, '242431730502', 'AZZOUZI', 'MEHDI', 'azzouzi.mehdi@etu.com', '12062004', 'M1', 'Informatique', '2004-06-12'),
(24, '222233370909', 'BAHA', 'NESRINE', 'baha.nesrine@etu.com', '17092006', 'L2', 'Informatique', '2006-09-17'),
(25, '242431620609', 'BAOUZ', 'DOUAA', 'baouz.douaa@etu.com', '26032004', 'M1', 'Informatique', '2004-03-26'),
(26, '232331388007', 'BARA', 'IMADEDDINE', 'bara.imadeddine@etu.com', '07012005', 'M2', 'Informatique', '2005-01-07'),
(27, '232331412506', 'BEARCIA', 'ISSAM EDDINE', 'bearcia.issam.eddine@etu.com', '27052004', 'L3', 'Informatique', '2004-05-27'),
(28, '232331740006', 'BEDDIAF', 'YAKOUB MOUSSA', 'beddiaf.yakoub.moussa@etu.com', '18122006', 'L1', 'Informatique', '2006-12-18'),
(29, '242431597817', 'BELABED', 'IMENE ZOHRA', 'belabed.imene.zohra@etu.com', '09082005', 'L2', 'Informatique', '2005-08-09'),
(30, '232331667419', 'BELABRIK', 'YASMINE FATMA ZOHRA', 'belabrik.yasmine.fatma.zohra@etu.com', '19022007', 'M1', 'Informatique', '2007-02-19'),
(31, '232331441703', 'BELARBI', 'ABDELKARIM REDA', 'belarbi.abdelkarim.reda@etu.com', '14112006', 'L3', 'Informatique', '2006-11-14'),
(32, '232331715109', 'BELHADJ', 'ABDELHAKIM', 'belhadj.abdelhakim@etu.com', '14122004', 'L3', 'Informatique', '2004-12-14'),
(33, '242431715620', 'BELKHIR', 'MOHAMED', 'belkhir.mohamed@etu.com', '23022004', 'L2', 'Informatique', '2004-02-23'),
(34, '242431461920', 'BENABDELLATIF', 'OMAR', 'benabdellatif.omar@etu.com', '14112005', 'L2', 'Informatique', '2005-11-14'),
(35, '242431786010', 'BENAISSA', 'BOUCHRA', 'benaissa.bouchra@etu.com', '03122004', 'L3', 'Informatique', '2004-12-03'),
(36, '222231345706', 'BEN AISSA CHRIF', 'AYA', 'ben.aissa.chrif.aya@etu.com', '01012007', 'L1', 'Informatique', '2007-01-01'),
(37, '232331692611', 'BENAMARA', 'RANIA', 'benamara.rania@etu.com', '01042004', 'L1', 'Informatique', '2004-04-01'),
(38, '242431460816', 'BACHIR BEN', 'MOHAMED LOKMAN', 'bachir.ben.mohamed.lokman@etu.com', '27032004', 'M1', 'Informatique', '2004-03-27'),
(39, '242431596411', 'BENCHEIKH', 'NADA', 'bencheikh.nada@etu.com', '05062004', 'L1', 'Informatique', '2004-06-05'),
(40, '212431656304', 'BENGUESMIA', 'FARIDA FARAH', 'benguesmia.farida.farah@etu.com', '10062005', 'L3', 'Informatique', '2005-06-10'),
(41, '242431680418', 'BENMOKHTAR', 'YASSER', 'benmokhtar.yasser@etu.com', '30112005', 'L3', 'Informatique', '2005-11-30'),
(42, '242431675005', 'BENYAHIA', 'ISSAM WALID EL', 'benyahia.issam.walid.el@etu.com', '06042005', 'M2', 'Informatique', '2005-04-06'),
(43, '232431652101', 'BESSAA', 'MOHAMED AMINE', 'bessaa.mohamed.amine@etu.com', '26072004', 'L3', 'Informatique', '2004-07-26'),
(44, '242431622804', 'BETTAYEB', 'SID ALI', 'bettayeb.sid.ali@etu.com', '16012007', 'L1', 'Informatique', '2007-01-16'),
(45, '232331424405', 'BOUALI', 'ZINEB AZHAR', 'bouali.zineb.azhar@etu.com', '08072005', 'M1', 'Informatique', '2005-07-08'),
(46, '242431440109', 'BOUDANI', 'FATMA ZOHRA', 'boudani.fatma.zohra@etu.com', '18062006', 'M2', 'Informatique', '2006-06-18'),
(47, '232331499415', 'BOUDAOUD', 'FAIROUZ', 'boudaoud.fairouz@etu.com', '04102007', 'L1', 'Informatique', '2007-10-04'),
(48, '232335477206', 'BOUDERRAZ', 'MAROUA', 'bouderraz.maroua@etu.com', '31052007', 'M1', 'Informatique', '2007-05-31'),
(49, '192431546202', 'BOUDINE', 'MALIK', 'boudine.malik@etu.com', '14102005', 'L1', 'Informatique', '2005-10-14'),
(50, '242431843605', 'BOUDJANA', 'RADJAA', 'boudjana.radjaa@etu.com', '08092006', 'M2', 'Informatique', '2006-09-08'),
(51, '232331698617', 'BOUDRAF', 'MOUHYEDDINE IBRAHIM', 'boudraf.mouhyeddine.ibrahim@etu.com', '03022004', 'L3', 'Informatique', '2004-02-03'),
(52, '232331740411', 'BOUHADDA', 'HAOUA', 'bouhadda.haoua@etu.com', '19052004', 'M2', 'Informatique', '2004-05-19'),
(53, '242431424613', 'BOUHADJA', 'NOURELHOUDA', 'bouhadja.nourelhouda@etu.com', '23082005', 'L3', 'Informatique', '2005-08-23'),
(54, '232331544604', 'BOUKERDOUS', 'HANANE', 'boukerdous.hanane@etu.com', '28012007', 'M2', 'Informatique', '2007-01-28'),
(55, '232331621308', 'BOUKHALFA', 'LINA HADIL', 'boukhalfa.lina.hadil@etu.com', '13062006', 'L2', 'Informatique', '2006-06-13'),
(56, '232431650501', 'BOUKHARI', 'ADLANE', 'boukhari.adlane@etu.com', '06012007', 'L1', 'Informatique', '2007-01-06'),
(57, '242431434219', 'BOUKHARI', 'YASSER ABDELMOUMAN', 'boukhari.yasser.abdelmouman@etu.com', '26092007', 'L1', 'Informatique', '2007-09-26'),
(58, '242431577705', 'BOUKTITE', 'MOHAMED ADAM', 'bouktite.mohamed.adam@etu.com', '20082005', 'L2', 'Informatique', '2005-08-20'),
(59, '242431625010', 'BOULAHABAL', 'MARWA', 'boulahabal.marwa@etu.com', '18122004', 'L3', 'Informatique', '2004-12-18'),
(60, '242431223007', 'BOUMEDIENE', 'LINA MARIA', 'boumediene.lina.maria@etu.com', '03122007', 'L1', 'Informatique', '2007-12-03'),
(61, '232331072415', 'BOUMEDINE', 'MOHAMED LYES', 'boumedine.mohamed.lyes@etu.com', '22092004', 'L2', 'Informatique', '2004-09-22'),
(62, '242431433019', 'BOUSBAA', 'LYNA TADJ EL BAHA', 'bousbaa.lyna.tadj.el.baha@etu.com', '08112007', 'L1', 'Informatique', '2007-11-08'),
(63, '232331433007', 'BOUSSOUSSOU', 'ABDESSAMED RIADH', 'boussoussou.abdessamed.riadh@etu.com', '06022005', 'M1', 'Informatique', '2005-02-06'),
(64, '242431472812', 'BOUTRAH', 'CHEYMA', 'boutrah.cheyma@etu.com', '12122005', 'L3', 'Informatique', '2005-12-12'),
(65, '232331413914', 'BOUZIANE', 'ABDELLAH', 'bouziane.abdellah@etu.com', '07062006', 'M1', 'Informatique', '2006-06-07'),
(66, '232331553511', 'BRAHIMI', 'ABDELKRIM', 'brahimi.abdelkrim@etu.com', '28042006', 'L3', 'Informatique', '2006-04-28'),
(67, '232431859207', 'CHABANE', 'ALA EDDINE', 'chabane.ala.eddine@etu.com', '25042004', 'L2', 'Informatique', '2004-04-25'),
(68, '242431362004', 'CHAOUADI', 'ABDALLAH', 'chaouadi.abdallah@etu.com', '11082006', 'L3', 'Informatique', '2006-08-11'),
(69, '232331641011', 'CHEBBAH', 'MANEL CHAIMA', 'chebbah.manel.chaima@etu.com', '10022004', 'L3', 'Informatique', '2004-02-10'),
(70, '232331674009', 'CHELABI', 'CHAIMA', 'chelabi.chaima@etu.com', '20092004', 'L2', 'Informatique', '2004-09-20'),
(71, '242431598307', 'CHERFAOUI', 'FARES', 'cherfaoui.fares@etu.com', '11042007', 'L3', 'Informatique', '2007-04-11'),
(72, '232331488404', 'CHERGUI', 'SAFIA', 'chergui.safia@etu.com', '22032006', 'L1', 'Informatique', '2006-03-22'),
(73, '222231619218', 'CHERIFI', 'ABDERRAHMANE', 'cherifi.abderrahmane@etu.com', '11042005', 'M2', 'Informatique', '2005-04-11'),
(74, '242431414302', 'CHERIFI', 'RAHMA', 'cherifi.rahma@etu.com', '20092007', 'L2', 'Informatique', '2007-09-20'),
(75, '242431577704', 'CHORFI', 'YACINE', 'chorfi.yacine@etu.com', '10102006', 'M2', 'Informatique', '2006-10-10'),
(76, '232331600106', 'DADDA', 'YACINE', 'dadda.yacine@etu.com', '17092006', 'L2', 'Informatique', '2006-09-17'),
(77, '242431679715', 'DAHMANI', 'ANAIS', 'dahmani.anais@etu.com', '28032005', 'L2', 'Informatique', '2005-03-28'),
(78, '232331781916', 'DAYA', 'AYOUB', 'daya.ayoub@etu.com', '19012006', 'M1', 'Informatique', '2006-01-19'),
(79, '242431370906', 'DERRADJI', 'ABDERRAHMANE', 'derradji.abderrahmane@etu.com', '21072006', 'M1', 'Informatique', '2006-07-21'),
(80, '232335051703', 'DIAFI', 'AYAT ERRAHMANE', 'diafi.ayat.errahmane@etu.com', '09082006', 'L3', 'Informatique', '2006-08-09'),
(81, '232331406306', 'DJAHEL', 'YOUSRA', 'djahel.yousra@etu.com', '16052005', 'M2', 'Informatique', '2005-05-16'),
(82, '242431597707', 'DJENNADI', 'ACHRAF ISLAM', 'djennadi.achraf.islam@etu.com', '18012007', 'L2', 'Informatique', '2007-01-18'),
(83, '242431414315', 'DOUDOU', 'SALSABILA', 'doudou.salsabila@etu.com', '18022007', 'L3', 'Informatique', '2007-02-18'),
(84, '242431475412', 'DOUKHI', 'SALAH EDDIN', 'doukhi.salah.eddin@etu.com', '08072006', 'L1', 'Informatique', '2006-07-08'),
(85, '242431454420', 'DRIDI', 'WALID', 'dridi.walid@etu.com', '12032007', 'L2', 'Informatique', '2007-03-12'),
(86, '242431413006', 'FERKOUS', 'MOHAMED HOUSSAM', 'ferkous.mohamed.houssam@etu.com', '02062004', 'L1', 'Informatique', '2004-06-02'),
(87, '242431423103', 'FERRAH', 'NIHAL YASMINE', 'ferrah.nihal.yasmine@etu.com', '06072004', 'L3', 'Informatique', '2004-07-06'),
(88, '242431486406', 'FERRANI', 'ABDELKARIM OUSSAMA', 'ferrani.abdelkarim.oussama@etu.com', '20042005', 'M1', 'Informatique', '2005-04-20'),
(89, '232331440603', 'FISSAH', 'KHADIDJA', 'fissah.khadidja@etu.com', '22122004', 'L3', 'Informatique', '2004-12-22'),
(90, '232331418809', 'GHARBI', 'AICHA', 'gharbi.aicha@etu.com', '19122004', 'L1', 'Informatique', '2004-12-19'),
(91, '242431461709', 'GHERMOUL', 'ANES', 'ghermoul.anes@etu.com', '01122005', 'L2', 'Informatique', '2005-12-01'),
(92, '242431616006', 'GUETTACHE', 'CERINE', 'guettache.cerine@etu.com', '06092006', 'M2', 'Informatique', '2006-09-06'),
(93, '242431776615', 'HABBOUCHE', 'NOUH', 'habbouche.nouh@etu.com', '30082007', 'L3', 'Informatique', '2007-08-30'),
(94, '242431621102', 'HAFI', 'ABDERRAOUF', 'hafi.abderraouf@etu.com', '08042006', 'L2', 'Informatique', '2006-04-08'),
(95, '242432464917', 'HAIF', 'ISRAA', 'haif.israa@etu.com', '12052004', 'M1', 'Informatique', '2004-05-12'),
(96, '222231620901', 'HAMANI', 'HIBA MERIEM', 'hamani.hiba.meriem@etu.com', '30122006', 'M1', 'Informatique', '2006-12-30'),
(97, '232331601509', 'HAMITI', 'SIRINE', 'hamiti.sirine@etu.com', '26112005', 'M1', 'Informatique', '2005-11-26'),
(98, '242431777702', 'HAMMADOU', 'SALSABIL INES', 'hammadou.salsabil.ines@etu.com', '15072004', 'L2', 'Informatique', '2004-07-15'),
(99, '242431624503', 'HASNI', 'HOCINE', 'hasni.hocine@etu.com', '18122004', 'L3', 'Informatique', '2004-12-18'),
(100, '232331453804', 'HERSOUS', 'YASMINE', 'hersous.yasmine@etu.com', '19032007', 'L2', 'Informatique', '2007-03-19'),
(101, '232333149512', 'IDJOUBAR', 'LITISSIA', 'idjoubar.litissia@etu.com', '04032005', 'L2', 'Informatique', '2005-03-04'),
(102, '242431433013', 'IKRAM', 'BOUTINE', 'ikram.boutine@etu.com', '25032004', 'M2', 'Informatique', '2004-03-25'),
(103, '232331338314', 'KABOUCHE', 'YAHIA', 'kabouche.yahia@etu.com', '20082005', 'M2', 'Informatique', '2005-08-20'),
(104, '232331430512', 'KADRI', 'OUAIS', 'kadri.ouais@etu.com', '27062007', 'L3', 'Informatique', '2007-06-27'),
(105, '242431476317', 'KEDDAR', 'MOHAMED ACYL', 'keddar.mohamed.acyl@etu.com', '14072004', 'M2', 'Informatique', '2004-07-14'),
(106, '232331572613', 'KEDIDAH', 'SAFOUANE ABDERRAHMANE', 'kedidah.safouane.abderrahmane@etu.com', '19032004', 'M1', 'Informatique', '2004-03-19'),
(107, '232331674415', 'KESSI', 'YAZID', 'kessi.yazid@etu.com', '18062007', 'M2', 'Informatique', '2007-06-18'),
(108, '212431546808', 'KHALFOUN', 'HADIL', 'khalfoun.hadil@etu.com', '03092004', 'M1', 'Informatique', '2004-09-03'),
(109, '232432511703', 'KHELIFA', 'MOHAMED BACHIR', 'khelifa.mohamed.bachir@etu.com', '26122004', 'L3', 'Informatique', '2004-12-26'),
(110, '242431575703', 'KHELIL', 'MERIEM', 'khelil.meriem@etu.com', '28112006', 'L2', 'Informatique', '2006-11-28'),
(111, '242431486807', 'KHELLAS', 'MARIA', 'khellas.maria@etu.com', '01082007', 'L2', 'Informatique', '2007-08-01'),
(112, '232331734515', 'KHETTAB', 'IMEDEDDINE', 'khettab.imededdine@etu.com', '14032005', 'M2', 'Informatique', '2005-03-14'),
(113, '242431431503', 'LAGRAA', 'ABDERRAHMANE', 'lagraa.abderrahmane@etu.com', '31032007', 'M1', 'Informatique', '2007-03-31'),
(114, '242431454303', 'LAIB', 'ABD EL DJALIL', 'laib.abd.el.djalil@etu.com', '19082004', 'L1', 'Informatique', '2004-08-19'),
(115, '232331532706', 'LAIDI', 'RACIM', 'laidi.racim@etu.com', '06062005', 'L1', 'Informatique', '2005-06-06'),
(116, '242431577219', 'LAKEHAL', 'DEKRAH', 'lakehal.dekrah@etu.com', '03042005', 'L1', 'Informatique', '2005-04-03'),
(117, '222231412710', 'LAMARA', 'AYOUB', 'lamara.ayoub@etu.com', '25122005', 'L2', 'Informatique', '2005-12-25'),
(118, '242431618608', 'LAMARA', 'MELYNA', 'lamara.melyna@etu.com', '24022006', 'L2', 'Informatique', '2006-02-24'),
(119, '232331531201', 'LARBI', 'LINA', 'larbi.lina@etu.com', '23102004', 'M1', 'Informatique', '2004-10-23'),
(120, '242431386417', 'LASLEDJ', 'NOURA', 'lasledj.noura@etu.com', '07082005', 'M2', 'Informatique', '2005-08-07'),
(121, '232331639705', 'LOUCIF', 'AISSA', 'loucif.aissa@etu.com', '25072005', 'L1', 'Informatique', '2005-07-25'),
(122, '232431844615', 'MADI', 'ZAKARIA', 'madi.zakaria@etu.com', '10012007', 'M1', 'Informatique', '2007-01-10'),
(123, '242431441601', 'MADIOU', 'SALEM', 'madiou.salem@etu.com', '12062006', 'M1', 'Informatique', '2006-06-12'),
(124, '23239DZA2098', 'MADJENE', 'MALAK', 'madjene.malak@etu.com', '26022007', 'M2', 'Informatique', '2007-02-26'),
(125, '242431579806', 'MAHALELAINE', 'SOFIANE AYOUB AYMEN', 'mahalelaine.sofiane.ayoub.aymen@etu.com', '09062004', 'M1', 'Informatique', '2004-06-09'),
(126, '242431475712', 'MAHDI', 'MELINA', 'mahdi.melina@etu.com', '22092004', 'M2', 'Informatique', '2004-09-22'),
(127, '232331717713', 'MAHDI', 'MOHAMED NAZIM', 'mahdi.mohamed.nazim@etu.com', '23042006', 'L3', 'Informatique', '2006-04-23'),
(128, '232431549320', 'MAHROUG', 'MARYA', 'mahroug.marya@etu.com', '18052005', 'M2', 'Informatique', '2005-05-18'),
(129, '232331503216', 'MAMMERI', 'YASMINE', 'mammeri.yasmine@etu.com', '19122007', 'L1', 'Informatique', '2007-12-19'),
(130, '242431562616', 'MAOUCHE', 'MOHAMED RAFIK', 'maouche.mohamed.rafik@etu.com', '11092007', 'L1', 'Informatique', '2007-09-11'),
(131, '232331602210', 'MECHAI', 'OUIAM', 'mechai.ouiam@etu.com', '02082006', 'M2', 'Informatique', '2006-08-02'),
(132, '242431559810', 'MEDDOUR', 'IMENE', 'meddour.imene@etu.com', '04112005', 'L3', 'Informatique', '2005-11-04'),
(133, '232331532312', 'MEDJAHED', 'RYMA', 'medjahed.ryma@etu.com', '17062005', 'L3', 'Informatique', '2005-06-17'),
(134, '242431777714', 'MEDJDOUBI', 'NOUR EL ISLAM', 'medjdoubi.nour.el.islam@etu.com', '09102005', 'L1', 'Informatique', '2005-10-09'),
(135, '212131040805', 'MEFTAH', 'ANFEL', 'meftah.anfel@etu.com', '24062004', 'L3', 'Informatique', '2004-06-24'),
(136, '232331431614', 'MEKDAM', 'MOHAMED IDIR', 'mekdam.mohamed.idir@etu.com', '30012005', 'M1', 'Informatique', '2005-01-30'),
(137, '242431431613', 'MEKKI', 'FATIMA ZAHRA', 'mekki.fatima.zahra@etu.com', '21122007', 'L2', 'Informatique', '2007-12-21'),
(138, '242431731319', 'MENIA', 'YOUCEF', 'menia.youcef@etu.com', '13082004', 'M1', 'Informatique', '2004-08-13'),
(139, '242431591407', 'MERAR', 'IKRAM', 'merar.ikram@etu.com', '01032007', 'L1', 'Informatique', '2007-03-01'),
(140, '242431622106', 'MESSAOUDI', 'WASSIM', 'messaoudi.wassim@etu.com', '22122005', 'L3', 'Informatique', '2005-12-22'),
(141, '242431434209', 'MEZIANI', 'ABD RAOUF', 'meziani.abd.raouf@etu.com', '20052004', 'M2', 'Informatique', '2004-05-20'),
(142, '242431666406', 'MEZIANI', 'SERINE MELISSA', 'meziani.serine.melissa@etu.com', '30122007', 'L2', 'Informatique', '2007-12-30'),
(143, '222231498417', 'MOKHTARI', 'ABDERRAHMAN', 'mokhtari.abderrahman@etu.com', '30102006', 'M2', 'Informatique', '2006-10-30'),
(144, '212131087391', 'MOKNINE', 'ALI', 'moknine.ali@etu.com', '03032006', 'L1', 'Informatique', '2006-03-03'),
(145, '232331674811', 'MOSTEFA', 'HOCINE MOHAMED', 'mostefa.hocine.mohamed@etu.com', '08052006', 'L3', 'Informatique', '2006-05-08'),
(146, '232431861119', 'MOUSSOUS', 'SARAH CHYRAZ', 'moussous.sarah.chyraz@etu.com', '02042005', 'M2', 'Informatique', '2005-04-02'),
(147, '232431535911', 'MOUZAOUI', 'KENZA', 'mouzaoui.kenza@etu.com', '16032007', 'M2', 'Informatique', '2007-03-16'),
(148, '242431618418', 'NAIMI', 'IYAD MUSTAPHA', 'naimi.iyad.mustapha@etu.com', '11042004', 'L2', 'Informatique', '2004-04-11'),
(149, '242439340418', 'NASRI', 'ANES ZAKARIA', 'nasri.anes.zakaria@etu.com', '07102007', 'L2', 'Informatique', '2007-10-07'),
(150, '242431367805', 'NEDIR', 'AHMED BAHA EDDINE', 'nedir.ahmed.baha.eddine@etu.com', '01012006', 'L3', 'Informatique', '2006-01-01'),
(151, '232331032114', 'NID', 'SOUHEIL', 'nid.souheil@etu.com', '20092006', 'L2', 'Informatique', '2006-09-20'),
(152, '242431398806', 'OUAREZKI', 'HICHEM', 'ouarezki.hichem@etu.com', '05082007', 'M2', 'Informatique', '2007-08-05'),
(153, '242431621819', 'OUFERHAT', 'MEHDI', 'ouferhat.mehdi@etu.com', '24102005', 'M2', 'Informatique', '2005-10-24'),
(154, '232331595914', 'OULDEDINE', 'CHAIMA', 'ouldedine.chaima@etu.com', '13042006', 'L1', 'Informatique', '2006-04-13'),
(155, '232431531515', 'RABEHI', 'CELINA', 'rabehi.celina@etu.com', '22122005', 'M2', 'Informatique', '2005-12-22'),
(156, '232331430814', 'RAMDANI', 'DOUAA HIBAT ELLAH', 'ramdani.douaa.hibat.ellah@etu.com', '11012007', 'L3', 'Informatique', '2007-01-11'),
(157, '242431422801', 'RAMOUL', 'MERIEM', 'ramoul.meriem@etu.com', '22032005', 'M1', 'Informatique', '2005-03-22'),
(158, '242431383508', 'REMRAM', 'AHMED ELAMINE', 'remram.ahmed.elamine@etu.com', '07012005', 'L1', 'Informatique', '2005-01-07'),
(159, '232431859120', 'RETIM', 'ABDALLAH', 'retim.abdallah@etu.com', '09062005', 'L1', 'Informatique', '2005-06-09'),
(160, '242431624912', 'REZKI', 'RIAD', 'rezki.riad@etu.com', '18022004', 'L3', 'Informatique', '2004-02-18'),
(161, '232433341813', 'ROUIBAH', 'AMINA', 'rouibah.amina@etu.com', '07052004', 'L3', 'Informatique', '2004-05-07'),
(162, '232331698506', 'SAADI', 'ISLEM', 'saadi.islem@etu.com', '07052005', 'L2', 'Informatique', '2005-05-07'),
(163, '242431370913', 'SAIDANI', 'MOHAMED DHIAEDDINE', 'saidani.mohamed.dhiaeddine@etu.com', '09092005', 'L1', 'Informatique', '2005-09-09'),
(164, '232431526712', 'SBAI', 'AIMEN ABDELOUAHID', 'sbai.aimen.abdelouahid@etu.com', '30052004', 'L2', 'Informatique', '2004-05-30'),
(165, '242431601409', 'SEDAOUI', 'YOUNES MEHDI', 'sedaoui.younes.mehdi@etu.com', '25122004', 'M2', 'Informatique', '2004-12-25'),
(166, '242431696012', 'SELAMA', 'WASSIM', 'selama.wassim@etu.com', '08092007', 'L1', 'Informatique', '2007-09-08'),
(167, '242431621604', 'SEMMAR', 'MOHAMED RACIM', 'semmar.mohamed.racim@etu.com', '28062007', 'L1', 'Informatique', '2007-06-28'),
(168, '242431423801', 'SERAY', 'IMENE', 'seray.imene@etu.com', '24052006', 'M1', 'Informatique', '2006-05-24'),
(169, '242431680409', 'SKENDER', 'NEWFEL', 'skender.newfel@etu.com', '30062005', 'L1', 'Informatique', '2005-06-30'),
(170, '232331659203', 'SLIMANI', 'ANIS', 'slimani.anis@etu.com', '19042004', 'M2', 'Informatique', '2004-04-19'),
(171, '242431461919', 'SLIMANI', 'IMAD', 'slimani.imad@etu.com', '03012005', 'L2', 'Informatique', '2005-01-03'),
(172, '232331597818', 'SOUFI', 'MOUDJIB EL RAHMANE', 'soufi.moudjib.el.rahmane@etu.com', '24022004', 'L2', 'Informatique', '2004-02-24'),
(173, '232331500812', 'SOUIDI', 'ICHRAK', 'souidi.ichrak@etu.com', '17092005', 'M1', 'Informatique', '2005-09-17'),
(174, '232332212801', 'TAKRATI', 'ABDEL MOUMENE', 'takrati.abdel.moumene@etu.com', '13022004', 'M2', 'Informatique', '2004-02-13'),
(175, '242431572917', 'TAS', 'ISLAM', 'tas.islam@etu.com', '14062007', 'L2', 'Informatique', '2007-06-14'),
(176, '242431624311', 'TATA', 'ANES', 'tata.anes@etu.com', '27112004', 'L3', 'Informatique', '2004-11-27'),
(177, '242431596506', 'TAYEB', 'NACIM', 'tayeb.nacim@etu.com', '07032006', 'M2', 'Informatique', '2006-03-07'),
(178, '232431845311', 'TEHAR', 'SAMI AYOUB', 'tehar.sami.ayoub@etu.com', '11032004', 'M2', 'Informatique', '2004-03-11'),
(179, '242431722303', 'TEMAM', 'MOHAMED DJAOUED', 'temam.mohamed.djaoued@etu.com', '29052006', 'M1', 'Informatique', '2006-05-29'),
(180, '232331734201', 'TEMLALI', 'OUSSAMA', 'temlali.oussama@etu.com', '21062007', 'L2', 'Informatique', '2007-06-21'),
(181, '242431680215', 'TOUAT', 'MOHAMED ADEM AYOUB', 'touat.mohamed.adem.ayoub@etu.com', '19022006', 'M2', 'Informatique', '2006-02-19'),
(182, '242431730516', 'TSAMDA', 'NESSRINE', 'tsamda.nessrine@etu.com', '08042004', 'L2', 'Informatique', '2004-04-08'),
(183, '242435427010', 'YESSAD', 'ABDELHAK', 'yessad.abdelhak@etu.com', '07122006', 'L3', 'Informatique', '2006-12-07'),
(184, '232331338807', 'ZAHAF', 'ABD ELRAHMAN', 'zahaf.abd.elrahman@etu.com', '13112005', 'M1', 'Informatique', '2005-11-13'),
(185, '232331394803', 'ZAHED', 'RAYAN', 'zahed.rayan@etu.com', '17072004', 'L3', 'Informatique', '2004-07-17'),
(186, '232431534320', 'ZEGHDANE', 'ABDENOUR', 'zeghdane.abdenour@etu.com', '08022005', 'M1', 'Informatique', '2005-02-08'),
(187, '242431748813', 'ZERAIA', 'MAYA', 'zeraia.maya@etu.com', '26112007', 'M2', 'Informatique', '2007-11-26'),
(188, '232331481012', 'ZERGOUN', 'ILYES', 'zergoun.ilyes@etu.com', '15032004', 'M1', 'Informatique', '2004-03-15'),
(189, '222431858709', 'ZERGUI', 'RITADJE', 'zergui.ritadje@etu.com', '22042005', 'L1', 'Informatique', '2005-04-22'),
(190, '242431680417', 'ZERKOUK', 'WALID', 'zerkouk.walid@etu.com', '04122005', 'L2', 'Informatique', '2005-12-04'),
(191, '242431614911', 'ZERTIT', 'RABAH HICHEM', 'zertit.rabah.hichem@etu.com', '17092005', 'L2', 'Informatique', '2005-09-17'),
(192, '232431847516', 'ZIANE', 'DAMIA FARIEL', 'ziane.damia.fariel@etu.com', '14102006', 'L1', 'Informatique', '2006-10-14'),
(193, '232331414107', 'ZIGADI', 'YACINE', 'zigadi.yacine@etu.com', '19102004', 'L3', 'Informatique', '2004-10-19'),
(194, '232335330411', 'ZIGHED', 'IMEN', 'zighed.imen@etu.com', '20082007', 'L1', 'Informatique', '2007-08-20'),
(195, '232331650909', 'ZITOUNI', 'SABER', 'zitouni.saber@etu.com', '14102007', 'M2', 'Informatique', '2007-10-14');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `nom_module` varchar(20) NOT NULL,
  `coefficient` int(11) NOT NULL,
  `enseignant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `modules`
--

INSERT INTO `modules` (`id`, `nom_module`, `coefficient`, `enseignant_id`) VALUES
(1, 'pweb', 2, 2),
(2, 'sys', 3, 3),
(3, 'archi', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `etudiant_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `note` decimal(4,2) NOT NULL,
  `session` varchar(20) NOT NULL DEFAULT 'normale'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_modules_enseignant` (`enseignant_id`);

--
-- Index pour la table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notes_etudiant` (`etudiant_id`),
  ADD KEY `fk_notes_module` (`module_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT pour la table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `fk_modules_enseignant` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`id`);

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `fk_notes_etudiant` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `fk_notes_module` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
