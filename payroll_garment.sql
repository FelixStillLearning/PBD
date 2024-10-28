-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for payroll garmen
DROP DATABASE IF EXISTS `payroll garmen`;
CREATE DATABASE IF NOT EXISTS `payroll garmen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `payroll garmen`;

-- Dumping structure for table payroll garmen.akun
DROP TABLE IF EXISTS `akun`;
CREATE TABLE IF NOT EXISTS `akun` (
  `Username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `id_karyawan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `FK1id_karyawan_to_user` (`id_karyawan`),
  CONSTRAINT `FK1id_karyawan_to_user` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id_department` int NOT NULL DEFAULT '0',
  `nama_department` varchar(50) NOT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.gaji
DROP TABLE IF EXISTS `gaji`;
CREATE TABLE IF NOT EXISTS `gaji` (
  `id_gaji` char(10) NOT NULL,
  `Periode` varchar(50) NOT NULL,
  `pajak` varchar(50) NOT NULL,
  `potongan` float NOT NULL,
  `id_karyawan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_gaji`),
  KEY `FK1id_karyawan` (`id_karyawan`),
  CONSTRAINT `FK1id_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.golongan
DROP TABLE IF EXISTS `golongan`;
CREATE TABLE IF NOT EXISTS `golongan` (
  `kode_golongan` int NOT NULL,
  `Gaji_pokok` int DEFAULT NULL,
  `Uang_makan` int DEFAULT NULL,
  `Uang_transportasi` int DEFAULT NULL,
  PRIMARY KEY (`kode_golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.jabatan
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE IF NOT EXISTS `jabatan` (
  `Kode_Jabatan` int NOT NULL,
  `Nama_jabatan` varchar(50) NOT NULL,
  `tunj_tunjangan` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode_Jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.karyawan
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_karyawan` char(10) NOT NULL,
  `Nama_Karyawan` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `id_department` int NOT NULL,
  `kode_golongan` int NOT NULL,
  `Kode_Jabatan` int NOT NULL,
  PRIMARY KEY (`id_karyawan`),
  KEY `FK1d_department` (`id_department`),
  KEY `FK2kode_golongan` (`kode_golongan`),
  KEY `FK3kode_jabatan` (`Kode_Jabatan`),
  CONSTRAINT `FK1d_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK2kode_golongan` FOREIGN KEY (`kode_golongan`) REFERENCES `golongan` (`kode_golongan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK3kode_jabatan` FOREIGN KEY (`Kode_Jabatan`) REFERENCES `jabatan` (`Kode_Jabatan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.penilaian
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE IF NOT EXISTS `penilaian` (
  `no_form` int NOT NULL,
  `nilai1` int DEFAULT NULL,
  `nilai2` int DEFAULT NULL,
  `rata-rata` float NOT NULL,
  `id_karayawan` char(10) NOT NULL,
  KEY `FK1Poin_penilaian` (`no_form`),
  KEY `FK_penilaian_karyawan` (`id_karayawan`),
  CONSTRAINT `FK1Poin_penilaian` FOREIGN KEY (`no_form`) REFERENCES `poin_penilaian` (`no_form`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_penilaian_karyawan` FOREIGN KEY (`id_karayawan`) REFERENCES `karyawan` (`id_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table payroll garmen.poin_penilaian
DROP TABLE IF EXISTS `poin_penilaian`;
CREATE TABLE IF NOT EXISTS `poin_penilaian` (
  `no_form` int NOT NULL,
  `periode` char(10) DEFAULT NULL,
  `Keterangan` varchar(50) NOT NULL,
  PRIMARY KEY (`no_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
