-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Apr 2024 pada 07.49
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusweb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(40) NOT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `jk` varchar(30) DEFAULT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `tgllahir` varchar(50) DEFAULT NULL,
  `umur` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `foto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_lengkap`, `notelp`, `jk`, `tempat`, `tgllahir`, `umur`, `alamat`, `foto`) VALUES
('A0001', 'Riko Sanjaya', '085736507106', 'Laki-laki', 'Semarang', '09/15/2001', '23', 'Perum Villa Siberi', 'hacker-3342696.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(20) DEFAULT NULL,
  `id_kategori` varchar(20) DEFAULT NULL,
  `id_penerbit` varchar(20) DEFAULT NULL,
  `id_rak` varchar(20) DEFAULT NULL,
  `judul` varchar(60) DEFAULT NULL,
  `pengarang` varchar(60) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `jmlhal` int(4) DEFAULT NULL,
  `jmlbuku` int(4) DEFAULT NULL,
  `tahun` int(5) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `foto` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) DEFAULT NULL,
  `kategori` varchar(40) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `keterangan`) VALUES
('K0001', 'Programing', ''),
('K0004', 'Fiction', ''),
('K0006', 'Romance', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` varchar(10) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `id_anggota` varchar(5) DEFAULT NULL,
  `tempo` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `usr_input` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` varchar(20) DEFAULT NULL,
  `penerbit` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `penerbit`, `keterangan`) VALUES
('P0002', 'Tiara Andini', ''),
('P0003', 'Bagas Rudi', ''),
('P0004', 'Asep Susanto', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengadaan`
--

CREATE TABLE `pengadaan` (
  `id_pengadaan` varchar(10) DEFAULT NULL,
  `id_buku` varchar(60) DEFAULT NULL,
  `asal_buku` varchar(60) DEFAULT NULL,
  `jml` int(4) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `tgl` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengadaan`
--

INSERT INTO `pengadaan` (`id_pengadaan`, `id_buku`, `asal_buku`, `jml`, `ket`, `tgl`) VALUES
('PNG0001', 'B0003', 'Sumedang', 5, '-', '2020-04-15'),
('PNG0002', 'B0002', 'Sumedang', 6, '-', '2020-04-22'),
('PNG0003', 'B0001', 'Sumedang', 6, '-', '2020-04-21'),
('PNG0004', 'B0004', 'Sumedang', 5, '-', '2020-09-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_kembali` int(10) NOT NULL,
  `tgl_kembali` varchar(20) DEFAULT NULL,
  `id_pinjam` varchar(20) DEFAULT NULL,
  `terlambat` varchar(15) DEFAULT NULL,
  `denda` varchar(15) DEFAULT NULL,
  `id_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_user` varchar(20) NOT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `notelp` varchar(13) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT NULL,
  `level` enum('Petugas','Kepala','Administrasi') DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id_user`, `nama`, `email`, `pass`, `notelp`, `status`, `level`, `foto`) VALUES
('U0001', 'Admin', 'admin@gmail.com', 'admin123', '087892878222', 'Aktif', 'Administrasi', 'user.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `p_buku`
--

CREATE TABLE `p_buku` (
  `id_pbuku` int(5) NOT NULL,
  `id_pinjam` varchar(50) DEFAULT NULL,
  `id_buku` varchar(50) DEFAULT NULL,
  `qty` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `id_rak` varchar(20) DEFAULT NULL,
  `rak` varchar(60) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rak`
--

INSERT INTO `rak` (`id_rak`, `rak`, `keterangan`) VALUES
('Rak-01', 'Khusus Pemula', ''),
('Rak-02', 'Khusus Pelajar', ''),
('Rak-03', 'Sastra', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_kembali`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `p_buku`
--
ALTER TABLE `p_buku`
  ADD PRIMARY KEY (`id_pbuku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_kembali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `p_buku`
--
ALTER TABLE `p_buku`
  MODIFY `id_pbuku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
