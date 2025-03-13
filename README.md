
# Library Management System Database

## Overview

This project implements a PostgreSQL relational database schema for a Library Management System. It includes tables for authors, books, borrowers, and borrowed books to track book lending and returns efficiently.

## Database Schema

* **authors** : Stores author details (ID, name, birthdate).
* **books** : Stores book details (ID, title, publication date, author ID).
* **borrowers** : Stores borrower details (ID, name, email).
* **borrowed_books** : Tracks borrowed books (ID, book ID, borrower ID, borrow and return dates).

## Relationships

* Each book is linked to an author (`author_id` as a foreign key).
* Borrowers can borrow multiple books, and books can be borrowed by multiple borrowers (many-to-many relationship via `borrowed_books`).
* `ON DELETE CASCADE` ensures that when an author or book is removed, related records are also deleted.

## Sample Queries

* Retrieve books borrowed by a specific user.
* List available books that are not borrowed.
* Get author details for each book.
* Track borrowed books and return dates.
* Count books borrowed by each borrower.

## Installation & Usage

1. Import the schema into a PostgreSQL database.
2. Insert sample data for authors, books, and borrowers.
3. Run queries to manage and analyze the data.
