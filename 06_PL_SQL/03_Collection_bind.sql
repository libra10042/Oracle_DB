/* Table Type 변수 (컬렉션)
   컬렉션 : 일반 프로그래밍 언어에서 사용하는 배열 타입을 
           pl/SQL에서는 컬렉션이라고 한다. 
   
   - 종류
      ⊙연관배열(associative array/ index-by table)
        : 키와 값의 쌍으로 구성된 컬렉션, java의 해시테이블과 같은 개념. 
         ..key 데이터 유형 - 숫자 : binary_integer, pls_integer
                                 위 두가지 데이터 타입은 number 보다 
                                 작은 저장 영역이 필요, 산술연산의 경우 
                                 number 보다 빠르다.
                          문자 : varchar2
         ..값(value) - 일반 데이터 타입, 레코드 타입이 값이 될수 있다. 
                       레코드 타입일 경우 여러개의 값을 가질 수 있다.   
         
         
      ⊙varray(variable array) : 고정 길이를 가진 배열. 
                                 일반 프로그래밍에서 사용하는 배열과 같다. (1부터 값이 시작된다.)
      
      ⊙중첩테이블(nested table) : varray 흡사한 구조의 배열 
                                 배열의 크기를 명시하지 않음, 
                                 동적으로 배열의 크기가 설정됨. 
  
                                   
 - Table 타입의 선언 형식. 
   1.정의
     Type 타입명 IS TABLE OF 
     employees.first_name%type
     INDEX BY BINARY_INTEGER; 
     
   2.선언 (메모리화)
     식별자 타입명;
    
*/

set serveroutput on; 
declare 
    tname varchar2(20);
    
    type t_emp_name is table of
    employees.last_name%type
    index by binary_integer;
    
    v_name t_emp_name; 
    
begin
    select last_name into tname 
    from employees
    where employee_id = 100;
    
    v_name(0):= t_name;
    dbms_output.put_line(v_name(0)); 
    end;
/

declare
 type tbl_type is table of 
   employees.last_name%type
 index by binary_integer;
 
 v_tbl_type tbl_type;
 a binary_integer :=0; 
 
 begin
   for name in(select last_name from employees)loop
        a:=a+1;
        vtbl_type(a):=emp_name.last_name;
   end loop;
   for i in 1..a loop    --1~a까지 돌리겠다는 의미이다.
      dbms_output.put_line(vtbl_type(i)); 
   end loop; 
   end; 
/



/* 바인드 변수(비 PL/SQL 변수)
  - 호스트환경에서 생성되어 데이터를 저장하기 때문에 호스트 변수라고 한다.
  - 키워드 VARIABLE를 이용하면, SQL문이나 PL/SQL블록에서도 사용가능. 
  - PL/SQL 블록이 실행된 후에도 액세스가 가능하다.
  - print명령을 이용하여 출력가능. 
  - :을 이용한다.
*/
set autoprint on; 



begin 
    select (salary*12+nvl(commission_pct*salary, 0)) into :vsal
    from employees 
    where employee_id = 100; 
end; 
/

print vsal; 


    

                                                                                                                                                                                                                                                                                                                                                                   
