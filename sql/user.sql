desc user;

-- join
insert into user values(null, '둘리', 'dooli@gmail.com', '1234', 'male', now());

-- select
select * from user;

-- login
select no, name from user where email = 'dooli@gmail.com' and password = '1234';
    
-- delete
delete from user where no = '3';

-- update(이름만)
update user set name = '이선무'
	where no = 2 and email = 'dltjsam@gmail.com';
    
-- update(이름과 비밀번호)
update user set name = '이선무', password = '1234'
	where no = 2 and email = 'dltjsam@gmail.com';
    
-- role(권한) 추가하기
alter table user add column role enum('user', 'admin') default 'user';

-- admin 추가하기
insert into user values(null, '관리자', 'admin@gmail.com', '1234', 'male', now(), 'admin');