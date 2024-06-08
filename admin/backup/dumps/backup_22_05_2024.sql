--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-22 14:24:04

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
-- TOC entry 226 (class 1255 OID 57750)
-- Name: ajouter_commande(numeric, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajouter_commande(p_montant numeric, p_id_voiture integer, p_id_client integer) RETURNS void
    LANGUAGE plpgsql
    AS '
BEGIN
    INSERT INTO commande (id_commande, montant, id_voiture, id_client)
    VALUES (nextval(''commande_id_commande_seq''), p_montant, p_id_voiture, p_id_client);
END;
';


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
-- TOC entry 4823 (class 0 OID 0)
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
-- TOC entry 4824 (class 0 OID 0)
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
-- TOC entry 4825 (class 0 OID 0)
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
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 215
-- Name: voiture_id_voiture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voiture_id_voiture_seq OWNED BY public.voiture.id_voiture;


--
-- TOC entry 4655 (class 2604 OID 57724)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 57715)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 57733)
-- Name: commande id_commande; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);


--
-- TOC entry 4653 (class 2604 OID 57706)
-- Name: voiture id_voiture; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture ALTER COLUMN id_voiture SET DEFAULT nextval('public.voiture_id_voiture_seq'::regclass);


--
-- TOC entry 4815 (class 0 OID 57721)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password) VALUES (1, 'yahia', 'yahia');


