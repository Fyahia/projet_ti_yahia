--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-14 12:06:36

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
-- TOC entry 225 (class 1255 OID 57749)
-- Name: ajouter_voiture(text, text, integer, text, numeric, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajouter_voiture(p_marque text, p_modele text, p_annee integer, p_couleur text, p_prix numeric, p_kilometrage integer, p_carburant text, p_type_boite text, p_image text) RETURNS void
    LANGUAGE plpgsql
    AS '
BEGIN
    INSERT INTO voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image)
    VALUES (nextval(''voiture_id_voiture_seq''), p_marque, p_modele, p_annee, p_couleur, p_prix, p_kilometrage, p_carburant, p_type_boite, p_image);
END;
';


--
-- TOC entry 224 (class 1255 OID 57748)
-- Name: delete_voiture(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.delete_voiture(p_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    DELETE FROM voiture WHERE id_voiture = p_id;
    RETURN 1;
END;
';


--
-- TOC entry 223 (class 1255 OID 57746)
-- Name: update_voiture(integer, text, text, integer, text, numeric, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_voiture(p_id_voiture integer, p_marque text, p_modele text, p_annee integer, p_couleur text, p_prix numeric, p_kilometrage integer, p_carburant text, p_type_boite text, p_image text) RETURNS integer
    LANGUAGE plpgsql
    AS '
BEGIN
    EXECUTE format(''UPDATE voiture SET marque = %L, modele = %L, annee = %L, couleur = %L, prix = %L, kilometrage = %L, carburant = %L, type_boite = %L, image = %L WHERE id_voiture = %L'', p_marque, p_modele, p_annee, p_couleur, p_prix, p_kilometrage, p_carburant, p_type_boite, p_image, p_id_voiture);
    RETURN 1;
END;
';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 57721)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 57720)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 57712)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text NOT NULL,
    prenom text NOT NULL,
    nom_rue text,
    num_rue integer,
    code_postal integer,
    num_tel integer,
    mail text
);


--
-- TOC entry 217 (class 1259 OID 57711)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 222 (class 1259 OID 57730)
-- Name: commande; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commande (
    id_commande integer NOT NULL,
    montant numeric(15,2) NOT NULL,
    id_voiture integer,
    id_client integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 57729)
-- Name: commande_id_commande_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commande_id_commande_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 221
-- Name: commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;


--
-- TOC entry 216 (class 1259 OID 57703)
-- Name: voiture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voiture (
    id_voiture integer NOT NULL,
    marque text NOT NULL,
    modele text NOT NULL,
    annee integer NOT NULL,
    couleur text NOT NULL,
    prix numeric(15,2) NOT NULL,
    kilometrage integer NOT NULL,
    carburant text NOT NULL,
    type_boite text NOT NULL,
    image text
);


--
-- TOC entry 215 (class 1259 OID 57702)
-- Name: voiture_id_voiture_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voiture_id_voiture_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 215
-- Name: voiture_id_voiture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voiture_id_voiture_seq OWNED BY public.voiture.id_voiture;


--
-- TOC entry 4654 (class 2604 OID 57724)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 57715)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 57733)
-- Name: commande id_commande; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 57706)
-- Name: voiture id_voiture; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture ALTER COLUMN id_voiture SET DEFAULT nextval('public.voiture_id_voiture_seq'::regclass);


--
-- TOC entry 4814 (class 0 OID 57721)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password) VALUES (1, 'yahia', 'yahia');


--
-- TOC entry 4812 (class 0 OID 57712)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (1, 'jansens', 'loic', 'rue de la loi', 12, 1000, 418246376, 'jansens.loic@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (2, 'Dubois', 'Marc', 'rue ferrer', 78, 7100, 418243920, 'dubois.marc@gmail.com');


--
-- TOC entry 4816 (class 0 OID 57730)
-- Dependencies: 222
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.commande (id_commande, montant, id_voiture, id_client) VALUES (2, 22500.00, 1, 1);


--
-- TOC entry 4810 (class 0 OID 57703)
-- Dependencies: 216
-- Data for Name: voiture; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (1, 'Audi', 'A4', 2021, 'bleu', 30000.00, 40000, 'Essence', 'manuel', 'voiture17.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (3, 'mercedes ', 'a45s', 2023, 'blanc', 78000.00, 15000, 'Essence', 'automatique', 'voiture11.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (4, 'Bmw
', 'serie3', 2020, 'noir', 49000.00, 35000, 'Diesel', 'Automatique', 'voiture10.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (5, 'Mercedes', 'Classe e', 2020, 'Noir', 75000.00, 25000, 'Essence', 'Manuelle', 'voiture9.jpg');


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 2, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 221
-- Name: commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commande_id_commande_seq', 2, true);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 215
-- Name: voiture_id_voiture_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voiture_id_voiture_seq', 5, true);


--
-- TOC entry 4661 (class 2606 OID 57728)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4659 (class 2606 OID 57719)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4663 (class 2606 OID 57735)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 4657 (class 2606 OID 57710)
-- Name: voiture voiture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_pkey PRIMARY KEY (id_voiture);


--
-- TOC entry 4664 (class 2606 OID 57741)
-- Name: commande commande_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4665 (class 2606 OID 57736)
-- Name: commande commande_id_voiture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_voiture_fkey FOREIGN KEY (id_voiture) REFERENCES public.voiture(id_voiture);


-- Completed on 2024-05-14 12:06:36

--
-- PostgreSQL database dump complete
--

