CREATE TABLE contacts (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT
);

CREATE TABLE phones (
number TEXT,
contact_id INTEGER REFERENCES contacts (id)
);

CREATE TABLE email (
address TEXT,
contact_id INTEGER REFERENCES contacts (id)
);