--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    mass numeric(4,1),
    name character varying(30),
    home boolean,
    bright integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    radius numeric(4,1),
    mass numeric(4,1),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    radius numeric,
    mass numeric,
    name character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_extra_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_extra_info (
    has_life boolean,
    name character varying(30),
    year_duration integer NOT NULL,
    yedescription text,
    planet_id integer NOT NULL,
    planet_extra_info_id integer NOT NULL,
    has_moon boolean
);


ALTER TABLE public.planet_extra_info OWNER TO freecodecamp;

--
-- Name: planet_extra_info_planet_extra_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_extra_info_planet_extra_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_extra_info_planet_extra_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_extra_info_planet_extra_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_extra_info_planet_extra_info_id_seq OWNED BY public.planet_extra_info.planet_extra_info_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(4,1),
    radius integer,
    name character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_extra_info planet_extra_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_extra_info ALTER COLUMN planet_extra_info_id SET DEFAULT nextval('public.planet_extra_info_planet_extra_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 153.0, 'Andromeda', false, 342);
INSERT INTO public.galaxy VALUES (2, 348.5, 'Milky Way', true, 342);
INSERT INTO public.galaxy VALUES (3, 394.1, 'Virgo', false, 342);
INSERT INTO public.galaxy VALUES (4, 235.8, 'Canis', false, 342);
INSERT INTO public.galaxy VALUES (5, 152.6, 'Cygnus', false, 342);
INSERT INTO public.galaxy VALUES (6, 875.2, 'Maffei', false, 342);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Europa', 434.1, 646.2, 1, 5);
INSERT INTO public.moon VALUES ('Io', 342.1, 652.6, 2, 5);
INSERT INTO public.moon VALUES ('Ganimedes', 341.2, 123.2, 3, 5);
INSERT INTO public.moon VALUES ('Calisto', 324.3, 653.2, 4, 5);
INSERT INTO public.moon VALUES ('Moon', 233.6, 143.2, 5, 3);
INSERT INTO public.moon VALUES ('Amaltea', 341.3, 563.2, 6, 7);
INSERT INTO public.moon VALUES ('rgzrg', 432.1, 123.6, 7, 8);
INSERT INTO public.moon VALUES ('seqwd', 323.1, 574.3, 8, 10);
INSERT INTO public.moon VALUES ('Titan', 432.1, 235.1, 9, 6);
INSERT INTO public.moon VALUES ('Encelado', 523.5, 643.6, 10, 6);
INSERT INTO public.moon VALUES ('Mimas', 242.6, 234.6, 11, 6);
INSERT INTO public.moon VALUES ('Dione', 267.3, 953.5, 12, 6);
INSERT INTO public.moon VALUES ('Tetis', 52.4, 734.2, 13, 6);
INSERT INTO public.moon VALUES ('ehwuh', 634.6, 748.2, 14, 4);
INSERT INTO public.moon VALUES ('sfuehu', 342.6, 13.5, 15, 2);
INSERT INTO public.moon VALUES ('euhgu', 23.1, 23.6, 16, 7);
INSERT INTO public.moon VALUES ('ergyebrg', 23.5, 375.5, 17, 8);
INSERT INTO public.moon VALUES ('dfvdu', 23.5, 21.7, 18, 1);
INSERT INTO public.moon VALUES ('dfbiu', 632.4, 168.4, 19, 4);
INSERT INTO public.moon VALUES ('weuf', 53.1, 5.2, 20, 5);
INSERT INTO public.moon VALUES ('subrg', 345.1, 31.2, 21, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 53, 26.4, 'Mercury');
INSERT INTO public.planet VALUES (2, 1, 81, 85.2, 'Venus');
INSERT INTO public.planet VALUES (3, 1, 12, 25.3, 'Earth');
INSERT INTO public.planet VALUES (4, 1, 23, 63.2, 'Mart');
INSERT INTO public.planet VALUES (5, 1, 645, 642.6, 'Jupiter');
INSERT INTO public.planet VALUES (6, 1, 537, 237.5, 'Satrun');
INSERT INTO public.planet VALUES (7, 1, 458, 238.6, 'Neptune');
INSERT INTO public.planet VALUES (8, 1, 254, 387.3, 'Urano');
INSERT INTO public.planet VALUES (9, 4, 345, 374.5, 'hdgdf');
INSERT INTO public.planet VALUES (10, 3, 2346, 342.5, 'jdfkdg');
INSERT INTO public.planet VALUES (11, 2, 423, 538.2, 'uhuidrg');
INSERT INTO public.planet VALUES (12, 5, 3245, 346.2, 'Rockys home');


--
-- Data for Name: planet_extra_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_extra_info VALUES (false, 'Jupiter', 2005, 'It is just a ball filled with NH_3.', 5, 2, true);
INSERT INTO public.planet_extra_info VALUES (false, 'Saturn', 634, 'Beautiful rings domanate its skies.', 6, 3, true);
INSERT INTO public.planet_extra_info VALUES (true, 'Earth', 365, 'Mostly Harmless', 3, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 123.5, 4532, 'Sun');
INSERT INTO public.star VALUES (2, 2, 56.4, 4123, 'Alfa Centauri');
INSERT INTO public.star VALUES (3, 2, 347.5, 3452, 'Sirius');
INSERT INTO public.star VALUES (4, 2, 183.2, 4873, 'Arturo');
INSERT INTO public.star VALUES (5, 2, 756.4, 1283, 'Rigel');
INSERT INTO public.star VALUES (6, 3, 826.4, 5123, 'Antares');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_extra_info_planet_extra_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_extra_info_planet_extra_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_extra_info planet_extra_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_extra_info
    ADD CONSTRAINT planet_extra_info_pkey PRIMARY KEY (planet_extra_info_id);


--
-- Name: planet_extra_info planet_extra_info_planet_extra_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_extra_info
    ADD CONSTRAINT planet_extra_info_planet_extra_info_id_key UNIQUE (planet_extra_info_id);


--
-- Name: planet_extra_info planet_extra_info_year_duration_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_extra_info
    ADD CONSTRAINT planet_extra_info_year_duration_key UNIQUE (year_duration);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key1 UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_extra_info planet_extra_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_extra_info
    ADD CONSTRAINT planet_extra_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

