--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_galaxy;
ALTER TABLE ONLY public.star DROP CONSTRAINT fk_star_galaxy;
ALTER TABLE ONLY public.planet DROP CONSTRAINT fk_planet_star;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE ONLY public.description DROP CONSTRAINT description_pkey;
ALTER TABLE ONLY public.description DROP CONSTRAINT description_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.description ALTER COLUMN description_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.description_description_id_seq;
DROP TABLE public.description;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    name character varying(50) NOT NULL,
    description_id integer NOT NULL,
    has_life_ boolean,
    description text NOT NULL,
    unknown_planets integer,
    mahal_kita_times integer
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_million_years numeric(9,2)
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    planet_id integer,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    star_id integer,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    galaxy_id integer,
    is_spherical boolean
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.description (name, description_id, has_life_, description, unknown_planets, mahal_kita_times) FROM stdin;
Aurora Prime	1	t	A vibrant world with glowing forests.	3	12
Nerthus	2	f	Cold barren planet with icy storms.	7	4
Solara	3	t	Desert planet with ancient ruins.	2	20
Krylon	4	f	Toxic atmosphere and volcanic landscape.	5	1
Elyndra	5	t	Ocean world full of bioluminescent species.	4	33
Draxion	6	f	Rocky world constantly hit by meteors.	6	2
Virella	7	t	Planet covered in massive jungles.	1	18
Obsidion	8	f	Black-sand world with magnetic storms.	8	7
Thalora	9	t	Temperate world with vast plains.	2	25
Mystral	10	f	Shrouded in eternal fog, little is known.	9	3
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, description, is_spherical, age_in_million_years) FROM stdin;
1	Milky Way	Our home galaxy, a barred spiral filled with billions of stars.	t	13.60
2	Andromeda	Nearest major galaxy and on a collision course with the Milky Way.	t	10.10
3	Triangulum Galaxy	A small spiral galaxy that is part of our Local Group.	t	12.00
4	Whirlpool Galaxy	Famous spiral galaxy known for its striking appearance.	t	8.00
5	Sombrero Galaxy	Bright galaxy with a large central bulge and dark dust lanes.	t	9.00
6	Pinwheel Galaxy	A large face-on spiral galaxy with many star-forming regions.	t	10.00
7	Centaurus A	A peculiar galaxy with an active supermassive black hole.	f	13.00
8	Messier 87	A giant elliptical galaxy with a huge jet coming from its black hole.	t	13.70
9	Cartwheel Galaxy	Ring galaxy formed by a past galactic collision.	f	9.50
10	Black Eye Galaxy	Spiral galaxy with a dark band of absorbing dust.	t	12.50
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, description, planet_id, is_spherical) FROM stdin;
1	Moon	Earth’s natural satellite, the fifth largest moon in the solar system.	3	t
2	Phobos	A small, irregularly shaped moon of Mars.	4	f
3	Deimos	The smaller and outer moon of Mars.	4	f
4	Kepler-22b I	A rocky moon orbiting the super-Earth Kepler-22b.	5	t
5	Kepler-22b II	Icy moon with a thin frozen crust.	5	t
6	Sirius-1a	Molten surface moon orbiting a hot exoplanet.	6	f
7	Sirius-1b	Small metallic moon with a reflective surface.	6	f
8	Betelgeuse I Alpha	A dusty moon forming within a turbulent stellar region.	7	f
9	Betelgeuse I Beta	A crater-covered rocky moon.	7	f
10	Betelgeuse II Alpha	A scorched moon affected by stellar radiation.	8	f
11	Betelgeuse II Theta	A partially molten moon with an unstable orbit.	8	f
12	Rigel I Titan	A thick-atmosphere moon similar to Saturn’s Titan.	9	t
13	Rigel I Echo	A cold moon covered in nitrogen ice.	9	t
14	Rigel II Prime	A gas giant moon with layered cloud bands.	10	t
15	Rigel II Minor	A tiny icy moon with geysers.	10	f
16	Vega I Alpha	A bright reflective moon forming in a young system.	11	t
17	Vega I Delta	A small moon with a rapidly decaying orbit.	11	f
18	Vega II Prime	Rocky moon orbiting the inner Vega planet.	12	t
19	Vega II Gamma	A dark, carbon-rich moon.	12	f
20	Vega II Omega	A captured asteroid moon.	12	f
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, star_id, is_spherical) FROM stdin;
1	Mercury	Small rocky planet closest to the Sun.	1	t
2	Venus	Hot, cloud-covered planet often called Earth’s twin.	1	t
3	Earth	Only known planet to support life.	1	t
4	Mars	Cold desert world with signs of ancient water.	1	t
5	Kepler-22b	A super-Earth orbiting in a habitable zone.	2	t
6	Sirius b Orbit One	A hypothetical rocky planet around Sirius.	2	t
7	Betelgeuse I	Dusty planet forming around a red supergiant.	3	f
8	Betelgeuse II	Molten surface world heated by the unstable star.	3	f
9	Rigel I	Icy planet far from its massive parent star.	4	t
10	Rigel II	Gas giant orbiting the blue supergiant.	4	t
11	Vega I	A young world forming in a bright debris disk.	5	t
12	Vega II	Rocky exoplanet in the Vega system.	5	t
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, description, galaxy_id, is_spherical) FROM stdin;
1	Sun	A G-type main-sequence star and the center of our Solar System.	1	t
2	Sirius	The brightest star in the night sky, located in the Milky Way.	1	t
3	Betelgeuse	A massive red supergiant star nearing the end of its life.	2	t
4	Rigel	A luminous blue supergiant star in the Orion constellation.	2	t
5	Vega	A bright A-type star located in the Lyra constellation.	3	t
6	Altair	A rapidly rotating star in the Aquila constellation.	3	t
7	Arcturus	A red giant star in the Boötes constellation.	4	t
8	Capella	A bright yellow giant star in the Auriga constellation.	4	t
9	Deneb	One of the largest known white supergiants.	5	t
10	Antares	A massive red supergiant star located in the Scorpius constellation.	5	t
\.


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


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
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_galaxy FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

