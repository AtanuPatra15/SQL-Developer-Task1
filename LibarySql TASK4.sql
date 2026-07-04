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
SELECT MAX(book_id) FROM books;
SHOW TABLE STATUS LIKE 'books';
DELETE FROM books
WHERE book_id > 0;
ALTER TABLE books AUTO_INCREMENT = 1;
USE librarydb;

-- Display all books
SELECT * FROM books;

-- Display title and author name
SELECT title, author_name FROM books;

-- Books published after 2021
SELECT * FROM books
WHERE published_year > 2021;

-- Books by John Smith
SELECT * FROM books
WHERE author_name = 'John Smith';

-- Books published between 2021 and 2023
SELECT * FROM books
WHERE published_year BETWEEN 2021 AND 2023;

-- Titles starting with 'P'
SELECT * FROM books
WHERE title LIKE 'P%';

-- Titles containing 'SQL'
SELECT * FROM books
WHERE title LIKE '%SQL%';

-- Books in category 1 or 2
SELECT * FROM books
WHERE category_id IN (1,2);

-- Books with author_id = 1 AND category_id = 1
SELECT * FROM books
WHERE author_id = 1 AND category_id = 1;

-- Books with author_id = 1 OR category_id = 2
SELECT * FROM books
WHERE author_id = 1 OR category_id = 2;

-- Unique author names
SELECT DISTINCT author_name FROM books;

-- Sort by title
SELECT * FROM books
ORDER BY title ASC;

-- Sort by published year (descending)
SELECT * FROM books
ORDER BY published_year DESC;

-- Show first 3 books
SELECT * FROM books
LIMIT 3;
ALTER TABLE books
ADD COLUMN price DECIMAL(10,2);
UPDATE books
SET price = 450
WHERE book_id = 1;

UPDATE books
SET price = 550
WHERE book_id = 2;

UPDATE books
SET price = 350
WHERE book_id = 3;

UPDATE books
SET price = 650
WHERE book_id = 4;
DESCRIBE books;
SELECT * FROM authors;
SELECT * FROM categories;
INSERT INTO books
(title, author_id, category_id, published_year, author_name, price)
VALUES
('Java Programming', 4, 1, 2023, 'William Stallings', 650);
INSERT INTO books
(title, author_id, category_id, published_year, author_name, price)
VALUES
('Learning MySQL', 2, 2, 2022, 'David Lee', 550),
('Computer Networks', 4, 1, 2020, 'William Stallings', 750),
('Ethical Hacking', 3, 4, 2024, 'A. Kumar', 700);
INSERT INTO authors (author_name)
VALUES ('Herbert Schildt');
INSERT INTO books
(title, author_id, category_id, published_year, author_name, price)
VALUES
('Java Programming', 5, 1, 2023, 'Herbert Schildt', 650);
SELECT * FROM books;
INSERT INTO books
(book_id, title, author_id, category_id, published_year, author_name, price)
VALUES
(5, 'Data Structures', 3, 1, 2024, 'A. Kumar', 600);
-- Count total books
SELECT COUNT(*) AS Total_Books
FROM books;
SELECT COUNT(*) FROM books;
-- Count books written by each author
SELECT author_name, COUNT(*) AS Total_Books
FROM books
GROUP BY author_name;
-- Average price of all books
SELECT AVG(price) AS Average_Price
FROM books;
-- Total price of books for each author
SELECT author_name, SUM(price) AS Total_Price
FROM books
GROUP BY author_name;
--  Most expensive book by each author
SELECT author_name, MAX(price) AS Highest_Price
FROM books
GROUP BY author_name;
-- Cheapest book by each author
SELECT author_name, MIN(price) AS Lowest_Price
FROM books
GROUP BY author_name;
-- Show only authors whose total book price is greater than 500
SELECT author_name, SUM(price) AS Total_Price
FROM books
GROUP BY author_name
HAVING SUM(price) > 500;
-- Count books in each category
SELECT c.category_name,
       COUNT(*) AS Total_Books
FROM books b
JOIN categories c
ON b.category_id = c.category_id
GROUP BY c.category_name;