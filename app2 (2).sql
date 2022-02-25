-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 06, 2021 at 08:08 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `app2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 11, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-10-05 08:50:45'),
(2, 0, 12, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-10-05 08:50:45'),
(3, 0, 1, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-10-05 08:50:45'),
(4, 2, 13, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-10-05 08:50:45'),
(5, 2, 14, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-10-05 08:50:45'),
(6, 2, 15, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-10-05 08:50:45'),
(7, 2, 16, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-10-05 08:50:45'),
(8, 0, 3, 'categories', 'fa-bars', 'categories', NULL, '2021-09-17 18:07:30', '2021-10-05 08:50:45'),
(9, 8, 4, 'All categories', 'fa-bars', 'categories', NULL, '2021-09-17 18:08:07', '2021-10-05 08:50:45'),
(10, 8, 5, 'attributes', 'fa-adjust', 'attributes', NULL, '2021-09-17 18:08:40', '2021-10-05 08:50:45'),
(11, 0, 6, 'Locatios', 'fa-bars', 'countries', NULL, '2021-09-23 07:33:49', '2021-10-05 08:50:45'),
(12, 11, 7, 'countries', 'fa-bars', 'countries', NULL, '2021-09-23 07:34:27', '2021-10-05 08:50:45'),
(13, 11, 8, 'Cities', 'fa-bars', 'cities', NULL, '2021-09-23 07:46:07', '2021-10-05 08:50:45'),
(14, 0, 9, 'products', 'fa-american-sign-language-interpreting', 'products', NULL, '2021-10-02 19:04:16', '2021-10-05 08:50:45'),
(15, 0, 10, 'users', 'fa-users', 'users', NULL, '2021-10-05 08:50:05', '2021-10-05 08:50:45'),
(16, 3, 2, 'users', 'fa-bars', 'users', NULL, '2021-10-05 08:50:37', '2021-10-05 08:50:45'),
(17, 3, 0, 'profiles', 'fa-bars', 'profiles', NULL, '2021-10-05 08:52:39', '2021-10-05 08:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-09-17 18:06:21', '2021-09-17 18:06:21'),
(2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:28', '2021-09-17 18:06:28'),
(3, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:35', '2021-09-17 18:06:35'),
(4, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:06:47', '2021-09-17 18:06:47'),
(5, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:06:52', '2021-09-17 18:06:52'),
(6, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:07:00', '2021-09-17 18:07:00'),
(7, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"categories\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:07:30', '2021-09-17 18:07:30'),
(8, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:07:30', '2021-09-17 18:07:30'),
(9, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"All categories\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:08:07', '2021-09-17 18:08:07'),
(10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:07', '2021-09-17 18:08:07'),
(11, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:20', '2021-09-17 18:08:20'),
(12, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:24', '2021-09-17 18:08:24'),
(13, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"attributes\",\"icon\":\"fa-adjust\",\"uri\":\"attributes\",\"roles\":[null],\"permission\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:08:40', '2021-09-17 18:08:40'),
(14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:40', '2021-09-17 18:08:40'),
(15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-17 18:08:44', '2021-09-17 18:08:44'),
(16, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:08:52', '2021-09-17 18:08:52'),
(17, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-17 18:08:54', '2021-09-17 18:08:54'),
(18, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Apartments\",\"description\":\"Rent or sell apartments\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-09-17 18:13:44', '2021-09-17 18:13:44'),
(19, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-09-17 18:13:45', '2021-09-17 18:13:45'),
(20, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":null,\"name\":\"Houses\",\"description\":\"Rent or sell Houses in Uganda\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\",\"after-save\":\"2\"}', '2021-09-17 18:16:29', '2021-09-17 18:16:29'),
(21, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-09-17 18:16:30', '2021-09-17 18:16:30'),
(22, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":null,\"name\":\"Land\",\"description\":\"Rent or sell land within Uganda\",\"slug\":null,\"_token\":\"GI6D8p8Hix3T8YnQsPecLfzMRw0I9y2lqTQao1QW\"}', '2021-09-17 18:17:42', '2021-09-17 18:17:42'),
(23, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:17:43', '2021-09-17 18:17:43'),
(24, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-09-17 18:21:16', '2021-09-17 18:21:16'),
(25, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-09-23 07:22:38', '2021-09-23 07:22:38'),
(26, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:22:47', '2021-09-23 07:22:47'),
(27, 1, 'admin/countries', 'GET', '127.0.0.1', '[]', '2021-09-23 07:33:07', '2021-09-23 07:33:07'),
(28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:33:14', '2021-09-23 07:33:14'),
(29, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Locatios\",\"icon\":\"fa-bars\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:33:49', '2021-09-23 07:33:49'),
(30, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:33:49', '2021-09-23 07:33:49'),
(31, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:34:01', '2021-09-23 07:34:01'),
(32, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"countries\",\"icon\":\"fa-bars\",\"uri\":\"countries\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:34:27', '2021-09-23 07:34:27'),
(33, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:34:27', '2021-09-23 07:34:27'),
(34, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:36', '2021-09-23 07:34:36'),
(35, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:41', '2021-09-23 07:34:41'),
(36, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:34:45', '2021-09-23 07:34:45'),
(37, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-09-23 07:36:36', '2021-09-23 07:36:36'),
(38, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:36:36', '2021-09-23 07:36:36'),
(39, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:37:44', '2021-09-23 07:37:44'),
(40, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:37:45', '2021-09-23 07:37:45'),
(41, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Uganda\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\"}', '2021-09-23 07:38:25', '2021-09-23 07:38:25'),
(42, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:38:26', '2021-09-23 07:38:26'),
(43, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"Turkey\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Turkey, officially the Republic of Turkey, is a country bridging Europe and Asia. It shares borders with Greece and Bulgaria to the northwest; the Black Sea to the north; Georgia to the northeast;\",\"code\":\"+90\",\"listed\":\"1\",\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\"}', '2021-09-23 07:41:16', '2021-09-23 07:41:16'),
(44, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:41:16', '2021-09-23 07:41:16'),
(45, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:45:30', '2021-09-23 07:45:30'),
(46, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:45:32', '2021-09-23 07:45:32'),
(47, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"11\",\"title\":\"Cities\",\"icon\":\"fa-bars\",\"uri\":\"cities\",\"roles\":[null],\"permission\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:46:07', '2021-09-23 07:46:07'),
(48, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:07', '2021-09-23 07:46:07'),
(49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:17', '2021-09-23 07:46:17'),
(50, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:46:22', '2021-09-23 07:46:22'),
(51, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:46:24', '2021-09-23 07:46:24'),
(52, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:46:44', '2021-09-23 07:46:44'),
(53, 1, 'admin/cities/create', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:44', '2021-09-23 07:46:44'),
(54, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Jinja\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\"}', '2021-09-23 07:46:58', '2021-09-23 07:46:58'),
(55, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:46:58', '2021-09-23 07:46:58'),
(56, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:47:02', '2021-09-23 07:47:02'),
(57, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbale\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:47:11', '2021-09-23 07:47:11'),
(58, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:47:11', '2021-09-23 07:47:11'),
(59, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 07:47:13', '2021-09-23 07:47:13'),
(60, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kasese\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":null,\"_token\":\"PhhRr7d6lF2oym3OdGfWqWiV4hcNdC5f8S3UVlwN\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-09-23 07:47:22', '2021-09-23 07:47:22'),
(61, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-09-23 07:47:22', '2021-09-23 07:47:22'),
(62, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-09-23 09:43:30', '2021-09-23 09:43:30'),
(63, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-02 10:26:22', '2021-10-02 10:26:22'),
(64, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:03', '2021-10-02 10:27:03'),
(65, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:08', '2021-10-02 10:27:08'),
(66, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 10:27:40', '2021-10-02 10:27:40'),
(67, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-02 10:34:11', '2021-10-02 10:34:11'),
(68, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:34:04', '2021-10-02 11:34:04'),
(69, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"code\":\"256\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-10-02 11:36:43', '2021-10-02 11:36:43'),
(70, 1, 'admin/countries', 'GET', '127.0.0.1', '[]', '2021-10-02 11:36:44', '2021-10-02 11:36:44'),
(71, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:36:50', '2021-10-02 11:36:50'),
(72, 1, 'admin/countries', 'POST', '127.0.0.1', '{\"name\":\"UAE\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"code\":\"441188\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/countries\"}', '2021-10-02 11:38:02', '2021-10-02 11:38:02'),
(73, 1, 'admin/countries/create', 'GET', '127.0.0.1', '[]', '2021-10-02 11:38:03', '2021-10-02 11:38:03'),
(74, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:38:29', '2021-10-02 11:38:29'),
(75, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:38:49', '2021-10-02 11:38:49'),
(76, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:41:45', '2021-10-02 11:41:45'),
(77, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:41:45', '2021-10-02 11:41:45'),
(78, 1, 'admin/cities/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:42:15', '2021-10-02 11:42:15'),
(79, 1, 'admin/cities/2', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbarara\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:43:36', '2021-10-02 11:43:36'),
(80, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:43:36', '2021-10-02 11:43:36'),
(81, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:43:44', '2021-10-02 11:43:44'),
(82, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:46:22', '2021-10-02 11:46:22'),
(83, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 11:46:23', '2021-10-02 11:46:23'),
(84, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\"}', '2021-10-02 11:47:43', '2021-10-02 11:47:43'),
(85, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 11:47:44', '2021-10-02 11:47:44'),
(86, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_method\":\"PUT\"}', '2021-10-02 11:52:54', '2021-10-02 11:52:54'),
(87, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:52:54', '2021-10-02 11:52:54'),
(88, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:53:10', '2021-10-02 11:53:10'),
(89, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"2\",\"name\":\"Istanbul\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:55:41', '2021-10-02 11:55:41'),
(90, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:55:42', '2021-10-02 11:55:42'),
(91, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:56:01', '2021-10-02 11:56:01'),
(92, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Qatar\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"details\":null,\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 11:56:41', '2021-10-02 11:56:41'),
(93, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 11:56:42', '2021-10-02 11:56:42'),
(94, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:57:13', '2021-10-02 11:57:13'),
(95, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:57:20', '2021-10-02 11:57:20'),
(96, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:58:08', '2021-10-02 11:58:08'),
(97, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:58:13', '2021-10-02 11:58:13'),
(98, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 11:59:59', '2021-10-02 11:59:59'),
(99, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:13', '2021-10-02 12:00:13'),
(100, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:26', '2021-10-02 12:00:26'),
(101, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:34', '2021-10-02 12:00:34'),
(102, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:00:47', '2021-10-02 12:00:47'),
(103, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"country_id\":\"3\",\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 12:03:52', '2021-10-02 12:03:52'),
(104, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 12:03:53', '2021-10-02 12:03:53'),
(105, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:04:03', '2021-10-02 12:04:03'),
(106, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 12:04:05', '2021-10-02 12:04:05'),
(107, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 13:10:38', '2021-10-02 13:10:38'),
(108, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 13:10:45', '2021-10-02 13:10:45'),
(109, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 13:11:15', '2021-10-02 13:11:15'),
(110, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:11:15', '2021-10-02 13:11:15'),
(111, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:11:18', '2021-10-02 13:11:18'),
(112, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:12:47', '2021-10-02 13:12:47'),
(113, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:13:07', '2021-10-02 13:13:07'),
(114, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:13:07', '2021-10-02 13:13:07'),
(115, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:14:33', '2021-10-02 13:14:33'),
(116, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:14:43', '2021-10-02 13:14:43'),
(117, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:14:44', '2021-10-02 13:14:44'),
(118, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:17:21', '2021-10-02 13:17:21'),
(119, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:17:21', '2021-10-02 13:17:21'),
(120, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:19:21', '2021-10-02 13:19:21'),
(121, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 13:19:31', '2021-10-02 13:19:31'),
(122, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 13:19:31', '2021-10-02 13:19:31'),
(123, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:14:50', '2021-10-02 15:14:50'),
(124, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:15:15', '2021-10-02 15:15:15'),
(125, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:15:15', '2021-10-02 15:15:15'),
(126, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:17:26', '2021-10-02 15:17:26'),
(127, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:17:38', '2021-10-02 15:17:38'),
(128, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:17:38', '2021-10-02 15:17:38'),
(129, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:19:53', '2021-10-02 15:19:53'),
(130, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:19:53', '2021-10-02 15:19:53'),
(131, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kampala\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"ruxBzbdo8b6d8F9kGMovMiMkHSK0Qg9iBKhNfIuy\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-02 15:20:51', '2021-10-02 15:20:51'),
(132, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:20:51', '2021-10-02 15:20:51'),
(133, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:21:52', '2021-10-02 15:21:52'),
(134, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:22:42', '2021-10-02 15:22:42'),
(135, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:23:01', '2021-10-02 15:23:01'),
(136, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:23:21', '2021-10-02 15:23:21'),
(137, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-02 15:33:31', '2021-10-02 15:33:31'),
(138, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:58:42', '2021-10-02 18:58:42'),
(139, 1, 'admin/cities/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:04', '2021-10-02 18:59:04'),
(140, 1, 'admin/cities/2', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Mbarara\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 18:59:13', '2021-10-02 18:59:13'),
(141, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 18:59:13', '2021-10-02 18:59:13'),
(142, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:38', '2021-10-02 18:59:38'),
(143, 1, 'admin/cities/3', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Dubai\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 18:59:51', '2021-10-02 18:59:51'),
(144, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 18:59:51', '2021-10-02 18:59:51'),
(145, 1, 'admin/cities/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 18:59:56', '2021-10-02 18:59:56'),
(146, 1, 'admin/cities/7', 'PUT', '127.0.0.1', '{\"country_id\":\"3\",\"name\":\"China\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:00:05', '2021-10-02 19:00:05'),
(147, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:00:05', '2021-10-02 19:00:05'),
(148, 1, 'admin/cities/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:00:16', '2021-10-02 19:00:16'),
(149, 1, 'admin/cities/6', 'PUT', '127.0.0.1', '{\"country_id\":\"4\",\"name\":\"Qatar\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"details\":null,\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:00:35', '2021-10-02 19:00:35'),
(150, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:00:35', '2021-10-02 19:00:35'),
(151, 1, 'admin/cities/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:00:43', '2021-10-02 19:00:43'),
(152, 1, 'admin/cities/4', 'PUT', '127.0.0.1', '{\"country_id\":\"1\",\"name\":\"Kasese\",\"longitude\":null,\"latitude\":null,\"details\":null,\"listed\":\"0\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:01:02', '2021-10-02 19:01:02'),
(153, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:01:02', '2021-10-02 19:01:02'),
(154, 1, 'admin/cities/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:10', '2021-10-02 19:01:10'),
(155, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:15', '2021-10-02 19:01:15'),
(156, 1, 'admin/cities/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:01:28', '2021-10-02 19:01:28'),
(157, 1, 'admin/cities/5', 'PUT', '127.0.0.1', '{\"country_id\":\"2\",\"name\":\"Istanbul\",\"longitude\":\"16.2212.\",\"latitude\":\"18.2222\",\"details\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti\",\"listed\":\"1\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/cities\"}', '2021-10-02 19:01:55', '2021-10-02 19:01:55'),
(158, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-02 19:01:56', '2021-10-02 19:01:56'),
(159, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:03:36', '2021-10-02 19:03:36'),
(160, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-10-02 19:03:44', '2021-10-02 19:03:44'),
(161, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:04', '2021-10-02 19:04:04'),
(162, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"products\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\"}', '2021-10-02 19:04:16', '2021-10-02 19:04:16'),
(163, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:16', '2021-10-02 19:04:16'),
(164, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:23', '2021-10-02 19:04:23'),
(165, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"products\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/menu\"}', '2021-10-02 19:04:38', '2021-10-02 19:04:38'),
(166, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:39', '2021-10-02 19:04:39'),
(167, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-02 19:04:43', '2021-10-02 19:04:43'),
(168, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:04:50', '2021-10-02 19:04:50'),
(169, 1, 'admin/products/4,5,6,7,8', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"CS60Ci3wlfNX5o81vt7vOtU7sT7R9BmtM20FL6LW\"}', '2021-10-02 19:05:04', '2021-10-02 19:05:04'),
(170, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:05:04', '2021-10-02 19:05:04'),
(171, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2021-10-02 19:05:08', '2021-10-02 19:05:08'),
(172, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-02 19:05:20', '2021-10-02 19:05:20'),
(173, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-05 08:44:16', '2021-10-05 08:44:16'),
(174, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:00', '2021-10-05 08:45:00'),
(175, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:07', '2021-10-05 08:45:07'),
(176, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:11', '2021-10-05 08:45:11'),
(177, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:45:55', '2021-10-05 08:45:55'),
(178, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-10-05 08:48:26', '2021-10-05 08:48:26'),
(179, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:49:41', '2021-10-05 08:49:41'),
(180, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"users\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:50:05', '2021-10-05 08:50:05'),
(181, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:50:05', '2021-10-05 08:50:05'),
(182, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"users\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:50:36', '2021-10-05 08:50:36'),
(183, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:50:37', '2021-10-05 08:50:37'),
(184, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\",\"_order\":\"[{\\\"id\\\":3,\\\"children\\\":[{\\\"id\\\":16}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10}]},{\\\"id\\\":11,\\\"children\\\":[{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-10-05 08:50:44', '2021-10-05 08:50:44'),
(185, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:50:45', '2021-10-05 08:50:45'),
(186, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:22', '2021-10-05 08:52:22'),
(187, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"3\",\"title\":\"profiles\",\"icon\":\"fa-bars\",\"uri\":\"profiles\",\"roles\":[null],\"permission\":null,\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\"}', '2021-10-05 08:52:39', '2021-10-05 08:52:39'),
(188, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:39', '2021-10-05 08:52:39'),
(189, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2021-10-05 08:52:43', '2021-10-05 08:52:43'),
(190, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:52:47', '2021-10-05 08:52:47'),
(191, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:53:24', '2021-10-05 08:53:24'),
(192, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"first_name,last_name,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:19', '2021-10-05 08:54:19'),
(193, 1, 'admin/profiles/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:29', '2021-10-05 08:54:29'),
(194, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"first_name,last_name,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:52', '2021-10-05 08:54:52'),
(195, 1, 'admin/profiles/6', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:54:58', '2021-10-05 08:54:58'),
(196, 1, 'admin/profiles/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:55:17', '2021-10-05 08:55:17'),
(197, 1, 'admin/profiles/6', 'PUT', '127.0.0.1', '{\"user_id\":\"3\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam\",\"services\":null,\"longitude\":null,\"latitude\":null,\"division\":null,\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg\\\",\\\"user_id\\\":3}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png\\\",\\\"user_id\\\":3}\",\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":\"1633426861\",\"status\":\"active\",\"_token\":\"RRVE9nEL2gsNDO0FzKohd9D7VEp9jW6T2gvhVvuA\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\\/6\"}', '2021-10-05 08:55:34', '2021-10-05 08:55:34'),
(198, 1, 'admin/profiles/6', 'GET', '127.0.0.1', '[]', '2021-10-05 08:55:34', '2021-10-05 08:55:34'),
(199, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:55:40', '2021-10-05 08:55:40'),
(200, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"about,company_name,division,email,first_name,id,last_name,latitude,location,longitude,opening_hours,phone_number,profile_photo,services,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-05 08:56:01', '2021-10-05 08:56:01'),
(201, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2021-10-07 20:32:48', '2021-10-07 20:32:48'),
(202, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:04', '2021-10-07 20:34:04'),
(203, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:22', '2021-10-07 20:34:22'),
(204, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:34:31', '2021-10-07 20:34:31'),
(205, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:36:57', '2021-10-07 20:36:57'),
(206, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:37:10', '2021-10-07 20:37:10'),
(207, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"slug\":\"apartments\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 20:53:27', '2021-10-07 20:53:27'),
(208, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 20:53:27', '2021-10-07 20:53:27'),
(209, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:04', '2021-10-07 20:54:04'),
(210, 1, 'admin/categories/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:08', '2021-10-07 20:54:08'),
(211, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 20:54:20', '2021-10-07 20:54:20'),
(212, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:16:31', '2021-10-07 21:16:31'),
(213, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":null,\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"slug\":\"houses\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 21:18:09', '2021-10-07 21:18:09'),
(214, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:18:10', '2021-10-07 21:18:10'),
(215, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:18:23', '2021-10-07 21:18:23'),
(216, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":null,\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"slug\":\"land\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-07 21:21:30', '2021-10-07 21:21:30'),
(217, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:21:31', '2021-10-07 21:21:31'),
(218, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:43', '2021-10-07 21:21:43'),
(219, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:49', '2021-10-07 21:21:49'),
(220, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:21:51', '2021-10-07 21:21:51'),
(221, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:06', '2021-10-07 21:22:06'),
(222, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:10', '2021-10-07 21:22:10'),
(223, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:12', '2021-10-07 21:22:12'),
(224, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:15', '2021-10-07 21:22:15'),
(225, 1, 'admin/countries', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:18', '2021-10-07 21:22:18'),
(226, 1, 'admin/countries/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:21', '2021-10-07 21:22:21'),
(227, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:31', '2021-10-07 21:22:31'),
(228, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:33', '2021-10-07 21:22:33'),
(229, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:36', '2021-10-07 21:22:36'),
(230, 1, 'admin/profiles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:38', '2021-10-07 21:22:38'),
(231, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:22:41', '2021-10-07 21:22:41'),
(232, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:37:20', '2021-10-07 21:37:20'),
(233, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:37:21', '2021-10-07 21:37:21'),
(234, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:38:35', '2021-10-07 21:38:35'),
(235, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:45:43', '2021-10-07 21:45:43'),
(236, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:46:44', '2021-10-07 21:46:44'),
(237, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:01', '2021-10-07 21:49:01'),
(238, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:34', '2021-10-07 21:49:34'),
(239, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:49:55', '2021-10-07 21:49:55'),
(240, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:50:29', '2021-10-07 21:50:29'),
(241, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:51:07', '2021-10-07 21:51:07'),
(242, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:53:25', '2021-10-07 21:53:25'),
(243, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"0\",\"name\":null,\"description\":null,\"slug\":null,\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\"}', '2021-10-07 21:53:29', '2021-10-07 21:53:29'),
(244, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:53:29', '2021-10-07 21:53:29'),
(245, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:54:06', '2021-10-07 21:54:06'),
(246, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phones\",\"description\":\"Mobile Phones Details\",\"slug\":\"Mobile Phones\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"after-save\":\"2\"}', '2021-10-07 21:56:10', '2021-10-07 21:56:10'),
(247, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:56:10', '2021-10-07 21:56:10'),
(248, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\",\"after-save\":\"2\"}', '2021-10-07 21:56:46', '2021-10-07 21:56:46'),
(249, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-07 21:56:47', '2021-10-07 21:56:47'),
(250, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Services\",\"description\":\"Mobile Phone Services\",\"_token\":\"O9Y3zBOXuGtB1EaG9T2OKZXYsUYE3BPjq41olTzd\"}', '2021-10-07 21:57:10', '2021-10-07 21:57:10'),
(251, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:57:10', '2021-10-07 21:57:10'),
(252, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:57:52', '2021-10-07 21:57:52'),
(253, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 21:58:33', '2021-10-07 21:58:33'),
(254, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:59:25', '2021-10-07 21:59:25'),
(255, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 21:59:41', '2021-10-07 21:59:41'),
(256, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:05:10', '2021-10-07 22:05:10'),
(257, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:05:30', '2021-10-07 22:05:30'),
(258, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:06:03', '2021-10-07 22:06:03'),
(259, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:18', '2021-10-07 22:07:18'),
(260, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:41', '2021-10-07 22:07:41'),
(261, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:07:51', '2021-10-07 22:07:51'),
(262, 1, 'admin/categories/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:08:20', '2021-10-07 22:08:20'),
(263, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:08:30', '2021-10-07 22:08:30'),
(264, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:10:01', '2021-10-07 22:10:01'),
(265, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:10:26', '2021-10-07 22:10:26'),
(266, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:12:48', '2021-10-07 22:12:48'),
(267, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:13:03', '2021-10-07 22:13:03'),
(268, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:13:12', '2021-10-07 22:13:12');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(269, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:13:33', '2021-10-07 22:13:33'),
(270, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:13:46', '2021-10-07 22:13:46'),
(271, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:09', '2021-10-07 22:14:09'),
(272, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:17', '2021-10-07 22:14:17'),
(273, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-07 22:14:26', '2021-10-07 22:14:26'),
(274, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 22:14:52', '2021-10-07 22:14:52'),
(275, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:12:55', '2021-10-07 23:12:55'),
(276, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:00', '2021-10-07 23:13:00'),
(277, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:06', '2021-10-07 23:13:06'),
(278, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:10', '2021-10-07 23:13:10'),
(279, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-07 23:13:13', '2021-10-07 23:13:13'),
(280, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-07 23:16:25', '2021-10-07 23:16:25'),
(281, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-07 23:17:10', '2021-10-07 23:17:10'),
(282, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 06:59:21', '2021-10-08 06:59:21'),
(283, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":null,\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:00:24', '2021-10-08 08:00:24'),
(284, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:00:27', '2021-10-08 08:00:27'),
(285, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:00:33', '2021-10-08 08:00:33'),
(286, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:00:43', '2021-10-08 08:00:43'),
(287, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Condition\",\"type\":\"2\",\"options\":null,\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:01:06', '2021-10-08 08:01:06'),
(288, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:01:11', '2021-10-08 08:01:11'),
(289, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Condition\",\"type\":\"2\",\"options\":null,\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 08:01:23', '2021-10-08 08:01:23'),
(290, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:01:27', '2021-10-08 08:01:27'),
(291, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":\"Used,New\",\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:12:42', '2021-10-08 08:12:42'),
(292, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:24:06', '2021-10-08 08:24:06'),
(293, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:24:09', '2021-10-08 08:24:09'),
(294, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:37:41', '2021-10-08 08:37:41'),
(295, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:39:21', '2021-10-08 08:39:21'),
(296, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:42:12', '2021-10-08 08:42:12'),
(297, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:45:32', '2021-10-08 08:45:32'),
(298, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:46:01', '2021-10-08 08:46:01'),
(299, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:07', '2021-10-08 08:47:07'),
(300, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:25', '2021-10-08 08:47:25'),
(301, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:47:37', '2021-10-08 08:47:37'),
(302, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:48:50', '2021-10-08 08:48:50'),
(303, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:48:57', '2021-10-08 08:48:57'),
(304, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:07', '2021-10-08 08:49:07'),
(305, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:29', '2021-10-08 08:49:29'),
(306, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:49:47', '2021-10-08 08:49:47'),
(307, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":null,\"type\":\"3\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:54:35', '2021-10-08 08:54:35'),
(308, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 08:54:35', '2021-10-08 08:54:35'),
(309, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":[\"Uses\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 08:55:07', '2021-10-08 08:55:07'),
(310, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:55:41', '2021-10-08 08:55:41'),
(311, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:55:43', '2021-10-08 08:55:43'),
(312, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"3\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 08:56:27', '2021-10-08 08:56:27'),
(313, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 08:56:27', '2021-10-08 08:56:27'),
(314, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 08:57:43', '2021-10-08 08:57:43'),
(315, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-08 08:57:58', '2021-10-08 08:57:58'),
(316, 1, 'admin/attributes/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-08 09:03:53', '2021-10-08 09:03:53'),
(317, 1, 'admin/attributes/1', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Condition\",\"type\":\"6\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-08 09:04:29', '2021-10-08 09:04:29'),
(318, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:04:30', '2021-10-08 09:04:30'),
(319, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Authenticity\",\"type\":\"5\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/1\\/edit\"}', '2021-10-08 09:05:07', '2021-10-08 09:05:07'),
(320, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:05:07', '2021-10-08 09:05:07'),
(321, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:35:01', '2021-10-08 09:35:01'),
(322, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:35:01', '2021-10-08 09:35:01'),
(323, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Model\",\"type\":null,\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:37:03', '2021-10-08 09:37:03'),
(324, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:37:04', '2021-10-08 09:37:04'),
(325, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:37:20', '2021-10-08 09:37:20'),
(326, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:37:21', '2021-10-08 09:37:21'),
(327, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Features\",\"type\":\"6\",\"options\":[\"Bluetooth\",\"Camera\",\"Dual-Lens Camera\",\"Dual SIM\",\"Expandable Memory\",\"Fingerprint Sensor\",\"GPS\",\"Physical keyboard\",\"Motion Sensors\",\"3G\",\"4G\",\"GSM\",\"Touch screen\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:39:35', '2021-10-08 09:39:35'),
(328, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:39:35', '2021-10-08 09:39:35'),
(329, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Description\",\"type\":\"2\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:42:14', '2021-10-08 09:42:14'),
(330, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:42:15', '2021-10-08 09:42:15'),
(331, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"0\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 09:43:11', '2021-10-08 09:43:11'),
(332, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 09:43:11', '2021-10-08 09:43:11'),
(333, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:43:46', '2021-10-08 09:43:46'),
(334, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:44:40', '2021-10-08 09:44:40'),
(335, 1, 'admin/attributes/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:44:52', '2021-10-08 09:44:52'),
(336, 1, 'admin/attributes/2', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Authenticity\",\"type\":\"5\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:04', '2021-10-08 09:45:04'),
(337, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:04', '2021-10-08 09:45:04'),
(338, 1, 'admin/attributes/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:10', '2021-10-08 09:45:10'),
(339, 1, 'admin/attributes/3', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:17', '2021-10-08 09:45:17'),
(340, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:17', '2021-10-08 09:45:17'),
(341, 1, 'admin/attributes/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:22', '2021-10-08 09:45:22'),
(342, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:26', '2021-10-08 09:45:26'),
(343, 1, 'admin/attributes/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:30', '2021-10-08 09:45:30'),
(344, 1, 'admin/attributes/4', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:35', '2021-10-08 09:45:35'),
(345, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:35', '2021-10-08 09:45:35'),
(346, 1, 'admin/attributes/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:45:39', '2021-10-08 09:45:39'),
(347, 1, 'admin/attributes/7', 'PUT', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/\"}', '2021-10-08 09:45:45', '2021-10-08 09:45:45'),
(348, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:45:45', '2021-10-08 09:45:45'),
(349, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:46:17', '2021-10-08 09:46:17'),
(350, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 09:48:50', '2021-10-08 09:48:50'),
(351, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2021-10-08 09:49:21', '2021-10-08 09:49:21'),
(352, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:50:08', '2021-10-08 09:50:08'),
(353, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-08 09:56:32', '2021-10-08 09:56:32'),
(354, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 09:58:20', '2021-10-08 09:58:20'),
(355, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:58:30', '2021-10-08 09:58:30'),
(356, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:58:39', '2021-10-08 09:58:39'),
(357, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\",\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:59:18', '2021-10-08 09:59:18'),
(358, 1, 'admin/profiles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 09:59:25', '2021-10-08 09:59:25'),
(359, 1, 'admin/profiles/1', 'PUT', '127.0.0.1', '{\"user_id\":\"1\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"2694351585\",\"services\":\"Rentals, Car hiring, Apartments\",\"longitude\":\"2694351585\",\"latitude\":null,\"division\":null,\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png\\\",\\\"user_id\\\":1}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png\\\",\\\"user_id\\\":1}\",\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":\"1633697886\",\"status\":\"active\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles?_columns_=created_at%2Cemail%2Cfirst_name%2Cid%2Clast_name%2Clocation%2Cprofile_photo%2Cservices%2Cstatus%2Cuser_id\"}', '2021-10-08 09:59:32', '2021-10-08 09:59:32'),
(360, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\"}', '2021-10-08 09:59:32', '2021-10-08 09:59:32'),
(361, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:02:00', '2021-10-08 10:02:00'),
(362, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"3\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories details...\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 10:04:07', '2021-10-08 10:04:07'),
(363, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 10:04:07', '2021-10-08 10:04:07'),
(364, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"7\",\"_model\":\"App_Models_category\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-10-08 10:04:19', '2021-10-08 10:04:19'),
(365, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:04:20', '2021-10-08 10:04:20'),
(366, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:05:30', '2021-10-08 10:05:30'),
(367, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:05:33', '2021-10-08 10:05:33'),
(368, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Item type\",\"type\":\"4\",\"options\":[\"Power bank\",\"Screen protector\",\"Chargers\",\"Cables\",\"Holders and\",\"Stands\",\"VR Box\",\"Selfie Sticks\",\"Others\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:08:19', '2021-10-08 10:08:19'),
(369, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:08:20', '2021-10-08 10:08:20'),
(370, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:09:20', '2021-10-08 10:09:20'),
(371, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:09:21', '2021-10-08 10:09:21'),
(372, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:10:06', '2021-10-08 10:10:06'),
(373, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:10:39', '2021-10-08 10:10:39'),
(374, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:10:39', '2021-10-08 10:10:39'),
(375, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition_\",\"type\":\"5\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:36:30', '2021-10-08 10:36:30'),
(376, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:36:30', '2021-10-08 10:36:30'),
(377, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:37:14', '2021-10-08 10:37:14'),
(378, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:37:15', '2021-10-08 10:37:15'),
(379, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,email,first_name,id,last_name,location,profile_photo,services,status,user_id\"}', '2021-10-08 10:37:25', '2021-10-08 10:37:25'),
(380, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable_\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:40:21', '2021-10-08 10:40:21'),
(381, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:40:21', '2021-10-08 10:40:21'),
(382, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:41:26', '2021-10-08 10:41:26'),
(383, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:42:03', '2021-10-08 10:42:03'),
(384, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"1\",\"name\":\"Cars\",\"description\":\"Car category details go here...\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 10:42:37', '2021-10-08 10:42:37'),
(385, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:42:38', '2021-10-08 10:42:38'),
(386, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:43:58', '2021-10-08 10:43:58'),
(387, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 10:44:00', '2021-10-08 10:44:00'),
(388, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 10:44:59', '2021-10-08 10:44:59'),
(389, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:44:59', '2021-10-08 10:44:59'),
(390, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition__\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 10:49:43', '2021-10-08 10:49:43'),
(391, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 10:49:43', '2021-10-08 10:49:43'),
(392, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-08 11:19:27', '2021-10-08 11:19:27'),
(393, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:34', '2021-10-08 11:20:34'),
(394, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:49', '2021-10-08 11:20:49'),
(395, 1, 'admin/attributes/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:20:55', '2021-10-08 11:20:55'),
(396, 1, 'admin/attributes/11', 'PUT', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:04', '2021-10-08 11:21:04'),
(397, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:04', '2021-10-08 11:21:04'),
(398, 1, 'admin/attributes/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:10', '2021-10-08 11:21:10'),
(399, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:14', '2021-10-08 11:21:14'),
(400, 1, 'admin/attributes/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:23', '2021-10-08 11:21:23'),
(401, 1, 'admin/attributes/10', 'PUT', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:26', '2021-10-08 11:21:26'),
(402, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:26', '2021-10-08 11:21:26'),
(403, 1, 'admin/attributes/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:31', '2021-10-08 11:21:31'),
(404, 1, 'admin/attributes/9', 'PUT', '127.0.0.1', '{\"category_id\":\"5\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:21:34', '2021-10-08 11:21:34'),
(405, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:21:34', '2021-10-08 11:21:34'),
(406, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:39', '2021-10-08 11:21:39'),
(407, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:43', '2021-10-08 11:21:43'),
(408, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:21:48', '2021-10-08 11:21:48'),
(409, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Audi\",\"BMW\",\"Dodge\",\"Ferrari\",\"Hino\",\"Honder\",\"Hummer\",\"Isuzu\",\"Jaguar\",\"Honda\",\"Toyota\",null],\"units\":\"single\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:24:12', '2021-10-08 11:24:12'),
(410, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:24:13', '2021-10-08 11:24:13'),
(411, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Model\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:24:51', '2021-10-08 11:24:51'),
(412, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:24:52', '2021-10-08 11:24:52'),
(413, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:25:30', '2021-10-08 11:25:30'),
(414, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Trim \\/ Edition\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:00', '2021-10-08 11:26:00'),
(415, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:01', '2021-10-08 11:26:01'),
(416, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Year of Manufacture\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:24', '2021-10-08 11:26:24'),
(417, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:24', '2021-10-08 11:26:24'),
(418, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Kilometers run\",\"type\":\"3\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:26:57', '2021-10-08 11:26:57'),
(419, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:26:58', '2021-10-08 11:26:58'),
(420, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Engine capacity\",\"type\":\"1\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:27:24', '2021-10-08 11:27:24'),
(421, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:27:24', '2021-10-08 11:27:24'),
(422, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Fuel type\",\"type\":\"4\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:29:14', '2021-10-08 11:29:14'),
(423, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:29:14', '2021-10-08 11:29:14'),
(424, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Transmission\",\"type\":\"5\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:29:47', '2021-10-08 11:29:47'),
(425, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:29:47', '2021-10-08 11:29:47'),
(426, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Body type\",\"type\":\"4\",\"options\":[null],\"units\":\"Saloon\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:30:34', '2021-10-08 11:30:34'),
(427, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:30:35', '2021-10-08 11:30:35'),
(428, 1, 'admin/attributes/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:30:45', '2021-10-08 11:30:45'),
(429, 1, 'admin/attributes/20', 'PUT', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Body type\",\"type\":\"4\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:31:47', '2021-10-08 11:31:47'),
(430, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:31:48', '2021-10-08 11:31:48'),
(431, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"8\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/20\\/edit\"}', '2021-10-08 11:32:33', '2021-10-08 11:32:33'),
(432, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:32:34', '2021-10-08 11:32:34'),
(433, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:34:45', '2021-10-08 11:34:45'),
(434, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:34:58', '2021-10-08 11:34:58'),
(435, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"1\",\"name\":\"Motorbikes\",\"description\":\"Motorbikes DETAILS GO HERE.....\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:35:36', '2021-10-08 11:35:36'),
(436, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:35:37', '2021-10-08 11:35:37'),
(437, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:36:28', '2021-10-08 11:36:28'),
(438, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-10-08 11:36:33', '2021-10-08 11:36:33'),
(439, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:36:35', '2021-10-08 11:36:35'),
(440, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Bike type\",\"type\":\"5\",\"options\":[\"Motorcycle\",\"Scooters\",\"E-bikes\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?&page=2\"}', '2021-10-08 11:37:24', '2021-10-08 11:37:24'),
(441, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:37:24', '2021-10-08 11:37:24'),
(442, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Condition\",\"type\":\"5\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:38:24', '2021-10-08 11:38:24'),
(443, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:38:25', '2021-10-08 11:38:25'),
(444, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:39:44', '2021-10-08 11:39:44'),
(445, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:39:44', '2021-10-08 11:39:44'),
(446, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:39:50', '2021-10-08 11:39:50'),
(447, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:39:54', '2021-10-08 11:39:54'),
(448, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:40:00', '2021-10-08 11:40:00'),
(449, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2021-10-08 11:40:00', '2021-10-08 11:40:00'),
(450, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:40:06', '2021-10-08 11:40:06'),
(451, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[null],\"units\":\"Akij,\",\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:40:09', '2021-10-08 11:40:09'),
(452, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2021-10-08 11:40:09', '2021-10-08 11:40:09'),
(453, 1, 'admin/attributes/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:40:13', '2021-10-08 11:40:13'),
(454, 1, 'admin/attributes/24', 'PUT', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Brand\",\"type\":\"4\",\"options\":[\"Akij\",\"Alliance\",\"Bajaj\",\"Senke\",\"Suzuki\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?page=2\"}', '2021-10-08 11:41:27', '2021-10-08 11:41:27'),
(455, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:41:28', '2021-10-08 11:41:28'),
(456, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Trim \\/ Edition\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\\/24\\/edit\"}', '2021-10-08 11:41:56', '2021-10-08 11:41:56'),
(457, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:41:56', '2021-10-08 11:41:56'),
(458, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Year of Manufacture\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:42:33', '2021-10-08 11:42:33'),
(459, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:42:33', '2021-10-08 11:42:33'),
(460, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Kilometers run\",\"type\":\"3\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:42:50', '2021-10-08 11:42:50'),
(461, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:42:50', '2021-10-08 11:42:50'),
(462, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Engine capacity\",\"type\":\"3\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:43:38', '2021-10-08 11:43:38'),
(463, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:43:38', '2021-10-08 11:43:38'),
(464, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"9\",\"name\":\"Negotiable\",\"type\":\"6\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"off\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\"}', '2021-10-08 11:44:18', '2021-10-08 11:44:18'),
(465, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-08 11:44:18', '2021-10-08 11:44:18'),
(466, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:03', '2021-10-08 11:48:03'),
(467, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:06', '2021-10-08 11:48:06'),
(468, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"2\",\"name\":\"Land\",\"description\":\"Land DETAILS GO HERE\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:48:37', '2021-10-08 11:48:37'),
(469, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:48:37', '2021-10-08 11:48:37'),
(470, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:41', '2021-10-08 11:48:41'),
(471, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:48:46', '2021-10-08 11:48:46'),
(472, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land type\",\"type\":\"5\",\"options\":[\"Agricultural\",\"Commercial\",\"Residential\",\"Other\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:50:18', '2021-10-08 11:50:18'),
(473, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:50:19', '2021-10-08 11:50:19'),
(474, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:51:24', '2021-10-08 11:51:24'),
(475, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:51:24', '2021-10-08 11:51:24'),
(476, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size unit\",\"type\":\"4\",\"options\":[\"Acres\",\"Dedimal\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:52:52', '2021-10-08 11:52:52'),
(477, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:52:53', '2021-10-08 11:52:53'),
(478, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land Address\",\"type\":\"2\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:54:12', '2021-10-08 11:54:12'),
(479, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:54:13', '2021-10-08 11:54:13'),
(480, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:11', '2021-10-08 11:56:11'),
(481, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:15', '2021-10-08 11:56:15'),
(482, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"parent\":\"2\",\"name\":\"Apartments For Sale\",\"description\":\"Apartments For Sale details go here\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-08 11:56:53', '2021-10-08 11:56:53'),
(483, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-08 11:56:54', '2021-10-08 11:56:54'),
(484, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:56:57', '2021-10-08 11:56:57'),
(485, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 11:57:01', '2021-10-08 11:57:01'),
(486, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Beds\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-08 11:57:48', '2021-10-08 11:57:48'),
(487, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:57:49', '2021-10-08 11:57:49'),
(488, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Baths\",\"type\":\"3\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:58:33', '2021-10-08 11:58:33'),
(489, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:58:34', '2021-10-08 11:58:34'),
(490, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Size\",\"type\":\"3\",\"options\":[null],\"units\":\"sqft\",\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:59:10', '2021-10-08 11:59:10'),
(491, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:59:11', '2021-10-08 11:59:11'),
(492, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"11\",\"name\":\"Address\",\"type\":\"1\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"TWxnCRA7JMGJUaVsI65O7WCKE4eYssAkbVPfFN9s\",\"after-save\":\"2\"}', '2021-10-08 11:59:44', '2021-10-08 11:59:44'),
(493, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '[]', '2021-10-08 11:59:45', '2021-10-08 11:59:45'),
(494, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-08 12:00:05', '2021-10-08 12:00:05'),
(495, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-09 04:07:54', '2021-10-09 04:07:54'),
(496, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:08:23', '2021-10-09 04:08:23'),
(497, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:23:52', '2021-10-09 04:23:52'),
(498, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:43:40', '2021-10-09 04:43:40'),
(499, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:43:44', '2021-10-09 04:43:44'),
(500, 1, 'admin/attributes', 'POST', '127.0.0.1', '{\"category_id\":\"4\",\"name\":\"Test\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"on\",\"_token\":\"0nM0z3RjzXWrSC1lZ8hktiA5HhB7r13fEuSLUlOe\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes\"}', '2021-10-09 04:44:15', '2021-10-09 04:44:15'),
(501, 1, 'admin/attributes', 'GET', '127.0.0.1', '[]', '2021-10-09 04:44:15', '2021-10-09 04:44:15'),
(502, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:44:24', '2021-10-09 04:44:24'),
(503, 1, 'admin/attributes/38/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:44:32', '2021-10-09 04:44:32'),
(504, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2021-10-09 04:44:38', '2021-10-09 04:44:38'),
(505, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2021-10-11 04:22:06', '2021-10-11 04:22:06'),
(506, 1, 'admin/attributes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-11 05:47:17', '2021-10-11 05:47:17'),
(507, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-12 00:42:19', '2021-10-12 00:42:19'),
(508, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:43:16', '2021-10-12 00:43:16'),
(509, 1, 'admin/users/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:43:48', '2021-10-12 00:43:48'),
(510, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:43:51', '2021-10-12 00:43:51'),
(511, 1, 'admin/users/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:43:59', '2021-10-12 00:43:59'),
(512, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:44:03', '2021-10-12 00:44:03'),
(513, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:44:08', '2021-10-12 00:44:08'),
(514, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:44:27', '2021-10-12 00:44:27'),
(515, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 00:46:18', '2021-10-12 00:46:18'),
(516, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 00:49:03', '2021-10-12 00:49:03'),
(517, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 00:49:17', '2021-10-12 00:49:17'),
(518, 1, 'admin/profiles/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:49:38', '2021-10-12 00:49:38'),
(519, 1, 'admin/profiles/7/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 00:55:04', '2021-10-12 00:55:04'),
(520, 1, 'admin/profiles/7', 'PUT', '127.0.0.1', '{\"user_id\":\"6\",\"first_name\":\"Bwambale\",\"last_name\":\"Muhidin\",\"company_name\":\"8TECH Uganda Limited\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Dealers in all kinds of Mobile phones and other electronic devices from mobile phone chargers, to earphones, headphones, phone covers, stands etc.ph\\r\\n\\r\\nWe also provide other services such phone repairing using Computer with a help of other softwares.\",\"services\":\"Phone accessories, Phone repairing,\",\"longitude\":\"14003000900\",\"latitude\":null,\"division\":\"Kasese district\",\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg\\\",\\\"user_id\\\":1}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg\\\",\\\"user_id\\\":1}\",\"facebook\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/ugnews24\\/\",\"whatsapp\":\"https:\\/\\/www.youtube.com\\/ugnews24\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/ugnews24\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/ugnews24\\/\",\"last_seen\":\"1634009394\",\"status\":\"active\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-12 00:55:18', '2021-10-12 00:55:18'),
(521, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 00:55:18', '2021-10-12 00:55:18'),
(522, 1, 'admin/profiles/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:55:23', '2021-10-12 00:55:23'),
(523, 1, 'admin/profiles/8', 'PUT', '127.0.0.1', '{\"user_id\":\"7\",\"first_name\":\"Bwambale\",\"last_name\":\"Muhidin\",\"company_name\":\"8TECH Uganda Limited\",\"email\":\"muhidin@gmail.com\",\"phone_number\":\"01632257609\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\",\"services\":\"Rentals, Car hiring, Apartments\",\"longitude\":\"14003000900\",\"latitude\":null,\"division\":\"Kasese district\",\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg\\\",\\\"user_id\\\":7}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg\\\",\\\"user_id\\\":7}\",\"facebook\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"twitter\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"whatsapp\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/ugnews24\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/ugnews24\\/\",\"last_seen\":\"1634010107\",\"status\":\"active\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-12 00:55:28', '2021-10-12 00:55:28'),
(524, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 00:55:28', '2021-10-12 00:55:28'),
(525, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 00:55:37', '2021-10-12 00:55:37'),
(526, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 01:02:07', '2021-10-12 01:02:07');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(527, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:27:59', '2021-10-12 02:27:59'),
(528, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:34:14', '2021-10-12 02:34:14'),
(529, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:34:49', '2021-10-12 02:34:49'),
(530, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:36:04', '2021-10-12 02:36:04'),
(531, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:36:28', '2021-10-12 02:36:28'),
(532, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:36:45', '2021-10-12 02:36:45'),
(533, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:37:10', '2021-10-12 02:37:10'),
(534, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:37:18', '2021-10-12 02:37:18'),
(535, 1, 'admin/profiles/8', 'GET', '127.0.0.1', '[]', '2021-10-12 02:37:55', '2021-10-12 02:37:55'),
(536, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:38:11', '2021-10-12 02:38:11'),
(537, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:45:44', '2021-10-12 02:45:44'),
(538, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:47:10', '2021-10-12 02:47:10'),
(539, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 02:47:21', '2021-10-12 02:47:21'),
(540, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 02:47:22', '2021-10-12 02:47:22'),
(541, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\"}', '2021-10-12 02:47:28', '2021-10-12 02:47:28'),
(542, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:47:29', '2021-10-12 02:47:29'),
(543, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:47:35', '2021-10-12 02:47:35'),
(544, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 02:47:39', '2021-10-12 02:47:39'),
(545, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:47:39', '2021-10-12 02:47:39'),
(546, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:47:43', '2021-10-12 02:47:43'),
(547, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\"}', '2021-10-12 02:47:55', '2021-10-12 02:47:55'),
(548, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:47:56', '2021-10-12 02:47:56'),
(549, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:48:02', '2021-10-12 02:48:02'),
(550, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 02:48:05', '2021-10-12 02:48:05'),
(551, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:48:06', '2021-10-12 02:48:06'),
(552, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:48:11', '2021-10-12 02:48:11'),
(553, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 02:48:14', '2021-10-12 02:48:14'),
(554, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:48:14', '2021-10-12 02:48:14'),
(555, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 02:48:19', '2021-10-12 02:48:19'),
(556, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 02:48:22', '2021-10-12 02:48:22'),
(557, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 02:48:22', '2021-10-12 02:48:22'),
(558, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:03:27', '2021-10-12 03:03:27'),
(559, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:20:15', '2021-10-12 03:20:15'),
(560, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:20:20', '2021-10-12 03:20:20'),
(561, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:20:25', '2021-10-12 03:20:25'),
(562, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 03:41:49', '2021-10-12 03:41:49'),
(563, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 03:41:49', '2021-10-12 03:41:49'),
(564, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:42:00', '2021-10-12 03:42:00'),
(565, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 03:46:54', '2021-10-12 03:46:54'),
(566, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 03:46:54', '2021-10-12 03:46:54'),
(567, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 03:49:11', '2021-10-12 03:49:11'),
(568, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-12 03:51:08', '2021-10-12 03:51:08'),
(569, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-10-12 03:51:09', '2021-10-12 03:51:09'),
(570, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 04:17:34', '2021-10-12 04:17:34'),
(571, 1, 'admin/attributes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2021-10-12 04:17:46', '2021-10-12 04:17:46'),
(572, 1, 'admin/attributes/32/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 04:17:56', '2021-10-12 04:17:56'),
(573, 1, 'admin/attributes/32', 'PUT', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size unit\",\"type\":\"select\",\"options\":[\"Acres\",\"Dedimal\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attributes?&page=2\"}', '2021-10-12 04:18:12', '2021-10-12 04:18:12'),
(574, 1, 'admin/attributes/32/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 04:18:13', '2021-10-12 04:18:13'),
(575, 1, 'admin/attributes/32', 'PUT', '127.0.0.1', '{\"category_id\":\"10\",\"name\":\"Land size unit\",\"type\":\"select\",\"options\":[\"Acres\",\"Dedimal\",\"Plot\",null],\"units\":null,\"is_required\":\"on\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-12 04:19:05', '2021-10-12 04:19:05'),
(576, 1, 'admin/attributes/32/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 04:19:06', '2021-10-12 04:19:06'),
(577, 1, 'admin/attributes/32/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 08:10:59', '2021-10-12 08:10:59'),
(578, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-12 09:22:35', '2021-10-12 09:22:35'),
(579, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:22:46', '2021-10-12 09:22:46'),
(580, 1, 'admin/profiles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:22:50', '2021-10-12 09:22:50'),
(581, 1, 'admin/profiles/2', 'PUT', '127.0.0.1', '{\"user_id\":\"6\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":null,\"services\":\"Rentals, Car hiring, Apartments\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"division\":null,\"opening_hours\":\"12\",\"profile_photo\":null,\"cover_photo\":null,\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":null,\"status\":null,\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-12 09:23:17', '2021-10-12 09:23:17'),
(582, 1, 'admin/profiles/2/edit', 'GET', '127.0.0.1', '[]', '2021-10-12 09:23:17', '2021-10-12 09:23:17'),
(583, 1, 'admin/profiles/2', 'PUT', '127.0.0.1', '{\"user_id\":\"6\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":null,\"services\":\"Rentals, Car hiring, Apartments\",\"longitude\":\"16.2212\",\"latitude\":\"18.2222\",\"division\":null,\"opening_hours\":\"12\",\"profile_photo\":null,\"cover_photo\":null,\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":null,\"status\":\"active\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\"}', '2021-10-12 09:23:35', '2021-10-12 09:23:35'),
(584, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 09:23:36', '2021-10-12 09:23:36'),
(585, 1, 'admin/profiles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:23:42', '2021-10-12 09:23:42'),
(586, 1, 'admin/profiles/1', 'PUT', '127.0.0.1', '{\"user_id\":\"7\",\"first_name\":\"Kule.\",\"last_name\":\"Swaleh\",\"company_name\":\"iut\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Richmond Group is a key player in real estate development in Uganda. The company pioneered the concept of property development by corporate in Bangladesh.\\r\\n\\r\\nRichmond Group is recognized for its quality construction, ethical and transparent business practices, high standard of maintenance and timely delivery of properties.\",\"services\":\"Land, apartments, cars\",\"longitude\":\"14003000900\",\"latitude\":null,\"division\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"public\\\\\\/SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png\\\",\\\"user_id\\\":7}\",\"cover_photo\":\"{\\\"src\\\":\\\"public\\\\\\/gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp\\\",\\\"thumbnail\\\":\\\"public\\\\\\/thumb_gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp\\\",\\\"user_id\\\":7}\",\"facebook\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"twitter\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"whatsapp\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"youtube\":\"https:\\/\\/www.youtube.com\\/ugnews24\\/\",\"instagram\":\"https:\\/\\/www.instagram.com\\/ugnews24\\/\",\"last_seen\":\"1634040892\",\"status\":\"active\",\"_token\":\"1zsfrpvwQktydKwuj0n4hotFsIH3F0XwAQANzh9k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-12 09:23:51', '2021-10-12 09:23:51'),
(587, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-12 09:23:51', '2021-10-12 09:23:51'),
(588, 1, 'admin/profiles/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:23:54', '2021-10-12 09:23:54'),
(589, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:25:14', '2021-10-12 09:25:14'),
(590, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-12 09:25:14', '2021-10-12 09:25:14'),
(591, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-14 15:41:55', '2021-10-14 15:41:55'),
(592, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:42:06', '2021-10-14 15:42:06'),
(593, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:42:11', '2021-10-14 15:42:11'),
(594, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-10-14 15:43:16', '2021-10-14 15:43:16'),
(595, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:43:17', '2021-10-14 15:43:17'),
(596, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:44:34', '2021-10-14 15:44:34'),
(597, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:44:41', '2021-10-14 15:44:41'),
(598, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:44:42', '2021-10-14 15:44:42'),
(599, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:46:31', '2021-10-14 15:46:31'),
(600, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:46:40', '2021-10-14 15:46:40'),
(601, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:46:40', '2021-10-14 15:46:40'),
(602, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:47:21', '2021-10-14 15:47:21'),
(603, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:47:28', '2021-10-14 15:47:28'),
(604, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:47:28', '2021-10-14 15:47:28'),
(605, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:48:05', '2021-10-14 15:48:05'),
(606, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:48:05', '2021-10-14 15:48:05'),
(607, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:48:14', '2021-10-14 15:48:14'),
(608, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:48:14', '2021-10-14 15:48:14'),
(609, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:48:56', '2021-10-14 15:48:56'),
(610, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:48:56', '2021-10-14 15:48:56'),
(611, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:49:02', '2021-10-14 15:49:02'),
(612, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:49:03', '2021-10-14 15:49:03'),
(613, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:49:57', '2021-10-14 15:49:57'),
(614, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:50:17', '2021-10-14 15:50:17'),
(615, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:50:29', '2021-10-14 15:50:29'),
(616, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:50:37', '2021-10-14 15:50:37'),
(617, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:50:56', '2021-10-14 15:50:56'),
(618, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-14 15:51:04', '2021-10-14 15:51:04'),
(619, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-14 15:51:05', '2021-10-14 15:51:05'),
(620, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:51:08', '2021-10-14 15:51:08'),
(621, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:51:11', '2021-10-14 15:51:11'),
(622, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-14 15:53:47', '2021-10-14 15:53:47'),
(623, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-14 15:53:47', '2021-10-14 15:53:47'),
(624, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:53:51', '2021-10-14 15:53:51'),
(625, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:53:53', '2021-10-14 15:53:53'),
(626, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-14 15:54:03', '2021-10-14 15:54:03'),
(627, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-14 15:54:03', '2021-10-14 15:54:03'),
(628, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:54:05', '2021-10-14 15:54:05'),
(629, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:54:09', '2021-10-14 15:54:09'),
(630, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:54:49', '2021-10-14 15:54:49'),
(631, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:54:49', '2021-10-14 15:54:49'),
(632, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"2\",\"_method\":\"PUT\"}', '2021-10-14 15:55:35', '2021-10-14 15:55:35'),
(633, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-10-14 15:55:36', '2021-10-14 15:55:36'),
(634, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-14 15:55:38', '2021-10-14 15:55:38'),
(635, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:55:40', '2021-10-14 15:55:40'),
(636, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:56:41', '2021-10-14 15:56:41'),
(637, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:56:50', '2021-10-14 15:56:50'),
(638, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:56:50', '2021-10-14 15:56:50'),
(639, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:57:10', '2021-10-14 15:57:10'),
(640, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:57:10', '2021-10-14 15:57:10'),
(641, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"KZP15dQ6dny3Vvo9N47fhBir8d0fPujAtXoNlyZf\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-10-14 15:57:19', '2021-10-14 15:57:19'),
(642, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-10-14 15:57:19', '2021-10-14 15:57:19'),
(643, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2021-10-15 02:56:20', '2021-10-15 02:56:20'),
(644, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-16 05:07:27', '2021-10-16 05:07:27'),
(645, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-16 05:07:34', '2021-10-16 05:07:34'),
(646, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-16 05:10:30', '2021-10-16 05:10:30'),
(647, 1, 'admin/profiles/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-16 05:10:38', '2021-10-16 05:10:38'),
(648, 1, 'admin/profiles/6', 'PUT', '127.0.0.1', '{\"user_id\":\"8\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"company_name\":\"JOHN Tech\",\"email\":\"johntexh@gmail.com\",\"phone_number\":\"0779755798\",\"location\":\"Kampala Uganda\",\"about\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\",\"services\":\"Dealers in Electronics, Phones, Computers\",\"longitude\":\"1677028000\",\"latitude\":null,\"division\":null,\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png\\\",\\\"thumbnail\\\":\\\"thumb_vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png\\\",\\\"user_id\\\":8}\",\"cover_photo\":\"{\\\"src\\\":\\\"ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png\\\",\\\"thumbnail\\\":\\\"thumb_ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png\\\",\\\"user_id\\\":8}\",\"facebook\":null,\"twitter\":null,\"whatsapp\":null,\"youtube\":null,\"instagram\":null,\"last_seen\":\"1634371823\",\"status\":\"active\",\"_token\":\"gq8uVBfVxfuPElRjjOwNPeqzVkvuaVKAE4rUBjkI\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-16 05:10:45', '2021-10-16 05:10:45'),
(649, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-16 05:10:46', '2021-10-16 05:10:46'),
(650, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-20 08:14:58', '2021-10-20 08:14:58'),
(651, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-20 08:15:19', '2021-10-20 08:15:19'),
(652, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-20 08:17:02', '2021-10-20 08:17:02'),
(653, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-20 08:17:10', '2021-10-20 08:17:10'),
(654, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2021-10-20 08:17:17', '2021-10-20 08:17:17'),
(655, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-20 08:17:28', '2021-10-20 08:17:28'),
(656, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-20 08:26:43', '2021-10-20 08:26:43'),
(657, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-20 08:30:30', '2021-10-20 08:30:30'),
(658, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-10-24 02:51:23', '2021-10-24 02:51:23'),
(659, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-24 02:51:32', '2021-10-24 02:51:32'),
(660, 1, 'admin/profiles/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-24 02:51:41', '2021-10-24 02:51:41'),
(661, 1, 'admin/profiles/7', 'PUT', '127.0.0.1', '{\"user_id\":\"9\",\"first_name\":\"Muhindo\",\"last_name\":\"Mubaraka\",\"company_name\":\"IUT\",\"email\":\"mubahood360@gmail.com\",\"phone_number\":\"+256706638494\",\"location\":\"Kibuli, Kampala, Uganda\",\"about\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\\r\\n\\r\\nLorem ipsum dolor sit amet consectetur adipisicing elit debitis odio perferendis placeat at aperiam.\",\"services\":\"IUT\",\"longitude\":\"16.2212\",\"latitude\":null,\"division\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"opening_hours\":null,\"profile_photo\":\"{\\\"src\\\":\\\"URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg\\\",\\\"thumbnail\\\":\\\"thumb_URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg\\\",\\\"user_id\\\":9}\",\"cover_photo\":\"{\\\"src\\\":\\\"RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg\\\",\\\"thumbnail\\\":\\\"thumb_RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg\\\",\\\"user_id\\\":9}\",\"facebook\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"twitter\":\"https:\\/\\/www.twitter.com\\/ugnews24\\/\",\"whatsapp\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"youtube\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"instagram\":\"https:\\/\\/www.facebook.com\\/ugnews24\\/\",\"last_seen\":\"1635054652\",\"status\":\"active\",\"_token\":\"nZ6IjqgVhTXX9j4bqSMVdYT8ObZfGNeqOrwOTYzp\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/profiles\"}', '2021-10-24 02:51:47', '2021-10-24 02:51:47'),
(662, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-10-24 02:51:48', '2021-10-24 02:51:48'),
(663, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 08:37:59', '2021-11-05 08:37:59'),
(664, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 08:39:06', '2021-11-05 08:39:06'),
(665, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:45:21', '2021-11-05 08:45:21'),
(666, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:45:37', '2021-11-05 08:45:37'),
(667, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:45:40', '2021-11-05 08:45:40'),
(668, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 08:45:45', '2021-11-05 08:45:45'),
(669, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 08:47:07', '2021-11-05 08:47:07'),
(670, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 08:47:34', '2021-11-05 08:47:34'),
(671, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 08:47:52', '2021-11-05 08:47:52'),
(672, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:03:30', '2021-11-05 09:03:30'),
(673, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:03:40', '2021-11-05 09:03:40'),
(674, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:04:41', '2021-11-05 09:04:41'),
(675, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:05:49', '2021-11-05 09:05:49'),
(676, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 09:06:23', '2021-11-05 09:06:23'),
(677, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:06:29', '2021-11-05 09:06:29'),
(678, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:06:33', '2021-11-05 09:06:33'),
(679, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:07:43', '2021-11-05 09:07:43'),
(680, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:07:53', '2021-11-05 09:07:53'),
(681, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:08:01', '2021-11-05 09:08:01'),
(682, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:08:20', '2021-11-05 09:08:20'),
(683, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:08:33', '2021-11-05 09:08:33'),
(684, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:08:51', '2021-11-05 09:08:51'),
(685, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:09:56', '2021-11-05 09:09:56'),
(686, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:10:31', '2021-11-05 09:10:31'),
(687, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:10:49', '2021-11-05 09:10:49'),
(688, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:10:53', '2021-11-05 09:10:53'),
(689, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:10:58', '2021-11-05 09:10:58'),
(690, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"status\",\"type\":\"asc\"}}', '2021-11-05 09:11:15', '2021-11-05 09:11:15'),
(691, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"first_name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:11:42', '2021-11-05 09:11:42'),
(692, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:11:45', '2021-11-05 09:11:45'),
(693, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"first_name\",\"type\":\"desc\"}}', '2021-11-05 09:11:48', '2021-11-05 09:11:48'),
(694, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:11:55', '2021-11-05 09:11:55'),
(695, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:11:57', '2021-11-05 09:11:57'),
(696, 1, 'admin/profiles/1,2,3,4,5,6,7,8,9', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"k820enkKe4Kr6XwMpIWO3aBxtQXHixCvl5asA7Yf\"}', '2021-11-05 09:12:28', '2021-11-05 09:12:28'),
(697, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:12:29', '2021-11-05 09:12:29'),
(698, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:12:32', '2021-11-05 09:12:32'),
(699, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:12:34', '2021-11-05 09:12:34'),
(700, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:12:36', '2021-11-05 09:12:36'),
(701, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:12:47', '2021-11-05 09:12:47'),
(702, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:04', '2021-11-05 09:13:04'),
(703, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:16', '2021-11-05 09:13:16'),
(704, 1, 'admin/users/1,3,4,6,7,8,9,10,11', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"k820enkKe4Kr6XwMpIWO3aBxtQXHixCvl5asA7Yf\"}', '2021-11-05 09:13:24', '2021-11-05 09:13:24'),
(705, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:24', '2021-11-05 09:13:24'),
(706, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:27', '2021-11-05 09:13:27'),
(707, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:28', '2021-11-05 09:13:28'),
(708, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:32', '2021-11-05 09:13:32'),
(709, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:36', '2021-11-05 09:13:36'),
(710, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2021-11-05 09:13:38', '2021-11-05 09:13:38'),
(711, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:41', '2021-11-05 09:13:41'),
(712, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:13:42', '2021-11-05 09:13:42'),
(713, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 09:14:11', '2021-11-05 09:14:11'),
(714, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:14:18', '2021-11-05 09:14:18'),
(715, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:15:20', '2021-11-05 09:15:20'),
(716, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:16:06', '2021-11-05 09:16:06'),
(717, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:16:10', '2021-11-05 09:16:10'),
(718, 1, 'admin/profiles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:19:39', '2021-11-05 09:19:39'),
(719, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:20:00', '2021-11-05 09:20:00'),
(720, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:20:10', '2021-11-05 09:20:10'),
(721, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:20:14', '2021-11-05 09:20:14'),
(722, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:20:16', '2021-11-05 09:20:16'),
(723, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:26:41', '2021-11-05 09:26:41'),
(724, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:26:44', '2021-11-05 09:26:44'),
(725, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:32:26', '2021-11-05 09:32:26'),
(726, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:33:29', '2021-11-05 09:33:29'),
(727, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:33:52', '2021-11-05 09:33:52'),
(728, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:35:54', '2021-11-05 09:35:54'),
(729, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:43:57', '2021-11-05 09:43:57'),
(730, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:44:16', '2021-11-05 09:44:16'),
(731, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:45:45', '2021-11-05 09:45:45'),
(732, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:48:02', '2021-11-05 09:48:02'),
(733, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:49:08', '2021-11-05 09:49:08'),
(734, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:49:26', '2021-11-05 09:49:26'),
(735, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:49:54', '2021-11-05 09:49:54'),
(736, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:50:09', '2021-11-05 09:50:09'),
(737, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:50:21', '2021-11-05 09:50:21'),
(738, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:50:49', '2021-11-05 09:50:49'),
(739, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:50:49', '2021-11-05 09:50:49'),
(740, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:50:51', '2021-11-05 09:50:51'),
(741, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 09:51:08', '2021-11-05 09:51:08'),
(742, 1, 'admin/profiles/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:51:23', '2021-11-05 09:51:23'),
(743, 1, 'admin/profiles/10', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"k820enkKe4Kr6XwMpIWO3aBxtQXHixCvl5asA7Yf\",\"_method\":\"PUT\"}', '2021-11-05 09:51:52', '2021-11-05 09:51:52'),
(744, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:51:53', '2021-11-05 09:51:53'),
(745, 1, 'admin/profiles', 'GET', '127.0.0.1', '[]', '2021-11-05 09:53:34', '2021-11-05 09:53:34'),
(746, 1, 'admin/profiles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 09:53:53', '2021-11-05 09:53:53'),
(747, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 18:32:21', '2021-11-05 18:32:21'),
(748, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:32:39', '2021-11-05 18:32:39'),
(749, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:33:00', '2021-11-05 18:33:00'),
(750, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 18:33:33', '2021-11-05 18:33:33'),
(751, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:33:34', '2021-11-05 18:33:34'),
(752, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 18:33:54', '2021-11-05 18:33:54'),
(753, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:33:54', '2021-11-05 18:33:54'),
(754, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:37:56', '2021-11-05 18:37:56'),
(755, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 18:38:12', '2021-11-05 18:38:12'),
(756, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:38:12', '2021-11-05 18:38:12'),
(757, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:42:18', '2021-11-05 18:42:18'),
(758, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:43:26', '2021-11-05 18:43:26'),
(759, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:43:52', '2021-11-05 18:43:52'),
(760, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:44:05', '2021-11-05 18:44:05'),
(761, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:44:12', '2021-11-05 18:44:12'),
(762, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:44:19', '2021-11-05 18:44:19'),
(763, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 18:45:12', '2021-11-05 18:45:12'),
(764, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-05 18:46:03', '2021-11-05 18:46:03'),
(765, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:46:07', '2021-11-05 18:46:07'),
(766, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:46:12', '2021-11-05 18:46:12'),
(767, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$omiZ3CJUzWf\\/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS\",\"password_confirmation\":\"$2y$10$omiZ3CJUzWf\\/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/users\"}', '2021-11-05 18:46:23', '2021-11-05 18:46:23'),
(768, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2021-11-05 18:46:23', '2021-11-05 18:46:23'),
(769, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 18:48:11', '2021-11-05 18:48:11'),
(770, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 19:07:52', '2021-11-05 19:07:52'),
(771, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:07:52', '2021-11-05 19:07:52'),
(772, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:11:46', '2021-11-05 19:11:46'),
(773, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:11:48', '2021-11-05 19:11:48'),
(774, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:11:50', '2021-11-05 19:11:50'),
(775, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:11:51', '2021-11-05 19:11:51'),
(776, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:11:53', '2021-11-05 19:11:53'),
(777, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:12:04', '2021-11-05 19:12:04'),
(778, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:13:10', '2021-11-05 19:13:10'),
(779, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:13:11', '2021-11-05 19:13:11'),
(780, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:13:24', '2021-11-05 19:13:24'),
(781, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:13:37', '2021-11-05 19:13:37'),
(782, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:13:38', '2021-11-05 19:13:38'),
(783, 1, 'admin/categories/2', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Property\",\"description\":\"Rent or sell Houses in Uganda\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\"}', '2021-11-05 19:14:00', '2021-11-05 19:14:00'),
(784, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:14:01', '2021-11-05 19:14:01'),
(785, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:14:17', '2021-11-05 19:14:17'),
(786, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:15:07', '2021-11-05 19:15:07'),
(787, 1, 'admin/categories/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:15:09', '2021-11-05 19:15:09'),
(788, 1, 'admin/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:15:12', '2021-11-05 19:15:12'),
(789, 1, 'admin/categories/3', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Mobiles\",\"description\":\"Mobiles details go here\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\"}', '2021-11-05 19:15:26', '2021-11-05 19:15:26'),
(790, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:15:27', '2021-11-05 19:15:27'),
(791, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:16:27', '2021-11-05 19:16:27'),
(792, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"parent\":\"0\",\"name\":\"Vehicles\",\"description\":\"\\ud83d\\ude98 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:16:37', '2021-11-05 19:16:37'),
(793, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:16:38', '2021-11-05 19:16:38'),
(794, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:16:45', '2021-11-05 19:16:45'),
(795, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:17:28', '2021-11-05 19:17:28'),
(796, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:23:39', '2021-11-05 19:23:39'),
(797, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:24:05', '2021-11-05 19:24:05'),
(798, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:24:29', '2021-11-05 19:24:29'),
(799, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:24:39', '2021-11-05 19:24:39'),
(800, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:25:53', '2021-11-05 19:25:53'),
(801, 1, 'admin/categories/4', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Mobile Phones\",\"description\":\"Mobile Phones Details\",\"slug\":\"mobile-phones\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 19:26:17', '2021-11-05 19:26:17');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(802, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:26:18', '2021-11-05 19:26:18'),
(803, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:26:56', '2021-11-05 19:26:56'),
(804, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:27:26', '2021-11-05 19:27:26'),
(805, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:30:51', '2021-11-05 19:30:51'),
(806, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:32:21', '2021-11-05 19:32:21'),
(807, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:33:29', '2021-11-05 19:33:29'),
(808, 1, 'admin/categories/4', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"attributes\":{\"1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"Authenticity\",\"type\":\"radio\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"name\":\"Features\",\"type\":\"checkbox\",\"options\":[\"Bluetooth\",\"Camera\",\"Dual-Lens Camera\",\"Dual SIM\",\"Expandable Memory\",\"Fingerprint Sensor\",\"GPS\",\"Physical keyboard\",\"Motion Sensors\",\"3G\",\"4G\",\"GSM\",\"Touch screen\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"7\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"38\":{\"name\":\"Test\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"38\",\"_remove_\":\"0\"}},\"name\":\"Mobile Phones\",\"description\":\"Mobile Phones Details\",\"slug\":\"mobile-phones\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 19:34:17', '2021-11-05 19:34:17'),
(809, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:34:17', '2021-11-05 19:34:17'),
(810, 1, 'admin/categories/4', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"attributes\":{\"1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"Authenticity\",\"type\":\"radio\",\"options\":[\"Original\",\"Refurbished\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Acer\",\"Apple\",\"Asus\",\"Blackberry\",\"Blu\",\"China mobile\",\"Dell\",\"G-Five\",\"HTC\",\"Huawei\",\"Infinix\",\"Itel\",\"Lava\",\"Lenovo\",\"LG\",\"Motorola\",\"Nokia\",\"Oneplus\",\"OPPO\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"name\":\"Features\",\"type\":\"checkbox\",\"options\":[\"Bluetooth\",\"Camera\",\"Dual-Lens Camera\",\"Dual SIM\",\"Expandable Memory\",\"Fingerprint Sensor\",\"GPS\",\"Physical keyboard\",\"Motion Sensors\",\"3G\",\"4G\",\"GSM\",\"Touch screen\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"5\",\"_remove_\":\"0\"},\"7\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"7\",\"_remove_\":\"0\"},\"38\":{\"name\":\"Test\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"38\",\"_remove_\":\"0\"}},\"name\":\"Mobile Phones\",\"description\":\"Mobile Phones Details\",\"slug\":\"mobile-phones\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-05 19:37:10', '2021-11-05 19:37:10'),
(811, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:37:10', '2021-11-05 19:37:10'),
(812, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:38:16', '2021-11-05 19:38:16'),
(813, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:38:37', '2021-11-05 19:38:37'),
(814, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:38:51', '2021-11-05 19:38:51'),
(815, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:39:42', '2021-11-05 19:39:42'),
(816, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:39:49', '2021-11-05 19:39:49'),
(817, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:39:53', '2021-11-05 19:39:53'),
(818, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:39:57', '2021-11-05 19:39:57'),
(819, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:40:33', '2021-11-05 19:40:33'),
(820, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:40:39', '2021-11-05 19:40:39'),
(821, 1, 'admin/categories/8', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"is_required\":\"Cars\",\"description\":\"Car category details go here...\",\"slug\":\"cars\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Audi\",\"BMW\",\"Dodge\",\"Ferrari\",\"Hino\",\"Honder\",\"Hummer\",\"Isuzu\",\"Jaguar\",\"Honda\",\"Toyota\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"13\",\"_remove_\":\"0\"},\"14\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"16\",\"_remove_\":\"0\"},\"17\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"17\",\"_remove_\":\"0\"},\"18\":{\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"18\",\"_remove_\":\"0\"},\"19\":{\"name\":\"Transmission\",\"type\":\"radio\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"19\",\"_remove_\":\"0\"},\"20\":{\"name\":\"Body type\",\"type\":\"select\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"20\",\"_remove_\":\"0\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories?_sort%5Bcolumn%5D=parent&_sort%5Btype%5D=asc\"}', '2021-11-05 19:41:16', '2021-11-05 19:41:16'),
(822, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:41:17', '2021-11-05 19:41:17'),
(823, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:41:25', '2021-11-05 19:41:25'),
(824, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:41:28', '2021-11-05 19:41:28'),
(825, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"parent\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:41:30', '2021-11-05 19:41:30'),
(826, 1, 'admin/categories/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:41:40', '2021-11-05 19:41:40'),
(827, 1, 'admin/categories/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:41:58', '2021-11-05 19:41:58'),
(828, 1, 'admin/categories/5', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories\",\"slug\":\"mobile-phone-accessories\",\"attributes\":{\"8\":{\"name\":\"Item type\",\"type\":\"radio\",\"options\":[\"Power bank\",\"Screen protector\",\"Chargers\",\"Cables\",\"Holders and\",\"Stands\",\"VR Box\",\"Selfie Sticks\",\"Others\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"9\",\"_remove_\":\"0\"},\"10\":{\"name\":\"Negotiable\",\"type\":null,\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"10\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\"}', '2021-11-05 19:42:07', '2021-11-05 19:42:07'),
(829, 1, 'admin/categories/5/edit', 'GET', '127.0.0.1', '[]', '2021-11-05 19:42:08', '2021-11-05 19:42:08'),
(830, 1, 'admin/categories/5', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Mobile Phone Accessories\",\"description\":\"Mobile Phone Accessories\",\"slug\":\"mobile-phone-accessories\",\"attributes\":{\"8\":{\"name\":\"Item type\",\"type\":\"radio\",\"options\":[\"Power bank\",\"Screen protector\",\"Chargers\",\"Cables\",\"Holders and\",\"Stands\",\"VR Box\",\"Selfie Sticks\",\"Others\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"9\",\"_remove_\":\"0\"},\"10\":{\"name\":\"Negotiable\",\"type\":null,\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"10\",\"_remove_\":\"1\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\"}', '2021-11-05 19:44:29', '2021-11-05 19:44:29'),
(831, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:44:30', '2021-11-05 19:44:30'),
(832, 1, 'admin/categories/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:44:38', '2021-11-05 19:44:38'),
(833, 1, 'admin/categories/6', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Mobile Phone Services\",\"description\":\"Mobile Phone Services\",\"slug\":\"mobile-phone-services\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:44:50', '2021-11-05 19:44:50'),
(834, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:44:50', '2021-11-05 19:44:50'),
(835, 1, 'admin/categories/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:44:57', '2021-11-05 19:44:57'),
(836, 1, 'admin/categories/8', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Cars\",\"description\":\"Car category details go here...\",\"slug\":\"cars\",\"attributes\":{\"11\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"New\",\"Used\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Audi\",\"BMW\",\"Dodge\",\"Ferrari\",\"Hino\",\"Honder\",\"Hummer\",\"Isuzu\",\"Jaguar\",\"Honda\",\"Toyota\",null],\"units\":\"single\",\"is_required\":\"1\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"13\",\"_remove_\":\"0\"},\"14\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"14\",\"_remove_\":\"0\"},\"15\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"15\",\"_remove_\":\"0\"},\"16\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"16\",\"_remove_\":\"0\"},\"17\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"17\",\"_remove_\":\"0\"},\"18\":{\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":[\"Diesel\",\"Petrol\",\"CNG\",\"Hybrid\",\"Electric\",\"Octane\",\"LPG\",\"Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"18\",\"_remove_\":\"0\"},\"19\":{\"name\":\"Transmission\",\"type\":\"radio\",\"options\":[\"Manual\",\"Automatic\",\"Other transmission\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"19\",\"_remove_\":\"0\"},\"20\":{\"name\":\"Body type\",\"type\":\"select\",\"options\":[\"Saloon\",\"Hatchback\",\"Estate\",\"Sports\",\"SUV\",\"MPV\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"20\",\"_remove_\":\"0\"},\"21\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":\"21\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:45:10', '2021-11-05 19:45:10'),
(837, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:45:10', '2021-11-05 19:45:10'),
(838, 1, 'admin/categories/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:45:16', '2021-11-05 19:45:16'),
(839, 1, 'admin/categories/9', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Motorbikes\",\"description\":\"Motorbikes DETAILS GO HERE.....\",\"slug\":\"motorbikes\",\"attributes\":{\"22\":{\"name\":\"Bike type\",\"type\":\"radio\",\"options\":[\"Motorcycle\",\"Scooters\",\"E-bikes\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"22\",\"_remove_\":\"0\"},\"23\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"23\",\"_remove_\":\"0\"},\"24\":{\"name\":\"Brand\",\"type\":\"radio\",\"options\":[\"Akij\",\"Alliance\",\"Bajaj\",\"Senke\",\"Suzuki\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"24\",\"_remove_\":\"0\"},\"25\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"25\",\"_remove_\":\"0\"},\"26\":{\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"26\",\"_remove_\":\"0\"},\"27\":{\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":[null],\"units\":\"KM\",\"is_required\":\"1\",\"id\":\"27\",\"_remove_\":\"0\"},\"28\":{\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":[null],\"units\":\"CC\",\"is_required\":\"1\",\"id\":\"28\",\"_remove_\":\"0\"},\"29\":{\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":[\"Negotiable\",null],\"units\":null,\"is_required\":\"0\",\"id\":\"29\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:45:26', '2021-11-05 19:45:26'),
(840, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:45:26', '2021-11-05 19:45:26'),
(841, 1, 'admin/categories/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:45:31', '2021-11-05 19:45:31'),
(842, 1, 'admin/categories/10', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Land\",\"description\":\"Land DETAILS GO HERE\",\"slug\":\"land\",\"attributes\":{\"30\":{\"name\":\"Land type\",\"type\":\"select\",\"options\":[\"Agricultural\",\"Commercial\",\"Residential\",\"Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"30\",\"_remove_\":\"0\"},\"31\":{\"name\":\"Land size\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"31\",\"_remove_\":\"0\"},\"32\":{\"name\":\"Land size unit\",\"type\":\"select\",\"options\":[\"Acres\",\"Dedimal\",\"Plot\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"32\",\"_remove_\":\"0\"},\"33\":{\"name\":\"Land Address\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"33\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:45:39', '2021-11-05 19:45:39'),
(843, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:45:39', '2021-11-05 19:45:39'),
(844, 1, 'admin/categories/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:45:43', '2021-11-05 19:45:43'),
(845, 1, 'admin/categories/11', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Apartments For Sale\",\"description\":\"Apartments For Sale details go here\",\"slug\":\"apartments-for-sale\",\"attributes\":{\"34\":{\"name\":\"Beds\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"34\",\"_remove_\":\"0\"},\"35\":{\"name\":\"Baths\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"35\",\"_remove_\":\"0\"},\"36\":{\"name\":\"Size\",\"type\":\"number\",\"options\":[null],\"units\":\"sqft\",\"is_required\":\"1\",\"id\":\"36\",\"_remove_\":\"0\"},\"37\":{\"name\":\"Address\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"37\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 19:46:08', '2021-11-05 19:46:08'),
(846, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 19:46:08', '2021-11-05 19:46:08'),
(847, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:46:14', '2021-11-05 19:46:14'),
(848, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:48:44', '2021-11-05 19:48:44'),
(849, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-11-05 19:50:43', '2021-11-05 19:50:43'),
(850, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 19:51:24', '2021-11-05 19:51:24'),
(851, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-11-05 19:53:03', '2021-11-05 19:53:03'),
(852, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-11-05 19:53:26', '2021-11-05 19:53:26'),
(853, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Bicycles\",\"description\":\"Buy and sell all kinds of bicycles in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Adder Atlas\",\"Camp Claud\",\"Butler Combat\",\"Core Coyote\",\"Diamond Back\",\"Dragon Duranta\",\"Duranta Extreme\",\"Falcon Finiss\",\"Format Formula\",\"Foxter Galaxy\",\"Ghost Giant\",\"Haolaixi Hero\",\"Indigo Kellys\",\"Landao Laux\",\"Mbm Marine\",\"Merida Mustang\",\"Nekro Paxton\",\"Pelican Phoenix\",\"Precious Prince\",\"Python Raleigh\",\"Riddik Rock\",\"Machine Safeway\",\"Saracen Serious\",\"Trek Trinx\",\"Unifox Upland\",\"Veloce Vertigo\",\"Viking Voyager\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\"}', '2021-11-05 20:01:07', '2021-11-05 20:01:07'),
(854, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:01:08', '2021-11-05 20:01:08'),
(855, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:02:25', '2021-11-05 20:02:25'),
(856, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Trucks\",\"description\":\"Buy and sell all kinds of trucks in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Ashok Leyland\",\"Cng\\/Mishuk Eicher\",\"Foton Hino\",\"Isuzu Jac\",\"Jmc Mahindra\",\"Tata Toyota\",\"Other Brand\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"name\":\"Model year\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_5\":{\"name\":\"Kilometers run (km)\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 20:06:40', '2021-11-05 20:06:40'),
(857, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:06:40', '2021-11-05 20:06:40'),
(858, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:07:05', '2021-11-05 20:07:05'),
(859, 1, 'admin/categories/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:07:09', '2021-11-05 20:07:09'),
(860, 1, 'admin/categories/13', 'PUT', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"1\",\"name\":\"Trucks\",\"description\":\"Buy and sell all kinds of trucks in Uganda\",\"slug\":\"trucks\",\"attributes\":{\"41\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",\"Reconditioned\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"41\",\"_remove_\":\"0\"},\"42\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Ashok Leyland\",\"Cng\\/Mishuk Eicher\",\"Foton Hino\",\"Isuzu Jac\",\"Jmc Mahindra\",\"Tata Toyota\",\"Other Brand\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"42\",\"_remove_\":\"0\"},\"43\":{\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"43\",\"_remove_\":\"0\"},\"44\":{\"name\":\"Model year\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"44\",\"_remove_\":\"0\"},\"45\":{\"name\":\"Kilometers run (km)\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":\"45\",\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-11-05 20:07:18', '2021-11-05 20:07:18'),
(861, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-05 20:07:19', '2021-11-05 20:07:19'),
(862, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:08:27', '2021-11-05 20:08:27'),
(863, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Electronics\",\"description\":\"Buy and sell all kinds of electronics in Uganda\",\"slug\":null,\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-11-05 20:09:01', '2021-11-05 20:09:01'),
(864, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-05 20:09:01', '2021-11-05 20:09:01'),
(865, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:09:54', '2021-11-05 20:09:54'),
(866, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:08', '2021-11-05 20:12:08'),
(867, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:13', '2021-11-05 20:12:13'),
(868, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:14', '2021-11-05 20:12:14'),
(869, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:20', '2021-11-05 20:12:20'),
(870, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2021-11-05 20:12:24', '2021-11-05 20:12:24'),
(871, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:31', '2021-11-05 20:12:31'),
(872, 1, 'admin/categories/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:12:52', '2021-11-05 20:12:52'),
(873, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:13:03', '2021-11-05 20:13:03'),
(874, 1, 'admin/categories/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:13:11', '2021-11-05 20:13:11'),
(875, 1, 'admin/categories/14', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Electronics\",\"description\":\"Buy and sell all kinds of electronics in Uganda\",\"slug\":\"electronics\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\"}', '2021-11-05 20:15:17', '2021-11-05 20:15:17'),
(876, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:15:17', '2021-11-05 20:15:17'),
(877, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:15:20', '2021-11-05 20:15:20'),
(878, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"14\",\"name\":\"Desktop Computers\",\"description\":\"Buy and sell all kinds of Desktop Computers in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Customized Desktops\",\"Acer Ainol\",\"Apple iMac\",\"Asus Compaq\",\"Daffodil Dell\",\"Fujitsu Gateway\",\"Gigabyte Haier\",\"HP IBM\",\"INSYS Intel\",\"Lenovo Microsoft\",\"Panasonic Samsung\",\"Sony Toshiba\",\"Walton Other\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"RAM SIZE (in GB)\",\"type\":\"number\",\"options\":[null],\"units\":\"GB\",\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"name\":\"Processor (GHz)\",\"type\":\"number\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 20:19:17', '2021-11-05 20:19:17'),
(879, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:19:17', '2021-11-05 20:19:17'),
(880, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:19:40', '2021-11-05 20:19:40'),
(881, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"14\",\"name\":\"Laptops\",\"description\":\"Buy and sell all kinds of ... in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Acer Ainol\",\"Amazon Apple\",\"MacBook Asus\",\"Blackberry Compaq\",\"Daffodil Dell\",\"Doel Fujitsu\",\"Gateway Gigabyte\",\"Google Haier\",\"HP HTC\",\"Huawei IBM\",\"INSYS Intel\",\"Lenovo LG\",\"Maximus Maxis\",\"Microsoft Mycell\",\"Panasonic Prolink\",\"Samsung SIHGTECH\",\"Sony Symphony\",\"Toshiba Walton\",\"Xiaomi ZedAir\",\"Other brand\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 20:21:54', '2021-11-05 20:21:54'),
(882, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:21:54', '2021-11-05 20:21:54'),
(883, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:21:59', '2021-11-05 20:21:59'),
(884, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Laptop & Computer Accessories\",\"description\":\"Buy and sell all kinds of Laptop & Computer Accessories in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":null,\"type\":null,\"options\":[null],\"units\":null,\"is_required\":\"0\",\"id\":null,\"_remove_\":\"1\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories\"}', '2021-11-05 20:23:55', '2021-11-05 20:23:55'),
(885, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2021-11-05 20:23:55', '2021-11-05 20:23:55'),
(886, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:24:09', '2021-11-05 20:24:09'),
(887, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:24:13', '2021-11-05 20:24:13'),
(888, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:24:14', '2021-11-05 20:24:14'),
(889, 1, 'admin/categories/17/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:24:18', '2021-11-05 20:24:18'),
(890, 1, 'admin/categories/17', 'PUT', '127.0.0.1', '{\"has_parent\":\"0\",\"name\":\"Laptop & Computer Accessories\",\"description\":\"Buy and sell all kinds of Laptop & Computer Accessories in Uganda\",\"slug\":\"laptop-computer-accessories\",\"attributes\":{\"52\":{\"name\":\"Condition\",\"type\":\"radio\",\"options\":[\"Used\",\"New\",null],\"units\":null,\"is_required\":\"1\",\"id\":\"52\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Item type\",\"type\":\"select\",\"options\":[\"Motherboards Keyboards\",\"Processors Monitors\",\"Hard Drives\",\"Graphics Cards\",\"Software Mouse\",\"Modems &\",\"Routers Printers\",\"& Scanners\",\"RAMs Pendrive\",\"UPS Laptop\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-11-05 20:25:04', '2021-11-05 20:25:04'),
(891, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-05 20:25:04', '2021-11-05 20:25:04'),
(892, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:25:26', '2021-11-05 20:25:26'),
(893, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"has_parent\":\"1\",\"parent\":\"14\",\"name\":\"Laptop & Computer Accessories\",\"description\":\"Buy and sell all kinds of TVs in Uganda\",\"slug\":null,\"attributes\":{\"new_1\":{\"name\":\"Brand\",\"type\":\"select\",\"options\":[\"Haier JVC\",\"Konka LG\",\"Minister MyOne\",\"National NEC\",\"Nippon Panasonic\",\"Philips Prestige\",\"Rangs R-One\",\"Samsung Sansui\",\"Sharp Singer\",\"Sky Tech\",\"Sky View\",\"Sony TCL\",\"Toshiba Toshin\",\"Transtec Triton\",\"View One\",\"Vision Walton\",\"Other brand\",null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Model\",\"type\":\"text\",\"options\":[null],\"units\":null,\"is_required\":\"1\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/categories?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-11-05 20:28:29', '2021-11-05 20:28:29'),
(894, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-05 20:28:30', '2021-11-05 20:28:30'),
(895, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:33:24', '2021-11-05 20:33:24'),
(896, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:33:25', '2021-11-05 20:33:25'),
(897, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"17\",\"_model\":\"App_Models_Category\",\"_token\":\"m0IEz6Ie5ubQiOtkg8zkfecbt61HzCQb2cF0Hx1k\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-05 20:33:38', '2021-11-05 20:33:38'),
(898, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-05 20:33:38', '2021-11-05 20:33:38');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2021-09-17 18:04:27', '2021-09-17 18:04:27');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$omiZ3CJUzWf/QGmwiLplGuDz2KT8Tf2fSa22oicpuP9H2kuOi45vS', 'Administrator', '1705787-Linus-Torvalds-Quote-Talk-is-cheap-Show-me-the-code.jpeg', 's3zeVOUpquqSV4GtfA0E1JjDpSR9CwrDAK6NrGMVZ7y865E0Qod90isacuJy', '2021-09-17 18:04:26', '2021-11-05 18:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `is_required` tinyint(4) DEFAULT NULL,
  `units` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `created_at`, `updated_at`, `category_id`, `name`, `type`, `options`, `is_required`, `units`) VALUES
(1, '2021-10-08 08:56:27', '2021-10-08 09:04:30', 4, 'Condition', 'radio', 'New,Used', 1, NULL),
(2, '2021-10-08 09:05:07', '2021-10-08 09:45:04', 4, 'Authenticity', 'radio', 'Original,Refurbished', 1, NULL),
(3, '2021-10-08 09:35:01', '2021-10-08 09:45:17', 4, 'Brand', 'select', 'Acer,Apple,Asus,Blackberry,Blu,China mobile,Dell,G-Five,HTC,Huawei,Infinix,Itel,Lava,Lenovo,LG,Motorola,Nokia,Oneplus,OPPO', 1, 'single'),
(4, '2021-10-08 09:37:20', '2021-10-08 09:45:35', 4, 'Model', 'text', '', 1, NULL),
(5, '2021-10-08 09:39:35', '2021-10-08 09:39:35', 4, 'Features', 'checkbox', 'Bluetooth,Camera,Dual-Lens Camera,Dual SIM,Expandable Memory,Fingerprint Sensor,GPS,Physical keyboard,Motion Sensors,3G,4G,GSM,Touch screen', 0, NULL),
(7, '2021-10-08 09:43:11', '2021-10-08 09:45:45', 4, 'Negotiable', 'checkbox', '', 0, NULL),
(8, '2021-10-08 10:08:19', '2021-10-08 10:08:19', 5, 'Item type', 'radio', 'Power bank,Screen protector,Chargers,Cables,Holders and,Stands,VR Box,Selfie Sticks,Others', 1, 'single'),
(9, '2021-10-08 10:36:30', '2021-10-08 11:21:34', 5, 'Condition', 'radio', 'New,Used', 1, NULL),
(11, '2021-10-08 10:49:43', '2021-10-08 11:21:04', 8, 'Condition', 'radio', 'New,Used,Reconditioned', 1, NULL),
(12, '2021-10-08 11:24:12', '2021-10-08 11:24:12', 8, 'Brand', 'select', 'Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota', 1, 'single'),
(13, '2021-10-08 11:24:51', '2021-10-08 11:24:51', 8, 'Model', 'text', '', 1, NULL),
(14, '2021-10-08 11:26:00', '2021-10-08 11:26:00', 8, 'Trim / Edition', 'text', '', 1, NULL),
(15, '2021-10-08 11:26:24', '2021-10-08 11:26:24', 8, 'Year of Manufacture', 'number', '', 1, NULL),
(16, '2021-10-08 11:26:57', '2021-10-08 11:26:57', 8, 'Kilometers run', 'number', '', 1, 'KM'),
(17, '2021-10-08 11:27:24', '2021-10-08 11:27:24', 8, 'Engine capacity', 'number', '', 1, 'CC'),
(18, '2021-10-08 11:29:14', '2021-10-08 11:29:14', 8, 'Fuel type', 'radio', 'Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other', 1, NULL),
(19, '2021-10-08 11:29:47', '2021-10-08 11:29:47', 8, 'Transmission', 'radio', 'Manual,Automatic,Other transmission', 1, NULL),
(20, '2021-10-08 11:30:34', '2021-10-08 11:31:47', 8, 'Body type', 'select', 'Saloon,Hatchback,Estate,Sports,SUV,MPV', 0, NULL),
(21, '2021-10-08 11:32:34', '2021-10-08 11:32:34', 8, 'Negotiable', 'checkbox', '', 0, NULL),
(22, '2021-10-08 11:37:24', '2021-10-08 11:37:24', 9, 'Bike type', 'radio', 'Motorcycle,Scooters,E-bikes', 1, NULL),
(23, '2021-10-08 11:38:25', '2021-10-08 11:38:25', 9, 'Condition', 'radio', 'Used,New', 1, NULL),
(24, '2021-10-08 11:39:44', '2021-10-08 11:41:27', 9, 'Brand', 'radio', 'Akij,Alliance,Bajaj,Senke,Suzuki', 1, NULL),
(25, '2021-10-08 11:41:56', '2021-10-08 11:41:56', 9, 'Trim / Edition', 'text', '', 1, NULL),
(26, '2021-10-08 11:42:33', '2021-10-08 11:42:33', 9, 'Year of Manufacture', 'number', '', 1, NULL),
(27, '2021-10-08 11:42:50', '2021-10-08 11:42:50', 9, 'Kilometers run', 'number', '', 1, 'KM'),
(28, '2021-10-08 11:43:38', '2021-10-08 11:43:38', 9, 'Engine capacity', 'number', '', 1, 'CC'),
(29, '2021-10-08 11:44:18', '2021-10-08 11:44:18', 9, 'Negotiable', 'checkbox', 'Negotiable', 0, NULL),
(30, '2021-10-08 11:50:18', '2021-10-08 11:50:18', 10, 'Land type', 'select', 'Agricultural,Commercial,Residential,Other', 1, NULL),
(31, '2021-10-08 11:51:24', '2021-10-08 11:51:24', 10, 'Land size', 'number', '', 1, NULL),
(32, '2021-10-08 11:52:52', '2021-10-12 04:19:05', 10, 'Land size unit', 'select', 'Acres,Dedimal,Plot', 1, NULL),
(33, '2021-10-08 11:54:12', '2021-10-08 11:54:12', 10, 'Land Address', 'text', '', 1, NULL),
(34, '2021-10-08 11:57:49', '2021-10-08 11:57:49', 11, 'Beds', 'number', '', 1, NULL),
(35, '2021-10-08 11:58:33', '2021-10-08 11:58:33', 11, 'Baths', 'number', '', 1, NULL),
(36, '2021-10-08 11:59:10', '2021-10-08 11:59:10', 11, 'Size', 'number', '', 1, 'sqft'),
(37, '2021-10-08 11:59:44', '2021-10-08 11:59:44', 11, 'Address', 'text', '', 1, NULL),
(38, '2021-10-09 04:44:15', '2021-11-05 19:37:10', 4, 'Test', 'text', '', 0, NULL),
(39, '2021-11-05 20:01:07', '2021-11-05 20:01:07', 12, 'Condition', 'radio', 'Used,New', 1, NULL),
(40, '2021-11-05 20:01:07', '2021-11-05 20:01:07', 12, 'Brand', 'select', 'Adder Atlas,Camp Claud,Butler Combat,Core Coyote,Diamond Back,Dragon Duranta,Duranta Extreme,Falcon Finiss,Format Formula,Foxter Galaxy,Ghost Giant,Haolaixi Hero,Indigo Kellys,Landao Laux,Mbm Marine,Merida Mustang,Nekro Paxton,Pelican Phoenix,Precious Prince,Python Raleigh,Riddik Rock,Machine Safeway,Saracen Serious,Trek Trinx,Unifox Upland,Veloce Vertigo,Viking Voyager', 1, NULL),
(41, '2021-11-05 20:06:40', '2021-11-05 20:06:40', 13, 'Condition', 'radio', 'Used,New,Reconditioned', 1, NULL),
(42, '2021-11-05 20:06:40', '2021-11-05 20:06:40', 13, 'Brand', 'select', 'Ashok Leyland,Cng/Mishuk Eicher,Foton Hino,Isuzu Jac,Jmc Mahindra,Tata Toyota,Other Brand', 1, NULL),
(43, '2021-11-05 20:06:40', '2021-11-05 20:06:40', 13, 'Trim / Edition', 'text', NULL, 1, NULL),
(44, '2021-11-05 20:06:40', '2021-11-05 20:06:40', 13, 'Model year', 'number', NULL, 1, NULL),
(45, '2021-11-05 20:06:40', '2021-11-05 20:06:40', 13, 'Kilometers run (km)', 'number', NULL, 1, NULL),
(46, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Condition', 'radio', 'Used,New', 1, NULL),
(47, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Brand', 'select', 'Customized Desktops,Acer Ainol,Apple iMac,Asus Compaq,Daffodil Dell,Fujitsu Gateway,Gigabyte Haier,HP IBM,INSYS Intel,Lenovo Microsoft,Panasonic Samsung,Sony Toshiba,Walton Other', 1, NULL),
(48, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'RAM SIZE (in GB)', 'number', NULL, 1, 'GB'),
(49, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 15, 'Processor (GHz)', 'number', NULL, 1, NULL),
(50, '2021-11-05 20:21:54', '2021-11-05 20:21:54', 16, 'Condition', 'radio', 'Used,New', 1, NULL),
(51, '2021-11-05 20:21:54', '2021-11-05 20:21:54', 16, 'Brand', 'select', 'Acer Ainol,Amazon Apple,MacBook Asus,Blackberry Compaq,Daffodil Dell,Doel Fujitsu,Gateway Gigabyte,Google Haier,HP HTC,Huawei IBM,INSYS Intel,Lenovo LG,Maximus Maxis,Microsoft Mycell,Panasonic Prolink,Samsung SIHGTECH,Sony Symphony,Toshiba Walton,Xiaomi ZedAir,Other brand', 1, NULL),
(52, '2021-11-05 20:23:55', '2021-11-05 20:23:55', 17, 'Condition', 'radio', 'Used,New', 1, NULL),
(53, '2021-11-05 20:25:04', '2021-11-05 20:25:04', 17, 'Item type', 'select', 'Motherboards Keyboards,Processors Monitors,Hard Drives,Graphics Cards,Software Mouse,Modems &,Routers Printers,& Scanners,RAMs Pendrive,UPS Laptop', 1, NULL),
(54, '2021-11-05 20:28:29', '2021-11-05 20:28:29', 18, 'Brand', 'select', 'Haier JVC,Konka LG,Minister MyOne,National NEC,Nippon Panasonic,Philips Prestige,Rangs R-One,Samsung Sansui,Sharp Singer,Sky Tech,Sky View,Sony TCL,Toshiba Toshin,Transtec Triton,View One,Vision Walton,Other brand', 1, NULL),
(55, '2021-11-05 20:28:29', '2021-11-05 20:28:29', 18, 'Model', 'text', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_parent` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `parent`, `name`, `description`, `slug`, `image`, `has_parent`) VALUES
(1, '2021-09-17 18:13:44', '2021-11-05 19:16:37', 0, 'Vehicles', '🚘 Looking to buy a vehicle? Find bargain deals on new and used vehicles for sale in Uganda or sell vehicles online at the best price only on ...., The largest marketplace in Uganda!', 'vehicles', 'storage/cars.png', 0),
(2, '2021-09-17 18:16:29', '2021-11-05 19:14:00', 0, 'Property', 'Rent or sell Houses in Uganda', 'property', 'storage/property.png', 0),
(3, '2021-09-17 18:17:43', '2021-11-05 19:15:26', 0, 'Mobiles', 'Mobiles details go here', 'mobiles', 'storage/phones.png', 0),
(4, '2021-10-07 21:56:10', '2021-11-05 19:26:17', 3, 'Mobile Phones', 'Mobile Phones Details', 'mobile-phones', 'storage/bd06486d5f513a942f6a1c8c95029567.png', 0),
(5, '2021-10-07 21:56:46', '2021-11-05 19:44:29', 3, 'Mobile Phone Accessories', 'Mobile Phone Accessories', 'mobile-phone-accessories', 'storage/824a5f52f484b0e2dd4d69927d2e75dd.png', 0),
(6, '2021-10-07 21:57:10', '2021-11-05 19:44:50', 3, 'Mobile Phone Services', 'Mobile Phone Services', 'mobile-phone-services', 'storage/3ace2313e281e48d84f78ad910fb2dfd.png', 0),
(8, '2021-10-08 10:42:37', '2021-11-05 19:45:10', 1, 'Cars', 'Car category details go here...', 'cars', 'storage/7fcc8ebaeeb66a04d4287c5bab3abb4a.png', 0),
(9, '2021-10-08 11:35:36', '2021-11-05 19:45:26', 1, 'Motorbikes', 'Motorbikes DETAILS GO HERE.....', 'motorbikes', 'storage/347555768ce414027d26edc4ada2d36d.png', 0),
(10, '2021-10-08 11:48:37', '2021-11-05 19:45:39', 2, 'Land', 'Land DETAILS GO HERE', 'land', 'storage/e012a37a43658448196c803aa14644aa.png', 0),
(11, '2021-10-08 11:56:53', '2021-11-05 19:46:08', 2, 'Apartments For Sale', 'Apartments For Sale details go here', 'apartments-for-sale', 'storage/c9c56ed918c6413b03d772267a1307eb.png', 0),
(12, '2021-11-05 20:01:07', '2021-11-05 20:01:07', 1, 'Bicycles', 'Buy and sell all kinds of bicycles in Uganda', 'bicycles', 'storage/2ceb3a912fa484a37a75866f0424c5e5.png', 1),
(13, '2021-11-05 20:06:40', '2021-11-05 20:07:18', 1, 'Trucks', 'Buy and sell all kinds of trucks in Uganda', 'trucks', 'storage/c457727a6e310a03f6de8c8d297f2a00.png', 1),
(14, '2021-11-05 20:09:01', '2021-11-05 20:09:01', 0, 'Electronics', 'Buy and sell all kinds of electronics in Uganda', 'electronics', 'storage/electronics.png', 0),
(15, '2021-11-05 20:19:17', '2021-11-05 20:19:17', 14, 'Desktop Computers', 'Buy and sell all kinds of Desktop Computers in Uganda', 'desktop-computers', 'storage/3c81f545893d9296ef0be54abadc863d.png', 1),
(16, '2021-11-05 20:21:54', '2021-11-05 20:21:54', 14, 'Laptops', 'Buy and sell all kinds of ... in Uganda', 'laptops', 'storage/24c5bf10137068b52c6c4cb8b04aa60e.png', 1),
(18, '2021-11-05 20:28:29', '2021-11-05 20:28:29', 14, 'Laptop & Computer Accessories', 'Buy and sell all kinds of TVs in Uganda', 'laptop-computer-accessories', 'storage/7c8436c4d3532069078b992c01b8f52e.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `thread` text COLLATE utf8mb4_unicode_ci,
  `received` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `created_at`, `updated_at`, `body`, `sender`, `receiver`, `product_id`, `thread`, `received`, `seen`) VALUES
