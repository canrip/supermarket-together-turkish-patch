# Supermarket Together Türkçe Mod Çalışma Alanı

Bu klasör, oyunun `resources.assets` içindeki lokalizasyon tablolarından çıkarıldı.

## Dosyalar

- `Localization_TR_starter.xml`: Gelişmiş Türkçe çeviri dosyası. 1742 metin satırının tamamı Türkçeye dönüştürüldü.
- `install-turkish-as-separate-option.ps1`: English dilini orijinal bırakır; Macarca slotunu menüde `Türkçe` adıyla kullanarak Türkçeyi ayrı seçenek gibi kurar.
- `Yamayi-Yonetici-Olarak-Kur.bat`: Yamayı yönetici olarak kurmak için çalıştırılacak ana dosya.
- `Yamayi-Kur.ps1`: Ana kurulum akışı.
- `kilitle.ps1` / `kilidi-ac.ps1`: Mod dosyalarını salt okunur yapar veya tekrar düzenlenebilir hale getirir.

## Kurulum

PowerShell'i bu oyun klasöründe açıp çalıştır:

```powershell
.\TurkishMod\install-turkish-as-separate-option.ps1
```

Sonra oyunda dil listesinden `Türkçe` seç. Bu yöntem İngilizceyi orijinal bırakır.

## Çeviri Yapma

`Localization_TR_starter.xml` içindeki satırlar şu formatta:

```xml
<option id="title0" dialogue="Yeni Mağaza"></option>
```

Sadece `dialogue="..."` içindeki metni çevir. `id` değerlerini değiştirme.

Türkçe dosya, İngilizce dil bloğunun bayt alanından büyük olamaz. Betik bunu kontrol eder ve sığmazsa yazmadan durur.

## Geri Alma

`Supermarket Together_Data\resources.assets.bak-before-turkish` dosyasını `resources.assets` adıyla geri kopyala. Alternatif olarak Steam'den oyun dosyalarını doğrulatabilirsin.
