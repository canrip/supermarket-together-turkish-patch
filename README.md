# Supermarket Together Türkçe Yama

Supermarket Together için hazırlanmış Türkçe dil yamasıdır. İngilizce dili orijinal bırakır ve dil listesine `Türkçe` seçeneği ekler.

## İndirme

1. GitHub sayfasında yeşil `Code` butonuna basın.
2. `Download ZIP` seçeneğine tıklayın.
3. İndirilen ZIP dosyasını çıkarın.

## Kurulum

1. Steam'de oyuna sağ tıklayın.
2. `Yönet > Yerel dosyalara göz at` seçeneğini açın.
3. ZIP'ten çıkan klasörün adını `TurkishMod` yapın.
4. Bu `TurkishMod` klasörünü açılan oyun klasörünün içine kopyalayın.

Klasör yapısı şöyle görünmeli:

```text
Supermarket Together
├─ Supermarket Together.exe
├─ Supermarket Together_Data
└─ TurkishMod
   ├─ Yamayi-Yonetici-Olarak-Kur.bat
   ├─ Yamayi-Kur.ps1
   ├─ install-turkish-as-separate-option.ps1
   ├─ Localization_TR_starter.xml
   ├─ kilitle.ps1
   ├─ kilidi-ac.ps1
   └─ README_TR.md
```

5. `TurkishMod` klasörüne girin.
6. `Yamayi-Yonetici-Olarak-Kur.bat` dosyasına sağ tıklayın.
7. `Yönetici olarak çalıştır` seçeneğini seçin.
8. Windows izin isterse `Evet` deyin.
9. Kurulum tamamlandıktan sonra oyunu açın.
10. Ayarlardan dil listesinden `Türkçe` seçin.

## Güncelleme Sonrası

Oyun güncellenirse veya Steam'den dosya doğrulaması yaparsanız yama silinebilir. Böyle bir durumda aynı kurulum dosyasını tekrar çalıştırın:

```text
TurkishMod\Yamayi-Yonetici-Olarak-Kur.bat
```

## Kaldırma

Yamayı kaldırmanın en kolay yolu Steam üzerinden oyun dosyalarını doğrulamaktır:

1. Steam'de oyuna sağ tıklayın.
2. `Özellikler > Yüklü Dosyalar` bölümüne girin.
3. `Oyun dosyalarının bütünlüğünü doğrula` seçeneğini çalıştırın.

Alternatif olarak `Supermarket Together_Data\resources.assets.bak-before-turkish` yedeğini `resources.assets` adıyla geri kopyalayabilirsiniz.

## Notlar

- Yama Macarca dil slotunu kullanır. Bu yüzden oyunda Macarca yerine `Türkçe` görünür.
- İngilizce dil seçeneği orijinal haliyle kalır.
- Kurulum dosyalarının oyun klasörüne yazabilmesi için yönetici izni gerekebilir.
