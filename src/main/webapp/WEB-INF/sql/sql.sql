-- 회사 정보 테이블
create table company(
	company_no int,											-- 사업자 번호
	company_name varchar(50),								-- 회사 이름
	company_ceo varchar(50), 								-- 회사 대표
	company_address varchar(50),							-- 회사 주소
	company_phone varchar(50)								-- 회사 전화번호
);

-- 관리자 정보 테이블
create table admin(
    admin_no varchar(50) primary key,                     	-- PK) 관리자번호 ex)A001
    admin_id varchar(50) unique key not null,               -- ID(admin01, admin02, admin03, admin04)
    admin_pwd varchar(50) not null,                         -- 비밀번호(1234)
    admin_name varchar(50) not null,                     	-- 성명
    admin_job varchar(50) not null,                         -- 직책(ceo, manager, employee)
    admin_phone varchar(50) not null                     	-- 전화번호
);

-- 회원 정보 테이블
create table user(
    user_no varchar(50) primary key,                     	-- PK) 회원번호 ex)U20240515001
    user_id varchar(50) unique key not null,                -- ID
    user_pwd varchar(50) not null,                        	-- 비밀번호
    user_name varchar(50) not null,                        	-- 성명
    user_phone varchar(50) not null,                     	-- 전화번호
    user_email varchar(50) unique key not null,           	-- 이메일
    user_mileage int default 0,                           	-- 마일리지
    user_grade varchar(50) default "bronze",                -- 회원등급
    user_regdate datetime default now()               		-- 가입일
);

-- 객실 통합정보 테이블
create table room_info(
	room_type varchar(50) primary key,						-- PK) 객실 타입 (royal , family , suite, double, single) 
	room_total int not null,								-- 객실 총수 (15, 30, 35, 50, 100) total 230
	room_available int default 0,							-- 사용가능한 객실수
	room_area float not null,								-- 객실 면적
	room_maximum int not null,								-- 객실 정원
	room_price int not null									-- 객실 가격
);

-- 객실 테이블
create table rooms(
	room_no varchar(50) primary key,						-- PK) 객실 고유번호 ex) R01.. | F01.. | ST01.. | D01.. | S001..
	room_type varchar(50) not null, 						-- FK) 객실 타입 (royal , family , suite, double, single) 
	room_status boolean not null,							-- 방 예약상태
	
	foreign key (room_type) references room_info (room_type) on delete cascade on update cascade
);

-- 객실 예약 정보 테이블 -> 추후에 부대시설, 액티비티 예약들과 통합 될수 있음(객실 예약 테이블 따로 만들어야함)
create table reservation(
	res_no varchar(50) primary key,							-- PK) 객실 예약번호 ex) R20240515001
	res_user_id varchar(50) not null,						-- FK) 예약자 id
	res_room_no varchar(50) not null,						-- FK) 예약 방 번호
    res_room_type varchar(50) not null,						-- 예약 방 타입
	res_user_phone varchar(50) not null,					-- 예약자 전화번호
	res_peoples int not null,								-- 투숙 인원
	res_in_date date not null,								-- 체크인 날짜
	res_out_date date not null,								-- 체크아웃 날짜
	res_regdate datetime default now(),						-- 예약 등록일시
    res_status varchar(50) default "대기",					-- 예약 상태 (대기, 체크인, 체크아웃)
	res_payment_status boolean default false,				-- 결제 상태
	res_review_status boolean default false,				-- 리뷰 작성 상태
	
	foreign key (res_user_id) references user (user_id) on update cascade,
	foreign key (res_room_no) references rooms (room_no) on update cascade
);

-- 부대시설 정보 테이블
create table facility_info(
	facility_id int unique key,								-- 부대시설 고유ID
	facility_type varchar(50) not null,						-- 부대시설 종류
	facility_name varchar(50) not null,						-- 부대시설 이름
	facility_start_time time,								-- 오픈시간
	facility_end_time time									-- 마감시간
);

-- 액티비티 정보 테이블
create table activity_info(
	activity_id int unique key,								-- 액티비티 고유ID
	activity_type varchar(50) not null,						-- 액티비티 종류
	activity_name varchar(50) not null,						-- 액티비티 이름
	activity_start_time time,								-- 오픈시간
	activity_end_time time									-- 마감시간
);

-- 결제 정보 테이블
create table payment_info(
	payment_no int primary key,								-- PK) 결제 고유번호
	payment_res_no varchar(50) not null,					-- FK) 예약 번호
	payment_user_id varchar(50) not null,					-- FK) 예약자 ID
	payment_date date,										-- 결제일시
	payment_price int not null,								-- 결제금
    
    foreign key (payment_res_no) references reservation (res_no) on update cascade,
	foreign key (payment_user_id) references user (user_id) on update cascade
);


-- 마일리지 테이블
create table mileage(
    mileage_user_id varchar(50) not null,            		-- 적립 회원번호
    mileage_date datetime default now(),            		-- 적립 일시
    mileage_cont varchar(50) not null,              	 	-- 적립 내용
    mileage_type varchar(50) not null,             		  	-- 적립(+), 차감(-) 구분
    mileage_amount int not null,                  			-- 적립 마일리지
    mileage_status int not null,                  			-- 현재 마일리지
    mileage_grade varchar(50) not null               		-- 현재 등급
);

-- 리뷰 게시판 테이블
create table review_board(
	review_board_no int primary key,						-- PK) 리뷰 게시판 고유번호
	review_board_writer_id varchar(50) not null,			-- FK) 작성자 ID
	review_board_res_no varchar(50) not null,				-- FK) 객실 예약번호
	review_board_cont varchar(2000) not null,				-- 리뷰 게시판 내용
	review_board_date datetime default now(),				-- 등록 날짜
	review_board_update datetime default null,				-- 수정 날짜
	review_board_file varchar(2000),						-- 업로드 사진
	review_board_hit int default 0,							-- 조회수
	review_board_point float default 5.0,					-- 별점
	
	foreign key (review_board_writer_id) references user (user_id) on update cascade,
	foreign key (review_board_res_no) references reservation (res_no) on update cascade
);

-- 공지사항 게시판 테이블
create table notice_board(
    notice_board_no int primary key,                  		-- PK) 글번호
    notice_board_writer_id varchar(50) not null,         	-- FK) 작성자
    notice_board_title varchar(50) not null,            	-- 제목
    notice_board_cont varchar(2000) not null,               -- 내용
    notice_board_date datetime not null default now(),      -- 게시일자
    notice_board_update datetime,                     		-- 수정일자
    notice_board_hit int default 0,                     	-- 조회수
    notice_board_file varchar(2000),                     	-- 업로드 파일
    
    foreign key (notice_board_writer_id) references admin (admin_id) on update cascade
);

-- 이벤트 게시판 테이블
create table event_board(
    event_board_no int primary key,                     	-- PK) 글번호
    event_board_writer_id varchar(50) not null,            	-- FK) 작성자
    event_board_title varchar(50) not null,               	-- 제목
    event_board_cont varchar(2000) not null,   				-- 내용
    event_board_date datetime not null default now(),		-- 게시일자
    event_board_update datetime,                     		-- 수정일자
    event_board_hit int default 0,                     		-- 조회수
    event_board_file varchar(2000),                    		-- 업로드 파일
    
    foreign key (event_board_writer_id) references admin (admin_id) on update cascade
);

-- QnA 게시판 테이블
create table qna_board(
    qna_board_no int primary key,                  			-- PK) 글번호
    qna_board_writer_id varchar(50) not null,         		-- FK) 작성자
    qna_board_answer_id varchar(50) default null,			-- FK) 답변 작성자
    qna_board_type varchar(50) not null,            		-- 문의 유형
    qna_board_title varchar(50) not null,            		-- 제목
    qna_board_cont varchar(2000) not null,            		-- 내용
    qna_board_answer varchar(2000) default null,   			-- 문의 답변
    qna_board_date datetime not null default now(),      	-- 게시일자
    qna_board_update datetime,                     			-- 수정일자
    qna_board_file varchar(2000),                  			-- 업로드 파일
    qna_board_status boolean not null default false,     	-- 문의 상태
    
    foreign key (qna_board_writer_id) references user (user_id) on update cascade,
    foreign key (qna_board_answer_id) references admin (admin_id) on update cascade
);


-- 예약 취소 요청 테이블
create table req_reservation(
	req_no int primary key,									-- PK) 취소요청 고유번호
	req_res_type varchar(50) not null,						-- 취소할 예약의 타입(room, facility, activity - 페이지에서 select 박스로 입력받기)
	req_res_no varchar(50) not null,						-- 취소할 예약번호
	req_res_in_date date not null,							-- 취소할 예약의 체크인 날짜
	req_res_out_date date not null,							-- 취소할 예약의 체크아웃 날짜
	req_date datetime not null default now(),				-- 취소 신청한 날짜
	req_status boolean default false						-- 취소 요청 상태 (true, false)
);

-- 로그 테이블
create table log(
    log_date datetime not null default now(),				-- 로그 날짜
    log_user_id varchar(50) not null,						-- 로그 ID
    log_type varchar(50) not null							-- 로그 타입(login, logout)
);

create table res_log (
	room_no varchar(50),									-- 예약 로그 방 번호	
    room_type varchar(50),									-- 예약 로그 방 타입
    room_start date,										-- 예약 체크인
    room_end date											-- 예약 체크아웃
);


-- admin insert
insert into admin values("A001", "admin01", "1234", "이찬우", "CEO", "010-1234-1234");
insert into admin values("A002", "admin02", "1234", "길호성", "manager", "010-1234-1234");
insert into admin values("A003", "admin03", "1234", "염종원", "manager", "010-1234-1234");
insert into admin values("A004", "admin04", "1234", "최유경", "manager", "010-1234-1234");

