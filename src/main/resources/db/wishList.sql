create table wishList (
	member_idx int not null,
	movie_idx int not null,
	wishList_date datetime not null default now(),
	FOREIGN KEY (member_idx) REFERENCES member(member_idx),
	FOREIGN KEY (movie_idx) REFERENCES movie(movie_idx)
)

drop table wishList;