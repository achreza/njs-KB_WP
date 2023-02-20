-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_kb
CREATE DATABASE IF NOT EXISTS `db_kb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_kb`;

-- Dumping structure for table db_kb.alternatif
CREATE TABLE IF NOT EXISTS `alternatif` (
  `id_alternatif` int(11) NOT NULL AUTO_INCREMENT,
  `nm_alternatif` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_alternatif`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table db_kb.alternatif: ~6 rows (approximately)
/*!40000 ALTER TABLE `alternatif` DISABLE KEYS */;
INSERT INTO `alternatif` (`id_alternatif`, `nm_alternatif`) VALUES
	(1, 'AKDR'),
	(2, 'AKBK'),
	(3, 'Kontrasepsi Mantap'),
	(4, 'Pil'),
	(5, 'Suntik'),
	(6, 'Kondom'),
	(7, 'KB Alamiah');
/*!40000 ALTER TABLE `alternatif` ENABLE KEYS */;

-- Dumping structure for table db_kb.bobot
CREATE TABLE IF NOT EXISTS `bobot` (
  `id_bobot` int(11) NOT NULL AUTO_INCREMENT,
  `id_kriteria` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_bobot`),
  KEY `id_kriteria` (`id_kriteria`),
  CONSTRAINT `FK_bobot_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table db_kb.bobot: ~7 rows (approximately)
/*!40000 ALTER TABLE `bobot` DISABLE KEYS */;
INSERT INTO `bobot` (`id_bobot`, `id_kriteria`, `value`) VALUES
	(1, 1, '5'),
	(2, 2, '2'),
	(3, 3, '3'),
	(4, 4, '6'),
	(5, 5, '1'),
	(6, 6, '1'),
	(7, 7, '7');
/*!40000 ALTER TABLE `bobot` ENABLE KEYS */;

-- Dumping structure for table db_kb.kriteria
CREATE TABLE IF NOT EXISTS `kriteria` (
  `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kriteria` varchar(50) DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_kriteria`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table db_kb.kriteria: ~6 rows (approximately)
/*!40000 ALTER TABLE `kriteria` DISABLE KEYS */;
INSERT INTO `kriteria` (`id_kriteria`, `nm_kriteria`, `jenis`) VALUES
	(1, 'Metode', 'Benefit'),
	(2, 'Efektifitas', 'Benefit'),
	(3, 'Efek Samping', 'Cost'),
	(4, 'Pengembalian Kesuburan', 'Benefit'),
	(5, 'Harga', 'Cost'),
	(6, 'Pemasangan', 'Biaya'),
	(7, 'Kenyamanan saat berhubungan', 'Cost');
/*!40000 ALTER TABLE `kriteria` ENABLE KEYS */;

