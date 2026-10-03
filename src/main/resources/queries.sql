-- 1) Biyografi türünü tür tablosuna ekleyiniz.
INSERT INTO tur(ad) VALUES ('Biyografi');

-- 2) Nurettin Belek isimli yazarı yazar tablosuna ekleyiniz.
INSERT INTO yazar(ad, soyad) VALUES ('Nurettin', 'Belek');

-- 3) 10B sınıfındaki öğrencileri 10C sınıfına geçirin.
UPDATE ogrenci SET sinif = '10C' WHERE sinif = '10B';

-- 4) Tüm kitapların puanını 5 puan arttırınız.
UPDATE kitap SET puan = puan + 5;

-- 5) Adı Mehmet olan tüm yazarları silin.
DELETE FROM yazar WHERE ad = 'Mehmet';

-- 6) Kişisel Gelişim isimli bir tür oluşturun.
INSERT INTO tur(ad) VALUES ('Kişisel Gelişim');

-- 7) 'Benim Üniversitelerim' isimli kitabın türünü 'Kişisel Gelişim' yapın.
UPDATE kitap SET turno = (SELECT turno FROM tur WHERE ad = 'Kişisel Gelişim')
WHERE ad = 'Benim Üniversitelerim';

-- 8) Tüm öğrencileri görüntüleyen "ogrencilistesi" adında bir fonksiyon oluşturun.
CREATE OR REPLACE FUNCTION ogrencilistesi()
RETURNS SETOF ogrenci
LANGUAGE sql
AS $$
    SELECT * FROM ogrenci;
$$;

-- 9) kitap tablosuna yeni kitap eklemek için "ekle" adında bir prosedür oluşturun.
CREATE OR REPLACE PROCEDURE ekle(p_ad VARCHAR, p_puan INTEGER, p_yazarno BIGINT, p_turno BIGINT)
LANGUAGE sql
AS $$
    INSERT INTO kitap(ad, puan, yazarno, turno) VALUES (p_ad, p_puan, p_yazarno, p_turno);
$$;

-- 10) Öğrenci noya göre öğrenci silebilmeyi sağlayan "sil" adında bir prosedür oluşturun.
CREATE OR REPLACE PROCEDURE sil(p_ogrno BIGINT)
LANGUAGE sql
AS $$
    DELETE FROM ogrenci WHERE ogrno = p_ogrno;
$$;
