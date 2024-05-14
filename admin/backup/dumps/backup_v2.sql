--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-28 13:45:15

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
-- TOC entry 220 (class 1259 OID 57552)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 57551)
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
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 57543)
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
-- TOC entry 217 (class 1259 OID 57542)
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
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 222 (class 1259 OID 57580)
-- Name: commande; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commande (
    id_commande integer NOT NULL,
    montant numeric(15,2) NOT NULL,
    id_voiture integer,
    id_client integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 57579)
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
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 221
-- Name: commande_id_commande_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commande_id_commande_seq OWNED BY public.commande.id_commande;


--
-- TOC entry 216 (class 1259 OID 57525)
-- Name: marque; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marque (
    id_marque integer NOT NULL,
    marque text NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 57524)
-- Name: marque_id_marque_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marque_id_marque_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 215
-- Name: marque_id_marque_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marque_id_marque_seq OWNED BY public.marque.id_marque;


--
-- TOC entry 224 (class 1259 OID 57597)
-- Name: modele; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modele (
    id_modele integer NOT NULL,
    modele text NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 57596)
-- Name: modele_id_modele_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modele_id_modele_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 223
-- Name: modele_id_modele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modele_id_modele_seq OWNED BY public.modele.id_modele;


--
-- TOC entry 226 (class 1259 OID 57609)
-- Name: voiture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voiture (
    id_voiture integer NOT NULL,
    annee integer NOT NULL,
    couleur text NOT NULL,
    prix numeric(15,2) NOT NULL,
    kilometrage integer NOT NULL,
    carburant text NOT NULL,
    type_boite text NOT NULL,
    id_modele integer NOT NULL,
    id_marque integer NOT NULL,
    image text
);


--
-- TOC entry 225 (class 1259 OID 57608)
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
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 225
-- Name: voiture_id_voiture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voiture_id_voiture_seq OWNED BY public.voiture.id_voiture;


--
-- TOC entry 4661 (class 2604 OID 57555)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 57546)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 57583)
-- Name: commande id_commande; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande ALTER COLUMN id_commande SET DEFAULT nextval('public.commande_id_commande_seq'::regclass);


--
-- TOC entry 4659 (class 2604 OID 57528)
-- Name: marque id_marque; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque ALTER COLUMN id_marque SET DEFAULT nextval('public.marque_id_marque_seq'::regclass);


--
-- TOC entry 4663 (class 2604 OID 57600)
-- Name: modele id_modele; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modele ALTER COLUMN id_modele SET DEFAULT nextval('public.modele_id_modele_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 57612)
-- Name: voiture id_voiture; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture ALTER COLUMN id_voiture SET DEFAULT nextval('public.voiture_id_voiture_seq'::regclass);


--
-- TOC entry 4828 (class 0 OID 57552)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, login, password) VALUES (1, 'yahia', 'yahia');


