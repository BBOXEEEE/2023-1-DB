create database Book;

use Book;

create table Book
(
 ibsn int primary key,
 title varchar(30),
 publisher varchar(20),
 year int,
 price int
 ) charset = utf8mb4;

create table Author
(
 ssn int primary key,
 name varchar(10),
 city varchar(30)
) charset = utf8mb4;

create table Wrote
(
 ibsn int,
 ssn int,
 primary key(ibsn, ssn),
 foreign key (ibsn) references Book(ibsn),
 foreign key (ssn) references Author(ssn)
) charset = utf8mb4;

alter table Employee add phone int;