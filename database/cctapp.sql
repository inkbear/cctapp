-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 31, 2020 at 03:44 AM
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
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ccts`
--

INSERT INTO `ccts` (`id`, `name`, `version`, `language`, `tag`, `note`, `created_at`, `updated_at`, `deleted_at`, `asset_path`) VALUES
(1, 'English V1', 1, 'English', 'Base Model', 'This is the very first version in English', '2020-06-16 12:48:00', '2020-07-27 09:37:43', NULL, 'storage/cct/en/v1'),
(2, 'Spanish 1.2', 1, 'Spanish', NULL, 'Version 1 of the Spanish CCT', '2020-06-28 13:33:00', '2020-07-06 04:34:52', NULL, NULL),
(3, 'No Access', 0, 'English', 'Test', 'Test with no access - unassigned', '2020-07-15 03:51:00', '2020-07-22 08:48:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cct_collection_data`
--

CREATE TABLE `cct_collection_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL,
  `p_identifier` int(11) DEFAULT NULL,
  `cct_id` int(11) DEFAULT NULL,
  `cct_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cct_meta_id` int(11) DEFAULT NULL,
  `is_live` int(11) DEFAULT NULL,
  `test_num` int(11) DEFAULT NULL,
  `response` int(11) DEFAULT NULL,
  `touch_seconds` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cct_collection_meta`
--

CREATE TABLE `cct_collection_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `cct_id` int(11) DEFAULT NULL,
  `cct_version` int(11) DEFAULT NULL,
  `cct_language` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_csv` text COLLATE utf8mb4_unicode_ci,
  `is_live` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `cct_project`
--

