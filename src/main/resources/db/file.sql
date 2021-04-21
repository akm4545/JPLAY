create table file(
    movie_idx int,
    file_name varchar(200) not null,
    file_type varchar(10) not null,
    file_classification varchar(10) not null,
    FOREIGN KEY (movie_idx) REFERENCES movie (movie_idx)
);

alter table file modify file_name varchar(200) not null;
ALTER TABLE file DROP PRIMARY KEY;

desc file;
select * from file;
drop table file;

insert into file (member_idx, movie_idx, file_name, file_type, file_classification )
	VALUES ( null,40,sdas,dsad,a);