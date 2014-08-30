--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aream; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE aream (
    id integer NOT NULL,
    entdate timestamp without time zone,
    entmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    entclt character varying(20) DEFAULT ''::character varying NOT NULL,
    edtdate timestamp without time zone,
    edtmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    edtclt character varying(20) DEFAULT ''::character varying NOT NULL,
    area_cd numeric(4,0) DEFAULT 0 NOT NULL,
    area_j character varying(40) DEFAULT ''::character varying NOT NULL,
    area_a character varying(40) DEFAULT ''::character varying NOT NULL,
    area_k character varying(40) DEFAULT ''::character varying NOT NULL
);


--
-- Name: aream_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE aream_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: aream_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE aream_id_seq OWNED BY aream.id;


--
-- Name: bankm; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bankm (
    id integer NOT NULL,
    entdate timestamp without time zone,
    entmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    entclt character varying(20) DEFAULT ''::character varying NOT NULL,
    edtdate timestamp without time zone,
    edtmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    edtclt character varying(20) DEFAULT ''::character varying NOT NULL,
    bank_cd numeric(4,0) DEFAULT 0 NOT NULL,
    bank_j character varying(40) DEFAULT ''::character varying NOT NULL,
    bank_a character varying(40) DEFAULT ''::character varying NOT NULL,
    bank_k character varying(40) DEFAULT ''::character varying NOT NULL,
    banksm_id integer
);


--
-- Name: bankm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bankm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: bankm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bankm_id_seq OWNED BY bankm.id;


--
-- Name: bankms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bankms (
    entdate timestamp without time zone,
    entmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    entclt character varying(20) DEFAULT ''::character varying NOT NULL,
    edtdate timestamp without time zone,
    edtmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    edtclt character varying(20) DEFAULT ''::character varying NOT NULL,
    bank_cd numeric(4,0) DEFAULT 0 NOT NULL,
    bank_j character varying(40) DEFAULT ''::character varying NOT NULL,
    bank_a character varying(40) DEFAULT ''::character varying NOT NULL,
    bank_k character varying(40) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: banksms; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE banksms (
    entdate timestamp without time zone,
    entmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    entclt character varying(20) DEFAULT ''::character varying NOT NULL,
    edtdate timestamp without time zone,
    edtmcn character varying(20) DEFAULT ''::character varying NOT NULL,
    edtclt character varying(20) DEFAULT ''::character varying NOT NULL,
    bank_cd numeric(4,0) DEFAULT 0 NOT NULL,
    banks_cd numeric(3,0) DEFAULT 0 NOT NULL,
    banks_ed numeric(1,0) DEFAULT 0 NOT NULL,
    banks_j character varying(40) DEFAULT ''::character varying NOT NULL,
    banks_a character varying(40) DEFAULT ''::character varying NOT NULL,
    banks_k character varying(40) DEFAULT ''::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: lineups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lineups (
    id integer NOT NULL,
    bankm_id integer,
    banksm_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: lineups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lineups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: lineups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lineups_id_seq OWNED BY lineups.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY aream ALTER COLUMN id SET DEFAULT nextval('aream_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bankm ALTER COLUMN id SET DEFAULT nextval('bankm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lineups ALTER COLUMN id SET DEFAULT nextval('lineups_id_seq'::regclass);


--
-- Name: aream_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY aream
    ADD CONSTRAINT aream_pkey PRIMARY KEY (id);


--
-- Name: bankm_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bankm
    ADD CONSTRAINT bankm_pkey PRIMARY KEY (id);


--
-- Name: lineups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lineups
    ADD CONSTRAINT lineups_pkey PRIMARY KEY (id);


--
-- Name: index_bankm_on_banksm_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bankm_on_banksm_id ON bankm USING btree (banksm_id);


--
-- Name: index_bankms_on_bank_cd; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_bankms_on_bank_cd ON bankms USING btree (bank_cd);


--
-- Name: index_banksms_on_bank_cd_and_banks_cd_and_banks_ed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_banksms_on_bank_cd_and_banks_cd_and_banks_ed ON banksms USING btree (bank_cd, banks_cd, banks_ed);


--
-- Name: index_banksms_on_bank_cd_and_banks_j; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_banksms_on_bank_cd_and_banks_j ON banksms USING btree (bank_cd, banks_j);


--
-- Name: index_lineups_on_bankm_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_lineups_on_bankm_id ON lineups USING btree (bankm_id);


--
-- Name: index_lineups_on_banksm_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_lineups_on_banksm_id ON lineups USING btree (banksm_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140825011638');

INSERT INTO schema_migrations (version) VALUES ('20140825012349');

INSERT INTO schema_migrations (version) VALUES ('20140829015734');

INSERT INTO schema_migrations (version) VALUES ('20140830042039');
