-- Pertanyaan 8: Segmen pelanggan mana yang paling banyak menunggak?

SELECT 
    p.Segmen_Pelanggan,
    COUNT(*) AS total_transaksi,
    COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') AS jumlah_bermasalah,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') / COUNT(*), 
        2
    ) AS persen_bermasalah
FROM Data_Transaksi t
JOIN Dimensi_Pelanggan p ON t.ID_Pelanggan = p.ID_Pelanggan
GROUP BY p.Segmen_Pelanggan
ORDER BY persen_bermasalah DESC;
