-- Pertanyaan 4: Berapa persentase transaksi bermasalah (telat/nunggak) per wilayah?
-- "Bermasalah" = Status_Bayar selain 'Lunas'

SELECT 
    a.Nama_Area,
    COUNT(*) AS total_transaksi,
    COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') AS jumlah_bermasalah,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') / COUNT(*), 
        2
    ) AS persen_bermasalah
FROM Data_Transaksi t
JOIN Dimensi_Area a ON t.ID_Area = a.ID_Area
GROUP BY a.Nama_Area
ORDER BY persen_bermasalah DESC;
