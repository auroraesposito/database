--Ordinare i risultati ordine crescente
SELECT *
FROM studente
ORDER BY cognome; 

--Ordinare i risultati ordine decrescente
SELECT *
FROM studente
ORDER BY cognome DESC;

--ordinare per nome con ordinamento DESC e per eta con ordinamento ASC
SELECT *
FROM studente
ORDER BY cognome DESC, eta;

--LIMIT: definisce il numero massimo dei record da visualizzare
SELECT *
FROM studente
ORDER BY cognome
LIMIT 10;

--WHERE: filtrare i risultati
SELECT nome, cognome
FROM studente
WHERE genere = 'm';

--OPERATORI
--Operatori di confronto
    =, <>, !=, >, >=, <, <=
--Operatore logici
    AND, OR
--Operatori di confronto avanzati
IN, NOT IN, BETWEEN, NOT BETWEEN, IS NULL, IS NOT NULL,
LIKE, NOT LIKE
--Operatori matematici
+, -, *, /, %

--esempi
SELECT nome, cognome, email, data_nascita
FROM studente
WHERE data_nascita >= '1989-12-31'
ORDER BY data_nascita;
--and: tutte le condizioni devono essere vere.
SELECT nome, cognome, email, data_nascita
FROM studente
WHERE genere = 'm' AND provincia = 'to';
--or: almeno una delle condizioni
SELECT nome, cognome, email, data_nascita
FROM studente
WHERE genere = 'm' OR provincia = 'to';
-- combinata
SELECT * FROM studente
WHERE (cognome='verdi' AND provincia='to')
OR (cognome='rossi' AND provincia='mi');
--in: selezionare i record indicando più valori di campo.
SELECT nome, cognome, email, data_nascita
FROM studente
WHERE provincia IN ('to','cn','at','no');
-- between: selezionare un intervallo di valori.
SELECT nome, cognome, email, data_nascita
FROM studente
WHERE data_nascita 
BETWEEN '1985-01-01' AND '1994-12-31';
--like: effettuare dei "paragoni di somiglianza”.
SELECT * FROM studente WHERE nome LIKE 'm%';

--Posiamo usare un alias per creare etichette più chiare nei risultati della query.
SELECT titolo, prezzo AS 'prezzo senza IVA', 
prezzo * 1.1 AS 'con IVA 10%'
FROM libro;

--INTERROGARE PIU TABELLE


