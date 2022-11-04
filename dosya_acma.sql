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
