-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 15, 2026 lúc 07:24 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sport`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `logo_url`) VALUES
(1, 'NIKE', NULL),
(2, 'ADIDAS', NULL),
(3, 'PUMA', NULL),
(4, 'UNDER ARMOUR', NULL),
(5, 'MIZUNO', NULL),
(6, 'ASICS', NULL),
(7, 'YONEX', NULL),
(8, 'LI-NING', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `badge_text` varchar(50) DEFAULT 'THỊNH HÀNH',
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `badge_text`, `description`, `image_url`) VALUES
(1, 'Bóng Đá', '450+ MẪU', 'Áo đấu CLB, giày đinh FG/TF cao cấp, găng tay thủ môn...', NULL),
(2, 'Bóng Rổ', '320+ MẪU', 'Giày cổ cao giảm chấn, bóng Spalding/Molten tiêu chuẩn...', NULL),
(3, 'Chạy Bộ', 'TOP BÁN CHẠY', 'Giày đế Carbon trợ lực, đồ phản quang đêm, vest nước...', NULL),
(4, 'Gym & Fitness', '280+ MẪU', 'Áo nén Pro Combat, đai lưng nâng tạ, băng cuốn cổ tay...', NULL),
(5, 'Phụ Kiện', '190+ MẪU', 'Túi trống thể thao chống nước, tất dệt kim ma sát cao...', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sales`
--

CREATE TABLE `flash_sales` (
  `flash_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `discount_percent` int(11) NOT NULL,
  `sold_percent` int(11) DEFAULT 50,
  `stock_status` varchar(100) DEFAULT 'Sắp cháy hàng',
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flash_sales`
--

INSERT INTO `flash_sales` (`flash_id`, `product_id`, `discount_percent`, `sold_percent`, `stock_status`, `end_time`) VALUES
(1, 1, 36, 86, 'Sắp cháy hàng', NULL),
(2, 2, 40, 91, 'Chỉ còn 9 áo', NULL),
(3, 3, 30, 78, 'Bán rất chạy', NULL),
(4, 4, 42, 89, 'Chỉ còn 7 đôi', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 4.9,
  `review_count` int(11) DEFAULT 50,
  `available_sizes` varchar(100) DEFAULT NULL,
  `product_type` varchar(50) DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT 0,
  `is_featured` tinyint(1) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `brand_id`, `brand_name`, `product_name`, `base_price`, `discount_price`, `rating`, `review_count`, `available_sizes`, `product_type`, `is_hot`, `is_featured`, `image_url`) VALUES
(1, 3, 1, 'Nike Running', 'Giày Chạy Bộ Nike ZoomX Vaporfly 3 Carbon', 7390000.00, 4690000.00, 4.9, 182, '40, 41, 42, 42.5, 43', 'shoes', 1, 1, NULL),
(2, 1, 2, 'Adidas Football', 'Áo Đấu Real Madrid Home 24/25 Bản Player', 2490000.00, 1490000.00, 5.0, 747, 'S, M, L, XL', 'clothes', 1, 1, NULL),
(3, 1, 2, 'Adidas Performance', 'Giày Đá Bóng Sân Cỏ Nhân Tạo Adidas Predator Elite', 3990000.00, 2790000.00, 4.8, 94, '39, 40, 41, 42', 'shoes', 1, 1, NULL),
(4, 2, 1, 'Nike Basketball', 'Giày Bóng Rổ Cổ Cao Nike Kyrie Infinity Court Lock', 3690000.00, 2150000.00, 4.9, 57, '41, 42, 43, 44', 'shoes', 1, 1, NULL),
(5, 1, 2, 'Adidas Official', 'Áo Đấu Arsenal Home 24/25 Bản Fan', 1890000.00, 1350000.00, 4.9, 98, 'S, M, L, XL', 'clothes', 0, 1, NULL),
(6, 3, 6, 'Asics Running', 'Giày Chạy Asics GEL-Nimbus 26 Chính Hãng', 4490000.00, 3990000.00, 4.9, 112, '40, 41, 42, 43', 'shoes', 0, 1, NULL),
(7, 1, 3, 'Puma Pro', 'Giày Đá Bóng Puma Future Ultimate FG/AG', 4800000.00, 3250000.00, 4.8, 74, '39, 40, 41, 42', 'shoes', 0, 1, NULL),
(8, 4, 4, 'Under Armour', 'Áo Nén Cơ UA HeatGear Compression Pro', 1190000.00, 850000.00, 4.9, 104, 'M, L, XL, 2XL', 'clothes', 0, 1, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`flash_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `flash_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD CONSTRAINT `flash_sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
