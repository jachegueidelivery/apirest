-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Set-2019 às 16:20
-- Versão do servidor: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery_api`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(35, '10_product_image_schema', 1, '2019-09-23 13:33:42'),
(36, '11_file_schema', 1, '2019-09-23 13:33:43'),
(37, '1569183302999_user_request_schema', 1, '2019-09-23 13:33:43'),
(38, '1_uf_schema', 1, '2019-09-23 13:33:43'),
(39, '2_city_schema', 1, '2019-09-23 13:33:44'),
(40, '3_user_schema', 1, '2019-09-23 13:33:45'),
(41, '4_company_schema', 1, '2019-09-23 13:33:45'),
(42, '5_category_schema', 1, '2019-09-23 13:33:46'),
(43, '6_product_schema', 1, '2019-09-23 13:33:47'),
(44, '7_stock_schema', 1, '2019-09-23 13:33:48'),
(45, '8_user_product_schema', 1, '2019-09-23 13:33:49'),
(46, '9_token', 1, '2019-09-23 13:33:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(254) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(254) NOT NULL,
  `uf_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_fantasy_name` varchar(255) NOT NULL,
  `company_cnpj` varchar(255) NOT NULL,
  `company_phone` varchar(60) DEFAULT NULL,
  `company_street` varchar(254) NOT NULL,
  `company_number` varchar(60) DEFAULT NULL,
  `company_district` varchar(60) NOT NULL,
  `company_logo` varchar(254) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `files`
--

CREATE TABLE `files` (
  `id` int(10) UNSIGNED NOT NULL,
  `file` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(254) NOT NULL,
  `product_description` varchar(254) DEFAULT NULL,
  `product_image` varchar(254) DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `prod_img_path` varchar(255) NOT NULL,
  `prod_img_file` varchar(255) DEFAULT NULL,
  `prod_img_name` varchar(255) DEFAULT NULL,
  `prod_img_type` varchar(255) DEFAULT NULL,
  `prod_img_subtype` varchar(255) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_price` decimal(9,2) NOT NULL,
  `stock_amount` float(9,2) NOT NULL,
  `stock_measure_type` varchar(255) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ufs`
--

CREATE TABLE `ufs` (
  `id` int(10) UNSIGNED NOT NULL,
  `uf_name` varchar(254) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(80) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_password` varchar(60) NOT NULL,
  `user_cellphone` varchar(60) DEFAULT NULL,
  `user_street` varchar(254) NOT NULL,
  `user_number` varchar(60) DEFAULT NULL,
  `user_district` varchar(60) NOT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  `token_created_at` timestamp NULL DEFAULT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_password`, `user_cellphone`, `user_street`, `user_number`, `user_district`, `user_token`, `token_created_at`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 'Emilio Romano', 'usku@sauvi.aq', '$2a$10$aKxs/4v7M17Q7cPdpd5XSuHW7E2NMTBHwuQnZtYj/kP1Ln82bQEFi', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(2, 'Massimo Cherubini', 'heltejuca@soged.mh', '$2a$10$ArKgSRfJfJxwIRYX3sfuHOMAitplyXU9PPK5MfEJ79NTE4siAHgz6', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(3, 'Michela Lanini', 'kihowode@cak.es', '$2a$10$1etnhhKdnKLcNMOOFflPu.5EdVi.UwrwnNUL71xSIekGimkSoBVse', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(4, 'Ugo Fei', 'jeinoko@degu.mz', '$2a$10$bj.OwBQ1Pr5FCQ3qXMuvSOdD8Lr/OFyp7R5Fh/anNl5GcG2BUtn4y', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(5, 'Angiolo Taddei', 'rurho@jioga.tp', '$2a$10$2BEpeg0npJZrui/Dq6YVpO9eBUzpTi1t9c/NLM5FrBHXZuyBGw4ya', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(6, 'Cristiano Anichini', 'zusajzij@bawdolun.sz', '$2a$10$dL1mPaa7.NYhaGE.5x4GbOIpJRTJsdmb0CyGeY.PdomWQbGMtiu6i', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(7, 'Piero Ferrari', 'winap@pu.et', '$2a$10$Aua3KMHUYToxrA5RH61Wwe8ilRNtGiKD1ZYZPg5SQQJigsysB3MpW', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(8, 'Dina Goretti', 'pophoet@bear.it', '$2a$10$50Mzr4L8cB2ZcMxzgRJ45eIvIbu4KvhRmgVbT/wyfOdIpQKAwu1Hm', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(9, 'Paola Brogi', 'cefitwi@guwvosi.nc', '$2a$10$2GomYH8ZDEm1DHiruhM7V.Zgo5e3HBGg0IaEaw65aV12kDNoQL8wS', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36'),
(10, 'Maurizio Cavini', 'fi@uz.sb', '$2a$10$iSnNJx5JzPftKIZTC3m3p.JQqO1UQ3Rm9xcskkJVhrfppAD97SexG', NULL, '1', NULL, '1', NULL, NULL, 1, '2019-09-23 13:06:36', '2019-09-23 13:06:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_products`
--

CREATE TABLE `user_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_prod_total_amount` float(9,2) NOT NULL,
  `user_prod_total_value` decimal(9,2) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_prod_status` enum('1','2','3','4') COLLATE utf8_unicode_ci DEFAULT '1',
  `product_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user_products`
--

INSERT INTO `user_products` (`id`, `user_prod_total_amount`, `user_prod_total_value`, `user_id`, `user_prod_status`, `product_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(2, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(3, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:15', '2019-09-23 11:56:15'),
(4, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(5, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(6, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(7, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(8, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(9, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(10, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 11:56:16', '2019-09-23 11:56:16'),
(11, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(12, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(13, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(14, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(15, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(16, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(17, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(18, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(19, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:09', '2019-09-23 13:03:09'),
(20, 1.00, '1.00', 1, '1', 1, 1, '2019-09-23 13:03:22', '2019-09-23 13:03:22'),
(21, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(22, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(23, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(24, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(25, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(26, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(27, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(28, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(29, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(30, 1.00, '1.00', 1, '2', 1, 1, '2019-09-23 13:04:28', '2019-09-23 13:04:28'),
(31, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(32, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(33, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(34, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(35, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(36, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(37, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(38, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(39, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(40, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:05:50', '2019-09-23 13:05:50'),
(41, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(42, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(43, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(44, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(45, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(46, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(47, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(48, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(49, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35'),
(50, 1.00, '1.00', 1, '3', 1, 1, '2019-09-23 13:06:35', '2019-09-23 13:06:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_name_unique` (`category_name`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uf_id` (`uf_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_company_cnpj_unique` (`company_cnpj`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `ufs`
--
ALTER TABLE `ufs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_email_unique` (`user_email`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `user_products`
--
ALTER TABLE `user_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ufs`
--
ALTER TABLE `ufs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_products`
--
ALTER TABLE `user_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
