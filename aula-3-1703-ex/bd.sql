-- Exercício de fixação de select - Banco de Dados 17/03/2024

--1
select * from passagem order by valor asc;

--2
select * from passagem order by data_viagem asc;

--3
select nome as "Nome", data_nascimento as "Data de Nascimento" from passageiro order by nome asc;

--4
select placa as "Placa", modelo as "Modelo", capacidade as "Capacidade" from onibus order by capacidade desc;

--5
select nome as "Nome da Companhia", cidade_sede as "Cidade Sede", telefone as "Telefone", email as "Email" from companhia order by cidade_sede asc;

--6
select sum(valor) as "Valor Total das Passagens" from passagem;

--7
select avg(valor) as "Valor Médio das Passagens" from passagem;

--8
select max(valor) as "Maior Valor", min(valor) as "Menor Valor" from passagem;

--9
select count(*) as "Total de Passagem Vendidas" from passagem;

--10
select count(select * from companhia WHERE id = 1) from onibus;