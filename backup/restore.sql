--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.3

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

DROP DATABASE atkis_db;
--
-- Name: atkis_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE atkis_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';


ALTER DATABASE atkis_db OWNER TO postgres;

\connect atkis_db

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
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: GN250_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GN250_b" (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,31467),
    nnid character varying(16),
    datum character varying(10),
    oba character varying(50),
    oba_wert character varying(50),
    name character varying(200),
    sprache character varying(15),
    genus character varying(10),
    name2 character varying(200),
    sprache2 character varying(15),
    genus2 character varying(10),
    zusatz character varying(100),
    ags character varying(8),
    ars character varying(12),
    hoehe character varying(10),
    hoehe_ger character varying(10),
    ewz character varying(10),
    ewz_ger character varying(10),
    gewk character varying(20),
    gemteil character varying(10),
    virtuell character varying(10),
    gemeinde character varying(50),
    verwgem character varying(50),
    kreis character varying(50),
    regbezirk character varying(50),
    bundesland character varying(50),
    staat character varying(50),
    rechts numeric,
    hoch numeric,
    box character varying(250)
);


ALTER TABLE public."GN250_b" OWNER TO postgres;

--
-- Name: TABLE "GN250_b"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."GN250_b" IS 'Geographical names of municipalities or parts thereof, landscapes,
mountain ranges, mountains, islands, rivers, canals, lakes, seas,
etc.';


--
-- Name: GN250_b_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GN250_b_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GN250_b_id_seq" OWNER TO postgres;

--
-- Name: GN250_b_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GN250_b_id_seq" OWNED BY public."GN250_b".id;


--
-- Name: area_xy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_xy (
    bez_lan character varying(60),
    longitude double precision,
    latitude double precision,
    boundary public.geometry
);


ALTER TABLE public.area_xy OWNER TO postgres;

--
-- Name: area_xy2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_xy2 (
    bez_lan character varying(60),
    longitude double precision,
    latitude double precision,
    boundary text
);


ALTER TABLE public.area_xy2 OWNER TO postgres;

--
-- Name: building_in_settlement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building_in_settlement (
    id integer,
    building character varying(200),
    gid integer,
    settlement character varying(180),
    point text,
    polygon text
);


ALTER TABLE public.building_in_settlement OWNER TO postgres;

--
-- Name: geb01_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geb01_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    adm character varying(20),
    bez_nat character varying(60),
    bez_lan character varying(60),
    bez_rbz character varying(60),
    bez_krs character varying(60),
    bez_vwg character varying(60),
    bez_gem character varying(60),
    rgs character varying(100),
    sch character varying(20),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.geb01_f OWNER TO postgres;

--
-- Name: geb01_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geb01_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geb01_f_gid_seq OWNER TO postgres;

--
-- Name: geb01_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geb01_f_gid_seq OWNED BY public.geb01_f.gid;


--
-- Name: geb01_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geb01_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    agz character varying(30),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.geb01_l OWNER TO postgres;

--
-- Name: geb01_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geb01_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geb01_l_gid_seq OWNER TO postgres;

--
-- Name: geb01_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geb01_l_gid_seq OWNED BY public.geb01_l.gid;


--
-- Name: geb02_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geb02_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    ltp character varying(4),
    nam character varying(100),
    rgs character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.geb02_f OWNER TO postgres;

--
-- Name: geb02_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geb02_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geb02_f_gid_seq OWNER TO postgres;

--
-- Name: geb02_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geb02_f_gid_seq OWNED BY public.geb02_f.gid;


--
-- Name: geb03_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geb03_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    objart_z character varying(5),
    objid_z character varying(16),
    adf character varying(4),
    bez character varying(60),
    nam character varying(180),
    sgn character varying(20),
    zon character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.geb03_f OWNER TO postgres;

--
-- Name: geb03_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geb03_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geb03_f_gid_seq OWNER TO postgres;

--
-- Name: geb03_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geb03_f_gid_seq OWNED BY public.geb03_f.gid;


