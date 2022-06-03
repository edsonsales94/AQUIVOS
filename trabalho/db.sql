INSERT INTO tb_telefone (tel_telefone) values
(92991222222),
(92991333333),
(92991155555),
(92991177777),
(92991100999),
(92991254332),
(92991356533),
(92991154255),
(92991178677),
(92986166576);

INSERT INTO tb_endereco(end_rua, end_casa,end_bairro) values
("Ticuna",17,'Zumbi'),
("arana",137,'Sao jose'),
("dez",13,'Alvorada'),
("terezina",47,'Petropolis'),
("Santa helena",160,'Jorge Texas'),
("por do sol",186,'Novo Aleixo'),
("cascata",137,'Sao jorge'),
("dez de junho",113,'Compensa'),
("manaós",647,'Centro'),
("Santa jurubeba",156,'Jorge Texas');


INSERT INTO tb_medico(med_crm,med_nome,med_contato,med_endereco) VALUES
(2019,"José Carlos",1,1),
(2020,"José Silva",2,2),
(2021,"José Abreu",3,3),
(2022,"José Constantino",4,4),
(2023,"José Henrique",5,5);


INSERT INTO tb_paciente(pac_nome,pac_endereco,pac_contato) VALUES
("Gabriel de Jesus",6,6),
("Ronaldinho Gaucho",7,7),
("Maradora",8,8),
("Adriano Imperador",9,9),
("Gabi Gol",10,10);


INSERT INTO tb_exame(exa_data,exa_resultado) VALUES
("2021-04-13", "VERMES"),
("2021-04-08", "RESENHA"),
("2021-04-03","OVERDOSE"),
("2021-04-13","CIDROME DA LENDA"),
("2021-04-13","MELHOR CENTROAVANTE DO BRASIL");

INSERT INTO tb_EFETUA(efe_data,efe_status,efe_crm,efe_exame)VALUES
("2021-07-18","REALIZADO",2019,1),
("2021-09-17","REALIZADO",2020,2),
("2021-011-14","REALIZADO",2023,3),
("2021-08-15","REALIZADO",2021,4),
("2021-09-25","REALIZADO",2022,5);

INSERT INTO tb_realiza(rea_data,rea_status,rea_paciente,rea_exame)VALUES
("2021-07-18","REALIZADO",1,1),
("2021-09-17","REALIZADO",2,2),
("2021-011-14","REALIZADO",3,3),
("2021-08-15","REALIZADO",4,4),
("2021-09-25","REALIZADO",5,5);

INSERT INTO tb_solicita(sol_data,sol_status,sol_crm,sol_exame)VALUES
("2021-05-17","SOLICITADO",2021,1),
("2021-04-16","SOLICITADO",2019,2),
("2021-04-13","SOLICITADO",2023,3),
("2021-04-12","SOLICITADO",2020,4),
("2021-03-23","SOLICITADO",2022,5);

INSERT INTO tb_consulta(con_data,con_retorno,con_crm,con_paciente) VALUES
("2021-04-16","2022-04-18",2019,3),
("2021-04-12","2022-07-18",2020,2),
("2021-05-17","2022-06-18",2021,4),
("2021-03-23","2022-10-18",2022,4),
("2021-04-13","2022-09-17",2023,3);



select pac_nome,tel_telefone, end_rua, end_bairro, con_data as data_Consulta, med_nome as Medico_consulta  from tb_paciente
inner join tb_telefone on tel_id = pac_id
inner join tb_endereco on end_id = pac_id
inner join tb_consulta on con_id = pac_id
inner join tb_medico on med_crm = con_crm
inner join tb_solicita on med_crm = sol_crm;



De: leonardo silva <leosuevo37@outlook.com>
Enviado: domingo, 13 de março de 2022 22:03
Para: Edson Sales <edson.sales94@outlook.com>
Assunto: RE: Trabalho do Manfrine
 
create database clinica;
use clinica;

CREATE TABLE tb_telefone(
tel_id int AUTO_INCREMENT not null primary key unique,
tel_telefone varchar(15)
);
create table tb_endereco(
    end_id int auto_increment not null unique primary key,
    end_rua varchar(40) not null,
    end_casa varchar(15) not null,
    end_bairro varchar(15) not null
);
