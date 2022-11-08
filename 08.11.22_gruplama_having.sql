
-- ORDER BY
CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

--insanlar2 tablosundaki datalari adrese gore siralayiniz

select * from insanlar2
ORDER BY adres;

--insanlar2 tablosundaki ismi mine olanlari ssn numarasina göre siralayiniz

select * from insanlar2 where isim='Mine' ORDER BY ssn



-- siralama da field numarasi da kullanabiliriz

select * from insanlar2 where soyisim='Bulut' ORDER BY 2
--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar2 order by 1 desc; -- tersten büyükten kücüge dogru siralamak icin descendig (desc) yaziyoruz. Ascendig (asc) kucukten büyüge dogru siralama


-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

select * from insanlar2 ORDER BY isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız LENGTG 

select * from insanlar2
order by LENGTH (isim)

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

select concat (isim,'',soyisim) as isim_soyisim from insanlar2 order by length(isim)+length(soyisim)
select isim||''||soyisim as isim_soyisim from insanlar2


-- GROUP BY CLAUSE

CREATE TABLE manav
(
isim varchar(50), Urun_adi varchar(50), Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav
 --isme gore alinan toplam urunlöeri sorgulayiniz
 
 select isim, sum(urun_miktar) from manav --once manav listesinden isim ve karsiliginda  toplam urunleri getir diyoruz, sonda isme gore grup yap diyoruz
 group by isim
 order by isim 
 
 -- Urun ismine gore urunu alan toplam kisi sayisi
 SELECT urun_adi, count (isim) from manav
 group by urun_adi


-- Alinan kilo miktarina gore musteri sayisi 

select urun_miktar, count (isim)as alinan_urunler_kisi_sayisi from manav
group by (urun_miktar)

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


select * from personel

--isme gore toplam maaslari bulun
select isim,sum(maas) from personel
group by isim
--sehre gore toplam personel sayisini bulunuz
select sehir, count(isim)from personel
group by (sehir)

--sirketlere gore maasi 5000 den fazla olan personel sayisini bulalim
select sirket, count(isim) from personel where maas>5000 -- sirketlere gore grup yap ve burda calisanlardan 5000 den fazla olanlari yazdir
group by sirket 
--her sirket icin min ve max maaslari bulun

select sirket, min(maas),max(maas) from personel
group by sirket

-- HAVING komutu, bir filtreleme komutudur

-- Her sirketin MIN maaslarini eger 2000’den buyukse goster
select sirket, min(maas) from personel group by(sirket) having min(maas)>3500 -- burda once grupmala yapiyor, min maaslari buluyor  sonra tekrardan filtreliyor