CREATE TABLE IF NOT EXISTS books (
    id TEXT NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    filePath TEXT NOT NULL,
    coverPath TEXT,
    format TEXT NOT NULL,
    progress REAL NOT NULL DEFAULT 0,
    chapterIndex INTEGER NOT NULL DEFAULT 0,
    scrollRatio REAL NOT NULL DEFAULT 0,
    chapterCount INTEGER NOT NULL DEFAULT 1,
    addedAt INTEGER NOT NULL,
    lastReadAt INTEGER,
    finishedAt INTEGER,
    externalInfo TEXT
);

CREATE TABLE IF NOT EXISTS reading_sessions (
    id TEXT NOT NULL PRIMARY KEY,
    bookId TEXT NOT NULL,
    startedAt INTEGER NOT NULL,
    endedAt INTEGER NOT NULL,
    progressDelta REAL NOT NULL DEFAULT 0
);
