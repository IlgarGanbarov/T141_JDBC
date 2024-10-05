USE sys;

/*============================ Primary Key ============================
1- Primary Key bir row'u tanimlayan bir field veya birden fazla field 
   kombinasyonudur.
2- Primary Key UNIQUE'dir
3- Bir tabloda en fazla bir Primary Key Olabilir.
4- Primary Key column'da hicbir data NULL olamaz. 

-- Bir field Primary Key yapmak icin 2 farkli yol vardir;
*/

/*--------------------- Syntax 1 -------------------
	Data Type'dan sonra "PRIMARY KEY" yazarak

	CREATE TABLE students_table
	(
		id INT PRIMARY KEY,
		name VARCHAR(50),
		grade INT,
		adres VARCHAR(100),
		last_update DATE
	); 
--------------------------------------------------*/

/*--------------------- Syntax 2 -------------------
	CONSTRAINT Keyword'u kullanilarak PRIMARY KEY tanimlanabilir.
	"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n);"

	CREATE TABLE students_table
	(
		id INT ,
		name VARCHAR(50),
		grade INT,
		adres VARCHAR(100),
		last_update DATE
		CONSTRAINT id_pk PRIMARY KEY (id)
	);
 --------------------------------------------------*/

/*------------------------------- Q1 -------------------------------
	"sehirler" isimli bir tablo olusturun.
	Tabloda "alan_kodu", "isim", "nufus" fieldlari olsun.
	"isim" field'i bos birakilamasin.
	1. yolu kullanarak "alan_kodu" field'ini primary key yapin
 -------------------------------------------------------------------*/


CREATE TABLE sehirler
(
	alan_kodu INT PRIMARY KEY,
    isim VARCHAR(30) NOT NULL,
    nufus BIGINT
);

SELECT * FROM sehirler;


/*------------------------------- Q2 -------------------------------
	"ogretmenler" isimli bir table olusturun.
	Tabloda "id", "isim", "brans", "cinsiyet" fieldlari olsun.
	"id" field'i tekrarli veri kabul etmesin.
	2. yolu kullanarak "id" ve "isim" field'larini primary key yapin
-------------------------------------------------------------------*/

CREATE TABLE ogretmenler
(
	id INT UNIQUE,
    isim VARCHAR(30),
    brans VARCHAR(25),
    cinsiyet CHAR(5),
    CONSTRAINT idIsim_pk PRIMARY KEY(id,isim)
);

SELECT * FROM ogretmenler;


/*------------------------------- Q3 -------------------------------
	"universite_ogrenci_bilgi_sistemi" isimli bir table olusturun.
	Tabloda "giris_yili", "giris_siralamasi", "isim", "bolum" field'lari olsun.
	"isim" field'i NULL deger kabul etmesin.
	2. yolu kullanarak "giris_yili" ve "giris_siralamasi" field'larini 
    primary key yapin
-------------------------------------------------------------------*/

CREATE TABLE universite_ogrenci_bilgi_sistemi
(
	giris_yili YEAR,
	giris_siralamasi INT,
    isim VARCHAR(30) NOT NULL,
    bolum VARCHAR(30),
    CONSTRAINT gy_gs_pk PRIMARY KEY(giris_yili,giris_siralamasi)
);


/*============================ Foreign Key ============================
1- Foreign Key iki tablo arasında Relation oluşturmak için kullanılır.
2- Foreign Key başka bir tablonun Primary Key’ine bağlıdır.
3- Referenced table (bağlanılan tablo, Primary Key’in olduğu tablo) 
   Parent Table olarak da adlandırılır. Foreign Key’in olduğu tablo ise  
   Child Table olarak da adlandırılır.
4- Bir tabloda birden fazla Foreign Key olabilir.
5- Foreign Key NULL değeri alabilir.
6- Foreign Key DUBLICATE değeri alabilir.

Not 1: Parent Table’da olmayan bir veriyi(PK'daki herhangi bir deger) 
Child Table’a giremezsiniz.

Not 2: Child Table’ı silmeden Parent Table’ı silemezsiniz. 
Önce Child  Table silinir, sonra Parent Table silinir.
=====================================================================*/

