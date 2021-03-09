-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 05:42 PM
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
(9, NULL, 'Aksesuar', 'aksesuar', '2021-03-08 18:27:33', '2021-03-08 18:27:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_urun`
--

CREATE TABLE `kategori_urun` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `urun_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kullanici`
--

INSERT INTO `kullanici` (`id`, `adsoyad`, `email`, `sifre`, `aktivasyon_anahtari`, `aktif_mi`, `remember_token`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(18, 'Əzməmməd Qasımov', 'ezmemmed@yahoo.com', '$2y$10$HCLr6ne1.o3ytad6hOpaO.Z1wkr554yeubNDVxfjLLQqqRzi1NNWq', NULL, 1, 'pDc3KRozE3gMwd6RA8qAikosQJmq1YUqRWVuEMr0K9l6bYGRJ2ErOLhIxxQ0', '2021-03-08 17:53:59', '2021-03-09 16:32:45', NULL);

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
(24, '2021_03_04_172737_create_kullanici_table', 1);

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
-- Table structure for table `urun`
--

CREATE TABLE `urun` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urun_adi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiyati` decimal(6,3) NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `olusturulma_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `guncelleme_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `silinme_tarihi` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urun`
--

INSERT INTO `urun` (`id`, `slug`, `urun_adi`, `fiyati`, `aciklama`, `olusturulma_tarihi`, `guncelleme_tarihi`, `silinme_tarihi`) VALUES
(1, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:06', '2021-03-08 14:29:06', NULL),
(2, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:06', '2021-03-08 14:29:06', NULL),
(3, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(4, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(5, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(6, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(7, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(8, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(9, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(10, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(11, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(12, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(13, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(14, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:07', '2021-03-08 14:29:07', NULL),
(15, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(16, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(17, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(18, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(19, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(20, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(21, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:08', '2021-03-08 14:29:08', NULL),
(22, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(23, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(24, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(25, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(26, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(27, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(28, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(29, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL),
(30, 'laravel-8-framework', 'Something', '3.210', 'Lorem Ipsum is simply dummy text of\n                the printing and typesetting industry. Lorem', '2021-03-08 14:29:09', '2021-03-08 14:29:09', NULL);

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
  `goster_indirimli` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `urundetay`
--

INSERT INTO `urundetay` (`id`, `urun_id`, `goster_slider`, `goster_gunun_firsati`, `goster_one_cikan`, `goster_cok_satan`, `goster_indirimli`) VALUES
(1, 1, 0, 0, 0, 0, 1),
(2, 2, 1, 1, 0, 0, 1),
(3, 3, 1, 0, 1, 0, 0),
(4, 4, 0, 0, 0, 0, 1),
(5, 5, 0, 1, 1, 0, 0),
(6, 6, 1, 0, 0, 1, 1),
(7, 7, 0, 0, 1, 0, 0),
(8, 8, 0, 1, 0, 0, 1),
(9, 9, 1, 0, 1, 0, 1),
(10, 10, 1, 0, 0, 1, 0),
(11, 11, 0, 0, 0, 1, 0),
(12, 12, 1, 0, 0, 0, 1),
(13, 13, 0, 0, 1, 0, 0),
(14, 14, 1, 0, 0, 0, 1),
(15, 15, 1, 0, 1, 0, 1),
(16, 16, 1, 1, 1, 1, 1),
(17, 17, 0, 1, 1, 1, 0),
(18, 18, 0, 1, 0, 1, 0),
(19, 19, 0, 1, 1, 1, 0),
(20, 20, 1, 1, 0, 0, 0),
(21, 21, 0, 1, 1, 0, 1),
(22, 22, 1, 1, 1, 1, 0),
(23, 23, 1, 1, 0, 1, 0),
(24, 24, 1, 1, 0, 1, 0),
(25, 25, 1, 1, 1, 1, 1),
(26, 26, 1, 1, 1, 1, 0),
(27, 27, 0, 1, 0, 1, 1),
(28, 28, 0, 1, 0, 0, 1),
(29, 29, 0, 1, 1, 1, 1),
(30, 30, 0, 0, 1, 0, 1);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kategori_urun`
--
ALTER TABLE `kategori_urun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `urun`
--
ALTER TABLE `urun`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `urundetay`
--
ALTER TABLE `urundetay`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- Constraints for table `urundetay`
--
ALTER TABLE `urundetay`
  ADD CONSTRAINT `urundetay_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urun` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