-- user insert
insert into user values("U20240520001", "sksmsdltjsdn", "1111", "이찬우", "010-1234-1234", "lee@naver.com", 100000, "VIP", "2024-05-20");
insert into user values("U20240521001", "rlfghtjd", "1111", "길호성", "010-1234-1234", "gil@gmail.com", 100000, "VIP", "2024-05-21");
insert into user values("U20240522001", "yyjjww3", "1111", "염종원", "010-1234-1234", "yuem@naver.com", 100000, "VIP", "2024-05-22");
insert into user values("U20240523001", "rud9807", "1111", "최유경", "010-1234-1234", "choi@gmail.com", 100000, "VIP", "2024-05-23");
insert into user values("U20240524001", "user1", "1111", "최유저", "010-1234-1234", "user1@gmail.com", 10000, "Bronze", "2024-05-24");
insert into user values("U20240525001", "user2", "1111", "김유저", "010-1234-1234", "user2@gmail.com", 10000, "Bronze", "2024-05-25");
insert into user values("U20240526001", "user3", "1111", "이유저", "010-1234-1234", "user3@gmail.com", 10000, "Bronze", "2024-05-26");
insert into user values("U20240527001", "user4", "1111", "박유저", "010-1234-1234", "user4@gmail.com", 10000, "Bronze", "2024-05-27");
insert into user values("U20240528001", "user5", "1111", "홍유저", "010-1234-1234", "user5@gmail.com", 10000, "Bronze", "2024-05-28");
insert into user values("U20240529001", "user6", "1111", "오유저", "010-1234-1234", "user6@gmail.com", 10000, "Bronze", "2024-05-29");
insert into user values("U20240530001", "user7", "1111", "길유저", "010-1234-1234", "user7@gmail.com", 10000, "Bronze", "2024-05-30");
insert into user values("U20240531001", "user8", "1111", "권유저", "010-1234-1234", "user8@gmail.com", 10000, "Bronze", "2024-05-31");
insert into user values("U20240601001", "user9", "1111", "김유진", "010-1234-1234", "user9@gmail.com", 10000, "Bronze", "2024-06-01");
insert into user values("U20240602001", "user10", "1111", "최유일", "010-1234-1234", "user10@gmail.com", 10000, "Bronze", "2024-06-02");
insert into user values("U20240603001", "user11", "1111", "최유이", "010-1234-1234", "user11@gmail.com", 10000, "Bronze", "2024-06-03");
insert into user values("U20240604001", "user12", "1111", "최유삼", "010-1234-1234", "user12@gmail.com", 10000, "Bronze", "2024-06-04");
insert into user values("U20240605001", "user13", "1111", "최유사", "010-1234-1234", "user13@gmail.com", 10000, "Bronze", "2024-06-05");
insert into user values("U20240606001", "user14", "1111", "최유오", "010-1234-1234", "user14@gmail.com", 10000, "Bronze", "2024-06-06");
insert into user values("U20240607001", "user15", "1111", "최유육", "010-1234-1234", "user15@gmail.com", 10000, "Bronze", "2024-06-07");
insert into user values("U20240608001", "user16", "1111", "최유칠", "010-1234-1234", "user16@gmail.com", 10000, "Bronze", "2024-06-08");
insert into user values("U20240609001", "user17", "1111", "최유팔", "010-1234-1234", "user17@gmail.com", 10000, "Bronze", "2024-06-09");
insert into user values("U20240610001", "user18", "1111", "최유구", "010-1234-1234", "user18@gmail.com", 10000, "Bronze", "2024-06-10");
insert into user values("U20240611001", "user19", "1111", "김유일", "010-1234-1234", "user19@gmail.com", 10000, "Bronze", "2024-06-11");
insert into user values("U20240612001", "user20", "1111", "김유이", "010-1234-1234", "user20@gmail.com", 10000, "Bronze", "2024-06-12");
insert into user values("U20240613001", "user21", "1111", "김유삼", "010-1234-1234", "user21@gmail.com", 10000, "Bronze", "2024-06-13");
insert into user values("U20240614001", "user22", "1111", "김유사", "010-1234-1234", "user22@gmail.com", 10000, "Bronze", "2024-06-14");
insert into user values("U20240615001", "user23", "1111", "김유오", "010-1234-1234", "user23@gmail.com", 10000, "Bronze", "2024-06-15");
insert into user values("U20240616001", "user24", "1111", "김유육", "010-1234-1234", "user24@gmail.com", 10000, "Bronze", "2024-06-16");
insert into user values("U20240617001", "user25", "1111", "김유칠", "010-1234-1234", "user25@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617002", "user26", "1111", "김유팔", "010-1234-1234", "user26@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617003", "user27", "1111", "김유구", "010-1234-1234", "user27@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617004", "user28", "1111", "김유십", "010-1234-1234", "user28@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617005", "user29", "1111", "김일일", "010-1234-1234", "user29@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617006", "user30", "1111", "김일이", "010-1234-1234", "user30@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617007", "user31", "1111", "김일삼", "010-1234-1234", "user31@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617008", "user32", "1111", "김일사", "010-1234-1234", "user32@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617009", "user33", "1111", "김일오", "010-1234-1234", "user33@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617010", "user34", "1111", "김일육", "010-1234-1234", "user34@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617011", "user35", "1111", "김일칠", "010-1234-1234", "user35@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617012", "user36", "1111", "김일팔", "010-1234-1234", "user36@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617013", "user37", "1111", "김일구", "010-1234-1234", "user37@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617014", "user38", "1111", "김일십", "010-1234-1234", "user38@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617015", "user39", "1111", "김이일", "010-1234-1234", "user39@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617016", "user40", "1111", "김이이", "010-1234-1234", "user40@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617017", "user41", "1111", "김이삼", "010-1234-1234", "user41@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617018", "user42", "1111", "김이사", "010-1234-1234", "user42@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617019", "user43", "1111", "김이오", "010-1234-1234", "user43@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617020", "user44", "1111", "김이육", "010-1234-1234", "user44@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617021", "user45", "1111", "김이칠", "010-1234-1234", "user45@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617022", "user46", "1111", "김이팔", "010-1234-1234", "user46@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617023", "user47", "1111", "김이구", "010-1234-1234", "user47@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617024", "user48", "1111", "김삼십", "010-1234-1234", "user48@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617025", "user49", "1111", "김삼일", "010-1234-1234", "user49@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617026", "user50", "1111", "김삼이", "010-1234-1234", "user50@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617027", "user51", "1111", "김삼삼", "010-1234-1234", "user51@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617028", "user52", "1111", "김삼사", "010-1234-1234", "user52@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617029", "user53", "1111", "김삼오", "010-1234-1234", "user53@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617030", "user54", "1111", "김삼육", "010-1234-1234", "user54@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617031", "user55", "1111", "김삼칠", "010-1234-1234", "user55@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617032", "user56", "1111", "김삼팔", "010-1234-1234", "user56@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617033", "user57", "1111", "김삼구", "010-1234-1234", "user57@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617034", "user58", "1111", "김삼십", "010-1234-1234", "user58@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617035", "user59", "1111", "김사일", "010-1234-1234", "user59@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617036", "user60", "1111", "김사이", "010-1234-1234", "user60@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617037", "user61", "1111", "김사삼", "010-1234-1234", "user61@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617038", "user62", "1111", "김사오", "010-1234-1234", "user62@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617039", "user63", "1111", "김사육", "010-1234-1234", "user63@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617040", "user64", "1111", "김사칠", "010-1234-1234", "user64@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617041", "user65", "1111", "김사팔", "010-1234-1234", "user65@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617042", "user66", "1111", "김사구", "010-1234-1234", "user66@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617043", "user67", "1111", "김사십", "010-1234-1234", "user67@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617044", "user68", "1111", "김오일", "010-1234-1234", "user68@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617045", "user69", "1111", "김오이", "010-1234-1234", "user69@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617046", "user70", "1111", "김오삼", "010-1234-1234", "user70@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617047", "user71", "1111", "김오사", "010-1234-1234", "user71@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617048", "user72", "1111", "김오오", "010-1234-1234", "user72@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617049", "user73", "1111", "김오육", "010-1234-1234", "user73@gmail.com", 10000, "Bronze", "2024-06-17");
insert into user values("U20240617050", "user74", "1111", "김오칠", "010-1234-1234", "user74@gmail.com", 30000, "Bronze", "2024-06-17");
insert into user values("U20240617051", "user75", "1111", "김오팔", "010-1234-1234", "user75@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617052", "user76", "1111", "김오구", "010-1234-1234", "user76@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617053", "user77", "1111", "김오십", "010-1234-1234", "user77@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617054", "user78", "1111", "김육일", "010-1234-1234", "user78@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617055", "user79", "1111", "김육이", "010-1234-1234", "user79@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617056", "user80", "1111", "김육삼", "010-1234-1234", "user80@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617057", "user81", "1111", "김육사", "010-1234-1234", "user81@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617058", "user82", "1111", "김육오", "010-1234-1234", "user82@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617059", "user83", "1111", "김육육", "010-1234-1234", "user83@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617060", "user84", "1111", "김육칠", "010-1234-1234", "user84@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617061", "user85", "1111", "김육팔", "010-1234-1234", "user85@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617062", "user86", "1111", "김육구", "010-1234-1234", "user86@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617063", "user87", "1111", "김육십", "010-1234-1234", "user87@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617064", "user88", "1111", "김칠일", "010-1234-1234", "user88@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617065", "user89", "1111", "김칠이", "010-1234-1234", "user89@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617066", "user90", "1111", "김칠삼", "010-1234-1234", "user90@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617067", "user91", "1111", "김칠사", "010-1234-1234", "user91@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617068", "user92", "1111", "김칠오", "010-1234-1234", "user92@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617069", "user93", "1111", "김칠육", "010-1234-1234", "user93@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617070", "user94", "1111", "김칠칠", "010-1234-1234", "user94@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617071", "user95", "1111", "김칠팔", "010-1234-1234", "user95@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617072", "user96", "1111", "김칠구", "010-1234-1234", "user96@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617073", "user97", "1111", "김칠십", "010-1234-1234", "user97@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617074", "user98", "1111", "김팔일", "010-1234-1234", "user98@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617075", "user99", "1111", "김팔이", "010-1234-1234", "user99@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617076", "user100", "1111", "김팔삼", "010-1234-1234", "user100@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617077", "user101", "1111", "김팔사", "010-1234-1234", "user101@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617078", "user102", "1111", "김팔오", "010-1234-1234", "user102@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617079", "user103", "1111", "김팔육", "010-1234-1234", "user103@gmail.com", 30000, "Silver", "2024-06-17");
insert into user values("U20240617080", "user104", "1111", "김팔칠", "010-1234-1234", "user104@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617081", "user105", "1111", "김팔팔", "010-1234-1234", "user105@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617082", "user106", "1111", "김팔구", "010-1234-1234", "user106@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617083", "user107", "1111", "김팔십", "010-1234-1234", "user107@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617084", "user108", "1111", "김구일", "010-1234-1234", "user108@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617085", "user109", "1111", "김구이", "010-1234-1234", "user109@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617086", "user110", "1111", "김구삼", "010-1234-1234", "user110@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617087", "user111", "1111", "김구사", "010-1234-1234", "user111@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617088", "user112", "1111", "김구오", "010-1234-1234", "user112@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617089", "user113", "1111", "김구육", "010-1234-1234", "user113@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617090", "user114", "1111", "김구칠", "010-1234-1234", "user114@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617091", "user115", "1111", "김구팔", "010-1234-1234", "user115@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617092", "user116", "1111", "김구구", "010-1234-1234", "user116@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617093", "user117", "1111", "김구십", "010-1234-1234", "user117@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617094", "user118", "1111", "김백일", "010-1234-1234", "user118@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617095", "user119", "1111", "김백이", "010-1234-1234", "user119@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617096", "user120", "1111", "김백삼", "010-1234-1234", "user120@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617097", "user121", "1111", "김백사", "010-1234-1234", "user121@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617098", "user122", "1111", "김백오", "010-1234-1234", "user122@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617099", "user123", "1111", "김백육", "010-1234-1234", "user123@gmail.com", 50000, "Gold", "2024-06-17");
insert into user values("U20240617100", "user124", "1111", "김백칠", "010-1234-1234", "user124@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617101", "user125", "1111", "김백팔", "010-1234-1234", "user125@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617102", "user126", "1111", "김백구", "010-1234-1234", "user126@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617103", "user127", "1111", "김백십", "010-1234-1234", "user127@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617104", "user128", "1111", "이공일", "010-1234-1234", "user128@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617105", "user129", "1111", "이공이", "010-1234-1234", "user129@gmail.com", 100000, "VIP", "2024-06-17");
insert into user values("U20240617106", "user130", "1111", "이공삼", "010-1234-1234", "user130@gmail.com", 100000, "VIP", "2024-06-17");

