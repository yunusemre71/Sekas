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

- `W A S D` yürü, `Shift` koş, `Boşluk` zıpla / tırman
- `C` suda dal, `Boşluk` suda yüksel
- `E` etkileşim, `Tab` envanter, `V` kamera modu, `J` rehberi gizle
- Envanterde kıyafete **sağ tık**: giy · giyim yuvasına **tık**: çıkar
