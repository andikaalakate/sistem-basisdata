-- Membuat Database Toko Online
CREATE DATABASE db_toko_online;

-- Masuk ke dalam Database Toko Online
USE db_toko_online;

-- Membuat Tabel Penjual
CREATE TABLE penjual (
	email VARCHAR(100) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL
);

-- Membuat Tabel Barang
CREATE TABLE barang (
	sku VARCHAR(50) PRIMARY KEY,
	nama_barang VARCHAR(100),
	harga_awal INT,
	stok INT,
	email_penjual VARCHAR(100),

	FOREIGN KEY (email_penjual) REFERENCES penjual(email)
);

-- Membuat Tabel Pembeli
CREATE TABLE pembeli (
	email VARCHAR(100) PRIMARY KEY,
	nama VARCHAR(100),
	alamat TEXT
);

-- Membuat Tabel Pembelian untuk Relasi Many-to-Many yang menampung
-- Foreign Key dari Pembeli dan Barang serta atribut deskriptif 'Jumlah'
CREATE TABLE pembelian (
	id_transaksi INT PRIMARY KEY IDENTITY(1,1),
	email_pembeli VARCHAR(100),
	sku_barang VARCHAR(50),
	jumlah INT,

	FOREIGN KEY (email_pembeli) REFERENCES pembeli(email),
	FOREIGN KEY (sku_barang) REFERENCES barang(sku)
);

-- Mengubah nama kolom 'harga_awal' menjadi 'harga'
EXEC sp_rename 'barang.harga_awal', 'harga', 'COLUMN';

-- Menambah Kolom baru pada Tabel Pembeli, yaitu kolom 'no_hp'
ALTER TABLE pembeli ADD no_hp VARCHAR(15);

-- Insert Data
-- Menambahkan Data ke Tabel Penjual
INSERT INTO penjual (email, nama)
	VALUES ('budi@toko.com', 'Budi Mart');

-- Menambahkan Data ke Tabel Barang
INSERT INTO barang (sku, nama_barang, harga, stok, email_penjual)
	VALUES ('LP01', 'Laptop Asus', 7500000, 10, 'budi@toko.com');

-- Menambahkan Data ke Tabel Pembeli
INSERT INTO pembeli (email, nama, alamat)
	VALUES ('fahmi@email.com', 'Fahmi Ruziq', 'Medan');

-- Update Data Pembeli dengan email = fahmi@email.com, ditambah data no_hp
UPDATE pembeli
	SET no_hp = '085212345678'
WHERE email = 'fahmi@email.com';

-- Menambahkan Data ke Tabel Pembelian
INSERT INTO pembelian (email_pembeli, sku_barang, jumlah)
	VALUES ('fahmi@email.com', 'LP01', 1);

-- Menampilkan semua Tabel
SELECT * FROM penjual;
SELECT * FROM pembeli;
SELECT * FROM barang;
SELECT * FROM pembelian;

-- Menampilkan Data menggunakan Inner Join
SELECT
	pembelian.id_transaksi,
	pembeli.nama,
	pembelian.sku_barang,
	barang.nama_barang,
	pembelian.jumlah,
	barang.harga,
	penjual.nama
FROM pembelian
	INNER JOIN barang
		ON pembelian.sku_barang = barang.sku
	INNER JOIN pembeli
		ON pembelian.email_pembeli = pembeli.email
	INNER JOIN penjual
		ON penjual.email = barang.email_penjual;

SELECT
	pembeli.nama,
	barang.nama_barang,
	pembelian.jumlah
FROM pembeli
	INNER JOIN pembelian
		ON pembeli.email = pembelian.email_pembeli
	INNER JOIN barang
		ON pembelian.sku_barang = barang.sku;

-- Mengubah Data Barang menggunakan Query UPDATE
UPDATE barang SET harga = 7200000 WHERE SKU = 'LP01';

-- Menghapus Data Pembelian menggunakan Query DELETE
DELETE FROM pembelian WHERE id_transaksi = 1;

-- Tugas Praktikum
-- Menambahkan masing-masing 3 Data lagi
INSERT INTO pembeli (email, nama, alamat, no_hp)
VALUES 
	('andikaalakate@gmail.com', 'Andika Pratama', 'Kolam', '089505722187'),
	('kurokidaizaya@gmail.com', 'Kuroki Daizaya', 'Jakarta', '083831489934'),
	('shirotaenozomi@gmail.com', 'Shirotae Nozomi', 'Kolam', '085206124895');

CREATE TABLE dompet (
	id_dompet INT PRIMARY KEY IDENTITY(1,1),
	no_rekening VARCHAR(20),
	email_pembeli VARCHAR(100),
	saldo INT,

	CONSTRAINT fk_email_pembeli FOREIGN KEY (email_pembeli) REFERENCES pembeli(email),
);