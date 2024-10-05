USE sys;

CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003', 'Meryem', 7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Fatma',4300);
INSERT INTO personel VALUES('10007','Beyza Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

SELECT * FROM personel;

-- Insert Into komutunu yazarken tablo adindan sonra sutun adlarini yazmayip 
-- sadece VALUES degerleri yazarak tablo create edebiliriz.

/*===============================================
		LIKE OPERATORU 
===============================================*/


/*
1- "LIKE" operatörü, belirli bir patern veya düzene uyan verileri bulmak için kullanılır.
2- Genellikle "%" (yüzde) ve "_" (alt çizgi) olmak üzere iki joker karakterle kullanılır.
3- "%" karakteri, sıfır veya daha fazla karakterin yerini tutar.
4- "_" karakteri ise tek bir karakterin yerini tutar.

Örneğin, "LIKE '%son'" ifadesi "son" ile biten tüm metin değerlerini bulur 
(örn. "Jason", "Wilson").
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
WHERE sütun_adı 
LIKE 'patern';
*/

/*  =============================  SORU-1 =============================
    Personel tablosundan ismi A ile baslayan personeli listeleyiniz.
    ===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE 'a%';

/*  =============================  SORU-2 =============================
    Personel tablosundan isminde 'Ayse' gecen personeli listeleyiniz.
    ===================================================================
 */

	SELECT * FROM personel
    WHERE isim
    LIKE '%Ayse%';

/*  =============================  SORU-3 =============================
    Personel tablosundan ismi 'a' ile biten personeli listeleyiniz.
    ===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE '%a';


/*  =============================  SORU-4 =============================
    Personel tablosundan isminin 2. harfi 'e' olan personeli listeleyiniz
    ===================================================================
 */

SELECT * FROM personel
WHERE isim
LIKE '_e%';


/*  =============================  SORU-5 =============================
    Personel tablosundan Isminin 2. harfi 'e' olup diger harflerinde 'y' 
    olan personeli listeleyiniz
    ===================================================================
 */
 
 SELECT * FROM personel
 WHERE isim
 LIKE  '_e%'
 AND isim LIKE '%y%';
 
 
/*  =============================  SORU-6 =============================
    Personel tablosundan maasi 5 haneli olan personel isimlerini listeleyiniz
    ===================================================================
 */ 

SELECT * FROM personel
WHERE maas
LIKE '_____';

/*  =============================  SORU-7 =============================
    Personel tablosundan isminin 1. harfi 'a' ve 7. harfi 'a' olan 
    personeli listeleyiniz
    ===================================================================
 */

SELECT *
FROM personel
WHERE isim LIKE 'a____a%';

-- ************************************************************************

CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50),
        harf_sayisi int
    );
    
INSERT INTO kelimeler VALUES 
    (1001, 'hot', 3),
	(1002, 'hat', 3),
	(1003, 'hit', 3),
	(1004, 'hbt', 3),
	(1005, 'hct', 3),
    (1006, 'adem', 4),
    (1007, 'selim', 5),
    (1008, 'yusuf', 5),
    (1009, 'hip', 3),
    (1010, 'HOT', 3),
    (1011, 'hOt', 3),
    (1012, 'h9t', 3),
    (1013, 'hoot', 4),
    (1014, 'haaat', 5),
    (1015, 'hooooot', 7),
	(1016, 'h-t', 3),
    (1017, 'h?t', 3),
    (1018, 'hOOOt', 5),
    (1019, 'O', 1);    


SELECT * FROM kelimeler;


/* ===============================================
		   REGEXP_LIKE OPERATORU 
    ===============================================*/
    
 /*
1- "REGEXP_LIKE" (veya bazen "RLIKE" olarak da bilinir), daha karmaşık ve 
 güçlü bir arama yapmak için düzenli ifadeleri (regular expressions) kullanır.
2- Düzenli ifadeler, metin içindeki PATERN'leri tanımlamak için kullanılan bir dil 
veya sözdizimidir.
3- "REGEXP" operatörü, çok daha spesifik ve esnek aramalar yapmanıza olanak tanır.
4- [!-~] = Butun karakterleri karsilayan tek bir karakteri ifade eder.
   [a-zA-Z0-9] = Harf ve rakamlari temsil eden bir karakteri ifade eder.
5- '^' isareti baslangici belirtir.
6- '$' isareti bitisi belirtir.  
7- '|' karakteri veya anlaminda kullanilir.
8- '.' herhangi bir tek karakter anlamina gelir'

 
Örneğin, "REGEXP '^J.*son$'" ifadesi "J" ile başlayıp "son" ile biten tüm metin değerlerini bulur
 (örn. "Jason" ama "Wilson" değil).
*/

/*
*************** SYNTAX ***************
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]');
*/

