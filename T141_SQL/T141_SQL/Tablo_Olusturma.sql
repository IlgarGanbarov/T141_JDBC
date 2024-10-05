Use sys;

-- Uzerinde calistigimiz SQl File'in hangi Schema'ya ait oldugunu belirtmek icin 
-- Use sys; komutunu kullandik.

-- Bu bir yorum satiridir.

/*
Bu bir yorum blogudur.
*/

-- *NOT! MySQL Workbanch'te kodlari yazmamiz yeterli degildir.
-- Mutlaka o kodlari calistirmamiz gerekir.

/*===============================================
		TABLO OLUSTURMA (CRUD - Create)
===============================================*/

/*
"CREATE TABLE" bir veritabanında yeni bir tablo oluşturmak için kullanılan 
bir SQL (Structured Query Language) ifadesidir. Bu komut, tablonun yapısını 
tanımlar; yani tabloda bulunacak sütunların isimlerini, veri tiplerini ve diğer 
özelliklerini (örneğin, Primary Key, Unique, Not Null  vb.) belirtir. 
"CREATE TABLE" komutunu kullanırken, her bir sütun için uygun veri tipini ve 
boyutunu belirlemek ve gerektiğinde sütunlara kısıtlamalar eklemek önemlidir. 
Bu işlem, veri bütünlüğünü korumak ve veritabanı işlemlerinin doğru şekilde 
çalışmasını sağlamak için kritik öneme sahiptir.
*/

/*
*************** SYNTAX ***************
CREATE TABLE tablo_adi 
(
    sütun1 veri_tipi1 ,
    sütun2 veri_tipi2 ,
    ...
    sütunN veri_tipiN ,
);

*/

/*  ========================  SORU-1 ========================
 Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori columnlari
 olan bir kitaplar tablosu create ediniz. 
    =========================================================
 */
 
 CREATE TABLE kitaplar1
 (
	kitap_id INT,
    kitap_adi VARCHAR(50),
    yazar_adi VARCHAR(30),
    yayin_yili CHAR(4),
    kategori VARCHAR(20)
 );

-- SQL isimlendirme yapilirken snake_case kullanilir.
-- SQL yaziminda buyuk kucuk harf duyarsizdir. 
-- Ancak Database icin genel kullanim kurali Komut ifadelerinin buyuk harfle yazilmasidir.

CREATE TABLE kitaplar (kitap_id INT,kitap_adi VARCHAR(50),yazar_adi VARCHAR(30),yayin_yili CHAR(4),kategori VARCHAR(20));

-- Bir baska SQL teamulu olarak her komut farkli satirlara gelecek sekilde yazilmalidir. 


/*  ========================  SORU-2 ========================
 Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon, maas columnlari
 olan bir personel tablosu create ediniz. 
    =========================================================
 */
 
 CREATE TABLE personel
 (
	personel_id INT,
    adi VARCHAR(30),
    soyadi VARCHAR(20),
    dogum_tarihi YEAR,
    pozisyon VARCHAR(20),
    maas DOUBLE(10,2)
 );
 
 
/*  ========================  SORU-3 ========================
 Icerisinde ogrenci id, adi, soyadi, bolum, kayit yili, ortalama not 
 columnlari olan bir ogrenciler tablo create ediniz. 
    =========================================================
 */
 
 CREATE TABLE ogrenciler
 (
 ogrenci_id INT,
 ogrenci_adi CHAR(30),
 ogrenci_soyadi VARCHAR(20),
 bolum VARCHAR(30),
 kayit_yili INT,
 not_ortalama DOUBLE
 );
 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
















