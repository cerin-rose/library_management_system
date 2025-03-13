CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_date DATE,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE borrowers (
    borrower_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE borrowed_books (
    borrowed_id SERIAL PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (borrower_id) REFERENCES borrowers(borrower_id) ON DELETE CASCADE
);

INSERT INTO authors (name, birthdate) 
VALUES 
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('J.R.R. Tolkien', '1892-01-03');

INSERT INTO books (title, publication_date, author_id) 
VALUES 
('Harry Potter and the Philosopher''s Stone', '1997-06-26', 1),
('1984', '1949-06-08', 2),
('The Hobbit', '1937-09-21', 3);

INSERT INTO borrowers (name, email) 
VALUES 
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com');

INSERT INTO borrowed_books (book_id, borrower_id, borrow_date, return_date) 
VALUES 
(1, 1, '2025-03-01', NULL),
(2, 2, '2025-02-15', '2025-03-01');

SELECT b.title, bb.borrow_date, bb.return_date
FROM borrowed_books bb
INNER JOIN books b ON bb.book_id = b.book_id
INNER JOIN borrowers br ON bb.borrower_id = br.borrower_id
WHERE br.name = 'Alice Smith' AND bb.return_date IS NULL;

SELECT b.title
FROM books b
LEFT JOIN borrowed_books bb ON b.book_id = bb.book_id
WHERE bb.book_id IS NULL;

SELECT b.title, b.publication_date, a.name AS author
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id;

SELECT br.name AS borrower, b.title AS book, bb.borrow_date
FROM borrowed_books bb
INNER JOIN borrowers br ON bb.borrower_id = br.borrower_id
INNER JOIN books b ON bb.book_id = b.book_id;

SELECT b.title, br.name AS borrower, bb.borrow_date, bb.return_date
FROM books b
LEFT JOIN borrowed_books bb ON b.book_id = bb.book_id
LEFT JOIN borrowers br ON bb.borrower_id = br.borrower_id;

SELECT br.name, b.title AS borrowed_book
FROM borrowers br
LEFT JOIN borrowed_books bb ON br.borrower_id = bb.borrower_id
LEFT JOIN books b ON bb.book_id = b.book_id;

SELECT a.name AS author, b.title AS book
FROM authors a
LEFT JOIN books b ON a.author_id = b.author_id;

SELECT br.name AS borrower, b.title AS book, a.name AS author, bb.borrow_date, bb.return_date
FROM borrowed_books bb
INNER JOIN books b ON bb.book_id = b.book_id
INNER JOIN authors a ON b.author_id = a.author_id
INNER JOIN borrowers br ON bb.borrower_id = br.borrower_id;

SELECT b.title
FROM books b
LEFT JOIN borrowed_books bb ON b.book_id = bb.book_id
WHERE bb.book_id IS NULL;


SELECT br.name, COUNT(bb.book_id) AS books_borrowed
FROM borrowed_books bb
INNER JOIN borrowers br ON bb.borrower_id = br.borrower_id
GROUP BY br.name;

select * from books;