--
-- Name: gew01_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gew01_f (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    objart_z character varying(5),
    objid_z character varying(16),
    fkt character varying(4),
    gwk character varying(20),
    hyd character varying(4),
    nam character varying(100),
    rgs character varying(100),
    sfk character varying(4),
    skz character varying(20),
    wdm character varying(4),
    wsg double precision,
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.gew01_f OWNER TO postgres;

--
-- Name: gew01_f_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gew01_f_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gew01_f_id_seq OWNER TO postgres;

--
-- Name: gew01_f_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gew01_f_id_seq OWNED BY public.gew01_f.id;


--
-- Name: gew01_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gew01_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    objart_z character varying(5),
    objid_z character varying(16),
    brg smallint,
    fkt character varying(4),
    flr smallint,
    gwk character varying(20),
    hyd character varying(4),
    nam character varying(100),
    rgs character varying(100),
    sfk character varying(4),
    wdm character varying(4),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.gew01_l OWNER TO postgres;

--
-- Name: gew01_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gew01_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gew01_l_gid_seq OWNER TO postgres;

--
-- Name: gew01_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gew01_l_gid_seq OWNED BY public.gew01_l.gid;


--
-- Name: gew02_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gew02_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    nam character varying(100),
    rgs character varying(100),
    znm character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.gew02_f OWNER TO postgres;

--
-- Name: gew02_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gew02_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gew02_f_gid_seq OWNER TO postgres;

--
-- Name: gew02_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gew02_f_gid_seq OWNED BY public.gew02_f.gid;


--
-- Name: gew02_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gew02_p (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    nam character varying(100),
    rgs character varying(100),
    znm character varying(100),
    bemerkung character varying(200),
    geom public.geometry(Point,31467)
);


ALTER TABLE public.gew02_p OWNER TO postgres;

--
-- Name: gew02_p_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gew02_p_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gew02_p_gid_seq OWNER TO postgres;

--
-- Name: gew02_p_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gew02_p_gid_seq OWNED BY public.gew02_p.gid;


--
-- Name: gew03_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gew03_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    aga character varying(4),
    flr smallint,
    gwk character varying(30),
    nam character varying(100),
    rgs character varying(100),
    sfk character varying(4),
    znm character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.gew03_l OWNER TO postgres;

--
-- Name: gew03_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gew03_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gew03_l_gid_seq OWNER TO postgres;

--
-- Name: gew03_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gew03_l_gid_seq OWNED BY public.gew03_l.gid;


--
-- Name: hdu01_b; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hdu01_b (
    gid integer NOT NULL,
    land character varying(3),
    objart_1 character varying(5),
    objid_1 character varying(16),
    ebene_1 character varying(7),
    objart_2 character varying(5),
    objid_2 character varying(16),
    ebene_2 character varying(7),
    geom public.geometry(Point,31467)
);


ALTER TABLE public.hdu01_b OWNER TO postgres;

--
-- Name: hdu01_b_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hdu01_b_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hdu01_b_gid_seq OWNER TO postgres;

--
-- Name: hdu01_b_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hdu01_b_gid_seq OWNED BY public.hdu01_b.gid;


--
-- Name: rel01_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel01_l (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    objart_z character varying(5),
    objid_z character varying(16),
    art character varying(4),
    fkt character varying(4),
    hhl double precision,
    hho double precision,
    nam character varying(100),
    bemerkung character varying(200)
);


ALTER TABLE public.rel01_l OWNER TO postgres;

--
-- Name: rel01_l_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rel01_l_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rel01_l_id_seq OWNER TO postgres;

--
-- Name: rel01_l_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rel01_l_id_seq OWNED BY public.rel01_l.id;


--
-- Name: rel01_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel01_p (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(100),
    znm character varying(100),
    bemerkung character varying(200),
    geom public.geometry(Point,31467)
);


ALTER TABLE public.rel01_p OWNER TO postgres;

--
-- Name: rel01_p_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rel01_p_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rel01_p_gid_seq OWNER TO postgres;

--
-- Name: rel01_p_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rel01_p_gid_seq OWNED BY public.rel01_p.gid;


--
-- Name: rel02_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel02_p (
    id integer NOT NULL,
    geom public.geometry(Point,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    hoehe double precision,
    bemerkung character varying(200)
);


ALTER TABLE public.rel02_p OWNER TO postgres;

--
-- Name: rel02_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rel02_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rel02_p_id_seq OWNER TO postgres;

--
-- Name: rel02_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rel02_p_id_seq OWNED BY public.rel02_p.id;


--
-- Name: sie01_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie01_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(180),
    rgs character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.sie01_f OWNER TO postgres;

--
-- Name: sie01_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie01_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie01_f_gid_seq OWNER TO postgres;

--
-- Name: sie01_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie01_f_gid_seq OWNED BY public.sie01_f.gid;


--
-- Name: sie01_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie01_p (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(180),
    rgs character varying(100),
    bemerkung character varying(200),
    geom public.geometry(Point,31467)
);


ALTER TABLE public.sie01_p OWNER TO postgres;

--
-- Name: sie01_p_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie01_p_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie01_p_gid_seq OWNER TO postgres;

--
-- Name: sie01_p_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie01_p_gid_seq OWNED BY public.sie01_p.gid;


--
-- Name: sie02_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie02_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    agt character varying(4),
    fkt character varying(4),
    nam character varying(100),
    rgs character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.sie02_f OWNER TO postgres;

--
-- Name: sie02_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie02_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie02_f_gid_seq OWNER TO postgres;

--
-- Name: sie02_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie02_f_gid_seq OWNED BY public.sie02_f.gid;


--
-- Name: sie03_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie03_f (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    bwf character varying(4),
    hho double precision,
    nam character varying(100),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.sie03_f OWNER TO postgres;

--
-- Name: sie03_f_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie03_f_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie03_f_id_seq OWNER TO postgres;

--
-- Name: sie03_f_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie03_f_id_seq OWNED BY public.sie03_f.id;


--
-- Name: sie03_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie03_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    bwf character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.sie03_l OWNER TO postgres;

--
-- Name: sie03_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie03_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie03_l_gid_seq OWNER TO postgres;

--
-- Name: sie03_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie03_l_gid_seq OWNED BY public.sie03_l.gid;


--
-- Name: sie03_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie03_p (
    id integer NOT NULL,
    geom public.geometry(Point,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    atp character varying(4),
    bwf character varying(4),
    hho double precision,
    nam character varying(100),
    spo character varying(4),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.sie03_p OWNER TO postgres;

--
-- Name: sie03_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie03_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie03_p_id_seq OWNER TO postgres;

--
-- Name: sie03_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie03_p_id_seq OWNED BY public.sie03_p.id;


--
-- Name: sie04_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie04_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.sie04_f OWNER TO postgres;

--
-- Name: sie04_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie04_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie04_f_gid_seq OWNER TO postgres;

--
-- Name: sie04_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie04_f_gid_seq OWNED BY public.sie04_f.gid;


--
-- Name: sie04_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie04_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    kon character varying(4),
    nam character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.sie04_l OWNER TO postgres;

--
-- Name: sie04_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie04_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie04_l_gid_seq OWNER TO postgres;

--
-- Name: sie04_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie04_l_gid_seq OWNED BY public.sie04_l.gid;


--
-- Name: sie04_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie04_p (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    kon character varying(4),
    nam character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(Point,31467)
);


ALTER TABLE public.sie04_p OWNER TO postgres;

--
-- Name: sie04_p_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie04_p_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie04_p_gid_seq OWNER TO postgres;

--
-- Name: sie04_p_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie04_p_gid_seq OWNED BY public.sie04_p.gid;


--
-- Name: sie05_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sie05_p (
    id integer NOT NULL,
    geom public.geometry(Point,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    bwf character varying(20),
    gfk character varying(4),
    hho double precision,
    nam character varying(200),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.sie05_p OWNER TO postgres;

--
-- Name: sie05_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sie05_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sie05_p_id_seq OWNER TO postgres;

--
-- Name: sie05_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sie05_p_id_seq OWNED BY public.sie05_p.id;


--
-- Name: testing; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.testing AS
 WITH centroids AS (
         SELECT DISTINCT ON (geb01_f.bez_lan) geb01_f.bez_lan,
            public.st_centroid(public.st_transform(geb01_f.geom, 4326)) AS geom,
            public.st_boundary(public.st_transform(geb01_f.geom, 4326)) AS boundary
           FROM public.geb01_f
          ORDER BY geb01_f.bez_lan, (public.st_area(geb01_f.geom)) DESC
        )
 SELECT centroids.bez_lan,
    public.st_x(centroids.geom) AS longitude,
    public.st_y(centroids.geom) AS latitude,
    centroids.boundary
   FROM centroids
 LIMIT 1;


ALTER TABLE public.testing OWNER TO postgres;

--
-- Name: veg01_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veg01_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(100),
    veg character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.veg01_f OWNER TO postgres;

--
-- Name: veg01_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veg01_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veg01_f_gid_seq OWNER TO postgres;

--
-- Name: veg01_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veg01_f_gid_seq OWNED BY public.veg01_f.gid;


--
-- Name: veg02_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veg02_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    nam character varying(100),
    rgs character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.veg02_f OWNER TO postgres;

--
-- Name: veg02_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veg02_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veg02_f_gid_seq OWNER TO postgres;

--
-- Name: veg02_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veg02_f_gid_seq OWNED BY public.veg02_f.gid;


--
-- Name: veg03_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veg03_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    fkt character varying(4),
    nam character varying(100),
    ofm character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.veg03_f OWNER TO postgres;

--
-- Name: veg03_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veg03_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veg03_f_gid_seq OWNER TO postgres;

--
-- Name: veg03_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veg03_f_gid_seq OWNED BY public.veg03_f.gid;


--
-- Name: veg04_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veg04_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    bws character varying(4),
    nam character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.veg04_f OWNER TO postgres;

--
-- Name: veg04_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veg04_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.veg04_f_gid_seq OWNER TO postgres;

--
-- Name: veg04_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veg04_f_gid_seq OWNED BY public.veg04_f.gid;


--
-- Name: ver01_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver01_l (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    objart_z character varying(5),
    objid_z character varying(16),
    bez character varying(30),
    brf double precision,
    bvb character varying(4),
    fsz integer,
    ftr character varying(4),
    ibd character varying(4),
    wdm character varying(4),
    znm character varying(200),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.ver01_l OWNER TO postgres;

--
-- Name: ver01_l_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver01_l_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver01_l_id_seq OWNER TO postgres;

--
-- Name: ver01_l_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver01_l_id_seq OWNED BY public.ver01_l.id;


--
-- Name: ver02_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver02_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    fkt character varying(4),
    nam character varying(100),
    znm character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.ver02_l OWNER TO postgres;

--
-- Name: ver02_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver02_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver02_l_gid_seq OWNER TO postgres;

--
-- Name: ver02_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver02_l_gid_seq OWNED BY public.ver02_l.gid;


--
-- Name: ver03_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver03_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.ver03_f OWNER TO postgres;

--
-- Name: ver03_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver03_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver03_f_gid_seq OWNER TO postgres;

--
-- Name: ver03_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver03_f_gid_seq OWNED BY public.ver03_f.gid;


--
-- Name: ver03_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver03_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    bkt character varying(20),
    elk character varying(4),
    gls character varying(4),
    nam character varying(100),
    nrb character varying(60),
    spw character varying(4),
    vkd character varying(4),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.ver03_l OWNER TO postgres;

--
-- Name: ver03_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver03_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver03_l_gid_seq OWNER TO postgres;

--
-- Name: ver03_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver03_l_gid_seq OWNED BY public.ver03_l.gid;


--
-- Name: ver04_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver04_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    bez character varying(60),
    nam character varying(100),
    ntz character varying(4),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.ver04_f OWNER TO postgres;

--
-- Name: ver04_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver04_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver04_f_gid_seq OWNER TO postgres;

--
-- Name: ver04_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver04_f_gid_seq OWNED BY public.ver04_f.gid;


--
-- Name: ver05_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver05_l (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    art character varying(20),
    nam character varying(100),
    bemerkung character varying(200),
    geom public.geometry(MultiLineString,31467)
);


ALTER TABLE public.ver05_l OWNER TO postgres;

--
-- Name: ver05_l_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver05_l_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver05_l_gid_seq OWNER TO postgres;

--
-- Name: ver05_l_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver05_l_gid_seq OWNED BY public.ver05_l.gid;


--
-- Name: ver06_f; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver06_f (
    gid integer NOT NULL,
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x smallint,
    beginn character varying(20),
    ende character varying(20),
    bwf character varying(4),
    nam character varying(100),
    rgs character varying(100),
    zus character varying(4),
    bemerkung character varying(200),
    geom public.geometry(MultiPolygon,31467)
);


ALTER TABLE public.ver06_f OWNER TO postgres;

--
-- Name: ver06_f_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver06_f_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver06_f_gid_seq OWNER TO postgres;

--
-- Name: ver06_f_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver06_f_gid_seq OWNED BY public.ver06_f.gid;


--
-- Name: ver06_l; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver06_l (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    bez character varying(60),
    bro double precision,
    bwf character varying(4),
    nam character varying(100),
    rgs character varying(100),
    ofm character varying(4),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.ver06_l OWNER TO postgres;

--
-- Name: ver06_l_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver06_l_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver06_l_id_seq OWNER TO postgres;

--
-- Name: ver06_l_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver06_l_id_seq OWNED BY public.ver06_l.id;


--
-- Name: ver06_p; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ver06_p (
    id integer NOT NULL,
    geom public.geometry(Point,31467),
    land character varying(3),
    modellart character varying(30),
    objart character varying(5),
    objart_txt character varying(50),
    objid character varying(16),
    hdu_x integer,
    beginn character varying(20),
    ende character varying(20),
    art character varying(4),
    bez character varying(60),
    bfk character varying(4),
    bkt character varying(20),
    bro double precision,
    bwf character varying(4),
    nam character varying(100),
    ofm character varying(4),
    rgs character varying(100),
    vkd character varying(4),
    znm character varying(100),
    zus character varying(4),
    bemerkung character varying(200)
);


ALTER TABLE public.ver06_p OWNER TO postgres;

--
-- Name: ver06_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ver06_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ver06_p_id_seq OWNER TO postgres;

--
-- Name: ver06_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ver06_p_id_seq OWNED BY public.ver06_p.id;


--
-- Name: GN250_b id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GN250_b" ALTER COLUMN id SET DEFAULT nextval('public."GN250_b_id_seq"'::regclass);


--
-- Name: geb01_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb01_f ALTER COLUMN gid SET DEFAULT nextval('public.geb01_f_gid_seq'::regclass);


--
-- Name: geb01_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb01_l ALTER COLUMN gid SET DEFAULT nextval('public.geb01_l_gid_seq'::regclass);


--
-- Name: geb02_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb02_f ALTER COLUMN gid SET DEFAULT nextval('public.geb02_f_gid_seq'::regclass);


--
-- Name: geb03_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb03_f ALTER COLUMN gid SET DEFAULT nextval('public.geb03_f_gid_seq'::regclass);


--
-- Name: gew01_f id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew01_f ALTER COLUMN id SET DEFAULT nextval('public.gew01_f_id_seq'::regclass);


--
-- Name: gew01_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew01_l ALTER COLUMN gid SET DEFAULT nextval('public.gew01_l_gid_seq'::regclass);


--
-- Name: gew02_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew02_f ALTER COLUMN gid SET DEFAULT nextval('public.gew02_f_gid_seq'::regclass);


--
-- Name: gew02_p gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew02_p ALTER COLUMN gid SET DEFAULT nextval('public.gew02_p_gid_seq'::regclass);


--
-- Name: gew03_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew03_l ALTER COLUMN gid SET DEFAULT nextval('public.gew03_l_gid_seq'::regclass);


--
-- Name: hdu01_b gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hdu01_b ALTER COLUMN gid SET DEFAULT nextval('public.hdu01_b_gid_seq'::regclass);


--
-- Name: rel01_l id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel01_l ALTER COLUMN id SET DEFAULT nextval('public.rel01_l_id_seq'::regclass);


--
-- Name: rel01_p gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel01_p ALTER COLUMN gid SET DEFAULT nextval('public.rel01_p_gid_seq'::regclass);


--
-- Name: rel02_p id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel02_p ALTER COLUMN id SET DEFAULT nextval('public.rel02_p_id_seq'::regclass);


--
-- Name: sie01_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie01_f ALTER COLUMN gid SET DEFAULT nextval('public.sie01_f_gid_seq'::regclass);


--
-- Name: sie01_p gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie01_p ALTER COLUMN gid SET DEFAULT nextval('public.sie01_p_gid_seq'::regclass);


--
-- Name: sie02_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie02_f ALTER COLUMN gid SET DEFAULT nextval('public.sie02_f_gid_seq'::regclass);


--
-- Name: sie03_f id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_f ALTER COLUMN id SET DEFAULT nextval('public.sie03_f_id_seq'::regclass);


--
-- Name: sie03_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_l ALTER COLUMN gid SET DEFAULT nextval('public.sie03_l_gid_seq'::regclass);


--
-- Name: sie03_p id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_p ALTER COLUMN id SET DEFAULT nextval('public.sie03_p_id_seq'::regclass);


--
-- Name: sie04_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_f ALTER COLUMN gid SET DEFAULT nextval('public.sie04_f_gid_seq'::regclass);


--
-- Name: sie04_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_l ALTER COLUMN gid SET DEFAULT nextval('public.sie04_l_gid_seq'::regclass);


--
-- Name: sie04_p gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_p ALTER COLUMN gid SET DEFAULT nextval('public.sie04_p_gid_seq'::regclass);


--
-- Name: sie05_p id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie05_p ALTER COLUMN id SET DEFAULT nextval('public.sie05_p_id_seq'::regclass);


--
-- Name: veg01_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg01_f ALTER COLUMN gid SET DEFAULT nextval('public.veg01_f_gid_seq'::regclass);


--
-- Name: veg02_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg02_f ALTER COLUMN gid SET DEFAULT nextval('public.veg02_f_gid_seq'::regclass);


--
-- Name: veg03_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg03_f ALTER COLUMN gid SET DEFAULT nextval('public.veg03_f_gid_seq'::regclass);


--
-- Name: veg04_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg04_f ALTER COLUMN gid SET DEFAULT nextval('public.veg04_f_gid_seq'::regclass);


--
-- Name: ver01_l id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver01_l ALTER COLUMN id SET DEFAULT nextval('public.ver01_l_id_seq'::regclass);


--
-- Name: ver02_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver02_l ALTER COLUMN gid SET DEFAULT nextval('public.ver02_l_gid_seq'::regclass);


--
-- Name: ver03_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver03_f ALTER COLUMN gid SET DEFAULT nextval('public.ver03_f_gid_seq'::regclass);


--
-- Name: ver03_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver03_l ALTER COLUMN gid SET DEFAULT nextval('public.ver03_l_gid_seq'::regclass);


--
-- Name: ver04_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver04_f ALTER COLUMN gid SET DEFAULT nextval('public.ver04_f_gid_seq'::regclass);


--
-- Name: ver05_l gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver05_l ALTER COLUMN gid SET DEFAULT nextval('public.ver05_l_gid_seq'::regclass);


--
-- Name: ver06_f gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_f ALTER COLUMN gid SET DEFAULT nextval('public.ver06_f_gid_seq'::regclass);


--
-- Name: ver06_l id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_l ALTER COLUMN id SET DEFAULT nextval('public.ver06_l_id_seq'::regclass);


--
-- Name: ver06_p id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_p ALTER COLUMN id SET DEFAULT nextval('public.ver06_p_id_seq'::regclass);


--
-- Data for Name: GN250_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public."GN250_b" (id, geom, nnid, datum, oba, oba_wert, name, sprache, genus, name2, sprache2, genus2, zusatz, ags, ars, hoehe, hoehe_ger, ewz, ewz_ger, gewk, gemteil, virtuell, gemeinde, verwgem, kreis, regbezirk, bundesland, staat, rechts, hoch, box) FROM stdin;
\.
\copy public."GN250_b" (id, geom, nnid, datum, oba, oba_wert, name, sprache, genus, name2, sprache2, genus2, zusatz, ags, ars, hoehe, hoehe_ger, ewz, ewz_ger, gewk, gemteil, virtuell, gemeinde, verwgem, kreis, regbezirk, bundesland, staat, rechts, hoch, box) FROM 'docker-entrypoint-initdb.d/backup/4943.dat';

--
-- Data for Name: area_xy; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.area_xy (bez_lan, longitude, latitude, boundary) FROM stdin;
\.
\copy public.area_xy (bez_lan, longitude, latitude, boundary) FROM 'docker-entrypoint-initdb.d/backup/4944.dat';

--
-- Data for Name: area_xy2; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.area_xy2 (bez_lan, longitude, latitude, boundary) FROM stdin;
\.
\copy public.area_xy2 (bez_lan, longitude, latitude, boundary) FROM 'docker-entrypoint-initdb.d/backup/4945.dat';

--
-- Data for Name: building_in_settlement; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.building_in_settlement (id, building, gid, settlement, point, polygon) FROM stdin;
\.
\copy public.building_in_settlement (id, building, gid, settlement, point, polygon) FROM 'docker-entrypoint-initdb.d/backup/4941.dat';

--
-- Data for Name: geb01_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.geb01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, adm, bez_nat, bez_lan, bez_rbz, bez_krs, bez_vwg, bez_gem, rgs, sch, bemerkung, geom) FROM stdin;
\.
\copy public.geb01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, adm, bez_nat, bez_lan, bez_rbz, bez_krs, bez_vwg, bez_gem, rgs, sch, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4870.dat';

--
-- Data for Name: geb01_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.geb01_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, agz, zus, bemerkung, geom) FROM stdin;
\.
\copy public.geb01_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, agz, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4872.dat';

--
-- Data for Name: geb02_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.geb02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, ltp, nam, rgs, bemerkung, geom) FROM stdin;
\.
\copy public.geb02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, ltp, nam, rgs, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4874.dat';

--
-- Data for Name: geb03_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.geb03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, adf, bez, nam, sgn, zon, bemerkung, geom) FROM stdin;
\.
\copy public.geb03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, adf, bez, nam, sgn, zon, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4876.dat';

--
-- Data for Name: gew01_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.gew01_f (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, fkt, gwk, hyd, nam, rgs, sfk, skz, wdm, wsg, znm, zus, bemerkung) FROM stdin;
\.
\copy public.gew01_f (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, fkt, gwk, hyd, nam, rgs, sfk, skz, wdm, wsg, znm, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4940.dat';

--
-- Data for Name: gew01_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.gew01_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, brg, fkt, flr, gwk, hyd, nam, rgs, sfk, wdm, znm, zus, bemerkung, geom) FROM stdin;
\.
\copy public.gew01_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, brg, fkt, flr, gwk, hyd, nam, rgs, sfk, wdm, znm, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4878.dat';

--
-- Data for Name: gew02_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.gew02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, rgs, znm, bemerkung, geom) FROM stdin;
\.
\copy public.gew02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, rgs, znm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4880.dat';

--
-- Data for Name: gew02_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.gew02_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, rgs, znm, bemerkung, geom) FROM stdin;
\.
\copy public.gew02_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, rgs, znm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4882.dat';

--
-- Data for Name: gew03_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.gew03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, aga, flr, gwk, nam, rgs, sfk, znm, bemerkung, geom) FROM stdin;
\.
\copy public.gew03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, aga, flr, gwk, nam, rgs, sfk, znm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4884.dat';

--
-- Data for Name: hdu01_b; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.hdu01_b (gid, land, objart_1, objid_1, ebene_1, objart_2, objid_2, ebene_2, geom) FROM stdin;
\.
\copy public.hdu01_b (gid, land, objart_1, objid_1, ebene_1, objart_2, objid_2, ebene_2, geom) FROM 'docker-entrypoint-initdb.d/backup/4886.dat';

--
-- Data for Name: rel01_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.rel01_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, art, fkt, hhl, hho, nam, bemerkung) FROM stdin;
\.
\copy public.rel01_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, art, fkt, hhl, hho, nam, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4938.dat';

--
-- Data for Name: rel01_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.rel01_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, znm, bemerkung, geom) FROM stdin;
\.
\copy public.rel01_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, znm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4888.dat';

