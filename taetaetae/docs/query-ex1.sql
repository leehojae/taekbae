select count(*) from projects;
select count(*) from prj_mems;

/* cross join(cartesian join) n x m
  . 무의미한 조인
*/
select *
from prj_mems, projects;

/* natural join (equi join) 
  . 특정 컬럼 값을 기준으로 두 테이블의 레코드를 연결함.
*/
select *
from prj_mems a, projects b
where a.pno=b.pno;

/* A JOIN B USING (조건컬럼) 
 . 두 테이블을 연결하는 컬럼명이 같아야 한다.
*/
select *
from prj_mems a join projects b
using (pno)
order by pno;

/* A join B on 조건문 
 . 두 테이블을 연결하는 컬럼명이 다를 때 사용.
*/
select *
from prj_mems a join projects b
on a.pno=b.pno
order by a.pno;

/* A left/right outer join B on 조건문
  . A 또는 B 어느 한 테이블을 기준으로 연결한다.
  . 기준이 되는 테이블의 레코드는 모두 선택된다.
 */
select a.mno, b.pno, b.title, a.role
from prj_mems a right outer join projects b
on a.pno=b.pno
where a.mno=1
order by a.pno;