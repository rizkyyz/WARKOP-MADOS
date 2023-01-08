-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2019 at 06:45 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msyifaudzihni`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_order`
--

CREATE TABLE `detail_order` (
  `id_detail_order` int(10) NOT NULL,
  `id_order` varchar(10) NOT NULL,
  `id_masakan` varchar(10) NOT NULL,
  `keterangan` varchar(20) NOT NULL,
  `status_detail_order` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_order`
--

INSERT INTO `detail_order` (`id_detail_order`, `id_order`, `id_masakan`, `keterangan`, `status_detail_order`) VALUES
(1, 'ORD-5758', '2', '1', 'Ditempat'),
(2, 'ORD-1321', '3', '2', 'Ditempat'),
(3, 'ORD-5035', '3', '2', 'Ditempat'),
(4, 'ORD-1233', '4', '3', 'Delivery'),
(5, 'ORD-1600', '6', '2', 'Ditempat'),
(6, 'ORD-1818', '5', '3', 'Ditempat'),
(7, 'ORD-0154', '2', '2', 'Ditempat'),
(8, 'ORD-0154', '3', '2', 'Ditempat'),
(9, 'ORD-2517', '1', '5', 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(10) NOT NULL,
  `nama_level` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `nama_level`) VALUES
(1, 'Admin'),
(2, 'Waiter'),
(3, 'Kasir'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `masakan`
--

CREATE TABLE `masakan` (
  `id_masakan` varchar(10) NOT NULL,
  `nama_masakan` varchar(30) NOT NULL,
  `harga` int(20) NOT NULL,
  `status_masakan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `masakan`
--

INSERT INTO `masakan` (`id_masakan`, `nama_masakan`, `harga`, `status_masakan`) VALUES
('1', 'Ayam Rendang', 180000, 'Tersedia'),
('2', 'Capcay', 20000, 'Tersedia'),
('3', 'Gulai Ayam', 10000, 'Kosong'),
('4', 'Tempe Pecak', 6000, 'Tersedia'),
('5', 'Mie kenyol', 8000, 'Kosong'),
('6', 'Sayur Lodeh', 3000, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` varchar(10) NOT NULL,
  `no_meja` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `status_order` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id_order`, `no_meja`, `tanggal`, `id_user`, `keterangan`, `status_order`) VALUES
('ORD-0154', '12', '2019-02-25', 'USR001', '2', 'Ditempat'),
('ORD-1233', 'null', '2019-02-21', 'USR001', '3', 'Delivery'),
('ORD-1321', '3', '2019-02-21', 'USR002', '2', 'Ditempat'),
('ORD-1600', '7', '2019-02-21', 'USR002', '2', 'Ditempat'),
('ORD-1818', '2', '2019-02-21', 'USR005', '3', 'Ditempat'),
('ORD-2517', 'null', '2019-02-27', 'USR001', '5', 'Delivery'),
('ORD-5035', '1', '2019-02-21', 'USR001', '2', 'Ditempat'),
('ORD-5758', '2', '2019-02-21', 'USR001', '1', 'Ditempat');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `id_order` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_order`, `tanggal`, `total_bayar`) VALUES
(1, 'USR003', 'ORD-5035', '2019-02-21', 20000),
(2, 'USR003', 'ORD-1233', '2019-02-21', 18000),
(3, 'USR001', 'ORD-5035', '2019-02-27', 20000),
(4, 'USR003', 'ORD-5758', '2019-02-27', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_user` varchar(25) NOT NULL,
  `id_level` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `id_level`) VALUES
('USR001', 'admin', 'admin', 'Suherman', 1),
('USR002', 'waiter', 'waiter', 'Sucipto', 2),
('USR003', 'kasir', 'kasir', 'Surendra', 3),
('USR004', 'owner', 'owner', 'Slamet', 4),
('USR005', 'pelanggan', 'pelanggan', 'Diana', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`id_detail_order`),
  ADD KEY `fk` (`id_masakan`),
  ADD KEY `fsfvsdd` (`id_order`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `masakan`
--
ALTER TABLE `masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `fdrw` (`id_user`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `dfd` (`id_order`),
  ADD KEY `er` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `id_detail_order` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD CONSTRAINT `fk` FOREIGN KEY (`id_masakan`) REFERENCES `masakan` (`id_masakan`),
  ADD CONSTRAINT `fsfvsdd` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fdrw` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `dfd` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`),
  ADD CONSTRAINT `er` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
