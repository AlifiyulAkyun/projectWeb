-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Apr 2022 pada 06.18
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Product', 'product-product store', 1, '2021-06-21 10:17:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 30, 'ekor', 18000, 'M', '2021-06-21 13:01:30', '2022-04-10 22:00:40'),
(2, 1, 20, 'ekor', 5000, 'S', '2021-06-21 13:07:00', '2022-04-10 22:03:05'),
(3, 4, 20, 'ekor', 10000, 'M', '2021-06-21 16:50:37', '2022-04-10 22:05:45'),
(4, 3, 15, 'ekor', 10000, 'M', '2021-06-21 16:51:12', '2022-04-10 22:08:16'),
(5, 5, 10, 'ekor', 20000, 'M', '2021-06-21 16:51:35', '2022-04-10 22:09:29'),
(7, 6, 12, 'ekor', 12500, 'S', '2021-06-22 15:50:47', '2022-04-10 22:12:33'),
(8, 6, 10, 'ekor', 30000, 'M', '2021-06-22 15:51:13', '2022-04-10 22:11:44'),
(9, 7, 10, 'ekor', 6000, 'L', '2022-04-08 23:57:12', '2022-04-10 22:13:53'),
(10, 9, 25, 'buah', 6000, 'S', '2022-04-10 22:15:52', NULL),
(11, 8, 20, 'buah', 9000, 'S', '2022-04-10 22:17:20', '2022-04-10 22:17:48'),
(12, 10, 15, 'buah', 5000, 'S', '2022-04-10 22:19:58', NULL),
(13, 11, 10, 'buah', 20000, 'L', '2022-04-10 22:23:56', NULL),
(14, 12, 12, 'buah', 5500, 'S', '2022-04-10 22:32:02', NULL),
(15, 13, 11, 'buah', 20000, 'S', '2022-04-10 22:32:51', NULL),
(16, 14, 10, 'buah', 8000, 'S', '2022-04-10 22:33:47', NULL),
(17, 15, 8, 'buah', 12500, 'S', '2022-04-10 22:36:12', NULL),
(18, 16, 10, 'buah', 45000, 'S', '2022-04-10 22:41:20', NULL),
(19, 17, 10, 'buah', 120000, 'S', '2022-04-10 22:42:36', NULL),
(20, 19, 10, 'buah', 59000, 'M', '2022-04-10 22:44:18', NULL),
(21, 20, 12, 'buah', 53000, 'M', '2022-04-10 22:45:57', NULL),
(22, 21, 8, 'buah', 233500, 'L', '2022-04-10 22:48:47', NULL),
(23, 18, 15, 'buah', 175000, 'S', '2022-04-10 22:51:44', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Halfmoon', '&lt;p&gt;&lt;span id=&quot;docs-internal-guid-a2919662-7fff-33d7-632b-933167c8c404&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Ikan cupang halfmoon merupakan salah satu jenis ikan yang memiliki ekor dan sirip yang simetris menyerupai bentuk setengah bulan. Ikan ini merupakan ikan hasil perkawinan silang yang dilakukan oleh breeder Amerika Serikat, yaitu Peter Goettner sekitar tahun 80-an.&lt;/span&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 11:19:31'),
(3, 1, 1, 'Crown Tail', '&lt;p&gt;&lt;span id=&quot;docs-internal-guid-d47bb4ff-7fff-010a-b226-6362823a11b2&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Ikan Cupang Serit atau Crown Tail merupakan ikan cupang hias asli Indonesia. Ikan ini juga merupakan jenis cupang pertama yang dibudidayakan di indonesia. Bentuk sirip cupang ini begitu khas, yaitu memiliki sirip panjang, tulang sirip kuat, dan sirip seperti gerigi atau serit/sisir.&lt;/span&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 1, 1, 'Double Tail', '&lt;p&gt;Ikan cupang double tail terlihat sangat mirip dengan cupang halfmoon yaitu ikan cupang terkenal dengan sebutan bulan sepotong dan cukup popular. Bedanya, ikan ini memiliki ekor yang terbelah atau bercagak dua. Karena karakteristiknya itulah ikan ini akhirnya dinamai dengan double tail alias ekor ganda.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 1, 1, 'Ikan Cupang Giant', '&lt;p&gt;&lt;span id=&quot;docs-internal-guid-69495c58-7fff-feec-3f43-27bb599b33f3&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Ikan Cupang Giant atau Giant Betta adalah ikan cupang yang berukuran lebih dari normal. Panjang tubuh Ikan Cupang Hias Giant ini dapat mencapai +/-12 cm. Cupang raksasa ini terlihat sangat besar dengan bentuk tubuh yang tebal.&lt;/span&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 1, 1, 'Ikan Cupang Fancy', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;span id=&quot;docs-internal-guid-937398b5-7fff-7716-79b4-d6661eca4bcf&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Ikan cupang fancy adalah jenis ikan cupang&lt;/span&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt; yang memiliki warna dasar merah, kuning atau oranye dengan 2 warna iridescent/top layer.&lt;/span&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-22 15:50:16'),
(7, 1, 1, 'Ikan Cupang Plakat', '&lt;p&gt;&lt;span id=&quot;docs-internal-guid-f6026bdd-7fff-f80f-020f-2b6312ab7d0f&quot;&gt;&lt;span style=&quot;font-size: 12pt; font-family: &amp;quot;Segoe UI&amp;quot;; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;&quot;&gt;Ikan cupang plakat merupakan ikan cupang yang mempunyai ekor pendek. Banyak yang mengatakan nama plakat ini berasal dari bahasa Thailand yaitu &ldquo;plakat&rdquo;. Karena ikan cupang identik atau dikenal dengan ikan aduan maka ikan cupang plakat juga merupakan ikan aduan dan bisa juga dijadikan ikan hias sebab mempunyai berbagai jenis.&lt;/span&gt;&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 09:44:03'),
(8, 1, 3, 'Cacing Beku', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;cacing beku / frozen bloodworm PIONEER\r\n\r\nTerdiri dalam kemasan tray (terdiri dari 28 kotak kecil / 100gr)&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 09:48:51'),
(9, 1, 3, 'Provit', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Pellet PROVIT adalah pakan ikan tropical/aquascaping/kecil (seperti cupang, neon, guppy, molly, platis, dll) yang mengandung protein tinggi untuk mengoptimalkan pertumbuhan ikan kesayangan Anda.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Ukuran pellet 0,5mm&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Pellet tipe mengapung&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Komposisi Nutrisi:&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Protein............ 48 %&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Fat.................. 6 %&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Fibre............... 5 %&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Moisture.......... 5 %&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Bahan-bahan: Fish meal, Shrimp meal, Soyabean meal, Wheat flour, Yeasts, Vitamin A, C, D3, E, K, B2, B6, B12, Kalsium D, Mineral, Antioxidant, Spirulina.&lt;/span&gt;&lt;/p&gt;', 1, '2022-04-09 09:51:28'),
(10, 1, 3, 'Vitarab', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;VITARAB makanan ikan.\r\nSpesial makanan ikan cupang. Terbuat dari bermacam macam tumbuhan dan bahan alami lain nya. \r\nDi tambah vitamin khusus untuk ikan cupang. &lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 09:53:29'),
(11, 1, 6, 'Kayu Apung Buatan', '&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Bahan: kayu&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Warna: warna kayu&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Bentuk pengiriman acak (jika Anda membeli lebih dari satu produk, bentuk mungkin berbeda atau sama)&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Terbuat dari kayu alami dan tidak membahayakan ikan&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Sempurna untuk hiasan akuarium dan tangki ikan&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Terbuat dari akar kayu padat&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Dapat digunakan untuk dekorasi lanskap mikro, lansekap&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Dapat juga digunakan untuk kotak crawler, lansekap akuarium&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Atau digunakan untuk menanam rumput, bundling moss, dll&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-size: 24px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;comic sans ms&amp;quot;;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-size: 14px; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Menjadikan akuarium Anda lebih&lt;/span&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-size: 14px; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Jelas, dan nyaman&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Karena ukurannya semakin besar, mungkin ada lebih banyak cabang&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Ukuran: sekitar. 7-17cm(XS) 10-20cm(S) 15-25cm(M)&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Ukuran diukur secara manual, dan kami mengukur produk sesuai dengan sampel yang kami miliki dalam stok, sehingga mungkin ada kesalahan&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Maaf atas masalah yang terjadi pada Anda, terima kasih atas pengertian Anda&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Tidak ada paket eceran&lt;/span&gt;&lt;/div&gt;&lt;div style=&quot;box-sizing: content-box; -webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; font-family: &amp;quot;Open Sans&amp;quot;, Roboto, Arial, Helvetica, sans-serif, SimSun; font-size: 14px;&quot;&gt;&lt;span style=&quot;-webkit-tap-highlight-color: transparent; outline: 0px; margin: 0px; padding: 0px; max-width: 100%; word-break: break-word; font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Jumlah: 1 buah&lt;/span&gt;&lt;/div&gt;', 1, '2022-04-09 09:57:54'),
(12, 1, 6, 'Batu Koral', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;Batu Koral Pancawarna adalah batu hias yang sangat cocok dijadikan sebagai hiasan aquarium / aquascape, hiasan pot tanaman ataupun lapisan lantai / dinding. Sama halnya dengan batu koral kupang putih, koral pancawarna juga berasal dari lautan yang terbentuk secara alami.\r\n\r\nKarakteristik dan Keunggulan Batu Koral Pancawarna:\r\n- Bentuknya unik dan terdiri dari beberapa kombinasi warna yang berbeda.\r\n- Berukuran sekitar 3 - 7 mm.\r\n- Teksturnya sangat halus dan berkilau.\r\n- Mampu memberikan kesan minimalis pada taman / halaman rumah.\r\n- Dapat memberikan efek luas, serta nuansa dan keindahan yang berbeda pada aquarium. \r\n\r\nDijual per kemasan repack 1 kg.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:03:39'),
(13, 1, 6, 'Akar Bonsai', '&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;font face=&quot;Segoe UI&quot;&gt;Akar Bonsai aquascape, murah, kualitas ok&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;font face=&quot;Segoe UI&quot;&gt;Berat : 200 gram&lt;/font&gt;&lt;/p&gt;', 1, '2022-04-09 10:11:22'),
(14, 1, 6, 'Lava Rock Aquascape', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;Batu lava rock atau lava rough,\r\ncocok buat dekorasi atau hiasan di aquascape atau aquarium, karena mengandung substrate dan nutrisi yang baik bagi tumbuhan.\r\nWarna hitam dan merah, dikirim sesuai stok atau boleh didiskusikan dulu sebelum membeli.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;di timbang berdasarkan berat (1kg)&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;tidak ada ukuran spesifik&lt;/span&gt;&lt;br&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;banyaknya tergantung size dari batu&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 18px; margin-left: 0px; padding: 0px; font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;harga per 1 kg&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:17:34'),
(15, 1, 6, 'Batu Fosil Pasir', '&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Batu fosil pasir&lt;/span&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;per kilo&lt;/span&gt;&lt;br style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;br style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, sans-serif; font-size: 14px;&quot;&gt;cocok banget untuk aquarium aquascape&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:26:18'),
(16, 1, 6, 'Pineapple House Fish', '&lt;p style=&quot;line-height: 1;&quot;&gt;Bahan: Resin&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Ukuran: 8cmx7cmx12cm&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Terdapat 1-3 cm perbedaan karena pengukuran manual.&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:36:04'),
(17, 1, 7, 'Aquarium Mini Portable', '&lt;p style=&quot;line-height: 1.2;&quot;&gt;&lt;font face=&quot;Segoe UI&quot;&gt;&lt;span style=&quot;font-size: 14px; white-space: pre-wrap;&quot;&gt;Bahan :  mika rigid \r\nAda 2 ukuran : &lt;/span&gt;&lt;/font&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1.2;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;-ukrn tinggi 28cm dan diameter 12cm harga 120K\r\n-ukrn tinggi 35cm dan diameter 16cm hrga 145K\r\nKelengkapan : &lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1.2;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;-Lampu led 3 watt\r\n- Mesin aerator/gelembung udara\r\n-selang udara &amp;amp; batu gel udara\r\n-batu hias &amp;amp; background hiasan dll&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:43:54'),
(18, 1, 7, 'Hexagon Mini Aquascape', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;Bisa diletakkan di dinding atau diletakkan di meja\r\n\r\nSize :\r\nukuran (panjang x lebar x tinggi) Akuarium (dari mulut aquarium) 19.5 cm x 6 cm x 8 cm\r\nukuran Frame kayu hexagon 22,5 x 19,5 x 7 cm\r\ncocok untuk cupang/udang/aquascape/ tanaman air\r\n\r\nisi paket\r\n1 x aquarium akrilik 2mm\r\n1 x Frame kayu + lampu LED\r\n1 x Baterai&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 10:48:25'),
(19, 1, 7, 'Hanging Aquarium', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; white-space: pre-wrap;&quot;&gt;Hanging Aquarium\r\nSpesifikasi:\r\nBahan: Acrylic\r\nKetebalan: 2mm\r\nDiameter: +/- 20cm\r\nKapasitas Air: 1.8L\r\nBagian Belakang Warna Random Tergantung Stok&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 11:07:36'),
(20, 1, 7, 'Aquarium Ikan Cupang Bulat', '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;DLX Glass khusus dalam memproduksi produk kaca buatan tangan, yang terdiri dari dispenser dan toples dengan kualitas tinggi untuk berbagai jenis minuman dan makanan.&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Tinggi. : 110mm&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;Diamtr : 1&lt;/span&gt;48mm&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;Vol. : 1.4 liter&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;DLX Glass memiliki :&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;- Kualitas kaca yang lebih bening, tebal dan kuat&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt;-&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;;&quot;&gt; Memiliki design yang elegan dan bervariasi&lt;/span&gt;&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;- Dilengkap dengan karet seal agar kedap udara&lt;/span&gt;&lt;br style=&quot;box-sizing: inherit; color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;- Aman dengan mesin cuci piring&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 23:01:03'),
(21, 1, 7, 'EECOO USB Desktop Aquarium', '&lt;p style=&quot;line-height: 1.2;&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Aquarium dengan ukuran mini ini ditenagai hanya dengan USB. Anda dapat menghias meja kerja Anda dengan menaruh aquarium mini. Memiliki pompa air, desk lamp dan tempat alat tulis.&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Features&lt;span style=&quot;color: rgb(255, 255, 255); font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(63, 71, 78); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;&quot;&gt;Features&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Mini Aquarium&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Memiliki bentuk yang kecil hanya 220 x 110 x 145 mm. Cocok untuk diletakkan di meja.&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;Digital Display&lt;br style=&quot;&quot;&gt;Terdapat digital display pada bagian samping aquarium, digital display ini menampilkan informasi seperti tanggal, jam, hari, kalender, dll.&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;USB Powered&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;Ditenagai dengan USB sehingga hemat energy. Cukup mencolok aquarium ini ke laptop/PC Anda dan aquarium ini sudah bekerja.&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Water Pump and Desk Lamp&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;Pompa air untuk menyaring air agar tetap bersih dan tahan lama. Desk lamp untuk menerangi meja kerja Anda.&lt;/span&gt;&lt;br style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Package Contents&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;1 x USB Desktop Aquarium Mini Fish Tank with Running Water - LS0404&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI&amp;quot;; font-size: 14px;&quot;&gt;Material Plastik&lt;/span&gt;&lt;br style=&quot;color: rgba(49, 53, 59, 0.96); font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: &amp;quot;open sans&amp;quot;, tahoma, sans-serif; font-size: 14px;&quot;&gt;Dimensi 220 X 110 X 145 Mm&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 23:10:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Fish', '&lt;p&gt;Fighting Fish&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Fish Food', '&lt;p&gt;Fish food and vitamins&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 1, 'Accessories', '&lt;p&gt;Aquarium ornaments&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 09:26:10'),
(7, 1, 'Aquarium', '&lt;p&gt;Aquariums of various shapes and sizes&lt;br&gt;&lt;/p&gt;', 1, '2022-04-09 09:27:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Laga-Laga Store'),
(6, 'short_name', 'LAGA-LAGA STORE'),
(11, 'logo', 'uploads/1649436840_logo laga laga store.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1649436840_R.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
