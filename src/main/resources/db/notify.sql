create table notify(
	notify_idx int not null auto_increment,
	notify_title varchar(50) not null,
	notify_type varchar(20) not null,
	notify_content text not null,
	notify_date datetime not null default now(),
	PRIMARY KEY (notify_idx)
);

drop table notify;