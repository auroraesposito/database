create table if not exists editore(
    id int auto_increment primary key,
    nome varchar(30),
    contatto varchar (30)
);
create table if not exists libro(
    id int auto_increment primary key,
    titolo varchar(100),
    prezzo decimal (6, 2),
    pagine smallint,
    editore_id int
);
create table if not exists autore(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar (40),
    nazionalita char(2)
);
create table if not exists autore_libro(
    autore_id int,
    libro_id int,
    primary key (libro_id, autore_id)
);

select titolo, cognome, nome
from libro, autore_libro, autore
where libro.id = autore_libro.libro_id 
and autore.id = autore_libro.autore_id
order by titolo;

select titolo, pagine, prezzo, editore.nome, cognome, autore.nome
from libro, editore, autore, autore_libro
where libro.editore_id = editore.id
and libro.id = autore_libro.libro_id
and autore.id = autore_libro.autore_id
order by titolo;
