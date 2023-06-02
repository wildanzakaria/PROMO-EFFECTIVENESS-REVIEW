# PROMO-EFFECTIVENESS-REVIEW
## Jubelio x Rakamin Academy
<br>
## CASE :<br>
Setiap 6 Bulan sekali (Akhir Semester) Omnichannel Jubelio mengadakan Promo Effectiveness Review, untuk melihat efektivitas dari PROMO CODE terhadap total penjualan dari salah satu marketplace. <br>
Sebagai reporting engineer ada beberapa Task yang perlu anda lakukan. <br>
1.	Mengaplikasikan Promo Code dari Tim Budgeting. <br>
2.	Membuat Table Laporan Khusus Quartal ke 3 dan 4. <br>
3.	Melakukan Summary dan Visualisasi dari Hasil Data Table Quartal ke 3 dan 4. <br>
4.	Membuat Shipping Label Khusus Bulan December.<br>
<br>
Untuk menjawab pertanyaan 1 sampai 3.<br>
1.	Buat database jubelio di RDBMS postgreSQL. <br>
2.	Import file Task5_DB yang berisi buyer_table, marketplace_table, sales_table, seller_table, shipping_table ke dalam database jeblio. <br>
3.	Import juga promo_code.csv ke dalam database yang sama. <br>
Query :  <br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/raw/main/gambar/1.png) <br>
4.	Buat table Q3_Q4_Review menggunakan 'CTE' dan 'INSERT with SELECT STATEMENT'. Table Q3_Q4_Review berisi kolom purchase_date, total_price, promo_code, discount, sales_after_promo. <br>
Note: <br>
Total_price = quantity (sales_tabel) x price (marketplace_table) <br>
sales_after_promo = (quantity (sales_tabel) x price (marketplace_table)) -(price_deduction as discount (promo_code)) <br>
kolom discount dan promo_code IS NOT NULL <br>
Query : <br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/raw/main/gambar/2.png) <br>
4.	Export table Q3_Q4_Review dan buat visualisasi menggunakan Microsoft Excel. <br>
Result table Q3_Q4_Review :<br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/raw/main/gambar/3.png) <br>
Untuk melihat ratio pengguna yang memakai kode promo dan tidak memakai kode promo, Tambahkan kolom ratio pada tabel Q3_Q4_Review dengan mengubah kode promo selain kode promo TANPA_PROMO menjadi APPLY_PROMO.<br>
Query: <br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/raw/main/gambar/4.png) <br>
Result:<br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/5.png) <br>
Hasil visualisasi data:<br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/6.png) <br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/7.png) <br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/8.png) <br>
Interpretasi hasil visualisasi:<br>
•	Kode promo bulanan yang ditawarkan AWAL_GAJIAN dan GRATIS_ONGKIR. <br>
•	Penjualan di Q3 mengalami penurunan dan Penjualan di Q4 tidak menentu. <br>
•	Penjualan di akhir Q4 mengalami peningkatan sangat tinggi, hal tersebut mungkin disebabkan karena beragamnya kode promo yang ditawarkan. <br>
Rekomendasi :<br>
•	Meningkatkan jumlah kode promo yang ditawarkan setiap bulannya.<br>
•	Memberikan pengingat notifikasi pada setiap pengguna untuk belanja menggunakan kode_promo.<br>
•	Membuat campaign atau bekerja sama dengan KOL specialist dan influencer untuk mengajak belanja dengan menggunakan kode promo.<br>
<br>
## Untuk membuat shipping label selama bulan desember: <br>
1.	Buat table shipping_summary yang terjadi di bulan desember didatabase yang sama menggunakan 'INSERT with SELECT STATEMENT'. Table berisi kolom shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode dan kode resi. <br>
Noted : <br>
Kode resi didapatkan dengan menggabungkan kolom shipping_id - purchase_date - shipping_date (“YYYYMMDD”) - buyer_id - seller_id).<br>
###Menghubungkan shipping_table dengan seller_table dan buyer_table.<br>
Query :<br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/9.png) <br>
2.	Export dan save hasil table.<br>
Link table : https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/Data%20Result/shipping_summary.csv <br>
3.	Selanjutnya buat label di Microsoft word dengan layout 2 Across dan 5 Down serta format buyer_name, buyer_address, buyer_city, buyer_zipcode, dan kode resi.<br>
Result label_shipping:<br>
![](https://github.com/wildanzakaria/PROMO-EFFECTIVENESS-REVIEW/blob/main/gambar/10.png) <br>
 


