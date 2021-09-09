------------SELECT  -WHERE-----------

CREATE TABLE ogrenciler4
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler4 VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler4 VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler4 VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler4;
    
/* ==========================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
============================================================================*/


--ornek1: sinav notu 80 den buyuk olan tum ogrenci bilgilerini listele

SELECT * FROM ogrenciler4 
WHERE sinav_notu>80;

--ornek2: adresi Ankara olan ogrencilerin isim ve adres bilgilerini listele

SELECT isim, adres FROM ogrenciler4 
WHERE adres='Ankara';

--ornek3: id si 124 olan ogrencilerin tum bilgilerini sil

DELETE FROM ogrenciler4
WHERE id=124;


CREATE TABLE personel2
    (
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    
    INSERT INTO personel2 VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel2 VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel2 VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel2 VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel2 VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel2 VALUES('10005', 'Ayşe Can', 4000);
    
    SELECT * FROM personel2;
    
--ornek4: id si 10002 ile 10005 arasinda olan personelin bilgilerini listele

-- 1.nci yontem:

SELECT * FROM personel2
WHERE id between '10002' AND '10005';--BETWEEN DE ILK VE SON DEGER DAHIL

-- 2.nci yontem:

SELECT * FROM personel2
WHERE id >= '10002' AND id <= '10005';

--ornek5: ismi Mehmet Yilmaz ile Veli Han arasindaki personel bilgilerini listele

SELECT * FROM personel2
WHERE isim BETWEEN 'Mehmet Yılmaz'AND 'Veli Han';

--ornek6: id si 10002-10004 arasinda olmayan personelin ID ve maasini listele

SELECT id, maas FROM personel2
WHERE id NOT BETWEEN '10002' AND '10004';

------------SELECT  -IN-----------

/* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */

--ornek7: maasi 4000, 5000, 7000 olan personelin bilgilerini listele

SELECT * FROM personel2
WHERE maas IN(4000,5000,7000);

SELECT * FROM PERSONEL2
WHERE ISIM IN('Veli Han','Ahmet Aslan');