-- room_info insert
insert into room_info values("royal", 15, default, 180.0, 4, 1330000);
insert into room_info values("suite", 35, default, 66.2, 4, 910000);
insert into room_info values("family", 30, default, 57.5, 4, 334500);
insert into room_info values("double", 50, default, 40.5, 2, 289500);
insert into room_info values("single", 100, default, 28.5, 1, 180000);

-- rooms insert
insert into rooms values("R01", "royal", false);
insert into rooms values("R02", "royal", false);
insert into rooms values("R03", "royal", false);
insert into rooms values("R04", "royal", false);
insert into rooms values("R05", "royal", false);
insert into rooms values("R06", "royal", false);
insert into rooms values("R07", "royal", false);
insert into rooms values("R08", "royal", false);
insert into rooms values("R09", "royal", false);
insert into rooms values("R10", "royal", false);
insert into rooms values("R11", "royal", false);
insert into rooms values("R12", "royal", false);
insert into rooms values("R13", "royal", false);
insert into rooms values("R14", "royal", false);
insert into rooms values("R15", "royal", false);
insert into rooms values("F01", "family", false);
insert into rooms values("F02", "family", false);
insert into rooms values("F03", "family", false);
insert into rooms values("F04", "family", false);
insert into rooms values("F05", "family", false);
insert into rooms values("F06", "family", false);
insert into rooms values("F07", "family", false);
insert into rooms values("F08", "family", false);
insert into rooms values("F09", "family", false);
insert into rooms values("F10", "family", false);
insert into rooms values("F11", "family", false);
insert into rooms values("F12", "family", false);
insert into rooms values("F13", "family", false);
insert into rooms values("F14", "family", false);
insert into rooms values("F15", "family", false);
insert into rooms values("F16", "family", false);
insert into rooms values("F17", "family", false);
insert into rooms values("F18", "family", false);
insert into rooms values("F19", "family", false);
insert into rooms values("F20", "family", false);
insert into rooms values("F21", "family", false);
insert into rooms values("F22", "family", false);
insert into rooms values("F23", "family", false);
insert into rooms values("F24", "family", false);
insert into rooms values("F25", "family", false);
insert into rooms values("F26", "family", false);
insert into rooms values("F27", "family", false);
insert into rooms values("F28", "family", false);
insert into rooms values("F29", "family", false);
insert into rooms values("F30", "family", false);
insert into rooms values("ST01", "suite", false);
insert into rooms values("ST02", "suite", false);
insert into rooms values("ST03", "suite", false);
insert into rooms values("ST04", "suite", false);
insert into rooms values("ST05", "suite", false);
insert into rooms values("ST06", "suite", false);
insert into rooms values("ST07", "suite", false);
insert into rooms values("ST08", "suite", false);
insert into rooms values("ST09", "suite", false);
insert into rooms values("ST10", "suite", false);
insert into rooms values("ST11", "suite", false);
insert into rooms values("ST12", "suite", false);
insert into rooms values("ST13", "suite", false);
insert into rooms values("ST14", "suite", false);
insert into rooms values("ST15", "suite", false);
insert into rooms values("ST16", "suite", false);
insert into rooms values("ST17", "suite", false);
insert into rooms values("ST18", "suite", false);
insert into rooms values("ST19", "suite", false);
insert into rooms values("ST20", "suite", false);
insert into rooms values("ST21", "suite", false);
insert into rooms values("ST22", "suite", false);
insert into rooms values("ST23", "suite", false);
insert into rooms values("ST24", "suite", false);
insert into rooms values("ST25", "suite", false);
insert into rooms values("ST26", "suite", false);
insert into rooms values("ST27", "suite", false);
insert into rooms values("ST28", "suite", false);
insert into rooms values("ST29", "suite", false);
insert into rooms values("ST30", "suite", false);
insert into rooms values("ST31", "suite", false);
insert into rooms values("ST32", "suite", false);
insert into rooms values("ST33", "suite", false);
insert into rooms values("ST34", "suite", false);
insert into rooms values("ST35", "suite", false);
insert into rooms values("D01", "double", false);
insert into rooms values("D02", "double", false);
insert into rooms values("D03", "double", false);
insert into rooms values("D04", "double", false);
insert into rooms values("D05", "double", false);
insert into rooms values("D06", "double", false);
insert into rooms values("D07", "double", false);
insert into rooms values("D08", "double", false);
insert into rooms values("D09", "double", false);
insert into rooms values("D10", "double", false);
insert into rooms values("D11", "double", false);
insert into rooms values("D12", "double", false);
insert into rooms values("D13", "double", false);
insert into rooms values("D14", "double", false);
insert into rooms values("D15", "double", false);
insert into rooms values("D16", "double", false);
insert into rooms values("D17", "double", false);
insert into rooms values("D18", "double", false);
insert into rooms values("D19", "double", false);
insert into rooms values("D20", "double", false);
insert into rooms values("D21", "double", false);
insert into rooms values("D22", "double", false);
insert into rooms values("D23", "double", false);
insert into rooms values("D24", "double", false);
insert into rooms values("D25", "double", false);
insert into rooms values("D26", "double", false);
insert into rooms values("D27", "double", false);
insert into rooms values("D28", "double", false);
insert into rooms values("D29", "double", false);
insert into rooms values("D30", "double", false);
insert into rooms values("D31", "double", false);
insert into rooms values("D32", "double", false);
insert into rooms values("D33", "double", false);
insert into rooms values("D34", "double", false);
insert into rooms values("D35", "double", false);
insert into rooms values("D36", "double", false);
insert into rooms values("D37", "double", false);
insert into rooms values("D38", "double", false);
insert into rooms values("D39", "double", false);
insert into rooms values("D40", "double", false);
insert into rooms values("D41", "double", false);
insert into rooms values("D42", "double", false);
insert into rooms values("D43", "double", false);
insert into rooms values("D44", "double", false);
insert into rooms values("D45", "double", false);
insert into rooms values("D46", "double", false);
insert into rooms values("D47", "double", false);
insert into rooms values("D48", "double", false);
insert into rooms values("D49", "double", false);
insert into rooms values("D50", "double", false);
insert into rooms values("S001", "single", false);
insert into rooms values("S002", "single", false);
insert into rooms values("S003", "single", false);
insert into rooms values("S004", "single", false);
insert into rooms values("S005", "single", false);
insert into rooms values("S006", "single", false);
insert into rooms values("S007", "single", false);
insert into rooms values("S008", "single", false);
insert into rooms values("S009", "single", false);
insert into rooms values("S010", "single", false);
insert into rooms values("S011", "single", false);
insert into rooms values("S012", "single", false);
insert into rooms values("S013", "single", false);
insert into rooms values("S014", "single", false);
insert into rooms values("S015", "single", false);
insert into rooms values("S016", "single", false);
insert into rooms values("S017", "single", false);
insert into rooms values("S018", "single", false);
insert into rooms values("S019", "single", false);
insert into rooms values("S020", "single", false);
insert into rooms values("S021", "single", false);
insert into rooms values("S022", "single", false);
insert into rooms values("S023", "single", false);
insert into rooms values("S024", "single", false);
insert into rooms values("S025", "single", false);
insert into rooms values("S026", "single", false);
insert into rooms values("S027", "single", false);
insert into rooms values("S028", "single", false);
insert into rooms values("S029", "single", false);
insert into rooms values("S030", "single", false);
insert into rooms values("S031", "single", false);
insert into rooms values("S032", "single", false);
insert into rooms values("S033", "single", false);
insert into rooms values("S034", "single", false);
insert into rooms values("S035", "single", false);
insert into rooms values("S036", "single", false);
insert into rooms values("S037", "single", false);
insert into rooms values("S038", "single", false);
insert into rooms values("S039", "single", false);
insert into rooms values("S040", "single", false);
insert into rooms values("S041", "single", false);
insert into rooms values("S042", "single", false);
insert into rooms values("S043", "single", false);
insert into rooms values("S044", "single", false);
insert into rooms values("S045", "single", false);
insert into rooms values("S046", "single", false);
insert into rooms values("S047", "single", false);
insert into rooms values("S048", "single", false);
insert into rooms values("S049", "single", false);
insert into rooms values("S050", "single", false);
insert into rooms values("S051", "single", false);
insert into rooms values("S052", "single", false);
insert into rooms values("S053", "single", false);
insert into rooms values("S054", "single", false);
insert into rooms values("S055", "single", false);
insert into rooms values("S056", "single", false);
insert into rooms values("S057", "single", false);
insert into rooms values("S058", "single", false);
insert into rooms values("S059", "single", false);
insert into rooms values("S060", "single", false);
insert into rooms values("S061", "single", false);
insert into rooms values("S062", "single", false);
insert into rooms values("S063", "single", false);
insert into rooms values("S064", "single", false);
insert into rooms values("S065", "single", false);
insert into rooms values("S066", "single", false);
insert into rooms values("S067", "single", false);
insert into rooms values("S068", "single", false);
insert into rooms values("S069", "single", false);
insert into rooms values("S070", "single", false);
insert into rooms values("S071", "single", false);
insert into rooms values("S072", "single", false);
insert into rooms values("S073", "single", false);
insert into rooms values("S074", "single", false);
insert into rooms values("S075", "single", false);
insert into rooms values("S076", "single", false);
insert into rooms values("S077", "single", false);
insert into rooms values("S078", "single", false);
insert into rooms values("S079", "single", false);
insert into rooms values("S080", "single", false);
insert into rooms values("S081", "single", false);
insert into rooms values("S082", "single", false);
insert into rooms values("S083", "single", false);
insert into rooms values("S084", "single", false);
insert into rooms values("S085", "single", false);
insert into rooms values("S086", "single", false);
insert into rooms values("S087", "single", false);
insert into rooms values("S088", "single", false);
insert into rooms values("S089", "single", false);
insert into rooms values("S090", "single", false);
insert into rooms values("S091", "single", false);
insert into rooms values("S092", "single", false);
insert into rooms values("S093", "single", false);
insert into rooms values("S094", "single", false);
insert into rooms values("S095", "single", false);
insert into rooms values("S096", "single", false);
insert into rooms values("S097", "single", false);
insert into rooms values("S098", "single", false);
insert into rooms values("S099", "single", false);
insert into rooms values("S100", "single", false);

