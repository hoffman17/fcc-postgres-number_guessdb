--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (92, 'user_1724551319314', 6, 118);
INSERT INTO public.users VALUES (56, 'user_1724548034266', 2, 213);
INSERT INTO public.users VALUES (69, 'user_1724549204379', 2, 446);
INSERT INTO public.users VALUES (81, 'user_1724549848279', 2, 951);
INSERT INTO public.users VALUES (55, 'user_1724548034267', 6, 77);
INSERT INTO public.users VALUES (54, 'Dejanais', 2, 4);
INSERT INTO public.users VALUES (57, 'Herman', 1, 10);
INSERT INTO public.users VALUES (68, 'user_1724549204380', 6, 180);
INSERT INTO public.users VALUES (80, 'user_1724549848280', 6, 137);
INSERT INTO public.users VALUES (59, 'user_1724548410979', 2, 2);
INSERT INTO public.users VALUES (95, 'user_1724551376772', 2, 55);
INSERT INTO public.users VALUES (58, 'user_1724548410980', 6, 286);
INSERT INTO public.users VALUES (71, 'user_1724549251526', 2, 202);
INSERT INTO public.users VALUES (61, 'user_1724548844172', 2, 194);
INSERT INTO public.users VALUES (94, 'user_1724551376773', 6, 86);
INSERT INTO public.users VALUES (83, 'user_1724549862690', 2, 284);
INSERT INTO public.users VALUES (70, 'user_1724549251527', 6, 178);
INSERT INTO public.users VALUES (60, 'user_1724548844173', 6, 50);
INSERT INTO public.users VALUES (82, 'user_1724549862691', 6, 142);
INSERT INTO public.users VALUES (63, 'user_1724549054270', 2, 175);
INSERT INTO public.users VALUES (73, 'user_1724549348014', 2, 824);
INSERT INTO public.users VALUES (62, 'user_1724549054271', 6, 424);
INSERT INTO public.users VALUES (72, 'user_1724549348015', 6, 76);
INSERT INTO public.users VALUES (65, 'user_1724549105007', 2, 309);
INSERT INTO public.users VALUES (85, 'user_1724551010245', 2, 390);
INSERT INTO public.users VALUES (64, 'user_1724549105008', 6, 199);
INSERT INTO public.users VALUES (84, 'user_1724551010246', 6, 93);
INSERT INTO public.users VALUES (75, 'user_1724549411591', 2, 680);
INSERT INTO public.users VALUES (67, 'user_1724549139041', 2, 670);
INSERT INTO public.users VALUES (74, 'user_1724549411592', 6, 80);
INSERT INTO public.users VALUES (66, 'user_1724549139042', 6, 6);
INSERT INTO public.users VALUES (77, 'user_1724549742953', 2, 208);
INSERT INTO public.users VALUES (87, 'user_1724551086114', 2, 191);
INSERT INTO public.users VALUES (76, 'user_1724549742954', 6, 212);
INSERT INTO public.users VALUES (86, 'user_1724551086115', 6, 58);
INSERT INTO public.users VALUES (79, 'user_1724549755315', 2, 351);
INSERT INTO public.users VALUES (89, 'user_1724551278312', 2, 305);
INSERT INTO public.users VALUES (78, 'user_1724549755316', 6, 184);
INSERT INTO public.users VALUES (88, 'user_1724551278313', 6, 287);
INSERT INTO public.users VALUES (91, 'user_1724551293388', 2, 10);
INSERT INTO public.users VALUES (90, 'user_1724551293389', 6, 52);
INSERT INTO public.users VALUES (93, 'user_1724551319313', 2, 202);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 95, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

