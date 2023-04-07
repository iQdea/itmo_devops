CREATE TABLE notes (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO notes (content)
    VALUES ('First note');
