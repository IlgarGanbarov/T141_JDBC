USE sys;

/*===============================================
		TABLO GORUNTULEME - SELECT
===============================================*/

/*
 SELECT komutu, SQL'de veritabanından veri sorgulamak ve almak için
 kullanılan temel bir komuttur. Bu komut, belirtilen kriterlere uygun
 verileri seçmek ve görüntülemek için kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi;
*/

/*  ========================  SORU-1 ========================
            Kitaplar tablosunu goruntuleyiniz.
    =========================================================
 */

SELECT * FROM kitaplar;

-- SQL Syntax yapisi gunluk konusma diline yaklastirilmaya calisiliyor.
-- SQL Syntax yapisini okudugunuzda mantikli bir cumle elde edebilirsiniz.

/*  ========================  SORU-2 ========================
			Personel tablosunu goruntuleyiniz.
    =========================================================
 */

SELECT * FROM personel;

/*===============================================
		  TABLOYA VERI GIRISI - INSERT
===============================================*/

/*-------------------- NOT -------------------------
   Degerleri girerken dikkat edilmesi gerekenler;
1- Tabloyu olustururken hangi data type belirlediysek o
   datatype cinsinden veri girisi yapmaliyiz
2- String ifadeleri 'tek tirnak' icinde yaziyoruz.
3- DATE data type'da String gibi 'tek tirnak' icinde yazilir.
4- MySQL'in default tarih formati YYYY-MM-DD seklindedir.
--------------------------------------------------*/

/*-------------------- NOT -------------------------
 1- Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
   table olustururken field isminin yanina UNIQUE yaziyoruz.
 2- Bir field kaydedilecek verilerde NULL olmasin istiyorsak
   table olustururken field isminin yanina NOT NULL yaziyoruz.
--------------------------------------------------*/

/*
*************** SYNTAX ***************
INSERT INTO table_name (columns)
	VALUES (
	std_id ,           
	std_name ,     
	std_age 				  
	);

*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosuna null deger olmadan bir veri girisi saglayiniz.
    =========================================================
 */

INSERT INTO kitaplar (kitap_id,kitap_adi,yazar_adi,yayin_yili,kategori)
VALUES(1, 'Sefiller', 'Victor Hugo', '1862', 'Roman');

SELECT * FROM kitaplar;

/*  ========================  SORU-2 ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO kitaplar (kitap_id, kitap_adi, yazar_adi, yayin_yili, kategori)
				VALUES(2,'Suc ve Ceza', 'Dostoyevski', '1866', 'Roman'),
					  (3, 'Bu Ulke', 'Cemil Meric', '1974', 'Roman'),
                      (4, 'Nutuk', 'M.Kemal ATATURK', '1927', 'Soylev');

SELECT * FROM kitaplar;

-- *NOT! SQL kullanirken alacaginiz hatalarin %85 SYNTAX hatalaridir.


/*  ========================  SORU-3 ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO personel (personel_id,adi,soyadi,dogum_tarihi,pozisyon,maas)
            VALUES(1,'Gulpembe','Gemicioglu','1999','QA',10000000.00),
				  (2,'Recep','Alici','1999','Product Owner',25000000.00),
				  (3,'Jane','Doe','1999','Developer',15000000.00);
 
SELECT * FROM personel;

/*  ========================  SORU-4 ========================
 ogrenciler tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */

INSERT INTO ogrenciler (ogrenci_id,ogrenci_adi,ogrenci_soyadi,bolum,kayit_yili,not_ortalama)
VALUES (1001, 'Murat', 'CINAR', 'Bilgisayar Muhendisligi', 2005, 4.0 ),
       (1002, 'Ilgar', 'GANBAROV', 'Insaat MUhendisligi', 2007, 3.7),
       (1003, 'Gulpembe', 'KAYA', 'Endustri Muhendisligi', 2009, 4.0);

SELECT * FROM ogrenciler;

/*  ========================  EXTRA ========================
 personel tablosuna id, isim ve soyisim degerleri girerek bir veri girisi yapiniz.
    =========================================================
 */
 
 INSERT INTO personel (personel_id,adi,soyadi)
				VALUES(4, 'Bugra', 'COKCALISIR');

SELECT * FROM personel;

-- Eger tablodaki sutunlarda bir constraint(kisitlama) yok ise 
-- tablodan sadece istedigimiz sutunlara veri gonderebiliriz.





























