--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: clock_type; Type: TABLE; Schema: public; Owner: seikomoduser
--

CREATE TABLE public.clock_type (
    id integer NOT NULL,
    name character varying NOT NULL,
    tittle character varying NOT NULL,
    description character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    background_image character varying NOT NULL
);


ALTER TABLE public.clock_type OWNER TO seikomoduser;

--
-- Name: clock_type_id_seq; Type: SEQUENCE; Schema: public; Owner: seikomoduser
--

ALTER TABLE public.clock_type ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clock_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: watch; Type: TABLE; Schema: public; Owner: seikomoduser
--

CREATE TABLE public.watch (
    id integer NOT NULL,
    name character varying NOT NULL,
    clock_type_id integer NOT NULL,
    background_image character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    price integer NOT NULL
);


ALTER TABLE public.watch OWNER TO seikomoduser;

--
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: seikomoduser
--

ALTER TABLE public.watch ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: clock_type; Type: TABLE DATA; Schema: public; Owner: seikomoduser
--

COPY public.clock_type (id, name, tittle, description, created_at, updated_at, background_image) FROM stdin;
2	Submarine	Submarine	El submarine surman	2025-03-06 10:36:29.441138	2025-03-06 10:36:29.441138	https://www.joyeriamarcos.com/img/models/landscape/rolex-collection_banner-submariner.jpg
1	GMT-Master II	GMT-Master II\n	El reloj de los masters	2025-03-06 10:36:29.441138	2025-03-06 10:36:29.441138	https://www.rabat.net/es/magazine/wp-content/uploads/2024/12/2000x920.jpg
4	Royal Oak	Royal Oak	Pues un Royal Oak	2025-03-06 13:10:04.375361	2025-03-06 13:10:04.375361	https://swisswatches-magazine.com/wp-content/uploads/2021/03/AP-Royal-Oak-Selfwinding-Flying-Tourbillon-in-Titanium-26530Ti.jpg
3	Datejust	Aquí estoy porque he venido\n	Porque he venido aquí estoy\n\n	2025-03-06 10:05:29.441138	2025-03-06 10:05:29.441138	https://media.rolex.com/image/upload/v1725888690/rolexcom/collection/configurator/config-launcher/2024/config-launcher-watches-day-date-m228235-0055_2403jva_002.jpg
\.


--
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: seikomoduser
--

COPY public.watch (id, name, clock_type_id, background_image, created_at, updated_at, price) FROM stdin;
\.


--
-- Name: clock_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.clock_type_id_seq', 4, true);


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.watch_id_seq', 1, false);


--
-- Name: clock_type clock_type_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.clock_type
    ADD CONSTRAINT clock_type_pkey PRIMARY KEY (id);


--
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: watch watch_clock_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_clock_type_fk FOREIGN KEY (clock_type_id) REFERENCES public.clock_type(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

