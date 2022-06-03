Create database clinica;
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

create table tb_medico(
	med_crm int primary key not null unique,
    med_nome varchar(60) not null,
    med_contato int not null,
	foreign key (med_contato) references tb_telefone(tel_id),
	med_endereco int not null,
    foreign key (med_endereco) references tb_endereco(end_id)
    );
    
create table tb_paciente(
pac_id int primary key not null unique auto_increment,
pac_nome varchar(60) not null,
pac_contato int not null,
foreign key (pac_contato) references tb_telefone(tel_id),
pac_endereco int not null,
foreign key (pac_endereco) references tb_endereco(end_id)
);

create table tb_exame(
    exa_id int not null auto_increment unique primary key,
    exa_data date not null,
    exa_resultado varchar(100) not null
);

create table tb_efetua(
	efe_id int primary key not null unique auto_increment,
    efe_data date not null,
    efe_status varchar(10),
    efe_crm int not null,
    foreign key (efe_crm) references tb_medico(med_crm),
    efe_exame int not null,
    foreign key (efe_exame) references tb_exame(exa_id)
    );

create table tb_realiza(
	rea_id int primary key not null unique auto_increment,
    rea_data date not null,
    rea_status varchar(10),
    rea_paciente int not null,
    foreign key (rea_paciente) references tb_paciente(pac_id),
    rea_exame int not null,
    foreign key (rea_exame) references tb_exame(exa_id)
    );

create table tb_solicita(
	sol_id int primary key not null unique auto_increment,
    sol_data date not null,
    sol_status varchar(10),
    sol_crm int not null,
    foreign key (sol_crm) references tb_medico(med_crm),
    sol_exame int not null,
    foreign key (sol_exame) references tb_exame(exa_id)
    );
   
create table tb_consulta(
	con_id int primary key not null unique auto_increment,
	con_data date not null,
    con_retorno varchar(60) not null,
    con_crm int not null,
    foreign key (con_crm) references tb_medico(med_crm),
    con_paciente int not null,
    foreign key (con_paciente) references tb_paciente(pac_id)
);
create table telefone(
idtel int primary key not null auto_increment,
dddtel_1 int not null,
tel_1 int not null,
dddtel_2 int not null,
tel_2 int not null,
tel_med int not null,
foreign key (tel_med) references tb_medico(med_crm)
 );
 
 insert into telefone(dddtel_1, tel_1, dddtel_2, tel_2,tel_med) values
 ('92','999999999','94','88888888',2021),
 ('92','96675444','94','88577788',2020);


drop database clinica;










select * from tb_medico
inner join telefone on med_crm = tel_med
where med_crm = '2021'


























