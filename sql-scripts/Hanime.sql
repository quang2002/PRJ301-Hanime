create database Hanime;
go
use Hanime
go

create table Auth(
auth_id int not null primary key,
username varchar(32) not null,
[password] varchar(16) not null,
roles varchar(16) not null
);

create table Customer(
customer_id int not null primary key,
full_name varchar(30) not null,
email varchar(64) not null,
phone_number varchar(15) not null,
[password] varchar(16) not null,
register_date datetime not null
);

create table [User](
user_id int not null primary key,
email varchar(64) not null,
full_name varchar(30),
[password] varchar(16)
)

create table Category(
category_id int not null primary key,
category_name varchar(20) not null,
[description] varchar(2000) not null
);

create table Film(
film_id int not null primary key,
film_title varchar(128) not null,
[description] varchar(2000) ,
thumnail_uri varchar(64),
release_date datetime,
[length] int,
category_id int foreign key references Category(category_id)
);

create table [View](
view_id int not null primary key,
film_id int foreign key references Film(film_id),
user_id int foreign key references [User](user_id),
view_time datetime
);

create table Rating(
rating_id int not null primary key,
film_id int foreign key references Film(film_id),
user_id int foreign key references [User](user_id),
rating_time datetime,
rating int
);

create table Comment(
comment_id int not null primary key,
film_id int foreign key references Film(film_id),
user_id int foreign key references [User](user_id),
comment_time datetime,
comment varchar(500)
);

