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
-- Name: mail_config; Type: TABLE; Schema: public; Owner: seikomoduser
--

CREATE TABLE public.mail_config (
    id integer NOT NULL,
    name name NOT NULL,
    content character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.mail_config OWNER TO seikomoduser;

--
-- Name: mail_config_id_seq; Type: SEQUENCE; Schema: public; Owner: seikomoduser
--

ALTER TABLE public.mail_config ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mail_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: seikomoduser
--

CREATE TABLE public.purchase (
    id integer NOT NULL,
    mail character varying NOT NULL,
    total integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.purchase OWNER TO seikomoduser;

--
-- Name: purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: seikomoduser
--

ALTER TABLE public.purchase ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_watch; Type: TABLE; Schema: public; Owner: seikomoduser
--

CREATE TABLE public.purchase_watch (
    purchase_id integer NOT NULL,
    watch_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.purchase_watch OWNER TO seikomoduser;

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
-- Data for Name: mail_config; Type: TABLE DATA; Schema: public; Owner: seikomoduser
--

COPY public.mail_config (id, name, content, created_at) FROM stdin;
2	purchase-content	<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>Confirmación del pedido</title> </head> <body style="font-family: Arial, sans-serif; background-color: rgb(163, 163, 163); padding: 20px; margin: 0;"> <div style="max-width: 600px; margin: 0 auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);"> <h2 style="text-align: center; font-size: 1.5rem; font-weight: bold;">Confirmación del pedido</h2> <div style="margin-bottom: 20px;"> <h3 style="font-size: 1.25rem; font-weight: bold;">Productos</h3> ${htmlItem} </div> <div style="margin-bottom: 20px;"> <h3 style="font-size: 1.25rem; font-weight: bold;">Dirección de entrega</h3> <p>${payObject.direcion.nombre} ${payObject.direcion.apellidos}, ${payObject.direcion.telefono}</p> <p>${payObject.direcion.direcion}</p> <p>${payObject.direcion.ciudad}, ${payObject.direcion.localidad}, ${payObject.direcion.cp}</p> </div> <div style="margin-bottom: 20px;"> <h3 style="font-size: 1.25rem; font-weight: bold;">Resumen</h3> <p>Total: <strong>${payObject.payment.pay}€</strong></p> </div> </div> </body> </html>	2025-03-14 12:24:53.861993+01
1	watch-item	<table style="width: 100%; margin-bottom: 20px; padding: 15px; border-bottom: 1px solid #ddd;"> <tr> <td style="width: 120px; text-align: center;"> <img src="${w.background_image}" alt="${w.name}" style="width: 120px; height: 120px; object-fit: contain; margin-bottom: 10px;"> </td> <td style="padding-left: 20px; text-align: left;"> <p style="font-weight: bold; font-size: 1.2rem; margin: 0;">${w.name}</p> <p style="color: #555;">${w.price}€</p> </td> <td style="text-align: center;"> <p style="font-weight: bold; font-size: 1.25rem; margin: 0;">${find.amount}</p> </td> </tr> </table>	2025-03-14 12:22:29.733107+01
\.


--
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: seikomoduser
--

COPY public.purchase (id, mail, total, created_at) FROM stdin;
1	2@2.com	260	2025-03-14 11:10:11.491716
2	cvb016@gmail.com	520	2025-03-14 11:15:59.287262
3	cvb016@gmail.com	500	2025-03-14 11:19:18.39606
4	cvb016@gmail.com	520	2025-03-14 12:14:53.029897
5	cvb016@gmail.com	820	2025-03-14 12:30:38.205671
6	cvb016@gmail.com	520	2025-03-14 13:17:13.555377
7	cvb016@gmai.com	260	2025-03-14 13:21:46.848996
8	cvb016@gmail.com	260	2025-03-14 13:26:24.213469
9	cvb016@gmail.com	260	2025-03-14 13:30:56.677419
10	cvb016@gmila.com	1080	2025-03-14 13:33:33.998628
\.


--
-- Data for Name: purchase_watch; Type: TABLE DATA; Schema: public; Owner: seikomoduser
--

COPY public.purchase_watch (purchase_id, watch_id, amount) FROM stdin;
1	2	1
2	2	2
3	9	1
3	10	1
4	3	1
4	4	1
5	4	1
5	2	1
5	5	1
6	2	1
6	3	1
7	3	1
8	3	1
9	3	1
10	2	1
10	3	1
10	4	1
10	6	1
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
-- Name: mail_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.mail_config_id_seq', 2, true);


--
-- Name: purchase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seikomoduser
--

SELECT pg_catalog.setval('public.purchase_id_seq', 10, true);


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
-- Name: mail_config mail_config_name_unique; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.mail_config
    ADD CONSTRAINT mail_config_name_unique UNIQUE (name);


--
-- Name: mail_config mail_config_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.mail_config
    ADD CONSTRAINT mail_config_pkey PRIMARY KEY (id);


--
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- Name: purchase_watch purchase_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.purchase_watch
    ADD CONSTRAINT purchase_watch_pkey PRIMARY KEY (purchase_id, watch_id);


--
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: purchase_watch FK_0bd088f0efe4af6a53634d6aae9; Type: FK CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.purchase_watch
    ADD CONSTRAINT "FK_0bd088f0efe4af6a53634d6aae9" FOREIGN KEY (purchase_id) REFERENCES public.purchase(id);


--
-- Name: watch FK_3831ccb0459307ecfb1faa9db5f; Type: FK CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT "FK_3831ccb0459307ecfb1faa9db5f" FOREIGN KEY (clock_type_id) REFERENCES public.clock_type(id) ON DELETE CASCADE;


--
-- Name: purchase_watch FK_8bac603ec7a9a3a1233964115f0; Type: FK CONSTRAINT; Schema: public; Owner: seikomoduser
--

ALTER TABLE ONLY public.purchase_watch
    ADD CONSTRAINT "FK_8bac603ec7a9a3a1233964115f0" FOREIGN KEY (watch_id) REFERENCES public.watch(id);


--
-- PostgreSQL database dump complete
--

