-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Apr 2024 pada 06.09
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ridho`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(10) NOT NULL,
  `tgl_pengaduan` datetime NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `tgl_pengaduan`, `isi_laporan`, `foto`, `status`, `petugas_id`) VALUES
(1, '2024-04-19 00:00:00', 'qwe', '1.png', '0', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id` int(10) NOT NULL,
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `level` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id`, `nik`, `nama`, `username`, `password`, `telp`, `level`) VALUES
(1, '12121212', 'erre', 'rirun', '$2y$10$PQNTi/j5f3Bm0qn2nLmoouJx1iO9EEBfRzIgkpFU6r4qIq9UkcoSO', '9789786', 'masyarakat'),
(2, '1233', 'rrrr', 'rp', '$2y$10$Mi373VHLv7ZGtbElpNqj/utf/h4EZhuE.5zmzjAjJcE3toPnX.TEC', '12', 'masyarakat'),
(3, '098', 'rejj', 'tej', '$2y$10$WzPTWdo3R1mWNBXC.VMKaey.NtQ6STu3pA3hED6JCTGn45.FRhAhS', '0864436789', 'masyarakat'),
(4, '456', 'rei', 'dff', '$2y$10$3CqhT8Mu71G8xunt9IjTF.lzhV7GTFZFppZ2PfjC5w/.rtFCyfvYW', '97897860', 'masyarakat'),
(5, '34567', 'magic', 'meca', '$2y$10$Y08nOUz5BF8LVW09naAx2etOJ0lYsPvhJozxv.idVrCQ6PPGZDwHC', '0864436734', 'masyarakat'),
(6, '345678', 'santoso', 'santos', '$2y$10$kFVBiGZUMz89FiYUEjCn2eAy7kqKWrirj.E/1l.D9a854If7Zow1u', '1234666', 'petugas'),
(7, '678', 'pett', 'tet', '$2y$10$0i3c9ekcS1BUh60hPjCoQuxjFfdHxvvbIkpUp7v0KIzA9RolxNQOi', '08567432488', 'masyarakat'),
(8, '12346677', 'tiara', 'ridhosyahputra', '$2y$10$sYTZfk.4QnHneJITEm486.rvtoSyWHKmVKZcA6XEmxvrrvA.zs3qi', '', '9');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(10) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `isi_laporan` varchar(1000) NOT NULL,
  `pengaduan_id` int(10) NOT NULL,
  `petugas_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `tgl_tanggapan`, `isi_laporan`, `pengaduan_id`, `petugas_id`) VALUES
(1, '2222-02-22', 'qwe', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpengaduan52247` (`petugas_id`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `FKtanggapan374346` (`pengaduan_id`),
  ADD KEY `FKtanggapan340580` (`petugas_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `FKpengaduan52247` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `FKtanggapan340580` FOREIGN KEY (`petugas_id`) REFERENCES `petugas` (`id`),
  ADD CONSTRAINT `FKtanggapan374346` FOREIGN KEY (`pengaduan_id`) REFERENCES `pengaduan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