--
-- Data for Name: rel02_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.rel02_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, hoehe, bemerkung) FROM stdin;
\.
\copy public.rel02_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, hoehe, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4936.dat';

--
-- Data for Name: sie01_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, bemerkung, geom) FROM stdin;
\.
\copy public.sie01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4890.dat';

--
-- Data for Name: sie01_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie01_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, bemerkung, geom) FROM stdin;
\.
\copy public.sie01_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4892.dat';

--
-- Data for Name: sie02_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, agt, fkt, nam, rgs, zus, bemerkung, geom) FROM stdin;
\.
\copy public.sie02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, agt, fkt, nam, rgs, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4894.dat';

--
-- Data for Name: sie03_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie03_f (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, hho, nam, zus, bemerkung) FROM stdin;
\.
\copy public.sie03_f (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, hho, nam, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4934.dat';

--
-- Data for Name: sie03_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, bemerkung, geom) FROM stdin;
\.
\copy public.sie03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4896.dat';

--
-- Data for Name: sie03_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie03_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, atp, bwf, hho, nam, spo, zus, bemerkung) FROM stdin;
\.
\copy public.sie03_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, atp, bwf, hho, nam, spo, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4932.dat';

--
-- Data for Name: sie04_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, bemerkung, geom) FROM stdin;
\.
\copy public.sie04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4898.dat';

