# Диаграмма файлов приложения

## Диаграмма компонентов

```mermaid
flowchart TB
    subgraph presentation [Presentation]
        MainActivity
        ReaderActivity
        LibraryScreen
        StatsScreen
        ReaderScreen
        LibraryViewModel
        ReaderViewModel
    end
    subgraph domain [Data]
        BookRepository
        OpenLibraryApi
    end
    subgraph parser [Parsers]
        EpubParser
        Fb2Parser
    end
    subgraph storage [Storage]
        LibraryDatabase
        BookDao
        ReadingSessionDao
        assetsBooks[assets/books]
        filesDir[filesDir/books]
    end
    MainActivity --> LibraryScreen
    MainActivity --> StatsScreen
    ReaderActivity --> ReaderScreen
    LibraryScreen --> LibraryViewModel
    ReaderScreen --> ReaderViewModel
    LibraryViewModel --> BookRepository
    ReaderViewModel --> BookRepository
    BookRepository --> LibraryDatabase
    BookRepository --> EpubParser
    BookRepository --> Fb2Parser
    BookRepository --> OpenLibraryApi
    BookRepository --> assetsBooks
    BookRepository --> filesDir
```

## Структура каталогов

```
Library/
├── app/
│   ├── src/main/
│   │   ├── assets/books/          # Предустановленные EPUB
│   │   ├── java/com/example/library/
│   │   │   ├── MainActivity.kt
│   │   │   ├── ReaderActivity.kt
│   │   │   ├── LibraryApplication.kt
│   │   │   ├── api/               # Open Library
│   │   │   ├── data/              # Repository, Room
│   │   │   ├── parser/            # EPUB, FB2
│   │   │   └── ui/                # Compose, ViewModel
│   │   └── res/
│   └── src/test/                  # Unit-тесты
├── books/                         # Исходные EPUB проекта
├── database/schema.sql
├── docs/
│   ├── presentation.md
│   └── screenshots/               # Скриншоты для wiki
├── wiki/                          # Документация wiki
└── .github/workflows/             # CI
```

## Описание ключевых файлов

| Файл / пакет | Назначение |
|--------------|------------|
| `MainActivity.kt` | Точка входа, навигация: каталог ↔ статистика |
| `ReaderActivity.kt` | Полноэкранная читалка |
| `LibraryApplication.kt` | Инициализация БД и репозитория |
| `BookRepository.kt` | Импорт, чтение глав, прогресс, статистика |
| `EpubParser.kt` | Разбор ZIP/OPF, обложка, HTML глав |
| `Fb2Parser.kt` | Разбор XML FictionBook |
| `OpenLibraryApi.kt` | HTTP-запросы к openlibrary.org |
| `LibraryDatabase.kt` | Room: books, reading_sessions |
| `ui/screens/LibraryScreen.kt` | Список книг, FAB, удаление |
| `ui/screens/ReaderScreen.kt` | WebView-читалка |
| `ui/screens/StatsScreen.kt` | Статистика за месяц |
| `ui/ReaderWebView.kt` | WebView с поддержкой прокрутки в Compose |

## Поток данных при чтении

```mermaid
sequenceDiagram
    participant U as Пользователь
    participant R as ReaderScreen
    participant VM as ReaderViewModel
    participant Repo as BookRepository
    participant P as EpubParser
    participant DB as Room
    U->>R: Открыть книгу
    R->>VM: load(bookId)
    VM->>Repo: getBook, getChapters
    Repo->>P: parse(epub)
    Repo->>DB: SELECT book
    VM->>Repo: readChapter(href)
    Repo->>P: readChapterHtml
    VM->>R: chapterHtml, baseUrl
    R->>U: WebView + прокрутка
    U->>R: Выход
    R->>VM: persistProgress
    VM->>Repo: updateProgress
    Repo->>DB: UPDATE books, INSERT session
```
