# Sekas

Tarayıcıda çalışan 3B orman hayatta kalma ve köy oyunu (Three.js).

## Çalıştırma

Oyun `assets/` klasöründen dosya yüklediği için bir yerel sunucu üzerinden açılmalı:

```bash
python3 -m http.server 8000
# sonra tarayıcıda: http://localhost:8000/index.html
```

## Dosyalar

- `index.html` — arayüz (HTML/CSS)
- `game.js` — oyun kodu (Three.js ve fizik motoru dahil)
- `assets/` — karakter, hayvan, silah modelleri ve dokular

## Kontroller (özet)

- `W A S D` yürü, `Shift` koş, `Boşluk` zıpla / tırman, `C` çömel (suda: dal)
- `E` etkileşim, `Tab` envanter, `V` kamera modu, `J` rehberi gizle
- `Q` eşyayı at (`Shift+Q` hepsini), `R` yapı parçasını döndür
- Envanterde kıyafete **sağ tık**: giy · giyim yuvasına **tık**: çıkar
- Oyun odaktayken tarayıcı kısayolları (Ctrl+D, Alt…) engellenir; Ctrl+Shift gibi
  Windows dil değiştirme tuşları oyunda kullanılmaz.

## Yapı sistemi

- Odun, kesilen ağacın türüne göre renk alır (meşe, çam, huş = beyaz, elma, kuru = siyah).
- Yapı parçaları: temel, duvar, pencereli duvar, alçak duvar, kapı çerçevesi + kapı, direk,
  zemin/tavan, merdiven, çatı, çit; mobilya: masa, sandalye, yan sehpa, raf.
  Parçalar hangi odundan yapıldıysa o renkte olur; taştan da yapılabilir.
- Kovayla kumsaldan kum toplanır; taş fırında kum cama dönüşür; cam pencere yapımında kullanılır.
