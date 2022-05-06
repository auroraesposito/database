create table if not exists amico(
    id int auto_increment primary key,
    nome varchar(30),
    cognome varchar (40)
    ##primary key(id)
    ##primary key(id)

    /*
    commento multilinea
    */
) select nome, cognome from studente
create table if not exists parente(
  id int auto_increment primary key,
    nome varchar(30),
    cognome varchar (40),
    ##primary key(id)  
) select nome, cognome from amico;
    

