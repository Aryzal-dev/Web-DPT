-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2020 pada 19.34
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wpu_login`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kecamatan`
--

CREATE TABLE `data_kecamatan` (
  `id` int(11) NOT NULL,
  `kecamatan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_kecamatan`
--

INSERT INTO `data_kecamatan` (`id`, `kecamatan`) VALUES
(1, 'Sabbang Selatan'),
(2, 'Sabbang'),
(3, 'Baebunta Selatan'),
(4, 'Baebunta'),
(5, 'Masamba'),
(6, 'Mappadeceng'),
(7, 'Sukamaju'),
(8, 'Sukamaju Selatan'),
(9, 'Bone-Bone'),
(10, 'Tanalili'),
(15, 'Malangke'),
(16, 'Malangke Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kelurahan`
--

CREATE TABLE `data_kelurahan` (
  `id` int(11) NOT NULL,
  `kelurahan` varchar(128) NOT NULL,
  `kecamatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_kelurahan`
--

INSERT INTO `data_kelurahan` (`id`, `kelurahan`, `kecamatan_id`) VALUES
(5, 'Tete Uri', 1),
(6, 'Batu Alang', 1),
(7, 'Bone Subur', 1),
(8, 'Mari-Mari', 1),
(9, 'Pompaniki', 1),
(11, 'Kalotok', 1),
(12, 'Kampung Baru', 1),
(13, 'Dandang', 1),
(14, 'Buangin', 1),
(15, 'Terpedo Jaya', 1),
(17, 'Buntu Terpedo', 2),
(18, 'Bakka', 2),
(19, 'Sabbang', 2),
(20, 'Malimbu', 2),
(21, 'Marobo', 2),
(22, 'Pararra', 2),
(23, 'Pakendekan', 2),
(24, 'Salama', 2),
(25, 'Tandung', 2),
(26, 'Tulak Tallu', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pemilih_tetap`
--

CREATE TABLE `data_pemilih_tetap` (
  `id` int(11) NOT NULL,
  `nik` varchar(128) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `tanggal_lahir` varchar(128) NOT NULL,
  `kecamatan_id` int(11) NOT NULL,
  `kelurahan_id` int(11) NOT NULL,
  `tps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_pemilih_tetap`
--

INSERT INTO `data_pemilih_tetap` (`id`, `nik`, `nama`, `tanggal_lahir`, `kecamatan_id`, `kelurahan_id`, `tps`) VALUES
(1, '7371101501940004', 'yusrifar', '15011994', 1, 5, 2),
(2, '7371101501940003', 'Asmaliah', '22122004', 5, 5, 3),
(4, '7371101501940002', 'Dwi Purnomo', '27072998', 6, 5, 4),
(5, '7371101501940004', 'yusrifar', '15011994', 1, 6, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(14, 'rian', 'rian@gmail.com', 'default.jpg', '$2y$10$DK4BK0w9uEp5koq2GaoUF.E.k4NhaxX1Q1UJx3OlVlv.R4xByk2PO', 1, 1, 1566451356),
(15, 'yusripark', 'ukmpkcorong@gmail.com', 'default.jpg', '$2y$10$Jd3rEZXTPYvauBWCMhTJZuMIfnSR7CaOAHDaBwQ2kyZKoD6WEc.gu', 2, 1, 1591718999);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 1, 5),
(6, 2, 5),
(7, 1, 6),
(8, 2, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(5, 'Data Pemilih'),
(6, 'Kecamata dan Kelurahan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'administrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile\r\n', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(8, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(9, 5, 'DPT', 'datapemilihtetap', 'fas fa-fw fa-user-edit', 1),
(12, 6, 'Kecamatan', 'datakecamatankelurahan', 'fas fa fw fa-user-edit', 1),
(13, 6, 'Kelurahan', 'datakecamatankelurahan/kelurahan', 'fas fa fw fa-user-edit', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(7, 'yusriparktula@gmail.com', 'ktRMHiwfLEy2Wr2OYWJ2eMdnx1+JjaK/d0PS9JOcXss=', 1557455918),
(8, 'daenggaming15@gmail.com', 'LEaIANZJujD6bTYCQNTQllshDdjuydpbWBTv9Hi7WrE=', 1557456321),
(9, 'daenggaming15@gmail.com', 'qtDMaAqxgYEqMdz16asTK6fJ006q5kgwH45dTCU9EXs=', 1557456333),
(10, 'daenggaming15@gmail.com', 'nHN97kiINj1e9m8Mr8j7bVGFV356X7o50LLo20DFubI=', 1557456454),
(11, 'daenggaming15@gmail.com', 'RRe92swVomd1A1LFM1RUpbW7usI5aBJjKpGm13n85GI=', 1557456740),
(12, 'yusriparktula@gmail.com', '3BVx2sab+h6eyD1ToktF0VBD10Y/nqFZ6BBDGvEI/Fw=', 1561015496),
(13, 'ullaputrapratama@gmail.com', 'aGi3nDuE0xnMqFMvU+rnasxe7uveBMZP+59zEvbtPks=', 1561132628),
(14, 'rian@gmail.com', 'V8QEpUH2TJAozlcMXDJipRayPsqeW0O9fVBRbZzHbsM=', 1566451356),
(15, 'ukmpkcorong@gmail.com', 't7LIPZ+Gt4AlejIUKn5Ajcuqh/UoX1yGcKGj8+rSERU=', 1591718999),
(16, 'pusjilal@gmail.com', 'FMGQFb00bW/SfkOX+W74/aQREKz/5zREP66JslwuDKk=', 1591730036),
(17, 'pusjilal2@gmail.com', '7CKkUAjRigM42cpZ9zmc/muWUhlucuxLPwksdbheJ0k=', 1591730117);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_kecamatan`
--
ALTER TABLE `data_kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_kelurahan`
--
ALTER TABLE `data_kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_pemilih_tetap`
--
ALTER TABLE `data_pemilih_tetap`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_kecamatan`
--
ALTER TABLE `data_kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `data_kelurahan`
--
ALTER TABLE `data_kelurahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `data_pemilih_tetap`
--
ALTER TABLE `data_pemilih_tetap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
