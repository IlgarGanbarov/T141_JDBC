USE sys;

CREATE TABLE siparisler (
    id INT ,
    musteri_adi VARCHAR(50),
    urun_adi VARCHAR(50),
    siparis_tarihi DATE
);

INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi) 
VALUES  ('Ahmet Yılmaz', 'Laptop', '2023-01-10'),
		('Ayşe Kaya', 'Akıllı Telefon', '2023-01-12'),
		('Mehmet Öz', 'Laptop', '2023-02-05'),
		('Ahmet Yılmaz', 'Akıllı Telefon', '2023-02-10'),
		('Ayşe Kaya', 'Tablet', '2023-02-20'),
		('Ahmet Yılmaz', 'Laptop', '2023-02-25');
        
SELECT * FROM siparisler;

/* ===============================================
		       SELECT - DISTINCT
   ===============================================*/
   
 /*
 DISTINCT anahtar kelimesi SQL'de, bir sorgu sonucu setinden
 yalnızca benzersiz (tekrar etmeyen) değerleri seçmek için 
 kullanılır. Tekrarlanan verilerin filtrelenmesi ve veri 
 setinden tekil kayıtların alınması gerektiğinde bu ifade 
 devreye girer.

DISTINCT genellikle SELECT ifadesiyle birlikte kullanılır 
ve SELECT sorgusunun hemen ardından gelir.
*/  

/*
*************** SYNTAX ***************
SELECT DISTINCT sütun_adı
FROM tablo_adı;
*/

/*  =============================  SORU-1 =============================
    Siparisler tablosundaki müşteri adlarından benzersiz olanları listeleyin.
    ===================================================================
 */

SELECT DISTINCT musteri_adi 
FROM siparisler;

SELECT musteri_adi FROM siparisler;

/*  =============================  SORU-2 =============================
    Siparisler tablosuna gore hangi urunler siparis edilmistir. 
    (Urunler UNIQUE (benzersiz) olmali)
    ===================================================================
*/

SELECT DISTINCT urun_adi 
FROM siparisler;


/*  ============================= SORU-3 =============================
    Siparisler tablosundaki verilere gore subat ayi icerisinde satilan
    urunleri benzersiz olarak listeleyiniz
    ===================================================================
*/

-- Birinci Yol
SELECT DISTINCT urun_adi 
FROM siparisler
WHERE siparis_tarihi >= '2023-02-01'
AND siparis_tarihi <= '2023-02-28';

-- Ikinci Yol
SELECT DISTINCT urun_adi 
FROM siparisler
WHERE MONTH(siparis_tarihi) = 2
AND YEAR(siparis_tarihi)= 2023;


CREATE TABLE kitaplik (
    id INT PRIMARY KEY,
    kitap_adi VARCHAR(100),
    yazar VARCHAR(50),
    yayin_yili INT
);