-- Dumping structure for table db_kb.matrixkeputusan
CREATE TABLE IF NOT EXISTS `matrixkeputusan` (
  `id_matrix` int(11) NOT NULL AUTO_INCREMENT,
  `id_alternatif` int(11) NOT NULL DEFAULT '0',
  `id_bobot` int(11) NOT NULL DEFAULT '0',
  `id_skala` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_matrix`),
  KEY `id_bobot` (`id_bobot`),
  KEY `id_alternatif` (`id_alternatif`),
  KEY `id_skala` (`id_skala`),
  CONSTRAINT `FK__alternatif` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__bobot` FOREIGN KEY (`id_bobot`) REFERENCES `bobot` (`id_bobot`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__skala` FOREIGN KEY (`id_skala`) REFERENCES `skala` (`id_skala`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

-- Dumping data for table db_kb.matrixkeputusan: ~1 rows (approximately)
/*!40000 ALTER TABLE `matrixkeputusan` DISABLE KEYS */;
INSERT INTO `matrixkeputusan` (`id_matrix`, `id_alternatif`, `id_bobot`, `id_skala`) VALUES
	(17, 1, 1, 2),
	(18, 1, 2, 3),
	(19, 1, 3, 2),
	(20, 1, 4, 3),
	(21, 1, 5, 2),
	(22, 1, 6, 2),
	(23, 1, 7, 2),
	(24, 2, 1, 2),
	(25, 2, 2, 3),
	(26, 2, 3, 2),
	(27, 2, 4, 3),
	(28, 2, 5, 2),
	(29, 2, 6, 2),
	(30, 2, 7, 1),
	(31, 3, 1, 2),
	(32, 3, 2, 3),
	(33, 3, 3, 1),
	(34, 3, 4, 1),
	(35, 3, 5, 3),
	(36, 3, 6, 3),
	(37, 3, 7, 1),
	(38, 4, 1, 1),
	(39, 4, 2, 2),
	(41, 4, 3, 2),
	(42, 4, 4, 2),
	(43, 4, 5, 2),
	(44, 4, 6, 1),
	(45, 4, 7, 1),
	(47, 5, 1, 1),
	(50, 5, 2, 2),
	(51, 5, 3, 2),
	(55, 5, 4, 2),
	(56, 5, 5, 2),
	(57, 5, 6, 2),
	(58, 5, 7, 1),
	(59, 6, 1, 1),
	(60, 6, 2, 2),
	(61, 6, 3, 1),
	(62, 6, 4, 3),
	(63, 6, 5, 2),
	(64, 6, 6, 1),
	(65, 6, 7, 2),
	(66, 7, 1, 1),
	(67, 7, 2, 1),
	(68, 7, 3, 1),
	(69, 7, 4, 3),
	(70, 7, 5, 1),
	(71, 7, 6, 1),
	(72, 7, 7, 1);
/*!40000 ALTER TABLE `matrixkeputusan` ENABLE KEYS */;

-- Dumping structure for view db_kb.nilaimax
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `nilaimax` (
	`id_kriteria` INT(11) NOT NULL,
	`nm_kriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`maksimum` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table db_kb.skala
CREATE TABLE IF NOT EXISTS `skala` (
  `id_skala` int(11) NOT NULL AUTO_INCREMENT,
  `nm_skala` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_skala`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_kb.skala: ~3 rows (approximately)
/*!40000 ALTER TABLE `skala` DISABLE KEYS */;
INSERT INTO `skala` (`id_skala`, `nm_skala`, `value`) VALUES
	(1, '1', '1'),
	(2, '2', '2'),
	(3, '3', '3');
/*!40000 ALTER TABLE `skala` ENABLE KEYS */;

-- Dumping structure for view db_kb.vmatrixkeputusan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vmatrixkeputusan` (
	`id_matrix` INT(11) NOT NULL,
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kriteria` INT(11) NOT NULL,
	`nm_kriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jenis` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`id_bobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nm_skala` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.vnormalisasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vnormalisasi` (
	`id_matrix` INT(11) NOT NULL,
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kriteria` INT(11) NOT NULL,
	`nm_kriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jenis` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`id_bobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nm_skala` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.vprangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vprangking` (
	`id_matrix` INT(11) NOT NULL,
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kriteria` INT(11) NOT NULL,
	`nm_kriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jenis` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`id_bobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nm_skala` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi` DOUBLE NULL,
	`prangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.vrangking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vrangking` (
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`rangking` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_jumbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_jumbobot` (
	`jumlah` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_nilais
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilais` (
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilaiS` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_nilaiv
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_nilaiv` (
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilaiV` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_normalisasiterbobot
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_normalisasiterbobot` (
	`id_bobot` INT(11) NOT NULL,
	`id_kriteria` INT(11) NOT NULL,
	`value` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`jumlah` DOUBLE NULL,
	`normalisasi_w` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_pangkat
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_pangkat` (
	`id_matrix` INT(11) NOT NULL,
	`id_alternatif` INT(11) NOT NULL,
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`id_kriteria` INT(11) NOT NULL,
	`nm_kriteria` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jenis` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`id_bobot` INT(11) NOT NULL,
	`value` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilai` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`nm_skala` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`normalisasi_w` DOUBLE NULL,
	`pangkat` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_ranking
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_ranking` (
	`nm_alternatif` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`nilaiV` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.wp_sums
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `wp_sums` (
	`jum` DOUBLE NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_kb.nilaimax
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `nilaimax`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `nilaimax` AS SELECT id_kriteria, nm_kriteria,MAX(nilai) AS maksimum FROM vmatrixkeputusan GROUP BY id_kriteria ;

-- Dumping structure for view db_kb.vmatrixkeputusan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vmatrixkeputusan`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vmatrixkeputusan` AS SELECT matrixkeputusan.id_matrix, alternatif.*,kriteria.*,bobot.id_bobot,bobot.value,
skala.value AS nilai, skala.nm_skala FROM matrixkeputusan,skala,bobot,kriteria,
alternatif WHERE matrixkeputusan.id_alternatif=alternatif.id_alternatif AND
matrixkeputusan.id_bobot = bobot.id_bobot AND matrixkeputusan.id_skala = skala.id_skala
AND kriteria.id_kriteria = bobot.id_kriteria ;

-- Dumping structure for view db_kb.vnormalisasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vnormalisasi`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vnormalisasi` AS SELECT vmatrixkeputusan.*,(vmatrixkeputusan.nilai/nilaimax.maksimum) AS normalisasi FROM vmatrixkeputusan,nilaimax WHERE nilaimax.id_kriteria = vmatrixkeputusan.id_kriteria GROUP BY vmatrixkeputusan.id_matrix ;

-- Dumping structure for view db_kb.vprangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vprangking`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vprangking` AS SELECT vnormalisasi.*,(vnormalisasi.value*vnormalisasi.normalisasi) AS prangking FROM vnormalisasi GROUP BY vnormalisasi.id_matrix ;

-- Dumping structure for view db_kb.vrangking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vrangking`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vrangking` AS SELECT id_alternatif,nm_alternatif,SUM(prangking) AS rangking FROM vprangking GROUP BY id_alternatif ;

-- Dumping structure for view db_kb.wp_jumbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_jumbobot`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_jumbobot` AS SELECT SUM(VALUE) AS jumlah FROM bobot ;

-- Dumping structure for view db_kb.wp_nilais
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilais`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_nilais` AS SELECT id_alternatif,nm_alternatif, EXP(SUM(LOG(wp_pangkat.pangkat))) AS nilaiS FROM wp_pangkat GROUP BY id_alternatif ;

-- Dumping structure for view db_kb.wp_nilaiv
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_nilaiv`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_nilaiv` AS SELECT wp_nilais.id_alternatif,wp_nilais.nm_alternatif, (nilaiS/jum) AS nilaiV FROM wp_nilais,wp_sums ;

-- Dumping structure for view db_kb.wp_normalisasiterbobot
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_normalisasiterbobot`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_normalisasiterbobot` AS SELECT bobot.*, wp_jumbobot.jumlah,(bobot.value/wp_jumbobot.jumlah) AS normalisasi_w FROM bobot, wp_jumbobot ;

-- Dumping structure for view db_kb.wp_pangkat
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_pangkat`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_pangkat` AS SELECT vmatrixkeputusan.*, wp_normalisasiterbobot.normalisasi_w, POW(vmatrixkeputusan.nilai,wp_normalisasiterbobot.normalisasi_w) AS pangkat FROM vmatrixkeputusan,wp_normalisasiterbobot WHERE wp_normalisasiterbobot.id_kriteria = vmatrixkeputusan.id_kriteria ;

-- Dumping structure for view db_kb.wp_ranking
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_ranking`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_ranking` AS SELECT wp_nilais.nm_alternatif, (nilaiS/jum) AS nilaiV FROM wp_nilais,wp_sums ORDER BY nilaiV DESC ;

-- Dumping structure for view db_kb.wp_sums
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `wp_sums`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `wp_sums` AS SELECT SUM(wp_nilais.nilaiS) AS jum FROM wp_nilais ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
