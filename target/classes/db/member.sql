create table member(
	member_idx int not null unique auto_increment primary key,
    member_id varchar(20) not null unique,
    member_pwd varchar(100) not null,
    member_name varchar(20) not null,
    member_email varchar(30) not null,
    member_tel varchar(20) not null,
    member_joinDate datetime default now(),
    member_del char(2) default 'N',
    member_nickname varchar(20) default '사용자',
    member_delDate datetime
);

drop table member;

insert into member values(default,'adminadmin','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adminadmi','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adminadm','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adminad','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'admina','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'admin','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'admi','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adm','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'ad','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'a','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'t','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'faf','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adasdd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adasd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adas','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'ada','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'ad','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'sadsdf','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adasdaf','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adasfdsaf','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adasfdsaf','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adafdsa','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adawr','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adarewqd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adareqwdd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adavcxd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adafdsad','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'ajkljdasfd','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adajfil','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adaajfdhk','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adajlfdsa','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adafhdskadj','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adfjdlsa','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'adjjfdsal','1234','admin','admin','admin',default,default,default,null,null,null,null);
insert into member values(default,'test1','1234','admin','admin','admin',default,'Y',default,null,null,null,null);
insert into member values(default,'test2','1234','admin','admin','admin',default,'Y',default,null,null,null,null);
insert into member values(default,'test3','1234','admin','admin','admin',default,'Y',default,null,null,null,null);

select * from member where member_del = "Y";
select * from member;


alter table member modify member_pwd varchar(100);

update member set member_del = "N" where member_id = "adminadmin";