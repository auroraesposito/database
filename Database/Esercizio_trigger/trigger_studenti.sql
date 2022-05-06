create schema classi;

CREATE TABLE classe (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  capienza TINYINT(50) NULL,
  PRIMARY KEY (id));

create table studente like tss_2022.studente

alter table studente
add classe_id int after cognome;

alter table studente
add foreign key fk_cl_classe(classe_id) references classe(id)

insert into classe (nome, capienza)
value("1a", 10),
('1b', 15),
('1c', 20)


-- before insert
DELIMITER $$
create TRIGGER before_studente_insert
before insert on studente
for each row
begin
declare msg varchar(255);
declare num tinyint;
declare capienza_d tinyint;
declare rim tinyint;

set num = (select count(*) from studente where classe_id = new.classe_id);
set capienza_d = (select capienza from classe where id = new.classe_id);
set rim = num - capienza_d;
	set msg = concat("I posti disponibili sono esauriti");

if rim > 0 
 then
    signal sqlstate value "45000"
    set MESSAGE_TEXT = msg;
end if;
end$$
DELIMITER ;

--before update
DELIMITER $$
create TRIGGER before_studente_update
before update on studente
for each row
begin
declare msg varchar(255);
declare num tinyint;
declare capienza_d tinyint;
declare rim tinyint;

set num = (select count(*) from studente where classe_id = new.classe_id);
set capienza_d = (select capienza from classe where id = new.classe_id);
set rim = num - capienza_d;
	set msg = concat("I posti disponibili sono esauriti");

if rim > 0 
 then
    signal sqlstate value "45000"
    set MESSAGE_TEXT = msg;
end if;
end$$
DELIMITER ;


--after insert
DELIMITER $$
create TRIGGER after_studente_insert
after insert on studente
for each row
begin
declare msg varchar(255);
declare num tinyint;
declare capienza_d tinyint;
declare rim tinyint;

set num = (select count(*) from studente where classe_id = new.classe_id);
set capienza_d = (select capienza from classe where id = new.classe_id);
set rim = num - capienza_d;
	set msg = concat("I posti disponibili sono esauriti");

if rim > 0 
 then
    signal sqlstate value "45000"
    set MESSAGE_TEXT = msg;
end if;
end$$
DELIMITER ;


--after update
DELIMITER $$
create TRIGGER after_studente_update
after update on studente
for each row
begin
declare msg varchar(255);
declare num tinyint;
declare capienza_d tinyint;
declare rim tinyint;

set num = (select count(*) from studente where classe_id = new.classe_id);
set capienza_d = (select capienza from classe where id = new.classe_id);
set rim = num - capienza_d;
	set msg = concat("I posti disponibili sono esauriti");

if rim > 0 
 then
    signal sqlstate value "45000"
    set MESSAGE_TEXT = msg;
end if;
end$$
DELIMITER ;