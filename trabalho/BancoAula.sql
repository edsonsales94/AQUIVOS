USE TESTE_AULA;

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

