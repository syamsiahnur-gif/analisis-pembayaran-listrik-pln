-- ============================================================
-- SCHEMA: Analisis Pembayaran Listrik PLN
-- Struktur: star schema (1 tabel fakta + 3 tabel dimensi)
-- Urutan pembuatan tabel penting: dimensi dibuat lebih dulu
-- karena tabel fakta (Data_Transaksi) mereferensikannya lewat FOREIGN KEY
-- ============================================================

-- Tabel dimensi: data pelanggan
CREATE TABLE Dimensi_Pelanggan (
    ID_Pelanggan VARCHAR(15) PRIMARY KEY,
    Segmen_Pelanggan VARCHAR(20),
    Tahun_Pasang VARCHAR(10)
);

-- Tabel dimensi: data layanan & tarif
CREATE TABLE Dimensi_Layanan (
    ID_Layanan VARCHAR(15) PRIMARY KEY,
    Kategori_Layanan VARCHAR(20),
    Nama_Layanan VARCHAR(50),
    Tarif_Per_KWh NUMERIC
);

-- Tabel dimensi: data wilayah
CREATE TABLE Dimensi_Area (
    ID_Area VARCHAR(15) PRIMARY KEY,
    Nama_Area VARCHAR(20),
    Provinsi VARCHAR(20),
    Koordinat VARCHAR(50)
);

-- Tabel fakta: transaksi pembayaran listrik
-- Terhubung ke ketiga tabel dimensi lewat FOREIGN KEY
CREATE TABLE Data_Transaksi (
    ID_Transaksi VARCHAR(20) PRIMARY KEY,
    Tanggal_Waktu DATE,
    ID_Pelanggan VARCHAR(15) REFERENCES Dimensi_Pelanggan(ID_Pelanggan),
    ID_Layanan VARCHAR(15) REFERENCES Dimensi_Layanan(ID_Layanan),
    ID_Area VARCHAR(15) REFERENCES Dimensi_Area(ID_Area),
    KWh_Terpakai NUMERIC,
    Status_Bayar VARCHAR(20),
    Metode_Bayar VARCHAR(30)
);

