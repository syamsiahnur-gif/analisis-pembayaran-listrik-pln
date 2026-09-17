-- Pertanyaan 3: Berapa rata-rata konsumsi kWh per segmen pelanggan?

SELECT 
    p.Segmen_Pelanggan,
    ROUND(AVG(t.KWh_Terpakai), 2) AS rata_rata_kwh,
    COUNT(t.ID_Transaksi) AS jumlah_transaksi
FROM Data_Transaksi t
JOIN Dimensi_Pelanggan p ON t.ID_Pelanggan = p.ID_Pelanggan
GROUP BY p.Segmen_Pelanggan
ORDER BY rata_rata_kwh DESC;
