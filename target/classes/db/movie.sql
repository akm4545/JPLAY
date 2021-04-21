create table movie(
	movie_idx int not null auto_increment primary key,
    movie_title varchar(50) not null,
    movie_openingDate datetime not null,
    movie_synopsis text not null,
    movie_rating int default 0,
    movie_genre varchar(20) not null,
    movie_age varchar(10) not null,
    movie_director varchar(40) not null,
    movie_actor varchar(100) not null,
    movie_viewCount int default 0
);
select * from movie;
alter table member modify movie_actor varchar(100);
alter table member modify movie_director varchar(40);
SELECT max(movie_idx) from movie;
drop table movie;