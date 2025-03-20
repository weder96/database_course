create table users(
 id int identity(1,1) not null ,
 email varchar(200) not null unique,
 password varchar(200) not null ,
 user_type int not null, 
 primary key(id)
);

create table patient(
 id int identity(1,1) not null,
 user_id int not null,
 name varchar(200) not null,
 cpf char(11) unique not null ,
 rg char(9) unique not null,
 phone char(11) not null,
 birth_date date not null,
 primary key(id),
 foreign key (user_id) references users(id)
);

create table specialty(
 id int identity(1,1) not null,
 name varchar(200) not null,
 primary key(id)
);

create table clinic(
 id int identity(1,1) not null,
 costume_name varchar(200) unique not null,
 address varchar(250) not null,
 number int not null,
 cep char(8) unique not null,
 corporate_reason varchar(200) unique not null,
 primary key(id)
);

create table doctor(
 id int identity(1,1) not null,
 users_id int foreign key references users(id) not null,
 [name] varchar(200) not null,
 crm char(7) not null,
 primary key(id),
 clinic_id int foreign key references clinic(id) not null,
 speciality_id int foreign key references specialty(id) not null
);

create table medical_consultation(
 id int identity(1,1) not null,
 doctor_id int not null,
 patient_id int null,
 data_consultation datetime not null,
 description text,
 status int not null,
 price numeric(19,2) not null,
 primary key(id),
 foreign key (doctor_id) references doctor(id),
 foreign key (patient_id) references patient(id) 
);


CREATE TABLE check_uncheck(
 id int primary key identity(1,1) not null,
 status BIT NOT NULL 
);