/*--------------------------- Syntax  ---------------------------
	CONSTRAINT constraintName FOREIGN KEY(child_table_field_name)
	REFERENCES parent_table (parent_table_field_name)

	CREATE TABLE table_name
	(
		id CHAR(10),
		name CHAR(10),
		CONSTRAINT constraint_name
		FOREIGN KEY(id)
		REFERENCES parent_table (parent_table_field_name)
	);
---------------------------------------------------------------*/ 

/*------------------------------- Q4 -------------------------------
	"tedarikci" isimli bir tablo olusturun.
	Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" fieldlari olsun.
	"tedarikci_id" field'ini PRIMARY KEY olsun.
	

	"urunler" isminde baska bir tablo olusturun. 
	Tabloda "tedarikci_id" ve "urun_id" field'lari olsun.
	"tedarikci_id" FOREIGN KEY olsun.
-------------------------------------------------------------------*/ 

CREATE TABLE tedarikci
(
	tedarikci_id INT ,
    tedarikci_ismi VARCHAR(30),
    iletisim_isim VARCHAR(30),
    CONSTRAINT tedarikciID_pk PRIMARY KEY(tedarikci_id)
);

CREATE TABLE urunler
(
	tedarikci_id INT,
    urun_id INT,
    CONSTRAINT tedarikciID_fk FOREIGN KEY(tedarikci_id)
    REFERENCES tedarikci (tedarikci_id)
);

/*------------------------------- Q5 -------------------------------
	"bebeler" isimli bir tablo olusturun.
	Tabloda "id", "isim", "iletisim_no" field'lari olsun.
	"id" field'i PRIMARY KEY olsun.

	"notlar" isminde baska bir tablo olusturun. 
	Tabloda "bebe_id" ve "puan" field'lari olsun.
	"bebe_id" FOREIGN KEY olsun.
-------------------------------------------------------------------*/

CREATE TABLE bebeler
(
	id INT,
    isim VARCHAR(30),
    iletisim_no CHAR(15),
    CONSTRAINT id_pk PRIMARY KEY(id)
);


CREATE TABLE notlar
(
	bebe_id INT,
    puan DOUBLE,
    CONSTRAINT bebeID_fk FOREIGN KEY(bebe_id)
    REFERENCES bebeler(id)
);


/*------------------------------- Q6 -------------------------------
"ogrenciler" ve "dersler" isimli iki tablo oluşturun.

"ogrenciler" tablosunda "ogrenci_no" (Primary Key),
"isim", ve "bolum" alanları olsun.

"dersler" tablosunda "ders_kodu" (Primary Key),
"ders_adi", ve "kredi" alanları olsun.

"ogrenci_dersleri" isimli bir many to many ilişki tablosu
oluşturun ve gerekli Foreign Key'leri tanımlayın.
-------------------------------------------------------------------*/

CREATE TABLE ogrenciler
(
	ogrenci_no CHAR(11),
    isim VARCHAR(30),
    bolum VARCHAR(30),
    CONSTRAINT ogrenciNo_pk PRIMARY KEY(ogrenci_no)
);

CREATE TABLE dersler
(
	ders_kodu CHAR(5),
    ders_adi VARCHAR(15),
    kredi INT,
    CONSTRAINT dersKodu_pk PRIMARY KEY(ders_kodu)
);

CREATE TABLE ogrenci_dersleri
(
	ogrenci_no CHAR(11),
    ders_kodu CHAR(5),
    CONSTRAINT ogrNO_fk FOREIGN KEY(ogrenci_no) REFERENCES ogrenciler(ogrenci_no),
    CONSTRAINT dersKodu_fk FOREIGN KEY(ders_kodu) REFERENCES dersler(ders_kodu)
);


























