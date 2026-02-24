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
    fk_modelo int not null,
    cor varchar(50) not null,
    versao varchar (10) not null,
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

insert into veiculo (fk_modelo, cor, data_fabricacao) values
(1, 'Vermelho', '2020-01-01'),

10 de cada modelo