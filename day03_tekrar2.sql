

CREATE TABLE ogrenciler1
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler1 VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler1 VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler1 VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler1;
    

--ornek1: sinav notu 80 den buyuk olan tum ogrenci bilgilerini listele

SELECT * FROM ogrenciler1
WHERE sinav_notu>80;

--ornek2: adresi Ankara olan ogrencilerin isim ve adres bilgilerini listele

SELECT isim, adres FROM ogrenciler1
WHERE adres='Ankara';

--ornek3: id si 124 olan ogrencilerin tum bilgilerini sil

SELECT * FROM ogrenciler1
WHERE id=124;

CREATE TABLE personel5
    (
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    
    INSERT INTO personel5 VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel5 VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel5 VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel5 VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel5 VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel5 VALUES('10005', 'Ayşe Can', 4000);
    
    SELECT * FROM personel5;
    
--ornek4: id si 10002 ile 10005 arasinda olan personelin bilgilerini listele

-- 1.nci yontem:

SELECT * FROM personel5
WHERE id BETWEEN 10002 AND 10005;

-- 2.nci yontem:

SELECT * FROM personel5
WHERE id>=10002 AND id<=10005;

--ornek5: ismi Mehmet Yilmaz ile Veli Han arasindaki personel bilgilerini listele

SELECT * FROM personel5
WHERE isim BETWEEN 'Mehmet Yılmaz' AND 'Veli Han';

--ornek6: id si 10002-10004 arasinda olmayan personelin ID ve maasini listele

SELECT id, maas FROM personel5
WHERE id NOT BETWEEN 10002 AND 10004;

--ornek7: maasi 4000, 5000, 7000 olan personelin bilgilerini listele

SELECT * FROM personel5
WHERE maas IN(4000,5000,7000);

SELECT * FROM personel5
WHERE isim IN('Meryem ', 'Mustafa Ali', 'Ayşe Can');

/*
======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütun LIKE pattern
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir.-- % isareti sadece LIKE ile kullaniliyor.
    _    ---> Tek bir karakteri temsil eder.
 ====================================================*/
-- ORNEK9:  ismi A harfi ile bitenleri listeleyiniz

SELECT * FROM personel5
WHERE isim LIKE 'A%';

SELECT * FROM personel5
WHERE isim LIKE '%A';

-- ORNEK10:  ismi n harfi ile bitenleri listeleyiniz

SELECT * FROM personel5
WHERE isim LIKE '%n';

 -- ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 
 SELECT * FROM personel5
 WHERE isim LIKE '_e%';
 
 --   ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 
SELECT * FROM personel5
WHERE isim LIKE '_e%y%';
 
 --   ORNEK13:  ismi A ile başlamayanları listeleyiniz
 
 SELECT * FROM personel5
 WHERE isim NOT LIKE 'A%';
 
 --   ORNEK15:  isminde a harfi olmayanları listeleyiniz
 
 SELECT * FROM personel5
 WHERE isim NOT LIKE '%A%';

  --  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
  
  SELECT * FROM PERSONEL5
  WHERE maas NOT LIKE '%00';
  
 -- ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 
 SELECT * FROM personel5
 WHERE maas NOT LIKE 4000;
 
 --   ORNEK18: maaşı 5 haneli olanları listeleyiniz
 
 SELECT * FROM personel5
 WHERE maas LIKE '_____';
 
   -- ORNEK20: ISMI 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
SELECT * FROM personel5
 WHERE isim LIKE 'A_____A%';
 
 /*
======================= SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] )
             -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
/* ========================================================================== */
    CREATE TABLE kelimeler1
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler1 VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler1 VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler1 VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler1 VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler1 VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler1 VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler1 VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler1 VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler1 VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler1 VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler1 VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler1 VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler1 VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler1 VALUES (1014, 'haaat', 5);
    
 --  ORNEK21: İçerisinde 'hi' bulunan kelimeleri listeleyeniz

-- SELECT * FROM kelimeler WHERE kelime LIKE '%hi%';

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 'hi');

-- ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri listele

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 'ot|at');

-- ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri buyuk kucuk harfe duyarsiz listele

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 'ot|at','i');

-- ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
--  etmeksizin listeleyeniz

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, '^ho|^hi','i');

-- ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
--  etmeksizin listeleyeniz

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 't$|m$', 'i');

-- ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri büyük-küçük harfe
--  dikkat etmeksizin listeleyeniz

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t', 'i');

-- ORNEK27: h ile başlayıp t ile biten 5 harfli kelimeleri büyük-küçük harfe
--  dikkat etmeksizin listeleyeniz

SELECT * FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]t','i');

-- ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, 'm|i|e');

-- ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.

SELECT * FROM kelimeler1
WHERE REGEXP_LIKE(kelime, '^a|^s');







































