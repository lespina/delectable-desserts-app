CREATE TABLE hungry_hippos (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image_url VARCHAR(255)
);

CREATE TABLE desserts (
  id INTEGER PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  hungry_hippo_id INTEGER NOT NULL,

  FOREIGN KEY (hungry_hippo_id) REFERENCES hungry_hippos(id)
);

INSERT INTO
  hungry_hippos (name, image_url)
VALUES
  ('Mocha', 'mocha.png'),
  ('Salem', 'salem.png');

INSERT INTO
  desserts (type, hungry_hippo_id)
VALUES
  ('chocolate', (SELECT id FROM hungry_hippos WHERE name = 'Mocha')),
  ('ice cream', (SELECT id FROM hungry_hippos WHERE name = 'Salem'));