--
-- Data for Name: sie04_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie04_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, kon, nam, zus, bemerkung, geom) FROM stdin;
\.
\copy public.sie04_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, kon, nam, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4900.dat';

--
-- Data for Name: sie04_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie04_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, kon, nam, zus, bemerkung, geom) FROM stdin;
\.
\copy public.sie04_p (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, kon, nam, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4902.dat';

--
-- Data for Name: sie05_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.sie05_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, gfk, hho, nam, znm, zus, bemerkung) FROM stdin;
\.
\copy public.sie05_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, gfk, hho, nam, znm, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4930.dat';

--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
\copy public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM 'docker-entrypoint-initdb.d/backup/4548.dat';

--
-- Data for Name: veg01_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.veg01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, veg, bemerkung, geom) FROM stdin;
\.
\copy public.veg01_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, veg, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4904.dat';

--
-- Data for Name: veg02_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.veg02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, zus, bemerkung, geom) FROM stdin;
\.
\copy public.veg02_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, nam, rgs, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4906.dat';

--
-- Data for Name: veg03_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.veg03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, fkt, nam, ofm, bemerkung, geom) FROM stdin;
\.
\copy public.veg03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, fkt, nam, ofm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4908.dat';

--
-- Data for Name: veg04_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.veg04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bws, nam, zus, bemerkung, geom) FROM stdin;
\.
\copy public.veg04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bws, nam, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4910.dat';

