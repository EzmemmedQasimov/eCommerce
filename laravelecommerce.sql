-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2021 at 09:36 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `ayar`
--

CREATE TABLE `ayar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `anahtar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deger` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ayar`
--

INSERT INTO `ayar` (`id`, `anahtar`, `deger`) VALUES
(1, 'anasayfa_slider_urun_adet', '3'),
(2, 'anasayfa_liste_urun_adet', '6');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `ust_id` int(11) DEFAULT NULL,
  `kategori_adi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `ust_id`, `kategori_adi`, `slug`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, NULL, 'Elektronik', 'elektronik', '2021-03-08 18:27:32', '2021-03-08 18:27:32', NULL),
(2, 1, 'Bilgisayar/Tablet', 'bilgisayar-tablet', '2021-03-08 18:27:32', '2021-03-08 18:27:32', NULL),
(3, 1, 'Telefon', 'telefon', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(4, 1, 'TV ve Ses Sistemleri', 'tv-ses-sistemleri', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(5, NULL, 'Kitap', 'kitap', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(6, 5, 'Çocuk', 'cocuk', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(7, 5, 'Dünya', 'dunya', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(8, NULL, 'Məişət', 'meiset', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL),
(9, NULL, 'Aksesuar', 'aksesuar', '2021-03-08 18:27:33', '2021-03-24 21:28:30', NULL),
(10, NULL, 'Elektronik Alt kategorisi', 'elektronik-alt-kategori', '2021-03-24 14:51:24', '2021-03-24 21:28:30', NULL),
(11, NULL, 'Elektronik Alt kategorisi', 'elektronik-alt-kategorisi', '2021-03-24 15:13:01', '2021-03-24 17:34:49', '2021-03-24 17:34:49'),
(12, NULL, 'Elektronik Alt kategorisi1', 'elektronik-alt-kategorisi1', '2021-03-24 17:14:21', '2021-03-24 17:22:20', '2021-03-24 17:22:20'),
(13, 2, 'Elektronik Alt kategorisi11', 'elektronik-alt-kategorisi11', '2021-03-25 13:45:05', '2021-03-25 13:45:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_urun`
--

CREATE TABLE `kategori_urun` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `urun_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori_urun`
--

