create table rating(
	member_idx int not null,
	movie_idx int not null,
	rating_score int not null,
	FOREIGN KEY (member_idx) REFERENCES member(member_idx),
	FOREIGN KEY (movie_idx) REFERENCES movie(movie_idx)
);

drop table rating;