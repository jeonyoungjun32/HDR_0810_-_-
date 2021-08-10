create table movie_1(
me_id varchar2(12) primary key,
me_pass varchar2(15) not null,
me_name varchar2(20) not null,
gender char(1),
birth date,
address char(100),
tel varchar2(13)
);

insert into movie_1 values('kus1','sin1','김유신','M','2004-02-29','경북 경산시 중방동','010-1111-2222');
insert into movie_1 values('shi2','joo2','신경주','M','2002-06-18','대구시 수성구 만촌동','010-2222-1111');
insert into movie_1 values('yrmg3','me3','양미경','F','2000-01-01','경북 경산시 남천면','010-3333-4444');
insert into movie_1 values('kis4','soo4','김지수','F','2005-11-22','경북 경산시 진량음','010-4444-3333');
insert into movie_1 values('jsw5','jang5','장선우','M','1999-12-31','대구시 수성수 사월동','010-5555-6666');
insert into movie_1 values('gig6','go6','고인규','M','2002-06-24','경북 영천시 금호읍','010-6666-5555');
insert into movie_1 values('bsy7','year7','박시연','F','2008-08-28','경북 경산시 와촌옵','010-7777-9999');

select * from movie_1;

create table movie_2(
me_id varchar2(12) not null,
me_pass varchar2(15) not null,
mo_name varchar2(50) not null,
rm_date date not null
);
drop table movie_2

insert into movie_2 values('kus1','sin1','겨울왕국2','2019-11-25');
insert into movie_2 values('kus1','sin1','늑대아이','2019-09-20');
insert into movie_2 values('sqj2','joo2','겨울왕국2','2019-11-24');
insert into movie_2 values('ymg3','me3','김복동','2019-08-15');
insert into movie_2 values('ymg3','me3','썸머 워즈','2019-08-22');
insert into movie_2 values('kis4','soo4','겨울왕국2','2019-11-28');
insert into movie_2 values('jsw5','jang5','김복동','2019-08-14');
insert into movie_2 values('gig6','go6','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','시간을 달리는 소녀','2019-01-20');

select * from movie_2;

create table movie_3(
mo_no number not null,
mo_name varchar2(50) not null,
mo_poster varchar2(20),
mo_limit varchar2(20) not null,
mo_date date,
mo_memo varchar2(100),
primary key(mo_no,mo_name)
);


-----  select_11.jsp - --- 별100개  중요!!!-----
select me_id,me_name,mo_name
from movie_1 natural join movie_2;

select me_id,me_name,mo_name,mo_limit, count(me_id)
from movie_3 natural join (select me_id,me_name,mo_name
						   from movie_1 natural join movie_2)	--mo_name로 조인
group by me_id, me_name, mo_name, mo_limit
order by 2;						   
---------select_11.jsp 방법2------ 별100개  중요!!!--------------------
select me_id,me_name,mo_name,mo_limit,count(me_id)
from MOVIE_1 natural join movie_2 natural join movie_3
group by me_id, me_name, mo_name,mo_limit
order by 2;
------------select2_12.jsp-----------------------------------
select mo_name,mo_limit,count(mo_name)
from movie_2 natural join movie_3
group by mo_name,mo_limit
order by 3 desc, 1 desc;


-- sequence 생성 ------------------------------------------
create sequence movie_3_seq
start with 1
increment by 1
minvalue 1;

drop table movie_3;

insert into movie_3 
values(movie_3_seq.nextval,'겨울왕국2','겨울왕국.jsp','전체 관람가','2019-11-21','애니메이션 겨울왕국 2탄');
insert into movie_3 
values(movie_3_seq.nextval,'늑대아이','늑대아이.jsp','전체 관람가','2019-09-13','애니메이션 늑대아이');
insert into movie_3 
values(movie_3_seq.nextval,'김복동','김복동.jsp','12세 관람가','2019-08-08','위안부 피해자 고 김복동 할머니를 취재한 다큐멘터리');
insert into movie_3 
values(movie_3_seq.nextval,'시간을 달리는 소녀','시달소.jsp','전체 관람가','2019-01-14','애니메이션 시간을 달리는 소녀');
insert into movie_3 
values(movie_3_seq.nextval,'썸머워즈','썸머워즈.jsp','전체 관람가','2019-08-13','애니메이션  썸머 워즈');
insert into movie_3 
values(movie_3_seq.nextval,'눈의 여왕4','눈여왕.jsp','전체 관람가','2019-12-24','애니메이션 눈의 여왕 4탄');


