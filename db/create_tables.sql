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
  ('Mocha', 'hippo1.png'),
  ('Salem', 'hippo2.png'),
  ('Strawberry', 'hippo3.gif'),
  ('Felix', 'hippo4.png'),
  ('Sennacy', 'hippo5.png'),
  ('Barty', 'hippo6.gif'),
  ('McFly', 'hippo7.jpg'),
  ('Splatz', 'hippo8.jpg'),
  ('J.D.', 'hippo10.gif'),
  ('Groudy', 'hippo11.jpg'),
  ('Meira', 'hippo12.jpg'),
  ('Lilin', 'hippo13.jpg'),
  ('Hodor', 'hippo14.jpg'),
  ('Makesh', 'hippo15.png'),
  ('Hoofla', 'hippo16.png');

INSERT INTO
  desserts (type, hungry_hippo_id)
VALUES
  ('chocolate', (SELECT id FROM hungry_hippos WHERE name = 'Mocha')),
  ('ice cream', (SELECT id FROM hungry_hippos WHERE name = 'Salem')),
  ('Strawberry Shortcake', (SELECT id FROM hungry_hippos WHERE name = 'Mocha')),
  ('Vanilla pudding', (SELECT id FROM hungry_hippos WHERE name = 'Salem')),
  ('cupcake', (SELECT id FROM hungry_hippos WHERE name = 'Sennacy')),
  ('fried ice cream', (SELECT id FROM hungry_hippos WHERE name = 'Barty')),
  ('turkish delight', (SELECT id FROM hungry_hippos WHERE name = 'Mocha')),
  ('fruit salad', (SELECT id FROM hungry_hippos WHERE name = 'Mocha'));
