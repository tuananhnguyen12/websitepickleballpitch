-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 21, 2024 lúc 06:26 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlsanbong`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_information`
--

CREATE TABLE `bank_information` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bank_number` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `isShow` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bank_information`
--

INSERT INTO `bank_information` (`id`, `name`, `bank_number`, `note`, `image`, `isShow`, `created_at`, `updated_at`) VALUES
(1, 'Vietcombank', '123456789', NULL, 'https://www.inlogo.vn/vnt_upload/File/Image/logo_VCB_828891.jpg', NULL, '2024-06-13 06:41:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `code` varchar(100) NOT NULL,
  `amount` decimal(2,0) NOT NULL,
  `usage_limit` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`code`, `amount`, `usage_limit`, `create_at`, `update_at`) VALUES
('Nhom5_Php', 20, 100000, '2024-06-13 06:32:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `football_pitches`
--

CREATE TABLE `football_pitches` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price_per_hour` int(11) NOT NULL,
  `price_per_peak_hour` int(11) NOT NULL,
  `is_maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `pitch_type_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `image_path` longtext DEFAULT NULL,
  `wifi` tinyint(1) DEFAULT 0,
  `tea` tinyint(1) DEFAULT 0,
  `cantin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `football_pitches`
--

INSERT INTO `football_pitches` (`id`, `name`, `time_start`, `time_end`, `description`, `price_per_hour`, `price_per_peak_hour`, `is_maintenance`, `pitch_type_id`, `created_at`, `updated_at`, `image_path`, `wifi`, `tea`, `cantin`) VALUES
(7, 'cmm', '01:04:00', '23:04:00', 'rtghjk', 65000, 78000, 1, 1, '2024-12-12 01:57:25', '2024-12-20 16:49:06', './uploads/power_16800152.png', 1, 1, 1),
(8, 'dghfjk', '03:06:00', '22:05:00', 'dfghjkl', 65000, 78000, 1, 1, '2024-12-14 02:02:31', '2024-12-20 16:46:23', './uploads/pitch3.jpg', 0, 0, 1),
(9, 'sân pick1', '04:12:00', '23:12:00', 'sân có bóng mát', 45000, 90000, 1, 1, '2024-12-14 02:12:55', '2024-12-20 16:46:23', './uploads/sp1.jpg', 0, 1, 0),
(10, 'sân pick 2', '03:13:00', '22:13:00', 'ây đi xi', 45000, 79000, 1, 1, '2024-12-14 02:14:03', '2024-12-20 16:35:09', './uploads/sp2.jpg', 0, 0, 0),
(11, 'sân trà vinh', '19:00:00', '17:30:00', 'sân có bóng mát', 45000, 90000, 1, 1, '2024-12-20 10:13:22', '2024-12-21 05:24:19', './uploads/sanpickabc.jpg', 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `football_pitch_details`
--

CREATE TABLE `football_pitch_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `football_pitch_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `identity_papers`
--

CREATE TABLE `identity_papers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `deposit` double UNSIGNED NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `total` double UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `football_pitch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `email`, `deposit`, `code`, `start_at`, `end_at`, `total`, `status`, `note`, `user_id`, `football_pitch_id`, `created_at`, `updated_at`) VALUES
(10, 'Anh Hao', '0123456789', '21004250@st.vlute.edu.vn', 4000, NULL, '2024-12-14 04:00:00', '2024-12-14 05:00:00', 10000, 2, '0', 19, 7, '2024-12-14 06:24:51', '2024-12-21 05:25:05'),
(11, 'Abc', '0123456788', 'abc123@gmail.com', 52000, NULL, '2024-12-14 07:00:00', '2024-12-14 09:00:00', 130000, 4, '0', 20, 8, '2024-12-14 08:08:34', NULL),
(27, 'user', '0356789775', 'user@gmail.com', 27733, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69333, 0, '0', 22, 7, '2024-12-21 04:34:37', '2024-12-21 04:34:37'),
(28, 'user', '0356789775', 'user@gmail.com', 22533, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56333, 0, '0', 22, 10, '2024-12-21 04:44:04', '2024-12-21 04:44:04'),
(29, 'user', '0356789775', 'user@gmail.com', 27733, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65000, 4, '0', 22, 8, '2024-12-21 05:16:55', '2024-12-21 05:16:57'),
(30, 'User', '0356789775', 'user@gmail.com', 18000, NULL, '2024-12-21 20:00:00', '2024-12-21 21:00:00', 45000, 4, '0', 22, 10, '2024-12-21 05:19:48', NULL),
(31, 'user', '0356789775', 'user@gmail.com', 28000, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65000, 4, '0', 22, 8, '2024-12-21 05:20:37', '2024-12-21 05:20:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `peak_hours`
--

CREATE TABLE `peak_hours` (
  `id` bigint(20) NOT NULL,
  `start_at` time NOT NULL,
  `end_at` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `peak_hours`
--

INSERT INTO `peak_hours` (`id`, `start_at`, `end_at`, `created_at`, `updated_at`) VALUES
(1, '17:00:00', '20:00:00', '2024-06-13 05:18:33', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pitch_types`
--

CREATE TABLE `pitch_types` (
  `id` bigint(20) NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `description` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `pitch_types`
--

INSERT INTO `pitch_types` (`id`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
(1, 11, 'Sân 11\r\nKích thước sân: Chiều dài từ 100-110 mét, chiều rộng từ 64-75 mét.\r\nSố lượng người chơi: 11 người mỗi đội.\r\nMục đích sử dụng: Dành cho các trận đấu chính thức và các giải đấu lớn.', '2024-06-13 05:12:06', NULL),
(2, 7, 'Sân 7\r\nKích thước sân: Chiều dài từ 50-70m, chiều rộng từ 30-50m.\r\nSố lượng người chơi: 7 người mỗi đội.\r\nMục đích sử dụng: Thường được sử dụng cho các giải trẻ, các trận đấu không chuyên hoặc giải đấu nhỏ.', '2024-06-13 05:13:12', NULL),
(3, 5, 'Sân 5\r\nKích thước sân: Chiều dài từ 25-42m, chiều rộng từ 16-25m.\r\nSố lượng người chơi: 5 người mỗi đội.\r\nMục đích sử dụng: Chủ yếu được sử dụng cho futsal, một biến thể của bóng đá chơi trong nhà hoặc trên sân nhỏ.', '2024-06-13 05:14:32', NULL),
(4, 9, 'Kích thước sân: Chiều dài từ 70-80m, chiều rộng từ 45-55m.\r\nSố lượng người chơi: 9 người mỗi đội.\r\nMục đích sử dụng: Phù hợp với các giải đấu trẻ hoặc không chính thức.', '2024-06-13 05:15:22', NULL),
(5, 8, 'Kích thước sân: Chiều dài từ 50-70m, chiều rộng từ 30-50m.\r\nSố lượng người chơi: 8 người mỗi đội.\r\nMục đích sử dụng: Thường dành cho các giải đấu không chính thức, tập luyện', '2024-06-13 05:16:49', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(264) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `type` bigint(20) NOT NULL DEFAULT 2,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `address`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Đức Minh Hoàng', '0964203955', 'dmh@gmail.com', '202cb962ac59075b964b07152d234b70', 'Hải Phòng', 1, NULL, '2024-06-13 07:19:09', '2024-12-10 05:42:43'),
(2, 'Hà Xuân Phúc', '0964203698', 'sinhvien2k3@gmail.com', '8ddcff3a80f4189ca1c9d4d902c3c909', 'Ngõ 1, đường Hoàng Hoa thám, Hà Nội', 2, NULL, '2024-06-13 07:20:19', '2024-06-21 08:17:18'),
(3, 'Lam Tiểu Bố', '0965469875', 'lamca@gmail.com', '8ddcff3a80f4189ca1c9d4d902c3c909', 'Quảng Ninh', 1, NULL, '2024-06-21 09:40:32', NULL),
(5, 'Lăng Lạc Thần', '0986523687', 'thantientyty@gmail.com', '8ddcff3a80f4189ca1c9d4d902c3c909', 'Tuyên Quang', 1, NULL, '2024-06-21 09:49:16', NULL),
(6, 'Chú Thỏ Con', '0896523678', 'thocon@gmail.com', '8ddcff3a80f4189ca1c9d4d902c3c909', 'TP HCM', 1, NULL, '2024-06-21 09:49:16', '2024-06-21 10:55:12'),
(7, 'Hỏa Linh Nhi', '0964528975', 'linhnhi@gmail.com', NULL, 'Yên Bái', 2, NULL, '2024-06-21 12:34:41', NULL),
(9, 'Icegozi', '0965236978', 'icegozi@gmail.com', NULL, 'Nghệ An', 1, NULL, '2024-06-21 12:37:53', NULL),
(10, 'Mã Hồng Tuấn', '0968756932', 'tuaandeptrai@gmail.com', NULL, 'Quảng Ninh', 2, NULL, '2024-06-21 13:05:34', NULL),
(11, 'khoa', '0123456788', 'htk@gmail.com', '202cb962ac59075b964b07152d234b70', '', 1, NULL, '2024-12-10 05:54:28', '2024-12-14 08:11:59'),
(16, 'ẻwả', NULL, '123456@gmail.com', '$2y$10$o9FNNkT0P4YsdS7lswzjg.nWL.NOKq4cyx/2JgpHi0fjNbdupV66S', NULL, 2, NULL, '2024-12-12 04:37:55', NULL),
(17, 'sdfsd', NULL, '147@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, NULL, '2024-12-12 04:44:47', '2024-12-14 06:27:31'),
(19, 'Anh Hao2', '0123456789', '21004250@st.vlute.edu.vn', '25d55ad283aa400af464c76d713c07ad', 'vĩnh long', 2, NULL, '2024-12-14 06:19:57', '2024-12-14 06:45:39'),
(20, 'abc', '0123456788', 'abc123@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'vĩnh long2', 2, NULL, '2024-12-14 06:55:18', '2024-12-14 08:07:28'),
(21, 'admin', '0123456789', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'vĩnh long', 1, NULL, '2024-12-14 08:16:41', NULL),
(22, 'user', '0356789775', 'user@gmail.com', 'ee11cbb19052e40b07aac0ca060c23ee', 'vĩnh long', 2, NULL, '2024-12-14 08:18:44', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2024-06-12 20:58:05', NULL),
(2, 'Customer', '2024-06-12 20:58:32', NULL),
(3, 'Guest', '2024-06-12 21:03:19', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bank_information`
--
ALTER TABLE `bank_information`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `football_pitches`
--
ALTER TABLE `football_pitches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pitch_type_id` (`pitch_type_id`);

--
-- Chỉ mục cho bảng `football_pitch_details`
--
ALTER TABLE `football_pitch_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `football_pitch_id` (`football_pitch_id`);

--
-- Chỉ mục cho bảng `identity_papers`
--
ALTER TABLE `identity_papers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `football_pitch_id` (`football_pitch_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `code` (`code`);

--
-- Chỉ mục cho bảng `peak_hours`
--
ALTER TABLE `peak_hours`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pitch_types`
--
ALTER TABLE `pitch_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_id` (`type`);

--
-- Chỉ mục cho bảng `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bank_information`
--
ALTER TABLE `bank_information`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `football_pitches`
--
ALTER TABLE `football_pitches`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `football_pitch_details`
--
ALTER TABLE `football_pitch_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `identity_papers`
--
ALTER TABLE `identity_papers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `peak_hours`
--
ALTER TABLE `peak_hours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `pitch_types`
--
ALTER TABLE `pitch_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `football_pitches`
--
ALTER TABLE `football_pitches`
  ADD CONSTRAINT `football_pitches_ibfk_2` FOREIGN KEY (`pitch_type_id`) REFERENCES `pitch_types` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `football_pitch_details`
--
ALTER TABLE `football_pitch_details`
  ADD CONSTRAINT `football_pitch_details_ibfk_1` FOREIGN KEY (`football_pitch_id`) REFERENCES `football_pitches` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `identity_papers`
--
ALTER TABLE `identity_papers`
  ADD CONSTRAINT `identity_papers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`football_pitch_id`) REFERENCES `football_pitches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`code`) REFERENCES `discounts` (`code`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type`) REFERENCES `user_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
