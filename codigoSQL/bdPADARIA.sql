create database padaria;
use padaria;


create table Padeiro(

	cpf varchar(14),
    salario decimal,
    idade int,
    sexo varchar(1),
    nome varchar(50),
    primary key(cpf)

);

create table Gerente (

cpf varchar(14),
salario decimal,
idade int,
cpfPadeiro varchar(14),
sexo varchar(1),
nome varchar(50),


primary key(cpf),
foreign key(cpfPadeiro) references Padeiro(cpf) on delete cascade

);



create table Cliente(
	
    idCaixa int,
    idade int,
    sexo varchar(1),
    nome varchar(50),
    cpf varchar(14),
    saldo decimal,
    
    primary key(cpf),
    foreign key(idCaixa) references Caixa(id)

);

create table Caixa(

	valorCompra decimal,
    id int,
    primary key(id)


);

create table Vende(

	os int,
    quantidade int,
    dia date,
    primary key(os)
    


);

create table Produto(

	id int auto_increment,
    nome varchar(50),
    cpfPadeiro varchar(14),
    idCaixa int,
    dataValidade date,
    primary key(id),
    foreign key(cpfPadeiro) references Padeiro(cpf),
    foreign key(idCaixa) references Caixa(id)
    
    

);

insert into Padeiro values
('111.111.111-11', 2500, 30, 'M', 'Carlos'),
('222.222.222-22', 2600, 28, 'F', 'Ana'),
('333.333.333-33', 2700, 40, 'M', 'João'),
('444.444.444-44', 2550, 35, 'F', 'Mariana'),
('555.555.555-55', 3000, 45, 'M', 'Pedro'),
('666.666.666-66', 2800, 31, 'M', 'Rafael'),
('777.777.777-77', 2400, 22, 'F', 'Luiza'),
('888.888.888-88', 2900, 32, 'F', 'Julia'),
('999.999.999-99', 2650, 29, 'M', 'Mateus'),
('101.101.101-10', 3100, 50, 'F', 'Clara');

insert into Gerente values
('200.000.000-01', 4000, 40, '111.111.111-11', 'M', 'Roberto'),
('200.000.000-02', 4200, 38, '222.222.222-22', 'F', 'Alice'),
('200.000.000-03', 4100, 42, '333.333.333-33', 'M', 'Vitor'),
('200.000.000-04', 4300, 37, '444.444.444-44', 'F', 'Paula'),
('200.000.000-05', 4500, 50, '555.555.555-55', 'M', 'Jorge'),
('200.000.000-06', 4050, 36, '666.666.666-66', 'M', 'Diego'),
('200.000.000-07', 3950, 29, '777.777.777-77', 'F', 'Beatriz'),
('200.000.000-08', 4600, 48, '888.888.888-88', 'F', 'Marcia'),
('200.000.000-09', 4200, 39, '999.999.999-99', 'M', 'Sergio'),
('200.000.000-10', 4700, 55, '101.101.101-10', 'F', 'Teresinha');

insert into Caixa values
(50.00, 1),
(25.90, 2),
(12.00, 3),
(90.75, 4),
(33.20, 5),
(18.50, 6),
(100.00, 7),
(9.99, 8),
(65.40, 9),
(45.70, 10);

insert into Cliente values
(1, 20, 'M', 'Felipe', '300.000.000-01', 100.00),
(2, 22, 'F', 'Amanda', '300.000.000-02', 150.50),
(3, 30, 'M', 'Ricardo', '300.000.000-03', 75.20),
(4, 29, 'F', 'Carolina', '300.000.000-04', 200.00),
(5, 40, 'M', 'Eduardo', '300.000.000-05', 300.00),
(6, 33, 'F', 'Luana', '300.000.000-06', 90.00),
(7, 28, 'M', 'Gustavo', '300.000.000-07', 110.00),
(8, 26, 'F', 'Patrícia', '300.000.000-08', 50.00),
(9, 55, 'M', 'Alberto', '300.000.000-09', 500.00),
(10, 18, 'F', 'Sofia', '300.000.000-10', 44.00);


insert into Vende values
(1, 2, '2025-01-01'),
(2, 5, '2025-01-05'),
(3, 1, '2025-01-10'),
(4, 10, '2025-01-12'),
(5, 3, '2025-01-14'),
(6, 7, '2025-01-15'),
(7, 4, '2025-01-18'),
(8, 9, '2025-01-20'),
(9, 12, '2025-01-21'),
(10, 6, '2025-01-22');

insert into Produto(nome, cpfPadeiro, idCaixa, dataValidade) values
('Pão Francês', '111.111.111-11', 1, '2025-02-01'),
('Bolo Chocolate', '222.222.222-22', 2, '2025-03-01'),
('Rosca', '333.333.333-33', 3, '2025-01-25'),
('Coxinha', '444.444.444-44', 4, '2025-01-20'),
('Enroladinho', '555.555.555-55', 5, '2025-02-10'),
('Pão Doce', '666.666.666-66', 6, '2025-01-30'),
('Pão Integral', '777.777.777-77', 7, '2025-02-12'),
('Queijo Minas', '888.888.888-88', 8, '2025-04-01'),
('Sonho', '999.999.999-99', 9, '2025-02-22'),
('Pudim', '101.101.101-10', 10, '2025-03-15');



select * from Padeiro;
select * from Gerente;
select * from Caixa;
select * from Cliente;
select * from Vende;
select * from Produto;

select Produto.nome, Padeiro.nome 
from Produto
inner join Padeiro
    on Produto.cpfPadeiro = Padeiro.cpf;
    
select Caixa.id, Produto.nome 
from Produto
inner join Caixa
    on Produto.idCaixa = Caixa.id;
    
select Gerente.nome, Padeiro.nome 
from Padeiro
inner join Gerente
    on Gerente.cpfPadeiro = Padeiro.cpf;
    
    
select Cliente.nome, Caixa.valorCompra 
from Caixa
inner join Cliente
    on Cliente.idCaixa = Caixa.id;

















