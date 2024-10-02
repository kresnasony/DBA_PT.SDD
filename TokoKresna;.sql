/*Membuat Database */
CREATE DATABASE TokoKresna;
GO

Use TokoKresna;

/*Membuat Table */
CREATE TABLE BARANG (
    id_barang INT PRIMARY KEY IDENTITY(1,1),
    nama_barang VARCHAR(255) NOT NULL,
    kategori VARCHAR(255) NOT NULL,
    jumlah INT NOT NULL,
    keterangan VARCHAR(1000) NOT NULL
);
go

CREATE TABLE PEMBELI(
    id_pembeli INT PRIMARY KEY IDENTITY(1,1),
    nama_pembeli VARCHAR(255) NOT NULL,
    nomor_identitas VARCHAR(255) NOT NULL,
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin in ('L','P')),
    alamat VARCHAR(1000) NOT NULL,
    nomor_hp VARCHAR(20) NOT NULL
);
go

CREATE TABLE TOKO (
    id_toko INT PRIMARY KEY IDENTITY(1,1),
    nama_toko VARCHAR(255) NOT NULL,
    alamat_toko VARCHAR(1000) NOT NULL
);
go

CREATE TABLE PENJUALAN (
    id_penjualan INT PRIMARY KEY IDENTITY(1,1),
    id_barang INT,
    id_pembeli INT,
    id_toko INT,
    jumlah_beli INT NOT NULL,
    tanggal_beli DATETIME NOT NULL,
    lokasi_toko INT,
    FOREIGN KEY (id_barang) REFERENCES dbo.BARANG(id_barang),
    FOREIGN KEY (id_pembeli) REFERENCES dbo.PEMBELI(id_pembeli),
    FOREIGN KEY (lokasi_toko) REFERENCES dbo.TOKO(id_toko)
);
go

/*Membuat index untuk mempercepat query */
CREATE INDEX idx_barang ON dbo.Penjualan(id_barang);
CREATE INDEX idx_pembeli ON dbo.Penjualan(id_pembeli);
CREATE INDEX idx_tanggal ON dbo.Penjualan(tanggal_beli);
CREATE INDEX idx_lokasi ON dbo.Penjualan(lokasi_toko);