--
-- TOC entry 4826 (class 0 OID 57543)
-- Dependencies: 218
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (1, 'Dupont', 'Jean', 'Rue de la Liberté', 12, 1000, 466184927, 'jean.dupont@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (2, 'Lambert', 'Sophie', 'Avenue des Roses', 8, 1050, 466184927, 'sophie.lambert@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (3, 'Martin', 'Pierre', 'Rue du Moulin', 5, 5000, 466184927, 'pierre.martin@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (4, 'Dubois', 'Marie', 'Chaussée de Bruxelles', 20, 1060, 466184927, 'marie.dubois@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (5, 'Leclerc', 'Thomas', 'Rue de Namur', 15, 6000, 466184927, 'thomas.leclerc@hotmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (6, 'Garcia', 'Ana', 'Avenue Louise', 35, 1000, 466184927, 'ana.garcia@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (7, 'Fournier', 'Philippe', 'Rue de la Paix', 7, 1050, 466184927, 'philippe.fournier@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (8, 'Boucher', 'Isabelle', 'Rue des Lilas', 42, 5000, 466184927, 'isabelle.boucher@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (9, 'Moreau', 'Luc', 'Rue des Cerisiers', 18, 1060, 466184927, 'luc.moreau@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (10, 'Rousseau', 'Catherine', 'Avenue de la Libération', 22, 6000, 466184927, 'catherine.rousseau@hotmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (11, 'Lefevre', 'Paul', 'Rue Royale', 9, 1000, 466184927, 'paul.lefevre@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (12, 'Petit', 'Sylvie', 'Avenue du Parc', 14, 1050, 466184927, 'sylvie.petit@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (13, 'Rogers', 'David', 'Boulevard des Roses', 30, 5000, 466184927, 'david.rogers@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (14, 'Baker', 'Laura', 'Rue des Tulipes', 25, 1060, 466184927, 'laura.baker@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (15, 'Gauthier', 'Jean-Pierre', 'Avenue des Champs', 17, 6000, 466184927, 'jeanpierre.gauthier@hotmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (16, 'Lavoie', 'Marie-Claude', 'Rue de la République', 6, 1000, 466184927, 'marieclaude.lavoie@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (17, 'Caron', 'Lucie', 'Rue des Érables', 19, 1050, 466184927, 'lucie.caron@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (18, 'Bernard', 'François', 'Avenue du Soleil', 23, 5000, 466184927, 'francois.bernard@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (19, 'Thompson', 'Emily', 'Chaussée de Charleroi', 28, 1060, 466184927, 'emily.thompson@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (20, 'Lévesque', 'Jacques', 'Boulevard du Midi', 11, 6000, 466184927, 'jacques.levesque@hotmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (21, 'Roy', 'Valérie', 'Rue de la Gare', 3, 1000, 466184927, 'valerie.roy@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (22, 'Tremblay', 'Michel', 'Avenue des Hêtres', 16, 1050, 466184927, 'michel.tremblay@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (23, 'Fortin', 'Élise', 'Rue des Alouettes', 24, 5000, 466184927, 'elise.fortin@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (24, 'Morin', 'Robert', 'Avenue des Acacias', 10, 1060, 466184927, 'robert.morin@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (25, 'Dubé', 'Sylvain', 'Rue de la Montagne', 13, 6000, 466184927, 'sylvain.dube@hotmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (26, 'Pelletier', 'Nathalie', 'Rue des Platanes', 21, 1000, 466184927, 'nathalie.pelletier@gmail.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (27, 'Gagnon', 'Stéphane', 'Avenue du Lac', 2, 1050, 466184927, 'stephane.gagnon@yahoo.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (28, 'Lemieux', 'Caroline', 'Rue des Érables', 29, 5000, 466184927, 'caroline.lemieux@outlook.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (29, 'Lapointe', 'Daniel', 'Avenue des Ormes', 7, 1060, 466184927, 'daniel.lapointe@icloud.com');
INSERT INTO public.client (id_client, nom, prenom, nom_rue, num_rue, code_postal, num_tel, mail) VALUES (30, 'Arsenault', 'Isabelle', 'Boulevard des Capucines', 18, 6000, 466184927, 'isabelle.arsenault@hotmail.com');


--
-- TOC entry 4830 (class 0 OID 57580)
-- Dependencies: 222
-- Data for Name: commande; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.commande (id_commande, montant, id_voiture, id_client) VALUES (6, 30000.00, 1, 1);


--
-- TOC entry 4824 (class 0 OID 57525)
-- Dependencies: 216
-- Data for Name: marque; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.marque (id_marque, marque) VALUES (1, 'Volkswagen');
INSERT INTO public.marque (id_marque, marque) VALUES (2, 'Bmw');
INSERT INTO public.marque (id_marque, marque) VALUES (3, 'Mercedes');
INSERT INTO public.marque (id_marque, marque) VALUES (4, 'Audi');


--
-- TOC entry 4832 (class 0 OID 57597)
-- Dependencies: 224
-- Data for Name: modele; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.modele (id_modele, modele) VALUES (1, 'Golf');
INSERT INTO public.modele (id_modele, modele) VALUES (2, 'Polo');
INSERT INTO public.modele (id_modele, modele) VALUES (3, 'Passat');
INSERT INTO public.modele (id_modele, modele) VALUES (4, 'Tiguan');
INSERT INTO public.modele (id_modele, modele) VALUES (5, 'T-Roc');
INSERT INTO public.modele (id_modele, modele) VALUES (6, 'Arteon');
INSERT INTO public.modele (id_modele, modele) VALUES (7, 'Touareg');
INSERT INTO public.modele (id_modele, modele) VALUES (8, '3 Series');
INSERT INTO public.modele (id_modele, modele) VALUES (9, '5 Series');
INSERT INTO public.modele (id_modele, modele) VALUES (10, 'X3');
INSERT INTO public.modele (id_modele, modele) VALUES (11, 'X5');
INSERT INTO public.modele (id_modele, modele) VALUES (12, '1 Series');
INSERT INTO public.modele (id_modele, modele) VALUES (13, '7 Series');
INSERT INTO public.modele (id_modele, modele) VALUES (14, 'X1');
INSERT INTO public.modele (id_modele, modele) VALUES (15, 'X7');
INSERT INTO public.modele (id_modele, modele) VALUES (16, 'Z4');
INSERT INTO public.modele (id_modele, modele) VALUES (17, '2 Series');
INSERT INTO public.modele (id_modele, modele) VALUES (18, 'C-Class');
INSERT INTO public.modele (id_modele, modele) VALUES (19, 'E-Class');
INSERT INTO public.modele (id_modele, modele) VALUES (20, 'GLC');
INSERT INTO public.modele (id_modele, modele) VALUES (21, 'A-Class');
INSERT INTO public.modele (id_modele, modele) VALUES (22, 'GLE');
INSERT INTO public.modele (id_modele, modele) VALUES (23, 'S-Class');
INSERT INTO public.modele (id_modele, modele) VALUES (24, 'GLA');
INSERT INTO public.modele (id_modele, modele) VALUES (25, 'CLA');
INSERT INTO public.modele (id_modele, modele) VALUES (26, 'GLB');
INSERT INTO public.modele (id_modele, modele) VALUES (27, 'GLS');
INSERT INTO public.modele (id_modele, modele) VALUES (28, 'A3');
INSERT INTO public.modele (id_modele, modele) VALUES (29, 'A4');
INSERT INTO public.modele (id_modele, modele) VALUES (30, 'Q5');
INSERT INTO public.modele (id_modele, modele) VALUES (31, 'Q3');
INSERT INTO public.modele (id_modele, modele) VALUES (32, 'A1');
INSERT INTO public.modele (id_modele, modele) VALUES (33, 'A6');
INSERT INTO public.modele (id_modele, modele) VALUES (34, 'Q7');
INSERT INTO public.modele (id_modele, modele) VALUES (35, 'Q2');
INSERT INTO public.modele (id_modele, modele) VALUES (36, 'A5');
INSERT INTO public.modele (id_modele, modele) VALUES (37, 'Q8');


--
-- TOC entry 4834 (class 0 OID 57609)
-- Dependencies: 226
-- Data for Name: voiture; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (1, 2021, 'Noir', 25000.00, 15000, 'Essence', 'Automatique', 1, 1, 'voiture1.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (2, 2020, 'Blanc', 20000.00, 20000, 'Diesel', 'Manuelle', 2, 1, 'voiture2.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (3, 2022, 'Gris', 30000.00, 10000, 'Hybride', 'Automatique', 3, 1, 'voiture3.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (4, 2019, 'Bleu', 35000.00, 18000, 'Essence', 'Automatique', 4, 1, 'voiture4.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (5, 2023, 'Rouge', 40000.00, 5000, 'Diesel', 'Automatique', 5, 1, 'voiture5.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (6, 2020, 'Noir', 40000.00, 12000, 'Essence', 'Automatique', 11, 2, 'voiture6.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (7, 2019, 'Blanc', 35000.00, 15000, 'Diesel', 'Manuelle', 12, 2, 'voiture7.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (8, 2021, 'Gris', 45000.00, 10000, 'Essence', 'Automatique', 13, 2, 'voiture8.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (9, 2022, 'Bleu', 55000.00, 8000, 'Diesel', 'Automatique', 14, 2, 'voiture9.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (10, 2020, 'Rouge', 60000.00, 5000, 'Essence', 'Automatique', 15, 2, 'voiture10.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (11, 2021, 'Noir', 45000.00, 13000, 'Diesel', 'Automatique', 21, 3, 'voiture11.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (12, 2019, 'Blanc', 40000.00, 18000, 'Essence', 'Manuelle', 22, 3, 'voiture12.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (13, 2020, 'Gris', 50000.00, 9000, 'Diesel', 'Automatique', 23, 3, 'voiture13.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (14, 2022, 'Bleu', 55000.00, 7000, 'Essence', 'Automatique', 24, 3, 'voiture14.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (15, 2021, 'Rouge', 60000.00, 6000, 'Hybride', 'Automatique', 25, 3, 'voiture15.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (16, 2020, 'Noir', 40000.00, 14000, 'Diesel', 'Automatique', 31, 4, 'voiture16.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (17, 2019, 'Blanc', 35000.00, 17000, 'Essence', 'Manuelle', 32, 4, 'voiture17.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (18, 2021, 'Gris', 45000.00, 11000, 'Diesel', 'Automatique', 33, 4, 'voiture18.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (19, 2022, 'Bleu', 55000.00, 7500, 'Essence', 'Automatique', 34, 4, 'voiture19.jpg');
INSERT INTO public.voiture (id_voiture, annee, couleur, prix, kilometrage, carburant, type_boite, id_modele, id_marque, image) VALUES (20, 2020, 'Rouge', 60000.00, 5500, 'Hybride', 'Automatique', 35, 4, 'voiture19.jpg');


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 219
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 217
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 30, true);


--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 221
-- Name: commande_id_commande_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commande_id_commande_seq', 6, true);


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 215
-- Name: marque_id_marque_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marque_id_marque_seq', 4, true);


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 223
-- Name: modele_id_modele_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.modele_id_modele_seq', 37, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 225
-- Name: voiture_id_voiture_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voiture_id_voiture_seq', 20, true);


--
-- TOC entry 4670 (class 2606 OID 57559)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4668 (class 2606 OID 57550)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4672 (class 2606 OID 57585)
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (id_commande);


--
-- TOC entry 4666 (class 2606 OID 57532)
-- Name: marque marque_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marque
    ADD CONSTRAINT marque_pkey PRIMARY KEY (id_marque);


--
-- TOC entry 4674 (class 2606 OID 57604)
-- Name: modele modele_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modele
    ADD CONSTRAINT modele_pkey PRIMARY KEY (id_modele);


--
-- TOC entry 4676 (class 2606 OID 57616)
-- Name: voiture voiture_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_pkey PRIMARY KEY (id_voiture);


--
-- TOC entry 4677 (class 2606 OID 57591)
-- Name: commande commande_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4678 (class 2606 OID 57622)
-- Name: voiture voiture_id_marque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_id_marque_fkey FOREIGN KEY (id_marque) REFERENCES public.marque(id_marque);


--
-- TOC entry 4679 (class 2606 OID 57617)
-- Name: voiture voiture_id_modele_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voiture
    ADD CONSTRAINT voiture_id_modele_fkey FOREIGN KEY (id_modele) REFERENCES public.modele(id_modele);


-- Completed on 2024-04-28 13:45:15

--
-- PostgreSQL database dump complete
--

