--DDL - Data Definition Language: 

--gestire il controllo degli accessi e i permessi per gli utenti
CREATE USER 'vecchione'@'localhost' IDENTIFIED BY 'password';

--Dare gli accessi a tutti al db
GRANT ALL
ON nomedb.*
TO 'user'@'localhost';

--permette di definire la struttura del database
CREATE DATABASE databaseName; --crea un nuovo database
DROP DATABASE databaseName; --cancella il database
CREATE TABLE tableName(...); --crea una nuova tabella nel DB
ALTER TABLE tableName ... ; --modifica la struttura di una tabella
DROP TABLE tableName ... ; --cancella una tabella dal DB
CREATE INDEX indexName ... ; --crea un indice su una certa tabella
ALTER TABLE tableName DROP INDEX indexName ... ; --elimina l’indice specificato

--permette di modificare i dati contenuti nel db, con le operazioni di inserimento, variazione e cancellazione
--inserimento:
INSERT INTO tableName(field1, field2, ...)
VALUES ('value1', 'value2', '...');

--Cancellazione
DELETE FROM tableName
WHERE column_name = some_value;

--Aggiornamento
UPDATE tableName
SET column_name = new_value
WHERE column_name = some_value;

--Query Language: permette di porre interrogazioni al db
SELECT field(s) --SELECT vengono selezionati dei campi (attributi) da una o più tabelle erestituiti all'utente sotto forma di una "nuova tabella" (resultset)
FROM table(s) 
WHERE condition(s); --WHERE è possibile filtrare il resultset sulla base di alcune regole


--CREARE TABELLE
CREATE TABLE IF NOT EXISTS nome_tabella(
id INT AUTO_INCREMENT PRIMARY KEY,
fieldName1 VARCHAR(60) NOT NULL,
fieldName2 DATE,
fieldName3 TINYINT ZEROFILL
)

--esempio creazione
CREATE TABLE IF NOT EXISTS studente(
id INT AUTO_INCREMENT,
nome VARCHAR(20),
cognome VARCHAR(30),
genere ENUM('m','f'),
indirizzo VARCHAR(100),
citta VARCHAR(30),
provincia CHAR(2) DEFAULT 'To',
regione VARCHAR(30) DEFAULT 'Piemonte',
email VARCHAR(100) NOT NULL UNIQUE,
data_nascita date,
ins TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY(id),
KEY k_cogn(cognome)
);

--verificare se la nostra tabella è stata creata
SHOW TABLES;

--verificare che la struttura della tabella sia corretta
SHOW CREATE TABLE tableName;

--visualizzare come è stata creata una tabella:
DESCRIBE tableName; DESC tableName;

--Rinominare una tabella:
ALTER TABLE tableName RENAME TO newtableName;
RENAME TABLE tableName TO newtableName;

--conoscere la struttura della tabella
DESCRIBE tableName; DESC tableName;
SHOW COLUMNS FROM tableName;
SHOW FULL COLUMNS FROM tableName;

--Per avere maggiori dettagli sulla tabella, tra cui il valore dell'auto_increment, data di creazione, collation...
SHOW TABLE STATUS LIKE 'tableName';

--Per conoscere solo il valore dell’auto_increment di una tabella possiamo interrogare anche il db
SELECT AUTO_INCREMENT
FROM information_schema.tables
WHERE table_schema = 'databaseName'
AND table_name = 'tableName';

--esempio INFORMATION_SCHEMA
SELECT table_name, table_type, engine, table_collation
FROM information_schema.tables
WHERE table_schema = 'databaseName'
ORDER BY table_name;

--MODIFICARE LE TABELLE
--Per aggiungere un campo a una tabella, utilizzare la seguente sintassi:
ALTER TABLE tableName
ADD fieldName DATATYPE;

--Per modificare nome e datatype di un campo di una tabella
ALTER TABLE tableName
CHANGE fieldName newFieldName DATATYPE;

--Per modificare solo datatype di un campo di una tabella
ALTER TABLE tableName
MODIFY fieldName DATATYPE;

--Per modificare solo nome di un campo di una tabella
ALTER TABLE tableName
RENAME COLUMN oldName TO newName;

--Per cancellare un campo di una tabella
ALTER TABLE tableName
DROP fieldName;

--Potete combinare le istruzioni separandole con una virgola
ALTER TABLE tableName
CHANGE fieldName newFieldName DATATYPE,
ADD fieldName3 DATATYPE AFTER fieldName2,
DROP fieldName4;

--Per aggiungere un campo in una data posizione
ALTER TABLE tableName
ADD fieldName2 DATATYPE
AFTER fieldName; --Usando FIRST al posto di AFTER si aggiunge il campo in prima posizione, FIRST non vuole il nome del campo

--Per spostare un campo in una tabella
ALTER TABLE tableName
MODIFY fieldName2 DATATYPE
AFTER fieldName;

--Per spostare un campo in prima posizione
ALTER TABLE tableName
MODIFY fieldName2 DATATYPE
FIRST;

--INDICI
--creare un indice
CREATE INDEX indexName
ON tableName(fieldName);

--aggiungere un index
ALTER TABLE tableName
ADD INDEX indexName(fieldName);

--eliminare
DROP INDEX indexName ON tableName;
ALTER TABLE tableName DROP INDEX indexName;

--rinominare
ALTER TABLE tableName RENAME INDEX oldName TO newName;

--mostrare gli indici
SHOW INDEX FROM tableName;

--aggiungere una PRIMARY KEY
ALTER TABLE tableName ADD PRIMARY KEY (field1[, field2, ...]);

--Aggiungere alla tabella la PRIMARY KEY aggiungendo campo nuovo apposito:
ALTER TABLE tableName
ADD id INT AUTO_INCREMENT PRIMARY KEY;

--Modificare la PRIMARY KEY
ALTER TABLE tableName MODIFY id INT;
ALTER TABLE tableName DROP PRIMARY KEY;

--duplicare tabella
CREATE TABLE tableNameCopy LIKE tableName;

--cancella tabella dal database
DROP TABLE tableName;
--oppure
DROP TABLE tableName, tableName2, tableName3;



