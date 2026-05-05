CREATE DATABASE TokoMandiri;
GO
USE TokoMandiri;
GO

CREATE TABLE Barang (
	Kode_Barang CHAR(5) PRIMARY KEY, -- Karakteristik: Kunci Utama
	Nama_Barang VARCHAR(50) NOT NULL,
	Harga_Satuan INT,
	Stok INT
);

CREATE TABLE Pelanggan (
	ID_Pelanggan CHAR(5) PRIMARY KEY,
	Nama_Pelanggan VARCHAR(50) NOT NULL,
	Alamat VARCHAR(100)
);

CREATE TABLE Penjualan (
	No_Faktur CHAR(10) PRIMARY KEY,
	Tgl_Transaksi DATE,
	ID_Pelanggan CHAR(5),
	Kode_Barang CHAR(5),
	Jumlah_Beli INT,
	-- Definisi Foreign Key sebagai penghubung relasi
	CONSTRAINT FK_Pelanggan FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan),
	CONSTRAINT FK_Barang FOREIGN KEY (Kode_Barang) REFERENCES Barang(Kode_Barang)
);

-- Mengisi Data Barang
INSERT INTO Barang VALUES ('B001', 'Buku Tulis', 5000, 100), ('B002', 'Pena Biru', 3000, 50),
('B003', 'Penghapus', 2000, 80), ('B004', 'Penggaris', 4000, 40);
-- Mengisi Data Pelanggan
INSERT INTO Pelanggan VALUES ('P001', 'Budi Santoso', 'Medan'), ('P002', 'Ani Wijaya',
'Binjai'), ('P003', 'Citra', 'Deli Serdang'), ('P004', 'Dedi', 'Medan');

