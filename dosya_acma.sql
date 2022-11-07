--schemas tablolar demek, icerisinde tables komutu var
-- not satiri 
-- query tool yaptigimiz da o dosyanin icerisine giriyoruz
--create  tablo olusturma icin kullaniyoruz, tabloyu yazarken hepsini yanyana da yazabiliriz
create table ogrenciler
(
id char(4),--4 karakter yer ayiriyoruz, burda virguller önemli 
isim_soyisim varchar(30),-- 30 karakter yer 
not_ort real, --ondalikli sayi 
kayit_tarih date -- yil-ay-gün olarak yazmamiz gerekiyor
);
--noktali virgul olmasa da olur ama koysak daha iyi,
--VAR OLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_ortalama
AS SELECT  isim_soyisim, not_ort
from ogrenciler;

--select-DQL-(data sorgulama dili )
select * from ogrenciler -- * burada herseyi anlamina geliyor, ogrenciler tablosundaki herseyi cagiriyor
select * from ogrenci_ortalama
select isim_soyisim from ogrenciler -- sadece isim_soyisim satirini(field) cagirmis olduk.
select isim_soyisim, not_ort from ogrenci_ortalama -- isi_soyisim ve not_ort fieldini cagirdik
-- ON DELETE CASCADE KULLANIMI
--parent table


CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
--child table
CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
select * from talebeler
select * from notlar
DELETE from notlar where talebe_id='123';-- child
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. parent taki veri silinmez.
DELETE from talebeler where id='126';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.
DELETE FROM talebeler; -- Parent tablo ile birlikte child tablo daki verileride siler


-id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
-D ile Y arasındaki personel bilgilerini listeleyiniz
-D ile Y arasında olmayan personel bilgilerini listeleyiniz
-Maaşı 70000 ve ismi Sena olan personeli listeleyiniz

CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);







