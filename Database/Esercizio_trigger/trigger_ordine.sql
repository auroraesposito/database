create table ordine_dettaglio_audit like ordine_dettaglio

alter table ordine_dettaglio_audit
add action char(6) after quantita;


create TRIGGER before_ordine_update
before update on ordine_dettaglio
for each row
insert into ordine_dettaglio_audit
set action = "update",
ordine_id = OLD.ordine_id,
articolo_id = OLD.articolo_id,
quantita = OLD.quantita;


create TRIGGER before_ordine_delete
before delete on ordine_dettaglio
for each row
insert into ordine_dettaglio_audit
set action = "delete",
ordine_id = OLD.ordine_id,
articolo_id = OLD.articolo_id,
quantita = OLD.quantita






