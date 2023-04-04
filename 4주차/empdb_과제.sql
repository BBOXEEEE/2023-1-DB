/* 아래 데이터베이스 및 테이블을 구축하시오 */
-- 데이터베이스 생성
CREATE DATABASE empdb;
USE empdb;

-- merit 테이블 생성
CREATE TABLE merit(
	performance INT NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY(performance)
) CHARSET = utf8mb4;
-- 생성 결과 확인
SELECT * FROM merit;

-- employees 테이블 생성
CREATE TABLE employees(
	emp_id INT NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY(emp_id), 
    CONSTRAINT fk_performance
	FOREIGN KEY (performance) REFERENCES merit(performance)
) CHARSET = utf8mb4;
-- 생성 결과 확인
SELECT * FROM employees;

-- merit Table에 실적(performance)별 보너스 percentage 값 추가
INSERT INTO merit VALUES(1, 0);
INSERT INTO merit VALUES(2, 0.01);
INSERT INTO merit VALUES(3, 0.03);
INSERT INTO merit VALUES(4, 0.05);
INSERT INTO merit VALUES(5, 0.08);
-- 실행 결과 확인
SELECT * FROM merit;

-- employees Table에 직원 데이터 입력
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Mary Doe", 1, 50000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Cindy Smith", 3, 60000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Sue Greenspan", 4, 75000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Gracee Dell", 5, 1250000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Nancy Johnson", 3, 85000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("John Doe", 2, 45000);
INSERT INTO employees(emp_name, performance, salary) 
VALUES("Lily Bush", 3, 55000);
-- 실행 결과 확인
SELECT * FROM employees;

-- merit, employees Table 전체 조회
SELECT * FROM merit;
SELECT * FROM employees;

/* 실적 별 월급은 실적이 올라갈 때 마다 월급=월급+월급 *percentage로 오른다고 가정하고, 
현재 employees 테이블에 들어가 있는 월급 데이터는 실적정보가 반영되어 있지 않다고 할 때 
실적을 반영한 월급으로 갱신 시키시오 */
-- Safe Update 일시적 해제
SET sql_safe_updates=0;
--  Salary 데이터 업데이트
UPDATE employees LEFT JOIN merit
ON employees.performance = merit.performance
SET employees.salary = employees.salary + employees.salary * merit.percentage;
-- 업데이트 결과 조회
SELECT * FROM employees;