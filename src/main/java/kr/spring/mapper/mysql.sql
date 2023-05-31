-- 회원 테이블 생성
-- 인덱스는 넣어주는 것이 좋다!
-- 오토인크리먼트는 프라이먼트이여만 한다.

-- 코치 테이블 생성
create table coach (
	coachIdx int not null auto_increment,
	region varchar(20) not null,
	name varchar(20) not null,
	career varchar(50) not null,
	img varchar(20) not null,
	primary key(coachIdx)
);

insert into coach(region, name, career, img) 
values('서초구','조원우','텍스트 테스트1','선수1');

insert into coach(region, name, career, img) 
values('중구','서민규','텍스트 테스트2','선수2');

insert into coach(region, name, career, img) 
values('강남구','한창현','텍스트 테스트3','선수3');

insert into coach(region, name, career, img) 
values('용산구','이지혜','텍스트 테스트4','선수4');

insert into coach(region, name, career, img) 
values('서구','박소은','텍스트 테스트5','선수5');

insert into coach(region, name, career, img) 
values('북구','이원준','텍스트 테스트6','선수6');

select * from coach;

DROP TABLE coach;





















drop table member;

create table member (
	memIdx int,
	memID varchar(20) not null,
	memPassword varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(50),
	memProfile varchar(50),
	primary key(memID)
);

select * from member;


insert into member(memID,memPassword, memName, memAge, memGender, memEmail, memProfile) 
values('admin', '1234', '관리자', 20, '남자', 'admin@gmail.com', '');


-- 게시판 테이블 생성
create table board (
	idx int  not null auto_increment,
	memID varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writter varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
);

insert into board (title, content, writter)
values('나 손흥민인데 찐짜로', '주말에 조기축구 할사람', '손흥민');

insert into board (title, content, writter)
values('나 아이유인데 찐짜로', '노래방 갈사람', '아이유');

insert into board (title, content, writter)
values('나 이제동인데', '스타하러 갈사람', '이제동');

insert into board (title, content, writter)
values('나 브롬달인데', '주말에 당구치러 갈사람', '브롬달');

insert into board (title, content, writter)
values('나 쿠드롱인데', '주말에 죽빵치러 갈사람', '브롬달');

select * from board;
























