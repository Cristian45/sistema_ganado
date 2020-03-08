--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2020-03-08 10:40:46

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

--
-- TOC entry 201 (class 1259 OID 24886)
-- Name: ani_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ani_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ani_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 24849)
-- Name: animales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animales (
    ani_id numeric(30,0) DEFAULT nextval('public.ani_seq'::regclass) NOT NULL,
    nombre character varying NOT NULL,
    tipo character varying NOT NULL
);


ALTER TABLE public.animales OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24880)
-- Name: ubi_ani_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubi_ani_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ubi_ani_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24883)
-- Name: ubi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ubi_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24857)
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion (
    ubi_id numeric(30,0) DEFAULT nextval('public.ubi_seq'::regclass) NOT NULL,
    latitud real,
    longitud real,
    tipo character varying NOT NULL
);


ALTER TABLE public.ubicacion OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24865)
-- Name: ubicacion_animal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion_animal (
    ubi_ani_id numeric(30,0) DEFAULT nextval('public.ubi_ani_seq'::regclass) NOT NULL,
    ani_id numeric(30,0),
    ubi_id numeric(30,0),
    cantidad numeric(30,0)
);


ALTER TABLE public.ubicacion_animal OWNER TO postgres;

--
-- TOC entry 2831 (class 0 OID 24849)
-- Dependencies: 196
-- Data for Name: animales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animales (ani_id, nombre, tipo) FROM stdin;
1	VACA	TIPO A
2	TORO	TIPO B
\.


--
-- TOC entry 2832 (class 0 OID 24857)
-- Dependencies: 197
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion (ubi_id, latitud, longitud, tipo) FROM stdin;
1	4.30000019	2.5999999	TIPO A
2	4.30000019	2.5999999	DEFORESTACION
3	4.30000019	2.5999999	CAMBIO DE COBERTURA
\.


--
-- TOC entry 2833 (class 0 OID 24865)
-- Dependencies: 198
-- Data for Name: ubicacion_animal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion_animal (ubi_ani_id, ani_id, ubi_id, cantidad) FROM stdin;
1	1	1	4
2	1	2	4
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 201
-- Name: ani_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ani_seq', 1, false);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 199
-- Name: ubi_ani_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubi_ani_seq', 2, true);


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 200
-- Name: ubi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubi_seq', 3, true);


--
-- TOC entry 2703 (class 2606 OID 24856)
-- Name: animales key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animales
    ADD CONSTRAINT key1 PRIMARY KEY (ani_id);


--
-- TOC entry 2705 (class 2606 OID 24864)
-- Name: ubicacion key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT key2 PRIMARY KEY (ubi_id);


--
-- TOC entry 2707 (class 2606 OID 24869)
-- Name: ubicacion_animal key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_animal
    ADD CONSTRAINT key3 PRIMARY KEY (ubi_ani_id);


--
-- TOC entry 2708 (class 2606 OID 24870)
-- Name: ubicacion_animal ubicacion_animal_animal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_animal
    ADD CONSTRAINT ubicacion_animal_animal FOREIGN KEY (ani_id) REFERENCES public.animales(ani_id);


--
-- TOC entry 2709 (class 2606 OID 24875)
-- Name: ubicacion_animal ubicacion_animal_ubicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion_animal
    ADD CONSTRAINT ubicacion_animal_ubicacion FOREIGN KEY (ubi_id) REFERENCES public.ubicacion(ubi_id);


-- Completed on 2020-03-08 10:40:47

--
-- PostgreSQL database dump complete
--

