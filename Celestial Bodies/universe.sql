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
    name character varying(45) NOT NULL,
    constellation character varying(45) NOT NULL,
    notes text,
    diameter_in_lightyears integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(45),
    planet_id integer NOT NULL,
    radius_in_km integer,
    notes text,
    is_spherical boolean DEFAULT true NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(45),
    star_id integer NOT NULL,
    radius_in_km integer,
    has_life boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45),
    galaxy_id integer NOT NULL,
    notes text,
    solar_radius numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: starclass; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starclass (
    starclass_id integer NOT NULL,
    name character varying(45) NOT NULL,
    notes text
);


ALTER TABLE public.starclass OWNER TO freecodecamp;

--
-- Name: starclass_starclass_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starclass_starclass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starclass_starclass_id_seq OWNER TO freecodecamp;

--
-- Name: starclass_starclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starclass_starclass_id_seq OWNED BY public.starclass.starclass_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: starclass starclass_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starclass ALTER COLUMN starclass_id SET DEFAULT nextval('public.starclass_starclass_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with it around 4.5 billion years from now.', 152000);
INSERT INTO public.galaxy VALUES (2, 'Caldwell 60', 'Corvus', 'Colliding with Caldwell 61 to form the Antennae Galaxies', 500000);
INSERT INTO public.galaxy VALUES (3, 'Caldwell 61', 'Corvus', 'Colliding with Caldwell 60 to form the Antennae Galaxies', 500000);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Sagittarius', 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 87400);
INSERT INTO public.galaxy VALUES (5, 'Needle Galaxy', 'Coma Berenices', 'Also known as Caldwell 38', NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Ursa Major', 'Also known as Messier 101 or M101', NULL);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', 'Coma Berenices', 'Also known as "Sleeping Beauty Galaxy"', 53800);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1737, 'The Earths moon!', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 'It has too little mass to be rounded under its own gravity', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 'Even smaller than Phobos!', false);
INSERT INTO public.moon VALUES (4, 'Metis', 5, 43, NULL, false);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, 16, NULL, false);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, 167, NULL, false);
INSERT INTO public.moon VALUES (7, 'Thebe', 5, 98, NULL, false);
INSERT INTO public.moon VALUES (8, 'Io', 5, 3643, NULL, true);
INSERT INTO public.moon VALUES (9, 'Europa', 5, 3121, NULL, true);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, 5268, NULL, true);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, 4820, NULL, true);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 396, NULL, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504, NULL, true);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, NULL, true);
INSERT INTO public.moon VALUES (15, 'Dione', 6, 1123, NULL, true);
INSERT INTO public.moon VALUES (16, 'Rhea', 6, 1527, NULL, true);
INSERT INTO public.moon VALUES (17, 'Titan', 6, 5149, NULL, true);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1470, NULL, true);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1162, NULL, true);
INSERT INTO public.moon VALUES (20, 'Despina', 8, 75, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5, 2439, false);
INSERT INTO public.planet VALUES (2, 'Venus', 5, 6051, false);
INSERT INTO public.planet VALUES (3, 'Earth', 5, 6371, true);
INSERT INTO public.planet VALUES (4, 'Mars', 5, 3389, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, 71492, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, 58232, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 25362, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, 24622, false);
INSERT INTO public.planet VALUES (9, 'Kekfon-3', 1, 6923, false);
INSERT INTO public.planet VALUES (10, 'Kekfon-2', 1, 13482, false);
INSERT INTO public.planet VALUES (11, 'Erimel', 4, 1249, false);
INSERT INTO public.planet VALUES (12, 'Erdan', 3, 4029, false);
INSERT INTO public.planet VALUES (13, 'Black', 6, 1234, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'X0-5', 4, 'Its modern name "Absolutno" comes from a fictional substance in a novel.', 1.08);
INSERT INTO public.star VALUES (3, 'Eridani B', 4, NULL, 0.01);
INSERT INTO public.star VALUES (4, 'Eridani C', 4, NULL, 0.31);
INSERT INTO public.star VALUES (2, 'Eridani A', 4, NULL, 0.81);
INSERT INTO public.star VALUES (5, 'Sol', 4, 'Also known as the sun', 1.00);
INSERT INTO public.star VALUES (6, 'Sirius', 4, 'As the brightest star in the night sky, Sirius appears in some of the earliest astronomical records.', 1.71);


--
-- Data for Name: starclass; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starclass VALUES (1, 'White Dwarf', 'a stellar core remnant composed mostly of electron-degenerate matter');
INSERT INTO public.starclass VALUES (2, 'Red Dwarf', ' smallest kind of star on the main sequence.');
INSERT INTO public.starclass VALUES (3, 'Supergiant', 'A star that runs out of helium will end its life much more dramatically.');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: starclass_starclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starclass_starclass_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: starclass starclass_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starclass
    ADD CONSTRAINT starclass_pkey PRIMARY KEY (starclass_id);


--
-- Name: starclass starclass_starclass_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starclass
    ADD CONSTRAINT starclass_starclass_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