--
-- Data for Name: ver01_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver01_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, bez, brf, bvb, fsz, ftr, ibd, wdm, znm, zus, bemerkung) FROM stdin;
\.
\copy public.ver01_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, objart_z, objid_z, bez, brf, bvb, fsz, ftr, ibd, wdm, znm, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4924.dat';

--
-- Data for Name: ver02_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver02_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, fkt, nam, znm, bemerkung, geom) FROM stdin;
\.
\copy public.ver02_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, fkt, nam, znm, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4912.dat';

--
-- Data for Name: ver03_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bemerkung, geom) FROM stdin;
\.
\copy public.ver03_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4914.dat';

--
-- Data for Name: ver03_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bkt, elk, gls, nam, nrb, spw, vkd, znm, zus, bemerkung, geom) FROM stdin;
\.
\copy public.ver03_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bkt, elk, gls, nam, nrb, spw, vkd, znm, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4916.dat';

--
-- Data for Name: ver04_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, nam, ntz, znm, zus, bemerkung, geom) FROM stdin;
\.
\copy public.ver04_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, nam, ntz, znm, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4918.dat';

--
-- Data for Name: ver05_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver05_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, bemerkung, geom) FROM stdin;
\.
\copy public.ver05_l (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, nam, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4920.dat';

--
-- Data for Name: ver06_f; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver06_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, nam, rgs, zus, bemerkung, geom) FROM stdin;
\.
\copy public.ver06_f (gid, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, bwf, nam, rgs, zus, bemerkung, geom) FROM 'docker-entrypoint-initdb.d/backup/4922.dat';

