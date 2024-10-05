USE sys;

/*===============================================
		  TABLOYU DEGISTIRME - ALTER TABLE
===============================================*/

/*ALTER TABLE ifadesi, SQL'de mevcut bir veritabanı tablosunun 
yapısını değiştirmek için kullanılır. Bu komut sayesinde, tabloya
 yeni sütunlar ekleyebilir, mevcut sütunları değiştirebilir veya silebilir,
 sütunların veri türlerini güncelleyebilir, sütunlara kısıtlamalar (constraints)
 ekleyebilir veya mevcut kısıtlamaları kaldırabilirsiniz. 
 */

/*===============================================
		   ALTER TABLE - Sutun Ekleme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
ADD sütun_adi + dataType;
*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosuna sayfa sayisi column'i ekleyiniz.
    =========================================================
 */

-- before

SELECT * FROM kitaplar;

ALTER TABLE kitaplar
ADD sayfa_sayisi INT;

-- after
SELECT * FROM kitaplar;

/*  ========================  SORU-2 ========================
 Kitaplar tablosuna fiyat column'i ekleyiniz.
    =========================================================
 */ 
 
 ALTER TABLE kitaplar
 ADD fiyat DOUBLE;
 
 SELECT * FROM kitaplar;
 
 
/*  ========================  SORU-3 ========================
       Personel tablosuna sehir column'i ekleyiniz 
    =========================================================
 */
 
 ALTER TABLE personel
	ADD sehir VARCHAR(20);
    
    
 /*===============================================
ALTER TABLE - Sütunun Veri Türünü Değiştirme
===============================================*/   
   
/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
MODIFY COLUMN  sütun_adi + yeniDataType;
*/   
    
/*  ========================  SORU-4 ========================
  Ogrenciler tablosundaki ogrenci_adi column'inin data type'ini degistiriniz.
    =========================================================
 */     
    
    ALTER TABLE ogrenciler
    MODIFY COLUMN ogrenci_adi VARCHAR(30);
 
 
 /*  ========================  SORU-5 ========================
 Ogrenciler tablosundaki kayit yili column'inin data type'ini degistiriniz .
    =========================================================
 */
 
 ALTER TABLE ogrenciler
MODIFY COLUMN kayit_yili YEAR;
 
 
/*===============================================
		ALTER TABLE - Sütun Adını Değiştirme
===============================================*/
/* 
 
 *
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
RENAME COLUMN  eskiSütunAdi TO yeniSütunAdi;
*/
 
 /*  ========================  SORU-6 ========================
 Personel tablosundaki pozisyon column'in adini sorumluluk 
 olarak degistiriniz.
    =========================================================
 */
 
 -- before
 
 SELECT * FROM personel;
 
 ALTER TABLE personel
 RENAME COLUMN pozisyon 
 TO sorumluluk;
 

-- after
 
 SELECT * FROM personel;

/*  ========================  SORU-7 ========================
 Ogrenciler tablosundaki ogrenci_adi column'in adini 
 ogrenci_ismi olarak degistiriniz.
    =========================================================
 */

ALTER TABLE ogrenciler
RENAME COLUMN ogrenci_adi
TO ogrenci_ismi;


/*  ========================  SORU-8 ========================
 Ogrenciler tablosundaki soyadi column'in adini 
 lastname olarak degistiriniz.
    =========================================================
 */

 SELECT * FROM ogrenciler;
 
 ALTER TABLE ogrenciler
 RENAME COLUMN ogrenci_soyadi 
 TO lastname;
 
 -- after
  SELECT * FROM ogrenciler1;


/*===============================================
      ALTER TABLE - Sütun Silme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi 
DROP COLUMN  sütun_adi;
*/


/*  ========================  SORU-8 ========================
 Ogrenciler tablosundaki ogrenci_id column'ini siliniz.
    =========================================================
 */

ALTER TABLE ogrenciler
DROP COLUMN ogrenci_id;

SELECT * FROM ogrenciler;

/*  ========================  SORU-10 ========================
 Kitaplar tablosundaki sayfa sayisi column'ini siliniz.
    =========================================================
 */

SELECT * FROM kitaplar;

ALTER TABLE kitaplar
DROP COLUMN sayfa_sayisi;

















