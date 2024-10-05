USE sys;

/*================================= SUBQUERY =================================
    Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

CREATE TABLE calisanlar
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');

CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
calisanlar_sayisi int
);
INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT * FROM calisanlar;
SELECT * FROM sirketler;

-- ======================== WHERE ile SUBQUERY ===========================

/*----------------------------------------------------------------
 1) Personel sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/

-- Birinci adim olarak personel sayisi 15.000 den cok olan sirketleri bul.

SELECT sirket 
FROM sirketler
WHERE calisanlar_sayisi > 15000;  -- Sorgu sonucu 'Ford' ve 'Toyota' dondurur.

-- Ikinci adim olarak 'Ford' ve 'Toyota' da calisanlari bul.

SELECT isim 
FROM calisanlar
WHERE sirket IN('Ford','Toyota'); -- Ayse Gul, Veli Yilmaz, Ayse Gul

SELECT isim FROM calisanlar
WHERE sirket IN(SELECT sirket 
				FROM sirketler
				WHERE calisanlar_sayisi > 15000);
                
-- Honda sirketinin calisanlar sayisini 16000 olarak guncelleyiniz                
   
   UPDATE sirketler
   SET calisanlar_sayisi = 16000
   WHERE sirket = 'Honda';
   
   SELECT isim FROM calisanlar
WHERE sirket IN(SELECT sirket 
				FROM sirketler
				WHERE calisanlar_sayisi > 15000);
   
                
-- Ford sirketinin calisanlar sayisini 13000 olarak guncelleyiniz                

UPDATE sirketler
   SET calisanlar_sayisi = 13000
   WHERE sirket = 'Ford';


SELECT isim FROM calisanlar
WHERE sirket IN(SELECT sirket 
				FROM sirketler
				WHERE calisanlar_sayisi > 15000);
                
/*----------------------------------------------------------------                
  2) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve personel sayilarini listeleyiniz.
----------------------------------------------------------------*/

SELECT sirket
FROM calisanlar
WHERE isim = 'Veli Yilmaz';

SELECT sirket, calisanlar_sayisi
FROM sirketler
WHERE sirket IN(SELECT sirket
				FROM calisanlar
				WHERE isim = 'Veli Yilmaz');


/*----------------------------------------------------------------                
  3) Ankara da calisani olan sirketlerin ID, isim ve calisan sayilarini 
  listeleyiniz.
----------------------------------------------------------------*/

SELECT * FROM sirketler
WHERE sirket IN(SELECT sirket 
				FROM calisanlar
                WHERE sehir = 'Ankara');
                
 
 /*----------------------------------------------------------------                
  4) ID'si 101 den yuksek olan sirketlerde calisanlarin maas sehir 
  sirket ismini listeleyiniz.
----------------------------------------------------------------*/

SELECT maas, sehir , sirket 
FROM calisanlar
WHERE sirket IN (SELECT sirket 
				 FROM sirketler
				 WHERE sirket_id > 101);


/* ======================== SELECT ile SUBQUERY ===========================*/

USE sys;

SELECT * FROM calisanlar;
SELECT * FROM sirketler;


/*
SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
   SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir. 


=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?

*/

/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, calisanlar_sayisi, (SELECT AVG(maas)
									FROM calisanlar
                                    WHERE calisanlar.sirket = sirketler.sirket) ort_maas
FROM sirketler;


/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/


SELECT sirket, (SELECT MAX(maas)
				FROM calisanlar
                WHERE calisanlar.sirket = sirketler.sirket) max_maas
FROM sirketler;


/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT sirket_id, sirket , (SELECT COUNT(sehir)
							FROM calisanlar
                            WHERE calisanlar.sirket = sirketler.sirket) sehir_sayisi
FROM sirketler;


/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT sirket_id , sirket , (SELECT COUNT(sehir)
							FROM calisanlar
                            WHERE calisanlar.sirket = sirketler.sirket) sehir_sayisi
FROM sirketler
WHERE sirket_id > 101;

/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

-- SELECT  satirinda her virgul arasi sadece bir field yazilabilir.

SELECT sirket, calisanlar_sayisi, (SELECT MIN(maas)
									FROM calisanlar
                                    WHERE calisanlar.sirket = sirketler.sirket) min_maas ,
                                  (SELECT MAX(maas)
                                    FROM calisanlar
                                    WHERE calisanlar.sirket = sirketler.sirket) max_maas  
FROM sirketler;


/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, calisanlar_sayisi,(
									SELECT SUM(maas)
                                    FROM calisanlar
                                    WHERE calisanlar.sirket = sirketler.sirket) total_maas
						
FROM sirketler;



/* ======================== EXISTS CONDITION ===========================
EXISTS Condition subquery'ler ile kullanilir. IN ifadesinin kullanimina
benzer olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen 
degerlerin icerisinde bir degerin olmasi veya olmamasi durumunda islem 
yapilmasini saglar.
======================================================================*/

CREATE TABLE mayis_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mayis_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mayis_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mayis_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mayis_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mayis_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mayis_satislar VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan_satislar
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mayis_satislar;
SELECT * FROM nisan_satislar;

/*----------------------------------------------------------------
SORU 1 : Her iki ayda da ayni id ile satilan urunlerin urun_id'lerini
ve urunleri mayis ayinda alanlarin isimlerini getiren bir query yaziniz.
----------------------------------------------------------------*/

-- birinci yol IN ile...

SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE urun_id IN(SELECT urun_id
				 FROM nisan_satislar
                 WHERE mayis_satislar.urun_id = nisan_satislar.urun_id) ; -- 10 ve 20 getirecek


-- ikinci yol EXISTS ile...

SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE EXISTS (SELECT urun_id
				FROM nisan_satislar
                WHERE  mayis_satislar.urun_id = nisan_satislar.urun_id); 
                
                
 /*----------------------------------------------------------------
SORU 2 : Her iki ayda da satilan ayni urunlerin,
urun_isim'ini ve urunleri nisan ayinda alan musterilerin isimlerini 
getiren bir Query yaziniz.
----------------------------------------------------------------*/ 


SELECT urun_isim, musteri_isim 
FROM nisan_satislar
WHERE EXISTS(SELECT urun_isim
			 FROM mayis_satislar
			 WHERE mayis_satislar.urun_id = nisan_satislar.urun_id);


/*----------------------------------------------------------------
SORU 3 : Mayis ayinda satilip nisan ayinda satilmayan urun id ve
satin alan kisiyi listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT urun_id, musteri_isim
FROM mayis_satislar
WHERE NOT EXISTS(SELECT urun_id
			 FROM nisan_satislar
			 WHERE mayis_satislar.urun_id = nisan_satislar.urun_id);

-- Eger esitlige uygun olan datalari istiyor isek EXISTS esitlik disinda kalan 
-- yani bir tabloya ozgu olan datalari istiyor isek NOT EXISTS kullaniyoruz.






               
                

























