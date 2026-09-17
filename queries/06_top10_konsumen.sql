-- Pertanyaan 6: Siapa 10 pelanggan dengan konsumsi kWh tertinggi?

SELECT 
    p.ID_Pelanggan,
    p.Segmen_Pelanggan,
    SUM(t.KWh_Terpakai) AS total_kwh
FROM Data_Transaksi t
JOIN Dimensi_Pelanggan p ON t.ID_Pelanggan = p.ID_Pelanggan
GROUP BY p.ID_Pelanggan, p.Segmen_Pelanggan
ORDER BY total_kwh DESC
LIMIT 10;
