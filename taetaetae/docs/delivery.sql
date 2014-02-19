-- 전체 배송정보_관리자
CREATE TABLE `EXCEL_UPLOAD` (
	`TRCNO`            INTEGER      NOT NULL COMMENT '운송장번호', -- 운송장번호
	`ORDER_NO`         INTEGER      NULL     COMMENT '주문번호', -- 주문번호
	`STATE`            INTEGER      NULL     COMMENT '배송상태', -- 배송상태
	`OFFICE`           VARCHAR(50)  NULL     COMMENT '배송사', -- 배송사
	`MEMBER`           VARCHAR(10)  NULL     COMMENT '배송담당자', -- 배송담당자
	`RECEIVE_DATE`     DATE         NOT NULL COMMENT '접수일', -- 접수일
	`DELIVER_DATE`     DATE         NOT NULL COMMENT '배달예정일', -- 배달예정일
	`DELIVER_END_DATE` DATE         NULL     COMMENT '배달완료일', -- 배달완료일
	`SENDER_NAME`      VARCHAR(50)  NOT NULL COMMENT '보내는분', -- 보내는분
	`SENDER_ADDR`      VARCHAR(100) NOT NULL COMMENT '보내는분주소', -- 보내는분주소
	`SENDER_TEL1`      VARCHAR(30)  NOT NULL COMMENT '보내는분전화1', -- 보내는분전화1
	`SENDER_TEL2`      VARCHAR(30)  NOT NULL COMMENT '보내는분전화2', -- 보내는분전화2
	`RECEIVER_NAME`    VARCHAR(50)  NOT NULL COMMENT '받는분', -- 받는분
	`RECEIVER_ADDR`    VARCHAR(100) NOT NULL COMMENT '받는분주소', -- 받는분주소
	`RECEIVER_TEL1`    VARCHAR(30)  NOT NULL COMMENT '받는분전화1', -- 받는분전화1
	`RECEIVER_TEL2`    VARCHAR(30)  NOT NULL COMMENT '받는분전화2', -- 받는분전화2
	`SEND_POINT`       VARCHAR(30)  NOT NULL COMMENT '발송점', -- 발송점
	`RECEIVE_POINT`    VARCHAR(30)  NOT NULL COMMENT '도착점', -- 도착점
	`PACKING`          VARCHAR(50)  NOT NULL COMMENT '취급구분', -- 취급구분
	`PRODUCT_NAME`     VARCHAR(50)  NOT NULL COMMENT '품명', -- 품명
	`GOODS_COUNT`      INTEGER      NOT NULL COMMENT '수량', -- 수량
	`GOODS_SIZE`       VARCHAR(10)  NOT NULL COMMENT '크기', -- 크기
	`WEIGHT`           INTEGER      NOT NULL COMMENT '중량', -- 중량
	`PAYMENT`          VARCHAR(10)  NOT NULL COMMENT '운임구분', -- 운임구분
	`PAY`              INTEGER      NULL     COMMENT '운임결제', -- 운임결제
	`TODAY_DATE`       DATE         NOT NULL COMMENT '날짜', -- 날짜
	`RETURN_BOX`       INTEGER      NULL     COMMENT '반품', -- 반품
	`BOX_STATE`        INTEGER      NULL     COMMENT '물품상태', -- 물품상태
	`ID`               INTEGER      NULL     COMMENT '직원번호' -- 직원번호
)
COMMENT '전체 배송정보_관리자';

-- 전체 배송정보_관리자
ALTER TABLE `EXCEL_UPLOAD`
	ADD CONSTRAINT `PK_EXCEL_UPLOAD` -- 전체 배송정보_관리자 기본키
		PRIMARY KEY (
			`TRCNO` -- 운송장번호
		);

-- 사용자
CREATE TABLE `MEMBERS` (
	`MNO`        INTEGER      NOT NULL COMMENT '직원번호', -- 직원번호
	`OFFICE_NUM` INTEGER      NULL     COMMENT '사업자번호', -- 사업자번호
	`ID`      VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
	`RANK`       VARCHAR(10)  NULL     COMMENT '직급', -- 직급
	`MNAME`      VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	`TEL`        VARCHAR(30)  NULL     COMMENT '전화번호', -- 전화번호
	`PERSONAL_NO`        VARCHAR(13)  NULL     COMMENT '주민번호', -- 주민번호
	`PHOTO`      VARCHAR(255) NULL     COMMENT '사진', -- 사진
	`PWD`        VARCHAR(20)  NOT NULL COMMENT '암호' -- 암호
)
COMMENT '사용자';

