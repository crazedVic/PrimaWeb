-- MySQL Export from SQLite
-- Generated: 2025-11-22 00:07:16

SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SET time_zone = '+00:00';

-- --------------------------------------------------------
-- Table structure for table `cache`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (`key` VARCHAR(255) not null, `value` text not null, `expiration` INT not null, primary key (`key`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `cache_locks`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (`key` VARCHAR(255) not null, `owner` VARCHAR(255) not null, `expiration` INT not null, primary key (`key`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `categories`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `name` VARCHAR(255) not null, `slug` VARCHAR(255) not null, `description` text, `sort_order` INT not null default '0', `is_active` TINYINT(1) not null default '1', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `failed_jobs`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `uuid` VARCHAR(255) not null, `connection` text not null, `queue` text not null, `payload` text not null, `exception` text not null, `failed_at` DATETIME not null default CURRENT_TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `fechsungen`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `fechsungen`;

CREATE TABLE `fechsungen` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `title` VARCHAR(255) not null, `description` text, `author` VARCHAR(255), `author_meeting_number` VARCHAR(255), `meeting_reference` VARCHAR(255), `image` VARCHAR(255), `pdf_file` VARCHAR(255), `sort_order` INT not null default '0', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `gallery_images`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `gallery_images`;

CREATE TABLE `gallery_images` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `title` VARCHAR(255), `description` text, `image_path` VARCHAR(255) not null, `category` VARCHAR(255), `sort_order` INT not null DEFAULT '0', `created_at` DATETIME, `updated_at` DATETIME, `category_id` BIGINT UNSIGNED) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `job_batches`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (`id` VARCHAR(255) not null, `name` VARCHAR(255) not null, `total_jobs` INT not null, `pending_jobs` INT not null, `failed_jobs` INT not null, `failed_job_ids` text not null, `options` text, `cancelled_at` INT, `created_at` INT not null, `finished_at` INT, primary key (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `jobs`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `queue` VARCHAR(255) not null, `payload` text not null, `attempts` INT not null, `reserved_at` INT, `available_at` INT not null, `created_at` INT not null) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `krystalline_entries`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `krystalline_entries`;

CREATE TABLE `krystalline_entries` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `krystallinen_id` BIGINT UNSIGNED not null, `date` date, `description` text, `time` VARCHAR(255), `lageplan_file` VARCHAR(255), `sort_order` INT not null default '0', `is_active` TINYINT(1) not null default '1', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `krystallinen`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `krystallinen`;

CREATE TABLE `krystallinen` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `header` VARCHAR(255), `intro_text` text, `section_name` VARCHAR(255), `sort_order` INT not null default '0', `is_active` TINYINT(1) not null default '1', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `meetings`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `meetings`;

CREATE TABLE `meetings` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `date` date not null, `meeting_number` INT, `theme` VARCHAR(255), `month_name` VARCHAR(255), `event_type` ENUM('regular', 'schlaraffiade', 'special', 'cancelled') not null default 'regular', `notes` text, `is_cancelled` TINYINT(1) not null default '0', `cancellation_reason` text, `sort_order` INT not null default '0', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `member_contacts`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `member_contacts`;

CREATE TABLE `member_contacts` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `member_id` BIGINT UNSIGNED, `rank_abbreviation` VARCHAR(255), `member_name` VARCHAR(255) not null, `member_title_details` text, `real_name` VARCHAR(255), `profession` VARCHAR(255), `birth_date` date, `address` text, `phone_home` VARCHAR(255), `phone_cell` VARCHAR(255), `phone_fax` VARCHAR(255), `email` VARCHAR(255), `category` VARCHAR(255), `sort_order` INT not null default '0', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `member_ranks`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `member_ranks`;

CREATE TABLE `member_ranks` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `name` VARCHAR(255) not null, `slug` VARCHAR(255) not null, `sort_order` INT not null default '0', `description` text, `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `members`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `member_rank_id` BIGINT UNSIGNED not null, `name` VARCHAR(255) not null, `title` VARCHAR(255), `rank_abbreviation` VARCHAR(255), `shield_image` VARCHAR(255), `shield_thumbnail` VARCHAR(255), `meeting_number` INT, `is_active` TINYINT(1) not null default '1', `sort_order` INT not null default '0', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `migrations`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `migration` VARCHAR(255) not null, `batch` INT not null) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `pages`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `title` VARCHAR(255) not null, `slug` VARCHAR(255) not null, `content` text, `meta_description` text, `is_published` TINYINT(1) not null default '1', `sort_order` INT not null default '0', `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `password_reset_tokens`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (`email` VARCHAR(255) not null, `token` VARCHAR(255) not null, `created_at` DATETIME, primary key (`email`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `sessions`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (`id` VARCHAR(255) not null, `user_id` INT, `ip_address` VARCHAR(255), `user_agent` text, `payload` text not null, `last_activity` INT not null, primary key (`id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Table structure for table `users`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (`id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY not null, `name` VARCHAR(255) not null, `email` VARCHAR(255) not null, `email_verified_at` DATETIME, `password` VARCHAR(255) not null, `remember_token` VARCHAR(255), `created_at` DATETIME, `updated_at` DATETIME) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Foreign key constraints
-- --------------------------------------------------------

ALTER TABLE `gallery_images` ADD CONSTRAINT `fk_gallery_images_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
ALTER TABLE `krystalline_entries` ADD CONSTRAINT `fk_krystalline_entries_krystallinen_id` FOREIGN KEY (`krystallinen_id`) REFERENCES `krystallinen` (`id`) ON DELETE CASCADE;
ALTER TABLE `member_contacts` ADD CONSTRAINT `fk_member_contacts_member_id` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;
ALTER TABLE `members` ADD CONSTRAINT `fk_members_member_rank_id` FOREIGN KEY (`member_rank_id`) REFERENCES `member_ranks` (`id`) ON DELETE CASCADE;

-- --------------------------------------------------------
-- Dumping data for table `cache`
-- --------------------------------------------------------

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1763759240;', 1763759240),
('laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1763759240);

-- --------------------------------------------------------
-- Dumping data for table `cache_locks`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table `categories`
-- --------------------------------------------------------

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Fechsung', 'fechsung', NULL, 0, 1, '2025-11-21 20:05:09', '2025-11-21 20:05:09'),
(4, 'City Skyline', 'city-skyline', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(5, 'Unser Rathaus', 'unser-rathaus', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(6, 'Raddampfer', 'raddampfer', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(7, 'Arts Distrikt', 'arts-distrikt', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(8, 'Hotel McDonald', 'hotel-mcdonald', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(9, 'Parlamentsgelände', 'parlamentsgelande', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(10, 'Canada Place', 'canada-place', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(11, 'High Level Bridge', 'high-level-bridge', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30'),
(12, 'Botanischer Garten', 'botanischer-garten', NULL, 0, 1, '2025-11-21 20:40:30', '2025-11-21 20:40:30');

-- --------------------------------------------------------
-- Dumping data for table `failed_jobs`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table `fechsungen`
-- --------------------------------------------------------

INSERT INTO `fechsungen` (`id`, `title`, `description`, `author`, `author_meeting_number`, `meeting_reference`, `image`, `pdf_file`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Das Leben vor Schlaraffia', NULL, 'R', NULL, 'Luega-Sippung a.U. 146', 'fechsungen/dasleben_sm.jpg', 'fechsungen/pdf/DaDaLustFechsung.pdf', 0, '2025-11-21 19:55:32', '2025-11-21 20:12:11'),
(2, 'Der Uhubaum', NULL, 'R', NULL, NULL, 'fechsungen/deruhubaum_sm.jpg', 'fechsungen/deruhubaum.jpg', 1, '2025-11-21 19:55:32', '2025-11-21 20:16:47'),
(3, 'Zeitzeuge', NULL, 'K', NULL, '1760. Sippung a.U. 158', 'fechsungen/zeitzeuge_sm.png', 'fechsungen/pdf/Zeitzeuge.pdf', 2, '2025-11-21 19:55:32', '2025-11-21 20:12:11');

-- --------------------------------------------------------
-- Dumping data for table `gallery_images`
-- --------------------------------------------------------

INSERT INTO `gallery_images` (`id`, `title`, `description`, `image_path`, `category`, `sort_order`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Fechsung - deruhubaum', NULL, 'images/fechsung/deruhubaum.jpg', 'fechsung', 0, '2025-11-21 19:55:34', '2025-11-21 20:05:09', 1),
(2, 'Fechsung - deruhubaum', NULL, 'gallery/fechsung/deruhubaum.jpg', 'fechsung', 0, '2025-11-21 20:11:53', '2025-11-21 20:11:53', 1),
(3, 'canadaplace_sm', NULL, 'gallery/edm/canadaplace_sm.jpg', NULL, 16, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 10),
(4, 'cityhall1_sm', NULL, 'gallery/edm/cityhall1_sm.jpg', NULL, 5, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 5),
(5, 'cityhall2_sm', NULL, 'gallery/edm/cityhall2_sm.jpg', NULL, 4, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 5),
(6, 'downtown_sm', NULL, 'gallery/edm/downtown_sm.jpg', NULL, 7, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 7),
(7, 'hilevel1_sm', NULL, 'gallery/edm/hilevel1_sm.jpg', NULL, 17, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 11),
(8, 'leg1_sm', NULL, 'gallery/edm/leg1_sm.jpg', NULL, 15, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(9, 'leg2_sm', NULL, 'gallery/edm/leg2_sm.jpg', NULL, 13, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(10, 'leg3_sm', NULL, 'gallery/edm/leg3_sm.jpg', NULL, 14, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(11, 'legfountain_sm', NULL, 'gallery/edm/legfountain_sm.jpg', NULL, 12, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(12, 'leggarden_sm', NULL, 'gallery/edm/leggarden_sm.jpg', NULL, 11, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(13, 'legpoolfountain_sm', NULL, 'gallery/edm/legpoolfountain_sm.jpg', NULL, 10, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 9),
(14, 'mcdonald_sm', NULL, 'gallery/edm/mcdonald_sm.jpg', NULL, 9, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 8),
(15, 'muttartclose_sm', NULL, 'gallery/edm/muttartclose_sm.jpg', NULL, 20, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 12),
(16, 'muttartfar_sm', NULL, 'gallery/edm/muttartfar_sm.jpg', NULL, 18, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 12),
(17, 'muttartmed_sm', NULL, 'gallery/edm/muttartmed_sm.jpg', NULL, 19, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 12),
(18, 'riverqueen_sm', NULL, 'gallery/edm/riverqueen_sm.jpg', NULL, 6, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 6),
(19, 'skylinefar_sm', NULL, 'gallery/edm/skylinefar_sm.jpg', NULL, 2, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 4),
(20, 'skylinegreen_sm', NULL, 'gallery/edm/skylinegreen_sm.jpg', NULL, 0, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 4),
(21, 'skylinehill_sm', NULL, 'gallery/edm/skylinehill_sm.jpg', NULL, 3, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 4),
(22, 'skylinetrees_sm', NULL, 'gallery/edm/skylinetrees_sm.jpg', NULL, 1, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 4),
(23, 'totem_sm', NULL, 'gallery/edm/totem_sm.jpg', NULL, 8, '2025-11-21 20:19:03', '2025-11-21 20:40:30', 7),
(24, 'dasleben_sm', NULL, 'gallery/fechsung/dasleben_sm.jpg', NULL, 0, '2025-11-21 20:19:03', '2025-11-21 20:19:03', 1),
(25, 'deruhubaum_sm', NULL, 'gallery/fechsung/deruhubaum_sm.jpg', NULL, 2, '2025-11-21 20:19:03', '2025-11-21 20:19:03', 1),
(26, 'zeitzeuge_sm', NULL, 'gallery/fechsung/zeitzeuge_sm.png', NULL, 3, '2025-11-21 20:19:03', '2025-11-21 20:19:03', 1);

-- --------------------------------------------------------
-- Dumping data for table `job_batches`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table `jobs`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table `krystalline_entries`
-- --------------------------------------------------------

INSERT INTO `krystalline_entries` (`id`, `krystallinen_id`, `date`, `description`, `time`, `lageplan_file`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-06-10 00:00:00', 'Krystalline in der Heimburg von Ritter Beton-Narr', 'Glock 2 am Mittag', 'privat/BetonNarr_Plan.jpg', 0, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(2, 1, '2022-07-08 00:00:00', 'Krystalline in der Heimburg von Ritter Wing-Wing', 'Glock 2 am Mittag', 'privat/WingWing_Plan.jpg', 1, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(3, 1, '2022-08-12 00:00:00', 'Krystalline in der Heimburg bei Ritter Java', 'Glock 2 am Mittag', 'privat/Java_Plan.jpg', 2, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(4, 1, '2022-09-09 00:00:00', 'Krystalline in der Heimburg von Ritter Tüftel', 'Glock 2 am Mittag', 'privat/Tueftel_Plan.jpg', 3, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(5, 2, '2022-07-08 00:00:00', 'Krystalline in der Heimburg von Ritter Rohrbruch', 'Glock 2 am Mittag', NULL, 0, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(6, 2, '2022-07-30 00:00:00', 'Krystalline in der Heimburg von Ritter Brüner', 'Glock 2 am Mittag', NULL, 1, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09');

-- --------------------------------------------------------
-- Dumping data for table `krystallinen`
-- --------------------------------------------------------

INSERT INTO `krystallinen` (`id`, `header`, `intro_text`, `section_name`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Sommerkrystallinen a.U. 164', 'Bitte erkundigt Euch, ob die Krystallinen auch wie angekündigt stattfinden können!', 'Krystallinen der Prima Canadensis', 0, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09'),
(2, 'Sommerkrystallinen a.U. 164', NULL, 'Krystallinen der Rocky Mountania', 1, 1, '2025-11-21 20:57:09', '2025-11-21 20:57:09');

-- --------------------------------------------------------
-- Dumping data for table `meetings`
-- --------------------------------------------------------

INSERT INTO `meetings` (`id`, `date`, `meeting_number`, `theme`, `month_name`, `event_type`, `notes`, `is_cancelled`, `cancellation_reason`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '2024-10-07 00:00:00', 1912, 'Eröffnungsschlaraffiade*', 'Lethemond', 'schlaraffiade', NULL, 0, NULL, 0, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(2, '2024-10-14 00:00:00', NULL, NULL, 'Lethemond', 'regular', NULL, 1, 'fällt aus (Erntedankfest)', 1, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(3, '2024-10-21 00:00:00', 1913, 'Schwarzer Humor', 'Lethemond', 'regular', NULL, 0, NULL, 2, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(4, '2024-10-28 00:00:00', 1914, 'Pilgerabend', 'Lethemond', 'regular', NULL, 0, NULL, 3, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(5, '2024-11-04 00:00:00', 1915, 'Schlaraffiade, PRAGA- und Ahallafeyer**', 'Windmond', 'schlaraffiade', NULL, 0, NULL, 4, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(6, '2024-11-11 00:00:00', NULL, NULL, 'Windmond', 'regular', NULL, 1, 'fällt aus (Rememberence Day)', 5, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(7, '2024-11-18 00:00:00', 1916, 'Wissenschaftsexperimente und Zaubertricks', 'Windmond', 'regular', NULL, 0, NULL, 6, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(8, '2024-11-27 00:00:00', 1917, 'Adventsfeyer', 'Windmond', 'regular', NULL, 0, NULL, 7, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(9, '2024-12-02 00:00:00', 1918, 'Schlaraffiade*, Seltsame und machnchmal unerwünschte Geschenke', 'Christmond', 'schlaraffiade', NULL, 0, NULL, 8, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(10, '2024-12-07 00:00:00', 1919, 'Samstag: UHUbaumfeyer***, mit Burgfrauen', 'Christmond', 'special', NULL, 0, NULL, 9, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(11, '2024-12-14 00:00:00', NULL, 'Samstag: UHUbaumfeyer bei der Tochter', 'Christmond', 'special', NULL, 0, NULL, 10, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(12, '2024-12-23 00:00:00', NULL, NULL, 'Christmond', 'regular', NULL, 1, 'fällt aus', 11, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(13, '2024-12-25 00:00:00', NULL, NULL, 'Christmond', 'regular', NULL, 1, 'fällt aus', 12, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(14, '2025-01-06 00:00:00', 1920, 'Schlaraffiade*, Profane Jahreshauptversammlung, Paßverlängerung, Wald und Wiese', 'Eismond', 'schlaraffiade', NULL, 0, NULL, 13, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(15, '2025-01-13 00:00:00', 1921, 'Seltsame Träume', 'Eismond', 'regular', NULL, 0, NULL, 14, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(16, '2025-01-20 00:00:00', 1922, 'Schlaraffische Kochexperimente: Triumph und Katastrophe', 'Eismond', 'regular', NULL, 0, NULL, 15, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(17, '2025-01-27 00:00:00', 1923, 'Haikus und Reime, jeder fechst', 'Eismond', 'regular', NULL, 0, NULL, 16, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(18, '2025-02-03 00:00:00', 1924, 'Schlaraffiade*, Mein Lieblingsdichter', 'Hornung', 'schlaraffiade', NULL, 0, NULL, 17, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(19, '2025-02-10 00:00:00', 1925, 'Filmabend mit Burgfrauena: "Die Feuerzangenbowle"', 'Hornung', 'regular', NULL, 0, NULL, 18, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(20, '2025-02-17 00:00:00', NULL, NULL, 'Hornung', 'regular', NULL, 1, 'fällt aus (Family Day)', 19, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(21, '2025-02-24 00:00:00', 1926, 'Wortspiele und Sprichwörter', 'Hornung', 'regular', NULL, 0, NULL, 20, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(22, '2025-03-03 00:00:00', 1927, 'Schlaraffiade**, Wald und Wiese', 'Lenzmond', 'schlaraffiade', NULL, 0, NULL, 21, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(23, '2025-03-10 00:00:00', 1928, 'Sprechende Tiere', 'Lenzmond', 'regular', NULL, 0, NULL, 22, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(24, '2025-03-17 00:00:00', 1929, 'LUEGA-Sippung, Thema:Die Kunst des freundschaftlichen Humors oder die diplomatische Herausforderung zum Zweikampf', 'Lenzmond', 'regular', NULL, 0, NULL, 23, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(25, '2025-03-24 00:00:00', 1930, 'Was ist heutzutage mit der Musik los?', 'Lenzmond', 'regular', NULL, 0, NULL, 24, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(26, '2025-03-29 00:00:00', 1931, 'Samstag: Ritterschlag***', 'Lenzmond', 'special', NULL, 0, NULL, 25, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(27, '2025-03-31 00:00:00', NULL, NULL, 'Lenzmond', 'regular', NULL, 1, 'fällt aus', 26, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(28, '2025-04-07 00:00:00', 1932, 'Schlaraffiade**, Wald und Wiese', 'Ostermond', 'schlaraffiade', NULL, 0, NULL, 27, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(29, '2025-04-14 00:00:00', 1933, 'Stiftungs- und Ordensfest***', 'Ostermond', 'special', NULL, 0, NULL, 28, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(30, '2025-04-21 00:00:00', NULL, NULL, 'Ostermond', 'regular', NULL, 1, 'fällt aus (Ostermontag)', 29, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(31, '2025-04-28 00:00:00', 1934, 'Absurde Ängste', 'Ostermond', 'regular', NULL, 0, NULL, 30, '2025-11-21 20:48:30', '2025-11-21 20:48:30'),
(32, '2025-05-05 00:00:00', 1935, 'Schlußschlaraffiade und Kürung*', 'Wonnemond', 'schlaraffiade', NULL, 0, NULL, 31, '2025-11-21 20:48:30', '2025-11-21 20:48:30');

-- --------------------------------------------------------
-- Dumping data for table `member_contacts`
-- --------------------------------------------------------

INSERT INTO `member_contacts` (`id`, `member_id`, `rank_abbreviation`, `member_name`, `member_title_details`, `real_name`, `profession`, `birth_date`, `address`, `phone_home`, `phone_cell`, `phone_fax`, `email`, `category`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'OÄ', 'Tüftel der experimentelle Narrenspross', NULL, 'RUBBA Klaus (Maki)', 'Informatiker', '1974-06-18 00:00:00', '10823 - 134 Steet NW, Edmonton, AB, T5M 1H9', 7804886214, 7806550958, NULL, 'krubba@gmail.com', 'WÜRDENTRÄGER', 0, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(2, NULL, 'OK', 'Java der vernetzliche Spinner', NULL, 'RUBBA Victor (Cindy)', 'Computer Fachberater', '1970-11-05 00:00:00', '1756 Haswell Cove NW, EDMONTON, AB, T6R 3A9', 7807012849, NULL, 7807077393, 'victor@rubba.com', 'WÜRDENTRÄGER', 1, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(3, NULL, 'K', 'Weswolf der palmström\'sche Genitiv', NULL, 'FODOR Christopher', 'Kalibrierungs-Techniker', '1986-10-21 00:00:00', 'Unit 201, 2303-119 Street NW, EDMONTON, AB,  T6J 4E2', NULL, 7803405510, NULL, 'cfodor@hotmail.ca', 'WÜRDENTRÄGER', 2, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(4, NULL, 'M', 'Blarneycus der schnelle Glöckner', NULL, 'GRAHAM John (Jackie)', 'Ingenieur', '1952-01-24 00:00:00', '402 Butchart Drive NW, EDMONTON, AB, T6R 1P9', 7809885612, NULL, 7804344452, 'Mrmitre@shaw.ca', 'WÜRDENTRÄGER', 3, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(5, NULL, 'J', 'Wat-n-dat die elementare Verbindung', NULL, 'SEIDEL Wolfram (Natascha)', 'Tischler', '1974-09-29 00:00:00', '9384 - 123 Street NW, EDMONTON, AB, T5T 1K7', 7807560294, 7808501974, NULL, 'wolframseidel@rocketmail.com', 'WÜRDENTRÄGER', 4, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(6, NULL, 'Sch', 'Tetrapylo der Friedensstifter', NULL, 'LOU Marco (Gail)', 'Kriminalbeamter RCMP', '1971-07-21 00:00:00', '# 5 Range Road 53104, STONY PLAIN, AB, T7Y 2T2', 7805151433, NULL, NULL, 'marco.travler@gmail.com', 'WÜRDENTRÄGER', 5, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(7, NULL, 'C', '“Unser” Wing-Wing der fliegreyche Atmosphärenschreck', NULL, NULL, NULL, NULL, '9308 - 82 Street NW, EDMONTON, AB, T6C 2X5', 7804682728, 7809372751, NULL, 'wingwing337@gmail.com', 'WÜRDENTRÄGER', 6, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(8, NULL, NULL, 'Beton-Narr der Hochgebaute', NULL, 'RUBBA Herbert (Christine)', 'Bauführer', '1942-12-13 00:00:00', '253-51308 Range Road 224, SHERWOOD PARK, AB, T8C 1H3', NULL, NULL, NULL, 'chrisubba@yahoo.ca', 'ERBWÜRDENTRÄGER IM RUHESTAND', 7, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(9, NULL, NULL, '“Unser” Jan Maat der Alsterpirat', NULL, 'ANIELSKI', 'Hans-Ulrich (Mary Ann), Importeur', NULL, '142 Haddow Close NW, EDMONTON, AB, T6R 2T9', NULL, NULL, NULL, 'janmaat337@gmail.com', 'ERBWÜRDENTRÄGER IM RUHESTAND', 8, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(10, NULL, NULL, 'Lex tempore der Rehseesegler', NULL, 'KUEHN Peter (Dagmar)', 'Rechtsanwalt & Notar', '1937-09-20 00:00:00', '109 Twin Brooks Cove NW, EDMONTON, AB, T6J 6T1', NULL, NULL, NULL, NULL, 'ERBWÜRDENTRÄGER IM RUHESTAND', 9, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(11, NULL, NULL, 'Schöppche der Offe-Becher', NULL, NULL, NULL, NULL, 'MACK Klaus (Anita), Service Manager (22.3.1954)', NULL, NULL, 7804623111, 'mack.klaus.anita@gmail.com', 'ERBWÜRDENTRÄGER IM RUHESTAND', 10, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(12, NULL, NULL, 'Phil-o-atz Genie(s)er von Al-too-na', NULL, 'SINTENIS Ingo', 'Ingenieur i.R.', '1931-06-26 00:00:00', '2000 Fairview Court, SHERWOOD PARK, AB, T8A 0Y8', NULL, NULL, NULL, NULL, 'SESSHAFTE RITTER', 11, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(13, NULL, NULL, 'Rädle der eiernde Bioniker', NULL, 'BASLER Hermann (Irmgard)', 'Ingenieur', '1959-02-28 00:00:00', '27521 Twp Rd 514, Parkland County, AB, T7Y 2X4', 7809639069, 7802224759, NULL, 'tms.basler@gmail.com', 'SESSHAFTE RITTER', 12, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(14, NULL, NULL, 'Seekular das digitale Auge', NULL, 'von ROEDER Philipp', 'Dipl. Ing.', '1951-10-22 00:00:00', 'P.O.Box 3584, SPRUCE GROVE, AB, T7X 3A8', NULL, 7809995149, NULL, 'seekular@rvd-online.de', 'SESSHAFTE RITTER', 13, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(15, NULL, NULL, 'Wildschütz Orvis vom Felsensee', NULL, 'HOFMANN Hubert (Yvonne)', 'Supervisor Chem. Research i.R.', '1942-10-28 00:00:00', '9820 - 167 Street NW, EDMONTON, AB, T5P 3V9', 7804844518, NULL, NULL, 'hhofmann@telus.net', 'SESSHAFTE RITTER', 14, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(16, NULL, NULL, 'Junker Hans', NULL, NULL, NULL, NULL, '31-51528 Rge Rd 262, SPRUCE GROVE, AB,  T7Y 1C1', 7804184267, NULL, NULL, 'hanszurcher@hotmail.com', 'JUNKER UND KNAPPEN', 15, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(17, NULL, NULL, 'Pilger', NULL, 'NEUMEISTER Matthias', 'Kamerabühnenassistent', '1991-12-31 00:00:00', 'Bürgerheimstraße 15, 10365 BERLIN', NULL, NULL, NULL, 'matthiasneumeister@gmx.net', 'PILGER', 16, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(18, NULL, NULL, 'Prüfling', NULL, NULL, NULL, NULL, '5111 - 51 Ave, Stony Plain, AB, T7Z 1C2', 7809749347, NULL, NULL, 'de.luecke@web.de', 'PRÜFLINGE', 17, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(19, NULL, NULL, 'Abooki der ugandische Quacksalber', NULL, 'KIPP Walter (Jean)', 'Prof. f. internationales Gesundheitswesen', '1945-05-14 00:00:00', '3065 County Road 7, PICTON, ON, K0K 2T0', 6134711736, 5873402747, NULL, 'susiekipp@gmail.com', 'FAHRENDE', 18, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(20, NULL, NULL, 'Baltenherz der Hördelsche', NULL, 'Freiherr von STACKELBERG', 'Hans Ernst (Irene), Psychologe', '1934-11-28 00:00:00', '10953 - 70 Avenue NW, EDMONTON, AB, T6H 2G7', NULL, NULL, NULL, 'hvonstackelberg@shaw.ca', 'FAHRENDE', 19, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(21, NULL, NULL, 'Lichterl am Alten Platz', NULL, NULL, NULL, NULL, 'SENEKOWITSCH Gerhard, Unruheständler (30.5.1934)', NULL, NULL, NULL, NULL, 'EHRENRITTER', 20, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(22, NULL, NULL, 'Brüner der Grafschafter', NULL, NULL, NULL, NULL, 'BRUNS Heinz-Jürgen, (5.7.1942)', NULL, NULL, NULL, NULL, 'EHRENRITTER', 21, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(23, NULL, NULL, 'Rohrbruch vom Wörthersee', NULL, NULL, NULL, NULL, 'GORITSCHNIG Libert, Installationsmeister (6.12.1944)', NULL, NULL, NULL, NULL, 'EHRENRITTER', 22, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(24, NULL, NULL, 'Burgfrau Acturus', NULL, 'Adresse bei', 'Rt. Schöppche zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, 'BURGFRAUEN IN AHALL WEILENDER SASSEN', 23, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(25, NULL, NULL, 'Burgfrau Künec', NULL, 'Adresse bei', 'Rt. Jan Maat zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, 'BURGFRAUEN IN AHALL WEILENDER SASSEN', 24, '2025-11-21 20:00:18', '2025-11-21 20:43:10'),
(26, NULL, 'OÄ', 'Tüftel der experimentelle Narrenspross', NULL, 'RUBBA Klaus (Maki)', 'Informatiker', '1974-06-18 00:00:00', '10823 - 134 Steet NW, Edmonton, AB, T5M 1H9', 7804886214, 7806550958, NULL, 'krubba@gmail.com', NULL, 0, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(27, NULL, 'OK', 'Java der vernetzliche Spinner', NULL, 'RUBBA Victor (Cindy)', 'Computer Fachberater', '1970-11-05 00:00:00', '1756 Haswell Cove NW, EDMONTON, AB, T6R 3A9', 7807012849, NULL, 7807077393, 'victor@rubba.com', NULL, 1, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(28, NULL, 'K', 'Weswolf der palmström\'sche Genitiv', NULL, 'FODOR Christopher', 'Kalibrierungs-Techniker', '1986-10-21 00:00:00', 'Unit 201, 2303-119 Street NW, EDMONTON, AB,  T6J 4E2', NULL, 7803405510, NULL, 'cfodor@hotmail.ca', NULL, 2, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(29, NULL, 'M', 'Blarneycus der schnelle Glöckner', NULL, 'GRAHAM John (Jackie)', 'Ingenieur', '1952-01-24 00:00:00', '402 Butchart Drive NW, EDMONTON, AB, T6R 1P9', 7809885612, NULL, 7804344452, 'Mrmitre@shaw.ca', NULL, 3, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(30, NULL, 'J', 'Wat-n-dat die elementare Verbindung', NULL, 'SEIDEL Wolfram (Natascha)', 'Tischler', '1974-09-29 00:00:00', '9384 - 123 Street NW, EDMONTON, AB, T5T 1K7', 7807560294, 7808501974, NULL, 'wolframseidel@rocketmail.com', NULL, 4, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(31, NULL, 'Sch', 'Tetrapylo der Friedensstifter', NULL, 'LOU Marco (Gail)', 'Kriminalbeamter RCMP', '1971-07-21 00:00:00', '# 5 Range Road 53104, STONY PLAIN, AB, T7Y 2T2', 7805151433, NULL, NULL, 'marco.travler@gmail.com', NULL, 5, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(32, NULL, 'C', '“Unser” Wing-Wing der fliegreyche Atmosphärenschreck', NULL, NULL, NULL, NULL, '9308 - 82 Street NW, EDMONTON, AB, T6C 2X5', 7804682728, 7809372751, NULL, 'wingwing337@gmail.com', NULL, 6, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(33, NULL, NULL, 'Beton-Narr der Hochgebaute', NULL, 'RUBBA Herbert (Christine)', 'Bauführer', '1942-12-13 00:00:00', '253-51308 Range Road 224, SHERWOOD PARK, AB, T8C 1H3', NULL, NULL, NULL, 'chrisubba@yahoo.ca', NULL, 7, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(34, NULL, NULL, '“Unser” Jan Maat der Alsterpirat', NULL, 'ANIELSKI Hans', '-Ulrich (Mary Ann), Importeur', NULL, '142 Haddow Close NW, EDMONTON, AB, T6R 2T9', NULL, NULL, NULL, 'janmaat337@gmail.com', NULL, 8, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(35, NULL, NULL, 'Lex tempore der Rehseesegler', NULL, 'KUEHN Peter (Dagmar)', 'Rechtsanwalt & Notar', '1937-09-20 00:00:00', '109 Twin Brooks Cove NW, EDMONTON, AB, T6J 6T1', NULL, NULL, NULL, NULL, NULL, 9, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(36, NULL, NULL, 'Schöppche der Offe-Becher', NULL, 'NLSI', '-2, NLDN-2, NLNO, Urs, Erb, Km, ErbA, ErbK, ErbRpb, ErbRpst, A, Chr, Btr, NV, ER 126, 293, 372, 415, silb. V.Med. LVNA', NULL, '20710 - 9 Avenue SW, EDMONTON, AB, T6M 2N9', NULL, NULL, 7804623111, 'mack.klaus.anita@gmail.com', NULL, 10, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(37, NULL, NULL, 'Phil-o-atz Genie(s)er von Al-too-na', NULL, 'SINTENIS Ingo', 'Ingenieur i.R.', '1931-06-26 00:00:00', '2000 Fairview Court, SHERWOOD PARK, AB, T8A 0Y8', NULL, NULL, NULL, NULL, NULL, 11, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(38, NULL, NULL, 'Rädle der eiernde Bioniker', NULL, 'BASLER Hermann (Irmgard)', 'Ingenieur', '1959-02-28 00:00:00', '27521 Twp Rd 514, Parkland County, AB, T7Y 2X4', 7809639069, 7802224759, NULL, 'tms.basler@gmail.com', NULL, 12, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(39, NULL, NULL, 'Seekular das digitale Auge', NULL, 'von ROEDER Philipp', 'Dipl. Ing.', '1951-10-22 00:00:00', 'T: 780-999-5149 (Cell) +49-171-1228527 (Handy)  e-mail: <a href="mailto:seekular@rvd-online.de">seekular@rvd-online.de</a>', NULL, 7809995149, NULL, 'seekular@rvd-online.de', NULL, 13, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(40, NULL, NULL, 'Wildschütz Orvis vom Felsensee', NULL, 'HOFMANN Hubert (Yvonne)', 'Supervisor Chem. Research i.R.', '1942-10-28 00:00:00', 'T: 780-484-4518 (Hb)  e-mail: <a href="mailto:hhofmann@telus.net">hhofmann@telus.net</a>', 7804844518, NULL, NULL, 'hhofmann@telus.net', NULL, 14, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(41, NULL, NULL, 'Junker Hans', NULL, NULL, NULL, NULL, '31-51528 Rge Rd 262, SPRUCE GROVE, AB,  T7Y 1C1', 7804184267, NULL, NULL, 'hanszurcher@hotmail.com', NULL, 15, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(42, NULL, NULL, 'Pilger', NULL, 'NEUMEISTER Matthias', 'Kamerabühnenassistent', '1991-12-31 00:00:00', 'T: +49-157-74195634 (Cell)  e-mail: <a href="mailto:matthiasneumeister@gmx.net">matthiasneumeister@gmx.net</a>', NULL, NULL, NULL, 'matthiasneumeister@gmx.net', NULL, 16, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(43, NULL, NULL, 'Prüfling', NULL, NULL, NULL, NULL, '5111 - 51 Ave, Stony Plain, AB, T7Z 1C2', 7809749347, NULL, NULL, 'de.luecke@web.de', NULL, 17, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(44, NULL, NULL, 'Abooki der ugandische Quacksalber', NULL, 'KIPP Walter (Jean)', 'Prof. f. internationales Gesundheitswesen', '1945-05-14 00:00:00', '3065 County Road 7, PICTON, ON, K0K 2T0', 6134711736, 5873402747, NULL, 'susiekipp@gmail.com', NULL, 18, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(45, NULL, NULL, 'Baltenherz der Hördelsche', NULL, 'Freiherr von STACKELBERG', 'Hans Ernst (Irene), Psychologe', '1934-11-28 00:00:00', 'T/Fax: 780-436-3221  e-mail: <a href="mailto:hvonstackelberg@shaw.ca">hvonstackelberg@shaw.ca</a>', NULL, NULL, NULL, 'hvonstackelberg@shaw.ca', NULL, 19, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(46, NULL, NULL, 'Lichterl am Alten Platz', NULL, NULL, NULL, NULL, 'Auergasse 2, A-9020 KLAGENFURT, ÖSTERREICH', NULL, NULL, NULL, NULL, NULL, 20, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(47, NULL, NULL, 'Brüner der Grafschafter', NULL, NULL, NULL, NULL, '777 East Chestermere Drive, CHESTERMERE LAKE, AB, T1X 1A6', NULL, NULL, NULL, NULL, NULL, 21, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(48, NULL, NULL, 'Rohrbruch vom Wörthersee', NULL, NULL, NULL, NULL, '79 Applefield Close SE, CALGARY, AB, T2A 7R1', NULL, NULL, NULL, NULL, NULL, 22, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(49, NULL, NULL, 'Burgfrau Acturus', NULL, 'Adresse bei Rt', '. Schöppche zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(50, NULL, NULL, 'Burgfrau Künec', NULL, 'Adresse bei Rt', '. Jan Maat zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, '2025-11-21 20:00:34', '2025-11-21 20:00:34'),
(51, NULL, NULL, '“Unser” Jan Maat der Alsterpirat', NULL, 'ANIELSKI', 'Hans-Ulrich (Mary Ann), Importeur', NULL, '142 Haddow Close NW, EDMONTON, AB, T6R 2T9', NULL, NULL, NULL, 'janmaat337@gmail.com', NULL, 8, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(52, NULL, NULL, 'Schöppche der Offe-Becher', NULL, 'MACK Klaus (Anita)', 'Service Manager', '1954-03-22 00:00:00', '20710 - 9 Avenue SW, EDMONTON, AB, T6M 2N9', NULL, NULL, 7804623111, 'mack.klaus.anita@gmail.com', NULL, 10, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(53, NULL, NULL, 'Seekular das digitale Auge', NULL, NULL, NULL, NULL, 'P.O.Box 3584, SPRUCE GROVE, AB, T7X 3A8', NULL, 7809995149, NULL, 'seekular@rvd-online.de', NULL, 13, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(54, NULL, NULL, 'Baltenherz der Hördelsche', NULL, NULL, NULL, NULL, '10953 - 70 Avenue NW, EDMONTON, AB, T6H 2G7', NULL, NULL, NULL, 'hvonstackelberg@shaw.ca', NULL, 19, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(55, NULL, NULL, 'Lichterl am Alten Platz', NULL, 'SENEKOWITSCH Gerhard', 'Unruheständler', '1934-05-30 00:00:00', 'Auergasse 2, A-9020 KLAGENFURT, ÖSTERREICH', NULL, NULL, NULL, NULL, NULL, 20, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(56, NULL, NULL, 'Brüner der Grafschafter', NULL, 'BRUNS', 'Heinz-Jürgen,', NULL, '777 East Chestermere Drive, CHESTERMERE LAKE, AB, T1X 1A6', NULL, NULL, NULL, NULL, NULL, 21, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(57, NULL, NULL, 'Burgfrau Acturus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(58, NULL, NULL, 'Burgfrau Künec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, '2025-11-21 20:00:55', '2025-11-21 20:00:55'),
(59, NULL, NULL, 'Schöppche der Offe-Becher', NULL, NULL, NULL, NULL, 'MACK Klaus (Anita), Service Manager (22.3.1954)', NULL, NULL, 7804623111, 'mack.klaus.anita@gmail.com', NULL, 10, '2025-11-21 20:01:58', '2025-11-21 20:01:58'),
(60, NULL, NULL, 'Burgfrau Acturus', NULL, 'Adresse bei', 'Rt. Schöppche zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, '2025-11-21 20:01:58', '2025-11-21 20:01:58'),
(61, NULL, NULL, 'Burgfrau Künec', NULL, 'Adresse bei', 'Rt. Jan Maat zu erfragen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, '2025-11-21 20:01:58', '2025-11-21 20:01:58');

-- --------------------------------------------------------
-- Dumping data for table `member_ranks`
-- --------------------------------------------------------

INSERT INTO `member_ranks` (`id`, `name`, `slug`, `sort_order`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Würdenträger', 'wurdentrager', 1, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28'),
(2, 'Erbwürdenträger im Ruhestand', 'erbwurdentrager-im-ruhestand', 2, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28'),
(3, 'Sesshafte Ritter', 'sesshafte-ritter', 3, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28'),
(4, 'Fahrende Ritter', 'fahrende-ritter', 4, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28'),
(5, 'Ritter in Ahall', 'ritter-in-ahall', 5, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28'),
(6, 'Ehemalige Sassen', 'ehemalige-sassen', 6, NULL, '2025-11-21 19:55:28', '2025-11-21 19:55:28');

-- --------------------------------------------------------
-- Dumping data for table `members`
-- --------------------------------------------------------

INSERT INTO `members` (`id`, `member_rank_id`, `name`, `title`, `rank_abbreviation`, `shield_image`, `shield_thumbnail`, `meeting_number`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tüftel', 'der experimentelle Narrenspross', 'OÄ.', 'shields/tuftel.png', 'shields/thumbnails/tuftel-sm.gif', NULL, 1, 0, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(2, 1, 'Rädle', 'der eiernde Bioniker', 'OI.', 'shields/radle.png', 'shields/thumbnails/radle-sm.gif', NULL, 1, 1, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(3, 1, 'Java', 'der vernetzliche Spinner', 'OK.', 'shields/keinwappen.png', 'shields/thumbnails/keinwappen-sm.gif', NULL, 1, 2, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(4, 1, 'Weswolf', 'der palmström\'sche Genitiv', 'K.', 'shields/weswolf.png', 'shields/thumbnails/weswolf-sm.gif', NULL, 1, 3, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(5, 1, 'Blarneycus', 'der schnelle Glöckner', 'M.', 'shields/blarneycus.png', 'shields/thumbnails/blarneycus-sm.gif', NULL, 1, 4, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(6, 1, 'S\'Gnalld', 'der verhinderte Scharfschütze', 'J.', 'shields/sgnalld.png', 'shields/thumbnails/sgnalld-sm.gif', NULL, 1, 5, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(7, 1, 'Tetrapylo', 'der Friedensstifter', 'Sch.', 'shields/keinwappen.png', 'shields/thumbnails/keinwappen-sm.gif', NULL, 1, 6, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(8, 1, 'Wing-Wing', 'der fliegreyche Atmosphärenschreck', 'C.', 'shields/wingwing.png', 'shields/thumbnails/wingwing-sm.gif', NULL, 1, 7, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(9, 1, 'Baltenherz', 'der Hördelsche', NULL, 'shields/baltenherz.png', 'shields/thumbnails/baltenherz-sm.gif', NULL, 1, 8, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(10, 1, 'Beton-Narr', 'der Hochgebaute', NULL, 'shields/betonnarr.png', 'shields/thumbnails/betonnarr-sm.gif', NULL, 1, 9, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(11, 1, 'Jan Maat', 'der Alsterpirat', NULL, 'shields/janmaat.png', 'shields/thumbnails/janmaat-sm.gif', NULL, 1, 10, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(12, 1, 'Lex Tempore', 'der Rehseesegler', NULL, 'shields/lextempore.png', 'shields/thumbnails/lextempore-sm.gif', NULL, 1, 11, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(13, 1, 'Schöppche', 'der Offe-Becher', NULL, 'shields/schoppche.png', 'shields/thumbnails/schoppche-sm.gif', NULL, 1, 12, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(14, 3, 'InseRath', 'der Tonangeber', NULL, 'shields/inserath.png', 'shields/thumbnails/inserath-sm.gif', NULL, 1, 13, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(15, 3, 'Phil-o-atz', 'Genie(s)er von Al-too-na', NULL, 'shields/philoatz.png', 'shields/thumbnails/philoatz-sm.gif', NULL, 1, 14, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(16, 3, 'Seekular', 'das digitale Auge', NULL, 'shields/seekular.png', 'shields/thumbnails/seekular-sm.gif', NULL, 1, 15, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(17, 3, 'Tilly', 'Flieger vom Kloster', NULL, 'shields/tilly.png', 'shields/thumbnails/tilly-sm.gif', NULL, 1, 16, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(18, 3, 'Wildschütz', 'Orvis vom Felsensee', NULL, 'shields/wildschutz.png', 'shields/thumbnails/wildschutz-sm.gif', NULL, 1, 17, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(19, 4, 'Abooki', 'der ugandische Quacksalber', NULL, 'shields/abooki.png', 'shields/thumbnails/abooki-sm.gif', NULL, 1, 18, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(20, 4, 'Finanz-o-Phil', 'der bärige Schübelbacher', NULL, 'shields/finanzophil.png', 'shields/thumbnails/finanzophil-sm.gif', NULL, 1, 19, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(21, 4, 'Kielius', 'der Statische', NULL, 'shields/kielius.png', 'shields/thumbnails/kielius-sm.gif', NULL, 1, 20, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(22, 4, 'Lipp\'Quell', 'vom Odin-Aug\'', NULL, 'shields/keinwappen.png', 'shields/thumbnails/keinwappen-sm.gif', NULL, 1, 21, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(23, 5, 'Weiland Ritter', 'Zahn-Häuser', NULL, 'shields/zahnhauser.png', 'shields/thumbnails/zahnhauser-sm.gif', NULL, 0, 51, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(24, 6, 'Weiland Ritter', 'Quo vadis', NULL, 'shields/quovadis.png', 'shields/thumbnails/quovadis-sm.gif', 415, 0, 58, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(25, 6, 'Cularis', 'der Ru(h)mgetriebene Ruhr(s)pottsprössling', NULL, 'shields/cularis.png', 'shields/thumbnails/cularis-sm.gif', 42, 1, 56, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(26, 6, 'Preuß', 'vom Elchwinkel', NULL, 'shields/preuss.png', 'shields/thumbnails/preuss-sm.gif', 415, 1, 57, '2025-11-21 20:13:15', '2025-11-21 20:13:15'),
(27, 6, 'Weißbinder', 'vom Fuldastrand', NULL, 'shields/weissbinder.png', 'shields/thumbnails/weissbinder-sm.gif', 386, 1, 59, '2025-11-21 20:13:15', '2025-11-21 20:13:15');

-- --------------------------------------------------------
-- Dumping data for table `migrations`
-- --------------------------------------------------------

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_21_181830_create_member_ranks_table', 2),
(5, '2025_11_21_181831_create_fechsungen_table', 2),
(6, '2025_11_21_181831_create_gallery_images_table', 2),
(7, '2025_11_21_181831_create_meetings_table', 2),
(8, '2025_11_21_181831_create_members_table', 2),
(9, '2025_11_21_181831_create_pages_table', 2),
(10, '2025_11_21_195937_create_member_contacts_table', 3),
(11, '2025_11_21_200444_create_categories_table', 4),
(12, '2025_11_21_200450_add_category_id_to_gallery_images_table', 4),
(15, '2025_11_21_201907_create_krystalline_entries_table', 5),
(16, '2025_11_21_201907_create_krystallinen_table', 5);

-- --------------------------------------------------------
-- Dumping data for table `pages`
-- --------------------------------------------------------

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `meta_description`, `is_published`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Über uns', 'uberuns', '<p style="text-align: center; ;">Montag, Glock 19:00</p><p style="text-align: center; ;">Veste Maxi-muß&#039;</p><p style="text-align: center; ;">Royal Gardens Community League</p><p style="text-align: center; ;">4030 117 St NW, Edmonton, AB, T6J 2W5, Kanada</p><p style="text-align: center; ;">Bitte fragt vor einem Einritt beim Kantzler nach.</p><p style="text-align: center; ;">Das Reych kann seinen Sippungsort eventuell ändern.</p><p style="text-align: center; ;">Ambtliche Anschrift:</p><p style="text-align: center; ;">Kantzler: Rt. Weswolf</p><p style="text-align: center; ;">Christopher Fodor</p><p style="text-align: center; ;">201, 2303-119 Street NW</p><p style="text-align: center; ;">EDMONTON, AB, T6J 4E2</p><p style="text-align: center; ;">T: 780-340-5510</p><p style="text-align: center; ;">e-mail: <a href="mailto:cfodor@hotmail.ca">cfodor@hotmail.ca</a></p>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 22:10:58'),
(2, 'Geschichte', 'geschichte', '<p class="gp1"><img src="/storage/images/Buchst_F.gif" alt="F" />akten:</p>
                <p class="gp2">Schlaraffia ist eine am 10. Oktober 1859 in Prag gegründete Männervereinigung.
                   Mittlerweile weltweit agierend ist sie die einzige Vereinigung, in der nur Deutsch gesprochen
                   wird. Ziele der Schlaraffen sind die Pflege von Freundschaft, Kunst und Humor. In 263 Vereinen
                   (Stand 2015) sind mehr als 10.000 Mitglieder organisiert. Der Wahlspruch der Schlaraffen
                   lautet „In Arte Voluptas“ - „In der Kunst liegt das Vergnügen“.</p>
                <p class="gp1"><img src="/storage/images/Buchst_T.gif" alt="T" />rivia:</p>
                <p class="gp1">Die Schlaraffen sind schon ein eigenes Völkchen.</p>
                <p class="gp1">Sie treffen sich im Winterhalbjahr (auf der Nordhalbkugel von Oktober bis April, auf der
                   Südhalbkugel von April bis Oktober) zu ihren Sitzungen, Sippungen genannt, einmal pro Woche
                   in ihrer Schlaraffenburg. Im Sommerhalbjahr treffen sie sich zu gelegentlichen Sommerfesten,
                   Krystallinen genannt.</p>
                <p class="gp1">Dieser Männerbund pflegt seine eigene Sprache, das Schlaraffenlatein. Wie oben schon
                   angedeutet, spricht man von Sippungen, das Auto ist ein Benzinross, ein Feuerzeug eine
                   Brandfackel und die Schwiegermutter ist der Burgschreck.</p>
                <p class="gp1">Sie haben auch ihre eigene Zeitrechnung beginnend mit dem Gründungsdatum. Das heißt,
                   2015 ist das 156. Jahr seit der Gründung.</p>
                <p class="gp1">Schlaraffia ist kein Geheimbund. Mitglied kann jeder Mann von unbescholtenem Ruf und gesicherter
                   Stellung werden. Die Satzung regelt, dass aus einem von einem Schlaraffen eingeführten Gast,
                   „Pilger“ genannt, nach einigen Sippungen ein „Prüfling“,
                   anschließend ein „Knappe“, schließlich ein „Junker“ und
                   letztendlich ein „Ritter“ wird. Dies ist natürlich mit den jeweiligen Prüfungen
                   verbunden. Der Ritter erhält auch einen neuen meist witzig, persiflierenden Namen. Erst jetzt
                   kann das Mitglied, der „Sasse“, mit allen Rechten und Pflichten am ritterlichen Spiel
                   mit geistigen Waffen teilnehmen.</p>
                <p class="gp2">Ein Schlaraffe ist nie allein. Geht er auf Reisen, so wird er in der ganzen Welt mit offenen Armen in
                   anderen Reychen aufgenommen. Die Freundschaft zu Sassen anderer Reyche ist ein wichtiger Bestandteil
                   des schlaraffischen Lebens. So kann jeder Schlaraffe im „Vademecum“ nachlesen, wo und wann
                   eine Sippung in einem anderen Reych abgehalten wird.</p>
                <p class="gp1"><img src="/storage/images/Buchst_G.gif" alt="G" />ründung:</p>
                <p class="gp1">1859 in Prag, der Hauptstadt des damaligen Königreiches Böhmen in der Habsburger Monarchie,
                  gehörten eine Reihe deutschsprachiger Künstler, Sänger, Schauspieler, aber auch Geschäftsleute,
                  dem „Nobelklub“ Arcadia an. Aufgrund ihrer gesellschaftlichen Stellung wurden sie dort beleidigend als
                  „Proletarier“ bezeichnet. Unter Protest kündigten sie ihre Mitgliedschaft und gründeten einen
                  eigenen Verein. Diesen nannten sie spaßhaft und ironisch den „Proletarierbund“, den sie später
                  in „Schlaraffia“ umbenannten.</p>
                <p class="gp1">Schnell verbreitete sich die Schlaraffische Idee. So entstanden bis 1934 insgesamt 305 Reyche.</p>
                <p class="gp2">Die Zeit des Nationalsozialismus war auch für Schlaraffia schwer. Dem Verbot international verbundener
                  Vereinigungen durch die nationalsozialistische Regierung in Deutschland fielen viele Schlaraffenreyche in Deutschland
                  und im Osten Europas zum Opfer. Der Geist der überlebenden Schlaraffen war jedoch nicht gebrochen und Schlaraffia
                  regenerierte sich nach dem Krieg wieder weltweit.</p>
                <p class="gp1"><img src="/storage/images/Buchst_P.gif" alt="P" />rima Canadensis:</p>
                <p class="gp1">1957 wurde das erste kanadische schlaraffische Reych - unsere Prima Canadensis - von Vater Erich 
                  („Maxi-muß“) und Sohn Robert („PRAGAmemnon“) Jüthner-Krtschan, aus dem Reych Claudium
                  forum in Klagenfurt in Österreich kommend, in Edmonton, Alberta gegründet.</p>
                <p class="gp2">Im Laufe der fast sechs Jahrzehnte der Prima Canadensis haben sich viele um Schlaraffia verdient gemacht.
                  All deren Namen zu erwähnen würde über den Rahmen dieser Betrachtungen gehen. Es soll jedoch angeführt
                  werden, dass Ritter „Jan Maat“ für zehn Jahre das Amt des Vorsitzenden der „Schlaraffia Nordamerika“,
                  die alle Reyche in USA, Kanada und Mexiko umfasst, bekleidete. Zehn Jahre wirkte er als „Allschlaraffenrat“, in der
                  „Allschlaraffia“ benannten Dachorganisation, der alle Schlaraffen in der Welt angehören.</p>
                <p class="gp1"><img src="/storage/images/Buchst_S.gif" alt="S" />chlaraffia in Kanada:</p>
                <p class="gp1">1962 wurde das Reych „Porta Ontariae“ in Toronto, Ontario gegründet 1970 kam die „Rocky
                  Mountania“ in Calgary, Alberta hinzu, gefolgt von „Fort Okanagan“ in Kelowna, British Columbia, 1976,
                  „Am Silbersee“ in Vernon, British Columbia, 1987, „Porta Pacifica“ in Vancouver, British Columbia,
                  1988 und „Kamlupsia“ in Kamloops, British Columbia, 1997. Nach vielen Jahren als Stammtisch, Feldlager und Colonie
				  wurde inmitten der Corona-Pandemie, am 10.10.2020, die Colonie Gloria Victoria zum Reych erhoben. Eine in der Geschichte der
				  Schlaraffia wohl einmalige Feier, die in der Heimburg des Mitbegründers Dieter Bloedorn, schlaraffisch Ritter Kielius stattfand.
				  Nur er, Martin Schlegel (Ritter Raoul) und der vom Allschlaraffenrat beauftragte Ritter Schöppche aus unserem Reych waren
				  anwesend, als die Heimburg geweiht wurde. Die Mitglieder der Colonie und zahlreiche Gäste aus aller Welt konnten der Feier
				  via Videoschaltung folgen und auch ihre Beiträge übermitteln.</p>
                  <p class="gp2">Leider mussten die Reyche „Am Silbersee“ 2008 und „Fort Okanagan“ 2009 auf Grund mangelnder
				  Mitglieder wieder geschlossen werden.</p>
              </div>
            </div>
          </div>
        </div>

      </div>
        <div id="ft">
          
			
        </div>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 22:19:02'),
(3, 'Unterschlupf', 'unterschlupf', '<p style="text-align: center; ;" class="ubp1">Unterschlupfmöglichkeit in der Nähe der Burg:</p><p style="text-align: center; ;" class="ubp1">Es gibt einige Hotels entlang dem Gateway Boulevard,</p><p style="text-align: center; ;" class="ubp1">einige davon mit kostenlosen Parkplätzen, das ist eventuell wichtig,</p><p style="text-align: center; ;" class="ubp1">weil keines der Hotels in Gehweite zur Burg ist.</p><p style="text-align: center; ;" class="ubp1">Es ist in jedem Fall zu empfehlen mit dem Kantzler,</p><p style="text-align: center; ;" class="ubp1">Rt Weswolf kontakt aufzunehemen:</p><p style="text-align: center; ;" class="ubp1">Profan Christopher Fodor</p><p style="text-align: center; ;" class="ubp1">T: 780-340-5510 (Cell)</p><p style="text-align: center; ;" class="ubp1">e-mail: <a href="mailto:cfodor@hotmail.ca">cfodor@hotmail.ca</a></p>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 23:25:40'),
(4, 'Festschrift', 'festschrift', '<p style="text-align: center; ;"><a href="/storage/pdf/Festschrift.pdf" target="_blank"><img src="/storage/images/festschrift.png" alt="Festschrift"></a></p>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 23:27:13'),
(5, 'Stiftungsfest Fechsung', 'sffechsung', '<table><tbody><tr><th rowspan="1" colspan="1"></th><th rowspan="1" colspan="2">Fechsungen zum Fest und zur Tour</th><th rowspan="1" colspan="1"></th><th rowspan="1" colspan="1"></th></tr><tr><td rowspan="1" colspan="1"></td><td class="kry1" rowspan="1" colspan="1">Nicht-ambtliches Protokoll zur Landestagung</td><td class="kry2" rowspan="1" colspan="1">Rt. Stets-frech (8)</td><td class="kry3" rowspan="1" colspan="1"><a href="/storage/pdf/nap_reychstagung.pdf" target="_blank"><img src="/storage/images/manual.png" alt="NAP Reychstagung"></a></td><td rowspan="1" colspan="1"><p></p></td></tr><tr><td rowspan="1" colspan="1"></td><td class="kry1" rowspan="1" colspan="1">Nicht-ambtliches Protokoll zum Stiftungsfest</td><td class="kry2" rowspan="1" colspan="1">Rt. So-ja! (239)</td><td class="kry3" rowspan="1" colspan="1"><a href="/storage/pdf/nap_stiftungsfest.pdf" target="_blank"><img src="/storage/images/manual.png" alt="NAP Stiftungsfest"></a></td><td rowspan="1" colspan="1"><p></p></td></tr><tr><td rowspan="1" colspan="1"></td><td class="kry1" rowspan="1" colspan="1">Bänkelgesänge zur Tour</td><td class="kry2" rowspan="1" colspan="1">Rt. Ton-Mobil (305)</td><td class="kry3" rowspan="1" colspan="1"><a href="/storage/pdf/bankelgesang.pdf" target="_blank"><img src="/storage/images/manual.png" alt="B&auml;nkelges&auml;nge"></a></td><td rowspan="1" colspan="1"><p></p></td></tr><tr><td rowspan="1" colspan="1"></td><td class="kry1" rowspan="1" colspan="1">Durch die Berge an die Küste</td><td class="kry2" rowspan="1" colspan="1">Rt. Stoffel (2)</td><td class="kry3" rowspan="1" colspan="1"><a href="/storage/pdf/durchdie berge.pdf" target="_blank"><img src="/storage/images/manual.png" alt="Durch die Berge an die K&uuml;ste"></a></td><td rowspan="1" colspan="1"><p></p></td></tr><tr><td rowspan="1" colspan="1"></td><td class="kry1" rowspan="1" colspan="1">Ritter Stets-frech zur Reise</td><td class="kry2" rowspan="1" colspan="1">Rt. Stets-frech (8)</td><td class="kry3" rowspan="1" colspan="1"><a href="/storage/pdf/Stetsfrechzurreise.pdf" target="_blank"><img src="/storage/images/manual.png" alt="Rt. Stets-frech zur Reise"></a></td><td rowspan="1" colspan="1"><p></p></td></tr></tbody></table><p class="spf4"></p>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 22:19:07'),
(6, 'Krystallinen', 'krystallinen', '<p style="text-align: center; ;">Egal ob’s regnet oder schneit</p><p style="text-align: center; ;">Wir sind jetzt in der Sommerzeit!</p><p style="text-align: center; ;">Mal ist&#039;s zu heiß, mal ist’s zu nass -</p><p style="text-align: center; ;">Alberta Wetter ist halt krass!</p><p style="text-align: center; ;">Doch macht uns dieses gar nichts aus,</p><p style="text-align: center; ;">Mit Proviant geht es hinaus</p><p style="text-align: center; ;">Mit frohem Sinn und heit’rer Miene</p><p style="text-align: center; ;">Zu Wing-Wings Heumond Krystalline!</p><p style="text-align: center; ;">Die Wiesen grün wie eh und je,</p><p style="text-align: center; ;">Wie immer hier am Inselsee.</p><p style="text-align: center; ;">Und sollt’ das Wetter schlecht sein draussen</p><p style="text-align: center; ;">So werden wir halt innen hausen.</p><p style="text-align: center; ;">Doch meistens ist das Wetter gut.</p><p style="text-align: center; ;">So nehmt den Sonnenschirm und Hut</p><p style="text-align: center; ;">Und macht euch fröhlich auf die Socken,</p><p style="text-align: center; ;">Bleibt keinesfalls zu Hause hocken,</p><p style="text-align: center; ;">Bringt Würste, Quell, Schokopraline</p><p style="text-align: center; ;">Zu dieser schönen Krystalline!</p><p style="text-align: center; ;">Der 8. 7. ist der Tag</p><p style="text-align: center; ;">An dem man hier erscheinen mag,</p><p style="text-align: center; ;">Glock 2 da geht die Fete los,</p><p style="text-align: center; ;">Die Freude drauf ist riesengross!</p><p style="text-align: center; ;">Wer nicht weiss wo, schaut auf den Plan</p><p style="text-align: center; ;">Dann kommt mit Sicherheit man an.</p><p style="text-align: center; ;">So freut euch des Lebens,</p><p style="text-align: center; ;"> but please do remember:</p><p style="text-align: center; ;">In roughly 5 months we will have December!</p><p style="text-align: center; ;"></p><p style="text-align: center; ;" class="wingwing">Wing-Wing</p>', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 22:53:06'),
(7, 'Stammbaum', 'stammbaum', '<img src="/storage/images/Stammbaum.gif" usemap="#Map"/>
                 <map name="Map">
                    <area shape="circle" coords="305,118,120" href="#" title="Leider gibt es keine Netzburg mehr!" />
                    <area shape="circle" coords="985,152,190" href="#" title="Was habt Ihr erwartet, das Reych ist leider erloschen!" />
                    <area shape="circle" coords="491,150,120" href="http://www.rockymountania.org/" target="_blank" title="Unsere Tochter, Rocky Mountania (372)" / onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">
                    <area shape="circle" coords="409,399,120" href="http://www.portapacifica.org/" target="_blank" title="Unsere Tochter, Porta Pacifica (408)" / onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">
                    <area shape="circle" coords="180,442,120" href="#" title="Leider hat unser Küken noch keine Netzburg!" />
                    <area shape="circle" coords="683,304,160" href="#" title="Das sind wir, da seid Ihr schon!" />
                    <area shape="circle" coords="143,675,120" href="#" title="Was habt Ihr erwartet, das Reych ist leider erloschen!" />
                    <area shape="circle" coords="406,651,120" href="http://www.schlaraffia-berolina.de/" target="_blank" title="Berolina (2)" / onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">
                    <area shape="circle" coords="670,620,120" href="http://www.schlaraffia-grazia.at/" target="_blank" title="Grazia (4)" / onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">
                    <area shape="circle" coords="913,510,120" href="http://www.claudium-forum.at/" target="_blank" title="Claudium forum (126)" / onmouseover="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.add(\'hover-effect\')" onmouseout="document.querySelector(\'#stcontent img[usemap], .stcontent img[usemap]\')?.classList.remove(\'hover-effect\')">
                  </map>
            </div>
      </div>
          </div>
        <div id="ft">', NULL, 1, 0, '2025-11-21 19:55:34', '2025-11-21 22:19:02'),
(8, 'Sassenschaft', 'sassenschaft', '<table>
                  <thead>
                    <tr>
                      <th></th>
                      <th>WÜRDENTRÄGER</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="sas1">OÄ</td>
                      <td class="sas2"><p><span class="b">Tüftel der experimentelle Narrenspross</span>, Rkch, ErbW, OR, (6.1.144)</p>
                        <p>RUBBA Klaus (Maki), Informatiker (18.6.1974)</p>
                        <p>10823 - 134 Steet NW, Edmonton, AB, T5M 1H9</p>
                        <p>T: 780-488-6214 (Hb)  780-655-0958 (Fb/Cell)  e-mail: <a href="mailto:krubba@gmail.com">krubba@gmail.com</a></p>
                       </td>
                    </tr>
                    <tr>
                      <td class="sas1">OK</td>
                      <td class="sas2"><p><span class="b">Java der vernetzliche Spinner</span>, LBo, OR, (6.4.139)</p>
                        <p>RUBBA Victor (Cindy), Computer Fachberater (5.11.1970)</p>
                        <p>1756 Haswell Cove NW, EDMONTON, AB, T6R 3A9</p>
                        <p>T: 780-701-2849 (Hb)  780-707-7393 (Fb)  e-mail: <a href="mailto:victor@rubba.com">victor@rubba.com</a></p>
                      </td>
                    </tr>
					<tr>
                      <td class="sas1">K</td>
                      <td class="sas2"><p><span class="b">Weswolf der palmström\'sche Genitiv</span>, Sbw, Rpst, Rpb, OR, (30.4.153)</p>
                        <p>FODOR Christopher, Kalibrierungs-Techniker (21.10.1986)</p>
                        <p>Unit 201, 2303-119 Street NW, EDMONTON, AB,  T6J 4E2</p>
                        <p>T: 780-340-5510 (Cell) e-mail: <a href="mailto:cfodor@hotmail.ca">cfodor@hotmail.ca</a></p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1">M</td>
                      <td class="sas2"><p><span class="b">Blarneycus der schnelle Glöckner</span>, Urs, ErbWA, ErbM WA, P, OR, (5.3.148)</p>
                        <p>GRAHAM John (Jackie), Ingenieur (24.01.1952)</p>
                        <p>402 Butchart Drive NW, EDMONTON, AB, T6R 1P9</p>
                        <p>T: 780-988-5612 (Hb)  780-434-4452 (Fb)  e-mail: <a href="mailto:Mrmitre@shaw.ca">Mrmitre@shaw.ca</a></p>
                      </td>
                    </tr>
                    <tr>
                       <td class="sas1">J</td>
                      <td class="sas2"><p><span class="b">Wat-n-dat die elementare Verbindung</span>, Md, Rkll, OR (2.5.157)</p>
                        <p>SEIDEL Wolfram (Natascha), Tischler (29.9.1974)</p>
                        <p>9384 - 123 Street NW, EDMONTON, AB, T5T 1K7</p>
                        <p>T: 780-756-0294 (Hb) 780-850-1974 (Cell)</p>
                        <p>e-mail: <a href="mailto:wolframseidel@rocketmail.com">wolframseidel@rocketmail.com</a></p>
                      </td>
                    </tr>
					<tr>
                      <td class="sas1">Sch</td>
                      <td class="sas2"><p><span class="b">Tetrapylo der Friedensstifter</span>, Rs, Sm, OR, (25.4.149)</p>
                        <p>LOU Marco (Gail), Kriminalbeamter RCMP (21.7.1971)</p>
                        <p># 5 Range Road 53104, STONY PLAIN, AB, T7Y 2T2</p>
                        <p>T: 780-515-1433 (Hb)  e-mail: <a href="mailto:marco.travler@gmail.com">marco.travler@gmail.com</a></p>
                      </td>
                   </tr>
                   <tr>
                      <td class="sas1">C</td>
					  <td class="sas2"><p><span class="b">“Unser” Wing-Wing der fliegreyche Atmosphärenschreck</span>, ASR (149-154), SRNA (149-154), LVDCB, NLSI-2, NLPC-2, Urs, Erb, ErbRbe, Km, Hfm, Hfn, Rbe, ErbO, ErbC, ER 372, 415, silb. V.Med. LVNA (6.3.130)</p>
                        <p>MÜRRLE Thomas, Pilot (2.7.1951)</p>
                        <p>9308 - 82 Street NW, EDMONTON, AB, T6C 2X5</p>
                        <p>T: 780-468-2728 (Hb)  780-937-2751 (Cell)  e-mail: <a href="mailto:wingwing337@gmail.com">wingwing337@gmail.com</a></p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>ERBWÜRDENTRÄGER IM RUHESTAND</th>
                    </tr>
                  </thead>
                  <tbody>
					<tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Beton-Narr der Hochgebaute</span>,LBCS, LBo, GU, Erb, ErbT, ErbO, Km, WS, B, T, ER 126, (7.3.129)</p>
                        <p>RUBBA Herbert (Christine), Bauführer (13.12.1942)</p>
                        <p>253-51308 Range Road 224, SHERWOOD PARK, AB, T8C 1H3</p>
                        <p>T: 780-922-3665  e-mail: <a href="mailto:chrisubba@yahoo.ca">chrisubba@yahoo.ca</a></p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">“Unser” Jan Maat der Alsterpirat</span>, ASR (125-135), SRNA (124-135), LB-2,
							LBa, LV-4, LCA, LL, NLDN, NLFC-2, NLFL, NLBI, NLLC, NLSI-2, NLPC-2, NLDN-2, GU, Erb, Km, ErbO, ErbK, ErbRpst, ErbRbe, Rp,
							OR, ER 198, 229, 372, 387, 403, 406, 408, Kolumbusritter II, (6.3.108)</p>
                        <p>ANIELSKI Hans-Ulrich (Mary Ann), Importeur (25.11.1935)</p>
                        <p>142 Haddow Close NW, EDMONTON, AB, T6R 2T9</p>
                        <p>T: 780-438-3408  e-mail: <a href="mailto:janmaat337@gmail.com">janmaat337@gmail.com</a></p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Lex tempore der Rehseesegler</span>, GU, Erb, Km, ErbO, SR, (6.11.130)</p>
                        <p>KUEHN Peter (Dagmar), Rechtsanwalt & Notar (20.9.1937)</p>
                        <p>109 Twin Brooks Cove NW, EDMONTON, AB, T6J 6T1</p>
                        <p>T: 780-434-0491</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>			
					  <td class="sas2"><p><span class="b">Schöppche der Offe-Becher</span>, SRNA (159-), LK, LVDCB, LTr, LBCS, LBo</p>
					    <p>NLSI-2, NLDN-2, NLNO, Urs, Erb, Km, ErbA, ErbK, ErbRpb, ErbRpst, A, Chr, Btr, NV, ER 126, 293, 372, 415, silb. V.Med. LVNA (6.3.136)</p>
                        <p>MACK Klaus (Anita), Service Manager (22.3.1954)</p>
                        <p>20710 - 9 Avenue SW, EDMONTON, AB, T6M 2N9</p>
                        <p>T: 780-444-5081  780-462-3111 (FB)  e-mail: <a href="mailto:mack.klaus.anita@gmail.com">mack.klaus.anita@gmail.com</a></p>
                      </td>
                    </tr>
                 </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>SESSHAFTE RITTER</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Phil-o-atz Genie(s)er von Al-too-na</span>, Brill. z. GU, Erb, Km, ErbBtr (6.2.108)</p>
                        <p>SINTENIS Ingo, Ingenieur i.R. (26.6.1931)</p>
                        <p>2000 Fairview Court, SHERWOOD PARK, AB, T8A 0Y8</p>
                        <p>T: 780-467-5692</p>
                      </td>
                    </tr>
					<tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Rädle der eiernde Bioniker</span>, (18.4.152)</p>
                        <p>BASLER Hermann (Irmgard), Ingenieur (28.2.1959)</p>
                        <p>27521 Twp Rd 514, Parkland County, AB, T7Y 2X4</p>
                        <p>T: 780-963-9069 (Hb)  780-222-4759 (Cell)  e-mail: <a href="mailto:tms.basler@gmail.com">tms.basler@gmail.com</a></p>
						</td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Seekular das digitale Auge</span> (5.12.146)</p>
                        <p>von ROEDER Philipp, Dipl. Ing. (22.10.1951)</p>
                        <p>P.O.Box 3584, SPRUCE GROVE, AB, T7X 3A8</p>
                        <p>T: 780-999-5149 (Cell) +49-171-1228527 (Handy)  e-mail: <a href="mailto:seekular@rvd-online.de">seekular@rvd-online.de</a></p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Wildschütz Orvis vom Felsensee</span>, Gu, H, Rp, T (5.3.148)</p>
                        <p>HOFMANN Hubert (Yvonne), Supervisor Chem. Research i.R. (28.10.1942)</p>
                        <p>9820 - 167 Street NW, EDMONTON, AB, T5P 3V9</p>
                        <p>T: 780-484-4518 (Hb)  e-mail: <a href="mailto:hhofmann@telus.net">hhofmann@telus.net</a></p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>JUNKER UND KNAPPEN</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Junker Hans</span>, (3.2.161)</p>
                        <p>ZÜRCHER Hans, Rentner (17.12.1942)</p>
                        <p>31-51528 Rge Rd 262, SPRUCE GROVE, AB,  T7Y 1C1</p>
                        <p>T: 780-418-4267 (Hb)  e-mail: <a href="mailto:hanszurcher@hotmail.com">hanszurcher@hotmail.com</a></p>
                      </td>
					<tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Kn 121</span></p>
                        <p>KLASSEN Jeremy, Lehrer (15.11.1973)</p>
                        <p>8015 - 183 Street NW, EDMONTON, AB, T5T 0T9 </p>
                        <p>T: 780-461-9646 (Hb) 780-937-9646 (Cell) e-mail: <a href="mailto:jeremyklassen314@gmail.com">jeremyklassen314@gmail.com</a></p>
                      </td>
                    </tr>
                    </tr>
                    <tr>
                 </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>PILGER</th>
                    </tr>
                  </thead>
                  <tbody>
					<tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Pilger</span></p>
                        <p>NEUMEISTER Matthias, Kamerabühnenassistent (31.12.1991)</p>
                        <p>Bürgerheimstraße 15, 10365 BERLIN </p>
                        <p>T: +49-157-74195634 (Cell)  e-mail: <a href="mailto:matthiasneumeister@gmx.net">matthiasneumeister@gmx.net</a></p>
                      </td>
                    </tr>					
                 </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>PRÜFLINGE</th>
                    </tr>
                  </thead>
                  <tbody>
					<tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Prüfling</span></p>
                        <p>LÜCKE Dennis, Bäcker (Lisa) (17.10.1987)</p>
                        <p>5111 - 51 Ave, Stony Plain, AB, T7Z 1C2</p>
                        <p>T: 780-974-9347(Hb) e-mail: <a href="mailto:de.luecke@web.de">de.luecke@web.de</a></p>
                      </td>
                    </tr>
                 </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>FAHRENDE</th>
                    </tr>
                  </thead>
                  <tbody> 
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Abooki der ugandische Quacksalber</span>, Z (2.2.150)</p>
                        <p>KIPP Walter (Jean), Prof. f. internationales Gesundheitswesen (14.5.1945)</p>
                        <p>3065 County Road 7, PICTON, ON, K0K 2T0</p>
                        <p>T: 613-471-1736 (HB)  T: 587-340-2747 (Cell) e-mail: <a href="mailto:susiekipp@gmail.com">susiekipp@gmail.com</a></p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Baltenherz der Hördelsche</span>, GU, Erb, Km, ErbO, (31.10.124)</p>
                        <p>Freiherr von STACKELBERG, Hans Ernst (Irene), Psychologe (28.11.1934)</p>
                        <p>10953 - 70 Avenue NW, EDMONTON, AB, T6H 2G7</p>
                        <p>T/Fax: 780-436-3221  e-mail: <a href="mailto:hvonstackelberg@shaw.ca">hvonstackelberg@shaw.ca</a></p>
                      </td>
                    </tr>
        		    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Lipp\'Quell vom Odin-Aug\'</span>, (29.4.143)</p>
                        <p>BROECKER, Lothar (Marianne), Kaufmann (17.11.1948)</p>
                        <p>Am Jordanpark 16, D-33175 BAD LIPPSPRINGE, DEUTSCHLAND</p>
                        <p>T: +49-5252-53850  Fax: +49-5252-53855  e-mail: <a href="mailto:ivb.bali01@gmail.com">ivb.bali01@gmail.com</a></p>
                    </tr>
                 </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>EHRENRITTER</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p>Erküret a.U. 149:</p>
                        <p><span class="b">Lichterl am Alten Platz</span>, (107) Claudium forum</p>
                        <p>SENEKOWITSCH Gerhard, Unruheständler (30.5.1934)</p>
                        <p>Auergasse 2, A-9020 KLAGENFURT, ÖSTERREICH</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p>Erküret a.U. 154:</p>
                        <p><span class="b">Brüner der Grafschafter</span>, (118) Rocky Mountania</p>
                        <p>BRUNS Heinz-Jürgen, (5.7.1942)</p>
                        <p>777 East Chestermere Drive, CHESTERMERE LAKE, AB, T1X 1A6</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p>Erküret a.U. 154:</p>
                        <p><span class="b">Rohrbruch vom Wörthersee</span>, (135) Rocky Mountania</p>
                        <p>GORITSCHNIG Libert, Installationsmeister (6.12.1944)</p>
                        <p>79 Applefield Close SE, CALGARY, AB, T2A 7R1</p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table class="l2">
                  <thead>
                    <tr>
                      <th></th>
                      <th>BURGFRAUEN IN AHALL WEILENDER SASSEN</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Burgfrau Acturus</span>, Frau Elisabeth Swoboda</p>
                        <p>Adresse bei Rt. Schöppche zu erfragen</p>
                      </td>
                    </tr>
                    <tr>
                      <td class="sas1"></td>
                      <td class="sas2"><p><span class="b">Burgfrau Künec</span>, Frau Gisela Markwort</p>
                        <p>Adresse bei Rt. Jan Maat zu erfragen</p>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
        <div id="ft">
          
		
      </div>', NULL, 1, 0, '2025-11-21 19:59:02', '2025-11-21 22:19:02'),
(9, 'Unsere Stadt', 'unserestadt', '<div class="usd3"><img src="/storage/images/edm/skylinegreen_sm.jpg" alt="" /></div>
                <p class="usp1">City Skyline</p>
                <div class="usd1"><img src="/storage/images/edm/skylinetrees_sm.jpg" alt="" /></div>
                <div class="usd2"><img src="/storage/images/edm/skylinefar_sm.jpg" alt="" /></div>
                <div class="usd4"><img src="/storage/images/edm/skylinehill_sm.jpg" alt="" /></div>
                <div class="usd5"><p>Unser Rathaus</p><img src="/storage/images/edm/cityhall2_sm.jpg" alt="" /></div>
                <div class="usd6"><img src="/storage/images/edm/cityhall1_sm.jpg" alt="" /></div>
                <div class="usd7"><img src="/storage/images/edm/riverqueen_sm.jpg" alt="" /><p>Raddampfer</p><p>"Edmonton Queen"</p></div>
                <div class="usd8">Arts Distrikt<img src="/storage/images/edm/downtown_sm.jpg" alt="" /></div>
                <div class="usd9"><p>Hotel McDonald</p><img src="/storage/images/edm/mcdonald_sm.jpg" alt="" /></div>
                <div class="usd10"><img src="/storage/images/edm/totem_sm.jpg" alt="" /></div>
                <div class="usd11"><img src="/storage/images/edm/legpoolfountain_sm.jpg" alt="" /><p>Parlamentsgelände</p></div>
                <div class="usd12"><img src="/storage/images/edm/leggarden_sm.jpg" alt="" /></div>
                <div class="usd13"><img src="/storage/images/edm/legfountain_sm.jpg" alt="" />Provinz Parlamant</div>
                <div class="usd14"><img src="/storage/images/edm/leg2_sm.jpg" alt="" /></div>
                <div class="usd15"><p>Canada Place</p><p>und Kongresszentrum</p><img src="/storage/images/edm/canadaplace_sm.jpg" alt="" /></div>
                <div class="usd16"><img src="/storage/images/edm/leg3_sm.jpg" alt="" /></div>
                <div class="usd17"><img src="/storage/images/edm/leg1_sm.jpg" alt="" /></div>
                <div class="usd18"><img src="/storage/images/edm/hilevel1_sm.jpg" alt="" /><p>High Level Bridge</p></div>
                <div class="usd19"><p>Botanischer Garten</p><p>Muttart Conservatory</p><img src="/storage/images/edm/muttartfar_sm.jpg" alt="" /></div>
                <div class="usd20"><img src="/storage/images/edm/muttartmed_sm.jpg" alt="" /></div>
                <div class="usd21"><img src="/storage/images/edm/muttartclose_sm.jpg" alt="" />
        
    <div id="galerie">
      <div class="hd">Bilder Galerie</div>
      <div class="bd" id="imggalerie"></div>
      <div class="ft"></div>', NULL, 1, 0, '2025-11-21 20:02:52', '2025-11-21 20:17:38'),
(10, 'Sippungsfolge', 'sippungsfolge', '', NULL, 1, 0, '2025-11-21 20:02:56', '2025-11-21 20:45:25'),
(11, 'Heim', 'heim', '<p style="text-align: center; ;" class="p1">Eynen uhuhertzlichen Willekum in der Schlaraffia ® Prima Canadensis, Reych 337</p><p style="text-align: center; ;"><a href="http://www.schlaraffia.org/" target="_blank"><img src="/storage/images/uhu.png" alt="Allschlaraffia"></a><br><img src="/storage/images/prima_wappen.png" alt="Prima Canadensis Wappen"></p>', NULL, 1, -1, '2025-11-21 20:38:34', '2025-11-21 23:04:44');

-- --------------------------------------------------------
-- Dumping data for table `password_reset_tokens`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Dumping data for table `sessions`
-- --------------------------------------------------------

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('azQ5WTaEfgCK8OBd3gXeh3x3mIvAjpo7cL2FKJzP', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiamlET3M1cjY5TWI3QnJNaG9XSU5MOTJIZXEyaUh4TlVEdmNUWWQyRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS8ud2VsbC1rbm93bi9hcHBzcGVjaWZpYy9jb20uY2hyb21lLmRldnRvb2xzLmpzb24iO3M6NToicm91dGUiO3M6MTA6InBhZ2VzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJHplaHVveXY0cGY2YnpwL2VjenZwY2VwWEVGeGUwRWNqdWtSOVF4VW14M3JZTThPaGt6UUxXIjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1763768538),
('E758npIIbBFasrRNiyQ3IM01PEvFzywM49LlwRGM', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW9CMDFhd1dNTnJlMUdESnZrYVhGR3Nkdko2aHJNVW1KN3lpTElHMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS91YmVydW5zIjtzOjU6InJvdXRlIjtzOjEwOiJwYWdlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763763010),
('ijGkcfP39HJOZ1iFGO0gJzrhf8rtv4xkWBPb7fmR', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHNwcWNtb1EwN2RhdDdLMjRYVDFvRGZSc2FmYWRrTnpJVjY5MGtEWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9mZXN0c2NocmlmdCI7czo1OiJyb3V0ZSI7czoxMDoicGFnZXMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763763300),
('Esrd0y9Oi2BKG2dEfwMfoWcoPzasMxLpChyzgQ4P', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxZN1dXTWpsSVJ3UDJVMHJ2NXIxNDgwVEtNSFVhVG5oQTQ1TlVuNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9nZXNjaGljaHRlIjtzOjU6InJvdXRlIjtzOjEwOiJwYWdlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763763607),
('zI76LAQQeWcGP2YigGifri418EBfFXc4jZjhnfnZ', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2IzM0JPb2F1UFg5VXBKeGszQ2hOMWwyNjhQamgzRDV3ZlZNMzNwZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763763967),
('PJoKXLGuNAuo0QeybBjB6bEtYds1nwrxNFSTwfcx', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2ZhdXE0VmpVaWVnMWRMT0FpREp3ZzlvWnVqcGNhZ2JQVGhlREZ5dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS93YXBwZW4iO3M6NToicm91dGUiO3M6MTM6Im1lbWJlcnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1763764053),
('JYSYlN1T205KBCJJGJPzVeP36ZjL1hfo9BEOh7ed', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWU5RTFYWmRGYWxFN3N5M0tZVEdwdzRYVzY4bEM1b0tjMkVzUXVWeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764245),
('vzcZ8MTrdrz9HcHNetefWlZpNS7ZFo0jZLOhal93', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVoxTUVKUUxYaHNLNENNdndIOThjRFNLOEtHbWIxdlVXZEZFeVZYZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764247),
('AJp10h7hHIVkCbVOUIgS56L8kAUCw99iVGR89Lg4', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2hpYzhjaHBBTlpld1IxZG12THZXazE5OG1vU1BTeVkzOHRxcE9TQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764282),
('v02qlbAKKGviLdlvKwCkY8bML3DFcWBPhGVnj0jU', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDNleHBzdktlU1dNN1FsQXUyUUlBa0ZFelh6NlFtQThmRnFiVXg0aiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764286),
('zfHq5wnT7JQcRNtjWSOQLLqpy4ajJtowdh3onSFv', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTR2bXFERjlzemxkRHVXYWZVTFpXa20zaWdCeXJzZ0VkbVdQaUUwRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764288),
('sQ8a4LHH7OUgM6YzgnMelaErIW8wHQytqh7bW5Vh', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibG9vcWVFRjVTc09zdkFjRGxJa3VEV1hyV1VpYU91YkZJTmlWdkFBZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764326),
('BK9kZ2mjxdNBQZf5OP2OrOR3xFz28wnexzHODM6h', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3oyZGR3cjhmWkVQMXdtVE5rY0NNOUV2cllWaHFXandzVGRVcWUxZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764463),
('mWmd10Ned1QIrC51EZIPZcHGIDWWnOmnwFsXDnu1', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEdvVDY0dUlCWU5SU09rektINURORWhPdU15b2hRV01DbHFza0tpViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764465),
('TNyQPgythRoMlaPIT2TLiMFkROuKpFO4Q4tGoT12', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmo1UDIzRjlORGphaWdZMmV1akt1SGxndVp2Z3YxVE9wcWlKdzZXUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763764467),
('ldrPoIElKWWAiTMReftNlbjGtlvKmonA1T3rC83F', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjFaY1N2Zk1wRHJ3OEhGSzgyVHoybHNmajd3UWxZOGJwYncxaDBObiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765420),
('7lqAFGL9vY2vj6an0BLHQy7UcmQXAPgpXvCeWeH2', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTFVTnlaSE5WT2R5UkNEbUVmSGVkenNWU3dnd2xPOFNMNnJQZDZCVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765423),
('tbvYeZ69g6tyKo27bwRYv4nk5MabONYlhzuEZ3DO', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3ZZT0pIbXZHQTQ3OGd0YUhxUWJnMTFieXBtREJ3bnB4akR5RmV1MiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765439),
('1mBptiM8vt3NwVrOiP77cieeqvAesghozXeUhm0n', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHpxNE9VYXNIbnVYZFJkQ3NzQWhBNFVRNUpibmsxWElveDg4UVo1diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765443),
('jzUrWFtb6G5feGv2EzMPa9lFexzYIsYwARU0b6w3', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW5Qb0ZoUW9XZ2FBZ2NVQTVJamtNcnJabmRCcEZJblk2aGJtNDBrWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765445),
('RmilRTjEsLSLw6qUbaWWmkzAMURXgjYZnZuP3iaP', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkpndldvcUdSRUU1ZU1HOU1jUmM3dHdnU1VCWnpITTRCbWdRZE5pViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765453),
('jmV99WDUjD5oEL5ZkUJrNG97kVr0B1HEgtEVBedK', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW1KMzc2UjFQUEFnZktNYVRlZnFLSUVHNnVTZEx0TmZCTkxaMkJaUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9mZXN0c2NocmlmdCI7czo1OiJyb3V0ZSI7czoxMDoicGFnZXMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763765694),
('326sgd6iBMGvljy49cZqyyy3rA3EjuUgDHuaTOAX', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUdEeXVocVNnUGtCZndsRFBka0VGTXZIVUMzT2NDYWdBSzJobVRLRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9rcnlzdGFsbGluZW4iO3M6NToicm91dGUiO3M6MTg6InBhZ2VzLmtyeXN0YWxsaW5lbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763766025),
('cQE7EpqavA2LNkE6phmZ4HRqeBqFEOkvnO79YJDw', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHc2UjAySGl5T2JaSVdkMFpxeldvVVdjSGZYVG9JcEhhZm9pRDh4OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS91bnNlcmVzdGFkdCI7czo1OiJyb3V0ZSI7czoxMDoicGFnZXMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763766150),
('Kj5mV2R7GNX0XBgxV6rmS11YJuDypH4xA5ad3I7Q', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXVxR29tV2lTRkhIUkhVdlVuWmpjR0FKdWp2M1IySlJTeWJjWjZNQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766198),
('CZrwIzqlEFTOVAtQyNMtZZSShzBoiAV2tzkKzme6', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUJxRDU5ZHVJaE44dGZLaHJ0Z1M2aWdONHVMZEw1bW9OOFFOTENMUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766214),
('6zXYBriYnjmz0qKFQg1jaaULxr7zZnJjpuS6xdpl', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHRUTUM3T3JrT1psengzenY3dmdMQXdIZTRHZ0dmVXR3MWhoc1QyZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766232),
('bMHnR5sTmv6j6qM953fdddo7uYbIsq1L86zv7DLo', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDJEYTZBdDFaODlmd2R0WXBjbHExVkV2S0F1Y09RNW9JUzJSZktUcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766314),
('kkUbm33KVdWKfzdP9stNi4KxgZsGXSuptww9lb9y', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGx6Vk1tOVBoQkxKQWFXbmpJWmp3eTRzbFNXcXJMeGxzS2RLWWRoYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766359),
('JIUfXayn8a86hXneIBe0hL8FDKDR1DT6p7KlOUF9', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzk3SFJCVDBIME0zMXF2ZWVJcnBraFhabFhpaGdNUUZCcEQ5VEg0RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS9nZXNjaGljaHRlIjtzOjU6InJvdXRlIjtzOjEwOiJwYWdlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766706),
('cZLEOui6EiP5hIFcaZtYdGZ4CXprysQl8W2GpjPo', NULL, '127.0.0.1', 'curl/8.7.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTVERDR1bDhRaDZOb3cxUzlKSXJNRWdHZ295TW1SNXhRa1R0SERrZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMS91YmVydW5zIjtzOjU6InJvdXRlIjtzOjEwOiJwYWdlcy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763766794);

-- --------------------------------------------------------
-- Dumping data for table `users`
-- --------------------------------------------------------

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Java', 'victor@rubba.com', NULL, '$2y$12$zehuoyv4pf6bzp/eczvpcepXEFxe0EcjukR9QxUmx3rYM8OhkzQLW', NULL, '2025-11-21 21:06:11', '2025-11-21 21:06:11');

SET FOREIGN_KEY_CHECKS = 1;
