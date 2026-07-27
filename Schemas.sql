----- NETFLIX PROJECT-----

create database netflix_db;
Use netflix_db; 

create table netflix_table(
	show_id varchar(6),
	type varchar(10),
	title varchar(130),	
	director varchar(230),	
	cast varchar(800),	
	country varchar(150),
	date_added varchar(50),	
	release_year int,
	rating varchar(10),
	duration varchar(15),	
	listed_in varchar(100),	
	description varchar(300)
);






