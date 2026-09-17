-- Pertanyaan 2: Wilayah mana yang menyumbang pendapatan terbesar?

SELECT 
    a.Nama_Area,
    SUM(t.KWh_Terpakai * l.Tarif_Per_KWh) AS total_pendapatan
FROM Data_Transaksi t
JOIN Dimensi_Area a ON t.ID_Area = a.ID_Area
JOIN Dimensi_Layanan l ON t.ID_Layanan = l.ID_Layanan
GROUP BY a.Nama_Area
ORDER BY total_pendapatan DESC;
