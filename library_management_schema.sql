--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-13 09:44:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 81942)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    name character varying(100) NOT NULL,
    birthdate date
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 81941)
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_author_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 217
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- TOC entry 220 (class 1259 OID 81949)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    publication_date date,
    author_id integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 81948)
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_book_id_seq OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 219
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;


--
-- TOC entry 224 (class 1259 OID 81970)
-- Name: borrowed_books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowed_books (
    borrowed_id integer NOT NULL,
    book_id integer,
    borrower_id integer,
    borrow_date date,
    return_date date
);


ALTER TABLE public.borrowed_books OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 81969)
-- Name: borrowed_books_borrowed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrowed_books_borrowed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.borrowed_books_borrowed_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 223
-- Name: borrowed_books_borrowed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrowed_books_borrowed_id_seq OWNED BY public.borrowed_books.borrowed_id;


--
-- TOC entry 222 (class 1259 OID 81961)
-- Name: borrowers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borrowers (
    borrower_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.borrowers OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 81960)
-- Name: borrowers_borrower_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borrowers_borrower_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.borrowers_borrower_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 221
-- Name: borrowers_borrower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borrowers_borrower_id_seq OWNED BY public.borrowers.borrower_id;


--
-- TOC entry 4710 (class 2604 OID 81945)
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 81952)
-- Name: books book_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);


--
-- TOC entry 4713 (class 2604 OID 81973)
-- Name: borrowed_books borrowed_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowed_books ALTER COLUMN borrowed_id SET DEFAULT nextval('public.borrowed_books_borrowed_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 81964)
-- Name: borrowers borrower_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowers ALTER COLUMN borrower_id SET DEFAULT nextval('public.borrowers_borrower_id_seq'::regclass);


--
-- TOC entry 4715 (class 2606 OID 81947)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4717 (class 2606 OID 81954)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 4723 (class 2606 OID 81975)
-- Name: borrowed_books borrowed_books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_pkey PRIMARY KEY (borrowed_id);


--
-- TOC entry 4719 (class 2606 OID 81968)
-- Name: borrowers borrowers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowers
    ADD CONSTRAINT borrowers_email_key UNIQUE (email);


--
-- TOC entry 4721 (class 2606 OID 81966)
-- Name: borrowers borrowers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowers
    ADD CONSTRAINT borrowers_pkey PRIMARY KEY (borrower_id);


--
-- TOC entry 4724 (class 2606 OID 81955)
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id) ON DELETE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 81976)
-- Name: borrowed_books borrowed_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 81981)
-- Name: borrowed_books borrowed_books_borrower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_borrower_id_fkey FOREIGN KEY (borrower_id) REFERENCES public.borrowers(borrower_id) ON DELETE CASCADE;


-- Completed on 2025-03-13 09:44:25

--
-- PostgreSQL database dump complete
--