-- 사용자
ALTER TABLE `MEMBERS`
	ADD CONSTRAINT `PK_MEMBERS` -- 사용자 기본키
		PRIMARY KEY (
			`MNO` -- 직원번호
		);

-- 사용자 유니크 인덱스
CREATE UNIQUE INDEX `UIX_MEMBERS`
	ON `MEMBERS` ( -- 사용자
		`ID` ASC -- 이메일
	);

ALTER TABLE `MEMBERS`
	MODIFY COLUMN `MNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '직원번호';

-- 배송차량
CREATE TABLE `CARS` (
	`MNO`      INTEGER     NOT NULL COMMENT '직원번호', -- 직원번호
	`CAR_NUM`  VARCHAR(50) NULL     COMMENT '차량번호', -- 차량번호
	`CAR_LOAD` INTEGER     NULL     COMMENT '차량적재구분', -- 차량적재구분
	`CAR_TYPE` INTEGER     NULL     COMMENT '특수차(냉장냉동)' -- 특수차(냉장냉동)
)
COMMENT '배송차량';

-- 배송차량
ALTER TABLE `CARS`
	ADD CONSTRAINT `PK_CARS` -- 배송차량 기본키
		PRIMARY KEY (
			`MNO` -- 직원번호
		);

-- 배송구역
CREATE TABLE `AREAS` (
	`AREA_NUM`   INTEGER     NOT NULL COMMENT '일련번호', -- 일련번호
	`MNO`        INTEGER     NULL     COMMENT '직원번호', -- 직원번호
	`TASK_AREA`  VARCHAR(50) NULL     COMMENT '담당지역', -- 담당지역
	`AREA_CLASS` VARCHAR(50) NULL     COMMENT '구분' -- 구분
)
COMMENT '배송구역';

-- 배송구역
ALTER TABLE `AREAS`
	ADD CONSTRAINT `PK_AREAS` -- 배송구역 기본키
		PRIMARY KEY (
			`AREA_NUM` -- 일련번호
		);

-- 처리점소
CREATE TABLE `OFFICE` (
	`OFFICE_NUM`      INTEGER      NOT NULL COMMENT '사업자번호', -- 사업자번호
	`OFFICE_NAME`     VARCHAR(50)  NULL     COMMENT '점소명', -- 점소명
	`OFFICE_TEL`      VARCHAR(50)  NULL     COMMENT '전화', -- 전화
	`OFFICE_POST_NUM` VARCHAR(50)  NULL     COMMENT '우편번호', -- 우편번호
	`OFFICE_ADDR`     VARCHAR(255) NULL     COMMENT '주소', -- 주소
	`OFFICE_FAX`      VARCHAR(50)  NULL     COMMENT '팩스' -- 팩스
)
COMMENT '처리점소';

-- 처리점소
ALTER TABLE `OFFICE`
	ADD CONSTRAINT `PK_OFFICE` -- 처리점소 기본키
		PRIMARY KEY (
			`OFFICE_NUM` -- 사업자번호
		);

-- 전체 배송정보_관리자
ALTER TABLE `EXCEL_UPLOAD`
	ADD CONSTRAINT `FK_CARS_TO_EXCEL_UPLOAD` -- 배송차량 -> 전체 배송정보_관리자
		FOREIGN KEY (
			`ID` -- 직원번호
		)
		REFERENCES `CARS` ( -- 배송차량
			`MNO` -- 직원번호
		);

-- 사용자
ALTER TABLE `MEMBERS`
	ADD CONSTRAINT `FK_OFFICE_TO_MEMBERS` -- 처리점소 -> 사용자
		FOREIGN KEY (
			`OFFICE_NUM` -- 사업자번호
		)
		REFERENCES `OFFICE` ( -- 처리점소
			`OFFICE_NUM` -- 사업자번호
		);

-- 배송차량
ALTER TABLE `CARS`
	ADD CONSTRAINT `FK_MEMBERS_TO_CARS` -- 사용자 -> 배송차량
		FOREIGN KEY (
			`MNO` -- 직원번호
		)
		REFERENCES `MEMBERS` ( -- 사용자
			`MNO` -- 직원번호
		);

-- 배송구역
ALTER TABLE `AREAS`
	ADD CONSTRAINT `FK_CARS_TO_AREAS` -- 배송차량 -> 배송구역
		FOREIGN KEY (
			`MNO` -- 직원번호
		)
		REFERENCES `CARS` ( -- 배송차량
			`MNO` -- 직원번호
		);