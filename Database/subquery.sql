select nome, cognome from amico where row(nome,cognome)=(select nome, cognome from parente where id="11");

select nome, cognome from amico where row(nome,cognome)= any (select nome, cognome from parente where cognome='rossi');

-- subquery correlate

update articolo a
set rimanenza = 100 -
(select sum(quantita) from ordine_dettaglio od
where od.articolo_id=a.id 
group by a.id);


select a.descrizione, sum(quantita) from ordine_dettaglio od, articolo a
where od.articolo_id=a.id 
group by a.id;

update articolo set rimanenza = 100;

update articolo a
set a.rimanenza = if(
    (select sum(quantita) 
    from ordine_dettaglio od
    where od.articolo_id=a.id 
    group by a.id) > 0,
    100 - (select sum(quantita)
    from ordine_dettaglio od
    where od.articolo_id=a.id
    group by a.id).
    100
);

select cognome, provincia
case provincia 
when 'to' then 'Torino'
when 'at' then 'Asti'
when 'cn' then 'Cuneo'
when 'no' then 'Novara'
when 'al' then 'Alessandria'
else 'Vercelli' END 'Prov. Completa'
from studente;

select cognome,
case when  genere = 'f' then "Donna"
else 'Uomo' END 'Genere'
from studente;

select nome from editore e 
where exists
(
    select editore_id from libro where editore_id = e.id
);

alter table studente_audit drop index email

alter table studente_audit
add action char (6) after id,
add studente_id int after action 

alter table studente_audit 
modify provincia char(2) default NULL,
modify regione varchar(30) default NULL

create trigger before_studente_update
before update on studente
for each row
insert into studente_audit
set action = 'update',
studente_id = OLD.id,
nome = OLD.nome,
cognome = OLD.cognome,
genere = OLD.genere,
indirizzo = OLD.indirizzo,
citta = OLD.citta,
provincia = OLD.provincia,
regione = OLD.regione,
email = OLD.email,
data_nascita = OLD.data_nascita,
eta = OLD.eta;

update studente set nome ='alberto' where id = 17
update studente set genere = 'm' where id= 17

update studente set citta = 'Torino' where id in(20,21,22,24)

create trigger before_studente_delete
before update on studente
for each row
insert into studente_audit
set action = 'delete',
studente_id = OLD.id,
nome = OLD.nome,
cognome = OLD.cognome,
genere = OLD.genere,
indirizzo = OLD.indirizzo,
citta = OLD.citta,
provincia = OLD.provincia,
regione = OLD.regione,
email = OLD.email,
data_nascita = OLD.data_nascita,
eta = OLD.eta;

delete from studente where id=20;
delete from studente where genere is null;

--create ordine
CREATE TRIGGER after_ordine_dettaglio_insert
AFTER INSERT ON ordine_dettaglio
FOR EACH row
UPDATE articolo
SET rimanenza = rimanenza - NEW.quantita
WHERE id = NEW.articolo_id;

--update ordine
CREATE TRIGGER before_ordine_dettaglio_update
BEFORE UPDATE ON ordine_dettaglio
FOR EACH row
UPDATE articolo
SET rimanenza = rimanenza - (NEW.quantita - OLD.quantita)
WHERE id = OLD.articolo_id;



create trigger after_ordine_delete
after delete on ordine
for each row
delete from ordine_dettaglio
where OLD.id=ordine_dettaglio.ordine_id



DELIMITER $$
create TRIGGER before_studente_insert
before insert on studente
for each row
begin
declare msg varchar(255);
declare assegnazione tinyint(50);
if assegnazione
 > classe.capienza 
then
	set assegnazione =  (select count(classe_id)
						from studente
						where new.classe_id = classe_id);
	set msg = concat("I posti disponibili sono esauriti");
    signal sqlstate value "45000"
    set MESSAGE_TEXT = msg;
end if;
end$$
DELIMITER ;

--funzioni custom
delimiter $$
create function anni(p_data_nascita date) returns tinyint




