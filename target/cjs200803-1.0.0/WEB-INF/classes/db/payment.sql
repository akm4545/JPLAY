create table payment(
	member_idx int not null,
    payment_idx int not null auto_increment primary key,
	payment_date datetime default now() not null,
	payment_amount int not null,
	payment_method varchar(50) not null,
	payment_info varchar(70) not null,
	payment_endDate datetime ,
	FOREIGN KEY (member_idx) REFERENCES member (member_idx) ON DELETE CASCADE
);

CREATE TRIGGER payment_trigger BEFORE INSERT ON `payment`
FOR EACH ROW SET
    NEW.payment_endDate = IFNULL(NEW.payment_endDate,TIMESTAMPADD(DAY, 30, NEW.payment_date));
    
    drop TRIGGER payment_trigger;
    
    drop table payment;
    
    insert into payment values(3,default,default,1,'a','a',null);
    
    select * from payment;
    
drop table payment;