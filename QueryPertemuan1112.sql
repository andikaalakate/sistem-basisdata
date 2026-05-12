USE db_toko_online;

SELECT
	b.nama_barang AS Nama_Barang,
	b.harga,
	p.nama AS Nama_Toko
FROM barang b
	INNER JOIN penjual p ON b.email_penjual = p.email;

SELECT
	tr.id_transaksi,
	pb.nama AS Nama_Pembeli,
	br.nama_barang AS Nama_Barang,
	tr.jumlah
FROM pembelian tr
	INNER JOIN pembeli pb ON tr.email_pembeli = pb.email
	INNER JOIN barang br ON tr.sku_barang = br.sku;

SELECT
	pembelian.id_transaksi,
	pembeli.nama AS Pembeli,
	barang.nama_barang AS Produk,
	penjual.nama AS Toko_Penjual
FROM pembelian
	INNER JOIN barang ON pembelian.sku_barang = barang.sku
	INNER JOIN pembeli ON pembelian.email_pembeli = pembeli.email
	INNER JOIN penjual ON barang.email_penjual = penjual.email;

SELECT
	p.id_transaksi,
	b.nama_barang AS Nama_Barang,
	p.jumlah,
	b.harga AS Harga_Satuan,
	(p.jumlah * b.harga) AS Total_Bayar
FROM pembelian p
	INNER JOIN barang b ON p.sku_barang = b.sku;

SELECT
	pb.nama AS Nama_Pembeli,
	br.nama_barang AS Produk_Dibeli
FROM pembelian tr
	INNER JOIN pembeli pb ON tr.email_pembeli = pb.email
	INNER JOIN barang br ON tr.sku_barang = br.sku
WHERE pb.nama = 'Kuroki Daizaya';
