# Презентация проекта «Библиотека»

## Команда

| ФИО | Курс | Группа | Направление |
|-----|------|--------|-------------|
| **Головина Екатерина** | 3 | 11 | МСС |
| **Галяш Александра** | 3 | 11 | МСС |

Дисциплина: **ПМВС** — разработка мобильного приложения для Android.

## Тема проекта

Мобильная библиотека-читалка электронных книг (EPUB, FB2) с каталогом, обложками, прогрессом чтения и месячной статистикой.

## Распределение задач

| № | Задача | Исполнитель |
|---|--------|-------------|
| 1 | Проектирование, постановка задачи, README/wiki | Головина Е., Галяш А. |
| 2 | UI каталога и статистики (Jetpack Compose) | Головина Е., Галяш А. |
| 3 | `ReaderActivity`, WebView-читалка, прокрутка | Головина Е. |
| 4 | Парсер EPUB (ZIP, OPF, обложки) | Головина Е. |
| 5 | Парсер FB2 | Головина Е. |
| 6 | Room, репозиторий, прогресс, сессии | Галяш А. |
| 7 | Open Library API | Галяш А. |
| 8 | Unit-тесты, GitHub Actions, APK | Головина Е., Галяш А. |
| 9 | Скриншоты, оформление wiki | Головина Е., Галяш А. |

## Требования к приложению

- Каталог книг с обложкой и прогрессом
- Импорт EPUB/FB2 (+ 5 книг в assets)
- Читалка с главами, темой, шрифтом, прокруткой
- Статистика за месяц
- Room + внешний API + многопоточность
- CI: тесты + артефакт APK

## Схема БД

Две таблицы: `books`, `reading_sessions`. Подробнее: [wiki/Database-Schema.md](../wiki/Database-Schema.md).

## Работа с репозиторием

- Git, публичный репозиторий
- GitHub Actions: `test`, `assembleDebug`, `connectedDebugAndroidTest`
- Документация: `README.md`, `wiki/`, `docs/screenshots/`

## Демонстрация (скриншоты)

| Экран | Файл |
|-------|------|
| Каталог | [01-library.png](screenshots/01-library.png) |
| Каталог 100% | [02-library-completed.png](screenshots/02-library-completed.png) |
| Смешанный прогресс | [13-library-mixed-progress.png](screenshots/13-library-mixed-progress.png) |
| Добавление книги | [03-library-book-added.png](screenshots/03-library-book-added.png) |
| Статистика (начало) | [04-stats-empty.png](screenshots/04-stats-empty.png) |
| Статистика (завершено) | [05-stats-completed.png](screenshots/05-stats-completed.png) |
| Читалка | [06-reader-chapter1.png](screenshots/06-reader-chapter1.png) |

Полная галерея: [wiki/Screenshots.md](../wiki/Screenshots.md).

## Итоги

Приложение соответствует требованиям лабораторной: многооконный UI, touch, Room, coroutines, внешний API, Compose, CI, документация с wiki и скриншотами.
