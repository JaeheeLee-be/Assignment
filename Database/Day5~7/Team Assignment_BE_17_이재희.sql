CREATE DATABASE RRS;
USE RRS;

CREATE TABLE Users(
user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_phone_number VARCHAR(20) NOT NULL UNIQUE,
    age VARCHAR(100),
    nickname VARCHAR(50) NOT NULL UNIQUE,
    passward VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Restaurants(
restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(50) NOT NULL,
    restaurant_address VARCHAR(100) NOT NULL,
    restaurant_Phone_number VARCHAR(20) NOT NULL UNIQUE,
    category ENUM('한식', '중식', '일식', '양식'),
    meun_name VARCHAR(20) NOT NULL,
    price DECIMAL(10,0) NOT NULL,
    table_count VARCHAR(100),
    opening_house VARCHAR(20)
);

CREATE TABLE Reservations(
reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    party_size INT NOT NULL CHECK (party_size > 0),
    reservation_status ENUM('요청중', '완료', '취소'),
    reservation_datetime DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Payments(
payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    deposit DECIMAL(10,0),
    payment_method ENUM('카드', '계좌이체', '네이버페이', '카카오페이'),
    payment_status ENUM('결제전', '결제완료', '결제실패', '환불완료'),
    payment_time DATETIME,
    refund_time DATETIME,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

CREATE TABLE Reviews(
review_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL CHECK(rating >=1.0 AND rating <= 5.0),
    content TEXT,
    photo VARCHAR(100),
    review_time DATETIME
);