CREATE DATABASE salary;
USE salary;

-- 직원 정보를 저장하는 테이블 생성
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    job_position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- 직원의 이름, 포지션, 연봉 정보를 저장
INSERT INTO employees (name, job_position , salary) VALUES
	('혜린', 'PM', 90000),
	('은우', 'Frontend', 80000),
	('가을', 'backend', 92000),
	('지수', 'Frontend', 78000),
	('민혁', 'Frontend', 96000),
	('하온', 'backend', 130000);

-- Frontend 포지션의 직원 중에 연봉이 90000 이하인 직원 조회
SELECT name, salary
FROM employees
WHERE job_position = 'Frontend' And salary <= 90000;

-- PM 포지션의 직원의 연봉을 10% 인상한 후 결과 확인
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET salary = salary * 1.10
WHERE job_position = 'PM' AND id IS NOT NULL; 
SELECT * FROM salary.employees;

-- Backend 포지션의 직원의 연봉을 5% 인상한 후 결과 확인
UPDATE employees
SET salary = salary * 1.05
WHERE job_position = 'Backend' AND id IS NOT NULL;
SELECT * FROM salary.employees;

-- 민혁 사원 데이터를 삭제하기
DELETE FROM employees
WHERE name = '민혁';
SELECT * FROM salary.employees;

-- 모든 직업 포지션 별로 그룹화하여 평균 연봉 계산
SELECT job_position, AVG(salary)
FROM employees
GROUP BY job_position;

-- employees 테이블 삭제
DROP TABLE employees;