CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category_id INT,
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
ALTER TABLE books
ADD COLUMN author_name VARCHAR(100);
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
SHOW TABLES;
USE librarydb;
SHOW CREATE TABLE Categories;

-- Insert Categories
INSERT INTO Categories (category_id, category_name)
VALUES
(1, 'Programming'),
(2, 'Database'),
(3, 'Science'),
(4, 'Cyber Security');

-- Insert Members
INSERT INTO Members (member_id, member_name, email, phone)
VALUES
(101, 'Atanu Patra', 'atanu@patra.com', '9876543210'),
(102, 'Shuti Sen', 'shuti@sen.com', NULL),
(103, 'Amit Roy', NULL, '9123456789');
INSERT INTO authors (author_id, author_name)
VALUES
(1, 'John Smith'),
(2, 'David Lee'),
(3, 'A. Kumar'),
(4, 'William Stallings');

-- Insert Books
INSERT INTO books (title, author_id, category_id, published_year, author_name)
VALUES
('Python Basics', 1, 1, 2018, 'John Smith'),
('SQL Guide', 2, 2, 2021, 'David Lee'),
('Physics Today', 3, 3, 2020, 'A. Kumar'),
('Cryptography and Network Security', 4, 4, 2022, 'William Stallings');
DESC books;
SELECT *FROM authors;

-- Update Example
UPDATE Members
SET phone = '9000011111'
WHERE member_id = 102;
UPDATE members
SET email = 'amit@roygmail.com'
WHERE member_id = '103';

-- Delete Example
DELETE FROM books
WHERE book_id = 203;
USE librarydb;
SHOW tables;
SELECT * FROM members;
 SELECT * FROM books;
SELECT * FROM authors;