-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 13, 2020 at 12:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cctapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `published_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `status`, `featured`, `created_at`, `updated_at`, `tags`, `published_date`) VALUES
(1, 0, 1, 'My First Blog Post', NULL, 'An example blog post', '<p>Matey yardarm topmast broadside nipper weigh anchor jack quarterdeck crow\'s nest rigging. Topgallant lateen sail line avast me gun Pirate Round strike colors bilge rat take a caulk. Jack six pounders spanker doubloon clipper spirits case shot hang the jib boatswain red ensign.</p>\n<p>Hornswaggle spanker spyglass Yellow Jack mutiny Arr lugger poop deck keel take a caulk. Quarter fire ship run a shot across the bow sheet log draft scallywag gally port skysail. Lugsail gangway draft pink piracy bilge Buccaneer heave to landlubber or just lubber Pieces of Eight.</p>', NULL, 'my-first-blog-post', 'A test blog post', 'PUBLISHED', 0, '2020-06-16 20:06:43', '2020-06-16 20:06:43', NULL, '2018-05-11 07:00:00'),
(2, 0, 1, 'My Second Blog Post', NULL, 'An example blog post', '<p>Matey yardarm topmast broadside nipper weigh anchor jack quarterdeck crow\'s nest rigging. Topgallant lateen sail line avast me gun Pirate Round strike colors bilge rat take a caulk. Jack six pounders spanker doubloon clipper spirits case shot hang the jib boatswain red ensign.</p>\n<p>Hornswaggle spanker spyglass Yellow Jack mutiny Arr lugger poop deck keel take a caulk. Quarter fire ship run a shot across the bow sheet log draft scallywag gally port skysail. Lugsail gangway draft pink piracy bilge Buccaneer heave to landlubber or just lubber Pieces of Eight.</p>', NULL, 'my-second-blog-post', 'A test blog post', 'PUBLISHED', 0, '2020-06-16 20:06:43', '2020-06-16 20:06:43', NULL, '2018-05-11 07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-06-16 20:06:43', '2020-06-16 20:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `ccts`
--

CREATE TABLE `ccts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` float DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ccts`
--

