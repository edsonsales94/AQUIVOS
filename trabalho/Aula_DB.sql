Create database aula_teste;

USE teste_aula;

CREATE TABLE marca(
marid int not null auto_increment primary key,
marnome varchar(25) not null
);

CREATE TABLE carro(
carid int not null auto_increment primary key,
carmodelo varchar(25) not null,
carcor varchar(25) not null,
carvalor decimal not null,
carmarca int not null,
foreign key(carmarca) references marca(marid)
);

CREATE TABLE CLIENTES (
cliid int NOT NULL auto_increment primary key,
clinome VARCHAR (30),
clisobrenome VARCHAR (50),
clicpf INT NOT NULL,
climarca int not null,
clicarro int not null,
foreign key(climarca) references marca(marid),
foreign key(clicarro) references carro(carid)
);

Insert Into marca(marnome) values
('Honda'),
('Fiat'),
('Toyota'),
('VoxWagen');

Insert Into CLIENTES(clinome,clisobrenome,clicpf,climarca,clicarro) values
('Edson', 'Sales', 11111111,1, 1),
('pedro', 'Silva', 222222222,2, 2),
('JOAO', 'alves', 88888888,3, 3),
('Abre', 'abel', 9999999 , 4,4);

insert into carro(carmodelo, carcor, carvalor, carmarca) values
('City', 'azul', 70.000 , 1 ),
('Fit','Prata', 60.000, 1    ),
('Uno','Prata', 50.000, 2  ),
('Corola','Preto',100.000, 3);

select * from CLIENTES
inner join marca on cliid = marid
inner join carro on cliid = carid 
where cliid between 1 and 4

create table atendente(
ateid int not null auto_increment primary key,
atenome varchar(25) not null,
atesalario double);

create table bairro(
baicod int not null primary key,
bainome varchar(25) not null);

create table aluguel
(aluid int not null auto_increment primary key,
alucliente int not null,
alucarro int not null,
aluatendente int not null,
aludtemprestimo date,
aludtprevdevolucao date,
aludtrealdevolucao date,
foreign key(alucliente) references clientes(cliid),
foreign key(alucarro) references carro(carid),
foreign key(aluatendente) references atendente(ateid)
);

insert into bairro(baicod, bainome) values
(1, 'Santo Antônio'),
(2, 'São José'),
(3, 'Cidade Nova'),
(4, 'Armando Mendes');

insert into atendente(atenome, atesalario) values
('Marcelo', 3000.0),
('Marcos', 4000.0),
('Fernanda', 5000.0),
('Marcela', 2200.0);

insert into aluguel
(alucliente, alucarro, aluatendente, aludtemprestimo,
aludtprevdevolucao, aludtrealdevolucao)values
(1, 2, 1, '2017-01-01', '2017-01-05', '2017-01-05'),
(2, 1, 1, '2017-02-01', '2017-02-05', '2017-02-10'),
(1, 3, 2, '2017-02-01', '2017-02-05', '2017-02-05'),
(3, 3, 4, '2017-04-01', '2017-04-01', '2017-04-05'),
(3, 3, 4, '2017-04-20', '2017-04-23', '2017-04-23'),
(4, 4, 1, '2017-05-01', '2017-05-10', '2017-05-10');

-- selecione todos os atendente com salario menores que 3000
select * from atendente where atesalario < 3000.0;

-- selecione todos os carros com valores entre 110 e 150 reais

select * from veiculo where veivalor >= 110 AND veivalor <= 150;
select * from veiculo where veivalor between 110 and 200;

-- selecione todos os moradores do bairro são josé

select clinome, bainome from cliente
inner join bairro on baicod = clibairro
where bainome = 'Cidade Nova';

-- selecione os clientes moradores da cidade nova com status ativo

select clinome, bainome from clientes
inner join bairro on baicod = clibairro
where bainome = 'Cidade Nova' 

-- selecione os veiculos que foram alugados

select veimodelo, aludtemprestimo, aludtrealdevolucao from veiculo
inner join aluguel on veicod = aluveiculo;

-- selecione os veiculos que foram alugados e a quanti de dias previsto

select veimodelo,  (aludtprevdevolucao-aludtemprestimo) from veiculo
inner join aluguel on veicod = aluveiculo;

-- selecione os emprestimos que tiveram atraso

select veimodelo, (aludtprevdevolucao-aludtemprestimo) as 'qtd de dias previsto',
(aludtrealdevolucao-aludtemprestimo) as 'quant de dias real',
((aludtrealdevolucao-aludtemprestimo)-(aludtprevdevolucao-aludtemprestimo))
as 'qtd de dias em atraso'
from veiculo
inner join aluguel on veicod = aluveiculo;

-- selecione os veiculos e os valores dos emprestimos

select veimodelo, (aludtrealdevolucao-aludtemprestimo) as 'qtd de dias',
veivalor as 'Valor do carro',
((aludtrealdevolucao-aludtemprestimo) * veivalor) as 'Valor do Aluguel'
 from veiculo
inner join aluguel on veicod = aluveiculo;

-- selecione o cliente o atendente, o bairro onde o cliente mora
-- o carro que alugou e o dia do aluguel







