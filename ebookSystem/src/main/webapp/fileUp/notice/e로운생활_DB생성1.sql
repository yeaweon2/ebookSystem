----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BOOK
(
	book_id              CHAR(8) NOT NULL ,
	ctgy_id              CHAR(4) NOT NULL ,
	book_nm              VARCHAR2(50) NOT NULL ,
	book_fl_cd           CHAR(4) NOT NULL ,
	book_publ_co         VARCHAR2(30) NULL ,
	book_writer          VARCHAR2(30) NULL ,
	book_publ_dt         DATE NULL ,
	book_amt             NUMBER NOT NULL ,
	book_discnt          NUMBER NULL ,
	book_useyn           CHAR(1) DEFAULT  'Y'  NOT NULL  CONSTRAINT  useyn_flag_chk CHECK (book_useyn IN ('N', 'Y')),
	book_intro           VARCHAR2(1000) NULL ,
	book_content         VARCHAR2(2000) NULL ,
	book_hit             NUMBER DEFAULT  0  NOT NULL ,
	book_likeit          NUMBER DEFAULT  0  NOT NULL ,
	book_cnfm_yn         CHAR(1) DEFAULT  'N'  NOT NULL  CONSTRAINT  cnfmyn_flag_chk CHECK (book_cnfm_yn IN ('N', 'Y')),
	book_isbn            CHAR(13) NULL ,
	book_writer_intro    VARCHAR2(2000) NULL ,
	book_desc            VARCHAR2(4000) NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	book_cover           VARCHAR2(200) NULL ,
	book_cover_path      VARCHAR2(200) NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK도서 ON BOOK (book_id   ASC);
ALTER TABLE BOOK	ADD CONSTRAINT  XPK도서 PRIMARY KEY (book_id);

----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BOOK_ATTACH
(
	batch_id             NUMBER NOT NULL ,
	book_id              CHAR(8) NOT NULL ,
	batch_ord            NUMBER NOT NULL ,
	batch_nm             VARCHAR2(200) NOT NULL ,
	batch_path           VARCHAR2(200) NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK도서첨부파일 ON BOOK_ATTACH (batch_id   ASC, book_id   ASC);
ALTER TABLE BOOK_ATTACH	ADD CONSTRAINT  XPK도서첨부파일 PRIMARY KEY (batch_id,book_id);
----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE BOOK_CONFIRM
(
	bcnfm_id             NUMBER NOT NULL ,
	book_id              CHAR(8) NOT NULL ,	
	bcnfm_req_dt         DATE NOT NULL ,
	bcnfm_st_cd          CHAR(4) NOT NULL ,
	bcnfm_cnfmr          VARCHAR2(20) NULL ,
	bcnfm_cnfm_dt        DATE NULL ,
	bcnfm_reject         VARCHAR2(300) NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK도서승인 ON BOOK_CONFIRM (bcnfm_id   ASC);
ALTER TABLE BOOK_CONFIRM 	ADD CONSTRAINT  XPK도서승인 PRIMARY KEY (bcnfm_id);

----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BOOK_REPLY
(
	breply_id               NUMBER NOT NULL ,
	book_id                 CHAR(8) NOT NULL ,
	breply_class            NUMBER NOT NULL ,
	breply_ord              NUMBER NOT NULL ,
	breply_gr               NUMBER NOT NULL ,
	breply_contents      VARCHAR2(200) NOT NULL ,
	breply_close_yn       VARCHAR2(20) NOT NULL ,
	breply_writer           CHAR(18) NULL ,
	udt_dt                  DATE NOT NULL ,
	ins_dt                   DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK도서댓글 ON BOOK_REPLY (breply_id   ASC);
ALTER TABLE BOOK_REPLY	ADD CONSTRAINT  XPK도서댓글 PRIMARY KEY (breply_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE BUCKET_BOOK
(
	bucket_id            NUMBER NOT NULL ,
	book_id              CHAR(8) NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	bucket_st_cd         CHAR(4) NOT NULL ,
	bucket_ord           NUMBER NOT NULL , 
	bucket_done_dt       DATE NULL ,	
	bucket_del_yn        CHAR(1) DEFAULT  'N'  NOT NULL  CONSTRAINT  bucket_delyn_chk CHECK (bucket_del_yn IN ('N', 'Y')),	
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK버킷도서 ON BUCKET_BOOK (bucket_id   ASC);
ALTER TABLE BUCKET_BOOK	ADD CONSTRAINT  XPK버킷도서 PRIMARY KEY (bucket_id);
----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE CATEGORY
(
	ctgy_id              CHAR(4) NOT NULL ,
	ctgy_nm              VARCHAR2(20) NOT NULL ,
	ctgy_gr_id           CHAR(4) NULL ,
	ctgy_use_yn          CHAR(1) DEFAULT  'Y'  NOT NULL  CONSTRAINT  ctgy_useyn_chk CHECK (ctgy_use_yn IN ('N', 'Y')),
	ctgy_writer          VARCHAR2(20) NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK도서카테고리 ON CATEGORY (ctgy_id   ASC);
ALTER TABLE CATEGORY	ADD CONSTRAINT  XPK도서카테고리 PRIMARY KEY (ctgy_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE COMMUNITY
(
	cmmnty_id            NUMBER NOT NULL ,
	cmmnty_writer        VARCHAR2(20) NOT NULL ,
	cmmnty_fl_cd         CHAR(4) NULL ,
	cmmnty_title         VARCHAR2(100) NULL ,
	cmmnty_contents      VARCHAR2(2000) NULL ,
	cmmnty_delyn         CHAR(1) DEFAULT  'N'  NULL  CONSTRAINT  cmmnty_delyn_chk CHECK (cmmnty_delyn IN ('N', 'Y')),
	cmmnty_hit           NUMBER DEFAULT  0  NOT NULL ,
	cmmnty_reply_cnt     NUMBER DEFAULT  0  NOT NULL ,
	cmmnty_atch_nm       VARCHAR2(200) NULL ,
	cmmnty_atch_path     VARCHAR2(200) NULL ,
	ins_dt               DATE NULL ,
	udt_dt               DATE NULL 
);

CREATE UNIQUE INDEX XPK커뮤니티 ON COMMUNITY (cmmnty_id   ASC);
ALTER TABLE COMMUNITY	ADD CONSTRAINT  XPK커뮤니티 PRIMARY KEY (cmmnty_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE COMMUNITY_REPLY
(
	creply_id            NUMBER NOT NULL ,
	cmmnty_id            NUMBER NOT NULL ,
	creply_writer        VARCHAR2(20) NOT NULL ,
	creply_class         NUMBER NOT NULL ,
	creply_ord           NUMBER NOT NULL ,
	creply_gr            NUMBER NOT NULL ,
	creply_contents      VARCHAR2(200) NOT NULL ,
	creply_close_yn      CHAR(1) NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK커뮤니티댓글 ON COMMUNITY_REPLY (creply_id   ASC);
ALTER TABLE COMMUNITY_REPLY	ADD CONSTRAINT  XPK커뮤니티댓글 PRIMARY KEY (creply_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE LCODES
(
	lcode                CHAR(2) NOT NULL ,
	lcode_nm             VARCHAR2(50) NOT NULL ,
	use_yn               CHAR(1) DEFAULT  'Y'  NOT NULL  CONSTRAINT  lcode_use_yn CHECK (use_yn IN ('N', 'Y')) ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK공통코드대분류 ON LCODES (lcode   ASC);
ALTER TABLE LCODES ADD CONSTRAINT  XPK공통코드대분류 PRIMARY KEY (lcode);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE LEND
(
	lend_id              CHAR(13) NOT NULL ,
	lend_date            DATE NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	lend_st_cd           CHAR(4) NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK도서대여 ON LEND (lend_id   ASC);
ALTER TABLE LEND 	ADD CONSTRAINT  XPK도서대여 PRIMARY KEY (lend_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE LEND_BOOKS
(
	lb_id                NUMBER NOT NULL ,
	lend_id              CHAR(13) NOT NULL ,
	book_id              CHAR(8) NOT NULL ,
	lb_hit               NUMBER DEFAULT  0  NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK도서대여목록 ON LEND_BOOKS (lb_id   ASC);
ALTER TABLE LEND_BOOKS 	ADD CONSTRAINT  XPK도서대여목록 PRIMARY KEY (lb_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE LOGIN_HISTORY
(
	login_id             NUMBER NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	login_dt             DATE NOT NULL ,
	logout_dt            DATE NOT NULL 
);

CREATE UNIQUE INDEX XPK접속이력 ON LOGIN_HISTORY(login_id   ASC);
ALTER TABLE LOGIN_HISTORY	ADD CONSTRAINT  XPK접속이력 PRIMARY KEY (login_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MANAGER_CONFIRM
(
	mcnfm_id             NUMBER NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	mcnfm_req_dt         DATE NOT NULL ,
	mcnfm_st_cd          CHAR(4) NOT NULL ,
	mcnfm_cnfmr          VARCHAR2(20) NULL ,
	mcnfm_cnfm_dt        DATE NULL ,
	mcnfm_bizno          CHAR(10) NULL ,
	mcnfm_co_nm          VARCHAR2(50) NULL ,
	mcnfm_co_tel         VARCHAR2(20) NULL ,
	mcnfm_rpspr          VARCHAR2(30) NULL ,
	mcnfm_cntr_fl_cd     CHAR(4) NULL ,
	mcnfm_cntr_sdt       DATE NULL ,
	mcnfm_cntr_edt       DATE NULL ,
	mcnfm_reject         VARCHAR2(300) NULL ,
	mcnfm_atch_nm        VARCHAR2(200) NULL ,
	mcnfm_atch_path      VARCHAR2(200) NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK매니저승인 ON MANAGER_CONFIRM(mcnfm_id   ASC);
ALTER TABLE MANAGER_CONFIRM	ADD CONSTRAINT  XPK매니저승인 PRIMARY KEY (mcnfm_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MEMBER
(
	member_id            VARCHAR2(20) NOT NULL ,
	member_pw            VARCHAR2(20) NOT NULL ,
	member_nm            VARCHAR2(20) NOT NULL ,
	member_nicknm        VARCHAR2(30) NOT NULL ,
	member_st_cd         CHAR(4) NOT NULL ,
	member_fl_cd         CHAR(4) NOT NULL ,
	member_email         VARCHAR2(50) NULL ,
	member_birth         CHAR(8) NULL ,
	member_gen           CHAR(1) NULL ,
	member_mile          NUMBER NOT NULL ,
	member_tel           CHAR(11) NULL ,
	member_phone_vld     CHAR(1) DEFAULT  'N'  NULL  CONSTRAINT  mb_phn_vld_chk CHECK (member_phone_vld IN ('N', 'Y')),
	manager_cnfm_yn      CHAR(1) DEFAULT  'N'  NULL  CONSTRAINT  mg_cnfmyn_chk CHECK (manager_cnfm_yn IN ('N', 'Y')),
	member_like_fld      VARCHAR2(100) NULL ,
	member_profile_nm    VARCHAR2(200) NULL ,
	member_profile_path  VARCHAR2(200) NULL ,	
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK회원 ON MEMBER (member_id   ASC);
ALTER TABLE MEMBER	ADD CONSTRAINT  XPK회원 PRIMARY KEY (member_id);

----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PAY_HISTORY
(
	pay_id              NUMBER NOT NULL ,
	pay_dt         		DATE NULL ,
	mcnfm_id            NUMBER NOT NULL ,
	imp_uid             VARCHAR2(20) NULL ,
	pay_st_cd           VARCHAR2(10) NULL ,
	pay_mthd       		CHAR(4) NULL ,
	pay_amt        		NUMBER NULL ,
	mcnfm_cntr_sdt      DATE NULL ,
	mcnfm_cntr_edt      DATE NULL ,
	ins_dt              CHAR(18) NULL ,
	udt_dt              CHAR(18) NULL 
);

CREATE UNIQUE INDEX XPK결제이력 ON PAY_HISTORY (pay_id   ASC);
ALTER TABLE PAY_HISTORY	ADD CONSTRAINT  XPK결제이력 PRIMARY KEY (pay_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE REVIEW
(
	review_id            NUMBER NOT NULL ,
	book_id              CHAR(8) NOT NULL ,
	review_title         VARCHAR2(100) NOT NULL ,
	review_contents      VARCHAR2(2000) NOT NULL ,
	review_writer        VARCHAR2(20) NOT NULL ,
	review_hit           NUMBER DEFAULT  0  NOT NULL ,
	review_likeit        CHAR(18) NULL ,
	review_reply_cnt     NUMBER DEFAULT  0  NOT NULL ,
	review_atch_nm       VARCHAR2(200) NULL ,
	review_atch_path     VARCHAR2(200) NULL ,
	review_del_yn        CHAR(1) DEFAULT  'N'  NOT NULL  CONSTRAINT  review_delyn_chk CHECK (review_del_yn IN ('N', 'Y')),	
	ins_dt               DATE NOT NULL ,	
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK책리뷰 ON REVIEW(review_id   ASC);
ALTER TABLE REVIEW	ADD CONSTRAINT  XPK책리뷰 PRIMARY KEY (review_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE REVIEW_REPLY
(
	rreply_id            NUMBER NOT NULL ,
	review_id            NUMBER NOT NULL ,	
	rreply_class         NUMBER NOT NULL ,
	rreply_ord           NUMBER NOT NULL ,
	rreply_gr            NUMBER NOT NULL ,
	rreply_contents      VARCHAR2(200) NOT NULL ,
	rreply_close_yn      CHAR(1) NOT NULL ,
	rreply_writer        VARCHAR2(20) NOT NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK책리뷰댓글 ON REVIEW_REPLY(rreply_id   ASC);
ALTER TABLE REVIEW_REPLY	ADD CONSTRAINT  XPK책리뷰댓글 PRIMARY KEY (rreply_id);
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SCHEDULE
(
	sche_id              NUMBER NOT NULL ,
	book_id              CHAR(8) NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	sche_sdt             DATE NOT NULL ,
	sche_edt             DATE NOT NULL ,
	sche_memo            VARCHAR2(200) NULL ,
	sche_done_yn         CHAR(1) DEFAULT  'N'  NOT NULL  CONSTRAINT  sche_done_chk CHECK (sche_done_yn IN ('N', 'Y')),
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK독서스케줄링 ON SCHEDULE (sche_id   ASC);
ALTER TABLE SCHEDULE	ADD CONSTRAINT  XPK독서스케줄링 PRIMARY KEY (sche_id);
----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SCODES
(
	scode                CHAR(2) NOT NULL ,
	scode_nm             VARCHAR2(50) NOT NULL ,
	lcode                CHAR(2) NOT NULL ,
	use_yn               CHAR(1) DEFAULT  'Y'  NOT NULL  CONSTRAINT  scode_useyn_chk CHECK (use_yn IN ('N', 'Y')),
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);
CREATE UNIQUE INDEX XPK공통코드소분류 ON SCODES(scode   ASC,lcode   ASC);
ALTER TABLE SCODES 	ADD CONSTRAINT  XPK공통코드소분류 PRIMARY KEY (scode,lcode);

CREATE TABLE SUBSCRIPTION
(
	subsp_id             NUMBER NOT NULL ,
	member_id            VARCHAR2(20) NOT NULL ,
	subsp_sdt            DATE NOT NULL ,
	subsp_edt            DATE NOT NULL ,
	subsp_pay_st         VARCHAR2(10) NULL ,
	subsp_amt            NUMBER NOT NULL ,
	subsp_pay_mthd       CHAR(4) NULL ,
	subsp_pay_amt        NUMBER NULL ,
	subsp_mile           NUMBER NULL ,
	imp_uid              VARCHAR2(20) NULL ,
	ins_dt               DATE NOT NULL ,
	udt_dt               DATE NOT NULL 	
);

CREATE UNIQUE INDEX XPK월정액구매 ON SUBSCRIPTION(subsp_id   ASC);
ALTER TABLE SUBSCRIPTION	ADD CONSTRAINT  XPK월정액구매 PRIMARY KEY (subsp_id);


