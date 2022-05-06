select tiolo, nome, cognome 
from libro, autore, autore_libro
where libro.id = autore_libro.libro_id and 
autore.id = autore_libro.autore_id ;

select 
    titolo Titolo, 
    prezzo Prezzo, 
    e.nome Editore, 
    a.nome Nome,
    cognome Cognome
    from libro l, editore e, autore a, autore_libro al
    where l.editore_id = e.id
    and l.id = al.libro_id
    and a.id = al.autore_id;

alter table libro
add constraint fk_libro_editore
foreign key (editore_id) references editore(id)
on delete no action
on update cascade ;

create table if not exists africa(
    id int auto_increment,
    stato varchar(50),
    capitale varchar (50),
    primary key (id)

);

create table if not exists america(
    id int auto_increment,
    stato varchar(50),
    capitale varchar (50),
    primary key (id)

);

create table if not exists europa(
    id int auto_increment,
    stato varchar(50),
    capitale varchar (50),
    primary key (id)

);

insert into africa (stato, capitale)
value("Egitto", "Il Cairo"),
("Marocco", "Rabat"),
("Algeria", "Algeri");

insert into america (stato, capitale)
value("Uruguay", "Montevideo"),
("Brasile", "Brasilia"),
("Peru", "Lima");

insert into europa (stato, capitale)
value("Italia", "Roma"),
("Francia", "Parigi"),
("Spagna", "Madrid");

select stato, capitale
from america
union 
select stato, capitale 
from africa
union 
select stato, capitale 
from europa
order by stato;

select nome, cognome
from parente
union all
select nome, cognome
from amico