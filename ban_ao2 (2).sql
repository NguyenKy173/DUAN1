-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2024 lúc 06:59 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ban_ao2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bienthe`
--

CREATE TABLE `bienthe` (
  `id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `size` enum('S','M','L','XL') NOT NULL,
  `color` varchar(50) NOT NULL,
  `soLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bienthe`
--

INSERT INTO `bienthe` (`id`, `pro_id`, `size`, `color`, `soLuong`) VALUES
(1, 14, 'M', 'Vàng', 10),
(2, 14, 'L', 'Vàng', 10),
(3, 14, 'M', 'Trắng', 8),
(4, 14, 'L', 'Trắng', 5),
(53, 26, 'S', 'Trắng', 2),
(55, 34, 'S', 'Trắng', 10),
(56, 34, 'M', 'Đen', 10),
(59, 25, 'M', 'Trắng', 7),
(61, 36, 'S', 'Trắng', 0),
(62, 23, 'S', 'Trắng', 0),
(63, 19, 'S', 'Trắng', 0),
(64, 15, 'S', 'Trắng', 0),
(65, 13, 'S', 'Trắng', 0),
(66, 12, 'S', 'Trắng', 0),
(67, 11, 'S', 'Trắng', 0),
(68, 9, 'S', 'Trắng', 0),
(69, 4, 'S', 'Trắng', 0),
(70, 3, 'S', 'Trắng', 0),
(71, 3, 'S', 'Trắng', 0),
(72, 1, 'S', 'Trắng', 0),
(78, 27, 'L', 'Xanh', 5),
(79, 27, 'M', 'Đen', 5),
(80, 27, 'S', 'Trắng', 5),
(81, 27, 'XL', 'Vàng', 5),
(82, 36, 'M', 'Đen', 5),
(83, 36, 'L', 'Xanh', 5),
(84, 36, 'XL', 'Vàng', 0),
(91, 25, 'L', 'Vàng', 66);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `Bill_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `price` float NOT NULL,
  `Time_set` date NOT NULL,
  `Status` varchar(50) NOT NULL COMMENT '0 là chưa thanh toán 1 là đã thanh toán\r\n',
  `Pay` enum('Chưa thanh toán','Đã thanh toán') NOT NULL DEFAULT 'Chưa thanh toán',
  `trangthai` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là chờ xác nhận , 1 là chờ lấy hàng 2 là chờ giao hàng 3 là đã giao -1 là huỷ đơn hàng\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`Bill_ID`, `User_ID`, `price`, `Time_set`, `Status`, `Pay`, `trangthai`) VALUES
(120, 31, 180000, '2024-04-10', '0', 'Chưa thanh toán', -1),
(121, 31, 180000, '2024-04-10', '1', 'Đã thanh toán', 3),
(122, 31, 350000, '2024-04-10', '0', 'Chưa thanh toán', 0),
(124, 31, 499000, '2024-04-10', '0', 'Chưa thanh toán', 1),
(125, 31, 499000, '2024-04-10', '0', 'Chưa thanh toán', 2),
(126, 35, 350000, '2024-04-10', '0', 'Chưa thanh toán', 3),
(128, 31, 499000, '2024-04-11', '0', 'Chưa thanh toán', 0),
(129, 31, 160000, '2024-04-11', '0', 'Chưa thanh toán', 0),
(132, 35, 150000, '2024-04-11', '0', 'Chưa thanh toán', 1),
(133, 31, 150000, '2024-04-11', '1', 'Đã thanh toán', 2),
(134, 31, 499000, '2024-04-11', '0', 'Chưa thanh toán', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bil_ct`
--

