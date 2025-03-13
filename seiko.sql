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
    clock_type_id integer,
    background_image character varying NOT NULL,
    price integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
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

COPY public.watch (id, name, clock_type_id, background_image, price, created_at, updated_at) FROM stdin;
2	Gold Wimbledon	3	https://www.joyeriaolazabal.com/rolex/assets/img/pages/portrait/rolex-watches/watch_assets/upright_watches_assets/m126333-0019_drp-upright-bba-with-shadow.png	260	2025-03-10 12:51:43.112615	2025-03-10 12:51:43.112615
3	Gold	3	https://saphirjoyeros.com/rolex/assets/img/pages/portrait/rolex-watches/watch_assets/upright_watches_assets/m126333-0010_drp-upright-bba-with-shadow.png	260	2025-03-10 12:51:43.112615	2025-03-10 12:51:43.112615
4	Wimbledon	3	https://rolex.ultrajewels.com/media/catalog/product//2/5/257826014_M126201_0013_01_48ab.png	260	2025-03-10 12:51:43.112615	2025-03-10 12:51:43.112615
5	Silver	4	https://www.ap-watches.com/ap-watches/fotos/audemars-piguet-royal-oak-15500st-41mm-nuevo-con-plasticos-id14793-1603465073.png	300	2025-03-10 18:52:33.554348	2025-03-10 18:52:33.554348
9	gold	2	https://media.rolex.com/image/upload/q_auto:eco/f_auto/t_v7-majesty/c_limit,w_3840/v1/catalogue/2024/upright-c/m126618lb-0002	250	2025-03-13 14:27:16.34554	2025-03-13 14:27:16.34554
10	Grey	2	https://media.rolex.com/image/upload/q_auto:eco/f_auto/t_v7-majesty/c_limit,w_3840/v1/catalogue/2024/upright-c/m126610ln-0001	250	2025-03-13 14:27:16.34554	2025-03-13 14:27:16.34554
12	Pepsi	1	https://media.rolex.com/image/upload/q_auto:eco/f_auto/t_v7-majesty/c_limit,w_3840/v1/catalogue/2024/upright-c/m126710blro-0002	280	2025-03-13 14:27:16.34554	2025-03-13 14:27:16.34554
13	Batman	1	https://media.rolex.com/image/upload/q_auto:eco/f_auto/t_v7-majesty/c_limit,w_3840/v1/catalogue/2024/upright-c/m126710blnr-0002	280	2025-03-13 14:27:16.34554	2025-03-13 14:27:16.34554
11	grey-gold	1	https://media.rolex.com/image/upload/q_auto:eco/f_auto/t_v7-majesty/c_limit,w_3840/v1/catalogue/2024/upright-c/m126713grnr-0001	280	2025-03-13 14:27:16.34554	2025-03-13 14:27:16.34554
6	Gold	4	https://www.ap-watches.com/ap-watches/fotos/audemars-piguet-royal-oak-cronografo-25960ba-oro-amarillo-completo-id15309-1669046207.png	300	2025-03-10 18:52:33.554348	2025-03-10 18:52:33.554348
15	Leather	4	https://www.ap-watches.com/ap-watches/fotos/audemars-piguet-royal-oak-15300or-39mm-id14788-1603465523.png	300	2025-03-13 14:32:29.892612	2025-03-13 14:32:29.892612
\.


--
-- Name: clock_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.clock_type_id_seq', 4, true);


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.watch_id_seq', 15, true);


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
-- Name: watch FK_3831ccb0459307ecfb1faa9db5f; Type: FK CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT "FK_3831ccb0459307ecfb1faa9db5f" FOREIGN KEY (clock_type_id) REFERENCES public.clock_type(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

