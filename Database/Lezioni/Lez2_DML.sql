--CRUD
--INSERIRE nuovi record
INSERT INTO tableName(field1, field3)
VALUES(value1, value3);

--inserire più record insieme
INSERT INTO tableName(field1, field2, field3,...)
VALUES(r1_value1, r1_value2, r1_value3, ...),(r2_value1, r2_value2, r2_value3, ...);

--inserire con set
INSERT INTO tableName
SET field1 = 'value1', field2 = 'value2', field3 = 'value2';

--esempio
INSERT INTO studente
VALUES(1, 'fabio','rossi','fbr@gmail.com','1995-05-05','2021-10-27 12:10:53');

--MOSTRARE i record
SELECT * FROM tableName;
--oppure
SELECT fieldName, fieldName2, fieldName3 FROM tableName;

--esempio 1
INSERT INTO amico(nome, cognome)
SELECT nome, cognome
FROM studente;

--esempio completo
CREATE TABLE parente (
id INT AUTO_INCREMENT,
nome VARCHAR(20),
cognome VARCHAR(30),
PRIMARY KEY(id)
) SELECT nome, cognome FROM amico;

--duplicare tabella con i suoi contenuti
CREATE TABLE studente_bk LIKE studente;
INSERT INTO studente_bk SELECT * FROM studente;
--oppure
CREATE TABLE studente_bk2 AS
SELECT * FROM studente;

--UPDATE 
UPDATE tableName --UPDATE indichiamo quale tabella è interessata
SET field1 = value1, field2 = value2 --SET specifichiamo quali colonne modificare e quali valori assegnare
WHERE field3 = value3; --WHERE(opzionale) stabiliamo le condizioni che determinano quali righe saranno interessate dalle modifiche

--DELETE
DELETE -- si eliminano tutti i record presenti
FROM tableName
WHERE field = value;

--Per svuotare una tabella
TRUNCATE [TABLE] tableName;

--CONOSCERE LA STRUTTURA DELLA TABELLA
DESCRIBE tableName; DESC tableName;
--
SHOW COLUMNS FROM tableName;
--
SHOW FULL COLUMNS FROM tableName;
--
SHOW INDEX FROM tableName;
--
SHOW TABLE STATUS LIKE 'tableName';

