/*
============================ GROUP BY =====================================
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine
    göre özet olarak gruplamak için kullanılır.
    GROUP BY cümleceği her grup başına bir satır döndürür.
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate
    fonksiyonları ile birlikte kullanılır.
    
*/

CREATE TABLE manav
    (
        isim varchar2(50),
        urun_adi varchar2(50),
        urun_miktari number(9)
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
    SELECT * FROM MANAV;
    
 -- ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu
 -- yazınız. ali=>5+2+2+2 sum= meyve sayılarını toplucak  
 
 SELECT isim, SUM(urun_miktari) toplam_urun FROM manav
 GROUP BY isim; -- isim isim grupla, her ismi bir kere yaz, 
 -- o isimdeki meyve sayilarini topla, ilgili ismin satirinda goster
 
-- ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
--  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.count= elma alan kişileri sayacak
-----------------------------

SELECT urun_adi, COUNT (isim) FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi;























