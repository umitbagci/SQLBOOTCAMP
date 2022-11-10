-- SELF JOIN

CREATE TABLE personel2 (
id int,
isim varchar(20),
title varchar(60), yonetici_id int
);

INSERT INTO personel2 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel2 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel2 VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

SELECT * FROM personel2

-- her personelin yanina yonetici ismi yazdiran bir tablo olusturalim

select p1. isim as personel_isim,p2.isim as yonetici_isim
from personel2 p1 inner join personel2 p2
on p1.yonetici_id=p2.id

--LIKE CONDITION

CREATE TABLE musteriler (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

select * from musteriler

--SORU	: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim LIKE 'A%' -- ismi A ile baslayanlari getiriyor

select * from musteriler where isim ILIKE 'a%' -- Ilike yaparsak büyük kucuk harf farketmeden sorgulama yapar.

select * from musteriler where isim ~~ 'A%' -- like yerine bu sembol de kullanilabilir 

select * from musteriler where isim ~~* 'a%' -- sonuna * koyarsak büyük kucuk harf ayrim yapmadan sorgu yapabiliriz

-- SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin

select isim,gelir from musteriler where isim ILIKE '%e'

--SORU : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin


select isim,gelir from musteriler where isim ILIKE '%er%'

--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim Like '__s_'

-- Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin

select * from musteriler where isim Like'F___%'-- sonuna yüzde koydugumuz zaman devaminda harf gelebilir demek.

--  


CREATE TABLE kelimeler (
id int UNIQUE,
kelime varchar(50) NOT NULL, Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);


--Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
--QUERY yazin

select * from kelimeler where kelime ~ 'h[ai]t'

--Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran QUERY yazin

select * from kelimeler where kelime ~'h[a-k]t'

-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin

select*from kelimeler where kelime ~'[mi]'

--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler where kelime ~'^[as]'

select * from kelimeler where kelime ~'[mf]$'--sonu mf ile biten kelimeleri istiyor.

--DISTINCT 
CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

--urun isimlerini DISTINCT komutu ile gruplayalim 

SELECT count(urun_isim), urun_isim from musteri_urun 
group by ( urun_isim )


select DISTINCT urun_isim, count (urun_isim) from musteri_urun
group by urun_isim

--tabloda kac farkli meyve vardir

select count(DISTINCT(urun_isim)) from musteri_urun
select 