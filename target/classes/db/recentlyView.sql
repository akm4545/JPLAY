create table recentlyView (
	member_idx int not null,
	movie_idx int not null,
	recentlyView_viewDate datetime not null default now(),
	FOREIGN KEY (member_idx) REFERENCES member(member_idx),
	FOREIGN KEY (movie_idx) REFERENCES movie(movie_idx)
)

DELIMITER //
CREATE TRIGGER recentlyView_trigger BEFORE INSERT ON `recentlyView`
FOR EACH ROW 
	BEGIN
	DECLARE updateCount INTEGER;
    SELECT COUNT(*) INTO updateCount FROM recentlyView
	WHERE member_idx = NEW.member_idx;
		IF 
			updateCount >= 10
		THEN
			DELETE FROM recentlyView
			WHERE member_idx = NEW.member_idx
			AND recentlyView_viewDate = (
										 SELECT viewDate FROM (
													  SELECT MIN(recentlyView_viewDate) as viewDate
													  FROM recentlyView
                                                      WHERE member_idx = new.member_idx
													  GROUP BY movie_idx) as b);
	END IF;
	END;//
DELIMITER ;

drop TRIGGER recentlyView_trigger;

drop table recentlyView;
     