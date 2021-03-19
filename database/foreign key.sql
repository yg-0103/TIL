# Foreien key
# 데이터의 무결성을 지키기 위한 제약조건

use test;
drop table user2;
create table user(
	user_id int primary key auto_increment,
    name varchar(20),
    addr varchar(20)
);

create table money(
	money_id int primary key auto_increment,
    income int,
    user_id int
);

insert into user(name, addr) values("po", "seoul"), ("jo", "pusan");
select * from user;
insert into money(income, user_id) values(5000, 1), (6000, 3);
select * from money;

# 테이블을 생성할 때 설정
drop table money;
create table money(
	money_id int primary key auto_increment,
    income int,
    user_id int,
    foreign key (user_id) references user(user_id)
);
# MUL 로 되있으면 foreign key 사용중
desc money;
insert into money(income, user_id) values(5000, 1); # foreign key 사용하면 user에 없는 아이디를 넣으려고하면 error
select * from money;

# 수정해서 설정
drop table money;
create table money(
	money_id int primary key auto_increment,
    income int,
    user_id int
);
desc money;
alter table money
add constraint fk_user
foreign key (user_id) 
references user (user_id);

insert into money (income, user_id)
value (5000, 1), (6000, 2);

# user (1, 2) , money (1, 2) 1번을 지우려해도 삭제가 안됨 
delete from user
where user_id = 1
limit 10;

drop table user;

# on delete, on update 설정 무결성이 지켜지는 상태에서 처리
# cascade :  참조되는 테이블에서 데이터를 삭제하거나 수정하면 참조하는 테이블에서도 삭제 수정됨
# set null : 참조되는 테이블에서 삭제, 수정 하면 데이터가 null로 변경
# no action : 참조되는 테이블에서 삭제하거나 수정하면, 변경되지 않음 (무결성 깨짐)
# set default : 삭제 수정 하면 데이터가 기본값으로 변경
# restrict : 삭제, 수정 불가능 (기본값)

# 업데이트가 되면 같이 업데이트 삭제가되면 null 값으로 변경
# on update 일때 cascade, delete 가 되면 set null
drop table money;

create table money(
	money_id int primary key auto_increment,
    income int,
    user_id int,
    foreign key (user_id) references user(user_id)
    on update cascade on delete set null
);

insert into money(income, user_id)
values (5000, 1), (6000, 2);
select * from money;

update user
set user_id = 3
where user_id = 2
limit 1;
select * from user;
select * from money;

delete from user
where user_id = 3
limit 1;

select * from user;
select * from money;