--
-- Data for Name: ver06_l; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver06_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, bro, bwf, nam, rgs, ofm, znm, zus, bemerkung) FROM stdin;
\.
\copy public.ver06_l (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, bro, bwf, nam, rgs, ofm, znm, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4926.dat';

--
-- Data for Name: ver06_p; Type: TABLE DATA; Schema: public; Owner: postgres
--

\copy public.ver06_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, bfk, bkt, bro, bwf, nam, ofm, rgs, vkd, znm, zus, bemerkung) FROM stdin;
\.
\copy public.ver06_p (id, geom, land, modellart, objart, objart_txt, objid, hdu_x, beginn, ende, art, bez, bfk, bkt, bro, bwf, nam, ofm, rgs, vkd, znm, zus, bemerkung) FROM 'docker-entrypoint-initdb.d/backup/4928.dat';

--
-- Name: GN250_b_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GN250_b_id_seq"', 162920, true);


--
-- Name: geb01_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geb01_f_gid_seq', 12862, true);


--
-- Name: geb01_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geb01_l_gid_seq', 34572, true);


--
-- Name: geb02_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geb02_f_gid_seq', 1280, true);


--
-- Name: geb03_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geb03_f_gid_seq', 2684, true);


--
-- Name: gew01_f_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gew01_f_id_seq', 16604, true);


--
-- Name: gew01_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gew01_l_gid_seq', 73663, true);


--
-- Name: gew02_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gew02_f_gid_seq', 656, true);


--
-- Name: gew02_p_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gew02_p_gid_seq', 622, true);


--
-- Name: gew03_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gew03_l_gid_seq', 10193, true);


--
-- Name: hdu01_b_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hdu01_b_gid_seq', 31924, true);


--
-- Name: rel01_l_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rel01_l_id_seq', 38412, true);


--
-- Name: rel01_p_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rel01_p_gid_seq', 733, true);


--
-- Name: rel02_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rel02_p_id_seq', 10493, true);




--
-- Name: sie01_p_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie01_p_gid_seq', 26069, true);


--
-- Name: sie02_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie02_f_gid_seq', 30595, true);


--
-- Name: sie03_f_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie03_f_id_seq', 295, true);


--
-- Name: sie03_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie03_l_gid_seq', 12883, true);


--
-- Name: sie03_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie03_p_id_seq', 11890, true);


--
-- Name: sie04_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie04_f_gid_seq', 212, true);


--
-- Name: sie04_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie04_l_gid_seq', 234, true);


--
-- Name: sie04_p_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie04_p_gid_seq', 1086, true);


--
-- Name: sie05_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sie05_p_id_seq', 19913, true);


--
-- Name: veg01_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veg01_f_gid_seq', 2837, true);


--
-- Name: veg02_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veg02_f_gid_seq', 40325, true);


--
-- Name: veg03_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veg03_f_gid_seq', 4186, true);


--
-- Name: veg04_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veg04_f_gid_seq', 3275, true);


--
-- Name: ver01_l_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver01_l_id_seq', 360677, true);


