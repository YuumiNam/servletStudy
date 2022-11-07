desc guestbook;

insert into guestbook values(null, '둘리', '1234', '호이~', now());

select no, name, contents, date_format(reg_date, '%Y/%m/%d %H:%i:%s')
	from guestbook;