INSERT INTO `ccts` (`id`, `name`, `version`, `language`, `asset_path`, `tag`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'English V1', 1, 'English', 'cct/english/v1', NULL, NULL, '2020-08-13 06:04:47', '2020-08-13 06:04:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cct_collection_data`
--

CREATE TABLE `cct_collection_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `rt` int(6) DEFAULT NULL,
  `stimulus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_pressed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_part` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distractor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_index` int(6) DEFAULT NULL,
  `time_elapsed` int(6) DEFAULT NULL,
  `internal_node_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(6) DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_pi_id` int(6) DEFAULT NULL,
  `experiment_id` int(6) DEFAULT NULL,
  `experiment_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `cct_id` int(6) DEFAULT NULL,
  `cct_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cohort_id` int(6) DEFAULT NULL,
  `cohort_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_id` int(6) DEFAULT NULL,
  `participant_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_raw` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cct_collection_data`
--

INSERT INTO `cct_collection_data` (`id`, `rt`, `stimulus`, `button_pressed`, `trial_part`, `target`, `distractor`, `trial_type`, `trial_index`, `time_elapsed`, `internal_node_id`, `token`, `project_id`, `project_name`, `project_pi_id`, `experiment_id`, `experiment_name`, `note`, `cct_id`, `cct_version`, `cct_language`, `cct_name`, `cohort_id`, `cohort_name`, `participant_id`, `participant_identifier`, `participant_alias`, `correct`, `test_type`, `json_raw`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3797, 'storage/cct/english/v1/touch_horse.mp3', '0', 'test', 'horse', 'cow', 'audio-button-response', 1, 5623, '0.0-1.0-0.0', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'preview', '[{\"rt\":1814.2050000024028,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1823,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":3797.2000000008848,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":5623,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":7391,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":8395,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1103.8100000005215,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":9501,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":11107,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":12109,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1674.3900000001304,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":13784,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":14962,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":15966,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1346.2049999943702,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":17313,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"}]', '2020-08-12 23:52:23', NULL, NULL),
(2, 1104, 'storage/cct/english/v1/touch_cat.mp3', '0', 'test', 'cat', 'dog', 'audio-button-response', 4, 9501, '0.0-1.0-0.1', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'preview', '[{\"rt\":1814.2050000024028,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1823,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":3797.2000000008848,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":5623,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":7391,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":8395,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1103.8100000005215,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":9501,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":11107,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":12109,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1674.3900000001304,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":13784,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":14962,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":15966,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1346.2049999943702,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":17313,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"}]', '2020-08-12 23:52:23', NULL, NULL),
(3, 1674, 'storage/cct/english/v1/touch_banana.mp3', '0', 'test', 'banana', 'book', 'audio-button-response', 7, 13784, '0.0-1.0-0.2', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'preview', '[{\"rt\":1814.2050000024028,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1823,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":3797.2000000008848,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":5623,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":7391,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":8395,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1103.8100000005215,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":9501,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":11107,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":12109,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1674.3900000001304,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":13784,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":14962,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":15966,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"},{\"rt\":1346.2049999943702,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":17313,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"preview\"}]', '2020-08-12 23:52:23', NULL, NULL),
(4, 2380, 'storage/cct/english/v1/touch_horse.mp3', '1', 'test', 'horse', 'cow', 'audio-button-response', 1, 16123, '0.0-1.0-0.0', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '0', 'test', '[{\"rt\":13735.23999999452,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":13739,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2380.185000001802,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":16123,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":2,\"time_elapsed\":17125,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1582.68500000122,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":3,\"time_elapsed\":18710,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":4,\"time_elapsed\":19712,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1633.3849999937229,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":21347,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":22350,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":980.0450000038836,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":23330,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-12 23:53:04', NULL, NULL),
(5, 1583, 'storage/cct/english/v1/touch_cat.mp3', '1', 'test', 'cat', 'dog', 'audio-button-response', 3, 18710, '0.0-1.0-0.1', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '0', 'test', '[{\"rt\":13735.23999999452,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":13739,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2380.185000001802,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":16123,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":2,\"time_elapsed\":17125,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1582.68500000122,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":3,\"time_elapsed\":18710,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":4,\"time_elapsed\":19712,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1633.3849999937229,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":21347,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":22350,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":980.0450000038836,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":23330,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-12 23:53:04', NULL, NULL),
(6, 1633, 'storage/cct/english/v1/touch_banana.mp3', '1', 'test', 'banana', 'book', 'audio-button-response', 5, 21347, '0.0-1.0-0.2', 'c538a4eac572677be7854d8807117d6a', 2, 'EN Group1', 26, 3, 'EN Group1 : 2020812-235116', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '0', 'test', '[{\"rt\":13735.23999999452,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":13739,\"internal_node_id\":\"0.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2380.185000001802,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":16123,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":2,\"time_elapsed\":17125,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1582.68500000122,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":3,\"time_elapsed\":18710,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":4,\"time_elapsed\":19712,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1633.3849999937229,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":21347,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":22350,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":980.0450000038836,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":23330,\"internal_node_id\":\"0.0-2.0\",\"token\":\"c538a4eac572677be7854d8807117d6a\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"3\",\"experiment_name\":\"EN Group1 : 2020812-235116\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-12 23:53:04', NULL, NULL);
INSERT INTO `cct_collection_data` (`id`, `rt`, `stimulus`, `button_pressed`, `trial_part`, `target`, `distractor`, `trial_type`, `trial_index`, `time_elapsed`, `internal_node_id`, `token`, `project_id`, `project_name`, `project_pi_id`, `experiment_id`, `experiment_name`, `note`, `cct_id`, `cct_version`, `cct_language`, `cct_name`, `cohort_id`, `cohort_name`, `participant_id`, `participant_identifier`, `participant_alias`, `correct`, `test_type`, `json_raw`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 2700, 'storage/cct/english/v1/touch_horse.mp3', '0', 'test', 'horse', 'cow', 'audio-button-response', 1, 6361, '0.0-1.0-0.0', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'test', '[{\"rt\":3655.8699999877717,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":3659,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2700.1149999996414,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":6361,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":8105,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":9107,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2277.3050000105286,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":11387,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":5,\"time_elapsed\":12391,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2179.1449999873294,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":6,\"time_elapsed\":14572,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":15574,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1144.044999993639,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":8,\"time_elapsed\":16719,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-13 00:08:36', NULL, NULL),
(8, 2277, 'storage/cct/english/v1/touch_cat.mp3', '1', 'test', 'cat', 'dog', 'audio-button-response', 4, 11387, '0.0-1.0-0.1', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '0', 'test', '[{\"rt\":3655.8699999877717,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":3659,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2700.1149999996414,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":6361,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":8105,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":9107,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2277.3050000105286,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":11387,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":5,\"time_elapsed\":12391,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2179.1449999873294,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":6,\"time_elapsed\":14572,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":15574,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1144.044999993639,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":8,\"time_elapsed\":16719,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-13 00:08:36', NULL, NULL),
(9, 2179, 'storage/cct/english/v1/touch_banana.mp3', '1', 'test', 'banana', 'book', 'audio-button-response', 6, 14572, '0.0-1.0-0.2', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '0', 'test', '[{\"rt\":3655.8699999877717,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":3659,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2700.1149999996414,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":6361,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":8105,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":9107,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2277.3050000105286,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":11387,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":5,\"time_elapsed\":12391,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":2179.1449999873294,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"1\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":6,\"time_elapsed\":14572,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\",\"correct\":false},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":7,\"time_elapsed\":15574,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"},{\"rt\":1144.044999993639,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":8,\"time_elapsed\":16719,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"test\"}]', '2020-08-13 00:08:36', NULL, NULL),
(10, 1816, 'storage/cct/english/v1/touch_horse.mp3', '0', 'test', 'horse', 'cow', 'audio-button-response', 1, 3302, '0.0-1.0-0.0', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'live', '[{\"rt\":1467.2549999959301,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1479,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1816.1950000067009,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":3302,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":5110,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":6111,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1518.160000006901,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":7633,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":9289,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":10292,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":790.1350000029197,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":11085,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":12285,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":13289,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":2537.9050000046846,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":15828,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"}]', '2020-08-13 00:10:58', NULL, NULL),
(11, 1518, 'storage/cct/english/v1/touch_cat.mp3', '0', 'test', 'cat', 'dog', 'audio-button-response', 4, 7633, '0.0-1.0-0.1', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'live', '[{\"rt\":1467.2549999959301,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1479,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1816.1950000067009,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":3302,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":5110,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":6111,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1518.160000006901,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":7633,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":9289,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":10292,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":790.1350000029197,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":11085,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":12285,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":13289,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":2537.9050000046846,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":15828,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"}]', '2020-08-13 00:10:58', NULL, NULL),
(12, 790, 'storage/cct/english/v1/touch_banana.mp3', '0', 'test', 'banana', 'book', 'audio-button-response', 7, 11085, '0.0-1.0-0.2', '8086e6a3c8d429152a1bcc869aca1287', 2, 'EN Group1', 26, 4, 'EN Group1 : 2020813-065', '', 2, '1', 'English', 'English V1', 2, 'English Monolinguals', 2, 'EM-1', 'EN-Mono-1', '1', 'live', '[{\"rt\":1467.2549999959301,\"stimulus\":\"Welcome to the CCT App. Press any key to begin. \",\"key_press\":32,\"trial_part\":\"welcome\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":0,\"time_elapsed\":1479,\"internal_node_id\":\"0.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1816.1950000067009,\"stimulus\":\"storage/cct/english/v1/touch_horse.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"horse\",\"distractor\":\"cow\",\"trial_type\":\"audio-button-response\",\"trial_index\":1,\"time_elapsed\":3302,\"internal_node_id\":\"0.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/horse.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":2,\"time_elapsed\":5110,\"internal_node_id\":\"0.0-1.0-1.0-0.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":3,\"time_elapsed\":6111,\"internal_node_id\":\"0.0-1.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":1518.160000006901,\"stimulus\":\"storage/cct/english/v1/touch_cat.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"cat\",\"distractor\":\"dog\",\"trial_type\":\"audio-button-response\",\"trial_index\":4,\"time_elapsed\":7633,\"internal_node_id\":\"0.0-1.0-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/cat.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":5,\"time_elapsed\":9289,\"internal_node_id\":\"0.0-1.0-1.1-0.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":6,\"time_elapsed\":10292,\"internal_node_id\":\"0.0-1.0-2.1\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":790.1350000029197,\"stimulus\":\"storage/cct/english/v1/touch_banana.mp3\",\"button_pressed\":\"0\",\"trial_part\":\"test\",\"target\":\"banana\",\"distractor\":\"book\",\"trial_type\":\"audio-button-response\",\"trial_index\":7,\"time_elapsed\":11085,\"internal_node_id\":\"0.0-1.0-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\",\"correct\":true},{\"rt\":null,\"stimulus\":\"storage/cct/english/v1/banana.mp3\",\"button_pressed\":null,\"trial_part\":\"feedback\",\"trial_type\":\"audio-button-response\",\"trial_index\":8,\"time_elapsed\":12285,\"internal_node_id\":\"0.0-1.0-1.2-0.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":null,\"stimulus\":\"\",\"key_press\":null,\"trial_part\":\"blank_interval\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":9,\"time_elapsed\":13289,\"internal_node_id\":\"0.0-1.0-2.2\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"},{\"rt\":2537.9050000046846,\"stimulus\":\"Please exit through the gift shop. Press any key to continue. \",\"key_press\":32,\"trial_part\":\"exit\",\"trial_type\":\"html-keyboard-response\",\"trial_index\":10,\"time_elapsed\":15828,\"internal_node_id\":\"0.0-2.0\",\"token\":\"8086e6a3c8d429152a1bcc869aca1287\",\"project_id\":\"2\",\"project_name\":\"EN Group1\",\"project_pi_id\":\"26\",\"experiment_id\":\"4\",\"experiment_name\":\"EN Group1 : 2020813-065\",\"note\":\"\",\"cct_id\":\"2\",\"cct_version\":\"1\",\"cct_language\":\"English\",\"cct_name\":\"English V1\",\"cohort_id\":\"2\",\"cohort_name\":\"English Monolinguals\",\"participant_id\":\"2\",\"participant_identifier\":\"EM-1\",\"participant_alias\":\"EN-Mono-1\",\"test_type\":\"live\"}]', '2020-08-13 00:10:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cct_project`
--

CREATE TABLE `cct_project` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `cct_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cct_user`
--

CREATE TABLE `cct_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `cct_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cct_user`
--

INSERT INTO `cct_user` (`id`, `cct_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 14, NULL, NULL, NULL),
(2, 2, 26, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cohorts`
--

CREATE TABLE `cohorts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cohorts`
--

INSERT INTO `cohorts` (`id`, `name`, `description`, `owner_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'English Monolinguals', 'Wave 1', 26, '2020-08-13 06:10:36', '2020-08-13 06:10:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cohort_participant`
--

CREATE TABLE `cohort_participant` (
  `id` int(10) UNSIGNED NOT NULL,
  `cohort_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cohort_project`
--

CREATE TABLE `cohort_project` (
  `id` int(10) UNSIGNED NOT NULL,
  `cohort_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cohort_project`
--

INSERT INTO `cohort_project` (`id`, `cohort_id`, `project_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 9),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 13),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 10),
(22, 6, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 6, 'pi_id', 'text_area', 'Primary Investigator ID', 0, 0, 1, 1, 1, 1, '{}', 8),
(24, 6, 'name', 'text', 'Project Name', 0, 1, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 2),
(25, 6, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 3),
(26, 6, 'start_date', 'date', 'Start Date', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 4),
(27, 6, 'end_date', 'date', 'End Date', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 5),
(28, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
(29, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(30, 6, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 16),
(31, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 7, 'version', 'number', 'Version', 0, 1, 1, 1, 1, 1, '{}', 4),
(33, 7, 'tag', 'text', 'Tag', 0, 1, 1, 1, 1, 1, '{}', 6),
(34, 7, 'language', 'text', 'Language', 0, 1, 1, 1, 1, 1, '{}', 3),
(35, 7, 'note', 'text_area', 'Note', 0, 0, 1, 1, 1, 1, '{}', 7),
(36, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(37, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(38, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 11),
(39, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(40, 8, 'identifier', 'text', 'Identifier', 0, 1, 1, 1, 1, 1, '{\"description\":\"Short anonymized subject id.\",\"validation\":{\"rule\":\"required\"}}', 2),
(41, 8, 'alias', 'text', 'Alias', 0, 1, 1, 1, 1, 1, '{\"description\":\"Optional longer identifier.\"}', 3),
(42, 8, 'note', 'text_area', 'Note', 0, 0, 1, 1, 1, 1, '{}', 4),
(43, 8, 'meta', 'text_area', 'Meta', 0, 0, 1, 1, 1, 1, '{}', 5),
(44, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 10),
(45, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(46, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 12),
(61, 15, 'author_id', 'select_dropdown', 'Author', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(62, 15, 'category_id', 'select_dropdown', 'Category', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(63, 15, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(64, 15, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '\"\"', 4),
(65, 15, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '\"\"', 5),
(66, 15, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '\"\"', 6),
(67, 15, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(68, 15, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:blog_posts,slug\"}}', 8),
(69, 15, 'meta_description', 'text_area', 'meta_description', 0, 0, 1, 1, 1, 1, '\"\"', 9),
(70, 15, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(71, 15, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '\"\"', 12),
(72, 15, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 13),
(73, 15, 'tags', 'text_area', 'Tags', 0, 0, 1, 1, 1, 1, '\"\"', 14),
(74, 15, 'published_date', 'date', 'Published Date', 0, 1, 1, 1, 1, 1, '{\"format\":\"%Y-%m-%d\",\"validation\":{\"rules\":[\"required_if:status:PUBLISHED\",\"date_format:YYYY-MM-DD\"]}}', 15),
(75, 16, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(76, 16, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(77, 16, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(78, 16, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '\"\"', 4),
(79, 16, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(80, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '\"\"', 6),
(81, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 7),
(82, 17, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(83, 17, 'author_id', 'text', 'Author ID', 1, 0, 0, 0, 0, 0, '\"\"', 2),
(84, 17, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '\"\"', 3),
(85, 17, 'excerpt', 'text_area', 'Excerpt', 0, 0, 0, 0, 0, 0, '\"\"', 4),
(86, 17, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '\"\"', 5),
(87, 17, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(88, 17, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '\"\"', 7),
(89, 17, 'status', 'checkbox', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 8),
(90, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 9),
(91, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 10),
(92, 17, 'image', 'image', 'Image', 0, 0, 0, 0, 0, 0, '\"\"', 11),
(93, 17, 'layout', 'frontend_layout', 'Layout', 0, 0, 0, 0, 0, 0, '\"\"', 12),
(95, 3, 'rank', 'number', 'Rank', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 7),
(109, 6, 'project_belongsto_user_relationship', 'relationship', 'Primary Investigator', 0, 1, 1, 1, 1, 1, '{\"description\":\"The Primary Investigator who owns this project\",\"view\":\"project_pi_relationship_dropdown\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"pi_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(110, 6, 'project_belongstomany_user_relationship', 'relationship', 'Team', 0, 1, 1, 1, 1, 1, '{\"description\":\"Team members may only view the project and work with participants.\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"project_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 11),
(111, 6, 'project_belongstomany_cct_relationship', 'relationship', 'CCT', 0, 1, 1, 1, 1, 1, '{\"description\":\"List of CCT version to use on this project.\",\"view\":\"project_fields\",\"model\":\"App\\\\Cct\",\"table\":\"ccts\",\"type\":\"belongsTo\",\"column\":\"cct_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cct_project\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(112, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(113, 6, 'project_belongstomany_user_relationship_1', 'relationship', 'Collaborators', 0, 1, 1, 1, 1, 1, '{\"description\":\"Collaborators may add\\/remove users from project team.\",\"view\":\"project_fields\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"project_collaborator\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(114, 7, 'cct_belongstomany_user_relationship', 'relationship', 'Authorized PI', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cct_user\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8),
(115, 8, 'participant_belongstomany_project_relationship', 'relationship', 'Cohort', 0, 1, 1, 1, 1, 1, '{\"description\":\"Cohort the subject is included in.\",\"model\":\"App\\\\Cohort\",\"table\":\"cohorts\",\"type\":\"belongsTo\",\"column\":\"cohort_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(126, 8, 'cohort_id', 'text', 'Cohort Id', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 7),
(141, 22, 'id', 'hidden', 'Id', 1, 0, 0, 1, 1, 1, '{}', 1),
(142, 22, 'name', 'text', 'Cohort Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(143, 22, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
(145, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(146, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(147, 22, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(148, 22, 'cohort_belongsto_user_relationship', 'relationship', 'Cohort Owner', 0, 1, 1, 1, 1, 1, '{\"description\":\"The Primary Investigator or Collaborator who owns this cohort\",\"view\":\"cohort_relationship_dropdown\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"owner_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(153, 22, 'cohort_belongstomany_project_relationship', 'relationship', 'Projects', 0, 1, 1, 0, 0, 0, '{\"description\":\"The Primary Investigator or Collaborator who owns this cohort\",\"view\":\"cohort_relationship_dropdown\",\"model\":\"\\\\App\\\\Project\",\"table\":\"projects\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cohort_project\",\"pivot\":\"1\",\"taggable\":\"0\"}', 6),
(154, 22, 'owner_id', 'hidden', 'Owner Id', 0, 0, 0, 1, 1, 1, '{}', 4),
(156, 8, 'added_by', 'text', 'Added By', 0, 1, 1, 1, 1, 1, '{}', 9),
(157, 8, 'participant_belongsto_user_relationship', 'relationship', 'Added By', 0, 1, 1, 1, 1, 1, '{\"view\":\"participant_user_relationship_dropdown\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"added_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(162, 7, 'asset_path', 'text', 'Asset Path', 0, 0, 1, 1, 1, 1, '{}', 5),
(179, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(180, 25, 'project_id', 'text', 'Project Id', 0, 0, 0, 0, 0, 0, '{}', 8),
(181, 25, 'note', 'text_area', 'Note', 0, 0, 1, 1, 0, 1, '{}', 4),
(183, 25, 'created_by', 'hidden', 'Created By', 0, 0, 0, 0, 0, 0, '{\"view\":\"hidden_current_user_id\"}', 16),
(184, 25, 'active', 'checkbox', 'Active', 0, 1, 1, 1, 0, 1, '{}', 5),
(185, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 17),
(186, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 18),
(187, 25, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 19),
(189, 25, 'name', 'text', 'Name', 0, 1, 1, 0, 0, 1, '{}', 2),
(190, 25, 'project_name', 'text', 'Project Name', 0, 1, 1, 0, 0, 1, '{}', 6),
(191, 25, 'project_pi_id', 'text', 'Project Pi Id', 0, 0, 0, 0, 0, 0, '{}', 7),
(192, 25, 'cct_id', 'text', 'Cct Id', 0, 0, 0, 0, 0, 0, '{}', 9),
(193, 25, 'cct_name', 'text', 'Cct Name', 0, 1, 1, 0, 0, 1, '{}', 10),
(194, 25, 'cct_asset_path', 'text', 'Cct Asset Path', 0, 0, 1, 0, 0, 1, '{}', 13),
(195, 25, 'cohort_id', 'text', 'Cohort Id', 0, 0, 0, 0, 0, 0, '{}', 14),
(196, 25, 'cohort_name', 'text', 'Cohort Name', 0, 1, 1, 0, 0, 1, '{}', 15),
(197, 25, 'experiment_token', 'text', 'Experiment Token', 0, 0, 0, 0, 0, 0, '{}', 3),
(198, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 2),
(199, 26, 'experiment_id', 'text', 'Experiment Id', 0, 0, 0, 0, 0, 0, '{}', 3),
(200, 26, 'participant_id', 'text', 'Participant Id', 0, 0, 0, 0, 0, 0, '{}', 4),
(201, 26, 'token', 'text', 'Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(202, 26, 'link', 'text', 'Link', 0, 1, 1, 1, 0, 0, '{\"view\":\"project_fields\"}', 9),
(203, 26, 'active', 'checkbox', 'Active', 0, 1, 1, 1, 0, 0, '{}', 8),
(204, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 10),
(205, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(206, 26, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 12),
(207, 25, 'cct_version', 'text', 'Cct Version', 0, 0, 1, 0, 0, 1, '{}', 11),
(208, 25, 'cct_language', 'text', 'Cct Language', 0, 0, 1, 0, 0, 1, '{}', 12),
(229, 26, 'participant_identifier', 'text', 'Participant Identifier', 0, 1, 1, 0, 0, 0, '{}', 6),
(230, 26, 'participant_alias', 'text', 'Participant Alias', 0, 1, 1, 0, 0, 0, '{}', 7),
(231, 26, 'link_belongsto_experiment_relationship', 'relationship', 'Experiment', 0, 1, 1, 0, 0, 0, '{\"model\":\"\\\\App\\\\Experiment\",\"table\":\"experiments\",\"type\":\"belongsTo\",\"column\":\"experiment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 1),
(232, 6, 'cct_id', 'text', 'Cct Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(233, 6, 'cohort_id', 'text', 'Cohort Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(234, 6, 'project_belongsto_cohort_relationship', 'relationship', 'Cohort', 0, 1, 1, 1, 1, 1, '{\"description\":\"Cohort of participants.\",\"view\":\"project_fields\",\"model\":\"App\\\\Cohort\",\"table\":\"cohorts\",\"type\":\"belongsTo\",\"column\":\"cohort_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(235, 30, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(236, 30, 'rt', 'text', 'Rt', 0, 1, 1, 1, 1, 1, '{}', 7),
(237, 30, 'stimulus', 'text', 'Stimulus', 0, 0, 1, 1, 1, 1, '{}', 2),
(238, 30, 'button_pressed', 'text', 'Button Pressed', 0, 0, 0, 0, 0, 0, '{}', 6),
(239, 30, 'trial_part', 'text', 'Trial Part', 0, 0, 0, 0, 0, 0, '{}', 9),
(240, 30, 'target', 'text', 'Target', 0, 1, 1, 1, 1, 1, '{}', 3),
(241, 30, 'distractor', 'text', 'Distractor', 0, 1, 1, 1, 1, 1, '{}', 4),
(242, 30, 'trial_type', 'text', 'Trial Type', 0, 0, 1, 1, 1, 1, '{}', 10),
(243, 30, 'trial_index', 'text', 'Trial Index', 0, 0, 1, 1, 1, 1, '{}', 11),
(244, 30, 'time_elapsed', 'text', 'Time Elapsed', 0, 0, 1, 1, 1, 1, '{}', 8),
(245, 30, 'internal_node_id', 'text', 'Internal Node Id', 0, 0, 0, 0, 0, 0, '{}', 12),
(246, 30, 'token', 'text', 'Token', 0, 0, 0, 0, 0, 0, '{}', 13),
(247, 30, 'project_id', 'text', 'Project Id', 0, 0, 0, 0, 0, 0, '{}', 14),
(248, 30, 'project_name', 'text', 'Project Name', 0, 1, 1, 1, 1, 1, '{}', 15),
(249, 30, 'project_pi_id', 'text', 'Project Pi Id', 0, 0, 0, 0, 0, 0, '{}', 16),
(250, 30, 'experiment_id', 'text', 'Experiment Id', 0, 0, 0, 0, 0, 0, '{}', 17),
(251, 30, 'experiment_name', 'text', 'Experiment Name', 0, 1, 1, 1, 1, 1, '{}', 18),
(252, 30, 'note', 'text', 'Note', 0, 0, 1, 1, 1, 1, '{}', 19),
(253, 30, 'cct_id', 'text', 'Cct Id', 0, 0, 0, 0, 0, 0, '{}', 20),
(254, 30, 'cct_version', 'text', 'Cct Version', 0, 0, 1, 1, 1, 1, '{}', 21),
(255, 30, 'cct_language', 'text', 'Cct Language', 0, 0, 1, 1, 1, 1, '{}', 22),
(256, 30, 'cct_name', 'text', 'Cct Name', 0, 1, 1, 1, 1, 1, '{}', 23),
(257, 30, 'cohort_id', 'text', 'Cohort Id', 0, 0, 0, 0, 0, 0, '{}', 24),
(258, 30, 'cohort_name', 'text', 'Cohort Name', 0, 1, 1, 1, 1, 1, '{}', 25),
(259, 30, 'participant_id', 'text', 'Participant Id', 0, 0, 0, 0, 0, 0, '{}', 26),
(260, 30, 'participant_identifier', 'text', 'Participant Identifier', 0, 1, 1, 1, 1, 1, '{}', 27),
(261, 30, 'participant_alias', 'text', 'Participant Alias', 0, 1, 1, 1, 1, 1, '{}', 28),
(262, 30, 'correct', 'text', 'Correct', 0, 1, 1, 1, 1, 1, '{}', 5),
(263, 30, 'test_type', 'text', 'Test Type', 0, 1, 1, 0, 0, 0, '{}', 29),
(264, 30, 'json_raw', 'text', 'Json Raw', 0, 0, 0, 0, 0, 0, '{}', 30),
(265, 30, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 31),
(266, 30, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 32),
(267, 30, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 33),
(268, 1, 'user_belongstomany_role_relationship', 'relationship', 'roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-12 05:10:26', '2020-08-12 08:43:57'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-12 05:10:26', '2020-06-21 00:55:03'),
(4, 'cct', 'cct', 'CCT', 'CCTs', NULL, 'App\\Cct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(6, 'projects', 'projects', 'Project', 'Projects', 'voyager-archive', 'App\\Project', '\\App\\Policies\\ProjectPolicy', NULL, 'Projects are owned by a PI and contain one or more users and/or ccts.', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:42:49', '2020-08-05 06:26:46'),
(7, 'ccts', 'ccts', 'CCT Configuration', 'CCT Configurations', 'voyager-puzzle', 'App\\Cct', NULL, NULL, 'Meta data and access permissions for CCT', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:44:27', '2020-07-27 09:40:21'),
(8, 'participants', 'participants', 'Participant', 'Participants', 'voyager-people', 'App\\Participant', '\\App\\Policies\\ParticipantPolicy', NULL, NULL, 1, 0, '{\"order_column\":\"identifier\",\"order_display_column\":\"identifier\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:45:15', '2020-07-20 01:07:20'),
(15, 'blog_posts', 'blog_posts', 'Blog Post', 'Blog Posts', 'voyager-news', 'Pvtl\\VoyagerFrontend\\BlogPost', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PostController', '', 1, 0, NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:45'),
(16, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'Pvtl\\VoyagerBlog\\Category', NULL, '\\TCG\\Voyager\\Http\\Controllers\\VoyagerBaseController', '', 1, 0, NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(17, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'Pvtl\\VoyagerFrontend\\Page', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PageController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 20:06:45', '2020-08-09 03:30:47'),
(22, 'cohorts', 'cohorts', 'Cohort', 'Cohorts', 'voyager-people', 'App\\Cohort', '\\App\\Policies\\CohortPolicy', '\\App\\Http\\Controllers\\CohortController', NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-09 07:00:02', '2020-08-13 07:04:12'),
(25, 'experiments', 'experiments', 'Experiment', 'Experiments', NULL, 'App\\Experiment', '\\App\\Policies\\ExperimentPolicy', '\\App\\Http\\Controllers\\ExperimentsController', 'Experiments are run from projects and have links for participants.', 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-07-29 14:32:19', '2020-08-05 22:33:35'),
(26, 'links', 'links', 'Link', 'Links', NULL, 'App\\Link', '\\App\\Policies\\LinkPolicy', NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-08-01 10:49:14', '2020-08-06 01:56:55'),
(30, 'cct_collection_data', 'cct-collection-data', 'CCT Collection Datum', 'CCT Collection Data', 'voyager-database', 'App\\CctCollectionDatum', '\\App\\Policies\\CctCollectionDataPolicy', NULL, NULL, 1, 0, '{\"order_column\":\"experiment_name\",\"order_display_column\":\"id\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-05 09:37:03', '2020-08-06 01:40:35');

-- --------------------------------------------------------

--
-- Table structure for table `experiments`
--

CREATE TABLE `experiments` (
  `id` int(10) UNSIGNED NOT NULL,
  `experiment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `project_id` int(11) DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_pi_id` int(6) DEFAULT NULL,
  `cct_id` int(6) DEFAULT NULL,
  `cct_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_asset_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cohort_id` int(6) DEFAULT NULL,
  `cohort_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `created_by` int(6) DEFAULT NULL COMMENT 'user id that created the experiment for audit purposes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiments`
--

INSERT INTO `experiments` (`id`, `experiment_token`, `name`, `note`, `project_id`, `project_name`, `project_pi_id`, `cct_id`, `cct_version`, `cct_language`, `cct_name`, `cct_asset_path`, `cohort_id`, `cohort_name`, `active`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '45e012f376d52c2ce00bdcfd20f39b87', 'EN Group1 : 2020813-065', NULL, 2, 'EN Group1', 26, 2, '1', 'English', 'English V1', 'cct/english/v1', 2, 'English Monolinguals', 1, 26, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(10) UNSIGNED NOT NULL,
  `experiment_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `participant_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `participant_alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `experiment_id`, `participant_id`, `participant_identifier`, `participant_alias`, `token`, `link`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, 2, 'EM-1', 'EN-Mono-1', '19c07bdec92887aa0add5c26da27a878', '/cct?token=19c07bdec92887aa0add5c26da27a878', 1, NULL, NULL, NULL),
(3, 2, 3, 'EM-2', 'EN-Mono-2', 'e1285e131714ac9645f2106480511dd8', '/cct?token=e1285e131714ac9645f2106480511dd8', 1, NULL, NULL, NULL),
(4, 2, 4, 'EM-3', 'EN-Mono-3', '92a6c5dc06f4e7b35b31eaf6b056ba4c', '/cct?token=92a6c5dc06f4e7b35b31eaf6b056ba4c', 1, NULL, NULL, NULL),
(5, 2, 5, 'EM-4', 'EN-Mono-4', '9f2716535b68c16713fefc81a0c3f68c', '/cct?token=9f2716535b68c16713fefc81a0c3f68c', 1, NULL, NULL, NULL),
(6, 3, 2, 'EM-1', 'EN-Mono-1', 'c538a4eac572677be7854d8807117d6a', '/cct?token=c538a4eac572677be7854d8807117d6a', 1, NULL, NULL, NULL),
(7, 3, 3, 'EM-2', 'EN-Mono-2', 'a2e2fd5b761c1af57675920895f554dd', '/cct?token=a2e2fd5b761c1af57675920895f554dd', 1, NULL, NULL, NULL),
(8, 3, 4, 'EM-3', 'EN-Mono-3', '9a5b6bb302b48d945afac003ae7fc21b', '/cct?token=9a5b6bb302b48d945afac003ae7fc21b', 1, NULL, NULL, NULL),
(9, 3, 5, 'EM-4', 'EN-Mono-4', '1fd24ab1efb509d9565c1d8e8969b440', '/cct?token=1fd24ab1efb509d9565c1d8e8969b440', 1, NULL, NULL, NULL),
(10, 4, 2, 'EM-1', 'EN-Mono-1', '8086e6a3c8d429152a1bcc869aca1287', '/cct?token=8086e6a3c8d429152a1bcc869aca1287', 1, NULL, NULL, NULL),
(11, 4, 3, 'EM-2', 'EN-Mono-2', '57208efa938c0223cbb7fac83ac4b618', '/cct?token=57208efa938c0223cbb7fac83ac4b618', 1, NULL, NULL, NULL),
(12, 4, 4, 'EM-3', 'EN-Mono-3', '768eba9d72d4a90d4bf3a74a79af3a0d', '/cct?token=768eba9d72d4a90d4bf3a74a79af3a0d', 1, NULL, NULL, NULL),
(13, 4, 5, 'EM-4', 'EN-Mono-4', 'b65112ed24b86f3f6ecd2e1785644877', '/cct?token=b65112ed24b86f3f6ecd2e1785644877', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(2, 'primary', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(3, 'social', '2020-06-16 20:06:45', '2020-06-16 20:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-dashboard', '#000000', NULL, 1, '2020-06-12 05:10:26', '2020-08-10 01:09:45', 'voyager.dashboard', 'null'),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 9, '2020-06-12 05:10:26', '2020-08-07 02:36:36', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-group', '#000000', NULL, 11, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 5, 1, '2020-06-12 05:10:26', '2020-08-09 03:32:07', 'voyager.roles.index', NULL),
(5, 1, 'Admin Tools', '', '_self', 'voyager-tools', '#000000', NULL, 13, '2020-06-12 05:10:26', '2020-08-09 03:32:28', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 4, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 5, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 3, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 7, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 6, '2020-06-12 05:10:26', '2020-08-09 03:32:10', 'voyager.hooks', NULL),
(13, 1, 'Projects', '', '_self', 'voyager-archive', '#000000', NULL, 2, '2020-06-16 12:42:49', '2020-07-09 12:11:00', 'voyager.projects.index', 'null'),
(14, 1, 'CCT', '', '_self', 'voyager-puzzle', '#000000', NULL, 8, '2020-06-16 12:44:27', '2020-08-07 02:36:36', 'voyager.ccts.index', 'null'),
(15, 1, 'Participants', '', '_self', 'voyager-person', '#000000', NULL, 4, '2020-06-16 12:45:15', '2020-07-09 13:12:44', 'voyager.participants.index', 'null'),
(18, 1, 'Blog', '', '_self', 'voyager-news', NULL, 5, 8, '2020-06-16 20:06:43', '2020-08-09 03:32:10', NULL, NULL),
(19, 1, 'Posts', '', '_self', 'voyager-news', NULL, 18, 1, '2020-06-16 20:06:43', '2020-06-16 20:06:43', 'voyager.blog_posts.index', NULL),
(20, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 18, 2, '2020-06-16 20:06:43', '2020-06-16 20:06:43', 'voyager.categories.index', NULL),
(21, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 10, '2020-06-16 20:06:45', '2020-08-09 03:31:28', 'voyager.pages.index', NULL),
(22, 2, 'Home', '/home', '_self', '', NULL, NULL, 1, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(23, 2, 'About', '/about', '_self', '', NULL, NULL, 2, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(24, 2, 'Contact', '/contact', '_self', '', NULL, NULL, 3, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(25, 3, 'Facebook', 'https://www.facebook.com/wearepvtl', '_blank', 'fa-facebook-square', NULL, NULL, 1, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(26, 3, 'Twitter', 'https://twitter.com/wearepvtl', '_blank', 'fa-twitter-square', NULL, NULL, 2, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(27, 3, 'Instagram', 'https://www.instagram.com/wearepvtl/', '_blank', 'fa-instagram', NULL, NULL, 3, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(28, 3, 'Google+', 'https://plus.google.com/100970850483584616344', '_blank', 'fa-google-plus-square', NULL, NULL, 4, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(29, 3, 'LinkedIn', 'https://www.linkedin.com/company/pivotal-agency', '_blank', 'fa-linkedin', NULL, NULL, 5, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(34, 1, 'Cohorts', '', '_self', 'voyager-people', '#000000', NULL, 3, '2020-07-09 07:00:02', '2020-07-09 12:20:04', 'voyager.cohorts.index', 'null'),
(36, 1, 'Experiments', '', '_self', 'voyager-lab', '#000000', NULL, 5, '2020-07-29 14:32:19', '2020-07-29 23:55:04', 'voyager.experiments.index', 'null'),
(37, 1, 'Links', '', '_self', 'voyager-rocket', '#000000', NULL, 6, '2020-08-01 10:49:14', '2020-08-05 09:10:00', 'voyager.links.index', 'null'),
(39, 1, 'Documentation', 'https://cctapp.readthedocs.io/en/latest/', '_blank', 'voyager-book', '#000000', NULL, 12, '2020-08-05 09:12:22', '2020-08-09 03:32:10', NULL, ''),
(41, 1, 'Data', '/admin/data', '_self', 'voyager-data', '#000000', NULL, 7, '2020-08-07 02:35:39', '2020-08-07 02:37:29', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2018_04_18_000000_create_blog_posts_table', 2),
(25, '2018_04_18_000000_create_pages_table', 2),
(26, '2018_04_19_224316_add_fields_to_pages_table', 2),
(27, '2018_05_09_000000_create_categories_table', 2),
(28, '2018_05_11_000000_remove_blog_keywords_field', 2),
(29, '2018_05_11_000001_remove_pages_keywords_field', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `status`, `created_at`, `updated_at`, `layout`) VALUES
(1, 1, 'Home', 'From the pages table.', '<p>&nbsp;</p>\r\n<h3 class=\"text-center\" style=\"text-align: left;\">CCT App Website</h3>\r\n<p>This website supports the managment and delivery of the Computerized Comprehension Task (CCT) program.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'pages/July2020/pihC3B9LOmaYccS0aldB.png', 'home', 'Computerized Comprehension Task (CCT)', 'ACTIVE', '2020-06-16 20:06:45', '2020-08-09 01:18:50', 'default'),
(2, 1, 'About', 'This is the excerpt for the Lorem Ipsum Page', '<h3 class=\"text-center\">About the CCT App Website</h3>\r\n<p style=\"font-size: 14px; font-weight: normal;\">This website supports the managment and delivery of the Computerized Comprehension Task (CCT) program.</p>\r\n<p style=\"font-size: 14px; font-weight: normal;\">The program is used in conjunction with a touch screen display to allow the subject to select on screen objects in the trials by touching the objects on screen directly.</p>', NULL, 'about', 'This is the meta description for about', 'ACTIVE', '2020-06-16 20:06:45', '2020-08-09 01:37:29', 'default'),
(3, 1, 'Contact', 'This is the excerpt for the Lorem Ipsum Page', '<h3 class=\"text-center\" style=\"text-align: left;\">Email Us</h3>\r\n<p class=\"text-center\" style=\"text-align: left;\">paul@inkbear.com</p>\r\n<p>&nbsp;</p>', 'pages/July2020/uhTkoaqlQu7Cx12s3JuO.jpg', 'contact', 'email', 'ACTIVE', '2020-06-16 20:06:45', '2020-08-09 01:38:49', 'default');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cohort_id` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id`, `identifier`, `alias`, `note`, `meta`, `created_at`, `updated_at`, `deleted_at`, `cohort_id`, `added_by`) VALUES
(2, 'EM-1', 'EN-Mono-1', 'Call before sending link.', NULL, '2020-08-13 06:11:56', '2020-08-13 06:11:56', NULL, 2, 26),
(3, 'EM-2', 'EN-Mono-2', NULL, NULL, '2020-08-13 06:12:22', '2020-08-13 06:12:22', NULL, 2, 26),
(4, 'EM-3', 'EN-Mono-3', NULL, NULL, '2020-08-13 06:12:48', '2020-08-13 06:12:48', NULL, 2, 26),
(5, 'EM-4', 'EN-Mono-4', NULL, NULL, '2020-08-13 06:13:08', '2020-08-13 06:13:08', NULL, 2, 26);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(2, 'browse_bread', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(3, 'browse_database', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(4, 'browse_media', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(5, 'browse_compass', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(6, 'browse_menus', 'menus', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(7, 'read_menus', 'menus', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(8, 'edit_menus', 'menus', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(9, 'add_menus', 'menus', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(10, 'delete_menus', 'menus', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(11, 'browse_roles', 'roles', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(12, 'read_roles', 'roles', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(13, 'edit_roles', 'roles', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(14, 'add_roles', 'roles', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(15, 'delete_roles', 'roles', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(16, 'browse_users', 'users', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(17, 'read_users', 'users', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(18, 'edit_users', 'users', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(19, 'add_users', 'users', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(20, 'delete_users', 'users', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(21, 'browse_settings', 'settings', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(22, 'read_settings', 'settings', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(23, 'edit_settings', 'settings', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(24, 'add_settings', 'settings', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(25, 'delete_settings', 'settings', '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(26, 'browse_hooks', NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(27, 'browse_cct', 'cct', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(28, 'read_cct', 'cct', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(29, 'edit_cct', 'cct', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(30, 'add_cct', 'cct', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(31, 'delete_cct', 'cct', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(32, 'browse_projects', 'projects', '2020-06-16 12:42:49', '2020-06-16 12:42:49'),
(33, 'read_projects', 'projects', '2020-06-16 12:42:49', '2020-06-16 12:42:49'),
(34, 'edit_projects', 'projects', '2020-06-16 12:42:49', '2020-06-16 12:42:49'),
(35, 'add_projects', 'projects', '2020-06-16 12:42:49', '2020-06-16 12:42:49'),
(36, 'delete_projects', 'projects', '2020-06-16 12:42:49', '2020-06-16 12:42:49'),
(37, 'browse_ccts', 'ccts', '2020-06-16 12:44:27', '2020-06-16 12:44:27'),
(38, 'read_ccts', 'ccts', '2020-06-16 12:44:27', '2020-06-16 12:44:27'),
(39, 'edit_ccts', 'ccts', '2020-06-16 12:44:27', '2020-06-16 12:44:27'),
(40, 'add_ccts', 'ccts', '2020-06-16 12:44:27', '2020-06-16 12:44:27'),
(41, 'delete_ccts', 'ccts', '2020-06-16 12:44:27', '2020-06-16 12:44:27'),
(42, 'browse_participants', 'participants', '2020-06-16 12:45:15', '2020-06-16 12:45:15'),
(43, 'read_participants', 'participants', '2020-06-16 12:45:15', '2020-06-16 12:45:15'),
(44, 'edit_participants', 'participants', '2020-06-16 12:45:15', '2020-06-16 12:45:15'),
(45, 'add_participants', 'participants', '2020-06-16 12:45:15', '2020-06-16 12:45:15'),
(46, 'delete_participants', 'participants', '2020-06-16 12:45:15', '2020-06-16 12:45:15'),
(52, 'browse_blog_posts', NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(53, 'read_blog_posts', NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(54, 'edit_blog_posts', NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(55, 'add_blog_posts', NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(56, 'delete_blog_posts', NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(57, 'browse_blog_posts', 'blog_posts', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(58, 'read_blog_posts', 'blog_posts', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(59, 'edit_blog_posts', 'blog_posts', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(60, 'add_blog_posts', 'blog_posts', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(61, 'delete_blog_posts', 'blog_posts', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(62, 'browse_categories', 'categories', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(63, 'read_categories', 'categories', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(64, 'edit_categories', 'categories', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(65, 'add_categories', 'categories', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(66, 'delete_categories', 'categories', '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(67, 'browse_pages', NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(68, 'read_pages', NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(69, 'edit_pages', NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(70, 'add_pages', NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(71, 'delete_pages', NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(72, 'browse_pages', 'pages', '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(73, 'read_pages', 'pages', '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(74, 'edit_pages', 'pages', '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(75, 'add_pages', 'pages', '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(76, 'delete_pages', 'pages', '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(97, 'browse_cohorts', 'cohorts', '2020-07-09 07:00:02', '2020-07-09 07:00:02'),
(98, 'read_cohorts', 'cohorts', '2020-07-09 07:00:02', '2020-07-09 07:00:02'),
(99, 'edit_cohorts', 'cohorts', '2020-07-09 07:00:02', '2020-07-09 07:00:02'),
(100, 'add_cohorts', 'cohorts', '2020-07-09 07:00:02', '2020-07-09 07:00:02'),
(101, 'delete_cohorts', 'cohorts', '2020-07-09 07:00:02', '2020-07-09 07:00:02'),
(107, 'browse_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19'),
(108, 'read_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19'),
(109, 'edit_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19'),
(110, 'add_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19'),
(111, 'delete_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19'),
(112, 'browse_links', 'links', '2020-08-01 10:49:14', '2020-08-01 10:49:14'),
(113, 'read_links', 'links', '2020-08-01 10:49:14', '2020-08-01 10:49:14'),
(114, 'edit_links', 'links', '2020-08-01 10:49:14', '2020-08-01 10:49:14'),
(115, 'add_links', 'links', '2020-08-01 10:49:14', '2020-08-01 10:49:14'),
(116, 'delete_links', 'links', '2020-08-01 10:49:14', '2020-08-01 10:49:14'),
(122, 'browse_cct_collection_data', 'cct_collection_data', '2020-08-05 09:37:03', '2020-08-05 09:37:03'),
(123, 'read_cct_collection_data', 'cct_collection_data', '2020-08-05 09:37:03', '2020-08-05 09:37:03'),
(124, 'edit_cct_collection_data', 'cct_collection_data', '2020-08-05 09:37:03', '2020-08-05 09:37:03'),
(125, 'add_cct_collection_data', 'cct_collection_data', '2020-08-05 09:37:03', '2020-08-05 09:37:03'),
(126, 'delete_cct_collection_data', 'cct_collection_data', '2020-08-05 09:37:03', '2020-08-05 09:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 1),
(3, 1),
(4, 1),
(4, 5),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 2),
(16, 5),
(17, 1),
(17, 2),
(17, 5),
(18, 1),
(18, 2),
(18, 5),
(19, 1),
(19, 2),
(19, 5),
(20, 1),
(20, 2),
(20, 5),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 1),
(32, 2),
(32, 4),
(33, 1),
(33, 2),
(33, 4),
(34, 1),
(34, 2),
(34, 4),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(41, 5),
(42, 1),
(42, 2),
(42, 4),
(43, 1),
(43, 2),
(43, 4),
(44, 1),
(44, 2),
(44, 4),
(45, 1),
(45, 2),
(45, 4),
(46, 1),
(46, 2),
(46, 4),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(72, 5),
(73, 1),
(73, 5),
(74, 1),
(74, 5),
(75, 1),
(76, 1),
(97, 1),
(97, 2),
(97, 4),
(98, 1),
(98, 2),
(98, 4),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(107, 1),
(107, 2),
(107, 4),
(108, 1),
(108, 2),
(108, 4),
(109, 1),
(109, 2),
(109, 4),
(111, 1),
(111, 2),
(111, 4),
(112, 1),
(112, 2),
(112, 4),
(113, 1),
(113, 2),
(113, 4),
(114, 1),
(114, 2),
(114, 4),
(115, 1),
(116, 1),
(116, 2),
(116, 4),
(122, 1),
(122, 2),
(122, 4),
(123, 1),
(123, 2),
(123, 4),
(124, 1),
(125, 1),
(126, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cct_id` int(6) DEFAULT NULL,
  `cohort_id` int(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `pi_id`, `name`, `description`, `cct_id`, `cohort_id`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 26, 'EN Group1', 'English Monolinguals Wave 1', 2, 2, '2020-08-14', '2020-08-27', '2020-08-13 06:09:50', '2020-08-13 15:41:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_collaborator`
--

CREATE TABLE `project_collaborator` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_collaborator`
--

INSERT INTO `project_collaborator` (`id`, `project_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 18, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`id`, `project_id`, `user_id`, `project_role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 21, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rank` int(11) DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `rank`) VALUES
(1, 'admin', 'Administrator', '2020-06-12 05:10:26', '2020-06-21 00:55:48', 0),
(2, 'pi', 'Primary Investigator', '2020-06-12 05:10:26', '2020-06-21 00:56:56', 20),
(4, 'default', 'Default', '2020-06-14 07:37:11', '2020-08-06 22:24:27', 30),
(5, 'owner', 'CCT Owner', '2020-06-15 04:53:18', '2020-06-21 00:56:28', 10);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'CCT App', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'The CCT Multi-User Web Application', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/June2020/mE271C5kWvtt8TP38RWB.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/June2020/xDx4faNcqjTMHd8W1xzk.jpeg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'CCT App', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'The CCT Multi-User Web Application', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/June2020/l1ijrqRIy4zb0tCg76dv.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.login_splash', 'Login Splash', 'settings/June2020/btdDNOy6zzx9GjqxDzza.jpeg', NULL, 'image', 6, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trials`
--

CREATE TABLE `trials` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `cct_id` int(11) DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `trial_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT '4',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrator', 'admin@inkbear.com', 'users/June2020/6ULs03y7YwbYbRhqkkAy.png', NULL, '$2y$10$kcJNKuv9CnSS4AkRYtT9Vejl9mss/TW4pUYpfUfTvWGp6A2obUTJG', 'HQsXrnWdKwzsal2nb8uIZlNcpr4XnNCoVDqH1HRuI4NnbIP6aG2Q9IGeCNPq', '{\"locale\":\"en\"}', '2020-06-12 05:13:26', '2020-07-06 00:58:33'),
(11, 5, 'CCT Owner', 'owner@inkbear.com', 'users/August2020/ztcqI8sQ7fbBPJdqVsW5.png', NULL, '$2y$10$3XhRQ5qKyeZDl/YtJrHWPegzOsEK2FD2VScrxOvFckjUH7Vqeu4/K', NULL, '{\"locale\":\"en\"}', '2020-06-15 04:54:15', '2020-08-13 05:44:37'),
(17, 4, 'Boris', 'boris@inkbear.com', 'users/August2020/0q9ENmHJaTxaj7QeAnrA.png', NULL, '$2y$10$4XRptx0pTFgYg1vGv.PMXOQdaGP7aNkHHk2WbJE2s6oNv4YtlNMWm', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:05:53', '2020-08-13 05:06:41'),
(18, 4, 'Charlie', 'charlie@inkbear.com', 'users/August2020/3W5c3c2vDIJnDm8dYa9Q.png', NULL, '$2y$10$R2KMB1a.rB54NT2oB6d.xutii6WupC/meKBaUlcm9mcw5IcdIgJbi', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:16:17', '2020-08-13 05:29:53'),
(19, 4, 'Denisha', 'denisha@inkbear.com', 'users/August2020/60OYaes5VSqwGvErdPPE.png', NULL, '$2y$10$U2MgmfsLe4A2ymKrvLTHgekn/.AHYV4yA/RUGHrnaTHP5LAizJB9.', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:20:30', '2020-08-13 05:21:12'),
(20, 4, 'Evelyn', 'evelyn@inkbear.com', 'users/August2020/P8EZU3BHI56uDRQDDbkZ.png', NULL, '$2y$10$7nanV920QZHagIzIHGur5e5u3IhZOPtl6T2okOicVnip5WxQV363W', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:22:13', '2020-08-13 05:22:33'),
(21, 4, 'Fatima', 'fatima@inkbear.com', 'users/August2020/bpOnvqz3tfW2swqYSrvv.png', NULL, '$2y$10$dtRg/sJ16YNMUfoszPkncOWKcnYiaowYvrjoHUYkYo3o/3uzaI8GO', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:26:05', '2020-08-13 05:26:46'),
(22, 4, 'Greydon', 'greydon@inkbear.com', 'users/August2020/QCyCDprveM3z2kQuRLBb.png', NULL, '$2y$10$48UKrwAUYXi2BfN/r/PlZOyjb3Y5DbcH5XZOsA.aZ.E74eygcfNZC', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:31:00', '2020-08-13 05:31:00'),
(23, 4, 'Helen', 'helen@inkbear.com', 'users/August2020/Qnh1MDSuZKMpqhjoCJTk.png', NULL, '$2y$10$uff8PamR.IizyslXPUkbbemRmLycq.BbgCn1TUAeOXN4kGktc4eCW', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:31:50', '2020-08-13 05:31:50'),
(24, 4, 'Issac', 'issac@inkbear.com', 'users/August2020/r2hgsIwd1dcoT9NjwvYt.png', NULL, '$2y$10$0wfw0MdqF8JOZoNNGHp35er.EDOabMf.tM3YMg1X.6kyO6s0r5Y/6', NULL, '{\"locale\":\"en\"}', '2020-08-13 05:32:34', '2020-08-13 05:32:34'),
(26, 2, 'Allison', 'allison@inkbear.com', 'users/August2020/tLQrqD9PNEZz5Uda4v6I.png', NULL, '$2y$10$0sgv3AYID2RjF/zJ6Bnp7e/z8wlzksn.wkGZI0yVQjbiMGPjU4erG', NULL, '{\"locale\":\"en\"}', '2020-08-13 06:00:32', '2020-08-13 06:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `ccts`
--
ALTER TABLE `ccts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cct_collection_data`
--
ALTER TABLE `cct_collection_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cct_project`
--
ALTER TABLE `cct_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cct_user`
--
ALTER TABLE `cct_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cohorts`
--
ALTER TABLE `cohorts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cohort_participant`
--
ALTER TABLE `cohort_participant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cohort_project`
--
ALTER TABLE `cohort_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `experiments`
--
ALTER TABLE `experiments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_collaborator`
--
ALTER TABLE `project_collaborator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `trials`
--
ALTER TABLE `trials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ccts`
--
ALTER TABLE `ccts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cct_collection_data`
--
ALTER TABLE `cct_collection_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cct_project`
--
ALTER TABLE `cct_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cct_user`
--
ALTER TABLE `cct_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cohorts`
--
ALTER TABLE `cohorts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cohort_participant`
--
ALTER TABLE `cohort_participant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cohort_project`
--
ALTER TABLE `cohort_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `experiments`
--
ALTER TABLE `experiments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_collaborator`
--
ALTER TABLE `project_collaborator`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_user`
--
ALTER TABLE `project_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trials`
--
ALTER TABLE `trials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