/*  =============================  SORU-7 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    listeleyiniz
    ===================================================================
 */
 
 SELECT * FROM kelimeler
 WHERE REGEXP_LIKE(kelime, 'ot|at');
   
    
/* ===============================================
		   CASE SENSITIVE / CASE INSENSITIVE
    ===============================================*/

/*
		Case Sensitive (Büyük/Küçük Harfe Duyarlılık)
	Bir sorgu veya veritabanı işlemi case sensitive olduğunda, 
	büyük ve küçük harfler farklı kabul edilir. 
	Örneğin, 'a' ve 'A' farklı karakterler olarak değerlendirilir.

	KULLANIM: sorgu sonuna 'c' seklinde patern eklenerek belirtilmelidir.
*/
 
 
/*
		Case Insensitive (Büyük/Küçük Harfe Duyarsızlık)
	Bir sorgu veya işlem case insensitive olduğunda, 
	büyük ve küçük harf farkı göz ardı edilir. 
	Yani, 'a' ve 'A' aynı karakter olarak kabul edilir.

	KULLANIM: sorgu sonuna 'i' seklinde patern eklenerek belirtilmelidir.
*/
 
 -- NOT: Mysql de default caseType insensitive olarak kabul edilmektedir.
-- Case Sensitive oldugu ozellikle belirtilmemis ise default type degeri 
-- olan insensitive gecerlidir

/*  =============================  SORU-8 =============================
    Kelimeler tablosundan icerisinde 'ot' veya 'at' bulunan kelimeleri
    case-sensitive'e dikkat ederek listeleyiniz.
    ===================================================================
 */

-- Case Sensitive
SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ot|at', 'c');

-- Case Insensitive
SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ot|at', 'i');


-- Default Case
SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ot|at');


/*  =============================  SORU-9 =============================
    Kelimeler tablosunda icinde 'ho' veya 'hi' gecen kelimeleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
    ===================================================================
 */

SELECT *
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'ho|hi', 'i');


/*  =============================  SORU-10 =============================
    Kelimeler tablosundan sonu 't' veya 'm' ile bitenleri 
    case-sensitive'e dikkat etmeksizin listeleyiniz.
    ===================================================================
 */

SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime,'t$|m$');


/*  =============================  SORU-10 =============================
    Kelimeler tablosundan h ile baslayip t ile biten 3 harfli kelimeleri 
    (h ile t kucuk harfli olanlari) listeleyiniz.
    ===================================================================
 */

/*
NOT:  [!-~] = Butun karakterleri ifade eder.
      [a-zA-Z0-9] = Harf ve rakamlari temsil eder.
*/

SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[!-~]t', 'c');


SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h.t', 'c');


SELECT * FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t', 'c');

/*  =============================  SORU-11 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri rakam 
    olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    ===================================================================
 */
 
SELECT *
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[0-9]t','c') ;

/*  =============================  SORU-12 =============================
    Kelimeler tablosundan 'h' ile baslayip 't' ile biten 2. karakteri buyuk 
    harf olan 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    ===================================================================
 */
 
 SELECT *
FROM kelimeler
WHERE REGEXP_LIKE(kelime, 'h[A-Z]t','c') ;

/*  =============================  SORU-13 =============================
    Kelimeler tablosundan 2. harfi 'O' (buyuk O harfli) olan 3 karakterli 
    kelimeleri ve id'lerini listeleyiniz
    ===================================================================
 */


-- Birinci Yol
SELECT kelime, id FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^[a-zA-Z0-9]O[a-zA-Z0-9]$', 'c');

-- Ikinci Yol

SELECT kelime, id FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^[!-~]O[!-~]$', 'c');

-- Ucuncu Yol

SELECT kelime, id FROM kelimeler
WHERE REGEXP_LIKE(kelime, '^.O.$', 'c');


-- MySQL Workbanch iyimser ve calisma odakli bir yapidadir.
-- Paternlerin olmasi gerektigi gibi yazilmasi farkli lehcelerde veya JDBC 
-- sorgularinda bizlere kolaylik saglayacaktir. 


/*
-----------------------------KARSILASTIRMA ------------------------------
Esneklik: "REGEXP" daha esnek ve güçlüdür, karmaşık desenleri tanımlayabilir. 
"LIKE" ise daha basit ve sınırlı desenlerle çalışır.
Performans: "LIKE" operatörü genellikle "REGEXP" operatörüne göre daha hızlıdır,
çünkü daha basit desenleri işler.
Kullanım Kolaylığı: "LIKE" daha basit ve anlaşılması daha kolaydır. "REGEXP" 
ise düzenli ifadelerin nasıl çalıştığını bilmeyi gerektirir, bu da öğrenme eğrisini artırır.
*/





