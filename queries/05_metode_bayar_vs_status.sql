-- Pertanyaan 5: Metode pembayaran apa yang paling sering dipakai,
-- dan apakah berkorelasi dengan status bayar?

SELECT 
    t.Metode_Bayar,
    COUNT(*) AS total_transaksi,
    COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') AS jumlah_bermasalah,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE t.Status_Bayar != 'Lunas') / COUNT(*), 
        2
    ) AS persen_bermasalah
FROM Data_Transaksi t
GROUP BY t.Metode_Bayar
ORDER BY total_transaksi DESC;
