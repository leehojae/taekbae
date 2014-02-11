drop table ATT_FILES;
drop table FEEDS;
drop table TASKS;
drop table PRJ_MEMS;
drop table MEMBERS;
drop table PROJECTS;

-- 회원정보
CREATE TABLE `MEMBERS` (
  `MNO`   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  `MNAME` VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  `EMAIL` VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  `TEL`   VARCHAR(30)  NULL     COMMENT '전화번호', -- 전화번호
  `AGE`   INTEGER      NULL     COMMENT '나이', -- 나이
  `PHOTO` VARCHAR(255) NULL     COMMENT '사진', -- 사진
  `PWD`   VARCHAR(20)  NOT NULL COMMENT '암호' -- 암호
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE `MEMBERS`
  ADD CONSTRAINT `PK_MEMBERS` -- 회원정보 기본키
    PRIMARY KEY (
      `MNO` -- 회원번호
    );

-- 회원정보 유니크 인덱스
CREATE UNIQUE INDEX `UIX_MEMBERS`
  ON `MEMBERS` ( -- 회원정보
    `EMAIL` ASC -- 이메일
  );

ALTER TABLE `MEMBERS`
  MODIFY COLUMN `MNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 프로젝트정보
CREATE TABLE `PROJECTS` (
  `PNO`      INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
  `TITLE`    VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  `CONTENTS` TEXT         NOT NULL COMMENT '내용', -- 내용
  `SDATE`    DATETIME     NOT NULL COMMENT '시작일', -- 시작일
  `EDATE`    DATETIME     NOT NULL COMMENT '종료일', -- 종료일
  `STATE`    INTEGER      NULL     DEFAULT 0 COMMENT '상태', -- 상태
  `TAGS`     VARCHAR(255) NULL     COMMENT '태그' -- 태그
)
COMMENT '프로젝트정보';

-- 프로젝트정보
ALTER TABLE `PROJECTS`
  ADD CONSTRAINT `PK_PROJECTS` -- 프로젝트정보 기본키
    PRIMARY KEY (
      `PNO` -- 프로젝트번호
    );

ALTER TABLE `PROJECTS`
  MODIFY COLUMN `PNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '프로젝트번호';

-- 프로젝트멤버들
CREATE TABLE `PRJ_MEMS` (
  `MNO`  INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
  `PNO`  INTEGER NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
  `ROLE` INTEGER NOT NULL COMMENT '권한: 
  1) 관리자 (9)
  2) 일반회원 (1)
  3) 손님 (0)
  ' -- 역할
)
COMMENT '프로젝트멤버들';

-- 프로젝트멤버들
ALTER TABLE `PRJ_MEMS`
  ADD CONSTRAINT `PK_PRJ_MEMS` -- 프로젝트멤버들 기본키
    PRIMARY KEY (
      `MNO`, -- 회원번호
      `PNO`  -- 프로젝트번호
    );

-- 작업정보
CREATE TABLE `TASKS` (
  `TNO`   INTEGER      NOT NULL COMMENT '작업번호', -- 작업번호
  `TITLE` VARCHAR(255) NOT NULL COMMENT '작업명', -- 작업명
  `SDATE` DATETIME     NULL     COMMENT '시작일', -- 시작일
  `EDATE` DATETIME     NULL     COMMENT '종료일', -- 종료일
  `STATE` INTEGER      NULL     DEFAULT 0 COMMENT '상태', -- 상태
  `TAGS`  VARCHAR(255) NULL     COMMENT '태그', -- 태그
  `PNO`   INTEGER      NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
  `MNO`   INTEGER      NULL     COMMENT '담당자번호' -- 담당자번호
)
COMMENT '작업정보';

-- 작업정보
ALTER TABLE `TASKS`
  ADD CONSTRAINT `PK_TASKS` -- 작업정보 기본키
    PRIMARY KEY (
      `TNO` -- 작업번호
    );

