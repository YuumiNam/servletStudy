desc guestbook;

-- guest insert
insert into guestbook values(null, '마이콜', '1234', 'hi', now());

-- guest select
select no, name, contents, date_format(reg_date, '%Y/%m/%d %H:%i:%s') as date
	from guestbook
order by date asc;
    
select * from guestbook;

-- guest delete by password
delete  
	from guestbook
    where no = '33'
		and password = '1234';
        
-- delete All
delete from guestbook;

-- null인 no를 쓰고싶을때
select last_insert_id();