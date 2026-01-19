CREATE DATABASE fishbread_db;
USE fishbread_db;

-- 사용자 정보를 저장하는 테이블 생성
CREATE TABLE users(
	user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) UNIQUE,
    is_business BOOLEAN DEFAULT FALSE
);

-- 주문 정보를 저장하는 테이블 생성
CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, 
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- 재고 정보를 저장하는 테이블 생성
CREATE TABLE inventorys (
	item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

-- 판매 정보를 저장하는 테이블 생성
CREATE TABLE sales(
	sale_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity_sold INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (item_id) REFERENCES inventorys (item_id)
);

-- 일 매출 정보를 저장하는 테이블 생성
CREATE TABLE daily_sales(
	date DATE PRIMARY KEY,
    total_sales DECIMAL(10, 2) NOT NULL
);