--
-- Name: ver02_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver02_l_gid_seq', 10256, true);


--
-- Name: ver03_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver03_f_gid_seq', 171, true);


--
-- Name: ver03_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver03_l_gid_seq', 22004, true);


--
-- Name: ver04_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver04_f_gid_seq', 300, true);


--
-- Name: ver05_l_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver05_l_gid_seq', 195, true);


--
-- Name: ver06_f_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver06_f_gid_seq', 36, true);


--
-- Name: ver06_l_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver06_l_id_seq', 38450, true);


--
-- Name: ver06_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ver06_p_id_seq', 16486, true);


--
-- Name: GN250_b GN250_b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GN250_b"
    ADD CONSTRAINT "GN250_b_pkey" PRIMARY KEY (id);


--
-- Name: geb01_f geb01_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb01_f
    ADD CONSTRAINT geb01_f_pkey PRIMARY KEY (gid);


--
-- Name: geb01_l geb01_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb01_l
    ADD CONSTRAINT geb01_l_pkey PRIMARY KEY (gid);


--
-- Name: geb02_f geb02_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb02_f
    ADD CONSTRAINT geb02_f_pkey PRIMARY KEY (gid);


--
-- Name: geb03_f geb03_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geb03_f
    ADD CONSTRAINT geb03_f_pkey PRIMARY KEY (gid);


--
-- Name: gew01_f gew01_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew01_f
    ADD CONSTRAINT gew01_f_pkey PRIMARY KEY (id);


--
-- Name: gew01_l gew01_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew01_l
    ADD CONSTRAINT gew01_l_pkey PRIMARY KEY (gid);


--
-- Name: gew02_f gew02_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew02_f
    ADD CONSTRAINT gew02_f_pkey PRIMARY KEY (gid);


--
-- Name: gew02_p gew02_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew02_p
    ADD CONSTRAINT gew02_p_pkey PRIMARY KEY (gid);


--
-- Name: gew03_l gew03_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gew03_l
    ADD CONSTRAINT gew03_l_pkey PRIMARY KEY (gid);


--
-- Name: hdu01_b hdu01_b_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hdu01_b
    ADD CONSTRAINT hdu01_b_pkey PRIMARY KEY (gid);


--
-- Name: rel01_l rel01_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel01_l
    ADD CONSTRAINT rel01_l_pkey PRIMARY KEY (id);


--
-- Name: rel01_p rel01_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel01_p
    ADD CONSTRAINT rel01_p_pkey PRIMARY KEY (gid);


--
-- Name: rel02_p rel02_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel02_p
    ADD CONSTRAINT rel02_p_pkey PRIMARY KEY (id);


--
-- Name: sie01_f sie01_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie01_f
    ADD CONSTRAINT sie01_f_pkey PRIMARY KEY (gid);


--
-- Name: sie01_p sie01_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie01_p
    ADD CONSTRAINT sie01_p_pkey PRIMARY KEY (gid);


--
-- Name: sie02_f sie02_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie02_f
    ADD CONSTRAINT sie02_f_pkey PRIMARY KEY (gid);


--
-- Name: sie03_f sie03_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_f
    ADD CONSTRAINT sie03_f_pkey PRIMARY KEY (id);


--
-- Name: sie03_l sie03_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_l
    ADD CONSTRAINT sie03_l_pkey PRIMARY KEY (gid);


--
-- Name: sie03_p sie03_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie03_p
    ADD CONSTRAINT sie03_p_pkey PRIMARY KEY (id);


--
-- Name: sie04_f sie04_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_f
    ADD CONSTRAINT sie04_f_pkey PRIMARY KEY (gid);


--
-- Name: sie04_l sie04_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_l
    ADD CONSTRAINT sie04_l_pkey PRIMARY KEY (gid);


--
-- Name: sie04_p sie04_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie04_p
    ADD CONSTRAINT sie04_p_pkey PRIMARY KEY (gid);


--
-- Name: sie05_p sie05_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sie05_p
    ADD CONSTRAINT sie05_p_pkey PRIMARY KEY (id);


--
-- Name: veg01_f veg01_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg01_f
    ADD CONSTRAINT veg01_f_pkey PRIMARY KEY (gid);


--
-- Name: veg02_f veg02_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg02_f
    ADD CONSTRAINT veg02_f_pkey PRIMARY KEY (gid);


--
-- Name: veg03_f veg03_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg03_f
    ADD CONSTRAINT veg03_f_pkey PRIMARY KEY (gid);


--
-- Name: veg04_f veg04_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veg04_f
    ADD CONSTRAINT veg04_f_pkey PRIMARY KEY (gid);


--
-- Name: ver01_l ver01_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver01_l
    ADD CONSTRAINT ver01_l_pkey PRIMARY KEY (id);


--
-- Name: ver02_l ver02_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver02_l
    ADD CONSTRAINT ver02_l_pkey PRIMARY KEY (gid);


--
-- Name: ver03_f ver03_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver03_f
    ADD CONSTRAINT ver03_f_pkey PRIMARY KEY (gid);


--
-- Name: ver03_l ver03_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver03_l
    ADD CONSTRAINT ver03_l_pkey PRIMARY KEY (gid);


--
-- Name: ver04_f ver04_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver04_f
    ADD CONSTRAINT ver04_f_pkey PRIMARY KEY (gid);


--
-- Name: ver05_l ver05_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver05_l
    ADD CONSTRAINT ver05_l_pkey PRIMARY KEY (gid);


--
-- Name: ver06_f ver06_f_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_f
    ADD CONSTRAINT ver06_f_pkey PRIMARY KEY (gid);


--
-- Name: ver06_l ver06_l_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_l
    ADD CONSTRAINT ver06_l_pkey PRIMARY KEY (id);


--
-- Name: ver06_p ver06_p_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ver06_p
    ADD CONSTRAINT ver06_p_pkey PRIMARY KEY (id);


--
-- Name: geb01_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb01_f_geom_idx ON public.geb01_f USING gist (geom);