INSERT INTO kitaplik (id, kitap_adi, yazar, yayin_yili) VALUES
(1, 'Sefiller', 'Victor Hugo', 1862),
(2, '1984', 'George Orwell', 1949),
(3, 'Suç ve Ceza', 'Fyodor Dostoyevski', 1866),
(4, 'Kürk Mantolu Madonna', 'Sabahattin Ali', 1943),
(5, 'Yabancı', 'Albert Camus', 1942),
(6, 'Ulysses', 'James Joyce', 1922),
(7, 'Yüzüklerin Efendisi', 'J.R.R. Tolkien', 1954),
(8, 'Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1998),
(9, 'Da Vinci Şifresi', 'Dan Brown', 2003),
(10, 'Zamanın Kısa Tarihi', 'Stephen Hawking', 1998),
(11, 'Karamazov Kardeşler', 'Fyodor Dostoyevski', 1880),
(12, 'Budala', 'Fyodor Dostoyevski', 1869),
(13, 'Savaş ve Barış', 'Lev Tolstoy', 1866),
(14, 'Anna Karenina', 'Lev Tolstoy', 1877),
(15, 'Hobbit', 'J.R.R. Tolkien', 1942);


/* ===============================================
		       ORDER BY
   ===============================================*/

-- ORDER BY, LIMIT VE OFFSET gibi filtreleme ifadeleri
-- database uzerinde degil bize donen sonuc uzerinde 
-- filtreleme yapar. Database de bir degisiklik yapmaz.

/*
   ORDER BY ifadesi, SQL sorgularında sonuçları belirli bir
   veya birden fazla sütuna göre sıralamak için kullanılır.
   Bu ifade, sıralama işleminin yükselen (ascending) veya 
   azalan (descending) düzeninde yapılmasını sağlar. 
   ASC anahtar kelimesi yükselen sıralamayı (dogal),
   DESC anahtar kelimesi ise azalan sıralamayı(ters) belirtir.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
ORDER BY sıralanacak_sütun ASC|DESC;

*/

SELECT * FROM kitaplik;

/*  ============================= SORU-4 =============================
    Kitaplik tablosundaki kitapları yayın yılına göre eski olanlardan
    yeni olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili ASC;

/*  ============================= SORU-5 =============================
    Kitaplik tablosundaki kitapların yayın yılına göre yeni olanlardan
    eski olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili DESC;

/*  ============================= SORU-6 =============================
    Kitaplik tablosundaki "Fyodor Dostoyevski"nin kitaplarını yayın 
    yılına göre eskiden gunumuze sırayiniz.
    ===================================================================
*/

SELECT * 
FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
ORDER BY yayin_yili;

-- MySQL default ORDER TYPE ASC'dir. 

/*  ============================= SORU-7 =============================
    Kitaplik tablosundaki yazarlarin isimlerini ters siralayiniz
    ===================================================================
*/

SELECT DISTINCT yazar
FROM kitaplik
ORDER BY yazar DESC;

/*  ============================= SORU-8 =============================
    Kitaplik tablosundaki "Lev Tolstoy" un kitaplarını isimlerine 
    göre dogal sıralayiniz.
    ===================================================================
*/

SELECT *
FROM Kitaplik
WHERE yazar = 'Lev Tolstoy'
ORDER BY kitap_adi;

/*  ============================= SORU-9 =============================
    Kitaplik tablosundaki yazar isimlerini ve kitaplarini 
    dogal sırayiniz.
    ===================================================================
*/ 

SELECT yazar, kitap_adi 
FROM kitaplik
ORDER BY yazar ASC, kitap_adi ASC;

-- ORDER BY komutundan sonra yazilan sutunlardan ilkiinden baslanir
-- esitlik devam ediyorsa ikinciye gecilir eger esitlik bozulmussa 
-- ucuncuye gecilmez. Ancak esitlik devam ediyorsa esitlik bozulana
-- kadar var olan sutunlarda siralama yapmaya devam eder.


/*  ============================= SORU-11 =============================
    Kitaplik tablosundaki kitaplari yayin yilina gore gunumuzden eskiye
    ve yazar isimlerini dogal sırayiniz.
    ===================================================================
*/

SELECT *
FROM Kitaplik
ORDER BY yayin_yili DESC, yazar;


/*  ============================= SORU-10 =============================
    Kitaplik tablosundaki yayin yili ve yazar isimlerini ve kitaplarini 
    dogal sırayiniz.
    ===================================================================
*/

SELECT * 
FROM kitaplik
ORDER BY yayin_yili, yazar, kitap_adi;

INSERT INTO kitaplik VALUES (16, 'team141', 'Fyodor Dostoyevski',1880 );

SELECT * FROM kitaplik;


/*===============================================
		      LIMIT - OFFSET
===============================================*/

/*
LIMIT ifadesi, bir sorgu sonucundan döndürülecek 
maksimum satır sayısını belirlemenizi sağlar. 
Eğer bir sorgu sonucu çok sayıda satır döndürüyorsa
 ve siz sadece bir kısmını görmek istiyorsanız, 
 LIMIT kullanabilirsiniz.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10;                      -- Sonuc kumesinde sadece 10 satir goster.
*/
    
/*
 OFFSET ifadesi, sorgu sonucu setinde bir başlangıç
 noktası belirler. 
 Bu, özellikle sayfalama işlemlerinde faydalıdır. 
 OFFSET genellikle LIMIT ile birlikte kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10 OFFSET 20;       -- Ilk 20  satiri atla sonraki 10 satiri goster.  
*/    

/*  =============================  SORU-12 =============================
    Kitaplik tablosundan ilk 5 Kitabı listeleyiniz.
    ===================================================================
 */

SELECT * 
FROM kitaplik
LIMIT 5;

/*  =============================  SORU-13 =============================
    Kitaplik tablosundaki en yeni 3 Kitabı listeleyiniz.
    ===================================================================
 */

SELECT * 
FROM kitaplik
ORDER BY yayin_yili DESC
LIMIT 3;

/*  =============================  SORU-14 =============================
    Kitaplik tablosundan rastgele 3 kitap secip listeleyiniz.
    ===================================================================
*/

-- RAND() fonksiyonu, özellikle bir tablodan rastgele kayıtlar seçmek için 
--   kullanılır.
-- ORDER BY RAND() ifadesi, tablonun satırlarını rastgele bir sıraya sokar. 
-- Bu yöntem, özellikle küçük ve orta ölçekli tablolar için uygundur. 
-- Ancak, büyük veri setleri için performans sorunlarına yol açabilir. 

SELECT * 
FROM kitaplik
ORDER BY RAND()
LIMIT 3;

/*  =============================  SORU-15 =============================
    Kitaplik tablosundan en eski iki kitabi listeleyiniz.
    ===================================================================
*/ 

SELECT *
FROM kitaplik
ORDER BY yayin_yili
LIMIT 2;

/*  =============================  SORU-16 =============================
    Kitaplik tablosundan yazari 'Fyodor Dostoyevski' olan kitapları 
    en fazla 2 tane olacak sekilde listeleyiniz.
    ===================================================================
*/

SELECT * FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
LIMIT 2;

/*  =============================  SORU-17 =============================
    Kitaplik tablosundaki yayın yılına göre sıralanmış 
    kitapların 3. sayfasını listeleyiniz.
    (Her sayfanin boyutu 3 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT *
FROM kitaplik
ORDER BY yayin_yili
LIMIT 3 OFFSET 6;   -- 7.,8.,9. siradaki kitaplari getir demek.

/*  =============================  SORU-18 =============================
    Kitaplik tablosundaki alfabetik siralanmis kitaplarin 4. sayfasını 
    listeleyiniz. (Her sayfanin boyutu 2 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT *
FROM kitaplik
ORDER BY kitap_adi 
LIMIT 2 OFFSET 6;  -- 7., 8.  kitaplari getir.


/*  =============================  SORU-19 =============================
    Kitaplik tablosundaki 'Fyodor Dostoyevski' nin kitaplarinin 2. sayfasını listeleyiniz.
    (Her sayfanin boyutu 1 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT * FROM kitaplik
WHERE yazar ='Fyodor Dostoyevski'
LIMIT 1 OFFSET 1;

/*  =============================  SORU-20 =============================
    Kitaplik tablosundaki yayin yili 1950'den once olan kitaplarin 
    1. sayfasını listeleyiniz. (Her sayfanin boyutu 4 kitap ile sinirlidir.)
    ===================================================================
*/

SELECT *
FROM Kitaplik
WHERE yayin_yili < 1950
LIMIT 4;







































