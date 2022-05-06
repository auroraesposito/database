alter table ordine
add foreign key fk_ordine_cliente(cliente_id) references cliente(id)
on update cascade
on delete no action;

alter table ordine
add foreign key fk_ordine_impiegato(impiegato_id) references impiegato(id)
on update cascade
on delete no action;

alter table impiegato
add foreign key fk_impiegato_ufficio(ufficio_id) references ufficio(id)
on update cascade
on delete no action;

alter table ordine_dettaglio
add foreign key fk_od_articolo(articolo_id) references articolo(id)
on update cascade
on delete no action;

alter table ordine_dettaglio
add foreign key fk_od_ordine(ordine_id) references ordine(id)
on update cascade
on delete no action;