-- notice insert
insert into notice_board values(1, "admin02", "안녕하세요 몬트리오 리조트입니다.", "공지사항", default, null, default, null);
insert into notice_board values(2, "admin02", "사이트 점검 일시 안내.", "공지사항", default, null, default, null);
insert into notice_board values(3, "admin02", "결제 시스템 점검 안내.", "공지사항", default, null, default, null);
insert into notice_board values(4, "admin02", "최근 이슈 관련 안내.", "공지사항", default, null, default, null);
insert into notice_board values(5, "admin02", "금주 안내사항.", "공지사항", default, null, default, null);
insert into notice_board values(6, "admin02", "금주 안내사항.ㄱ", "공지사항", default, null, default, null);
insert into notice_board values(7, "admin02", "금주 안내사항.ㄴ", "공지사항", default, null, default, null);
insert into notice_board values(8, "admin02", "금주 안내사항.ㄷ", "공지사항", default, null, default, null);
insert into notice_board values(9, "admin02", "금주 안내사항.ㄹ", "공지사항", default, null, default, null);
insert into notice_board values(10, "admin02", "금주 안내사항.ㅁ", "공지사항", default, null, default, null);
insert into notice_board values(11, "admin02", "금주 안내사항.ㅂ", "공지사항", default, null, default, null);
insert into notice_board values(12, "admin02", "금주 안내사항.ㅅ", "공지사항", default, null, default, null);
insert into notice_board values(13, "admin02", "금주 안내사항.ㅇ", "공지사항", default, null, default, null);
insert into notice_board values(14, "admin02", "금주 안내사항.ㅈ", "공지사항", default, null, default, null);
insert into notice_board values(15, "admin02", "금주 안내사항.ㅊ", "공지사항", default, null, default, null);
insert into notice_board values(16, "admin02", "금주 안내사항.ㅌ", "공지사항", default, null, default, null);
insert into notice_board values(17, "admin02", "금주 안내사항.ㅍ", "공지사항", default, null, default, null);
insert into notice_board values(18, "admin02", "금주 안내사항.ㅎ", "공지사항", default, null, default, null);
insert into notice_board values(19, "admin02", "금주 안내사항.1", "공지사항", default, null, default, null);
insert into notice_board values(20, "admin02", "금주 안내사항.2", "공지사항", default, null, default, null);
insert into notice_board values(21, "admin02", "금주 안내사항.3", "공지사항", default, null, default, null);
insert into notice_board values(22, "admin02", "금주 안내사항.4", "공지사항", default, null, default, null);
insert into notice_board values(23, "admin02", "금주 안내사항.5", "공지사항", default, null, default, null);
insert into notice_board values(24, "admin02", "금주 안내사항.6", "공지사항", default, null, default, null);
insert into notice_board values(25, "admin02", "금주 안내사항.7", "공지사항", default, null, default, null);
insert into notice_board values(26, "admin02", "금주 안내사항.8", "공지사항", default, null, default, null);
insert into notice_board values(27, "admin02", "금주 안내사항.9", "공지사항", default, null, default, null);
insert into notice_board values(28, "admin02", "금주 안내사항.10", "공지사항", default, null, default, null);
insert into notice_board values(29, "admin02", "금주 안내사항.11", "공지사항", default, null, default, null);
insert into notice_board values(30, "admin02", "금주 안내사항.12", "공지사항", default, null, default, null);
insert into notice_board values(31, "admin02", "금주 안내사항.13", "공지사항", default, null, default, null);
insert into notice_board values(32, "admin02", "금주 안내사항.14", "공지사항", default, null, default, null);
insert into notice_board values(33, "admin02", "금주 안내사항.15", "공지사항", default, null, default, null);
insert into notice_board values(34, "admin02", "금주 안내사항.16", "공지사항", default, null, default, null);
insert into notice_board values(35, "admin02", "금주 안내사항.17", "공지사항", default, null, default, null);
insert into notice_board values(36, "admin02", "금주 안내사항.18", "공지사항", default, null, default, null);
insert into notice_board values(37, "admin02", "금주 안내사항.a", "공지사항", default, null, default, null);
insert into notice_board values(38, "admin02", "금주 안내사항.b", "공지사항", default, null, default, null);
insert into notice_board values(39, "admin02", "금주 안내사항.c", "공지사항", default, null, default, null);
insert into notice_board values(40, "admin02", "금주 안내사항.22d", "공지사항", default, null, default, null);
insert into notice_board values(41, "admin02", "금주 안내사항.23e", "공지사항", default, null, default, null);
insert into notice_board values(42, "admin02", "금주 안내사항.24f", "공지사항", default, null, default, null);
insert into notice_board values(43, "admin02", "금주 안내사항.25g", "공지사항", default, null, default, null);

-- event insert
insert into event_board values(1, "admin02", "이벤트 리스트1.", "공지1사항", default, null, default, null);
insert into event_board values(2, "admin02", "이벤트 리스트2.", "공지2사항", default, null, default, null);
insert into event_board values(3, "admin02", "이벤트 리스트3.", "공지3사항", default, null, default, null);
insert into event_board values(4, "admin02", "이벤트 리스트4.", "공지4사항", default, null, default, null);
insert into event_board values(5, "admin02", "이벤트 리스트5.", "공지5사항", default, null, default, null);
insert into event_board values(6, "admin02", "이벤트 리스트6.", "공지6사항", default, null, default, null);
insert into event_board values(7, "admin02", "이벤트 리스트7.", "공지7사항", default, null, default, null);
insert into event_board values(8, "admin02", "이벤트 리스트8.", "공지8사항", default, null, default, null);
insert into event_board values(9, "admin02", "이벤트 리스트9.", "공지9사항", default, null, default, null);
insert into event_board values(10, "admin02", "이벤트 리스트10a.", "공지ㄱ사항", default, null, default, null);
insert into event_board values(11, "admin02", "이벤트 리스트11b.", "공지ㄴ사항", default, null, default, null);
insert into event_board values(12, "admin02", "이벤트 리스트12c.", "공지ㄷ사항", default, null, default, null);
insert into event_board values(13, "admin02", "이벤트 리스트1ㅋd.", "공지ㄹ사항", default, null, default, null);
insert into event_board values(14, "admin02", "이벤트 리스트ㅌe.", "공지ㅁ사항", default, null, default, null);
insert into event_board values(15, "admin02", "이벤트 리스트ㅠf.", "공지ㅂ사항", default, null, default, null);
insert into event_board values(16, "admin02", "이벤트 리스트ㄱ.", "공지ㅅ사항", default, null, default, null);
insert into event_board values(17, "admin02", "이벤트 리스트ㄴ.", "공지ㅇㅇ사항", default, null, default, null);
insert into event_board values(18, "admin02", "이벤트 리스트ㄷ.", "공지ㅋㅌ사항", default, null, default, null);
insert into event_board values(19, "admin02", "이벤트 리스트ㄹ.", "공지ㅈㅈ사항", default, null, default, null);
insert into event_board values(20, "admin02", "이벤트 리스트ㅁ.", "공지ㅂㄷ사항", default, null, default, null);
insert into event_board values(21, "admin02", "이벤트 리스트ㅂ.", "공지ㅌ사항", default, null, default, null);
insert into event_board values(22, "admin02", "이벤트 리스트ㅅ.", "공지ㅁㅇㅈ사항", default, null, default, null);
insert into event_board values(23, "admin02", "이벤트 리스트ㅇ.", "공지asd사항", default, null, default, null);
insert into event_board values(24, "admin02", "이벤트 리스트ㅈ.", "공지qwe사항", default, null, default, null);
insert into event_board values(25, "admin02", "이벤트 리스트ㅊ.", "공지zxc사항", default, null, default, null);

