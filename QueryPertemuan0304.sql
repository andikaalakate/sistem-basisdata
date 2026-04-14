-- Query masuk ke database
USE db_siakad;

-- Membuat Tabel Program Studi
CREATE TABLE tbl_prodi (
	kode_prodi VARCHAR(10) NOT NULL PRIMARY KEY,
	nama_prodi VARCHAR(50) NOT NULL,
	fakultas VARCHAR(50) NOT NULL
);

-- Membuat Tabel Mahasiswa (Transaksi/Entitas dan Relasi)
-- Menghubungkan kode_prodi pada tbl_mahasiswa ke tbl_mahasiswa
CREATE TABLE tbl_mahasiswa (
	nim	VARCHAR(15) NOT NULL PRIMARY KEY,
	nama_lengkap VARCHAR(100) NOT NULL,
	alamat VARCHAR(255),
	kode_prodi VARCHAR(10),
	FOREIGN KEY (kode_prodi) REFERENCES tbl_prodi(kode_prodi)
);

-- Memasukkan Data ke Tabel Program Studi
INSERT INTO tbl_prodi 
	(kode_prodi, nama_prodi, fakultas)
VALUES
	('SI', 'Sistem Informasi', 'Fakultas Teknologi'),
	('IF', 'Teknik Informatika', 'Fakultas Teknologi'),
	('TI', 'Teknologi Informasi', 'Fakultas Teknologi');

-- Memasukkan Data ke Tabel Mahasiswa
INSERT INTO tbl_mahasiswa
	(nim, nama_lengkap, alamat, kode_prodi)
VALUES
	('2025001', 'Andi Susanto', 'Jl. Merdeka No. 10', 'SI'),
	('2025002', 'Budi Raharjo', 'Jl. Sudirman No. 5', 'TI'),
	('2025003', 'Citra Kirana', 'Jl. Gatot Subroto No. 8', 'IF');

-- Menampilkan seluruh data mahasiswa
SELECT * FROM tbl_mahasiswa;

-- Menampilkan hanya kolom NIM dan Nama
SELECT nim, nama_lengkap FROM tbl_mahasiswa;

-- Menampilkan mahasiswa yang hanya dari prodi 'SI'
SELECT * FROM tbl_mahasiswa WHERE kode_prodi = 'SI';

-- Update alamat pada data yang dimana nim nya adalah 2025001
UPDATE tbl_mahasiswa
	SET alamat = 'Jl. Diponegoro No. 12'
WHERE nim = '2025001';

-- DELETE data Budi, karena dia mengundurkan diri
DELETE FROM tbl_mahasiswa
WHERE nim = '2025002';

-- Tugas Praktikum
CREATE TABLE tbl_matakuliah (
	kode_mk VARCHAR(10) NOT NULL PRIMARY KEY,
	nama_mk VARCHAR(50) NOT NULL,
	sks TINYINT NOT NULL
);

INSERT INTO tbl_matakuliah
	(kode_mk, nama_mk, sks)
VALUES
	('PSIF2205', 'Sistem Basis Data', 3),
	('PSIF2207', 'Algoritma dan Struktur Data', 3),
	('PSIF2209', 'Statistika dan Probabilitas', 2),
	('PSIF2210', 'Aljabar Linear', 2),
	('PSIF2211', 'Manajemen Proses Bisnis', 2);

SELECT * FROM tbl_matakuliah;
SELECT * FROM tbl_matakuliah WHERE sks = 3;

UPDATE tbl_matakuliah
	SET nama_mk = 'Linear Algebra'
WHERE kode_mk = 'PSIF2210';