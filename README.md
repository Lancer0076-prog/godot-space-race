# 🚀 «Первый космический» (The Space Race Incremental)

Нарративный incremental / idle-симулятор на **Godot 4 (GDScript)** в эстетике аналогового ретро 1950–1975 гг.: осциллографы, лампы ИН-14, перфокарты, телетайп и дилемма «Надёжность vs Спешка».

## Особенности
- **Многооконный интерфейс ОКБ / Mission Control** — подсистемы сворачиваются и продолжают работать в фоне.
- **Headless Playtest Bot (`scripts/run_playtest.gd`)** — автономный CLI-бот для ускоренной математической симуляции экономики и проверки кривой прогрессии без запуска GUI:
  ```bash
  godot --headless --script res://scripts/run_playtest.gd -- --seconds 600 --profile balanced
  ```

📝 Подробнее в блоге: [LancerLab — Headless-боты и ретро-UI на Godot 4](http://lancer0076.keenetic.pro:8081/godot4-space-race-headless-bots/)
