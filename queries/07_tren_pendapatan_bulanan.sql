-- Pertanyaan 7: Bagaimana tren pendapatan dari bulan ke bulan?
-- Menggunakan window function LAG() untuk menghitung persentase perubahan
-- dibanding bulan sebelumnya.
-- Catatan: data bulan terakhir (Agustus 2026) tidak lengkap satu bulan penuh,
-- sehingga penurunan tajam di bulan tersebut bukan mencerminkan kondisi bisnis riil.

SELECT 
    DATE_TRUNC('month', t.Tanggal_Waktu) AS bulan,
    SUM(t.KWh_Terpakai * l.Tarif_Per_KWh) AS total_pendapatan,
    ROUND(
        100.0 * (SUM(t.KWh_Terpakai * l.Tarif_Per_KWh) - LAG(SUM(t.KWh_Terpakai * l.Tarif_Per_KWh)) OVER (ORDER BY DATE_TRUNC('month', t.Tanggal_Waktu)))
        / LAG(SUM(t.KWh_Terpakai * l.Tarif_Per_KWh)) OVER (ORDER BY DATE_TRUNC('month', t.Tanggal_Waktu)),
        2
    ) AS persen_perubahan
FROM Data_Transaksi t
JOIN Dimensi_Layanan l ON t.ID_Layanan = l.ID_Layanan
GROUP BY bulan
ORDER BY bulan;
