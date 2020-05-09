-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2020 at 03:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xml`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(3) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `fakultas` varchar(50) NOT NULL,
  `email_jurusan` varchar(100) NOT NULL,
  `web_jurusan` varchar(50) NOT NULL,
  `no_telepon_jurusan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `fakultas`, `email_jurusan`, `web_jurusan`, `no_telepon_jurusan`) VALUES
(1, 'Sistem Informas', 'FTIK', 'si@usm.ac.id', 'si.usm.ac.id', '0246702757'),
(2, 'Teknik Informatika', 'FTIK', 'ti@usm.ac.id', 'ti.usm.ac.id', '0246702757'),
(3, 'Ilmu Komunikasi', 'FTIK', 'ikom@usm.ac.id', 'ikom.usm.ac.id', '0246702757'),
(4, 'Psikologi', 'Psikologi', 'psikologi@usm.ac.id', 'psiikologi.usm.ac.id', '0246702272');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id` int(3) NOT NULL,
  `kode_mk` varchar(50) NOT NULL,
  `nama_mk` varchar(100) NOT NULL,
  `sks` int(2) NOT NULL,
  `id_prodi` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id`, `kode_mk`, `nama_mk`, `sks`, `id_prodi`) VALUES
(1, 'TISI3639P', 'Rekaya Web', 3, 2),
(2, 'TIS13535P', 'Pemrograman Framework', 4, 2),
(3, 'SIS13418P', 'Desain dan Pemrograman Web', 3, 1),
(4, 'TIS13211P', 'Pengantar Web', 3, 3),
(5, 'IKS13105', 'Pengantar Psikologi', 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
