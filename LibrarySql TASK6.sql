-- TASK 6
USE librarydb;
SELECT title, price
FROM Books
WHERE price = (
    SELECT MAX(price)
    FROM Books
);

SELECT title
FROM Books
WHERE category_id = (
    SELECT category_id
    FROM Categories
    WHERE category_name = 'Programming'
);
DESCRIBE Authors;
SELECT * FROM Authors;

SELECT title
FROM Books
WHERE author_id IN (
    SELECT author_id
    FROM Authors
    WHERE author_name = 'David Lee'
);
DESCRIBE Borrow;
SELECT * FROM Borrow;
SELECT * FROM CUSTOMERS;
DESCRIBE customers;
INSERT INTO Borrow (borrow_id, member_id, book_id, issue_date, return_date)
VALUES
(1, 101, 1, '2026-07-01', '2026-07-10'),
(2, 102, 2, '2026-07-02', '2026-07-11');

SELECT title
FROM Books b
WHERE EXISTS (
    SELECT 1
    FROM Borrow br
    WHERE br.member_id = b.book_id
);
DESCRIBE BOOKS;
SELECT customer_id, customer_name
FROM Customers;
SELECT member_id, book_id
FROM Borrow;
SELECT book_id, title
FROM Books;
SELECT book_id
FROM Borrow;
select * from books;
select * from borrow;
SELECT COUNT(*) FROM Books;
SELECT COUNT(*) FROM Borrow;
select database();
SELECT b.book_id, bk.book_id, bk.title
FROM Borrow b
JOIN Books bk
ON b.book_id = bk.book_id;
SELECT b.title
FROM Books b
WHERE EXISTS (
    SELECT 1
    FROM Borrow br
    WHERE br.book_id = b.book_id
);
SELECT title
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Borrow
);
SELECT b.title
FROM Books b
WHERE EXISTS (
    SELECT 1
    FROM Borrow br
    WHERE br.book_id = b.book_id
);

SELECT AVG(book_price) AS average_price
FROM (
    SELECT price AS book_price
    FROM Books
) AS temp;

SELECT title, price
FROM Books b1
WHERE price > (
    SELECT AVG(price)
    FROM Books b2
    WHERE b1.category_id = b2.category_id
);

SELECT title,
(
    SELECT category_name
    FROM Categories c
    WHERE c.category_id = b.category_id
) AS Category
FROM Books b;

SELECT
(
    SELECT COUNT(*)
    FROM Borrow
) AS Total_Borrowed_Books;
