-- Pertanyaan 1: Berapa total pendapatan per bulan?
-- Pendapatan dihitung dari KWh_Terpakai x Tarif_Per_KWh (Dimensi_Layanan)

SELECT 
    DATE_TRUNC('month', t.Tanggal_Waktu) :: DATE AS bulan,
    SUM(t.KWh_Terpakai * l.Tarif_Per_KWh) AS total_pendapatan
FROM Data_Transaksi t
JOIN Dimensi_Layanan l ON t.ID_Layanan = l.ID_Layanan
GROUP BY bulan
ORDER BY bulan;
