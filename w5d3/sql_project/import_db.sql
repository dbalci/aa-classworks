PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS  question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS  question_likes;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES users(id)
);



CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);



CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  child_reply_id INTEGER,
  child_reply TEXT,
  
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (child_reply_id) REFERENCES replies(id)
);



CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  likes INTEGER,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Rick', 'Sanchez'),
  ('Morty', 'Sanchez');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Why?', 'Why on earth?', (SELECT id FROM users WHERE id = 1)),
  ('How?', 'Will it work?', (SELECT id FROM users WHERE id = 2));

INSERT INTO
  question_follows (users_id, question_id)
VALUES
  (1,1),
  (2,2);

INSERT INTO
  replies ( users_id, question_id, body, child_reply, child_reply_id)
VALUES
  (2, 1, 'just beacuse!',NULL, NULL);