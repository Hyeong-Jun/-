/* 자유게시판 */
Create table tblboard (
	num int(4) not null,
	name varchar(10) null,
	pass varchar(10) null,
	email varchar(20) null,
	title varchar(30) null,
	contents text(16) null,
	writedate varchar(30) null,
	readcount int(4) null,
	filename varchar(200) null
) charset="utf8";

/* 회원 정보 */
Create table tblMember (
	num int(4) not null auto_increment primary key,
	id varchar(10) not null,
	pwd varchar(10) not null,
	name varchar(10) not null,
	age int(4) null,
	email varchar(20) null,
	phone varchar(15) null
) charset="utf8";

/* 답글 정보 */
Create table tblplus (
	num int(4) not null primary key,
    id varchar(20) null,
    name varchar(10) null,
    contents varchar(50) null,
    writedate varchar(20) null
) charset="utf8";