INSERT INTO `cct_project` (`id`, `project_id`, `cct_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(2, 2, NULL, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL, NULL),
(4, 3, NULL, NULL, NULL, NULL),
(5, 3, NULL, NULL, NULL, NULL),
(6, 3, 1, NULL, NULL, NULL),
(7, 3, 2, NULL, NULL, NULL),
(8, 2, 1, NULL, NULL, NULL),
(9, 1, 2, NULL, NULL, NULL),
(10, 4, 1, NULL, NULL, NULL);

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
(1, 2, 2, NULL, NULL, NULL),
(2, 1, 2, NULL, NULL, NULL),
(3, 1, 3, NULL, NULL, NULL);

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
(2, 'English Monolinguals', 'E - All waves', 2, '2020-07-09 10:25:39', '2020-07-20 04:01:18', NULL),
(3, 'Test Cohort', 'Test cohort with no project assignments', 12, '2020-07-09 13:27:34', '2020-07-20 03:58:19', NULL),
(4, 'Spanish Monolinguals', 'Spanish monolinguals for all waves', 1, '2020-07-09 10:24:10', '2020-07-20 03:59:55', NULL);

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
(11, 2, 4, NULL, NULL, NULL),
(12, 4, 1, NULL, NULL, NULL),
(13, 4, 2, NULL, NULL, NULL);

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
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 6, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 6, 'pi_id', 'text_area', 'Primary Investigator ID', 0, 0, 1, 1, 1, 1, '{}', 6),
(24, 6, 'name', 'text', 'Project Name', 0, 1, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 2),
(25, 6, 'description', 'text_area', 'Description', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 3),
(26, 6, 'start_date', 'date', 'Start Date', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 4),
(27, 6, 'end_date', 'date', 'End Date', 0, 0, 1, 1, 1, 1, '{\"view\":\"project_fields\"}', 5),
(28, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(29, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(30, 6, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 14),
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
(85, 17, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '\"\"', 4),
(86, 17, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '\"\"', 5),
(87, 17, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(88, 17, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '\"\"', 7),
(89, 17, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 8),
(90, 17, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, '\"\"', 9),
(91, 17, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, '\"\"', 10),
(92, 17, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '\"\"', 11),
(93, 17, 'layout', 'frontend_layout', 'Layout', 1, 0, 1, 1, 1, 1, '\"\"', 12),
(95, 3, 'rank', 'number', 'Rank', 0, 1, 1, 1, 1, 1, '{}', 6),
(96, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 6),
(109, 6, 'project_belongsto_user_relationship', 'relationship', 'Primary Investigator', 0, 1, 1, 1, 1, 1, '{\"description\":\"The Primary Investigator who owns this project\",\"view\":\"project_pi_relationship_dropdown\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"pi_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(110, 6, 'project_belongstomany_user_relationship', 'relationship', 'Team', 0, 1, 1, 1, 1, 1, '{\"description\":\"Team members may only view the project and work with participants.\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"project_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 9),
(111, 6, 'project_belongstomany_cct_relationship', 'relationship', 'CCT in Project', 0, 0, 1, 1, 1, 1, '{\"description\":\"List of CCT version to use on this project.\",\"view\":\"project_fields\",\"model\":\"App\\\\Cct\",\"table\":\"ccts\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cct_project\",\"pivot\":\"1\",\"taggable\":\"0\"}', 10),
(112, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(113, 6, 'project_belongstomany_user_relationship_1', 'relationship', 'Collaborators', 0, 1, 1, 1, 1, 1, '{\"description\":\"Collaborators may add\\/remove users from project team.\",\"view\":\"project_fields\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"project_collaborator\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8),
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
(152, 6, 'project_belongstomany_cohort_relationship', 'relationship', 'Cohorts', 0, 1, 1, 1, 0, 0, '{\"description\":\"Cohorts included in this project. Manage cohort assignment in the Cohorts section.\",\"view\":\"project_fields\",\"model\":\"App\\\\Cohort\",\"table\":\"cohorts\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cohort_project\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(153, 22, 'cohort_belongstomany_project_relationship', 'relationship', 'Projects', 0, 1, 1, 1, 1, 1, '{\"description\":\"The Primary Investigator or Collaborator who owns this cohort\",\"view\":\"cohort_relationship_dropdown\",\"model\":\"\\\\App\\\\Project\",\"table\":\"projects\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"cohort_project\",\"pivot\":\"1\",\"taggable\":\"0\"}', 6),
(154, 22, 'owner_id', 'hidden', 'Owner Id', 0, 0, 0, 1, 1, 1, '{}', 4),
(156, 8, 'added_by', 'text', 'Added By', 0, 1, 1, 1, 1, 1, '{}', 9),
(157, 8, 'participant_belongsto_user_relationship', 'relationship', 'Added By', 0, 1, 1, 1, 1, 1, '{\"view\":\"participant_user_relationship_dropdown\",\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"added_by\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"blog_posts\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(162, 7, 'asset_path', 'text', 'Asset Path', 0, 0, 1, 1, 1, 1, '{}', 5),
(179, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(180, 25, 'project_id', 'text', 'Project Id', 1, 1, 1, 1, 1, 1, '{}', 7),
(181, 25, 'note', 'text_area', 'Note', 0, 1, 1, 1, 1, 1, '{}', 3),
(183, 25, 'created_by', 'hidden', 'Created By', 1, 0, 0, 1, 1, 0, '{\"view\":\"hidden_current_user_id\"}', 13),
(184, 25, 'active', 'checkbox', 'Active', 0, 1, 1, 1, 1, 1, '{}', 4),
(185, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
(186, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(187, 25, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 16),
(189, 25, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(190, 25, 'project_name', 'text', 'Project Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(191, 25, 'project_pi_id', 'text', 'Project Pi Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(192, 25, 'cct_id', 'text', 'Cct Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(193, 25, 'cct_name', 'text', 'Cct Name', 1, 1, 1, 1, 1, 1, '{}', 9),
(194, 25, 'cct_asset_path', 'text', 'Cct Asset Path', 1, 1, 1, 1, 1, 1, '{}', 10),
(195, 25, 'cohort_id', 'text', 'Cohort Id', 1, 1, 1, 1, 1, 1, '{}', 11),
(196, 25, 'cohort_name', 'text', 'Cohort Name', 1, 1, 1, 1, 1, 1, '{}', 12),
(197, 25, 'experiment_token', 'text', 'Experiment Token', 1, 1, 1, 1, 1, 1, '{}', 2);

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
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-12 05:10:26', '2020-06-28 00:36:52'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-06-12 05:10:26', '2020-06-12 05:10:26'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-06-12 05:10:26', '2020-06-21 00:55:03'),
(4, 'cct', 'cct', 'CCT', 'CCTs', NULL, 'App\\Cct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-16 12:23:50', '2020-06-16 12:23:50'),
(6, 'projects', 'projects', 'Project', 'Projects', 'voyager-archive', 'App\\Project', '\\App\\Policies\\ProjectPolicy', NULL, 'Projects are owned by a PI and contain one or more users and/or ccts.', 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:42:49', '2020-07-20 02:59:50'),
(7, 'ccts', 'ccts', 'CCT Configuration', 'CCT Configurations', 'voyager-puzzle', 'App\\Cct', NULL, NULL, 'Meta data and access permissions for CCT', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:44:27', '2020-07-27 09:40:21'),
(8, 'participants', 'participants', 'Participant', 'Participants', 'voyager-people', 'App\\Participant', '\\App\\Policies\\ParticipantPolicy', NULL, NULL, 1, 0, '{\"order_column\":\"identifier\",\"order_display_column\":\"identifier\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-16 12:45:15', '2020-07-20 01:07:20'),
(15, 'blog_posts', 'blog_posts', 'Blog Post', 'Blog Posts', 'voyager-news', 'Pvtl\\VoyagerFrontend\\BlogPost', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PostController', '', 1, 0, NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:45'),
(16, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'Pvtl\\VoyagerBlog\\Category', NULL, '\\TCG\\Voyager\\Http\\Controllers\\VoyagerBaseController', '', 1, 0, NULL, '2020-06-16 20:06:43', '2020-06-16 20:06:43'),
(17, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'Pvtl\\VoyagerFrontend\\Page', NULL, '\\Pvtl\\VoyagerFrontend\\Http\\Controllers\\PageController', '', 1, 0, NULL, '2020-06-16 20:06:45', '2020-06-16 20:06:45'),
(22, 'cohorts', 'cohorts', 'Cohort', 'Cohorts', 'voyager-people', 'App\\Cohort', '\\App\\Policies\\CohortPolicy', '\\App\\Http\\Controllers\\CohortController', NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-09 07:00:02', '2020-07-18 22:46:09'),
(25, 'experiments', 'experiments', 'Experiment', 'Experiments', NULL, 'App\\Experiment', NULL, NULL, 'Experiments are run from projects and have links for participants.', 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"id\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-07-29 14:32:19', '2020-07-31 08:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `experiments`
--

CREATE TABLE `experiments` (
  `id` int(10) UNSIGNED NOT NULL,
  `experiment_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_pi_id` int(6) NOT NULL,
  `cct_id` int(6) NOT NULL,
  `cct_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cct_asset_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cohort_id` int(6) NOT NULL,
  `cohort_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) DEFAULT '1',
  `created_by` int(6) NOT NULL COMMENT 'user id that created the experiment for audit purposes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiments`