(1, '2021-10-16 07:35:12', '2021-10-16 07:35:12', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(2, '2021-10-16 07:37:06', '2021-10-16 07:37:06', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(3, '2021-10-16 07:37:10', '2021-10-16 07:37:10', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(4, '2021-10-16 07:39:07', '2021-10-16 07:39:07', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(5, '2021-10-16 07:39:46', '2021-10-16 07:39:46', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(6, '2021-10-16 07:39:55', '2021-10-16 07:39:55', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(7, '2021-10-16 07:40:05', '2021-10-16 07:40:05', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(8, '2021-10-16 07:40:17', '2021-10-16 07:40:17', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(9, '2021-10-16 07:41:40', '2021-10-16 07:41:40', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(10, '2021-10-16 07:42:50', '2021-10-16 07:42:50', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(11, '2021-10-16 07:46:22', '2021-10-16 07:46:22', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(12, '2021-10-16 07:46:38', '2021-10-16 07:46:38', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(13, '2021-10-16 07:47:50', '2021-10-16 07:47:50', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(14, '2021-10-16 07:48:17', '2021-10-16 07:48:17', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(15, '2021-10-16 07:48:35', '2021-10-16 07:48:35', 'simple message test', 7, 8, 4, '7-8-4', 0, 1),
(16, '2021-10-16 07:58:50', '2021-10-16 07:58:50', 'i love this', 8, 7, 4, '7-8-4', 0, 1),
(17, '2021-10-16 07:59:03', '2021-10-16 07:59:03', 'don;t you?', 8, 7, 4, '7-8-4', 0, 1),
(18, '2021-10-16 07:59:11', '2021-10-16 07:59:11', 'I do!', 7, 8, 4, '7-8-4', 0, 1),
(19, '2021-10-16 09:14:25', '2021-10-16 09:14:25', 'asbjlaks', 7, 8, 4, '7-8-4', 0, 1),
(20, '2021-10-16 09:15:12', '2021-10-16 09:15:12', 'romina is so romantic', 7, 8, 4, '7-8-4', 0, 1),
(21, '2021-10-16 09:17:14', '2021-10-16 09:17:14', 'this si as sipl ', 7, 8, 4, '7-8-4', 0, 1),
(22, '2021-10-16 09:18:22', '2021-10-16 09:18:22', 'asknkjas', 7, 8, 4, '7-8-4', 0, 1),
(23, '2021-10-16 09:19:35', '2021-10-16 09:19:35', 'asljnkas', 7, 8, 4, '7-8-4', 0, 1),
(24, '2021-10-16 09:19:35', '2021-10-16 09:19:35', 'asljnkas', 7, 8, 4, '7-8-4', 0, 1),
(25, '2021-10-16 09:20:26', '2021-10-16 09:20:26', 'asas', 7, 8, 4, '7-8-4', 0, 1),
(26, '2021-10-16 09:22:29', '2021-10-16 09:22:29', 'aksnkljas', 7, 8, 4, '7-8-4', 0, 1),
(27, '2021-10-16 09:28:01', '2021-10-16 09:28:01', 'tes messg', 7, 8, 4, '7-8-4', 0, 1),
(28, '2021-10-16 09:32:14', '2021-10-16 09:32:14', 'ashb', 7, 8, 4, '7-8-4', 0, 1),
(29, '2021-10-16 09:33:00', '2021-10-16 09:33:00', 'ansams', 7, 8, 4, '7-8-4', 0, 1),
(30, '2021-10-16 09:34:18', '2021-10-16 09:34:18', 'anjane', 7, 8, 4, '7-8-4', 0, 1),
(31, '2021-10-16 09:34:58', '2021-10-16 09:34:58', 'anjane says hi', 7, 8, 4, '7-8-4', 0, 1),
(32, '2021-10-16 09:35:34', '2021-10-16 09:35:34', 'Hi', 7, 8, 4, '7-8-4', 0, 1),
(33, '2021-10-16 09:35:39', '2021-10-16 09:35:39', 'My name is Muhindo', 7, 8, 4, '7-8-4', 0, 1),
(34, '2021-10-16 09:35:51', '2021-10-16 09:35:51', 'i love making new firends', 7, 8, 4, '7-8-4', 0, 1),
(35, '2021-10-16 09:37:34', '2021-10-16 09:37:34', 'siml', 7, 8, 4, '7-8-4', 0, 1),
(36, '2021-10-16 09:39:06', '2021-10-16 09:39:06', 'as', 7, 8, 4, '7-8-4', 0, 1),
(37, '2021-10-16 09:39:22', '2021-10-16 09:39:22', 'asjbka', 7, 8, 4, '7-8-4', 0, 1),
(38, '2021-10-16 09:39:40', '2021-10-16 09:39:40', 'asbjlas', 7, 8, 4, '7-8-4', 0, 1),
(39, '2021-10-16 09:39:43', '2021-10-16 09:39:43', 'hjavsgvas', 7, 8, 4, '7-8-4', 0, 1),
(40, '2021-10-16 09:41:24', '2021-10-16 09:41:24', 'anjane', 7, 8, 4, '7-8-4', 0, 1),
(41, '2021-10-16 09:41:32', '2021-10-16 09:41:32', 'I need to come to see you tomorrow', 7, 8, 4, '7-8-4', 0, 1),
(42, '2021-10-16 09:42:16', '2021-10-16 09:42:16', 'yes sure!', 7, 8, 4, '7-8-4', 0, 1),
(43, '2021-10-16 11:31:08', '2021-10-16 11:31:08', 'i love this product', 8, 7, 2, '8-7-2', 0, 1),
(44, '2021-10-16 11:31:25', '2021-10-16 11:31:25', 'Do you mind if you find me on my whastapp', 8, 7, 2, '8-7-2', 0, 1),
(45, '2021-10-17 10:15:20', '2021-10-17 10:15:20', 'I just love this!', 8, 7, 1, '8-7-1', 0, 1),
(46, '2021-10-17 10:15:33', '2021-10-17 10:15:33', 'do you mind if you text me please?', 8, 7, 1, '8-7-1', 0, 1),
(47, '2021-10-17 10:15:51', '2021-10-17 10:15:51', 'Call me if you see this message !', 8, 7, 1, '8-7-1', 0, 1),
(48, '2021-10-17 10:16:08', '2021-10-17 10:16:08', 'thank you!', 8, 7, 1, '8-7-1', 0, 1),
(49, '2021-10-17 10:34:43', '2021-10-17 10:34:43', 'I love that', 7, 8, 4, '7-8-4', 0, 1),
(50, '2021-10-17 10:35:06', '2021-10-17 10:35:06', 'people are not simple', 7, 8, 1, '8-7-1', 0, 1),
(51, '2021-10-17 10:36:24', '2021-10-17 10:36:24', 'I love that of course!', 8, 7, 1, '8-7-1', 0, 1),
(52, '2021-10-17 10:36:39', '2021-10-17 10:36:39', 'this is what I have been praying for!', 8, 7, 1, '8-7-1', 0, 1),
(53, '2021-10-17 10:45:32', '2021-10-17 10:45:32', 'i love this', 7, 8, 1, '8-7-1', 0, 1),
(54, '2021-10-17 10:49:16', '2021-10-17 10:49:16', 'see you tomorrow!', 7, 8, 1, '8-7-1', 0, 1),
(55, '2021-10-17 10:50:32', '2021-10-17 10:50:32', 'i love this', 7, 8, 1, '8-7-1', 0, 1),
(56, '2021-10-17 10:51:08', '2021-10-17 10:51:08', 'some people are not easy', 7, 8, 1, '8-7-1', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `country_id`, `name`, `longitude`, `latitude`, `details`, `image`, `listed`) VALUES
(1, '2021-09-23 07:46:44', '2021-10-02 15:20:51', 1, 'Kampala', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'd8fd9f28af0cdfa8b8f213d347c4fb78.jpg', '1'),
(2, '2021-09-23 07:46:58', '2021-10-02 18:59:13', 1, 'Mbarara', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-mbarara.jpg', '1'),
(3, '2021-09-23 07:47:11', '2021-10-02 18:59:51', 4, 'Dubai', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-dubai.jpg', '1'),
(4, '2021-09-23 07:47:22', '2021-10-02 19:01:02', 1, 'Kasese', NULL, NULL, NULL, '01.jpg', '0'),
(5, '2021-10-02 11:55:41', '2021-10-02 19:01:55', 2, 'Istanbul', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'city-istanbul.jpg', '1'),
(6, '2021-10-02 11:56:42', '2021-10-02 19:00:35', 4, 'Qatar', '16.2212', '18.2222', NULL, 'city-qatar.jpg', '1'),
(7, '2021-10-02 12:03:52', '2021-10-02 19:00:05', 3, 'China', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', 'city-quanzhou.jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `longitude`, `latitude`, `details`, `image`, `code`, `listed`) VALUES
(1, '2021-09-23 07:38:25', '2021-09-23 07:38:25', 'Uganda', '16.2212.', '18.2222', 'Uganda is a landlocked country in East Africa whose diverse landscape encompasses the snow-capped Rwenzori Mountains and immense Lake Victoria. Its abundant wildlife includes chimpanzees as well as rare birds. Remote Bwindi Impenetrable National Park is a renowned mountain gorilla sanctuary. Murchison Falls National Park in the northwest is known for its 43m-tall waterfall and wildlife such as hippos.', NULL, '256', '1'),
(2, '2021-09-23 07:41:16', '2021-09-23 07:41:16', 'Turkey', '16.2212.', '18.2222', 'Turkey, officially the Republic of Turkey, is a country bridging Europe and Asia. It shares borders with Greece and Bulgaria to the northwest; the Black Sea to the north; Georgia to the northeast;', 'images/Flag_of_Turkey.svg.png', '+90', '1'),
(3, '2021-10-02 11:36:43', '2021-10-02 11:36:43', 'China', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'images/city-quanzhou.jpg', '256', '1'),
(4, '2021-10-02 11:38:03', '2021-10-02 11:38:03', 'UAE', '16.2212.', '18.2222', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae exercitationem vitae quam libero dignissimos rerum odio deleniti', 'images/city-dubai.jpg', '441188', '1');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `size`, `width`, `height`, `src`, `name`, `thumbnail`) VALUES
(1, '2021-09-18 09:37:41', '2021-09-18 09:37:41', 1, NULL, NULL, NULL, NULL, 'public/MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png', NULL, 'public/thumb_MgW7hmTnfXm1CaEdV525VsU9oAa0h2zjvAa2fDJ1.png'),
(2, '2021-09-18 09:39:09', '2021-09-18 09:39:09', 1, NULL, NULL, NULL, NULL, 'public/cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png', NULL, 'public/thumb_cNznQD2kbTcXZZ31JxUGcjElBv6UhI37OCzGl1hk.png'),
(3, '2021-09-18 09:39:32', '2021-09-18 09:39:32', 1, NULL, NULL, NULL, NULL, 'public/fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png', NULL, 'public/thumb_fbJ4qhkrq2rhopxEAZ7ACWLOv3e8Xgv60IvNyZ32.png'),
(4, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png', NULL, 'public/thumb_CnZXzyFFJTAfZCjXXaS2zb5w8zHhu7o8ZOwMmWzy.png'),
(5, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png', NULL, 'public/thumb_lC3ldkuqylg9kIipPLUGXhqmMUCqGrX1aziiPy5P.png'),
(6, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png', NULL, 'public/thumb_vQTtt1DYr8TNH4O6y3TckvSonicJz4HNMuvoH4vK.png'),
(7, '2021-09-18 09:40:01', '2021-09-18 09:40:01', 1, NULL, NULL, NULL, NULL, 'public/BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png', NULL, 'public/thumb_BR8lmoFdMjyDilLtXLho6kiaLZelR5YsrLskgCUP.png'),
(8, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png', NULL, 'public/thumb_ThltVNoMhDQGShBcdyBBWprzUa1yBjR7YmJjNoOl.png'),
(9, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png', NULL, 'public/thumb_DHy7TBDHBitLcjFu5IvXITOPXoKV3VZMTFGv89m0.png'),
(10, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png', NULL, 'public/thumb_qGpwxVmSC31FpSq5yI6OU1YRuVJcAQFTWd1WlXjv.png'),
(11, '2021-09-18 09:40:29', '2021-09-18 09:40:29', 1, NULL, NULL, NULL, NULL, 'public/J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png', NULL, 'public/thumb_J4d505h4y0skY5qr7pKrJMJSpJQYIGNiAqkNLvRQ.png'),
(12, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png', NULL, 'public/thumb_yu62gPXVRTuEO3TpL0XBDi335BVYCCDEZzZk4mxK.png'),
(13, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png', NULL, 'public/thumb_z5dSFMAdAdOUs0J585w8hDMI8GMPh0i0KthmVhY2.png'),
(14, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png', NULL, 'public/thumb_PwjUhGyuwcPVog92OrW4WahLHcDddXybqarVYTR0.png'),
(15, '2021-09-18 09:42:56', '2021-09-18 09:42:56', 1, NULL, NULL, NULL, NULL, 'public/bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png', NULL, 'public/thumb_bs2lNXPppvL2ClcZ05PRLJO20FQ9PfbK5kxJO8Hy.png'),
(16, '2021-09-18 11:44:10', '2021-09-18 11:44:10', 1, NULL, NULL, NULL, NULL, 'public/khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png', NULL, 'public/thumb_khirV2BKPl15UsNNynUhZmAdxlBv31vnyryM5Y0y.png'),
(17, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png', NULL, 'public/thumb_PDoI1DJOK0x8rPESYTNe5vJAGuvA8IQkQVdidHhU.png'),
(18, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png', NULL, 'public/thumb_9meMaBZ52fbiX7HvFYl7zTMbabUk3n62VYEwOGfN.png'),
(19, '2021-09-18 11:44:11', '2021-09-18 11:44:11', 1, NULL, NULL, NULL, NULL, 'public/l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png', NULL, 'public/thumb_l8fuEDd5xZaMydC2K1LANr1yaE0r2lPRBjzUgeLF.png'),
(20, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png', NULL, 'public/thumb_IhFh607BR9MSGvQik7WOhPSg5qto3u2yHuXjjkOv.png'),
(21, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png', NULL, 'public/thumb_WS2WLUPZF6UiwMG3QmAzAXyEqlpqpEv8hnX4lqdh.png'),
(22, '2021-09-18 11:46:12', '2021-09-18 11:46:12', 1, NULL, NULL, NULL, NULL, 'public/3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png', NULL, 'public/thumb_3FwKJlTHNkZeClCfxf13Dx1B73NXcwUGLC5fP3oq.png'),
(23, '2021-09-18 11:46:13', '2021-09-18 11:46:13', 1, NULL, NULL, NULL, NULL, 'public/3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png', NULL, 'public/thumb_3tO5AHTdlVf2GsdTZ1gQHVIEDTntd0GhntOefhgV.png'),
(24, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png', NULL, 'public/thumb_fljgtgldZIOwtUSY48Q71NcUh2uJL0gQNC1RSB5H.png'),
(25, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png', NULL, 'public/thumb_TSvVTYQKx9P0bFlcrH8FIYGZaw32UUkWpoNX3HVy.png'),
(26, '2021-09-18 11:46:55', '2021-09-18 11:46:55', 1, NULL, NULL, NULL, NULL, 'public/cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png', NULL, 'public/thumb_cy4k0swa4UfGEr9Zv3x0SAeAZVelLOG31vn94ASQ.png'),
(27, '2021-09-18 11:46:56', '2021-09-18 11:46:56', 1, NULL, NULL, NULL, NULL, 'public/khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png', NULL, 'public/thumb_khkWLMtHsGgN0z2JEba7qD7BuYPzmdegNMd1Zxjl.png'),
(28, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png', NULL, 'public/thumb_l9S2oGnT00rO2ITzF9e7GWZNPPGw9ziVZgx1ngeb.png'),
(29, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png', NULL, 'public/thumb_r9NubfRpUUEOqfmmPD3QwoMEBc1AwHQenxs3sJW0.png'),
(30, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png', NULL, 'public/thumb_kmQL2oTcuUnOZ1tC87d7Fo2pDnZQfMxlCeFTJFUR.png'),
(31, '2021-09-18 12:22:16', '2021-09-18 12:22:16', 1, NULL, NULL, NULL, NULL, 'public/oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png', NULL, 'public/thumb_oZKGft8wix9mHsN7Tmd3OIoCYBMrjZlv6IgLf1yM.png'),
(32, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png', NULL, 'public/thumb_yMFwGKCrRlBsAcHisUAbMJWzE45QS6jiyfeyM6em.png'),
(33, '2021-09-18 12:22:38', '2021-09-18 12:22:38', 1, NULL, NULL, NULL, NULL, 'public/reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png', NULL, 'public/thumb_reYG0O5DUYKXdD2NqiCbyTR0E12A5ezJN9EyGruu.png'),
(34, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png', NULL, 'public/thumb_RQLgkoaKZ3jXbBvFyHhm2c9r7udXQCu2yxiWMVe0.png'),
(35, '2021-09-18 12:22:39', '2021-09-18 12:22:39', 1, NULL, NULL, NULL, NULL, 'public/8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png', NULL, 'public/thumb_8HMiKmLVh0UQxGTKikIMd3fuFIwxvm2O1lSpa6WS.png'),
(36, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png', NULL, 'public/thumb_c817KrTtcQxt52rRgSkapKRxYRsiXutcxO8WQDsJ.png'),
(37, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png', NULL, 'public/thumb_8QK2VQFmzhn5UYFVdIFsfttxjGgDUAezG70PqWG1.png'),
(38, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png', NULL, 'public/thumb_EocRmDOgNeXOiMbxUP2AeACoJER2Rm1TBnxNw4u1.png'),
(39, '2021-09-18 12:23:20', '2021-09-18 12:23:20', 1, NULL, NULL, NULL, NULL, 'public/6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png', NULL, 'public/thumb_6W9jaVttNUh3XIvSW6lGLLAwQnDSL1O3ItgJ5DI0.png'),
(40, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png', NULL, 'public/thumb_Ww1HdM9pY2hxH2BVBKirgQlFSRUUyYjm77ZITGRv.png'),
(41, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png', NULL, 'public/thumb_buyPGy0x1Y2qejNDEPEOP70txqDZegk3OQEpfn4t.png'),
(42, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png', NULL, 'public/thumb_KoHri5TwnWjdRJ0e6P0Yl7wZRKArqyUOXt2BGI1Z.png'),
(43, '2021-09-18 12:24:43', '2021-09-18 12:24:43', 1, NULL, NULL, NULL, NULL, 'public/04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png', NULL, 'public/thumb_04mN7VwyyMKd7jk46RBMUfbzZO4OqiyO0asfG1Oh.png'),
(44, '2021-09-20 00:51:04', '2021-09-20 00:51:04', 1, NULL, NULL, NULL, NULL, 'public/3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png', NULL, 'public/thumb_3oziXAFWN6lQ0zOkN9y7AoDAMKu0Ki4y9mQ7soNb.png'),
(45, '2021-09-20 00:54:21', '2021-09-20 00:54:21', 1, NULL, NULL, NULL, NULL, 'public/3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png', NULL, 'public/thumb_3pBDpQK4MJsE8haVxQJOXyemTXl2SjSo67F7nJpt.png'),
(46, '2021-09-20 00:56:16', '2021-09-20 00:56:16', 1, NULL, NULL, NULL, NULL, 'public/GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png', NULL, 'public/thumb_GGbxgOxcjhF5HpxVEmSZhzDKwP0yN0KKddRbAlzt.png'),
(47, '2021-09-20 00:56:59', '2021-09-20 00:56:59', 1, NULL, NULL, NULL, NULL, 'public/4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png', NULL, 'public/thumb_4iHSG16IOqxN1nP1JPfh7zXRBplN4DRyKpQGaGQZ.png'),
(48, '2021-09-20 00:57:17', '2021-09-20 00:57:17', 1, NULL, NULL, NULL, NULL, 'public/C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png', NULL, 'public/thumb_C3CitkxRADTxd5nrKQhrfsgeMhBOyStEKW4kx9tn.png'),
(49, '2021-09-20 00:58:30', '2021-09-20 00:58:30', 1, NULL, NULL, NULL, NULL, 'public/oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png', NULL, 'public/thumb_oYVPXeRKGCmZWCwwfDQhXzpswABstgvSGNa7JTkG.png'),
(50, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png', NULL, 'public/thumb_XXUoVwPjpifkAqD9o2H4kfI9fi3cfbhTH9Gtnnp6.png'),
(51, '2021-09-21 16:53:31', '2021-09-21 16:53:31', 1, NULL, NULL, NULL, NULL, 'public/ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png', NULL, 'public/thumb_ju3prU7l73aYBPQf1NHZXFSZ3MazNgrEs67byPap.png'),
(52, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg', NULL, 'public/thumb_X3ReN7ebnBNTepANKsuggBBXBepb9f0DTfQRZ4ay.jpg'),
(53, '2021-09-25 05:28:47', '2021-09-25 05:28:47', 1, NULL, NULL, NULL, NULL, 'public/YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png', NULL, 'public/thumb_YnJMC3fHyFa8fJLsQSPlr6vglN2dxJY21L0QdWTP.png'),
(54, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg', NULL, 'public/thumb_rXJjZzCSyeDRDuLmlvTP5t8sofywsCPXqsfu7Sh3.jpg'),
(55, '2021-09-25 05:31:12', '2021-09-25 05:31:12', 1, NULL, NULL, NULL, NULL, 'public/dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png', NULL, 'public/thumb_dIgyd4LMsFP1viJJ50fEqelfN1CoAUj7RIsLzbWV.png'),
(56, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg', NULL, 'public/thumb_9w4QGG18IHqQVQYoouZhbEnTqxGyLFKYWI4o8NOT.jpg'),
(57, '2021-09-25 05:32:07', '2021-09-25 05:32:07', 1, NULL, NULL, NULL, NULL, 'public/mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png', NULL, 'public/thumb_mESlrH7suOqCQiyMZ1qLQKsyPq23mK09O2S92Ecf.png'),
(58, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg', NULL, 'public/thumb_s3bshfVHW2q06eGP6DF0UjOKp8m0gNOjoDeoTb8f.jpg'),
(59, '2021-09-25 05:32:38', '2021-09-25 05:32:38', 1, NULL, NULL, NULL, NULL, 'public/peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png', NULL, 'public/thumb_peyvC3eGvqKaFRh5fiwy0nFzkkes4Dcd8BNlVAIg.png'),
(60, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg', NULL, 'public/thumb_xvmmMep1TbkOkQrlSZcqa5k7hMhnHNPIVObvW1t7.jpg'),
(61, '2021-09-25 05:42:00', '2021-09-25 05:42:00', 1, NULL, NULL, NULL, NULL, 'public/FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png', NULL, 'public/thumb_FTkNLMT54AfMZgnh5DsFom884MS0EZDXuth4mqep.png'),
(62, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg', NULL, 'public/thumb_Qz0GVpbL1xTaHyh7O7WEsd3zF1cmbOQ0xWRO1EOL.jpg'),
(63, '2021-09-25 05:42:46', '2021-09-25 05:42:46', 1, NULL, NULL, NULL, NULL, 'public/ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png', NULL, 'public/thumb_ZKhdiCNJSSNKeE2oxeG8eZRZreuvep9WQNJYjLhT.png'),
(64, '2021-09-25 05:46:15', '2021-09-25 05:46:15', 1, NULL, NULL, NULL, NULL, 'public/hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg', NULL, 'public/thumb_hJCAUMc9PY0UtkISE6yKbsngRg07s4H8oDwi5nZx.jpg'),
(65, '2021-09-25 05:49:07', '2021-09-25 05:49:07', 1, NULL, NULL, NULL, NULL, 'public/zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg', NULL, 'public/thumb_zDzmG8wVcxDhMhV9KFuRvvNvTvD6zQswPqdaPIQI.jpg'),
(66, '2021-09-25 05:49:25', '2021-09-25 05:49:25', 1, NULL, NULL, NULL, NULL, 'public/ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg', NULL, 'public/thumb_ywppVSZgDi5ByJS8ksk3twaagSplzOZj9Nwhk6zj.jpg'),
(67, '2021-09-25 05:49:53', '2021-09-25 05:49:53', 1, NULL, NULL, NULL, NULL, 'public/hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg', NULL, 'public/thumb_hAXkhd3r0IZf4zIaiiQv0o067wfXncLTSbFNSxWe.jpg'),
(68, '2021-09-25 05:51:09', '2021-09-25 05:51:09', 1, NULL, NULL, NULL, NULL, 'public/6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg', NULL, 'public/thumb_6BBxxNO8SIBoljFBPlKVxAKW320za3nKgu7eb9PZ.jpg'),
(69, '2021-09-25 05:52:27', '2021-09-25 05:52:27', 1, NULL, NULL, NULL, NULL, 'public/owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg', NULL, 'public/thumb_owo6TT9idZ0rGLgIdO0YezpF1QL3Oxm7Bal7hFui.jpg'),
(70, '2021-09-27 07:07:52', '2021-09-27 07:07:52', 1, NULL, NULL, NULL, NULL, 'public/ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg', NULL, 'public/thumb_ld36auATg0mejq1hSIZFiohvWyjSjU7I1b3aftAU.jpg'),
(71, '2021-09-27 07:08:05', '2021-09-27 07:08:05', 1, NULL, NULL, NULL, NULL, 'public/B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg', NULL, 'public/thumb_B2kzOh4fT5xbOR9X7pY1m7L6TAOkWYWogVu1SsWR.jpg'),
(72, '2021-09-27 07:08:28', '2021-09-27 07:08:28', 1, NULL, NULL, NULL, NULL, 'public/j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg', NULL, 'public/thumb_j50VqfP0ORNODNpSKCp1gE4B3h7hDGbSS6DMJOgT.jpg'),
(73, '2021-09-27 07:08:37', '2021-09-27 07:08:37', 1, NULL, NULL, NULL, NULL, 'public/muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg', NULL, 'public/thumb_muOh8DsTN7N9PNeWpBtF0aKGYaVnuNGnBDOrDuWY.jpg'),
(74, '2021-09-27 07:09:13', '2021-09-27 07:09:13', 1, NULL, NULL, NULL, NULL, 'public/tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg', NULL, 'public/thumb_tL5Ut6HKnI6JvhYDng0BsQzmi7OBoFCxsBS76Xsw.jpg'),
(75, '2021-09-27 07:10:33', '2021-09-27 07:10:33', 1, NULL, NULL, NULL, NULL, 'public/U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg', NULL, 'public/thumb_U4GislZKRNPTrc7HusJO25gmYkYHldYkQnmqf9un.jpg'),
(76, '2021-09-27 07:11:08', '2021-09-27 07:11:08', 1, NULL, NULL, NULL, NULL, 'public/GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg', NULL, 'public/thumb_GDS9KfrsQLlersfsr7H5zdf5SubRjDPsLxk7kTEQ.jpg'),
(77, '2021-09-27 07:11:18', '2021-09-27 07:11:18', 1, NULL, NULL, NULL, NULL, 'public/1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg', NULL, 'public/thumb_1QhOMCBa9dori86Kwv0Qkhqe0hV1Y71aiZMJrqn0.jpg'),
(78, '2021-09-27 07:13:38', '2021-09-27 07:13:38', 1, NULL, NULL, NULL, NULL, 'public/CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg', NULL, 'public/thumb_CUwezVyzB8AJnc7xGaoYXIvbgARGTC0XWNcXBG4p.jpg'),
(79, '2021-09-27 07:14:23', '2021-09-27 07:14:23', 1, NULL, NULL, NULL, NULL, 'public/I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg', NULL, 'public/thumb_I1jpc3r9NoAWfn8OGZsebZNzbucL9Aufqv3V8S2J.jpg'),
(80, '2021-09-27 07:14:43', '2021-09-27 07:14:43', 1, NULL, NULL, NULL, NULL, 'public/buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg', NULL, 'public/thumb_buPeQAY7DI1ycJ6pYfPukfXtQTyGEomGYqEbRHg0.jpg'),
(81, '2021-09-27 07:17:29', '2021-09-27 07:17:29', 1, NULL, NULL, NULL, NULL, 'public/0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg', NULL, 'public/thumb_0pakZtRnkziyRSTEplfERBUmu3pe23LmTrbLjxoK.jpg'),
(82, '2021-09-27 07:18:00', '2021-09-27 07:18:00', 1, NULL, NULL, NULL, NULL, 'public/wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg', NULL, 'public/thumb_wEqwYW6ogcy1BebTC2PUcejXerRT6P9N3yWKDk7L.jpg'),
(83, '2021-09-27 07:18:34', '2021-09-27 07:18:34', 1, NULL, NULL, NULL, NULL, 'public/zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg', NULL, 'public/thumb_zvp7e77Sm2TU5MXAP8lZNvbz8wYmzPeQ4fm5KKQM.jpg'),
(84, '2021-09-27 07:19:19', '2021-09-27 07:19:19', 1, NULL, NULL, NULL, NULL, 'public/LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg', NULL, 'public/thumb_LTznCqoVY5fauWJHgISBRJJjY3XMs4N54zfoUl1S.jpg'),
(85, '2021-09-27 07:20:07', '2021-09-27 07:20:07', 1, NULL, NULL, NULL, NULL, 'public/Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg', NULL, 'public/thumb_Db3PZfIuOeOMjFc41AixbTe7lPEP6fIs1HAPeL5C.jpg'),
(86, '2021-09-27 07:20:51', '2021-09-27 07:20:51', 1, NULL, NULL, NULL, NULL, 'public/LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg', NULL, 'public/thumb_LY1c5URxBk7wN678NIptajs4wUtAcZLgKTld1qVB.jpg'),
(87, '2021-09-27 07:21:25', '2021-09-27 07:21:25', 1, NULL, NULL, NULL, NULL, 'public/4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg', NULL, 'public/thumb_4SlQgLVqpxKvtjSzwthQOAKcm4vkf1RuLiWDzBRw.jpg'),
(88, '2021-09-27 07:21:48', '2021-09-27 07:21:48', 1, NULL, NULL, NULL, NULL, 'public/tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg', NULL, 'public/thumb_tGb9q9zSrFlD6z8rxVh4NkVakbjmWFxOnMs45fDn.jpg'),
(89, '2021-09-27 07:22:12', '2021-09-27 07:22:12', 1, NULL, NULL, NULL, NULL, 'public/nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg', NULL, 'public/thumb_nKMfw6Da9dEeAoMhHyt3bx3lcnjsmid9do9Ccv5r.jpg'),
(90, '2021-09-27 07:22:44', '2021-09-27 07:22:44', 1, NULL, NULL, NULL, NULL, 'public/IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg', NULL, 'public/thumb_IUDqZ0HVcaOql01E25UdpsIj83h6PKfyBXHZk2iz.jpg'),
(91, '2021-09-27 07:23:21', '2021-09-27 07:23:21', 1, NULL, NULL, NULL, NULL, 'public/RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg', NULL, 'public/thumb_RPFOd2PhhHbVdcS7ikb4VEQSwCXp1ebG0xhMKyt7.jpg'),
(92, '2021-09-27 07:23:32', '2021-09-27 07:23:32', 1, NULL, NULL, NULL, NULL, 'public/uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg', NULL, 'public/thumb_uOPIsJLobuePhFhbH4BJ7GoyQM5EnbT290gH3CkH.jpg'),
(93, '2021-09-27 16:42:33', '2021-09-27 16:42:33', 1, NULL, NULL, NULL, NULL, 'public/E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg', NULL, 'public/thumb_E28l7a3vzAjA7uam1BJtrUTbN5e3VyPMzT5Zydkq.jpg'),
(94, '2021-09-27 16:47:22', '2021-09-27 16:47:22', 1, NULL, NULL, NULL, NULL, 'public/tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg', NULL, 'public/thumb_tjhCWvAuF1pQhwhkmqxJcMr7O8L9hLszz26UM7ze.jpg'),
(95, '2021-09-27 16:48:06', '2021-09-27 16:48:06', 1, NULL, NULL, NULL, NULL, 'public/yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg', NULL, 'public/thumb_yuVTxuBKFaHmFZN88sHILmYArxFRExrRkebmkl9d.jpg'),
(96, '2021-09-27 16:48:19', '2021-09-27 16:48:19', 1, NULL, NULL, NULL, NULL, 'public/uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg', NULL, 'public/thumb_uqwD0wj71fBG2oNsbiKh41UnIfh0yrw4jzJXOcRW.jpg'),
(97, '2021-09-27 16:50:46', '2021-09-27 16:50:46', 1, NULL, NULL, NULL, NULL, 'public/hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg', NULL, 'public/thumb_hqssxhKHSnmOPqIv8RrKTK8j80TER0kQq8dW6GI7.jpg'),
(98, '2021-09-27 16:51:31', '2021-09-27 16:51:31', 1, NULL, NULL, NULL, NULL, 'public/lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg', NULL, 'public/thumb_lYceYCTOMZpn3m7qbIFT6INmpkGQBZs78eJaQqzB.jpg'),
(99, '2021-09-27 17:00:03', '2021-09-27 17:00:03', 1, NULL, NULL, NULL, NULL, 'public/CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg', NULL, 'public/thumb_CxSUW0gpm2pWJZj1lbucNkgCpJcJHKj7YTsgCecr.jpg'),
(100, '2021-09-27 17:03:29', '2021-09-27 17:03:29', 1, NULL, NULL, NULL, NULL, 'public/WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg', NULL, 'public/thumb_WuLWDW0WwOMKNtqMcYjM8PxKYmclcxCSv0CFYrlV.jpg'),
(101, '2021-09-27 17:04:35', '2021-09-27 17:04:35', 1, NULL, NULL, NULL, NULL, 'public/gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg', NULL, 'public/thumb_gX3G4B3JAHbARghknoI8BgnpoYBzcIQNNjc2Zjft.jpg'),
(102, '2021-09-27 17:04:36', '2021-09-27 17:04:36', 1, NULL, NULL, NULL, NULL, 'public/AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg', NULL, 'public/thumb_AtFwLkeNkk8rtmL0H8270MKTgX7iF1RjGVA6jG3E.jpg'),
(103, '2021-10-02 19:10:31', '2021-10-02 19:10:31', 1, NULL, NULL, NULL, NULL, 'public/KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg', NULL, 'public/thumb_KoXIEdGL0rSYIcATgHpBMhOUkz38VBEkOhftdfJC.jpg'),
(104, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg', NULL, 'public/thumb_ycCtSvqYlLmEs2TY4foTKLxG7vfa2KJ6MTUKwijM.jpg'),
(105, '2021-10-02 19:16:53', '2021-10-02 19:16:53', 1, NULL, NULL, NULL, NULL, 'public/xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg', NULL, 'public/thumb_xdCG2VbeeMiBDCfSAjfjdD6EXgd7Fi7insYIHZVF.jpg'),
(106, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg', NULL, 'public/thumb_WNFHiCoemfngoPaV7LAgoc6jMjcDlBK7p9fUveA0.jpg'),
(107, '2021-10-02 19:18:45', '2021-10-02 19:18:45', 1, NULL, NULL, NULL, NULL, 'public/IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg', NULL, 'public/thumb_IIEZcl7lGNtzEMjc30tS7yKHj584wSiFd9QUfDps.jpg'),
(108, '2021-10-03 01:39:16', '2021-10-03 01:39:16', 1, NULL, NULL, NULL, NULL, 'public/Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg', NULL, 'public/thumb_Ev9j7eBVtROBe8yyPRhzA9dghmHAZs3JF24HRvwB.jpg'),
(109, '2021-10-03 04:13:20', '2021-10-03 04:13:20', 1, NULL, NULL, NULL, NULL, 'public/UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg', NULL, 'public/thumb_UdsQdNbJrKFBvAGThcZoYfIOn9mHAZBK9asEwSfX.jpg'),
(110, '2021-10-03 04:17:10', '2021-10-03 04:17:10', 1, NULL, NULL, NULL, NULL, 'public/orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg', NULL, 'public/thumb_orEsSpRA1Dnsbrnrn0DxbpuHa8BzuDXPVHd2NpCI.jpg'),
(111, '2021-10-03 04:34:39', '2021-10-03 04:34:39', 1, NULL, NULL, NULL, NULL, 'public/1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg', NULL, 'public/thumb_1W2yfIEwFUofN6hHXZywn4x86TLa2Uaad4c27xdA.jpg'),
(112, '2021-10-03 04:36:21', '2021-10-03 04:36:21', 1, NULL, NULL, NULL, NULL, 'public/FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg', NULL, 'public/thumb_FeHlg3011u9JSf9ORpIV37LCDP12nVZ8eOXAv5Br.jpg'),
(113, '2021-10-03 04:44:55', '2021-10-03 04:44:55', 1, NULL, NULL, NULL, NULL, 'public/lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg', NULL, 'public/thumb_lqE6hKLhc2al8oVfVqDcCKTWXgqJD1I7Wn4CNMbk.jpg'),
(114, '2021-10-03 04:49:01', '2021-10-03 04:49:01', 1, NULL, NULL, NULL, NULL, 'public/rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg', NULL, 'public/thumb_rO81oJc0KtOnSxTt7fzESZg7tMBwPwAmQDkkysW8.jpg'),
(115, '2021-10-05 06:28:48', '2021-10-05 06:28:48', 3, NULL, NULL, NULL, NULL, 'public/UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg', NULL, 'public/thumb_UZ1ViUC6zJjHQ7dMcCSnzHv0W7YGjK6W4RcxhN9y.jpg'),
(116, '2021-10-05 06:28:49', '2021-10-05 06:28:49', 3, NULL, NULL, NULL, NULL, 'public/xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png', NULL, 'public/thumb_xew3iJYzRk8JUQET6A35MYlFfdZsPxN751MUADFr.png'),
(117, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg', NULL, 'public/thumb_WXjhSyifSfK1GkViPFdvONr2pKGbkeXSilH4SDWq.jpg'),
(118, '2021-10-05 06:34:29', '2021-10-05 06:34:29', 3, NULL, NULL, NULL, NULL, 'public/t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png', NULL, 'public/thumb_t5QVdLAcyiZknx1qzCT09RKyGu5tiEiCpHpejzEi.png'),
(119, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg', NULL, 'public/thumb_DvOwJS2CWnrvyQgYjgZ8xqKgYZhlpK6THiPfpxdI.jpg'),
(120, '2021-10-05 06:35:53', '2021-10-05 06:35:53', 3, NULL, NULL, NULL, NULL, 'public/XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png', NULL, 'public/thumb_XMuIvMbt4klKzPE8KcAi72T7UxfXkTkUW58GZsGZ.png'),
(121, '2021-10-05 06:39:30', '2021-10-05 06:39:30', 3, NULL, NULL, NULL, NULL, 'public/fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg', NULL, 'public/thumb_fuMlVlP2Xy26k0PB3LBYGPoJmQGbyDniZU7rmd2B.jpg'),
(122, '2021-10-05 06:39:31', '2021-10-05 06:39:31', 3, NULL, NULL, NULL, NULL, 'public/i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png', NULL, 'public/thumb_i4SyIbVYgOykndqfrPRGFKLGwlg7CGqst4Gp2jDm.png'),
(123, '2021-10-05 06:41:01', '2021-10-05 06:41:01', 3, NULL, NULL, NULL, NULL, 'public/bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg', NULL, 'public/thumb_bqweMJi2pZs0szGoPXbszuujgsrkjWMVoZPx64Ba.jpg'),
(124, '2021-10-05 06:41:02', '2021-10-05 06:41:02', 3, NULL, NULL, NULL, NULL, 'public/WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png', NULL, 'public/thumb_WrxZJd6FRaZGR0t58utOSmk29bGuIkd8c1YyMSHk.png'),
(125, '2021-10-05 09:25:17', '2021-10-05 09:25:17', 3, NULL, NULL, NULL, NULL, 'public/7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg', NULL, 'public/thumb_7xytFFjUv66Li3sJVVUPsTiKIz3q5qTOCh9eO7Sw.jpg'),
(126, '2021-10-08 09:58:06', '2021-10-08 09:58:06', 1, NULL, NULL, NULL, NULL, 'public/u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png', NULL, 'public/thumb_u5CEoujxGbiIW571W3KkEBeqiKK3rFAjWvM4K0PZ.png'),
(127, '2021-10-08 09:58:07', '2021-10-08 09:58:07', 1, NULL, NULL, NULL, NULL, 'public/c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png', NULL, 'public/thumb_c3hSY3a6K0UuOhxPaMhv3pgkNee99FscbX6jqk3o.png'),
(128, '2021-10-09 04:02:42', '2021-10-09 04:02:42', 4, NULL, NULL, NULL, NULL, 'public/8kttt8c3H0WOJ1ITq8gZqetdxGDNU24zuoi4fCxB.jpg', NULL, 'public/8kttt8c3H0WOJ1ITq8gZqetdxGDNU24zuoi4fCxB.jpg'),
(129, '2021-10-09 04:02:42', '2021-10-09 04:02:42', 4, NULL, NULL, NULL, NULL, 'public/u9s5Qne4SUlLe0r2uTWJ4f09HQM1tzI98vpNtVYC.jpg', NULL, 'public/u9s5Qne4SUlLe0r2uTWJ4f09HQM1tzI98vpNtVYC.jpg'),
(130, '2021-10-09 07:35:24', '2021-10-09 07:35:24', 4, NULL, NULL, NULL, NULL, 'public/BzOd4tlCv5ICkPbLzGuKnxO7GPvuJAYq9SQERf2k.jpg', NULL, 'public/BzOd4tlCv5ICkPbLzGuKnxO7GPvuJAYq9SQERf2k.jpg'),
(131, '2021-10-09 07:37:18', '2021-10-09 07:37:18', 4, NULL, NULL, NULL, NULL, 'public/phgmqFncHz5Sa3oGMPzkNXRaCxPVEc16wuekaSET.jpg', NULL, 'public/phgmqFncHz5Sa3oGMPzkNXRaCxPVEc16wuekaSET.jpg'),
(132, '2021-10-09 07:39:44', '2021-10-09 07:39:44', 4, NULL, NULL, NULL, NULL, 'public/5ElBJsgR1OszyajIJWChnZUJJ0B6Ef70lUG26qVT.jpg', NULL, 'public/5ElBJsgR1OszyajIJWChnZUJJ0B6Ef70lUG26qVT.jpg'),
(133, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/1fDV6hijmmENEYBRntG0i9MJy2ZCe2Ehwo4fBKxg.jpg', NULL, 'public/thumb_1fDV6hijmmENEYBRntG0i9MJy2ZCe2Ehwo4fBKxg.jpg'),
(134, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/o14VFgXuVXyW16nSCRuHEFOMI4ipQdwop3FWASr4.jpg', NULL, 'public/thumb_o14VFgXuVXyW16nSCRuHEFOMI4ipQdwop3FWASr4.jpg'),
(135, '2021-10-09 10:06:20', '2021-10-09 10:06:20', 4, NULL, NULL, NULL, NULL, 'public/SdCdLjU6plkhEjeFzsjoDPJp8Wpzn6oioD586onc.jpg', NULL, 'public/thumb_SdCdLjU6plkhEjeFzsjoDPJp8Wpzn6oioD586onc.jpg'),
(136, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/ZyhVsPiNqZDpyvheuttrqUZcz5e4PBz37kjAma6n.jpg', NULL, 'public/thumb_ZyhVsPiNqZDpyvheuttrqUZcz5e4PBz37kjAma6n.jpg'),
(137, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/uCtEsBeQlISb2WG89QY5vXy13DO5CE0jM9XUZ389.jpg', NULL, 'public/thumb_uCtEsBeQlISb2WG89QY5vXy13DO5CE0jM9XUZ389.jpg'),
(138, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/tRue2CPErfvVxqwDoZku6X7WIIRCgZWopIUT56Bu.jpg', NULL, 'public/thumb_tRue2CPErfvVxqwDoZku6X7WIIRCgZWopIUT56Bu.jpg'),
(139, '2021-10-09 10:12:50', '2021-10-09 10:12:50', 4, NULL, NULL, NULL, NULL, 'public/NfZr0nDedireIHBiubYWtqmRpb2Yr4APZdVDaltJ.jpg', NULL, 'public/thumb_NfZr0nDedireIHBiubYWtqmRpb2Yr4APZdVDaltJ.jpg'),
(140, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/UdxxR4BZuAsEUHUp6KDou2ARCOkAYeQqsnmtVJFE.jpg', NULL, 'public/thumb_UdxxR4BZuAsEUHUp6KDou2ARCOkAYeQqsnmtVJFE.jpg'),
(141, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/qPzsS4lsvz0NxrBdq2ekbFc2rJ4TTl54VoNsxgUA.jpg', NULL, 'public/thumb_qPzsS4lsvz0NxrBdq2ekbFc2rJ4TTl54VoNsxgUA.jpg'),
(142, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/PQn0bJwWioRhVCXClhxlDpTrXp8xCEney2spliK5.jpg', NULL, 'public/thumb_PQn0bJwWioRhVCXClhxlDpTrXp8xCEney2spliK5.jpg'),
(143, '2021-10-09 10:15:23', '2021-10-09 10:15:23', 4, NULL, NULL, NULL, NULL, 'public/Rg9GWv91Pizy1FLhEjo5Qi5cJxqzqJXgw5iXlhHn.jpg', NULL, 'public/thumb_Rg9GWv91Pizy1FLhEjo5Qi5cJxqzqJXgw5iXlhHn.jpg'),
(144, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/4WafErFFfVDMjjC4llJACNzaPQdkGzGm5CzDWgy1.jpg', NULL, 'public/thumb_4WafErFFfVDMjjC4llJACNzaPQdkGzGm5CzDWgy1.jpg'),
(145, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/dKBfXBVPfJ2DVlFyl3eqxpYLz2tql9B30OIXfywC.jpg', NULL, 'public/thumb_dKBfXBVPfJ2DVlFyl3eqxpYLz2tql9B30OIXfywC.jpg'),
(146, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/ow528ydntjYNosIbrEbk6kyJ0sTMRTeSVWwBP3Q4.jpg', NULL, 'public/thumb_ow528ydntjYNosIbrEbk6kyJ0sTMRTeSVWwBP3Q4.jpg'),
(147, '2021-10-09 10:20:01', '2021-10-09 10:20:01', 4, NULL, NULL, NULL, NULL, 'public/XMtZSkBRtyvHL8H9qSBUHtpB5YNjgLgIs7DpeOs8.jpg', NULL, 'public/thumb_XMtZSkBRtyvHL8H9qSBUHtpB5YNjgLgIs7DpeOs8.jpg'),
(148, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/ArEHjiO7pbqFzoHfVJz5F3BKNGDO1eqB8UcJmzM4.jpg', NULL, 'public/thumb_ArEHjiO7pbqFzoHfVJz5F3BKNGDO1eqB8UcJmzM4.jpg'),
(149, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/ObEVfYdFNqlap9RKSLD7q67fna1QeYA4D2aMPqKB.jpg', NULL, 'public/thumb_ObEVfYdFNqlap9RKSLD7q67fna1QeYA4D2aMPqKB.jpg'),
(150, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/QVhLV62DBq9FRjsEqYRMAFQQRITq0gNktoXs3eoT.jpg', NULL, 'public/thumb_QVhLV62DBq9FRjsEqYRMAFQQRITq0gNktoXs3eoT.jpg'),
(151, '2021-10-09 10:20:42', '2021-10-09 10:20:42', 4, NULL, NULL, NULL, NULL, 'public/N52nBByCqfZWpPazawDYaEElRsFESX0pvCNpLcoR.jpg', NULL, 'public/thumb_N52nBByCqfZWpPazawDYaEElRsFESX0pvCNpLcoR.jpg'),
(152, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/HsSyk3nfXMm6VvZHyxcTi1x3bOamBeUXYlmcxvMU.jpg', NULL, 'public/thumb_HsSyk3nfXMm6VvZHyxcTi1x3bOamBeUXYlmcxvMU.jpg'),
(153, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/YnrIssXb7mBsgrO4doL3UgHXuf1zuyB8L8vUevRR.jpg', NULL, 'public/thumb_YnrIssXb7mBsgrO4doL3UgHXuf1zuyB8L8vUevRR.jpg'),
(154, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/vtBCvERRVjByVe5fX3uHBSbtRLZjHbmt27DMB2Ym.jpg', NULL, 'public/thumb_vtBCvERRVjByVe5fX3uHBSbtRLZjHbmt27DMB2Ym.jpg'),
(155, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/5caSg5dqo1dBCOcme12l4P4ZcFtpqX8wGjmrcDNY.jpg', NULL, 'public/thumb_5caSg5dqo1dBCOcme12l4P4ZcFtpqX8wGjmrcDNY.jpg'),
(156, '2021-10-09 10:25:23', '2021-10-09 10:25:23', 4, NULL, NULL, NULL, NULL, 'public/wRoIBN2QfTMBCdhdO39f7bm2yd1ioOyxxBGAB4pp.jpg', NULL, 'public/thumb_wRoIBN2QfTMBCdhdO39f7bm2yd1ioOyxxBGAB4pp.jpg'),
(157, '2021-10-09 10:29:42', '2021-10-09 10:29:42', 4, NULL, NULL, NULL, NULL, 'public/d72FimnAleL5EznUhaYCblFJXyPFpCl9DVyWfUEE.jpg', NULL, 'public/thumb_d72FimnAleL5EznUhaYCblFJXyPFpCl9DVyWfUEE.jpg'),
(158, '2021-10-09 10:31:40', '2021-10-09 10:31:40', 4, NULL, NULL, NULL, NULL, 'public/WQpTxoq2XmItywP0YCi9R5wvS36csA4hK4R2zben.jpg', NULL, 'public/thumb_WQpTxoq2XmItywP0YCi9R5wvS36csA4hK4R2zben.jpg'),
(159, '2021-10-12 00:29:54', '2021-10-12 00:29:54', 1, NULL, NULL, NULL, NULL, 'public/MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg', NULL, 'public/thumb_MSfR233HSI6T0pJpN3oWZcq9uJAdoddvaRzcTPc9.jpg'),
(160, '2021-10-12 00:29:54', '2021-10-12 00:29:54', 1, NULL, NULL, NULL, NULL, 'public/RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg', NULL, 'public/thumb_RS3yxg8eUUVpe5bOk6SipfXjE27NCfpAxdMmIove.jpg'),
(161, '2021-10-12 00:41:47', '2021-10-12 00:41:47', 7, NULL, NULL, NULL, NULL, 'public/DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg', NULL, 'public/thumb_DtF0R95cJY5ElTAbuEv4A9y43uLPkYxBAtb39qUu.jpg'),
(162, '2021-10-12 00:41:47', '2021-10-12 00:41:47', 7, NULL, NULL, NULL, NULL, 'public/ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg', NULL, 'public/thumb_ZRhJUBTNEfh5mGkI1vX5L0GeUA4BiFkGZpRrMSUy.jpg'),
(163, '2021-10-12 04:21:53', '2021-10-12 04:21:53', 7, NULL, NULL, NULL, NULL, 'public/TSqSnwKHbbdRLHU9Yxtq9B65ttzR4PHvPN6OBic2.jpg', NULL, 'public/thumb_TSqSnwKHbbdRLHU9Yxtq9B65ttzR4PHvPN6OBic2.jpg'),
(164, '2021-10-12 04:21:53', '2021-10-12 04:21:53', 7, NULL, NULL, NULL, NULL, 'public/I53tP9P405R7R5U5B4Wn4uOj5mNGyHfzj7y68NZi.jpg', NULL, 'public/thumb_I53tP9P405R7R5U5B4Wn4uOj5mNGyHfzj7y68NZi.jpg'),
(165, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/oYZb6ZjpqdF6oBoreVJ3TKXhmtbaBsTwIB0s1rqz.jpg', NULL, 'public/thumb_oYZb6ZjpqdF6oBoreVJ3TKXhmtbaBsTwIB0s1rqz.jpg'),
(166, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/75Xai7X4pGbaXSplCyNO5Tk99AjZAicnfFxIyJJa.jpg', NULL, 'public/thumb_75Xai7X4pGbaXSplCyNO5Tk99AjZAicnfFxIyJJa.jpg'),
(167, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/KE5Fy2XjNpYiFim4xxiMCXY9HA7huGr0quSA2mfl.jpg', NULL, 'public/thumb_KE5Fy2XjNpYiFim4xxiMCXY9HA7huGr0quSA2mfl.jpg'),
(168, '2021-10-12 04:21:54', '2021-10-12 04:21:54', 7, NULL, NULL, NULL, NULL, 'public/auzfiQ8NENZmOHIC6PXec0CF1AUf2QKVWqFw1a6W.jpg', NULL, 'public/thumb_auzfiQ8NENZmOHIC6PXec0CF1AUf2QKVWqFw1a6W.jpg'),
(169, '2021-10-12 09:11:51', '2021-10-12 09:11:51', 7, NULL, NULL, NULL, NULL, 'public/SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png', NULL, 'public/thumb_SvkVBd5MhiX8WQvzVRUyrxiOo5SJyZTYEutz0Xdj.png'),
(170, '2021-10-12 09:11:52', '2021-10-12 09:11:52', 7, NULL, NULL, NULL, NULL, 'public/gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp', NULL, 'public/thumb_gU1MFgyD5nwuESpHAwhDJme96EuxABy3Ad0yvV9O.webp'),
(171, '2021-10-13 11:15:14', '2021-10-13 11:15:14', 7, NULL, NULL, NULL, NULL, 'Ger4vsSBwHvkOP0Ies4Y9B8g2sJh2fQHz98FWwpW.jpg', NULL, 'Ger4vsSBwHvkOP0Ies4Y9B8g2sJh2fQHz98FWwpW.jpg'),
(172, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, '5X4XlDxjzTvdB02pgsUBHEpBEpp3McJemLAbfsgT.jpg', NULL, '5X4XlDxjzTvdB02pgsUBHEpBEpp3McJemLAbfsgT.jpg'),
(173, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, 'ekO2huBrwNKSeySJ7Q0h92WVtD4rb0FTGjXCimCd.jpg', NULL, 'ekO2huBrwNKSeySJ7Q0h92WVtD4rb0FTGjXCimCd.jpg'),
(174, '2021-10-14 14:16:24', '2021-10-14 14:16:24', 7, NULL, NULL, NULL, NULL, 'Oe0ot9L3U7WmgQwsrDzKCkmWLGe0VHnrczJnpHAA.jpg', NULL, 'Oe0ot9L3U7WmgQwsrDzKCkmWLGe0VHnrczJnpHAA.jpg'),
(175, '2021-10-14 15:01:58', '2021-10-14 15:01:58', 7, NULL, NULL, NULL, NULL, 'La4K5i2rnySnb1dp2gQZwLtIHaXRuv57buwa8EIz.jpg', NULL, 'thumb_La4K5i2rnySnb1dp2gQZwLtIHaXRuv57buwa8EIz.jpg'),
(176, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'hANw7RVEOocoiiQNZe2ttT3d0rTkWGuxk2PvPSDz.jpg', NULL, 'thumb_hANw7RVEOocoiiQNZe2ttT3d0rTkWGuxk2PvPSDz.jpg'),
(177, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'eOuBBzNOfvqI7F6VfrZ5kGChDNeK5JSEi4te02FX.jpg', NULL, 'thumb_eOuBBzNOfvqI7F6VfrZ5kGChDNeK5JSEi4te02FX.jpg'),
(178, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'O75AMuFj3DJ7eWvkFstfkOMQE5Jne9sfpajaJ08g.jpg', NULL, 'thumb_O75AMuFj3DJ7eWvkFstfkOMQE5Jne9sfpajaJ08g.jpg'),
(179, '2021-10-14 15:31:48', '2021-10-14 15:31:48', 7, NULL, NULL, NULL, NULL, 'uId0fvmi41CBQVIO0hrYBnyBV9stOVNimXmXuAKY.jpg', NULL, 'thumb_uId0fvmi41CBQVIO0hrYBnyBV9stOVNimXmXuAKY.jpg'),
(180, '2021-10-15 03:19:55', '2021-10-15 03:19:55', 7, NULL, NULL, NULL, NULL, 'vXIutIMJDgw7Kn6FknEeB9tI5lAwUnE0QC1c0jUh.jpg', NULL, 'thumb_vXIutIMJDgw7Kn6FknEeB9tI5lAwUnE0QC1c0jUh.jpg'),
(181, '2021-10-15 03:32:02', '2021-10-15 03:32:02', 7, NULL, NULL, NULL, NULL, '3BKqoOlWJrxJKwiyWDQbNob7cVEKJaz1L0VpXgK9.jpg', NULL, 'thumb_3BKqoOlWJrxJKwiyWDQbNob7cVEKJaz1L0VpXgK9.jpg'),
(182, '2021-10-16 05:10:24', '2021-10-16 05:10:24', 8, NULL, NULL, NULL, NULL, 'vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png', NULL, 'thumb_vDsosTKY2OtGTraUMPRH2kw1OB55ueEU5xGKVrYE.png'),
(183, '2021-10-16 05:10:24', '2021-10-16 05:10:24', 8, NULL, NULL, NULL, NULL, 'ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png', NULL, 'thumb_ys1SjJCGFphEdLIBvYgygQEskcZQzzv42qekFqln.png'),
(184, '2021-10-16 05:14:32', '2021-10-16 05:14:32', 8, NULL, NULL, NULL, NULL, 'bATS3dE1p3uKpY5AP64nrq5swhTOJ58OFjoasB8S.jpg', NULL, 'thumb_bATS3dE1p3uKpY5AP64nrq5swhTOJ58OFjoasB8S.jpg'),
(185, '2021-10-16 05:14:32', '2021-10-16 05:14:32', 8, NULL, NULL, NULL, NULL, 'IkZfVexGADyK5du9dPGxQuV4pZzNyrLKZe97Jqod.jpg', NULL, 'thumb_IkZfVexGADyK5du9dPGxQuV4pZzNyrLKZe97Jqod.jpg'),
(186, '2021-10-16 05:14:33', '2021-10-16 05:14:33', 8, NULL, NULL, NULL, NULL, 'm2JED1Aa5x31NmPBzF9yrwlj1YxDHnxcB861K3pD.jpg', NULL, 'thumb_m2JED1Aa5x31NmPBzF9yrwlj1YxDHnxcB861K3pD.jpg'),
(187, '2021-10-16 05:14:33', '2021-10-16 05:14:33', 8, NULL, NULL, NULL, NULL, 'Yh8mmeN8fa8mb8ozyt0DtqxDg4As8TEe1i8VXZlx.jpg', NULL, 'thumb_Yh8mmeN8fa8mb8ozyt0DtqxDg4As8TEe1i8VXZlx.jpg'),
(188, '2021-10-17 16:40:24', '2021-10-17 16:40:24', 7, NULL, NULL, NULL, NULL, 'QNbjfWYDGJIL2QMNW2C99G38DZQzUeTE3KKIw7vr.jpg', NULL, 'thumb_QNbjfWYDGJIL2QMNW2C99G38DZQzUeTE3KKIw7vr.jpg'),
(189, '2021-10-24 02:50:52', '2021-10-24 02:50:52', 9, NULL, NULL, NULL, NULL, 'URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg', NULL, 'thumb_URyM5N3sifOxu0oBMsTeKfoNLUTl5Dn0uuBoxXwH.jpg'),
(190, '2021-10-24 02:50:53', '2021-10-24 02:50:53', 9, NULL, NULL, NULL, NULL, 'RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg', NULL, 'thumb_RP0lKHgfTd580Mq4rkGLReKyrEOkqUmLSrgD2JhW.jpg'),
(191, '2021-10-24 02:52:27', '2021-10-24 02:52:27', 9, NULL, NULL, NULL, NULL, 'DK1fYT4k3m9OF23u3v8vaH1rxH3vhE4MdDz5G6iw.png', NULL, 'thumb_DK1fYT4k3m9OF23u3v8vaH1rxH3vhE4MdDz5G6iw.png'),
(192, '2021-10-24 03:00:50', '2021-10-24 03:00:50', 9, NULL, NULL, NULL, NULL, 'APCOF8v6zKdbp9bvgeQeKIyFHEcQp9I3EWRoV898.png', NULL, 'thumb_APCOF8v6zKdbp9bvgeQeKIyFHEcQp9I3EWRoV898.png'),
(193, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg', NULL, 'thumb_sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg'),
(194, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg', NULL, 'thumb_VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg'),
(195, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg', NULL, 'thumb_wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg'),
(196, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg', NULL, 'thumb_EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg'),
(197, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg', NULL, 'thumb_JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg'),
(198, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, 'imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg', NULL, 'thumb_imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg'),
(199, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 9, NULL, NULL, NULL, NULL, '72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg', NULL, 'thumb_72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg'),
(200, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg', NULL, 'thumb_osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg'),
(201, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg', NULL, 'thumb_y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg'),
(202, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'm87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg', NULL, 'thumb_m87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg'),
(203, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg', NULL, 'thumb_abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg'),
(204, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg', NULL, 'thumb_inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg'),
(205, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, '3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg', NULL, 'thumb_3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg'),
(206, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg', NULL, 'thumb_EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg'),
(207, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 9, NULL, NULL, NULL, NULL, 'CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg', NULL, 'thumb_CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg'),
(208, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg', NULL, 'thumb_hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg'),
(209, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg', NULL, 'thumb_WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg'),
(210, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg', NULL, 'thumb_EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg'),
(211, '2021-10-24 06:05:31', '2021-10-24 06:05:31', 9, NULL, NULL, NULL, NULL, 'N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg', NULL, 'thumb_N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg'),
(212, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg', NULL, 'thumb_Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg'),
(213, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg', NULL, 'thumb_RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg'),
(214, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 9, NULL, NULL, NULL, NULL, 'CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg', NULL, 'thumb_CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg'),
(215, '2021-11-04 14:56:59', '2021-11-04 14:56:59', 11, NULL, NULL, NULL, NULL, 'tjYYdzXRuBBtwu9geB6gd30kAUUdcVePwmzVltwa.png', NULL, 'thumb_tjYYdzXRuBBtwu9geB6gd30kAUUdcVePwmzVltwa.png'),
(216, '2021-11-04 14:56:59', '2021-11-04 14:56:59', 11, NULL, NULL, NULL, NULL, 'XZyBp6pm0qdXbBZmeGqHKphN3zx4FsxPxyO6UbfV.png', NULL, 'thumb_XZyBp6pm0qdXbBZmeGqHKphN3zx4FsxPxyO6UbfV.png'),
(217, '2021-11-04 14:58:28', '2021-11-04 14:58:28', 11, NULL, NULL, NULL, NULL, 'a8s70VQbsecXIJswRGWG0I0CVPrv6KjOn2UMMCu0.png', NULL, 'thumb_a8s70VQbsecXIJswRGWG0I0CVPrv6KjOn2UMMCu0.png'),
(218, '2021-11-04 14:58:28', '2021-11-04 14:58:28', 11, NULL, NULL, NULL, NULL, 'uBIvMH4TKA1uBiBsI04E6LcbEtfhaJQ2NsXD2an4.png', NULL, 'thumb_uBIvMH4TKA1uBiBsI04E6LcbEtfhaJQ2NsXD2an4.png'),
(219, '2021-11-04 14:59:00', '2021-11-04 14:59:00', 11, NULL, NULL, NULL, NULL, 'UTinGLEiVi74ArYAUPJVgzw2gLxJKyZZLxL1bJBc.png', NULL, 'thumb_UTinGLEiVi74ArYAUPJVgzw2gLxJKyZZLxL1bJBc.png'),
(220, '2021-11-04 14:59:00', '2021-11-04 14:59:00', 11, NULL, NULL, NULL, NULL, 'lOdnJv20SkbYlXCXri8lxM1iuxcRCaC5K46wMI7t.png', NULL, 'thumb_lOdnJv20SkbYlXCXri8lxM1iuxcRCaC5K46wMI7t.png'),
(221, '2021-11-05 09:31:54', '2021-11-05 09:31:54', 12, NULL, NULL, NULL, NULL, 'bytjx4r5b6sezWMDQiRf5UpX5dDPHdD7YxaVEJ1V.jpg', NULL, 'thumb_bytjx4r5b6sezWMDQiRf5UpX5dDPHdD7YxaVEJ1V.jpg'),
(222, '2021-11-05 09:31:54', '2021-11-05 09:31:54', 12, NULL, NULL, NULL, NULL, 'Mg9pGEvj2BaA6WqTJxIypGdfYXMzzGShQ5EKuM97.jpg', NULL, 'thumb_Mg9pGEvj2BaA6WqTJxIypGdfYXMzzGShQ5EKuM97.jpg'),
(223, '2021-11-05 09:31:56', '2021-11-05 09:31:56', 12, NULL, NULL, NULL, NULL, '7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg', NULL, 'thumb_7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg'),
(224, '2021-11-05 09:31:56', '2021-11-05 09:31:56', 12, NULL, NULL, NULL, NULL, 'AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg', NULL, 'thumb_AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg'),
(225, '2021-11-05 20:53:09', '2021-11-05 20:53:09', 12, NULL, NULL, NULL, NULL, 'TbjKdfR52L3VxxMXcWmGpNmd8Xbc4uACLpL8CNk7.html', NULL, 'TbjKdfR52L3VxxMXcWmGpNmd8Xbc4uACLpL8CNk7.html'),
(226, '2021-11-05 20:53:09', '2021-11-05 20:53:09', 12, NULL, NULL, NULL, NULL, 'dERVYUhk7Rix3bfySGxk7yNmxSlJHahpVLIqomXG.html', NULL, 'dERVYUhk7Rix3bfySGxk7yNmxSlJHahpVLIqomXG.html'),
(227, '2021-11-05 20:53:10', '2021-11-05 20:53:10', 12, NULL, NULL, NULL, NULL, 'omGiCsPQMIuiAfv2X3QlV6gronXRUE5JxaafA8HL.jpg', NULL, 'thumb_omGiCsPQMIuiAfv2X3QlV6gronXRUE5JxaafA8HL.jpg'),
(228, '2021-11-05 20:53:12', '2021-11-05 20:53:12', 12, NULL, NULL, NULL, NULL, 'n6mrboxZTrRhO3CvrFTJywioXfKVmnl0KeHAcQFk.jpg', NULL, 'thumb_n6mrboxZTrRhO3CvrFTJywioXfKVmnl0KeHAcQFk.jpg'),
(229, '2021-11-05 20:54:06', '2021-11-05 20:54:06', 12, NULL, NULL, NULL, NULL, 'XRzJdG6hG8ibArNZD2NNBEyoANq23HwFztZOdgtR.html', NULL, 'XRzJdG6hG8ibArNZD2NNBEyoANq23HwFztZOdgtR.html'),
(230, '2021-11-05 20:54:06', '2021-11-05 20:54:06', 12, NULL, NULL, NULL, NULL, 'rudgcHcSeAduanVIwJn9B4Kcdip0wBnhbPdiN9Ay.html', NULL, 'rudgcHcSeAduanVIwJn9B4Kcdip0wBnhbPdiN9Ay.html'),
(231, '2021-11-05 20:54:07', '2021-11-05 20:54:07', 12, NULL, NULL, NULL, NULL, '1BMWoRbaQhq2MVKJaL3U5uzhOvgbLCCXXCX6PEhN.jpg', NULL, 'thumb_1BMWoRbaQhq2MVKJaL3U5uzhOvgbLCCXXCX6PEhN.jpg'),
(232, '2021-11-05 20:54:10', '2021-11-05 20:54:10', 12, NULL, NULL, NULL, NULL, 'Xd7whw5PaqmxjK6eY1Q1OAk6d67LM7sOegs7nR88.jpg', NULL, 'thumb_Xd7whw5PaqmxjK6eY1Q1OAk6d67LM7sOegs7nR88.jpg'),
(233, '2021-11-05 20:55:05', '2021-11-05 20:55:05', 12, NULL, NULL, NULL, NULL, 'DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html', NULL, 'DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html'),
(234, '2021-11-05 20:55:05', '2021-11-05 20:55:05', 12, NULL, NULL, NULL, NULL, 'UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html', NULL, 'UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html'),
(235, '2021-11-05 20:55:06', '2021-11-05 20:55:06', 12, NULL, NULL, NULL, NULL, 'h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg', NULL, 'thumb_h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg'),
(236, '2021-11-05 20:55:07', '2021-11-05 20:55:07', 12, NULL, NULL, NULL, NULL, 'RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg', NULL, 'thumb_RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_09_05_180305_create_categories_table', 1),
(7, '2021_09_05_180411_create_attributes_table', 1),
(10, '2021_09_18_100139_create_images_table', 2),
(11, '2021_09_15_220048_create_profiles_table', 3),
(13, '2021_09_23_092138_create_cities_table', 5),
(15, '2021_09_23_091308_create_countries_table', 6),
(18, '2021_09_05_211930_create_products_table', 7),
(19, '2021_10_11_095912_create_product_reviews_table', 8),
(21, '2021_10_16_021622_create_chats_table', 10);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `thumbnail` text COLLATE utf8mb4_unicode_ci,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `sub_category_id` int(11) DEFAULT NULL,
  `fixed_price` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `category_id`, `user_id`, `country_id`, `city_id`, `price`, `slug`, `status`, `description`, `quantity`, `images`, `thumbnail`, `attributes`, `sub_category_id`, `fixed_price`) VALUES
(3, '2021-10-24 05:54:15', '2021-10-24 05:54:15', 'Mitsubishi Outlandar Red 2010\r\n', 8, 9, 1, 1, '12000000', '12000000', '0', 'Description\r\n## Mitsubishi Outlander \r\n\r\n    👉Model: 2010\r\n\r\n    👉Registration: 2015\r\n\r\n    👉Cc: 2000\r\n\r\n    👉Color: Red\r\n\r\n    👉Mileage: 72000\r\n\r\n    👉Octane driven.\r\n\r\n    👉Original Colour with new paint\r\n\r\n    👉Original Tv Navigation, Back Camera.\r\n\r\n    👉-Ice Cool AC..\r\n\r\n    👉excellent Interior\r\n\r\n    👉-7 seated..\r\n\r\n    👉Full fresh exterior and interior condition..\r\n\r\n    👉All Documents are up to date till 2022..\r\n\r\n    ** No accident History\r\n\r\n    ## As like as show room condition\r\n\r\n    👉👉For more details please contact me 📞📞📞', NULL, '[{\"src\":\"sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg\",\"thumbnail\":\"thumb_sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg\",\"user_id\":9},{\"src\":\"VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg\",\"thumbnail\":\"thumb_VCdBtLSOceW2JSnkB3dHgpIXsdBmbj4jN7Bar5wW.jpg\",\"user_id\":9},{\"src\":\"wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg\",\"thumbnail\":\"thumb_wBUPFcIbXRSiBdecCOY0m3TXctUmh4XZYOcasGqR.jpg\",\"user_id\":9},{\"src\":\"EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg\",\"thumbnail\":\"thumb_EBCnl6bATADWTsDxqYY4tDgmAuhtetkBXlvVaQD9.jpg\",\"user_id\":9},{\"src\":\"JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg\",\"thumbnail\":\"thumb_JsEcIiSjL8ZFaeTz0qe9X63nPdlUWcU9rRVNIyW2.jpg\",\"user_id\":9},{\"src\":\"imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg\",\"thumbnail\":\"thumb_imMGAdSo67H2zgQ0K0QuyMKHVPlQ1Yga4fZQM9I6.jpg\",\"user_id\":9},{\"src\":\"72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg\",\"thumbnail\":\"thumb_72Poo4vszpHGu6C2Ef6p8K1pybzNpKkJoUg6oZCR.jpg\",\"user_id\":9}]', '{\"src\":\"sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg\",\"thumbnail\":\"thumb_sXedeOsKkKO1JvYSsWuJbr7uv9wye8U1d49J2S4W.jpg\",\"user_id\":9}', '[{\"id\":11,\"name\":\"Condition\",\"type\":\"radio\",\"options\":\"New,Used,Reconditioned\",\"is_required\":1,\"units\":null,\"value\":\"Used\"},{\"id\":12,\"name\":\"Brand\",\"type\":\"select\",\"options\":\"Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota\",\"is_required\":1,\"units\":\"single\",\"value\":\"Toyota\"},{\"id\":13,\"name\":\"Model\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"Mitsubishi Outlandar Red 2010\"},{\"id\":14,\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"Red\"},{\"id\":15,\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"2015\"},{\"id\":16,\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"KM\",\"value\":\"72000\"},{\"id\":17,\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"CC\",\"value\":\"2000\"},{\"id\":18,\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":\"Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other\",\"is_required\":1,\"units\":null,\"value\":\"Octane\"},{\"id\":19,\"name\":\"Transmission\",\"type\":\"radio\",\"options\":\"Manual,Automatic,Other transmission\",\"is_required\":1,\"units\":null,\"value\":\"Automatic\"},{\"id\":20,\"name\":\"Body type\",\"type\":\"select\",\"options\":\"Saloon,Hatchback,Estate,Sports,SUV,MPV\",\"is_required\":0,\"units\":null,\"value\":\"Manual\"},{\"id\":21,\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":\"\",\"is_required\":0,\"units\":null,\"value\":[\"\"]}]', NULL, NULL),
(4, '2021-10-24 06:00:21', '2021-10-24 06:00:21', 'Honda Vezel z package 2014', 8, 9, 2, 1, '32000', 'honda-vezel-z-package-2014', '0', 'Honda Vezel Z Hybrid Family Used Car\r\n\r\nModel:- 2014\r\n\r\nRegistration:- 2019\r\n\r\nColour:- Black \r\n\r\n#leather Interior\r\n\r\nCC:- 1500\r\n\r\nFuel System:- Octane hybrid\r\n\r\nFitness till:- 14-02-2023\r\n\r\nTax Token:- 28 November 2022\r\n\r\nTire Condition:- 4 new tyres recently installed\r\n\r\n💣emergency brake \r\n\r\n💣auto headlight + wiper sensor\r\n\r\n💣 Paddle shifter\r\n\r\n💣 Cruise control\r\n\r\n💣 Front 2 Seat heater \r\n\r\n💣 6 airbags\r\n\r\n💣 Tinted glass\r\n\r\n✅ Every glasses still original\r\n\r\n✅ Stock engine authentic mileage 31000km\r\n\r\n✅ Extremely fresh condition\r\n\r\nSerial : Dhaka Metro GHA 18\r\n\r\nOptions : Smart entry system, Push start, Dual climate control system, Retract mirror, TV, Built in sound system, projection LED headlights.\r\n\r\nPrice 18,90000/-\r\n\r\nONLY Real Buyer Call me. Interested buyer can visit and see the car 🚗🚨.', NULL, '[{\"src\":\"osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg\",\"thumbnail\":\"thumb_osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg\",\"user_id\":9},{\"src\":\"y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg\",\"thumbnail\":\"thumb_y0FaWI0UvzBVJT31eRjkGlq4Jtw31Me9Wkmc4a7o.jpg\",\"user_id\":9},{\"src\":\"m87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg\",\"thumbnail\":\"thumb_m87krwYW6Q8TPRsVEdrZyYFQ4D12WA9rdQ7Q3dAh.jpg\",\"user_id\":9},{\"src\":\"abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg\",\"thumbnail\":\"thumb_abNt7Ox5TvFdnWdkAHYvc2k5WCMFFKMYARdBySiP.jpg\",\"user_id\":9},{\"src\":\"inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg\",\"thumbnail\":\"thumb_inQ11eGXlkG8xJscJ6xTZIlDcE78bogTnnwDgChs.jpg\",\"user_id\":9},{\"src\":\"3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg\",\"thumbnail\":\"thumb_3TXvxQ2jjDBQDpIRTwWeyr3Ce12SmhYaS13LFsiu.jpg\",\"user_id\":9},{\"src\":\"EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg\",\"thumbnail\":\"thumb_EK4WNwezoj4B3R0qT6gKV4BssQnWVVE7KGZew6SJ.jpg\",\"user_id\":9},{\"src\":\"CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg\",\"thumbnail\":\"thumb_CnGRMirDcDpcdZu0Gwnuf0LBf0acJqGvjsxWfM3r.jpg\",\"user_id\":9}]', '{\"src\":\"osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg\",\"thumbnail\":\"thumb_osopx9xJRyasNS2Tpm6yRNW7zoReGPyEdJtUSmV8.jpg\",\"user_id\":9}', '[{\"id\":11,\"name\":\"Condition\",\"type\":\"radio\",\"options\":\"New,Used,Reconditioned\",\"is_required\":1,\"units\":null,\"value\":\"New\"},{\"id\":12,\"name\":\"Brand\",\"type\":\"select\",\"options\":\"Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota\",\"is_required\":1,\"units\":\"single\",\"value\":\"BMW\"},{\"id\":13,\"name\":\"Model\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"Honda Vezel z package 2014\"},{\"id\":14,\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"z package\"},{\"id\":15,\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"2016\"},{\"id\":16,\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"KM\",\"value\":\"6000\"},{\"id\":17,\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"CC\",\"value\":\"500\"},{\"id\":18,\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":\"Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other\",\"is_required\":1,\"units\":null,\"value\":\"Diesel\"},{\"id\":19,\"name\":\"Transmission\",\"type\":\"radio\",\"options\":\"Manual,Automatic,Other transmission\",\"is_required\":1,\"units\":null,\"value\":\"Automatic\"},{\"id\":20,\"name\":\"Body type\",\"type\":\"select\",\"options\":\"Saloon,Hatchback,Estate,Sports,SUV,MPV\",\"is_required\":0,\"units\":null,\"value\":\"Manual\"}]', NULL, NULL),
(5, '2021-10-24 06:05:32', '2021-10-24 06:05:32', 'Muhindo Mubaraka', 8, 9, 1, 2, '1300', 'muhindo-mubaraka', '0', 'Toyota Premio f-ex -package 2016', NULL, '[{\"src\":\"hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg\",\"thumbnail\":\"thumb_hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg\",\"user_id\":9},{\"src\":\"WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg\",\"thumbnail\":\"thumb_WCLyOM3YsLhWogckdGLLx2Xe0YJwblCCmzFx09iN.jpg\",\"user_id\":9},{\"src\":\"EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg\",\"thumbnail\":\"thumb_EZlF2A7zd0LOBnrivSJPGuy5tEHlwNb05MyTEQZ8.jpg\",\"user_id\":9},{\"src\":\"N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg\",\"thumbnail\":\"thumb_N5vfY4yyTK4uab1zfgp1rNqaGtQgbA6d1rOAndag.jpg\",\"user_id\":9},{\"src\":\"Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg\",\"thumbnail\":\"thumb_Y5OBBVjubiRmPExMQj7KjWqB0nwQpgNtj4we5mmM.jpg\",\"user_id\":9},{\"src\":\"RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg\",\"thumbnail\":\"thumb_RnwsIUHtQrh254qKG7shsMp1U1mr5hSbAJBR2tq2.jpg\",\"user_id\":9},{\"src\":\"CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg\",\"thumbnail\":\"thumb_CflUNjI1hpyteD7Wxur6tu258QeVMkmn4N5eTmN8.jpg\",\"user_id\":9}]', '{\"src\":\"hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg\",\"thumbnail\":\"thumb_hWTSNpOVowv3fXUGY0hB6sIekieDMji7RnbIqqIl.jpg\",\"user_id\":9}', '[{\"id\":11,\"name\":\"Condition\",\"type\":\"radio\",\"options\":\"New,Used,Reconditioned\",\"is_required\":1,\"units\":null,\"value\":\"Used\"},{\"id\":12,\"name\":\"Brand\",\"type\":\"select\",\"options\":\"Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota\",\"is_required\":1,\"units\":\"single\",\"value\":\"Hummer\"},{\"id\":13,\"name\":\"Model\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"Nissan\"},{\"id\":14,\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"SUPPER-GL\"},{\"id\":15,\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"2000\"},{\"id\":16,\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"KM\",\"value\":\"500\"},{\"id\":17,\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"CC\",\"value\":\"4000\"},{\"id\":18,\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":\"Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other\",\"is_required\":1,\"units\":null,\"value\":\"Hybrid\"},{\"id\":19,\"name\":\"Transmission\",\"type\":\"radio\",\"options\":\"Manual,Automatic,Other transmission\",\"is_required\":1,\"units\":null,\"value\":\"Automatic\"},{\"id\":20,\"name\":\"Body type\",\"type\":\"select\",\"options\":\"Saloon,Hatchback,Estate,Sports,SUV,MPV\",\"is_required\":0,\"units\":null,\"value\":\"Automatic\"}]', NULL, NULL),
(6, '2021-11-05 20:55:07', '2021-11-05 20:55:07', '300', 8, 12, 1, 1, '800', '300', '0', 'details...', NULL, '[{\"src\":\"DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html\",\"thumbnail\":\"DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html\",\"user_id\":12},{\"src\":\"UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html\",\"thumbnail\":\"UEa2oT02b8qfUDOZBHXB8Mkxr4oOnEChSDm1PgM7.html\",\"user_id\":12},{\"src\":\"h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg\",\"thumbnail\":\"thumb_h1krWMhUtfKrITWrt0mGKQuhpT9qDtc9qE9caKjX.jpg\",\"user_id\":12},{\"src\":\"RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg\",\"thumbnail\":\"thumb_RwanLEWN47gdxvz8GVi6euw4BhiFvOMp07772rVZ.jpg\",\"user_id\":12}]', '{\"src\":\"DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html\",\"thumbnail\":\"DEtBhfDcBZWWvO4xZTfDEEu6TiJ6scK4dbmQIRDN.html\",\"user_id\":12}', '[{\"id\":11,\"name\":\"Condition\",\"type\":\"radio\",\"options\":\"New,Used,Reconditioned\",\"is_required\":1,\"units\":null,\"value\":\"New\"},{\"id\":12,\"name\":\"Brand\",\"type\":\"select\",\"options\":\"Audi,BMW,Dodge,Ferrari,Hino,Honder,Hummer,Isuzu,Jaguar,Honda,Toyota\",\"is_required\":1,\"units\":\"single\",\"value\":\"Audi\"},{\"id\":13,\"name\":\"Model\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"Nissan\"},{\"id\":14,\"name\":\"Trim \\/ Edition\",\"type\":\"text\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"G-Type\"},{\"id\":15,\"name\":\"Year of Manufacture\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":null,\"value\":\"2019\"},{\"id\":16,\"name\":\"Kilometers run\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"KM\",\"value\":\"12\"},{\"id\":17,\"name\":\"Engine capacity\",\"type\":\"number\",\"options\":\"\",\"is_required\":1,\"units\":\"CC\",\"value\":\"45\"},{\"id\":18,\"name\":\"Fuel type\",\"type\":\"radio\",\"options\":\"Diesel,Petrol,CNG,Hybrid,Electric,Octane,LPG,Other\",\"is_required\":1,\"units\":null,\"value\":\"Diesel\"},{\"id\":19,\"name\":\"Transmission\",\"type\":\"radio\",\"options\":\"Manual,Automatic,Other transmission\",\"is_required\":1,\"units\":null,\"value\":\"Manual\"},{\"id\":20,\"name\":\"Body type\",\"type\":\"select\",\"options\":\"Saloon,Hatchback,Estate,Sports,SUV,MPV\",\"is_required\":0,\"units\":null,\"value\":\"Manual\"},{\"id\":21,\"name\":\"Negotiable\",\"type\":\"checkbox\",\"options\":\"\",\"is_required\":0,\"units\":null,\"value\":[\"\"]}]', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `created_at`, `updated_at`, `user_id`, `product_id`, `rating`, `comment`, `reason`, `image`) VALUES
(1, '2021-10-11 09:24:37', '2021-10-11 09:24:37', 4, 1, 5, 'Check the item before you buy\r\n\r\nPay only after collecting item\r\n\r\nBeware of unrealistic offers\r\n\r\nMeet seller at a safe location\r\n\r\nDo not make an abrupt decision\r\n\r\nBe honest with the ad you post', '1', NULL),
(2, '2021-10-11 09:28:56', '2021-10-11 09:28:56', 4, 1, 5, 'Check the item before you buy\r\n\r\nPay only after collecting item\r\n\r\nBeware of unrealistic offers\r\n\r\nMeet seller at a safe location\r\n\r\nDo not make an abrupt decision\r\n\r\nBe honest with the ad you post', '1', NULL),
(3, '2021-10-11 09:29:21', '2021-10-11 09:29:21', 4, 1, 5, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit Non quibusdam harum ipsum dolor cumque quas magni voluptatibus cupiditate minima quis.\r\n\r\n', '1', NULL),
(4, '2021-10-11 09:41:51', '2021-10-11 09:41:51', 4, 1, 5, 'Another simple comment', '2', NULL),
(5, '2021-10-11 09:51:33', '2021-10-11 09:51:33', 4, 1, 3, 'Not happy with your delivery system!', 'Product quality', NULL),
(6, '2021-10-12 04:25:56', '2021-10-12 04:25:56', 7, 8, 4, 'Customer caring was a good one. Thank you!', 'Qoute', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `services` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hours` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) DEFAULT NULL,
  `status_comment` int(11) DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '1',
  `city_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `created_at`, `updated_at`, `user_id`, `first_name`, `last_name`, `company_name`, `email`, `phone_number`, `location`, `about`, `services`, `longitude`, `latitude`, `division`, `opening_hours`, `profile_photo`, `cover_photo`, `facebook`, `twitter`, `whatsapp`, `youtube`, `instagram`, `last_seen`, `status`, `username`, `linkedin`, `category_id`, `status_comment`, `country_id`, `city_id`) VALUES
(10, '2021-11-05 09:15:12', '2021-11-05 09:51:52', 12, 'Biirah', 'Swaleh', 'JOHN Tech', '+256751685087', '0779755798', 'Kampala Uganda', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolorem consequatur voluptas eum quis id sequi! Aut aliquid facilis aperiam harum! Ut architecto eum assumenda ratione error unde quae fuga magnam.', NULL, '1677028000', NULL, 'hppts://fb.com', NULL, '{\"src\":\"7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg\",\"thumbnail\":\"thumb_7cuGTXEU5v31WaMOM0K063jlNI1Qw1juTslB4JN5.jpg\",\"user_id\":12}', '{\"src\":\"AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg\",\"thumbnail\":\"thumb_AX8837sXMf5MYbi7FsGQwsaVFCJGrvl0MjDwTWpR.jpg\",\"user_id\":12}', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', 'hppts://fb.com', '1636115515', '1', 'john-tech696', 'hppts://fb.com', 4, NULL, 1, 1);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_number` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone_number`) VALUES
(12, '', '256779755798', NULL, '$2y$10$tgaQCa5wBNCKCENYZ2VLu.pTj4Ml8D1DLoM9xvpnkvBZ.wOUSUYa2', '2e6K35DYZyJ9j6FEbFtcUHDG2qkXiSdFvS2brxxWZ9td9nUQulUBC67ApsON', '2021-11-05 09:15:12', '2021-11-05 09:15:12', '256779755798');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=899;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
