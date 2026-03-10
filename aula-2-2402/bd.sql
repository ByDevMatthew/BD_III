create database if not exists concessionaria;

use concessionaria;

--Tabela fabricante
--campos id, nome, logo, email, telefone

create table fabricante (
    id int primary key auto_increment,
    nome varchar(255) not null,
    logo varchar(50),
    email varchar(320),
    telefone varchar(11)
);

--tabela modelo
--campos id, nome, data de lançamento, fabricante, qtd portas

create table modelo (
    id int primary key auto_increment,
    nome varchar(50) not null,
    data_lancamento date not null,
    fk_fabricante int not null,
    qtd_portas int default 2,
    foreign key (fk_fabricante) references fabricante(id)
);

--tabela veiculo
--campos id, modelo, cor, data de fabricação

create table veiculo (
    id int primary key auto_increment,
    chassi varchar(30) not null unique,
    fk_modelo int not null,
    cor varchar(50) not null,
    data_fabricacao date not null,
    foreign key (fk_modelo) references modelo(id)
);

insert into fabricante (nome, logo, email, telefone) values
('Fiat', 'fiat.png', 'contato@fiat.com.br', '11999999999'),
('Audi', 'audi.png', 'contato@audi.com.br', '11888888888');

insert into modelo (nome, data_lancamento, fk_fabricante, qtd_portas) values
('Palio', '1996-01-01', 1, 4),
('Uno', '1983-01-01', 1, 2),
('Mobi', '2016-01-01', 1, 4),
('A3', '1996-01-01', 2, 4),
('R8', '2006-01-01', 2, 2);

insert into veiculo (fk_modelo, chassi, cor, data_fabricacao) values
(1, 'ABC1234567890123', 'Vermelho', '2020-01-01'),
(1, 'DEF4567890123456', 'Preto', '2020-01-02'),
(2, 'GHI7890123456789', 'Branco', '2020-01-03'),
(2, 'JKL0123456789012', 'Azul', '2020-01-04'),
(3, 'MNO3456789012345', 'Verde', '2020-01-05'),
(3, 'PQR6789012345678', 'Amarelo', '2020-01-06'),
(4, 'STU9012345678901', 'Prata', '2020-01-07'),
(4, 'VWX2345678901234', 'Cinza', '2020-01-08'),
(5, 'YZA5678901234567', 'Branco', '2020-01-09'),
(5, 'BCD890123456789A', 'Preto', '2020-01-10');

select 
    veiculo.id,
    veiculo.chassi,
    veiculo.cor,
    veiculo.data_fabricacao,
    modelo.nome as modelo,
    fabricante.nome as fabricante
from veiculo 
join modelo on veiculo.fk_modelo = modelo.id
join fabricante on modelo.fk_fabricante = fabricante.id;

alter table veiculo add column preco decimal(10,2) not null;

update veiculo set preco = 49854.00 where id = 1;
update veiculo set preco = 49854.00 where id = 2;
update veiculo set preco = 89854.00 where id = 3;
update veiculo set preco = 89854.00 where id = 4;
update veiculo set preco = 189854.00 where id = 5;
update veiculo set preco = 189854.00 where id = 6;
update veiculo set preco = 289854.00 where id = 7;
update veiculo set preco = 289854.00 where id = 8;
update veiculo set preco = 389854.00 where id = 9;
update veiculo set preco = 389854.00 where id = 10;

delete from veiculo where id = 4;

truncate table veiculo;

--exercicios de ordenação:

--1 listar todas as informações dos veiculos ordenados em ordem crescente pela data;
--2 listar somente id do veiculo, id do fabricante, e placa do veiculo ordenando pelo id do fabricante em ordem descrecente;
--3 listar somente nome do fabricante ordenando pelo nome em ordem descrescente;
--4 listar todas as informações de modelo ordenando pela data de lançamento em ordem crescente;

select * from veiculo order by data_fabricacao asc;

select veiculo.id, modelo.fk_fabricante, veiculo.chassi from veiculo join modelo on veiculo.fk_modelo = modelo.id order by modelo.fk_fabricante desc;

select nome from fabricante order by nome desc;

select * from modelo order by data_lancamento asc;



select count(*) as 'Quantidade' from modelo where fk_fabricante = 1;

select count(*) from modelo where nome like 'p%';

select max(data_fabricacao) from veiculo;

select min(data_fabricacao) from veiculo;

select * from veiculo where data_fabricacao = (select min(data_fabricacao) from veiculo) and cor like 'v%';

select min(preco) as 'Menor Preço', max(preco) as 'Maior Preço', avg(preco) as 'Média Preço' from veiculo where fk_fabricante = 1;

select sum(preco), count(*), avg(preco) from veiculo;


select
modelo.nome as 'Modelo',
modelo.data_lancamento as 'Data de Lançamento',
fabricante.nome as 'Fabricante',
fabricante.telefone as 'Telefone'
from fabricante inner join modelo on modelo.fk_fabricante = fabricante.id;

select
preco as 'Preço',
data_fabricacao 'Data de Fabricação',
modelo.nome 'Modelo',
data_lancamento as 'Data de Lançamento'
from veiculo inner join modelo on veiculo.fk_modelo = modelo.id;


drop database if exists concessionaria;