--

INSERT INTO `experiments` (`id`, `experiment_token`, `name`, `note`, `project_id`, `project_name`, `project_pi_id`, `cct_id`, `cct_name`, `cct_asset_path`, `cohort_id`, `cohort_name`, `active`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '49c6b15622cf9e97741e87b22a8a6fd6', 'exp-49c6b15622cf9e97741e87b22a8a6fd6', NULL, 4, 'Hungarian Wave 2', 2, 1, 'English V1', 'storage/cct/en/v1', 2, 'English Monolinguals', 1, 1, NULL, NULL, NULL);

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

INSERT INTO `links` (`id`, `experiment_id`, `participant_id`, `token`, `link`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '239338e48081efae055328a4ea4e74ec', 'cct?token=239338e48081efae055328a4ea4e74ec', 1, NULL, NULL, NULL),
(2, 2, 2, '69b623be87d42bbb7e1a45a6a90dcbc1', 'cct?token=69b623be87d42bbb7e1a45a6a90dcbc1', 1, NULL, NULL, NULL),
(3, 3, 1, 'c67ecd64f2f96c57e03f79997e815712', 'cct?token=c67ecd64f2f96c57e03f79997e815712', 1, NULL, NULL, NULL),
(4, 3, 2, '81573cd0fb5f222282de92d628323f54', 'cct?token=81573cd0fb5f222282de92d628323f54', 1, NULL, NULL, NULL),
(5, 4, 1, '1621b5f1f5a9eea0698173f9db861188', 'cct?token=1621b5f1f5a9eea0698173f9db861188', 1, NULL, NULL, NULL),
(6, 4, 2, 'db7abef1026324972a827acf4ca7575b', 'cct?token=db7abef1026324972a827acf4ca7575b', 1, NULL, NULL, NULL),
(7, 5, 1, '0914e6bdc3c84aaf7cecc3ad13310c7d', 'cct?token=0914e6bdc3c84aaf7cecc3ad13310c7d', 1, NULL, NULL, NULL),
(8, 5, 2, '1d4ebc5b2b30e9c137a0bb52223c3fcb', 'cct?token=1d4ebc5b2b30e9c137a0bb52223c3fcb', 1, NULL, NULL, NULL),
(9, 6, 1, '05c8bd00effd5f2040497020d4ce5bd5', 'cct?token=05c8bd00effd5f2040497020d4ce5bd5', 1, NULL, NULL, NULL),
(10, 6, 2, 'b97ae01234979799befde7b2d35290ba', 'cct?token=b97ae01234979799befde7b2d35290ba', 1, NULL, NULL, NULL);

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
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-06-12 05:10:26', '2020-06-12 05:10:26', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2020-06-12 05:10:26', '2020-07-29 23:55:36', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-group', '#000000', NULL, 9, '2020-06-12 05:10:26', '2020-07-29 23:55:36', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 10, '2020-06-12 05:10:26', '2020-07-29 23:55:36', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 13, '2020-06-12 05:10:26', '2020-07-29 23:55:36', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 2, '2020-06-12 05:10:26', '2020-07-27 07:32:38', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, NULL, 12, '2020-06-12 05:10:26', '2020-07-29 23:55:36', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-06-12 05:10:26', '2020-07-27 07:32:38', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, NULL, 11, '2020-06-12 05:10:26', '2020-07-29 23:55:36', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 5, '2020-06-12 05:10:26', '2020-07-27 07:32:38', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 4, '2020-06-12 05:10:26', '2020-07-27 07:32:38', 'voyager.hooks', NULL),
(13, 1, 'Projects', '', '_self', 'voyager-archive', '#000000', NULL, 2, '2020-06-16 12:42:49', '2020-07-09 12:11:00', 'voyager.projects.index', 'null'),
(14, 1, 'CCT', '', '_self', 'voyager-puzzle', '#000000', NULL, 7, '2020-06-16 12:44:27', '2020-07-29 23:55:36', 'voyager.ccts.index', 'null'),
(15, 1, 'Participants', '', '_self', 'voyager-person', '#000000', NULL, 4, '2020-06-16 12:45:15', '2020-07-09 13:12:44', 'voyager.participants.index', 'null'),
(18, 1, 'Blog', '', '_self', 'voyager-news', NULL, 5, 6, '2020-06-16 20:06:43', '2020-07-29 12:42:47', NULL, NULL),
(19, 1, 'Posts', '', '_self', 'voyager-news', NULL, 18, 1, '2020-06-16 20:06:43', '2020-06-16 20:06:43', 'voyager.blog_posts.index', NULL),
(20, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 18, 2, '2020-06-16 20:06:43', '2020-06-16 20:06:43', 'voyager.categories.index', NULL),
(21, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 5, 1, '2020-06-16 20:06:45', '2020-07-09 06:33:19', 'voyager.pages.index', NULL),
(22, 2, 'Home', '/home', '_self', '', NULL, NULL, 1, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(23, 2, 'About', '/about', '_self', '', NULL, NULL, 2, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(24, 2, 'Contact', '/contact', '_self', '', NULL, NULL, 3, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(25, 3, 'Facebook', 'https://www.facebook.com/wearepvtl', '_blank', 'fa-facebook-square', NULL, NULL, 1, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(26, 3, 'Twitter', 'https://twitter.com/wearepvtl', '_blank', 'fa-twitter-square', NULL, NULL, 2, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(27, 3, 'Instagram', 'https://www.instagram.com/wearepvtl/', '_blank', 'fa-instagram', NULL, NULL, 3, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(28, 3, 'Google+', 'https://plus.google.com/100970850483584616344', '_blank', 'fa-google-plus-square', NULL, NULL, 4, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(29, 3, 'LinkedIn', 'https://www.linkedin.com/company/pivotal-agency', '_blank', 'fa-linkedin', NULL, NULL, 5, '2020-06-16 20:06:45', '2020-06-16 20:06:45', NULL, NULL),
(34, 1, 'Cohorts', '', '_self', 'voyager-people', '#000000', NULL, 3, '2020-07-09 07:00:02', '2020-07-09 12:20:04', 'voyager.cohorts.index', 'null'),
(36, 1, 'Experiments', '', '_self', 'voyager-lab', '#000000', NULL, 5, '2020-07-29 14:32:19', '2020-07-29 23:55:04', 'voyager.experiments.index', 'null');

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
(1, 1, 'Home', 'From the pages table.', '<p>&nbsp;</p>\r\n<h3 class=\"text-center\">This home page has text pulled from the pages table.</h3>\r\n<p class=\"text-center\">This is the body of the lorem ipsum page</p>\r\n<p>&nbsp;</p>', 'pages/July2020/pihC3B9LOmaYccS0aldB.png', 'home', 'This is the meta description', 'ACTIVE', '2020-06-16 20:06:45', '2020-07-23 06:40:43', 'default'),
(2, 1, 'About', 'This is the excerpt for the Lorem Ipsum Page', '<p>&nbsp;</p>\r\n<h3 class=\"text-center\">This is the body of the lorem ipsum page</h3>\r\n<p class=\"text-center\">This is the body of the lorem ipsum page</p>\r\n<p>&nbsp;</p>', 'pages/July2020/Cllf6ujHasoWbY14E7Ol.jpg', 'about', 'This is the meta description for about', 'ACTIVE', '2020-06-16 20:06:45', '2020-07-28 00:42:36', 'default'),
(3, 1, 'Contact', 'This is the excerpt for the Lorem Ipsum Page', '<p>&nbsp;</p>\r\n<h3 class=\"text-center\">This is the body of the lorem ipsum page</h3>\r\n<p class=\"text-center\">This is the body of the lorem ipsum page</p>\r\n<p>&nbsp;</p>', 'pages/July2020/uhTkoaqlQu7Cx12s3JuO.jpg', 'contact', 'This is the meta description for contact', 'ACTIVE', '2020-06-16 20:06:45', '2020-07-28 00:43:20', 'default');

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
(1, '800', 'sdsu_en_w1_800', 'SDSU English Wave 1 Participant 800', 'comma,seperated,list\r\non,two,lines', '2020-06-19 18:55:00', '2020-07-19 14:48:04', NULL, 2, 2),
(2, '801', 'sdsu_en_w1_801', 'English monolingual added by Collab1', 'Some vars and so on', '2020-07-19 00:06:36', '2020-07-19 23:20:03', NULL, 2, 4),
(3, '900', 'sdsu_sp_w1_900', 'Spanish Monolingual added by PI1', 'foo;bar;val;', '2020-07-19 14:49:43', '2020-07-19 23:21:50', NULL, 4, 2),
(4, '901', 'sdsu_sp_w1_901', '1234', 'age:2,lang:sp', '2020-07-19 23:04:03', '2020-07-20 01:40:59', NULL, 4, 4),
(5, '902', 'sdsu_sp_w1_902', NULL, 'jkl:asd', '2020-07-20 00:18:11', '2020-07-20 01:41:16', NULL, 4, 4),
(6, '904', 'sdsu_sp_w1_904', NULL, NULL, '2020-07-20 01:02:54', '2020-07-20 01:41:25', NULL, 3, 4);

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
(111, 'delete_experiments', 'experiments', '2020-07-29 14:32:19', '2020-07-29 14:32:19');

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
(32, 5),
(33, 1),
(33, 2),
(33, 4),
(33, 5),
(34, 1),
(34, 2),
(34, 4),
(34, 5),
(35, 1),
(35, 2),
(35, 5),
(36, 1),
(36, 2),
(36, 5),
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
(42, 5),
(43, 1),
(43, 2),
(43, 4),
(43, 5),
(44, 1),
(44, 2),
(44, 4),
(44, 5),
(45, 1),
(45, 2),
(45, 4),
(45, 5),
(46, 1),
(46, 2),
(46, 4),
(46, 5),
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
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(97, 1),
(97, 2),
(97, 4),
(97, 5),
(98, 1),
(98, 2),
(98, 4),
(98, 5),
(99, 1),
(99, 2),
(99, 5),
(100, 1),
(100, 2),
(100, 5),
(101, 1),
(101, 2),
(101, 5),
(107, 1),
(107, 2),
(107, 4),
(107, 5),
(108, 1),
(108, 2),
(108, 4),
(108, 5),
(109, 1),
(109, 2),
(109, 4),
(109, 5),
(110, 1),
(110, 2),
(110, 4),
(110, 5),
(111, 1),
(111, 2),
(111, 4),
(111, 5);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `pi_id`, `name`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'SDSU English Wave 1', 'Sample project to test relationships', '2020-04-27', '2021-06-16', '2020-06-28 06:20:26', '2020-07-20 04:32:58', NULL),
(2, 2, 'Super Duper', 'A super duper project', '2020-06-28', '2020-07-31', '2020-06-28 13:36:13', '2020-07-20 04:34:21', NULL),
(3, 3, 'The Big Project', 'Huge 30 year multi-wave international project', '2020-03-01', '2050-03-01', '2020-07-01 06:09:22', '2020-07-13 04:44:38', NULL),
(4, 2, 'Hungarian Wave 2', 'Hungarian CCT wave 2', '2020-06-28', '2021-01-08', '2020-07-03 02:17:28', '2020-07-20 04:18:58', NULL),
(5, 4, 'Danish Test', 'Initial test of the Danish deployment across 200 subjects. \r\n\r\nCarriage return with blank line\r\n<strong>bold text</strong>', '2020-07-07', '2020-07-11', '2020-07-14 02:05:32', '2020-07-20 03:09:49', NULL);

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
(5, 2, 7, NULL, NULL, NULL),
(7, 3, 4, NULL, NULL, NULL),
(8, 4, 4, NULL, NULL, NULL),
(9, 2, 5, NULL, NULL, NULL);

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
(2, 1, 7, NULL, NULL, NULL, NULL),
(3, 1, 8, NULL, NULL, NULL, NULL),
(6, 2, 9, NULL, NULL, NULL, NULL),
(7, 2, 10, NULL, NULL, NULL, NULL),
(10, 3, 7, NULL, NULL, NULL, NULL),
(11, 3, 8, NULL, NULL, NULL, NULL),
(13, 3, 10, NULL, NULL, NULL, NULL),
(14, 3, 12, NULL, NULL, NULL, NULL),
(20, 4, 10, NULL, NULL, NULL, NULL),
(22, 5, 7, NULL, NULL, NULL, NULL);

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
(4, 'staff', 'Staff', '2020-06-14 07:37:11', '2020-07-30 03:17:38', 30),
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
(1, 1, 'Administrator', 'admin@inkbear.com', 'users/June2020/6ULs03y7YwbYbRhqkkAy.png', NULL, '$2y$10$kcJNKuv9CnSS4AkRYtT9Vejl9mss/TW4pUYpfUfTvWGp6A2obUTJG', 'lCNSGrdMd20tVRFKv1SsTf3i4v1lFJQzrgwqS0UEhNRy8nGgXqBt1meDkSeF', '{\"locale\":\"en\"}', '2020-06-12 05:13:26', '2020-07-06 00:58:33'),
(2, 2, 'Primary Investigator 1', 'pi1@inkbear.com', 'users/June2020/DFb72rqSePNc96CDbw22.png', NULL, '$2y$10$6/cxqNbilJw4FUvHLOpPm.aaE7rJ9kbF52Dlg3Vl7.7.lGpO2qr0u', NULL, '{\"locale\":\"en\"}', '2020-06-14 07:53:28', '2020-06-14 07:53:28'),
(3, 2, 'Primary Investigator 2', 'pi2@inkbear.com', 'users/June2020/mHMsIBBqhLQR4Hm06aK3.png', NULL, '$2y$10$4DLgC1IECOxS1dJzUWNgDepBI1w3WYFBQvBaetP6GXVSKRBMqKzOW', NULL, '{\"locale\":\"en\"}', '2020-06-14 07:54:36', '2020-06-15 04:55:19'),
(4, 4, 'Collaborator 1', 'collab1@inkbear.com', 'users/June2020/vWVDyjyDspgmCeY0ZXYd.png', NULL, '$2y$10$lBBrn2YU6zGur41QRL0zM..RIxVJOKLLlQQb8oTXS97yZ4k.BFrIO', NULL, '{\"locale\":\"en\"}', '2020-06-14 07:55:58', '2020-07-05 08:35:48'),
(5, 4, 'Collaborator 2', 'collab2@inkbear.com', 'users/June2020/P0zqrmD1AJNXw4m7eZSc.png', NULL, '$2y$10$GKc8uRSOEnD6mnjw06dJH.H3V6wrXMJElAO8wqzXmM2iLiPkn/vCa', NULL, '{\"locale\":\"en\"}', '2020-06-14 11:30:18', '2020-07-05 08:36:41'),
(6, 2, 'Collaborator 3', 'collab3@inkbear.com', 'users/June2020/oi8xzJDEEhfS42kWHvSk.png', NULL, '$2y$10$HR8qETxSBWsBf5OGg9Vwq.Vlgn/m5btFnSBglATm2gJ1f/vGOiSBi', NULL, '{\"locale\":\"en\"}', '2020-06-14 12:41:24', '2020-07-05 09:15:49'),
(7, 4, 'Staff 1', 'staff1@inkbear.com', 'users/June2020/EcCUXK6Z8fWTWzdkRN0v.png', NULL, '$2y$10$MeN.ROsTVDMmm53oFJKdjuxkvJAi7schr8kz01xl0H5HFsvM/plXe', NULL, '{\"locale\":\"en\"}', '2020-06-14 12:42:27', '2020-06-15 04:54:50'),
(8, 4, 'Staff 2', 'staff2@inkbear.com', 'users/June2020/Ny89U4HMCsBdEBx3MFoi.png', NULL, '$2y$10$KnkHW6t4.T7NZ/oM1v3ji.EQTB4DWJXT3U.95EiSDXCm/P2KvASiq', NULL, '{\"locale\":\"en\"}', '2020-06-14 12:43:06', '2020-06-14 12:43:06'),
(9, 4, 'Staff 3', 'staff3@inkbear.com', 'users/June2020/yBQVAATN2jUF7bV8gGD1.png', NULL, '$2y$10$nwTpjN7JugcIevUd1UrFTO9jIECqERpnY2gg2orfCCGJgRgwA4NwO', NULL, '{\"locale\":\"en\"}', '2020-06-14 12:44:37', '2020-06-14 12:44:37'),
(10, 4, 'Staff 4', 'staff4@inkbear.com', 'users/June2020/U0BJ0JLjxylHdPoYAgoq.png', NULL, '$2y$10$5ab/lEg5L2jFYLYrYA3UmOmdkF41ApRxLoj3seYs8gLTJcHYdU2cK', NULL, '{\"locale\":\"en\"}', '2020-06-14 12:45:32', '2020-06-14 12:45:32'),
(11, 5, 'CCT Owner', 'owner@inkbear.com', 'users/June2020/wp4CdCjACaRTiuCKDFxu.png', NULL, '$2y$10$3XhRQ5qKyeZDl/YtJrHWPegzOsEK2FD2VScrxOvFckjUH7Vqeu4/K', NULL, '{\"locale\":\"en\"}', '2020-06-15 04:54:15', '2020-06-15 04:57:20'),
(12, 4, 'guest one', 'guest1@inkbear.com', 'users/default.png', NULL, '$2y$10$9M5kFMvY53J4/eDGbyiFtur3oLl/VWS98.U5vIKGy01rvT620Vlje', NULL, '{\"locale\":\"en\"}', '2020-06-19 06:28:06', '2020-07-05 15:09:21'),
(13, NULL, 'guest two', 'guest2@inkbear.com', 'users/default.png', NULL, '$2y$10$/uKAqI1uZ.GKCHe7gB5nwuz3RCOwZCYFjOGoSrLI2zzrdzkIMa8D6', NULL, '{\"locale\":\"en\"}', '2020-07-05 15:08:35', '2020-07-20 04:49:09');

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
-- Indexes for table `cct_collection_meta`
--
ALTER TABLE `cct_collection_meta`
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cct_collection_data`
--
ALTER TABLE `cct_collection_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cct_collection_meta`
--
ALTER TABLE `cct_collection_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cct_project`
--
ALTER TABLE `cct_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cct_user`
--
ALTER TABLE `cct_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cohorts`
--
ALTER TABLE `cohorts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cohort_participant`
--
ALTER TABLE `cohort_participant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cohort_project`
--
ALTER TABLE `cohort_project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `experiments`
--
ALTER TABLE `experiments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_collaborator`
--
ALTER TABLE `project_collaborator`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_user`
--
ALTER TABLE `project_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
