-- subqueries (alt sorgu)

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.

select * from calisanlar2
select * from markalar

select isim, maas, isyeri from calisanlar2 where isyeri in ( select marka_isim from markalar where calisan_sayisi>15000)

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
 
   select marka_id, calisan_sayisi from markalar where marka_adi in ( select isyeri from calisanlar2 where sehir= 'Ankara');
   
   -- aggregate function
   
  -- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim from markalar WHERE marka_id>101)
--Aggregate Function
Select sum(maas) AS maas_toplam from calisanlar2
select max(maas) AS en_yuksek_maas from calisanlar2
select min(maas) AS en_dusuk_maas from calisanlar2
select avg(maas) AS maas_ortalamalari from calisanlar2
select round(avg(maas)) AS maas_ortalamalri from calisanlar2
select count(maas) AS maas_adedi from calisanlar2
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id, marka_isim,
(SELECT count(sehir) FROM calisanlar2 WHERE isyeri=marka_isim) AS sehir_sayisi
FROM markalar;
   
   