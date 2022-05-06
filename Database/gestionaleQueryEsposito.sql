/* 1) Valore del magazzino */

select format(sum(prezzo * rimanenza),2,'de_DE') 'Valore magazzino' from articolo
/*
+------------------+
| Valore magazzino |
+------------------+
| 340.573,50       |
+------------------+
*/



/* 2) Valore del magazzino per categoria */
select categoria,  sum(prezzo * rimanenza) as "Valore magazzino" 
from articolo group by categoria
/*
+-----------+------------------+
| categoria | Valore magazzino |
+-----------+------------------+
| hardware  | 106.676,00       |
| software  | 233.897,50       |
+-----------+------------------+
*/

/* 3) articoli ordinati e quantità relative ordinati per quantità */
select descrizione, sum(quantita) 'ordinati' 
from ordine_dettaglio, articolo
where articolo_id = articolo.id
group by descrizione
order by ordinati desc;
/*
+-------------+----------+
| descrizione | ordinati |
+-------------+----------+
| chiavetta   |       16 |
| monitor     |       13 |
| Webcam      |        6 |
| hard-disk   |        6 |
| Office      |        5 |
| smartwatch  |        4 |
| Photoshop   |        2 |
+-------------+----------+
*/

/* 4) quantità articoli ordinati, divisi per categoria */
select categoria, sum(quantita) 'ordinati'
from ordine_dettaglio, articolo
where articolo_id = articolo.id
group by categoria
order by quantita desc
/*
+-----------+----------+
| categoria | ordinati |
+-----------+----------+
| hardware  |       45 |
| software  |        7 |
+-----------+----------+
*/

/* 5) articoli ordinati nell'ordine con id=7 */
select  descrizione, quantita
from ordine_dettaglio, articolo
where articolo_id = articolo.id AND ordine_id = 7
/*
+-------------+----------+
| descrizione | quantita |
+-------------+----------+
| chiavetta   |        5 |
| hard-disk   |        2 |
| Webcam      |        1 |
+-------------+----------+
*/

/* 6) Valore degli ordini: Totale denaro speso dai clienti  */
select  sum(quantita * prezzo) 'Valore ordini'
from ordine_dettaglio, articolo
where articolo_id = articolo.id
/* 
+---------------+
| Valore ordini |
+---------------+
| 12.126,50     |
+---------------+
*/

/* 7) Seleziono cognome, email dei clienti che hanno effettuato ordini */
select cognome, email
from ordine, cliente
where cliente_id = cliente.id
group by cognome
order by cognome
/*
+----------+----------------------+
| cognome  | email                |
+----------+----------------------+
| bianchi  | luca2@gmail.com      |
| esposito | francoe@icloud.com   |
| rossi    | paolo25@gmail.com    |
| rosso    | alberto12@icloud.com |
+----------+----------------------+
*/

/* 8) Seleziono nome del cliente, l'id dell'ordine e la data */
select  cognome,ordine.id, data
from ordine, cliente
where cliente_id = cliente.id
order by cognome
/*
+----------+----+------------+
| cognome  | id | data       |
+----------+----+------------+
| bianchi  |  2 | 2018-01-11 |
| bianchi  |  4 | 2018-01-23 |
| bianchi  | 12 | 2018-02-28 |
| esposito |  5 | 2018-02-03 |
| esposito |  7 | 2018-02-13 |
| rossi    |  1 | 2017-12-01 |
| rosso    |  3 | 2018-01-21 |
+----------+----+------------+
*/

/* 9) Seleziono i clienti e il denaro speso in totale da ciascuno */
select  cognome, sum(articolo.prezzo * ordine_dettaglio.quantita) 'Speso'
from ordine, cliente, articolo, ordine_dettaglio
where cliente_id = cliente.id AND ordine_dettaglio.ordine_id = ordine.id AND articolo_id = articolo.id
group by cognome
order by cognome
/*
+----------+---------+
| cognome  | Speso   |
+----------+---------+
| bianchi  | 7670.50 |
| esposito | 3428.50 |
| rossi    |  242.50 |
| rosso    |  785.00 |
+----------+---------+
*/