--
-- TOC entry 4813 (class 0 OID 57712)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (1, 'jansens', 'loic', 'rue de la loi', 12, 1000, 418246376, 'jansens.loic@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (2, 'Dubois', 'Marc', 'rue ferrer', 78, 7100, 418243920, 'dubois.marc@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (3, 'Dupont', 'Jean', 'Rue de l eglise', 12, 1000, 475123456, 'jean.dupont@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (4, 'Martin', 'Marie', 'Avenue Louise', 34, 1050, 475123457, 'marie.martin@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (5, 'Lefebvre', 'Luc', 'Boulevard du Roi', 56, 1060, 475123458, 'luc.lefebvre@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (6, 'Lambert', 'Sophie', 'Rue Neuve', 78, 1070, 475123459, 'sophie.lambert@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (7, 'Simon', 'Nathalie', 'Place du Jeu de Balle', 90, 1080, 475123460, 'nathalie.simon@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (8, 'Dubois', 'Michel', 'Rue des Palais', 23, 1090, 475123461, 'michel.dubois@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (9, 'Laurent', 'Catherine', 'Chaussée de Waterloo', 45, 1150, 475123462, 'catherine.laurent@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (10, 'Legrand', 'Pierre', 'Avenue de la Toison d or', 67, 1160, 475123463, 'pierre.legrand@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (11, 'Dupuis', 'Julie', 'Rue de la Loi', 89, 1170, 475123464, 'julie.dupuis@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (12, 'Vandenberg', 'Alexandre', 'Boulevard de Waterloo', 101, 1180, 475123465, 'alexandre.vandenberg@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (13, 'Petit', 'Isabelle', 'Rue Royale', 34, 1190, 475123466, 'isabelle.petit@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (14, 'Jacobs', 'Laurent', 'Place Stéphanie', 56, 1200, 475123467, 'laurent.jacobs@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (15, 'Mertens', 'Caroline', 'Avenue des Arts', 78, 1210, 475123468, 'caroline.mertens@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (16, 'Lemoine', 'Vincent', 'Chaussée de Charleroi', 90, 1220, 475123469, 'vincent.lemoine@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (17, 'Fournier', 'Valérie', 'Rue de la Montagne', 23, 1230, 475123470, 'valerie.fournier@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (18, 'Mercier', 'Antoine', 'Boulevard Anspach', 45, 1240, 475123471, 'antoine.mercier@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (19, 'Blanchard', 'Sandrine', 'Avenue Fonsny', 67, 1250, 475123472, 'sandrine.blanchard@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (20, 'Moreau', 'Eric', 'Rue des Bouchers', 89, 1260, 475123473, 'eric.moreau@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (21, 'Fauconnier', 'Claire', 'Place de Brouckère', 101, 1270, 475123474, 'claire.fauconnier@example.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (22, 'Leroy', 'Marc', 'Boulevard du Midi', 34, 1280, 475123475, 'marc.leroy@example.com');


--
-- TOC entry 4817 (class 0 OID 57730)
-- Dependencies: 222
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.commande (id_commande, montant, id_voiture, id_client) VALUES (2, 22500.00, 1, 1);
INSERT INTO public.commande (id_commande, montant, id_voiture, id_client) VALUES (3, 20000.50, 3, 2);
INSERT INTO public.commande (id_commande, montant, id_voiture, id_client) VALUES (15, 100000.00, 19, 10);


--
-- TOC entry 4811 (class 0 OID 57703)
-- Dependencies: 216
-- Data for Name: voiture; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (1, 'Audi', 'A4', 2021, 'bleu', 30000.00, 40000, 'Essence', 'manuel', 'voiture17.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (4, 'Bmw
', 'serie3', 2020, 'noir', 49000.00, 35000, 'Diesel', 'Automatique', 'voiture10.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (7, 'Audi', 'a3', 2019, 'noir', 40000.00, 20000, 'diesel', 'automatique', 'voiture16.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (5, 'Mercedes', 'Classe a', 2020, 'Noir', 75000.00, 25000, 'Essence', 'Manuelle', 'voiture1.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (15, 'Porsche', '911 Carrera', 2020, 'Noir', 120000.00, 15000, 'Essence', 'Automatique', 'voiture3.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (18, 'Audi', 'R8', 2022, 'Gris', 150000.00, 5000, 'Essence', 'Automatique', 'voiture12.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (19, 'Porsche', 'Taycan', 2021, 'Rouge', 110000.00, 8000, 'Électrique', 'Automatique', 'voiture8.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (22, 'Audi', 'RS7', 2021, 'Noir', 115000.00, 11000, 'Essence', 'Automatique', 'voiture11.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (23, 'Porsche', 'Panamera', 2020, 'Bleu', 125000.00, 14000, 'Essence', 'Automatique', 'voiture6.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (3, 'Mercedes', 'a45s', 2023, 'blanc', 78000.00, 15000, 'Essence', 'automatique', 'voiture11.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (13, 'Bmw', 'serie 6', 2020, 'rouge', 102000.00, 1000, 'essence', 'automatique', 'voiture6.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (16, 'Bmw', 'M4', 2019, 'Bleu', 90000.00, 20000, 'Essence', 'Automatique', 'voiture14.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (17, 'Mercedes', 'AMG GT', 2021, 'Blanc', 130000.00, 10000, 'Essence', 'Automatique', 'voiture7.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (20, 'Bmw', 'M8', 2020, 'Vert', 140000.00, 12000, 'Essence', 'Automatique', 'voiture5.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (21, 'Mercedes', 'C63 AMG', 2019, 'Jaune', 95000.00, 25000, 'Essence', 'Automatique', 'voiture20.jpg');
INSERT INTO public.voiture (id_voiture, marque, modele, annee, couleur, prix, kilometrage, carburant, type_boite, image) VALUES (24, 'Bmw', 'i8', 2019, 'Blanc', 100000.00, 22000, 'Hybride', 'Automatique', 'voiture19.jpg');


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 22, true);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 221
-- Name: commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commande_id_commande_seq', 15, true);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 215
-- Name: voiture_id_voiture_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voiture_id_voiture_seq', 24, true);


--
-- TOC entry 4662 (class 2606 OID 57728)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4660 (class 2606 OID 57719)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4664 (class 2606 OID 57735)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 4658 (class 2606 OID 57710)
-- Name: voiture voiture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_pkey PRIMARY KEY (id_voiture);


--
-- TOC entry 4665 (class 2606 OID 57741)
-- Name: commande commande_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4666 (class 2606 OID 57736)
-- Name: commande commande_id_voiture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_voiture_fkey FOREIGN KEY (id_voiture) REFERENCES public.voiture(id_voiture);


-- Completed on 2024-05-22 14:24:04

--
-- PostgreSQL database dump complete
--

