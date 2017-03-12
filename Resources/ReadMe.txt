EXCEL Datalarýnýn Kopyalanmasý
------------------------------
1. Öncelikle tüm excel datalarý Tümü adlý sayfaya kopyalanmalýdýr.
2. Daha sonra Tümü sayfasýndan Ýl-Ýlçe-Semt-Mahalle-PK sayfasýna kopyalanmalýdýr.
	2.1. Tüm sutünlar seçilerek Veri->Yinelenenleri Kaldýr penceresinden Verilerimde üstbilgi var seçeneði seçilerek ayrýþtýrýlmalýdýr.
3. Tümü sayfasýndan Ýl-Ýlçe-Semt sutünlarýný seçerek Ýl-Ýlçe-Semt sayfasýna kopyalanmalýdýr.
	3.1. Tüm sutünlar seçilerek Veri->Yinelenenleri Kaldýr penceresinden Verilerimde üstbilgi var seçeneði seçilerek ayrýþtýrýlmalýdýr.
4. Tümü sayfasýndan Ýl-Ýlçe sutünlarýný seçerek Ýl-Ýlçe sayfasýna kopyalanmalýdýr.
	4.1. Tüm sutünlar seçilerek Veri->Yinelenenleri Kaldýr penceresinden Verilerimde üstbilgi var seçeneði seçilerek ayrýþtýrýlmalýdýr.
5. Tümü sayfasýndan Ýl sutünunu seçerek Ýl sayfasýna kopyalanmalýdýr.
	5.1. Tüm sutünlar seçilerek Veri->Yinelenenleri Kaldýr penceresinden Verilerimde üstbilgi var seçeneði seçilerek ayrýþtýrýlmalýdýr.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

EXCEL'den SQL Server'a Aktarma Ýþlemi
-------------------------------------
1. Countries veritabanýna sað tuþ týklayarak excel import sayfasý açýlmalýdýr.
	1.1. Tasks->Import Data sayfasý açýlmalýdýr.
	1.2. Choose a Data Source sayfasýndan Data Source Microsoft Excel seçilmelidir. Excel yolu ve Excel version MS Excel 2007 seçilmelidir.
	1.3. Choose a Destination sayfasýndan Destination SQL Server Native Client 11.0 seçilmelidir.
	1.4. Specift Table Copy or Query sayfasýnda Copy data from one or more tables or views seçilmelidir.
	1.5. Select Source Tables and Views sayfasýndan Tümü hariç hepsi seçilmelidir.
	1.6. Finish ile aktarým tamamlanmalýdýr.
	1.7. Excel ile kopyalanan datalar eþit mi kontrol edilmelidir.
2. Resources->DataTransfer içerisnden DataTransfer SQL'leri ile data aktarýmlarý yapýlmalýdýr.
	2.1. DataTransfer - Counties çalýþtýrýlmalýdýr.
	2.2. DataTransfer - Area çalýþtýrýlmalýdýr.
	2.3. DataTransfer - Neighborhood çalýþtýrýlmalýdýr.
3. Daha sonra geçici(il, il-ilçe, il-ilçe-semt, il-ilçe-semt-mahalle) tablolar kaldýrýlmasý için Drop_Temp_Tables sorgusu çalýþtýrýlmalýdýr.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

MSSQL'den MySQL'e Aktarma Ýþlemi
--------------------------------
1. MySQL içinden countries veritabaný silinir.
2. Yeniden countries adlý veritabaný oluþturulur.
3. Daha sonra Scripts/MySQL/Countries_Schema.sql dosyasý çalýþtýrýlarak þema yapýsý oluþturulur.
4. CountriesDBTransfer projesi çalýþtýrýlarak MySQL'e aktarým iþlemi baþlatýlýr.
5. phpmyadmin içersinden Dýþa Aktar sekmesinden aktarým iþlemi baþlatýlmalýdýr.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

