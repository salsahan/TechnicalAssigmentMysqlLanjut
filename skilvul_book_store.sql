-- Create Database --
create database skilvulbookstore;

-- Using The Database --
use skilvulbookstore;

-- Create Table Penerbit --
create table penerbit 
(
    id int not null auto_increment primary key,
    nama varchar(50),
    kota varchar(50)
);

-- Create Table Penulis --
create table penulis
(
    id int not null auto_increment primary key,
    nama varchar(50),
    kota varchar(50)
);

-- Create Table Buku --
create table buku
(
    id int not null auto_increment primary key,
    ISBN varchar(50),
    judul varchar(50),
    penulis varchar(50),
    penerbit int,
    harga int,
    stock int,
    constraint fk_buku_penulis_id
    foreign key(id)
    references penulis(id),
    constraint fk_buku_penerbit_penerbit
    foreign key(penerbit)
    references penerbit(id)
);

-- INNER JOIN dari table buku --
select * from buku inner join penerbit on buku.penerbit = penerbit.id;

-- LEFT JOIN dari table buku --
select * from buku left join penerbit on buku.penerbit = penerbit.id;

-- RIGHT JOIN dari table buku --
select * from buku right join penerbit on buku.penerbit = penerbit.id;

--  Cek nilai MAX dari column harga --
select max(harga) from buku where stock < 10;

-- Cek nilai MIN dari column harga--
select min(harga) from buku;

-- Gunakan COUNT untuk melihat list data dengan kondisi harga buku di bawah 100000 --
select count(id) from buku where harga < 100000;
