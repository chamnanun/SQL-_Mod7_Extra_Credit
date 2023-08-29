CREATE TABLE card_holder (
	id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE credit_card (
	card VARCHAR(20) PRIMARY KEY NOT NULL, 
	cardholder_id INT NOT NULL,
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
); 

CREATE TABLE merchant_category (
	id SMALLINT NOT NULL PRIMARY KEY,
	name VARCHAR(20) NOT NULL
);

CREATE TABLE merchant (
	id INTEGER NOT NULL PRIMARY KEY,
	name CHARACTER VARYING (50) NOT NULL,
	id_merchant_category INTEGER NOT NULL,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

CREATE TABLE transaction (
	id INT NOT NULL PRIMARY KEY,
	date TIMESTAMP without time zone NOT NULL,
	amount FLOAT, 
	card CHARACTER VARYING (20),
	FOREIGN KEY (card) REFERENCES credit_card (card),
	id_merchant INTEGER,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);