INSERT INTO `kategori_urun` (`id`, `kategori_id`, `urun_id`) VALUES
(9, 1, 8),
(10, 3, 8),
(13, 1, 10),
(14, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `kullanici`
--

CREATE TABLE `kullanici` (
  `id` int(10) UNSIGNED NOT NULL,
  `adsoyad` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aktivasyon_anahtari` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktif_mi` tinyint(1) NOT NULL DEFAULT 0,
  `yonetici_mi` tinyint(1) DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kullanici`
--

INSERT INTO `kullanici` (`id`, `adsoyad`, `email`, `sifre`, `aktivasyon_anahtari`, `aktif_mi`, `yonetici_mi`, `remember_token`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 'Əzməmməd Qasımov', 'ezmemmed@yahoo.com', '$2y$10$0e3rNGMLejMTHJ1iY5pfbe/zEL9MU7MnfhN1608Lhsb4s8YlZDqbm', NULL, 1, 1, '5wN8Bl7k6aBgNzqtlkHgKeHZ9Hr1JGR77mIQoGbsppplUHBNUwJ5YK0tYitm', '2021-03-23 13:59:34', '2021-03-27 20:13:21', NULL),
(2, 'Tyrel Bins', 'cecile.ondricka@example.com', '$2y$10$Jc/a8FCML7eVuZ7.RQAOKeoaK47VhhTCkF40NMCSVD86XnYc.eBeG', NULL, 1, 0, NULL, '2021-03-23 13:59:36', '2021-03-27 13:57:09', '2021-03-27 13:57:09'),
(3, 'Vicente Haag', 'mjacobson@example.net', '$2y$10$LNcRNCrbBlbOLCyjaGvmHewWOVkWeYgxwnuQ26WbDl/zOuUNPys6m', NULL, 1, 0, NULL, '2021-03-23 13:59:36', '2021-03-27 14:11:40', '2021-03-27 14:11:40'),
(4, 'Susana Schuppe', 'laila.willms@example.com', '$2y$10$DmlMLBt.R1kZJk4BYPoQh.3xbFmg33ImVKm16GQma8O6KW.GnCWWu', NULL, 1, 0, NULL, '2021-03-23 13:59:36', '2021-03-27 14:11:56', '2021-03-27 14:11:56'),
(5, 'Lysanne Waters', 'demario40@example.net', '$2y$10$qTlthhJrkQXqS4Nh09/BIOKJMpp62EO6lE3LJPlOwb.wmL5/3u7B2', NULL, 1, 0, NULL, '2021-03-23 13:59:36', '2021-03-23 13:59:36', NULL),
(6, 'Mr. Jalen Jaskolski DDS', 'kcummings@example.net', '$2y$10$TIk1pP1cpRz/H78LzI1jXeRziVtlcrNQYai6va/SFamq6Vbak6qei', NULL, 1, 0, NULL, '2021-03-23 13:59:36', '2021-03-23 13:59:36', NULL),
(7, 'Garnet Jacobs', 'zbrakus@example.com', '$2y$10$EkMdmUiVWSONew7yFWLcv.AX.R/x4LCpJr5yqP87OUjo7LNGS46Q6', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(8, 'Camille Purdy', 'kovacek.angelina@example.net', '$2y$10$6AQzvECyIFRxbsZheB5F7eWRep3DpFmwdrzbwJjqZji2WD.QcGIye', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(9, 'Cassidy Gottlieb DDS', 'metz.olaf@example.net', '$2y$10$97.mbjl7LW7ovkPwGNnqeubUBT/xH9MGq1yfTN6GuH5P4/pkG2vR6', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(10, 'Dr. Lenora Bechtelar III', 'nbode@example.com', '$2y$10$6fCLTOnfTRSwZGdRkh0mZukvpXU.54sOPpa9UV8wNysdlb9.H3TyC', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(11, 'Guy Ziemann', 'veda.berge@example.org', '$2y$10$l1u717sL5R2mXiLjeFxpe.gKx585SionPRwf4QbUq2RHuw3UZbDqe', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-27 13:58:05', '2021-03-27 13:58:05'),
(12, 'Prof. Elisa Tremblay PhD', 'walter.aric@example.org', '$2y$10$kUVmJldrj5g1SsY0G2bXuOstH2GOVXCo/kt7Q3Aku1DqjKQysKm/y', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(13, 'Nella Marks', 'johnson.dannie@example.net', '$2y$10$38sxZKH/E9jEF8ws7A1ruuTnfcIQSxgKhWzLYKOZhqXrdblvIgw52', NULL, 1, 0, NULL, '2021-03-23 13:59:37', '2021-03-23 13:59:37', NULL),
(14, 'Wilbert Considine', 'heaney.isabelle@example.org', '$2y$10$JDT7DXWAwHDo4YEHiabOLeh9GogmX./wFWvF856Oxn4aZkD21/naq', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(15, 'Mariano Boehm', 'evert.buckridge@example.net', '$2y$10$RrYeWkVcQokfkl4DUvjh4.Clp4JEm/S1m6xUCq0MkzHJBE/aHFyyW', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(16, 'Lula Schumm', 'greenholt.sophie@example.net', '$2y$10$O2Bzc1lW/idhIhzCV6HAX.pJyQIsy8t.8bInjiTTvt3NZzKTSITh2', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(17, 'Miss Nikita Gutkowski', 'kiarra.reinger@example.com', '$2y$10$XI7Nhip3w4H7cEfqJwvMYebUJGCk3C.2vymyLFKnO7o7pk0RjLDay', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(18, 'Greta Cole', 'jacobi.margarita@example.net', '$2y$10$8XwBTmkf5nmObgD5kn2ayODUOLjtg2h2rjd1lPgZRNP.C1QhND/Ve', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(19, 'Thalia Auer', 'bernier.gerardo@example.com', '$2y$10$LjXmbmr6A348JvcQno9.4OwGCrmoKdpQ..hAFRyjBIvOdzHeqVzR6', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(20, 'Mrs. Aliya Yundt', 'annamarie17@example.org', '$2y$10$Kk/Zmaw057QeCmAXi34FAef7gGlmq3fuwctoZleLNqYikIWPo8uyS', NULL, 1, 0, NULL, '2021-03-23 13:59:38', '2021-03-23 13:59:38', NULL),
(21, 'Keely Little', 'carole.kulas@example.org', '$2y$10$k.ZYHmUljxPQ9Zm79CEIu.wq1mp09seCsPpcA7NarHJDdDpJqIp8.', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(22, 'Prof. Milton Barton II', 'katelin.stoltenberg@example.net', '$2y$10$MXWgwqiTxXDjZxyg9FU3IeHX5Nla8D90rz.ZR3jlboIgSX4tuDQga', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(23, 'Miss Kailey Prosacco', 'alexander.miller@example.org', '$2y$10$5ibvMy8JyIM625bY/pkNBOGcxKus//NeK/TU5Y8kTS3eXBD7.2ZQW', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(24, 'Marshall Kutch IV', 'ihalvorson@example.org', '$2y$10$sFx2J0hpqjI2TVsxVGbIUuRgUX7LXxH2w84SFiKy0roPAk/L2MseK', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(25, 'Jed Altenwerth', 'istark@example.com', '$2y$10$G4ygwgPDLy3QyxUSjBNEwuaaxO45gjexwJdvc3np6lOVovYQIwWKu', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(26, 'Immanuel Murray', 'eritchie@example.org', '$2y$10$wkgo7Pae25NTUdGClfpo6OAilRqbBrKyvhmwzLKEQx2GCuxNVAZ8C', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(27, 'Rodolfo Cummerata', 'german.russel@example.org', '$2y$10$djx2NcpXap4PfBzxcEBq6uuUrPOOXlFu7MPeAPoa6CnuReOaUj7x6', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(28, 'Dr. Tyshawn Haley', 'wgleichner@example.com', '$2y$10$JsD.VfNpsoXg8GRnxdUvOu/Fbieaxt9wvVvSGzdyjCk42niQghmc.', NULL, 1, 0, NULL, '2021-03-23 13:59:39', '2021-03-23 13:59:39', NULL),
(29, 'Dr. Ali Strosin', 'bwhite@example.net', '$2y$10$bfoTbTLxbrarplzaQyDA8uWTbSiLRoNYWlp/cwWQyQ/65W0BuhXDa', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(30, 'Raleigh Rolfson', 'claire.glover@example.org', '$2y$10$JDI7ByPhgTuwbocio527Bek3GFNMthomsZzPjnGObx4y5CzORzQfi', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(31, 'Gerard D\'Amore Jr.', 'luciano.johnson@example.net', '$2y$10$qKGM4B2XV9qn9qDWlRShSuRwsHTxjNjlYPWHwRBLTIbbvbLJSgjPq', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(32, 'Arjun Smitham', 'raegan36@example.net', '$2y$10$ZNnmsKohcy2MVo38ey8vs.vTCN6/.dOjM.A92MWEpN2p/JQFP3/fq', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(33, 'Prof. Heath O\'Conner', 'jvonrueden@example.org', '$2y$10$Yt7fxNV58KF.WwOGbLKJa.fmvtO7YZBsYP6T6d2JlDZZPMikGrfAK', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(34, 'Vernon Stokes', 'jack.shields@example.org', '$2y$10$P5DuJSqGNbHtFylPdN7xeOAvQhaCz1CJBruWvWZGda727idyGLw2y', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(35, 'Prof. Ramiro Beier', 'toby19@example.net', '$2y$10$FYa8umTwRO8PVGkJkAbYheo1D5YLdbchdo/F1G/E/6XDykakYBGke', NULL, 1, 0, NULL, '2021-03-23 13:59:40', '2021-03-23 13:59:40', NULL),
(36, 'Gianni Stroman', 'breanna17@example.net', '$2y$10$AZAls3A4cfC0SVVi7VAd.e5dlZx4b2q4y6JGCpKaTF1yhvdMUo/g6', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(37, 'Peyton Armstrong', 'wpfannerstill@example.org', '$2y$10$HUE0CQo1WDfzbxACDC7NXeirJTgbh9465kGSCvZpjDAH2EKfpKlki', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(38, 'Dr. Marcelino Thompson', 'jkiehn@example.com', '$2y$10$KsuSgDn29Zz4yD1NYk8VMuwVY0lXCZhywRyPeHrHdHyFJPJQNlxMG', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(39, 'Wade Stamm', 'evans16@example.net', '$2y$10$3uYdXTvX986VMTS/qqbVbevQnEIObOcnlRmSSQo8e3aPc6FAX7k6O', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(40, 'Myrtice Stracke', 'ryder.dietrich@example.com', '$2y$10$iMTBrwE3rXTq9qBFyt1V6OvhNG0EM76HFf0w6RDbUTMBOj4V4vVSG', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(41, 'Octavia Kshlerin Jr.', 'ardella32@example.com', '$2y$10$aap289FbK0hlLfW2WUD/ruKa/HiyPPF5os1qxB5ua8V.i9pGjbx5K', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(42, 'Mrs. Emmalee Kuhn', 'abode@example.net', '$2y$10$o5kMm.PIiplSJcot0PMnrOmbhx2uLzHP2l7f25/eEbnrBVbZa1po6', NULL, 1, 0, NULL, '2021-03-23 13:59:41', '2021-03-23 13:59:41', NULL),
(43, 'Annette Schinner', 'fhuel@example.org', '$2y$10$8.1VwYnuRrzwuMPhnWjMHO7p.CZWn74Mnt3xgb.FkFRyymnJ3GCpa', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(44, 'Oswald Klein V', 'alexanne.cole@example.com', '$2y$10$X6pHHNegEl0.QVCl0kgTlur4BnRWf88vBVCmvfYVZYpGcuak8iVIm', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(45, 'Verlie Witting', 'randall.hermann@example.org', '$2y$10$uchflTfjYnXi9kA022RhROy/OfO2YPp4xwz2LJJ/MFLKCrVu6UMrm', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(46, 'Edmond Leuschke I', 'alize57@example.net', '$2y$10$7HtS2ExssaBb.FgcBIF.Dea9v3bG0.AYdxYOpYIudifoMu8YZ95B6', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(47, 'Clarabelle Torp', 'zander66@example.net', '$2y$10$.SaR4S05D4AmPqNJELvSZ.HwE3F6P8suzhrGzCEAvYwQdqXXZUPAi', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(48, 'Marion Hodkiewicz', 'rgleason@example.com', '$2y$10$N7CZd25CQILC/Ckqd5Wgsutbs2to/HNRwgYv4UCphmwJ7jbVRaeh.', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(49, 'Dessie Pouros', 'tre65@example.com', '$2y$10$/nRosLkoPOKdpKTw3mQmVOC0WaVajV/82JL9x9aCn1p2C1kMc3e5a', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(50, 'Noel Dietrich', 'marilyne.goyette@example.net', '$2y$10$YirXq03a.pIGXECppUTfNugmGwmfcQAN7TiBQlzNh7.Lb.fsXagjW', NULL, 1, 0, NULL, '2021-03-23 13:59:42', '2021-03-23 13:59:42', NULL),
(51, 'Miss Etha Swaniawski', 'watson.upton@example.net', '$2y$10$mQfu2y/h2yqy9rMLrgdrs.pMnLl/4TpPqsTNI.MeUTKK4jsZpGzNe', NULL, 1, 0, NULL, '2021-03-23 13:59:43', '2021-03-23 13:59:43', NULL),
(52, 'Nihat Novruzov', 'nihat@gmail.com', '$2y$10$at9Tpwwj4nytqqL3aQnVZeBK.5zEAZT9Y9cFggi2qL03FEyGTFQ9S', NULL, 1, 1, 'hjnjGA4tCaJaj8B7HZRnQEcQMETFcYOKqPOMdETJf9acMn610UBroMmoEF7r', '2021-03-27 13:50:11', '2021-03-27 17:50:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2021_02_28_201946_create_kategori_tabel', 1),
(21, '2021_03_02_183545_create_urun_table', 1),
(22, '2021_03_02_200949_create_kategori_urun_table', 1),
(23, '2021_03_03_185430_create_urun_detay_table', 1),
(24, '2021_03_04_172737_create_kullanici_table', 1),
(25, '2021_03_09_190056_create_sepet_table', 2),
(26, '2021_03_09_191456_create_sepet_urun_table', 3),
(27, '2021_03_27_190458_create_ayar_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sepet`
--

CREATE TABLE `sepet` (
  `id` int(10) UNSIGNED NOT NULL,
  `kullanici_id` int(10) UNSIGNED NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sepet`
--

INSERT INTO `sepet` (`id`, `kullanici_id`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(6, 18, '2021-03-14 16:31:50', '2021-03-14 16:31:50', NULL),
(8, 1, '2021-03-23 15:02:30', '2021-03-23 15:02:30', NULL),
(9, 1, '2021-03-25 16:05:49', '2021-03-25 16:05:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sepet_urun`
--

CREATE TABLE `sepet_urun` (
  `id` int(10) UNSIGNED NOT NULL,
  `sepet_id` int(10) UNSIGNED NOT NULL,
  `urun_id` int(10) UNSIGNED NOT NULL,
  `adet` int(11) NOT NULL,
  `fiyati` decimal(5,2) NOT NULL,
  `durum` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sepet_urun`
--

INSERT INTO `sepet_urun` (`id`, `sepet_id`, `urun_id`, `adet`, `fiyati`, `durum`, `olusturma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(10, 6, 2, 4, '5.45', 'Beklemede', '2021-03-14 16:31:50', '2021-03-21 16:59:46', NULL),
(12, 9, 6, 2, '670.90', 'Beklemede', '2021-03-25 16:05:49', '2021-03-25 16:06:00', NULL),
(13, 9, 5, 2, '590.90', 'Beklemede', '2021-03-25 16:06:11', '2021-03-25 16:06:15', NULL),
(14, 8, 10, 3, '290.00', 'Beklemede', '2021-03-27 13:45:40', '2021-03-27 13:47:11', '2021-03-27 13:47:11'),
(15, 8, 9, 1, '290.00', 'Beklemede', '2021-03-27 13:45:57', '2021-03-27 13:47:17', '2021-03-27 13:47:17'),
(16, 8, 10, 1, '290.00', 'Beklemede', '2021-03-27 16:12:47', '2021-03-27 16:12:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `urun`
--

CREATE TABLE `urun` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urun_adi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyati` decimal(10,3) NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urun`
--

INSERT INTO `urun` (`id`, `slug`, `urun_adi`, `fiyati`, `aciklama`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 'laravel-8-framework', 'Something else', '5.334', 'Something else', '2021-03-12 14:36:59', '2021-03-27 14:47:59', '2021-03-27 14:47:59'),
(2, '1-laravel-8-framework', 'asdasdasdasd', '5.450', 'asdasdasdasd', '2021-03-12 14:38:39', '2021-03-25 16:01:08', '2021-03-25 16:01:08'),
(3, 'lorem-ipsim-ipsum', 'Lorem ipsum', '444.680', 'Lorem ipsum Lorem ipsumLorem ipsum', '2021-03-12 14:39:55', '2021-03-25 16:03:33', '2021-03-25 16:03:33'),
(4, '3-laravel-8-framework', '1Something', '7.620', '1m typesettingIp sum is stypeset tingimply dummy text of\n                the prit ypesetting nting and  industry. Lorem', '2021-03-12 14:40:32', '2021-03-25 16:01:17', '2021-03-25 16:01:17'),
(5, 'telefon-samsung-galaxy-a51', 'Telefon Samsung Galaxy A51', '590.900', 'Telefon Samsung Galaxy A51', '2021-03-25 14:05:04', '2021-03-27 14:53:35', '2021-03-27 14:53:35'),
(6, 'telefon-samsung-galaxy-a71', 'Telefon Samsung Galaxy A71', '670.900', 'Samsung galaxy a71', '2021-03-25 15:47:56', '2021-03-25 15:47:56', NULL),
(7, 'test321', 'Test321', '1234.000', 'Test321', '2021-03-26 14:10:12', '2021-03-27 14:52:29', '2021-03-27 14:52:29'),
(8, 'telefon-samsung-galaxy-a12', 'Telefon Samsung Galaxy A12', '290.000', 'Telefon Samsung Galaxy A12', '2021-03-26 15:22:11', '2021-03-26 15:22:11', NULL),
(9, 'telefon-samsung-galaxy-a1212', 'Telefon Samsung Galaxy A12', '290.000', 'Telefon Samsung Galaxy A12', '2021-03-26 15:22:34', '2021-03-27 14:52:41', '2021-03-27 14:52:41'),
(10, 'telefon-samsung-galaxy-a121212', 'Telefon Samsung Galaxy A12', '290.000', 'Telefon Samsung Galaxy A12', '2021-03-26 15:23:25', '2021-03-26 15:23:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `urundetay`
--

CREATE TABLE `urundetay` (
  `id` int(10) UNSIGNED NOT NULL,
  `urun_id` int(10) UNSIGNED NOT NULL,
  `goster_slider` tinyint(1) NOT NULL DEFAULT 0,
  `goster_gunun_firsati` tinyint(1) NOT NULL DEFAULT 0,
  `goster_one_cikan` tinyint(1) NOT NULL DEFAULT 0,
  `goster_cok_satan` tinyint(1) NOT NULL DEFAULT 0,
  `goster_indirimli` tinyint(1) NOT NULL DEFAULT 0,
  `urun_resmi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urundetay`
--

INSERT INTO `urundetay` (`id`, `urun_id`, `goster_slider`, `goster_gunun_firsati`, `goster_one_cikan`, `goster_cok_satan`, `goster_indirimli`, `urun_resmi`) VALUES
(1, 1, 0, 0, 0, 0, 1, '1-1616788086.jpg'),
(3, 3, 1, 1, 1, 1, 1, NULL),
(4, 4, 0, 0, 0, 0, 1, NULL),
(5, 5, 1, 1, 1, 1, 1, NULL),
(48, 6, 1, 1, 1, 0, 0, NULL),
(49, 7, 1, 1, 0, 0, 0, NULL),
(50, 8, 0, 1, 1, 0, 0, NULL),
(51, 9, 0, 1, 1, 0, 0, NULL),
(52, 10, 0, 1, 1, 0, 0, '10-1616787078.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_urun`
--
ALTER TABLE `kategori_urun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_urun_kategori_id_foreign` (`kategori_id`),
  ADD KEY `kategori_urun_urun_id_foreign` (`urun_id`);

--
-- Indexes for table `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sepet_kullanici_id_foreign` (`kullanici_id`);

--
-- Indexes for table `sepet_urun`
--
ALTER TABLE `sepet_urun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sepet_urun_sepet_id_foreign` (`sepet_id`),
  ADD KEY `sepet_urun_urun_id_foreign` (`urun_id`);

--
-- Indexes for table `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `urundetay`
--
ALTER TABLE `urundetay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urundetay_urun_id_unique` (`urun_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ayar`
--
ALTER TABLE `ayar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori_urun`
--
ALTER TABLE `kategori_urun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sepet_urun`
--
ALTER TABLE `sepet_urun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `urun`
--
ALTER TABLE `urun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `urundetay`
--
ALTER TABLE `urundetay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kategori_urun`
--
ALTER TABLE `kategori_urun`
  ADD CONSTRAINT `kategori_urun_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kategori_urun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sepet`
--
ALTER TABLE `sepet`
  ADD CONSTRAINT `sepet_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sepet_urun`
--
ALTER TABLE `sepet_urun`
  ADD CONSTRAINT `sepet_urun_sepet_id_foreign` FOREIGN KEY (`sepet_id`) REFERENCES `sepet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sepet_urun_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `urundetay`
--
ALTER TABLE `urundetay`
  ADD CONSTRAINT `urundetay_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
