create table qna(
	qna_idx int not null auto_increment,
	member_idx int not null,
	qna_title varchar(50) not null,
	qna_content text not null,
	qna_questionsDate datetime not null default now(),
	qna_type varchar(20) not null,
	qna_answer char(2) not null default 'N',
	qna_answerContent text,
	qna_answerDate datetime default now(),
	primary key(qna_idx),
	FOREIGN KEY (member_idx) references member(member_idx) 
);

drop table qna;