--
-- Name: geb01_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb01_f_geom_idx1 ON public.geb01_f USING gist (geom);


--
-- Name: geb01_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb01_l_geom_idx ON public.geb01_l USING gist (geom);


--
-- Name: geb01_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb01_l_geom_idx1 ON public.geb01_l USING gist (geom);


--
-- Name: geb02_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb02_f_geom_idx ON public.geb02_f USING gist (geom);


--
-- Name: geb02_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb02_f_geom_idx1 ON public.geb02_f USING gist (geom);


--
-- Name: geb03_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb03_f_geom_idx ON public.geb03_f USING gist (geom);


--
-- Name: geb03_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX geb03_f_geom_idx1 ON public.geb03_f USING gist (geom);


--
-- Name: gew01_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew01_l_geom_idx ON public.gew01_l USING gist (geom);


--
-- Name: gew01_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew01_l_geom_idx1 ON public.gew01_l USING gist (geom);


--
-- Name: gew02_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew02_f_geom_idx ON public.gew02_f USING gist (geom);


--
-- Name: gew02_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew02_f_geom_idx1 ON public.gew02_f USING gist (geom);


--
-- Name: gew02_p_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew02_p_geom_idx ON public.gew02_p USING gist (geom);


--
-- Name: gew02_p_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew02_p_geom_idx1 ON public.gew02_p USING gist (geom);


--
-- Name: gew03_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew03_l_geom_idx ON public.gew03_l USING gist (geom);


--
-- Name: gew03_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX gew03_l_geom_idx1 ON public.gew03_l USING gist (geom);


--
-- Name: hdu01_b_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hdu01_b_geom_idx ON public.hdu01_b USING gist (geom);


--
-- Name: hdu01_b_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hdu01_b_geom_idx1 ON public.hdu01_b USING gist (geom);


--
-- Name: rel01_p_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rel01_p_geom_idx ON public.rel01_p USING gist (geom);


--
-- Name: rel01_p_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rel01_p_geom_idx1 ON public.rel01_p USING gist (geom);


--
-- Name: sidx_GN250_b_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "sidx_GN250_b_geom" ON public."GN250_b" USING gist (geom);


--
-- Name: sidx_ver01_l_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_ver01_l_geom ON public.ver01_l USING gist (geom);


--
-- Name: sidx_ver06_l_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_ver06_l_geom ON public.ver06_l USING gist (geom);


--
-- Name: sie01_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie01_f_geom_idx ON public.sie01_f USING gist (geom);


--
-- Name: sie01_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie01_f_geom_idx1 ON public.sie01_f USING gist (geom);


--
-- Name: sie01_p_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie01_p_geom_idx ON public.sie01_p USING gist (geom);


--
-- Name: sie01_p_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie01_p_geom_idx1 ON public.sie01_p USING gist (geom);


--
-- Name: sie02_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie02_f_geom_idx ON public.sie02_f USING gist (geom);


--
-- Name: sie02_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie02_f_geom_idx1 ON public.sie02_f USING gist (geom);


--
-- Name: sie03_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie03_l_geom_idx ON public.sie03_l USING gist (geom);


--
-- Name: sie03_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie03_l_geom_idx1 ON public.sie03_l USING gist (geom);


--
-- Name: sie04_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_f_geom_idx ON public.sie04_f USING gist (geom);


--
-- Name: sie04_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_f_geom_idx1 ON public.sie04_f USING gist (geom);


--
-- Name: sie04_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_l_geom_idx ON public.sie04_l USING gist (geom);


--
-- Name: sie04_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_l_geom_idx1 ON public.sie04_l USING gist (geom);


--
-- Name: sie04_p_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_p_geom_idx ON public.sie04_p USING gist (geom);


--
-- Name: sie04_p_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie04_p_geom_idx1 ON public.sie04_p USING gist (geom);


--
-- Name: sie05_p_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sie05_p_geom_idx ON public.sie05_p USING gist (geom);


--
-- Name: veg01_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg01_f_geom_idx ON public.veg01_f USING gist (geom);


--
-- Name: veg01_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg01_f_geom_idx1 ON public.veg01_f USING gist (geom);


--
-- Name: veg02_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg02_f_geom_idx ON public.veg02_f USING gist (geom);


--
-- Name: veg02_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg02_f_geom_idx1 ON public.veg02_f USING gist (geom);


--
-- Name: veg03_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg03_f_geom_idx ON public.veg03_f USING gist (geom);


--
-- Name: veg03_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg03_f_geom_idx1 ON public.veg03_f USING gist (geom);


--
-- Name: veg04_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg04_f_geom_idx ON public.veg04_f USING gist (geom);


--
-- Name: veg04_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX veg04_f_geom_idx1 ON public.veg04_f USING gist (geom);


--
-- Name: ver02_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver02_l_geom_idx ON public.ver02_l USING gist (geom);


--
-- Name: ver02_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver02_l_geom_idx1 ON public.ver02_l USING gist (geom);


--
-- Name: ver03_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver03_f_geom_idx ON public.ver03_f USING gist (geom);


--
-- Name: ver03_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver03_f_geom_idx1 ON public.ver03_f USING gist (geom);


--
-- Name: ver03_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver03_l_geom_idx ON public.ver03_l USING gist (geom);


--
-- Name: ver03_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver03_l_geom_idx1 ON public.ver03_l USING gist (geom);


--
-- Name: ver04_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver04_f_geom_idx ON public.ver04_f USING gist (geom);


--
-- Name: ver04_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver04_f_geom_idx1 ON public.ver04_f USING gist (geom);


--
-- Name: ver05_l_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver05_l_geom_idx ON public.ver05_l USING gist (geom);


--
-- Name: ver05_l_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver05_l_geom_idx1 ON public.ver05_l USING gist (geom);


--
-- Name: ver06_f_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver06_f_geom_idx ON public.ver06_f USING gist (geom);


--
-- Name: ver06_f_geom_idx1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ver06_f_geom_idx1 ON public.ver06_f USING gist (geom);


--
-- PostgreSQL database dump complete
--

