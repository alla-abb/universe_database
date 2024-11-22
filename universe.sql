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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_id integer,
    mass_relative_to_sun integer,
    distance_from_galaxy_center_in_light_years integer,
    event_horizon_in_kilometers numeric,
    is_active boolean
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    num_of_stars_in_billions integer,
    distance_from_milky_way_in_millions_light_years integer,
    size_in_light_years numeric,
    is_spherical boolean
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
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    planet_id integer,
    diameter_in_km numeric,
    distance_from_planet_in_km integer,
    orbit_period_in_days integer,
    is_geologically_active boolean
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
    name character varying(20) NOT NULL,
    description text,
    star_id integer,
    orbit_period_in_days integer,
    num_of_moons integer,
    raidus_in_km numeric,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(20) NOT NULL,
    description text,
    temperature_in_kelvin integer,
    age_in_millions_of_years integer,
    luminosity_relative_to_sun numeric,
    is_binary_system boolean,
    galaxy_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 'The supermassive black hole at the center of the Milky Way.', 1, 4, 26000, 120000000, true);
INSERT INTO public.black_hole VALUES (2, 'M87*', 'A supermassive black hole in the galaxy M87, famous for the first ever image of a black hole.', 3, 7, 5300, 350000000, true);
INSERT INTO public.black_hole VALUES (3, 'Andromeda A*', 'A supermassive black hole at the center of the Andromeda Galaxy.', 2, 6, 0, 220000000, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The closest spiral galaxy to the Milky Way.', 1, 3, 220000, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', 1, 0, 100000, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'A spiral galaxy in the Canes Venatici constellation.', 1, 23, 60000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A spiral galaxy located in the Virgo Cluster.', 1, 28, 50000, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'A spiral galaxy in the constellation Ursa Major.', 1, 22, 30000, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'A lenticular galaxy in the Centaurus constellation, known for its active galactic nucleus.', 1, 14, 50000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite.', 1, 3474.8, 384400, 27, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of Mars two moons.', 2, 22.4, 9377, 0, true);
INSERT INTO public.moon VALUES (3, 'Io', 'One of Jupiters moons, known for its volcanic activity.', 3, 3643.2, 421800, 2, true);
INSERT INTO public.moon VALUES (4, 'Europa', 'A moon of Jupiter, known for its ice-covered surface and potential for life.', 3, 3121.6, 670900, 4, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'The largest moon in the Solar System, also a moon of Jupiter.', 3, 5268.2, 1070400, 7, false);
INSERT INTO public.moon VALUES (6, 'Titan', 'A large moon of Saturn, known for its thick atmosphere and lakes of methane.', 4, 5150.0, 1221870, 16, true);
INSERT INTO public.moon VALUES (14, 'Leda', 'A small irregular moon of Jupiter, with a retrograde orbit.', 1, 20.0, 11700000, 238, false);
INSERT INTO public.moon VALUES (15, 'Himalia', 'A large irregular moon of Jupiter, part of the planets outer group of moons.', 1, 170.0, 1125000, 250, false);
INSERT INTO public.moon VALUES (16, 'Carme', 'A retrograde moon of Jupiter, located in the planets outermost moon group.', 1, 46.0, 23400000, 750, false);
INSERT INTO public.moon VALUES (17, 'Pasiphae', 'A moon of Jupiter with a retrograde orbit, known for its irregular shape.', 1, 60.0, 23700000, 755, false);
INSERT INTO public.moon VALUES (18, 'Dactyl', 'A small moon of asteroid 243 Ida, discovered by the Galileo spacecraft.', 2, 1.6, 870, 1, false);
INSERT INTO public.moon VALUES (19, 'Deimos', 'The smaller of Mars moons, believed to be captured asteroids.', 3, 12.4, 23460, 1, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 'A highly irregular moon of Neptune with a very eccentric orbit.', 2, 340.0, 5500000, 360, false);
INSERT INTO public.moon VALUES (21, 'Triton', 'A large moon of Neptune, known for its retrograde orbit and active geysers.', 2, 2700.0, 354800, 6, true);
INSERT INTO public.moon VALUES (22, 'Ariel', 'A moon of Uranus, known for its icy surface and evidence of past geological activity.', 4, 1150.0, 191000, 3, true);
INSERT INTO public.moon VALUES (23, 'Umbriel', 'A moon of Uranus, covered in a dark, heavily cratered surface.', 4, 1169.0, 266000, 4, false);
INSERT INTO public.moon VALUES (24, 'Miranda', 'A small moon of Uranus, known for its extreme geological features and large canyons.', 4, 471.0, 129000, 1, true);
INSERT INTO public.moon VALUES (25, 'Iapetus', 'A moon of Saturn, known for its distinctive two-tone coloration and large equatorial ridge.', 4, 1469.0, 3560000, 79, false);
INSERT INTO public.moon VALUES (26, 'Rhea', 'A moon of Saturn, covered with ice and known for its heavily cratered surface.', 4, 1528.0, 527000, 5, false);
INSERT INTO public.moon VALUES (27, 'Mimas', 'A small moon of Saturn, often called the Death Star moon due to a large impact crater.', 4, 396.0, 185000, 1, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun, home to humans.', 2, 365, 1, 6371, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, known as the Red Planet.', 2, 687, 2, 3389, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System.', 2, 4333, 79, 69911, false);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second planet from the Sun, known for its extreme temperatures and thick atmosphere.', 2, 225, 0, 6052, false);
INSERT INTO public.planet VALUES (5, 'Neptune', 'The eighth planet from the Sun, known for its blue color and high winds.', 2, 60190, 14, 24764, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, known for its iconic rings.', 2, 10759, 82, 60268, false);
INSERT INTO public.planet VALUES (51, 'Kepler-22b', 'An exoplanet located in the habitable zone of its star, potentially supporting life.', 1, 290, 0, 14600, true);
INSERT INTO public.planet VALUES (52, 'HD 209458 b', 'An exoplanet known for its atmospheric studies, including possible water vapor.', 2, 4, 0, 13600, false);
INSERT INTO public.planet VALUES (53, 'Proxima b', 'An exoplanet orbiting Proxima Centauri, in the habitable zone of the closest star to the Sun.', 3, 11, 0, 12800, true);
INSERT INTO public.planet VALUES (54, 'Gliese 581g', 'An exoplanet in the Gliese 581 system, considered potentially habitable.', 4, 38, 0, 11600, true);
INSERT INTO public.planet VALUES (55, 'TRAPPIST-1e', 'One of the seven Earth-sized exoplanets in the TRAPPIST-1 system, potentially habitable.', 5, 13, 0, 12000, true);
INSERT INTO public.planet VALUES (56, 'Tau Ceti e', 'An exoplanet located in the habitable zone of the Tau Ceti star.', 6, 168, 0, 11400, true);
INSERT INTO public.planet VALUES (57, 'LHS 1140 b', 'An exoplanet located in the habitable zone of a red dwarf star.', 1, 25, 0, 13600, true);
INSERT INTO public.planet VALUES (58, 'Kepler-62f', 'An exoplanet in the Kepler-62 system, located in the habitable zone and possibly supporting life.', 2, 267, 0, 13400, true);
INSERT INTO public.planet VALUES (59, 'GJ 667Cc', 'An exoplanet located in the habitable zone of the GJ 667C star, possibly Earth-like.', 3, 28, 0, 13000, true);
INSERT INTO public.planet VALUES (60, '55 Cancri e', 'An exoplanet known for its extreme temperature and rocky surface.', 4, 18, 0, 12000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky.', 9940, 120, 25.4, false, 2);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'The closest star to the Sun in the Alpha Centauri system.', 5790, 4500, 1.5, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant in the Orion constellation.', 3500, 800, 100000, false, 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'A star in the Alpha Centauri system, part of a binary pair with Alpha Centauri A.', 5200, 6000, 0.5, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star in the constellation Orion.', 12000, 800, 120000, false, 3);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'The closest known star to the Sun in the Alpha Centauri system.', 3050, 7000, 0.0017, false, 1);


--
-- Name: black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 60, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