CREATE TABLE `bil_ct` (
  `id` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tensp` varchar(250) NOT NULL,
  `giasp` int(250) NOT NULL,
  `soluong` int(15) NOT NULL,
  `size` varchar(200) NOT NULL,
  `mau` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bil_ct`
--

INSERT INTO `bil_ct` (`id`, `id_bill`, `product_id`, `tensp`, `giasp`, `soluong`, `size`, `mau`) VALUES
(63, 120, 25, 'áo thun nữ cổ bẻ phối bo pigofashion đẹp', 180000, 1, 'M', 'Trắng'),
(64, 121, 23, 'Áo thun tay ngắn in họa tiết thời trang cho nữ', 180000, 1, 'S', 'Trắng'),
(65, 122, 27, 'Áo Thun Hình In Nữ Dễ Thương Màu Đỏ Cam', 350000, 1, 'L', 'Xanh'),
(66, 124, 36, ' Áo Khoác Da Cừu Nam Xu Hướng Hàn', 499000, 1, 'S', 'Trắng'),
(67, 125, 36, ' Áo Khoác Da Cừu Nam Xu Hướng Hàn', 499000, 1, 'S', 'Đen'),
(68, 126, 27, 'Áo Thun Hình In Nữ Dễ Thương Màu Đỏ Cam', 350000, 1, 'L', 'Xanh'),
(71, 128, 36, ' Áo Khoác Da Cừu Nam Xu Hướng Hàn', 499000, 1, 'S', 'Trắng'),
(72, 129, 12, 'Áo hoodie Drew nỉ bông mềm mại cao cấp', 160000, 1, 'S', 'Trắng'),
(73, 132, 34, 'Áo thun nam cổ tròn Raglan HI-ELE FRPRF', 150000, 1, 'M', 'Trắng'),
(74, 133, 19, 'Áo Hoodie Nam Nữ trơn form rộng', 150000, 1, 'S', 'Trắng'),
(75, 134, 36, ' Áo Khoác Da Cừu Nam Xu Hướng Hàn', 499000, 1, 'S', 'Trắng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(5) NOT NULL,
  `idtaikhoan` int(5) NOT NULL,
  `idsanpham` int(5) NOT NULL,
  `noidung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaybinhluan` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `idtaikhoan`, `idsanpham`, `noidung`, `ngaybinhluan`, `status`) VALUES
(33, 31, 34, 'đẹp', '2024-04-04', 0),
(34, 31, 34, 'fertrt', '2024-04-04', 0),
(35, 31, 34, 'nhwuy lon', '2024-04-04', 0),
(36, 31, 34, 'gretet', '2024-04-04', 1),
(37, 31, 34, 'fefegt', '2024-04-04', 0),
(38, 31, 12, 'ok', '2024-04-04', 1),
(39, 31, 23, 'đẹp quá', '2024-04-04', 1),
(40, 31, 23, 'xinh', '2024-04-04', 1),
(42, 31, 36, 'tuyệt', '2024-04-11', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `iddonhang` int(5) NOT NULL,
  `idsanpham` int(5) NOT NULL,
  `soluong` int(11) NOT NULL,
  `dongia` int(11) NOT NULL,
  `thanhtien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(5) NOT NULL,
  `tendm` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendm`, `status`) VALUES
(1, 'Áo Thun', 1),
(2, 'Áo Hoodie', 1),
(4, 'Áo Sweater', 1),
(14, 'Áo Khoác', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `idtaikhoan` int(5) NOT NULL,
  `hovatennhan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tensp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Size` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL,
  `diachinhan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodienthoainhan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `phuongthuctt` enum('Thanh toán khi nhận','MoMo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Thanh toán khi nhận',
  `trangthai` enum('Chưa duyệt','Đã duyệt','Đơn hàng mới','Đang giao','Đã giao','Đã hủy') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chưa duyệt',
  `thanhtoan` enum('Chưa thanh toán','Đã thanh toán') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chưa thanh toán',
  `ngaydathang` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(11) NOT NULL,
  `idtaikhoan` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `id_bienthe` int(10) NOT NULL,
  `size` varchar(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `soluong` int(10) NOT NULL,
  `thanhtien` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `idtaikhoan`, `product_id`, `id_bienthe`, `size`, `color`, `soluong`, `thanhtien`) VALUES
(135, 31, 36, 3, 'S', 'Trắng', 1, 499000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(5) NOT NULL,
  `iddm` int(5) NOT NULL,
  `tensp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giasp` int(20) NOT NULL DEFAULT 0,
  `giakm` int(20) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangthai` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0. còn hàng 1. hết hàng',
  `khuyenmai` int(10) NOT NULL DEFAULT 0,
  `mota` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luotxem` int(20) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 là ẩn\r\n1 là hiện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `iddm`, `tensp`, `giasp`, `giakm`, `image`, `trangthai`, `khuyenmai`, `mota`, `luotxem`, `status`) VALUES
(1, 4, 'ÁO SWEATER NỈ UNISEX NỮ ', 170000, 144500, 'a5.jpg', 0, 15, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 1309, 1),
(3, 4, 'Áo Sweater form rộng trơn Nam Nữ Unisex ', 280000, 238000, 'a1.webp', 0, 15, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo: Over size nam nữ', 810, 1),
(4, 4, 'Áo Sweater form rộng trơn Nam Nữ Unisex đẹp trắng', 250000, 187500, 'a2.webp', 0, 25, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 958, 1),
(9, 4, 'Áo Sweater form rộng trơn Nam Nữ Unisex ', 160000, 144000, 'a3.webp', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 1158, 1),
(11, 4, 'Áo Sweater Nam Form Rộng Phối Layer Chất Nỉ', 150000, 127500, 'a4.jpg', 0, 15, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 1204, 1),
(12, 2, 'Áo hoodie Drew nỉ bông mềm mại cao cấp', 160000, 144000, 'b5.jpg', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 1013, 1),
(13, 2, 'Áo Hoodie Nữ Form Rộng Chui Đầu Tay Phồng', 179000, 161100, 'b4.webp', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo: Over size nam nữ', 1109, 1),
(14, 2, 'Áo Hoodie Nỉ bông TRƠN màu Xám', 320000, 224000, 'b3.jpg', 0, 30, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 0, 1),
(15, 2, 'Áo Hoodie Nam Nữ trơn form rộng', 180000, 162000, 'b2.webp', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo: Over size nam nữ', 2, 1),
(19, 2, 'Áo Hoodie Nam Nữ trơn form rộng', 150000, 127500, 'b1.webp', 0, 15, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 4, 1),
(23, 1, 'Áo thun tay ngắn in họa tiết thời trang cho nữ', 180000, 153000, 'c5.jpg', 0, 15, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo: Over size nam nữ', 21, 1),
(25, 1, 'áo thun nữ cổ bẻ phối bo pigofashion đẹp', 180000, 162000, 'c1.jpg', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo: Over size nam nữ', 56, 1),
(26, 1, ' áo thun nữ đẹp tay lỡ form rộng-thoáng mát', 280000, 224000, 'c3.webp', 0, 20, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 865, 1),
(27, 1, 'Áo Thun Hình In Nữ Dễ Thương Màu Đỏ Cam', 350000, 315000, 'c4.webp', 0, 10, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 894, 1),
(34, 1, 'Áo thun nam cổ tròn Raglan HI-ELE FRPRF', 150000, -6000, 'c2.webp', 0, 104, 'Chất liệu: Nỉ bông lót lông dày mềm\r\nForm Áo : Over size nam nữ', 74, 1),
(36, 14, ' Áo Khoác Da Cừu Nam Xu Hướng Hàn', 499000, 499000, 'd1.jpg', 0, 0, 'Áo Bông Lông Cừu Cực Áo Khoác Nam Áo Bông Thanh Thiếu Niên Đẹp Trai Dày Giữ Ấm Mùa Đông Sang Trọng Lông Cừu Phong Cách Hàn Quốc Trào Lưu Cho Nam', 30, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `hovaten` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tendangnhap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodienthoai` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('Nhân Viên','Thành Viên','Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Thành Viên',
  `trangthai` enum('Chưa Kích Hoạt','Kích Hoạt') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kích Hoạt',
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `hovaten`, `tendangnhap`, `matkhau`, `email`, `sodienthoai`, `diachi`, `role`, `trangthai`, `status`) VALUES
(31, 'Lý trung đức', 'trungduc', '12345678', 'duc130504@gmail.com', '0917261473', 'nam từ liêm, hà nội', 'Admin', 'Kích Hoạt', 1),
(34, 'Nguyễn Văn Dương', 'quoccc', 'Duc@1234', 'ducltph46032@fpt.edu.vn', '0987654326', '', 'Thành Viên', 'Kích Hoạt', 1),
(35, 'Nguyễn Kim Kỳ', 'Admin', '12312345', 'duc@gmail.com', '0987654326', '', 'Thành Viên', 'Kích Hoạt', 1),
(39, 'Nguyễn Kim Kỳ', 'ky123', '123', 'bigbosstzs173@gmail.com', '0969976287', 'thanh xuân, hà nội', 'Thành Viên', 'Kích Hoạt', 1),
(42, 'Nguyễn Văn Dương', 'Neymarl', 'Maiyeuem12', 'duongnvph33164@fpt.edu.vn', '0876552004', 'thanh hóa', 'Thành Viên', 'Kích Hoạt', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongke`
--

CREATE TABLE `thongke` (
  `id` int(5) NOT NULL,
  `ngaydat` date NOT NULL,
  `donhang` int(10) NOT NULL,
  `doanhthu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluongban` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bienthe`
--
ALTER TABLE `bienthe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_ID`),
  ADD KEY `lk_bill_taikhoan` (`User_ID`);

--
-- Chỉ mục cho bảng `bil_ct`
--
ALTER TABLE `bil_ct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_bill_cart` (`id_bill`),
  ADD KEY `lk_bill_sanpham` (`product_id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ct_dh` (`iddonhang`),
  ADD KEY `fk_ct_sp` (`idsanpham`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sp_dm` (`iddm`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `thongke`
--
ALTER TABLE `thongke`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bienthe`
--
ALTER TABLE `bienthe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `Bill_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT cho bảng `bil_ct`
--
ALTER TABLE `bil_ct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thongke`
--
ALTER TABLE `thongke`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bienthe`
--
ALTER TABLE `bienthe`
  ADD CONSTRAINT `bienthe_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `lk_bill_taikhoan` FOREIGN KEY (`User_ID`) REFERENCES `taikhoan` (`id`);

--
-- Các ràng buộc cho bảng `bil_ct`
--
ALTER TABLE `bil_ct`
  ADD CONSTRAINT `lk_bill_cart` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`Bill_ID`),
  ADD CONSTRAINT `lk_bill_sanpham` FOREIGN KEY (`product_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `fk_ct_dh` FOREIGN KEY (`iddonhang`) REFERENCES `donhang` (`id`),
  ADD CONSTRAINT `fk_ct_sp` FOREIGN KEY (`idsanpham`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `sanpham` (`id`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sp_dm` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`);

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `thanhtoan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `taikhoan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
