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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1722937821619', 2, 263);
INSERT INTO public.users VALUES (1, 'user_1722937821620', 5, 21);
INSERT INTO public.users VALUES (22, 'user_1722939408834', 2, 146);
INSERT INTO public.users VALUES (4, 'user_1722937958833', 2, 457);
INSERT INTO public.users VALUES (38, 'user_1722940773757', 2, 332);
INSERT INTO public.users VALUES (21, 'user_1722939408835', 5, 596);
INSERT INTO public.users VALUES (3, 'user_1722937958834', 5, 100);
INSERT INTO public.users VALUES (16, 'Ali', 2, 10);
INSERT INTO public.users VALUES (6, 'user_1722938019975', 2, 204);
INSERT INTO public.users VALUES (5, 'user_1722938019976', 5, 13);
INSERT INTO public.users VALUES (37, 'user_1722940773758', 5, 172);
INSERT INTO public.users VALUES (24, 'user_1722939604235', 2, 734);
INSERT INTO public.users VALUES (9, 'user_1722938222021', 2, 143);
INSERT INTO public.users VALUES (23, 'user_1722939604236', 5, 6);
INSERT INTO public.users VALUES (8, 'user_1722938222022', 5, 380);
INSERT INTO public.users VALUES (40, 'user_1722940776477', 2, 212);
INSERT INTO public.users VALUES (11, 'user_1722938380623', 2, 106);
INSERT INTO public.users VALUES (10, 'user_1722938380624', 5, 137);
INSERT INTO public.users VALUES (12, 'user_1722938593728', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1722938593727', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1722939864414', 2, 295);
INSERT INTO public.users VALUES (39, 'user_1722940776478', 5, 2);
INSERT INTO public.users VALUES (15, 'user_1722938848402', 2, 413);
INSERT INTO public.users VALUES (25, 'user_1722939864415', 5, 304);
INSERT INTO public.users VALUES (14, 'user_1722938848403', 5, 476);
INSERT INTO public.users VALUES (18, 'user_1722939079559', 2, 826);
INSERT INTO public.users VALUES (28, 'user_1722939906799', 2, 106);
INSERT INTO public.users VALUES (17, 'user_1722939079560', 5, 127);
INSERT INTO public.users VALUES (27, 'user_1722939906800', 5, 72);
INSERT INTO public.users VALUES (20, 'user_1722939095826', 2, 824);
INSERT INTO public.users VALUES (7, 'Muhammadjon', 5, 9);
INSERT INTO public.users VALUES (19, 'user_1722939095827', 5, 54);
INSERT INTO public.users VALUES (30, 'user_1722939995125', 2, 304);
INSERT INTO public.users VALUES (29, 'user_1722939995126', 5, 203);
INSERT INTO public.users VALUES (32, 'user_1722940067091', 2, 82);
INSERT INTO public.users VALUES (31, 'user_1722940067092', 5, 137);
INSERT INTO public.users VALUES (34, 'user_1722940327417', 2, 111);
INSERT INTO public.users VALUES (33, 'user_1722940327418', 5, 72);
INSERT INTO public.users VALUES (36, 'user_1722940329253', 2, 249);
INSERT INTO public.users VALUES (35, 'user_1722940329254', 5, 280);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 40, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