ALTER TABLE `TASKS`
  MODIFY COLUMN `TNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '작업번호';

-- 피드
CREATE TABLE `FEEDS` (
  `FNO`      INTEGER  NOT NULL COMMENT '피드번호', -- 피드번호
  `CONTENTS` TEXT     NOT NULL COMMENT '내용', -- 내용
  `CDATE`    DATETIME NOT NULL COMMENT '등록일', -- 등록일
  `MNO`      INTEGER  NOT NULL COMMENT '작성자번호', -- 작성자번호
  `PNO`      INTEGER  NOT NULL COMMENT '프로젝트번호' -- 프로젝트번호
)
COMMENT '피드';

-- 피드
ALTER TABLE `FEEDS`
  ADD CONSTRAINT `PK_FEEDS` -- 피드 기본키
    PRIMARY KEY (
      `FNO` -- 피드번호
    );

ALTER TABLE `FEEDS`
  MODIFY COLUMN `FNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '피드번호';

-- 첨부파일들
CREATE TABLE `ATT_FILES` (
  `AFNO`      INTEGER      NOT NULL COMMENT '첨부파일번호', -- 첨부파일번호
  `FNO`       INTEGER      NOT NULL COMMENT '피드번호', -- 피드번호
  `FILE_PATH` VARCHAR(255) NOT NULL COMMENT '파일경로' -- 파일경로
)
COMMENT '첨부파일들';

-- 첨부파일들
ALTER TABLE `ATT_FILES`
  ADD CONSTRAINT `PK_ATT_FILES` -- 첨부파일들 기본키
    PRIMARY KEY (
      `AFNO` -- 첨부파일번호
    );

ALTER TABLE `ATT_FILES`
  MODIFY COLUMN `AFNO` INTEGER NOT NULL AUTO_INCREMENT COMMENT '첨부파일번호';

-- 프로젝트멤버들
ALTER TABLE `PRJ_MEMS`
  ADD CONSTRAINT `FK_MEMBERS_TO_PRJ_MEMS` -- 회원정보 -> 프로젝트멤버들
    FOREIGN KEY (
      `MNO` -- 회원번호
    )
    REFERENCES `MEMBERS` ( -- 회원정보
      `MNO` -- 회원번호
    );

-- 프로젝트멤버들
ALTER TABLE `PRJ_MEMS`
  ADD CONSTRAINT `FK_PROJECTS_TO_PRJ_MEMS` -- 프로젝트정보 -> 프로젝트멤버들
    FOREIGN KEY (
      `PNO` -- 프로젝트번호
    )
    REFERENCES `PROJECTS` ( -- 프로젝트정보
      `PNO` -- 프로젝트번호
    );

-- 작업정보
ALTER TABLE `TASKS`
  ADD CONSTRAINT `FK_PROJECTS_TO_TASKS` -- 프로젝트정보 -> 작업정보
    FOREIGN KEY (
      `PNO` -- 프로젝트번호
    )
    REFERENCES `PROJECTS` ( -- 프로젝트정보
      `PNO` -- 프로젝트번호
    );

-- 작업정보
ALTER TABLE `TASKS`
  ADD CONSTRAINT `FK_PRJ_MEMS_TO_TASKS` -- 프로젝트멤버들 -> 작업정보
    FOREIGN KEY (
      `MNO`, -- 담당자번호
      `PNO`  -- 프로젝트번호
    )
    REFERENCES `PRJ_MEMS` ( -- 프로젝트멤버들
      `MNO`, -- 회원번호
      `PNO`  -- 프로젝트번호
    );

-- 피드
ALTER TABLE `FEEDS`
  ADD CONSTRAINT `FK_PRJ_MEMS_TO_FEEDS` -- 프로젝트멤버들 -> 피드
    FOREIGN KEY (
      `MNO`, -- 작성자번호
      `PNO`  -- 프로젝트번호
    )
    REFERENCES `PRJ_MEMS` ( -- 프로젝트멤버들
      `MNO`, -- 회원번호
      `PNO`  -- 프로젝트번호
    );

-- 첨부파일들
ALTER TABLE `ATT_FILES`
  ADD CONSTRAINT `FK_FEEDS_TO_ATT_FILES` -- 피드 -> 첨부파일들
    FOREIGN KEY (
      `FNO` -- 피드번호
    )
    REFERENCES `FEEDS` ( -- 피드
      `FNO` -- 피드번호
    );