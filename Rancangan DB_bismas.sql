-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jan 2019 pada 13.56
-- Versi server: 5.7.21-log
-- Versi PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bismas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` varchar(20) NOT NULL,
  `namaadmin` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `nohp_admin` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `namaadmin`, `email`, `nohp_admin`) VALUES
('A123', 'Bima Sakti', 'bimakuru7@gmail.com', 89532);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(20) NOT NULL,
  `namabis` varchar(20) DEFAULT NULL,
  `waktukeberangkatan` int(6) DEFAULT NULL,
  `waktukedatangan` int(6) DEFAULT NULL,
  `id_admin` varchar(20) DEFAULT NULL,
  `tujuan` varchar(20) DEFAULT NULL,
  `asal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `namabis`, `waktukeberangkatan`, `waktukedatangan`, `id_admin`, `tujuan`, `asal`) VALUES
('J123', 'Bis XYZ', 9, 8, 'A123', 'Garut', 'Bandung'),
('J124', 'Bis ABC', 9, 10, 'A123', 'Sumedang', 'Bandung');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(20) NOT NULL,
  `id_pemesanan` varchar(20) DEFAULT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` varchar(20) DEFAULT NULL,
  `metodepembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pemesanan`, `nama`, `tanggal`, `nominal`, `metodepembayaran`) VALUES
('BYR1', '01', 'Reza Siahaan', '2019-02-03', 'Rp.50.000', 'transfer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesan`
--

CREATE TABLE `pemesan` (
  `id_pemesan` varchar(20) NOT NULL,
  `namalengkap` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nohp_pemesan` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesan`
--

INSERT INTO `pemesan` (`id_pemesan`, `namalengkap`, `email`, `nohp_pemesan`) VALUES
('123X', 'Reza Siahaan', 'rezasin@gmail.com', 8291379);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` varchar(20) NOT NULL,
  `id_pemesan` varchar(20) DEFAULT NULL,
  `id_jadwal` varchar(20) DEFAULT NULL,
  `lokasiasal` varchar(20) DEFAULT NULL,
  `lokasitujuan` varchar(20) DEFAULT NULL,
  `waktu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id_pemesanan`, `id_pemesan`, `id_jadwal`, `lokasiasal`, `lokasitujuan`, `waktu`) VALUES
('01', '123X', 'J123', 'bandung', 'garut', '2019-02-01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `pemesan`
--
ALTER TABLE `pemesan`
  ADD PRIMARY KEY (`id_pemesan`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_pemesan` (`id_pemesan`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`id_pemesanan`);

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_pemesan`) REFERENCES `pemesan` (`id_pemesan`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
