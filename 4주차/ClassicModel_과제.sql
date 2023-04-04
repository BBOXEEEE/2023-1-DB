USE classicmodels;

/* Employee Table에 employeeNumber는 1901번, lastName은 hong, firstName은 jin, extension은 x5000, 
   email은 nike@google.com, officeCode는 10, reportsTo는 null, jobTitle은 Research인 사원의 정보 를 입력하시오. */
-- offices Table에 officeCode = 10인 데이터 추가
INSERT INTO offices
VALUES (10, "Seoul", "+82 02 111 234", "Gangnamgu", null, null, "KOR", "03312", "KOR");
-- Employee Table에 데이터 추가
INSERT INTO employees
VALUES (1901, "Hong", "Jin", "x5000", "nike@google.com", 10, null, "Research");
-- 추가된 값 조회
SELECT * FROM employees WHERE employeeNumber = 1901;

/* Jobtitle이 research인 직원이 속한 office의 city를 Cheonan-si으로 변경하시오 */
UPDATE employees LEFT JOIN offices
ON employees.officeCode = offices.officeCode
SET offices.city = "Cheonan-si"
WHERE employees.jobTitle = "Research";
-- 변경된 값 조회
SELECT * FROM offices WHERE city = "Cheonan-si";

/* Employees와 offices Table에서 officeCode가 1인 Row들을 삭제하시오 */
SET foreign_key_checks = 0;
DELETE FROM employees WHERE officeCode = 1;
DELETE FROM offices WHERE officeCode = 1;
SET foreign_key_checks = 1;
-- employees 테이블 결과 확인
SELECT * FROM employees WHERE officeCode = 1;
SELECT * FROM offices WHERE officeCode = 1;

/* 11 page에서 입력시킨 사원을 삭제하시오. */
DELETE FROM employees WHERE employeeNumber = 1901;
-- 삭제 확인
SELECT * FROM employees WHERE employeeNumber = 1901;