-- reservation
insert into reservation values("R20240609001", "rlfghtjd", "R01", "royal", "010-1234-1234", 1, "2024-06-21", "2024-06-30", "2024-06-09", default, true, false);
insert into reservation values("R20240505003", "rlfghtjd", "R02", "royal", "010-1234-1234", 1, "2024-05-05", "2024-05-07", "2024-05-05", "체크아웃", true, false);
insert into reservation values("R20240505004", "rlfghtjd", "R03", "royal", "010-1234-1234", 1, "2024-05-05", "2024-05-06", "2024-05-05", "체크아웃", true, false);
insert into reservation values("R20240505005", "rlfghtjd", "R04", "royal", "010-1234-1234", 1, "2024-05-05", "2024-05-07", "2024-05-05", "체크아웃", true, false);
insert into reservation values("R20240601001", "rlfghtjd", "R05", "royal", "010-1234-1234", 1, "2024-06-01", "2024-06-03", "2024-06-01", "체크아웃", true, false);
insert into reservation values("R20240601002", "rlfghtjd", "R06", "royal", "010-1234-1234", 1, "2024-06-01", "2024-06-03", "2024-06-01", "체크아웃", true, false);
insert into reservation values("R20240601003", "rlfghtjd", "R07", "royal", "010-1234-1234", 1, "2024-06-01", "2024-06-03", "2024-06-01", "체크아웃", true, false);
insert into reservation values("R20240601004", "rlfghtjd", "R08", "royal", "010-1234-1234", 1, "2024-06-01", "2024-06-03", "2024-06-01", "체크아웃", true, false);
insert into reservation values("R20240601005", "rlfghtjd", "R09", "royal", "010-1234-1234", 1, "2024-06-01", "2024-06-03", "2024-06-01", "체크아웃", true, false);
insert into reservation values("R20240101001", "rlfghtjd", "R10", "royal", "010-1234-1234", 2, "2024-01-01", "2024-01-03", "2024-01-01", "체크아웃", true, false);
insert into reservation values("R20240101002", "rlfghtjd", "R11", "royal", "010-1234-1234", 2, "2024-01-01", "2024-01-04", "2024-01-01", "체크아웃", true, false);
insert into reservation values("R20240106001", "rlfghtjd", "R12", "royal", "010-1234-1234", 1, "2024-01-06", "2024-01-07", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240112001", "rlfghtjd", "R13", "royal", "010-1234-1234", 1, "2024-01-12", "2024-01-13", "2024-01-12", "체크아웃", true, false);
insert into reservation values("R20240121001", "rlfghtjd", "R14", "royal", "010-1234-1234", 2, "2024-01-21", "2024-01-23", "2024-01-21", "체크아웃", true, false);
insert into reservation values("R20240129001", "rlfghtjd", "R15", "royal", "010-1234-1234", 2, "2024-01-29", "2024-01-30", "2024-01-29", "체크아웃", true, false);

insert into reservation values("R20240106002", "user1", "F01", "family", "010-1234-1234", 4, "2024-01-06", "2024-01-09", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240106003", "user2", "F02", "family", "010-1234-1234", 3, "2024-01-06", "2024-01-08", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240106004", "user3", "F03", "family", "010-1234-1234", 1, "2024-01-06", "2024-01-07", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240106005", "user4", "F04", "family", "010-1234-1234", 4, "2024-01-06", "2024-01-10", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240202001", "user5", "F05", "family", "010-1234-1234", 2, "2024-02-01", "2024-02-03", "2024-02-01", "체크아웃", true, false);
insert into reservation values("R20240202002", "user6", "F06", "family", "010-1234-1234", 2, "2024-02-02", "2024-02-04", "2024-02-02", "체크아웃", true, false);
insert into reservation values("R20240202003", "user7", "F07", "family", "010-1234-1234", 5, "2024-02-02", "2024-02-04", "2024-02-02", "체크아웃", true, false);
insert into reservation values("R20240202004", "user8", "F08", "family", "010-1234-1234", 3, "2024-02-02", "2024-02-04", "2024-02-02", "체크아웃", true, false);
insert into reservation values("R20240202005", "user9", "F09", "family", "010-1234-1234", 2, "2024-02-02", "2024-02-04", "2024-02-02", "체크아웃", true, false);
insert into reservation values("R20240207001", "user10", "F10", "family", "010-1234-1234", 2, "2024-02-07", "2024-02-08", "2024-02-07", "체크아웃", true, false);
insert into reservation values("R20240209001", "user11", "F11", "family", "010-1234-1234", 2, "2024-02-09", "2024-02-10", "2024-02-09", "체크아웃", true, false);
insert into reservation values("R20240209002", "user12", "F12", "family", "010-1234-1234", 2, "2024-02-09", "2024-02-11", "2024-02-09", "체크아웃", true, false);
insert into reservation values("R20240210001", "user13", "F13", "family", "010-1234-1234", 1, "2024-02-10", "2024-02-11", "2024-02-10", "체크아웃", true, false);
insert into reservation values("R20240211001", "user14", "F14", "family", "010-1234-1234", 1, "2024-02-11", "2024-02-12", "2024-02-11", "체크아웃", true, false);
insert into reservation values("R20240215001", "user15", "F15", "family", "010-1234-1234", 1, "2024-02-15", "2024-02-16", "2024-02-15", "체크아웃", true, false);
insert into reservation values("R20240223001", "user16", "F16", "family", "010-1234-1234", 1, "2024-02-23", "2024-02-25", "2024-02-23", "체크아웃", true, false);
insert into reservation values("R20240223002", "user17", "F17", "family", "010-1234-1234", 2, "2024-02-23", "2024-06-24", "2024-02-23", "체크아웃", true, false);
insert into reservation values("R20240223003", "user18", "F18", "family", "010-1234-1234", 1, "2024-02-23", "2024-06-24", "2024-02-23", "체크아웃", true, false);
insert into reservation values("R20240223004", "user19", "F19", "family", "010-1234-1234", 2, "2024-02-23", "2024-06-24", "2024-02-23", "체크아웃", true, false);
insert into reservation values("R20240227001", "user20", "F20", "family", "010-1234-1234", 1, "2024-02-27", "2024-02-28", "2024-02-27", "체크아웃", true, false);
insert into reservation values("R20240302001", "user21", "F21", "family", "010-1234-1234", 1, "2024-03-02", "2024-03-03", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240302002", "user22", "F22", "family", "010-1234-1234", 1, "2024-03-02", "2024-03-03", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240302003", "user23", "F23", "family", "010-1234-1234", 4, "2024-03-02", "2024-03-04", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240313001", "user24", "F24", "family", "010-1234-1234", 1, "2024-03-13", "2024-03-14", "2024-03-13", "체크아웃", true, false);
insert into reservation values("R20240316001", "user25", "F25", "family", "010-1234-1234", 1, "2024-03-16", "2024-03-17", "2024-03-16", "체크아웃", true, false);
insert into reservation values("R20240323001", "user26", "F26", "family", "010-1234-1234", 3, "2024-03-23", "2024-06-24", "2024-03-23", "체크아웃", true, false);
insert into reservation values("R20240323002", "user27", "F27", "family", "010-1234-1234", 1, "2024-03-23", "2024-06-24", "2024-03-23", "체크아웃", true, false);
insert into reservation values("R20240330001", "user28", "F28", "family", "010-1234-1234", 2, "2024-03-30", "2024-03-31", "2024-03-30", "체크아웃", true, false);
insert into reservation values("R20240330002", "user29", "F29", "family", "010-1234-1234", 3, "2024-03-30", "2024-03-31", "2024-03-30", "체크아웃", true, false);
insert into reservation values("R20240330003", "user30", "F30", "family", "010-1234-1234", 1, "2024-03-30", "2024-04-01", "2024-03-30", "체크아웃", true, false);

insert into reservation values("R20240403001", "user31", "ST01", "suite", "010-1234-1234", 1, "2024-04-03", "2024-04-04", "2024-04-03", "체크아웃", true, false);
insert into reservation values("R20240403002", "user32", "ST02", "suite", "010-1234-1234", 1, "2024-04-03", "2024-04-04", "2024-04-03", "체크아웃", true, false);
insert into reservation values("R20240403003", "user33", "ST03", "suite", "010-1234-1234", 1, "2024-04-03", "2024-04-05", "2024-04-03", "체크아웃", true, false);
insert into reservation values("R20240403004", "user34", "ST04", "suite", "010-1234-1234", 1, "2024-04-03", "2024-04-05", "2024-04-03", "체크아웃", true, false);
insert into reservation values("R20240403005", "user35", "ST05", "suite", "010-1234-1234", 1, "2024-04-03", "2024-04-05", "2024-04-03", "체크아웃", true, false);
insert into reservation values("R20240408001", "user36", "ST06", "suite", "010-1234-1234", 1, "2024-04-08", "2024-04-09", "2024-04-08", "체크아웃", true, false);
insert into reservation values("R20240408002", "user37", "ST07", "suite", "010-1234-1234", 1, "2024-04-08", "2024-04-09", "2024-04-08", "체크아웃", true, false);
insert into reservation values("R20240411001", "user38", "ST08", "suite", "010-1234-1234", 1, "2024-04-11", "2024-04-12", "2024-04-11", "체크아웃", true, false);
insert into reservation values("R20240411002", "user39", "ST09", "suite", "010-1234-1234", 1, "2024-04-11", "2024-04-12", "2024-04-11", "체크아웃", true, false);
insert into reservation values("R20240411003", "user40", "ST10", "suite", "010-1234-1234", 1, "2024-04-11", "2024-04-13", "2024-04-11", "체크아웃", true, false);
insert into reservation values("R20240420001", "user41", "ST11", "suite", "010-1234-1234", 1, "2024-04-20", "2024-06-17", "2024-04-20", "체크아웃", true, false);
insert into reservation values("R20240421001", "user42", "ST12", "suite", "010-1234-1234", 1, "2024-04-21", "2024-06-17", "2024-04-21", "체크아웃", true, false);
insert into reservation values("R20240424001", "user43", "ST13", "suite", "010-1234-1234", 1, "2024-04-24", "2024-04-25", "2024-04-24", "체크아웃", true, false);
insert into reservation values("R20240424002", "user44", "ST14", "suite", "010-1234-1234", 1, "2024-04-24", "2024-04-25", "2024-04-24", "체크아웃", true, false);
insert into reservation values("R20240424003", "user45", "ST15", "suite", "010-1234-1234", 1, "2024-04-24", "2024-04-25", "2024-04-24", "체크아웃", true, false);
insert into reservation values("R20240425001", "user46", "ST16", "suite", "010-1234-1234", 1, "2024-04-25", "2024-04-26", "2024-04-25", "체크아웃", true, false);
insert into reservation values("R20240425002", "user47", "ST17", "suite", "010-1234-1234", 1, "2024-04-25", "2024-04-26", "2024-04-25", "체크아웃", true, false);
insert into reservation values("R20240425003", "user48", "ST18", "suite", "010-1234-1234", 1, "2024-04-25", "2024-04-26", "2024-04-25", "체크아웃", true, false);
insert into reservation values("R20240425004", "user49", "ST19", "suite", "010-1234-1234", 1, "2024-04-25", "2024-04-26", "2024-04-25", "체크아웃", true, false);
insert into reservation values("R20240430001", "user50", "ST20", "suite", "010-1234-1234", 1, "2024-04-30", "2024-05-01", "2024-04-30", "체크아웃", true, false);
insert into reservation values("R20240430002", "user51", "ST21", "suite", "010-1234-1234", 1, "2024-04-30", "2024-05-01", "2024-04-30", "체크아웃", true, false);
insert into reservation values("R20240501001", "user52", "ST22", "suite", "010-1234-1234", 1, "2024-05-01", "2024-05-02", "2024-05-01", "체크아웃", true, false);
insert into reservation values("R20240501002", "user53", "ST23", "suite", "010-1234-1234", 1, "2024-05-01", "2024-05-02", "2024-05-01", "체크아웃", true, false);
insert into reservation values("R20240501003", "user54", "ST24", "suite", "010-1234-1234", 1, "2024-05-01", "2024-05-02", "2024-05-01", "체크아웃", true, false);
insert into reservation values("R20240502001", "user55", "ST25", "suite", "010-1234-1234", 1, "2024-05-02", "2024-05-03", "2024-05-02", "체크아웃", true, false);
insert into reservation values("R20240503001", "user56", "ST26", "suite", "010-1234-1234", 1, "2024-05-03", "2024-05-04", "2024-05-03", "체크아웃", true, false);
insert into reservation values("R20240504001", "user57", "ST27", "suite", "010-1234-1234", 1, "2024-05-04", "2024-05-05", "2024-05-04", "체크아웃", true, false);
insert into reservation values("R20240511001", "user58", "ST28", "suite", "010-1234-1234", 1, "2024-05-11", "2024-05-12", "2024-05-11", "체크아웃", true, false);
insert into reservation values("R20240511002", "user59", "ST29", "suite", "010-1234-1234", 1, "2024-05-11", "2024-06-13", "2024-05-11", "체크아웃", true, false);
insert into reservation values("R20240515001", "user60", "ST30", "suite", "010-1234-1234", 1, "2024-05-15", "2024-05-17", "2024-05-15", "체크아웃", true, false);
insert into reservation values("R20240518001", "user61", "ST31", "suite", "010-1234-1234", 1, "2024-05-18", "2024-05-19", "2024-05-18", "체크아웃", true, false);
insert into reservation values("R20240518002", "user62", "ST32", "suite", "010-1234-1234", 1, "2024-05-18", "2024-05-19", "2024-05-18", "체크아웃", true, false);
insert into reservation values("R20240518003", "user63", "ST33", "suite", "010-1234-1234", 1, "2024-05-18", "2024-05-20", "2024-05-18", "체크아웃", true, false);
insert into reservation values("R20240520001", "user64", "ST34", "suite", "010-1234-1234", 1, "2024-05-20", "2024-05-22", "2024-05-20", "체크아웃", true, false);
insert into reservation values("R20240601006", "user65", "ST35", "suite", "010-1234-1234", 1, "2024-06-01", "2024-06-20", "2024-06-01", "체크인", true, false);

insert into reservation values("R20240101003", "user66", "D01", "double", "010-1234-1234", 1, "2024-01-01", "2024-01-02", "2024-01-01", "체크아웃", true, false);
insert into reservation values("R20240101004", "user67", "D02", "double", "010-1234-1234", 1, "2024-01-01", "2024-01-03", "2024-01-01", "체크아웃", true, false);
insert into reservation values("R20240101005", "user68", "D03", "double", "010-1234-1234", 1, "2024-01-01", "2024-01-03", "2024-01-01", "체크아웃", true, false);
insert into reservation values("R20240102001", "user69", "D04", "double", "010-1234-1234", 1, "2024-01-02", "2024-01-04", "2024-01-02", "체크아웃", true, false);
insert into reservation values("R20240103001", "user70", "D05", "double", "010-1234-1234", 1, "2024-01-03", "2024-01-05", "2024-01-03", "체크아웃", true, false);
insert into reservation values("R20240104001", "user71", "D06", "double", "010-1234-1234", 1, "2024-01-04", "2024-01-06", "2024-01-04", "체크아웃", true, false);
insert into reservation values("R20240105001", "user72", "D07", "double", "010-1234-1234", 1, "2024-01-05", "2024-01-06", "2024-01-05", "체크아웃", true, false);
insert into reservation values("R20240106006", "user73", "D08", "double", "010-1234-1234", 1, "2024-01-06", "2024-01-07", "2024-01-06", "체크아웃", true, false);
insert into reservation values("R20240107001", "user74", "D09", "double", "010-1234-1234", 1, "2024-01-07", "2024-01-08", "2024-01-07", "체크아웃", true, false);
insert into reservation values("R20240113001", "user75", "D10", "double", "010-1234-1234", 1, "2024-01-13", "2024-01-14", "2024-01-13", "체크아웃", true, false);
insert into reservation values("R20240114001", "user76", "D11", "double", "010-1234-1234", 1, "2024-01-14", "2024-01-15", "2024-01-14", "체크아웃", true, false);
insert into reservation values("R20240115001", "user77", "D12", "double", "010-1234-1234", 1, "2024-01-15", "2024-01-16", "2024-01-15", "체크아웃", true, false);
insert into reservation values("R20240121002", "user78", "D13", "double", "010-1234-1234", 1, "2024-01-21", "2024-01-23", "2024-01-21", "체크아웃", true, false);
insert into reservation values("R20240123001", "user79", "D14", "double", "010-1234-1234", 1, "2024-01-23", "2024-01-24", "2024-01-23", "체크아웃", true, false);
insert into reservation values("R20240201002", "user80", "D15", "double", "010-1234-1234", 1, "2024-02-01", "2024-02-02", "2024-02-01", "체크아웃", true, false);
insert into reservation values("R20240201003", "user81", "D16", "double", "010-1234-1234", 1, "2024-02-01", "2024-02-02", "2024-02-01", "체크아웃", true, false);
insert into reservation values("R20240201004", "user82", "D17", "double", "010-1234-1234", 1, "2024-02-01", "2024-02-03", "2024-02-01", "체크아웃", true, false);
insert into reservation values("R20240201005", "user83", "D18", "double", "010-1234-1234", 1, "2024-02-01", "2024-02-04", "2024-02-01", "체크아웃", true, false);
insert into reservation values("R20240208001", "user84", "D19", "double", "010-1234-1234", 1, "2024-02-08", "2024-02-09", "2024-02-08", "체크아웃", true, false);
insert into reservation values("R20240209003", "user85", "D20", "double", "010-1234-1234", 1, "2024-02-09", "2024-02-10", "2024-02-09", "체크아웃", true, false);
insert into reservation values("R20240210002", "user86", "D21", "double", "010-1234-1234", 1, "2024-02-10", "2024-02-11", "2024-02-10", "체크아웃", true, false);
insert into reservation values("R20240213001", "user87", "D22", "double", "010-1234-1234", 1, "2024-02-13", "2024-02-15", "2024-02-13", "체크아웃", true, false);
insert into reservation values("R20240216001", "user88", "D23", "double", "010-1234-1234", 1, "2024-02-16", "2024-02-17", "2024-02-16", "체크아웃", true, false);
insert into reservation values("R20240222001", "user89", "D24", "double", "010-1234-1234", 1, "2024-02-22", "2024-02-23", "2024-02-22", "체크아웃", true, false);
insert into reservation values("R20240225001", "user90", "D25", "double", "010-1234-1234", 1, "2024-02-25", "2024-02-26", "2024-02-25", "체크아웃", true, false);
insert into reservation values("R20240303004", "user91", "D26", "double", "010-1234-1234", 1, "2024-03-02", "2024-03-03", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240303005", "user92", "D27", "double", "010-1234-1234", 1, "2024-03-02", "2024-03-03", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240303006", "user93", "D28", "double", "010-1234-1234", 1, "2024-03-02", "2024-03-04", "2024-03-02", "체크아웃", true, false);
insert into reservation values("R20240309001", "user94", "D29", "double", "010-1234-1234", 1, "2024-03-09", "2024-03-10", "2024-03-09", "체크아웃", true, false);
insert into reservation values("R20240309002", "user95", "D30", "double", "010-1234-1234", 1, "2024-03-09", "2024-03-11", "2024-03-09", "체크아웃", true, false);
insert into reservation values("R20240316002", "user96", "D31", "double", "010-1234-1234", 1, "2024-03-16", "2024-03-17", "2024-03-16", "체크아웃", true, false);
insert into reservation values("R20240316003", "user97", "D32", "double", "010-1234-1234", 1, "2024-03-16", "2024-03-17", "2024-03-16", "체크아웃", true, false);
insert into reservation values("R20240317001", "user98", "D33", "double", "010-1234-1234", 1, "2024-03-17", "2024-03-18", "2024-03-17", "체크아웃", true, false);
insert into reservation values("R20240320001", "user99", "D34", "double", "010-1234-1234", 1, "2024-03-20", "2024-03-21", "2024-03-20", "체크아웃", true, false);
insert into reservation values("R20240330004", "user100", "D35", "double", "010-1234-1234", 1, "2024-03-30", "2024-03-31", "2024-03-30", "체크아웃", true, false);
insert into reservation values("R20240411004", "user101", "D36", "double", "010-1234-1234", 1, "2024-04-11", "2024-04-12", "2024-04-11", "체크아웃", true, false);
insert into reservation values("R20240422001", "user102", "D37", "double", "010-1234-1234", 1, "2024-04-22", "2024-04-23", "2024-04-22", "체크아웃", true, false);
insert into reservation values("R20240424004", "user103", "D38", "double", "010-1234-1234", 1, "2024-04-24", "2024-04-25", "2024-04-24", "체크아웃", true, false);
insert into reservation values("R20240427001", "user104", "D39", "double", "010-1234-1234", 1, "2024-04-27", "2024-04-29", "2024-04-27", "체크아웃", true, false);
insert into reservation values("R20240505001", "user105", "D40", "double", "010-1234-1234", 1, "2024-05-05", "2024-05-07", "2024-05-05", "체크아웃", true, false);
insert into reservation values("R20240505002", "user106", "D41", "double", "010-1234-1234", 1, "2024-05-05", "2024-05-07", "2024-05-05", "체크아웃", true, false);
insert into reservation values("R20240512001", "user107", "D42", "double", "010-1234-1234", 1, "2024-05-12", "2024-05-14", "2024-05-12", "체크아웃", true, false);
insert into reservation values("R20240513001", "user108", "D43", "double", "010-1234-1234", 1, "2024-05-13", "2024-05-14", "2024-05-13", "체크아웃", true, false);
insert into reservation values("R20240608001", "user109", "D44", "double", "010-1234-1234", 1, "2024-06-08", "2024-06-09", "2024-06-08", "체크아웃", true, false);
insert into reservation values("R20240616001", "user110", "D45", "double", "010-1234-1234", 1, "2024-06-16", "2024-06-17", "2024-06-16", "체크아웃", true, false);

insert into reservation values("R20240506001", "user111", "S001", "single", "010-1234-1234", 1, "2024-05-06", "2024-05-07", "2024-05-06", "체크아웃", true, false);
insert into reservation values("R20240406001", "user112", "S002", "single", "010-1234-1234", 1, "2024-04-06", "2024-04-07", "2024-04-06", "체크아웃", true, false);
insert into reservation values("R20240406002", "user113", "S003", "single", "010-1234-1234", 1, "2024-04-06", "2024-04-07", "2024-04-06", "체크아웃", true, false);
insert into reservation values("R20240413001", "user114", "S004", "single", "010-1234-1234", 1, "2024-04-13", "2024-04-14", "2024-04-13", "체크아웃", true, false);
insert into reservation values("R20240518004", "user115", "S005", "single", "010-1234-1234", 1, "2024-05-18", "2024-05-19", "2024-05-18", "체크아웃", true, false);
insert into reservation values("R20240522001", "user116", "S006", "single", "010-1234-1234", 1, "2024-05-22", "2024-05-23", "2024-05-22", "체크아웃", true, false);
insert into reservation values("R20240616002", "user117", "S007", "single", "010-1234-1234", 1, "2024-06-16", "2024-06-17", "2024-06-16", "체크아웃", true, false);
insert into reservation values("R20240616003", "user118", "S008", "single", "010-1234-1234", 1, "2024-06-16", "2024-06-17", "2024-06-16", "체크아웃", true, false);
insert into reservation values("R20240617001", "user119", "S009", "single", "010-1234-1234", 1, "2024-06-17", "2024-06-18", "2024-06-17", "체크아웃", true, false);
insert into reservation values("R20240618001", "user120", "S010", "single", "010-1234-1234", 1, "2024-06-18", "2024-06-19", "2024-06-18", "체크아웃", true, false);

insert into reservation values("R20240620001", "user120", "R01", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620002", "user120", "R02", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620003", "user120", "R03", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620004", "user120", "R04", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620005", "user120", "R05", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620006", "user120", "R06", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620007", "user120", "R07", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620008", "user120", "R08", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620009", "user120", "R09", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620010", "user120", "R10", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620011", "user120", "R11", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620012", "user120", "R12", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);
insert into reservation values("R20240620013", "user120", "R13", "royal", "010-1234-1234", 1, "2024-06-20", "2024-06-22", "2024-06-20", "대기", false, false);


insert into review_board values(1, "rlfghtjd", "R20240609001", "좋아요.", default, default, null, default, default);
insert into review_board values(2, "rlfghtjd", "R20240505003", "좋아요.", default, default, null, default, default);
insert into review_board values(3, "rlfghtjd", "R20240106002", "좋아요.", default, default, null, default, default);
insert into review_board values(4, "rlfghtjd", "R20240106003", "좋아요.", default, default, null, default, default);
insert into review_board values(5, "rlfghtjd", "R20240403001", "좋아요.", default, default, null, default, default);
insert into review_board values(6, "rlfghtjd", "R20240403002", "좋아요.", default, default, null, default, default);
insert into review_board values(7, "rlfghtjd", "R20240101003", "좋아요.", default, default, null, default, default);
insert into review_board values(8, "rlfghtjd", "R20240101004", "좋아요.", default, default, null, default, default);
insert into review_board values(9, "rlfghtjd", "R20240506001", "좋아요.", default, default, null, default, default);
insert into review_board values(10, "rlfghtjd", "R20240406001", "좋아요.", default, default, null, default, default);
insert into review_board values(11, "rlfghtjd", "R20240406002", "좋아요.", default, default, null, default, default);

update reservation set res_review_status = true where res_no = 'R20240609001';
update reservation set res_review_status = true where res_no = 'R20240505003';
update reservation set res_review_status = true where res_no = 'R20240106002';
update reservation set res_review_status = true where res_no = 'R20240106003';
update reservation set res_review_status = true where res_no = 'R20240403001';
update reservation set res_review_status = true where res_no = 'R20240403002';
update reservation set res_review_status = true where res_no = 'R20240101003';
update reservation set res_review_status = true where res_no = 'R20240101004';
update reservation set res_review_status = true where res_no = 'R20240506001';
update reservation set res_review_status = true where res_no = 'R20240406001';
update reservation set res_review_status = true where res_no = 'R20240406002';

-- qna_board
insert into qna_board values (1, "rud9807", "admin04", "칭찬하기", "베리굿", "굿이에요굿", "땡큐", default, null, null, default);
insert into qna_board values (2, "yyjjww3", "admin03", "문의하기", "문희", "문희열리네요", "고구마호박", default, null, null, default);
insert into qna_board values (3, "rlfghtjd", "admin02", "서비스", "어디있죠", "찾았다내사랑", "내가찾던사랑~", default, null, null, default);
insert into qna_board values (4, "sksmsdltjsdn", "admin01", "서비스", "어제 내 세상이 무너졌어", "와장창", "노시바킵고잉", default, null, null, default);
insert into qna_board values (5, "user1", "admin04", "문의하기", "문의1", "문의하기1", "답변1", default, null, null, default);
insert into qna_board values (6, "user2", "admin04", "문의하기", "문의2", "문의하기2", "답변2", default, null, null, default);
insert into qna_board values (7, "user3", "admin04", "문의하기", "문의3", "문의하기3", "답변3", default, null, null, default);
insert into qna_board values (8, "user4", "admin04", "문의하기", "문의4", "문의하기4", "답변4", default, null, null, default);
insert into qna_board values (9, "user5", "admin04", "문의하기", "문의5", "문의하기5", "답변5", default, null, null, default);
insert into qna_board values (10, "user6", "admin04", "문의하기", "문의6", "문의하기6", "답변6", default, null, null, default);
insert into qna_board values (11, "user7", "admin04", "문의하기", "문의7", "문의하기7", "답변7", default, null, null, default);
insert into qna_board values (12, "user8", "admin04", "문의하기", "문의8", "문의하기8", "답변8", default, null, null, default);
insert into qna_board values (13, "user9", "admin04", "문의하기", "문의9", "문의하기9", "답변9", default, null, null, default);
insert into qna_board values (14, "user10", "admin04", "문의하기", "문의10", "문의하기10", "답변10", default, null, null, default);
insert into qna_board values (15, "user11", "admin03", "서비스", "문의11", "문의하기11", "답변11", default, null, null, default);
insert into qna_board values (16, "user12", "admin03", "서비스", "문의12", "문의하기12", "답변12", default, null, null, default);
insert into qna_board values (17, "user13", "admin03", "문의하기", "문의13", "문의하기13", "답변13", default, null, null, default);
insert into qna_board values (18, "user14", "admin03", "문의하기", "문의14", "문의하기14", "답변14", default, null, null, default);
insert into qna_board values (19, "user15", "admin03", "문의하기", "문의15", "문의하기15", "답변15", default, null, null, default);
insert into qna_board values (20, "user16", "admin03", "문의하기", "문의16", "문의하기16", "답변16", default, null, null, default);
insert into qna_board values (21, "user17", "admin03", "문의하기", "문의17", "문의하기17", "답변17", default, null, null, default);

-- insert facility_info
insert into facility_info values(1, "레스토랑", "La Flamande", "07:30", "21:00");
insert into facility_info values(2, "주류점", "Velvet Veil Bar", "15:30", "01:30");
insert into facility_info values(3, "카페", "Château Blanc Lounge", "08:00", "19:00");
insert into facility_info values(4, "휘트니스", "Opulence Fitness", "05:00", "23:30");

-- insert activity_info
insert into activity_info values(1, "스파", "스파시설", "10:00", "18:00");
insert into activity_info values(2, "수영장", "실내 수영장", "07:00", "21:00");
insert into activity_info values(3, "수영장", "실외 수영장", "07:00", "21:00");
insert into activity_info values(4, "어트렉션", "바이킹 타워", "10:00", "21:00");
insert into activity_info values(5, "어트렉션", "키디풀", "10:00", "21:00");
insert into activity_info values(6, "어트렉션", "바디 볼 슬라이드", "10:00", "21:00");
insert into activity_info values(7, "어트렉션", "와읻르 익스트림 리버", "10:00", "21:00");
insert into activity_info values(8, "어트렉션", "스피드 레이싱", "10:00", "21:00");

-- insert payment_info
INSERT INTO payment_info VALUES
(1, 'R20240101001', 'rlfghtjd', '2024-01-01', 3218600),
(2, 'R20240101002', 'rlfghtjd', '2024-01-01', 4827900),
(3, 'R20240101003', 'user66', '2024-01-01', 350300),
(4, 'R20240101004', 'user67', '2024-01-01', 700590),
(5, 'R20240101005', 'user68', '2024-01-01', 700590),
(6, 'R20240102001', 'user69', '2024-01-02', 700590),
(7, 'R20240103001', 'user70', '2024-01-03', 700590),
(8, 'R20240104001', 'user71', '2024-01-04', 700590),
(9, 'R20240105001', 'user72', '2024-01-05', 350300),
(10, 'R20240106001', 'rlfghtjd', '2024-01-06', 1609300),
(11, 'R20240106002', 'user1', '2024-01-06', 1214240),
(12, 'R20240106003', 'user2', '2024-01-06', 809490),
(13, 'R20240106004', 'user3', '2024-01-06', 404750),
(14, 'R20240106005', 'user4', '2024-01-06', 1618980),
(15, 'R20240106006', 'user73', '2024-01-06', 350300),
(16, 'R20240107001', 'user74', '2024-01-07', 350300),
(17, 'R20240112001', 'rlfghtjd', '2024-01-12', 1609300),
(18, 'R20240113001', 'user75', '2024-01-13', 350300),
(19, 'R20240114001', 'user76', '2024-01-14', 350300),
(20, 'R20240115001', 'user77', '2024-01-15', 350300),
(21, 'R20240121001', 'rlfghtjd', '2024-01-21', 3218600),
(22, 'R20240121002', 'user78', '2024-01-21', 700590),
(23, 'R20240123001', 'user79', '2024-01-23', 350300),
(24, 'R20240129001', 'rlfghtjd', '2024-01-29', 1609300),
(25, 'R20240201002', 'user80', '2024-02-01', 350300),
(26, 'R20240201003', 'user81', '2024-02-01', 350300),
(27, 'R20240201004', 'user82', '2024-02-01', 700590),
(28, 'R20240201005', 'user83', '2024-02-01', 1050890),
(29, 'R20240202001', 'user5', '2024-02-01', 809490),
(30, 'R20240202002', 'user6', '2024-02-02', 809490),
(31, 'R20240202003', 'user7', '2024-02-02', 809490),
(32, 'R20240202004', 'user8', '2024-02-02', 809490),
(33, 'R20240202005', 'user9', '2024-02-02', 809490),
(34, 'R20240207001', 'user10', '2024-02-07', 404750),
(35, 'R20240208001', 'user84', '2024-02-08', 350300),
(36, 'R20240209001', 'user11', '2024-02-09', 404750),
(37, 'R20240209002', 'user12', '2024-02-09', 809490),
(38, 'R20240209003', 'user85', '2024-02-09', 350300),
(39, 'R20240210001', 'user13', '2024-02-10', 404750),
(40, 'R20240210002', 'user86', '2024-02-10', 350300),
(41, 'R20240211001', 'user14', '2024-02-11', 404750),
(42, 'R20240213001', 'user87', '2024-02-13', 700590),
(43, 'R20240215001', 'user15', '2024-02-15', 404750),
(44, 'R20240216001', 'user88', '2024-02-16', 350300),
(45, 'R20240222001', 'user89', '2024-02-22', 350300),
(46, 'R20240223001', 'user16', '2024-02-23', 809490),
(47, 'R20240223002', 'user17', '2024-02-23', 49378890),
(48, 'R20240223003', 'user18', '2024-02-23', 49378890),
(49, 'R20240223004', 'user19', '2024-02-23', 49378890),
(50, 'R20240225001', 'user90', '2024-02-25', 350300),
(51, 'R20240227001', 'user20', '2024-02-27', 404750),
(52, 'R20240302001', 'user21', '2024-03-02', 404750),
(53, 'R20240302002', 'user22', '2024-03-02', 404750),
(54, 'R20240302003', 'user23', '2024-03-02', 809490),
(55, 'R20240303004', 'user91', '2024-03-02', 350300),
(56, 'R20240303005', 'user92', '2024-03-02', 350300),
(57, 'R20240303006', 'user93', '2024-03-02', 700590),
(58, 'R20240309001', 'user94', '2024-03-09', 350300),
(59, 'R20240309002', 'user95', '2024-03-09', 700590),
(60, 'R20240313001', 'user24', '2024-03-13', 404750),
(61, 'R20240316001', 'user25', '2024-03-16', 404750),
(62, 'R20240316002', 'user96', '2024-03-16', 350300),
(63, 'R20240316003', 'user97', '2024-03-16', 350300),
(64, 'R20240317001', 'user98', '2024-03-17', 350300),
(65, 'R20240320001', 'user99', '2024-03-20', 350300),
(66, 'R20240323001', 'user26', '2024-03-23', 37641290),
(67, 'R20240323002', 'user27', '2024-03-23', 37641290),
(68, 'R20240330001', 'user28', '2024-03-30', 404750),
(69, 'R20240330002', 'user29', '2024-03-30', 404750),
(70, 'R20240330003', 'user30', '2024-03-30', 809490),
(71, 'R20240330004', 'user100', '2024-03-30', 350300),
(72, 'R20240403001', 'user31', '2024-04-03', 1101100),
(73, 'R20240403002', 'user32', '2024-04-03', 1101100),
(74, 'R20240403003', 'user33', '2024-04-03', 2202200),
(75, 'R20240403004', 'user34', '2024-04-03', 2202200),
(76, 'R20240403005', 'user35', '2024-04-03', 2202200),
(77, 'R20240406001', 'user112', '2024-04-06', 217800),
(78, 'R20240406002', 'user113', '2024-04-06', 217800),
(79, 'R20240408001', 'user36', '2024-04-08', 1101100),
(80, 'R20240408002', 'user37', '2024-04-08', 1101100),
(81, 'R20240411001', 'user38', '2024-04-11', 1101100),
(82, 'R20240411002', 'user39', '2024-04-11', 1101100),
(83, 'R20240411003', 'user40', '2024-04-11', 2202200),
(84, 'R20240411004', 'user101', '2024-04-11', 350300),
(85, 'R20240413001', 'user114', '2024-04-13', 217800),
(86, 'R20240420001', 'user41', '2024-04-20', 63863800),
(87, 'R20240421001', 'user42', '2024-04-21', 62762700),
(88, 'R20240422001', 'user102', '2024-04-22', 350300),
(89, 'R20240424001', 'user43', '2024-04-24', 1101100),
(90, 'R20240424002', 'user44', '2024-04-24', 1101100),
(91, 'R20240424003', 'user45', '2024-04-24', 1101100),
(92, 'R20240424004', 'user103', '2024-04-24', 350300),
(93, 'R20240425001', 'user46', '2024-04-25', 1101100),
(94, 'R20240425002', 'user47', '2024-04-25', 1101100),
(95, 'R20240425003', 'user48', '2024-04-25', 1101100),
(96, 'R20240425004', 'user49', '2024-04-25', 1101100),
(97, 'R20240427001', 'user104', '2024-04-27', 700590),
(98, 'R20240430001', 'user50', '2024-04-30', 1101100),
(99, 'R20240430002', 'user51', '2024-04-30', 1101100),
(100, 'R20240501001', 'user52', '2024-05-01', 1101100),
(101, 'R20240501002', 'user53', '2024-05-01', 1101100),
(102, 'R20240501003', 'user54', '2024-05-01', 1101100),
(103, 'R20240502001', 'user55', '2024-05-02', 1101100),
(104, 'R20240503001', 'user56', '2024-05-03', 1101100),
(105, 'R20240504001', 'user57', '2024-05-04', 1101100),
(106, 'R20240505001', 'user105', '2024-05-05', 700590),
(107, 'R20240505002', 'user106', '2024-05-05', 700590),
(108, 'R20240505003', 'rlfghtjd', '2024-05-05', 3218600),
(109, 'R20240505004', 'rlfghtjd', '2024-05-05', 1609300),
(110, 'R20240505005', 'rlfghtjd', '2024-05-05', 3218600),
(111, 'R20240506001', 'user111', '2024-05-06', 217800),
(112, 'R20240511001', 'user58', '2024-05-11', 1101100),
(113, 'R20240511002', 'user59', '2024-05-11', 36336300),
(114, 'R20240512001', 'user107', '2024-05-12', 700590),
(115, 'R20240513001', 'user108', '2024-05-13', 350300),
(116, 'R20240515001', 'user60', '2024-05-15', 2202200),
(117, 'R20240518001', 'user61', '2024-05-18', 1101100),
(118, 'R20240518002', 'user62', '2024-05-18', 1101100),
(119, 'R20240518003', 'user63', '2024-05-18', 2202200),
(120, 'R20240518004', 'user115', '2024-05-18', 217800),
(121, 'R20240520001', 'user64', '2024-05-20', 2202200),
(122, 'R20240522001', 'user116', '2024-05-22', 217800),
(123, 'R20240601001', 'rlfghtjd', '2024-06-01', 3218600),
(124, 'R20240601002', 'rlfghtjd', '2024-06-01', 3218600),
(125, 'R20240601003', 'rlfghtjd', '2024-06-01', 3218600),
(126, 'R20240601004', 'rlfghtjd', '2024-06-01', 3218600),
(127, 'R20240601005', 'rlfghtjd', '2024-06-01', 3218600),
(128, 'R20240601006', 'user65', '2024-06-01', 20920900),
(129, 'R20240608001', 'user109', '2024-06-08', 350300),
(130, 'R20240609001', 'rlfghtjd', '2024-06-09', 14483700),
(131, 'R20240616001', 'user110', '2024-06-16', 350300),
(132, 'R20240616002', 'user117', '2024-06-16', 217800),
(133, 'R20240616003', 'user118', '2024-06-16', 217800),
(134, 'R20240617001', 'user119', '2024-06-17', 217800),
(135, 'R20240618001', 'user120', '2024-06-18', 217800);

commit;

select * from room_info;

select * from rooms;

SELECT ri.room_type,
       ri.room_area,
       ri.room_maximum,
       ri.room_price,
       ri.room_total,
       COUNT(r.room_no) AS available_rooms
FROM room_info ri
LEFT JOIN rooms r ON ri.room_type = r.room_type AND r.room_status = false
GROUP BY ri.room_type, ri.room_total, ri.room_area, ri.room_maximum, ri.room_price order by ri.room_price desc;

select * from rooms r right join room_info ri on r.room_type = ri.room_type;

select * from reservation order by res_no desc;

insert into res_log (room_no, room_type, room_start, room_end) select res_room_no, res_room_type, res_in_date, res_out_date from reservation;

select * from res_log;

select * from facility_info;

select * from review_board;

select * from user;

select * from payment_info;
