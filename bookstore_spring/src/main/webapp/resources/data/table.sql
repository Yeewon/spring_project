use yeewonweb;

DROP TABLE IF EXISTS `yeewon_book`;
create table yeewon_book
(
	idx int not null auto_increment,
    pid varchar(5) unique,
    pname varchar(20) not null,
    price int,
    picture varchar(30) default 'noimg.png',
    cnt int default 0,
    constraint ssafy_cafe_idx_pk primary key (idx)
);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0001', '더 해빙(The Having)', 14400, 'TheHaving.jpg', 97);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0002', '돈의 속성', 15120, 'moneyproperty.jpg', 25);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0003', '아몬드', 10800, 'almond.jpg', 64);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0004', '하버드 상위 1퍼센트의 비밀', 14400, 'harvard.jpg', 783);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0005', '지적 대화를 위한 넓고 얕은 지식', 17820, 'knowledge.jpg', 697);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0006', '존리의 부자되기 습관', 13500, 'reach.jpg', 468);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0007', '달러구트 꿈 백화점', 12420, 'dream.jpg', 1012);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0008', '데미안(리커버 한정판)', 10800, 'damien.jpg', 912);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0009', '1cm 다이빙', 12150, 'diving.jpg', 283);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0010', '보건교사 안은영(특별판)', 12600, 'teacher.jpg', 204);

insert into yeewon_book (pid, pname, price, picture, cnt)
values ('b0011', '녹나무의 파수꾼', 16020, 'tree.jpg', 421);

# 메뉴검색	


# 인기메뉴
select idx, pid, pname, price, picture, cnt
from yeewon_book
order by cnt desc limit 0, 4;

select *
from yeewon_book;