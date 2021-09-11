

/*
============================== JOIN İSLEMLERİ ===============================
    foreıgn key id si ortakları yanyana yazıyordu bu bikaç tablodan istenilen
    sütunları alır birleştirir. set istenilen sütunları tek sütunda birleştirir
    
    Set Operatorleri (Union,Intersect,Minus) farklı tablolardaki sutunlari
    birlestirmek için de kullanilir.
    
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo
    olusturmak icin kullanilabilir.

    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek
    icin JOIN islemleri kullanilabilir.
    
    ORACLE SQL'de 4 Cesit Join islemi kullanilabilmektedir.
    
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir---*/
    
    CREATE TABLE sirketler2
    (
        sirket_id NUMBER(9),
        sirket_isim VARCHAR2(20)
    );
    
    drop table siparisler;
    
    INSERT INTO sirketler2 VALUES(100, 'Toyota');
    INSERT INTO sirketler2 VALUES(101, 'Honda');
    INSERT INTO sirketler2 VALUES(102, 'Ford');
    INSERT INTO sirketler2 VALUES(103, 'Hyundai');
    
    CREATE TABLE siparisler
    (
        siparis_id NUMBER(9),
        sirket_id NUMBER(9),
        siparis_tarihi DATE
    );
    
    INSERT INTO siparisler VALUES(11, 101, '17-04-2020');
    INSERT INTO siparisler VALUES(22, 102, '18-04-2020');
    INSERT INTO siparisler VALUES(33, 103, '19-04-2020');
    INSERT INTO siparisler VALUES(44, 104, '20-04-2020');
    INSERT INTO siparisler VALUES(55, 105, '21-04-2020');
    
    SELECT * FROM siparisler;
    SELECT * FROM sirketler2;
    
/*=============================== FULL JOIN  ==================================
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari
    getirmek icin kullanilir. ortaklar aynı satırda yazılır, extra fazla satır varsa o da yazılır.
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/
/* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim,
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/
    
    select sirket_isim, siparis_id, siparis_tarihi, sp.sirket_id 
    from sirketler2 s
    FULL JOIN siparisler sp
    ON sp.sirket_id=s.sirket_id;
    
--  ORNEK2: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--  siparis_tarihleri listeleyen bir sorgu yaziniz. null olanlar çıkmıcak 
-- çünkü NULL ortak değil(bir tabloda null iken diğerinde id null yok, 100, 101 vs var)  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    