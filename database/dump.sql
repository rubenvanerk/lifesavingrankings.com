--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.3 (Ubuntu 14.3-1.pgdg20.04+1)

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
-- Name: athlete_id_types; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.athlete_id_types (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL
);


ALTER TABLE public.athlete_id_types OWNER TO lifesavingrankings;

--
-- Name: athlete_id_types_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.athlete_id_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athlete_id_types_id_seq OWNER TO lifesavingrankings;

--
-- Name: athlete_id_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.athlete_id_types_id_seq OWNED BY public.athlete_id_types.id;


--
-- Name: athlete_ids; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.athlete_ids (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    athlete_id_type_id bigint NOT NULL,
    athlete_id bigint NOT NULL,
    id_value character varying(255) NOT NULL
);


ALTER TABLE public.athlete_ids OWNER TO lifesavingrankings;

--
-- Name: athlete_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.athlete_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athlete_ids_id_seq OWNER TO lifesavingrankings;

--
-- Name: athlete_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.athlete_ids_id_seq OWNED BY public.athlete_ids.id;


--
-- Name: athletes; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.athletes (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    year_of_birth smallint,
    gender smallint NOT NULL,
    alias_of bigint,
    country_codes json
);


ALTER TABLE public.athletes OWNER TO lifesavingrankings;

--
-- Name: athletes_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.athletes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.athletes_id_seq OWNER TO lifesavingrankings;

--
-- Name: athletes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.athletes_id_seq OWNED BY public.athletes.id;


--
-- Name: competition_categories; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.competition_categories (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    competition_id bigint NOT NULL
);


ALTER TABLE public.competition_categories OWNER TO lifesavingrankings;

--
-- Name: competition_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.competition_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_categories_id_seq OWNER TO lifesavingrankings;

--
-- Name: competition_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.competition_categories_id_seq OWNED BY public.competition_categories.id;


--
-- Name: competition_venue; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.competition_venue (
    id bigint NOT NULL,
    competition_id bigint NOT NULL,
    venue_id bigint NOT NULL
);


ALTER TABLE public.competition_venue OWNER TO lifesavingrankings;

--
-- Name: competition_venue_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.competition_venue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competition_venue_id_seq OWNER TO lifesavingrankings;

--
-- Name: competition_venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.competition_venue_id_seq OWNED BY public.competition_venue.id;


--
-- Name: competitions; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.competitions (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    timekeeping smallint DEFAULT '0'::smallint NOT NULL,
    published_at timestamp(0) without time zone,
    status smallint DEFAULT '0'::smallint NOT NULL,
    comment character varying(512),
    ils_sanctioned boolean DEFAULT false NOT NULL,
    file_link character varying(255),
    videos json
);


ALTER TABLE public.competitions OWNER TO lifesavingrankings;

--
-- Name: competitions_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.competitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competitions_id_seq OWNER TO lifesavingrankings;

--
-- Name: competitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.competitions_id_seq OWNED BY public.competitions.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    type smallint NOT NULL,
    sort_order smallint NOT NULL
);


ALTER TABLE public.events OWNER TO lifesavingrankings;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO lifesavingrankings;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO lifesavingrankings;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO lifesavingrankings;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_statuses; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.job_statuses (
    id integer NOT NULL,
    job_id character varying(255),
    type character varying(255) NOT NULL,
    queue character varying(255),
    attempts integer DEFAULT 0 NOT NULL,
    progress_now integer DEFAULT 0 NOT NULL,
    progress_max integer DEFAULT 0 NOT NULL,
    status character varying(16) DEFAULT 'queued'::character varying NOT NULL,
    input text,
    output text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    started_at timestamp(0) without time zone,
    finished_at timestamp(0) without time zone
);


ALTER TABLE public.job_statuses OWNER TO lifesavingrankings;

--
-- Name: job_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.job_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_statuses_id_seq OWNER TO lifesavingrankings;

--
-- Name: job_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.job_statuses_id_seq OWNED BY public.job_statuses.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO lifesavingrankings;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO lifesavingrankings;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL,
    uuid uuid,
    collection_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    mime_type character varying(255),
    disk character varying(255) NOT NULL,
    conversions_disk character varying(255),
    size bigint NOT NULL,
    manipulations json NOT NULL,
    custom_properties json NOT NULL,
    generated_conversions json NOT NULL,
    responsive_images json NOT NULL,
    order_column integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.media OWNER TO lifesavingrankings;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO lifesavingrankings;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO lifesavingrankings;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO lifesavingrankings;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO lifesavingrankings;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO lifesavingrankings;

--
-- Name: parser_configs; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.parser_configs (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    options json,
    media_id bigint NOT NULL,
    job_status_id bigint
);


ALTER TABLE public.parser_configs OWNER TO lifesavingrankings;

--
-- Name: parser_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.parser_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parser_configs_id_seq OWNER TO lifesavingrankings;

--
-- Name: parser_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.parser_configs_id_seq OWNED BY public.parser_configs.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO lifesavingrankings;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO lifesavingrankings;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO lifesavingrankings;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: relay_segments; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.relay_segments (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    event_id bigint NOT NULL,
    segment_id bigint NOT NULL,
    "order" smallint NOT NULL
);


ALTER TABLE public.relay_segments OWNER TO lifesavingrankings;

--
-- Name: relay_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.relay_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relay_segments_id_seq OWNER TO lifesavingrankings;

--
-- Name: relay_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.relay_segments_id_seq OWNED BY public.relay_segments.id;


--
-- Name: relay_teams; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.relay_teams (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    gender smallint NOT NULL,
    country_code character varying(2),
    competition_id bigint NOT NULL
);


ALTER TABLE public.relay_teams OWNER TO lifesavingrankings;

--
-- Name: relay_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.relay_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relay_teams_id_seq OWNER TO lifesavingrankings;

--
-- Name: relay_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.relay_teams_id_seq OWNED BY public.relay_teams.id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.results (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    original_line_number integer,
    original_line character varying(255),
    entrant_type character varying(255) NOT NULL,
    entrant_id bigint NOT NULL,
    competition_id bigint NOT NULL,
    event_id bigint NOT NULL,
    status smallint,
    "time" integer,
    team_id bigint,
    media_id bigint NOT NULL,
    competition_category_id bigint,
    splits json,
    parent_id bigint
);


ALTER TABLE public.results OWNER TO lifesavingrankings;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.results_id_seq OWNER TO lifesavingrankings;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO lifesavingrankings;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO lifesavingrankings;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO lifesavingrankings;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.sponsors (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    valid_from date,
    valid_until date,
    enabled boolean NOT NULL
);


ALTER TABLE public.sponsors OWNER TO lifesavingrankings;

--
-- Name: sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.sponsors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sponsors_id_seq OWNER TO lifesavingrankings;

--
-- Name: sponsors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.sponsors_id_seq OWNED BY public.sponsors.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.teams (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    country_code character varying(2),
    is_national_team boolean DEFAULT false NOT NULL
);


ALTER TABLE public.teams OWNER TO lifesavingrankings;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO lifesavingrankings;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO lifesavingrankings;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lifesavingrankings;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: venues; Type: TABLE; Schema: public; Owner: lifesavingrankings
--

CREATE TABLE public.venues (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country_code character varying(2) NOT NULL,
    type smallint NOT NULL,
    pool_size integer
);


ALTER TABLE public.venues OWNER TO lifesavingrankings;

--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: lifesavingrankings
--

CREATE SEQUENCE public.venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venues_id_seq OWNER TO lifesavingrankings;

--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lifesavingrankings
--

ALTER SEQUENCE public.venues_id_seq OWNED BY public.venues.id;


--
-- Name: athlete_id_types id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athlete_id_types ALTER COLUMN id SET DEFAULT nextval('public.athlete_id_types_id_seq'::regclass);


--
-- Name: athlete_ids id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athlete_ids ALTER COLUMN id SET DEFAULT nextval('public.athlete_ids_id_seq'::regclass);


--
-- Name: athletes id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athletes ALTER COLUMN id SET DEFAULT nextval('public.athletes_id_seq'::regclass);


--
-- Name: competition_categories id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_categories ALTER COLUMN id SET DEFAULT nextval('public.competition_categories_id_seq'::regclass);


--
-- Name: competition_venue id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_venue ALTER COLUMN id SET DEFAULT nextval('public.competition_venue_id_seq'::regclass);


--
-- Name: competitions id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competitions ALTER COLUMN id SET DEFAULT nextval('public.competitions_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: job_statuses id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.job_statuses ALTER COLUMN id SET DEFAULT nextval('public.job_statuses_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: parser_configs id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.parser_configs ALTER COLUMN id SET DEFAULT nextval('public.parser_configs_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: relay_segments id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_segments ALTER COLUMN id SET DEFAULT nextval('public.relay_segments_id_seq'::regclass);


--
-- Name: relay_teams id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_teams ALTER COLUMN id SET DEFAULT nextval('public.relay_teams_id_seq'::regclass);


--
-- Name: results id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: sponsors id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.sponsors ALTER COLUMN id SET DEFAULT nextval('public.sponsors_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: venues id; Type: DEFAULT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.venues ALTER COLUMN id SET DEFAULT nextval('public.venues_id_seq'::regclass);


--
-- Data for Name: athlete_id_types; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.athlete_id_types (id, created_at, updated_at, name) FROM stdin;
\.


--
-- Data for Name: athlete_ids; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.athlete_ids (id, created_at, updated_at, athlete_id_type_id, athlete_id, id_value) FROM stdin;
\.


--
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.athletes (id, created_at, updated_at, name, slug, year_of_birth, gender, alias_of, country_codes) FROM stdin;
1	2022-02-06 13:49:48	2022-02-06 13:49:48	Livia Elisa FIORI	livia-elisa-fiori	2002	2	\N	\N
2	2022-02-06 13:49:48	2022-02-06 13:49:48	Sasha REID	sasha-reid	2002	2	\N	\N
3	2022-02-06 13:49:48	2022-02-06 13:49:48	M. RODRIGUEZ RODDRIGUEZ DE LA SIERRA	m-rodriguez-roddriguez-de-la-sierra	2004	2	\N	\N
4	2022-02-06 13:49:48	2022-02-06 13:49:48	Gioia MAZZI	gioia-mazzi	2004	2	\N	\N
5	2022-02-06 13:49:48	2022-02-06 13:49:48	Elsa LOPEZ RUIZ	elsa-lopez-ruiz	2002	2	\N	\N
6	2022-02-06 13:49:48	2022-02-06 13:49:48	Emma SANCHEZ IBERTI	emma-sanchez-iberti	2002	2	\N	\N
7	2022-02-06 13:49:48	2022-02-06 13:49:48	Masha GIORDANO	masha-giordano	2004	2	\N	\N
8	2022-02-06 13:49:48	2022-02-06 13:49:48	Claudia NORIEGA MARTIN	claudia-noriega-martin	2003	2	\N	\N
9	2022-02-06 13:49:48	2022-02-06 13:49:48	Helene Marie OESTMO	helene-marie-oestmo	2003	2	\N	\N
10	2022-02-06 13:49:48	2022-02-06 13:49:48	Sara DELL'OSPEDALE	sara-dellospedale	2003	2	\N	\N
11	2022-02-06 13:49:48	2022-02-06 13:49:48	Johanna SCHREIBER	johanna-schreiber	2001	2	\N	\N
12	2022-02-06 13:49:48	2022-02-06 13:49:48	Angela GUIJARRO HAZAS	angela-guijarro-hazas	2004	2	\N	\N
13	2022-02-06 13:49:48	2022-02-06 13:49:48	Katerina SVEHLOVA	katerina-svehlova	2003	2	\N	\N
14	2022-02-06 13:49:48	2022-02-06 13:49:48	Elise CROES	elise-croes	2004	2	\N	\N
15	2022-02-06 13:49:48	2022-02-06 13:49:48	Karolina BEZPALCOVA	karolina-bezpalcova	2003	2	\N	\N
16	2022-02-06 13:49:48	2022-02-06 13:49:48	Bara KOTOUCOVA	bara-kotoucova	2004	2	\N	\N
17	2022-02-06 13:49:48	2022-02-06 13:49:48	Finja NIENABER	finja-nienaber	2003	2	\N	\N
18	2022-02-06 13:49:48	2022-02-06 13:49:48	Malin BEUSE	malin-beuse	2001	2	\N	\N
19	2022-02-06 13:49:48	2022-02-06 13:49:48	Danique KLOMP	danique-klomp	2002	2	\N	\N
20	2022-02-06 13:49:48	2022-02-06 13:49:48	Anne DICKENS	anne-dickens	2001	2	\N	\N
21	2022-02-06 13:49:48	2022-02-06 13:49:48	Irene CARADONNA	irene-caradonna	2001	2	\N	\N
22	2022-02-06 13:49:48	2022-02-06 13:49:48	Lotte ISTAS	lotte-istas	2004	2	\N	\N
23	2022-02-06 13:49:48	2022-02-06 13:49:48	Giulia SIMONI	giulia-simoni	2002	2	\N	\N
24	2022-02-06 13:49:48	2022-02-06 13:49:48	Ine AASUM	ine-aasum	2002	2	\N	\N
25	2022-02-06 13:49:48	2022-02-06 13:49:48	Abigail DEN BOEF	abigail-den-boef	2002	2	\N	\N
26	2022-02-06 13:49:48	2022-02-06 13:49:48	Fleur BECKERS	fleur-beckers	2002	2	\N	\N
27	2022-02-06 13:49:48	2022-02-06 13:49:48	Lilli HERZBERG	lilli-herzberg	2004	2	\N	\N
28	2022-02-06 13:49:48	2022-02-06 13:49:48	Isabel VAN LOON	isabel-van-loon	2002	2	\N	\N
29	2022-02-06 13:49:48	2022-02-06 13:49:48	Mia MARHEINE	mia-marheine	2004	2	\N	\N
30	2022-02-06 13:49:48	2022-02-06 13:49:48	Renske DALHUISEN	renske-dalhuisen	2003	2	\N	\N
31	2022-02-06 13:49:48	2022-02-06 13:49:48	Dyonne KLOMP	dyonne-klomp	2004	2	\N	\N
32	2022-02-06 13:49:48	2022-02-06 13:49:48	Veronika VYMOLOVA	veronika-vymolova	2001	2	\N	\N
33	2022-02-06 13:49:48	2022-02-06 13:49:48	Louisa MODDER	louisa-modder	2002	2	\N	\N
34	2022-02-06 13:49:48	2022-02-06 13:49:48	Julia Zoe TITZE	julia-zoe-titze	2004	2	\N	\N
35	2022-02-06 13:49:48	2022-02-06 13:49:48	Nathalie PISTERS	nathalie-pisters	2001	2	\N	\N
36	2022-02-06 13:49:48	2022-02-06 13:49:48	Jessica LITTLE - SECOMBE	jessica-little-secombe	2002	2	\N	\N
37	2022-02-06 13:49:48	2022-02-06 13:49:48	Noemi MONTENEGRO	noemi-montenegro	2003	2	\N	\N
38	2022-02-06 13:49:48	2022-02-06 13:49:48	Milly BRADLEY	milly-bradley	2003	2	\N	\N
39	2022-02-06 13:49:48	2022-02-06 13:49:48	Hanna SPUERCK	hanna-spuerck	2003	2	\N	\N
40	2022-02-06 13:49:48	2022-02-06 13:49:48	Ida HOVIND GROEV	ida-hovind-groev	2003	2	\N	\N
41	2022-02-06 13:49:48	2022-02-06 13:49:48	Alena MODDER	alena-modder	2002	2	\N	\N
42	2022-02-06 13:49:48	2022-02-06 13:49:48	Maja SPLIETHOFF	maja-spliethoff	2004	2	\N	\N
43	2022-02-06 13:49:48	2022-02-06 13:49:48	Sanne DE KONING	sanne-de-koning	2004	2	\N	\N
44	2022-02-06 13:49:48	2022-02-06 13:49:48	Carmen HAUSER	carmen-hauser	2002	2	\N	\N
45	2022-02-06 13:49:48	2022-02-06 13:49:48	Ineke RAS	ineke-ras	2001	2	\N	\N
46	2022-02-06 13:49:48	2022-02-06 13:49:48	Sarah KLINGER	sarah-klinger	2003	2	\N	\N
47	2022-02-06 13:49:48	2022-02-06 13:49:48	Lena SCHOSTOK	lena-schostok	2004	2	\N	\N
48	2022-02-06 13:49:48	2022-02-06 13:49:48	Sarah THUMM	sarah-thumm	2003	2	\N	\N
49	2022-02-06 13:49:48	2022-02-06 13:49:48	Laura DE JONG	laura-de-jong	2003	2	\N	\N
50	2022-02-06 13:49:48	2022-02-06 13:49:48	Leonie SCHIEFER	leonie-schiefer	2002	2	\N	\N
51	2022-02-06 13:49:48	2022-02-06 13:49:48	Jennifer VAN ELP	jennifer-van-elp	2001	2	\N	\N
52	2022-02-06 13:49:48	2022-02-06 13:49:48	Franka VOGEL	franka-vogel	2003	2	\N	\N
53	2022-02-06 13:49:48	2022-02-06 13:49:48	Hannah GOETZENS	hannah-goetzens	2003	2	\N	\N
54	2022-02-06 13:49:48	2022-02-06 13:49:48	Madeleine THIEL	madeleine-thiel	2001	2	\N	\N
55	2022-02-06 13:49:48	2022-02-06 13:49:48	Kim GERAATS	kim-geraats	2004	2	\N	\N
56	2022-02-06 13:49:48	2022-02-06 13:49:48	Lara HOEFFLER	lara-hoeffler	2003	2	\N	\N
57	2022-02-06 13:49:48	2022-02-06 13:49:48	Fabienne JANSSEN	fabienne-janssen	2003	2	\N	\N
58	2022-02-06 13:49:48	2022-02-06 13:49:48	Esra KILIC	esra-kilic	2003	2	\N	\N
59	2022-02-06 13:49:48	2022-02-06 13:49:48	Saskia BESE	saskia-bese	2003	2	\N	\N
60	2022-02-06 13:49:48	2022-02-06 13:49:48	Julia SCHAEFER	julia-schaefer	2004	2	\N	\N
61	2022-02-06 13:49:48	2022-02-06 13:49:48	Maria HEINRICHS	maria-heinrichs	2003	2	\N	\N
62	2022-02-06 13:49:48	2022-02-06 13:49:48	Pip EGGERDING	pip-eggerding	2003	2	\N	\N
63	2022-02-06 13:49:48	2022-02-06 13:49:48	Elyne VOOGD	elyne-voogd	2003	2	\N	\N
64	2022-02-06 13:49:48	2022-02-06 13:49:48	Lea LISSMANN	lea-lissmann	2003	2	\N	\N
65	2022-02-06 13:49:48	2022-02-06 13:49:48	Annika BUEHLER	annika-buehler	2004	2	\N	\N
66	2022-02-06 13:49:48	2022-02-06 13:49:48	Aybueke GUEVEN	aybueke-gueven	2003	2	\N	\N
67	2022-02-06 13:49:48	2022-02-06 13:49:48	Jorid SEITZ	jorid-seitz	2004	2	\N	\N
68	2022-02-06 13:49:48	2022-02-06 13:49:48	Mareike EUBE	mareike-eube	2003	2	\N	\N
69	2022-02-06 13:49:48	2022-02-06 13:49:48	Elise DON	elise-don	2003	2	\N	\N
70	2022-02-06 13:49:48	2022-02-06 13:49:48	Amber MUIS	amber-muis	2004	2	\N	\N
71	2022-02-06 13:49:48	2022-02-06 13:49:48	Anne VAN ES	anne-van-es	2004	2	\N	\N
72	2022-02-06 13:49:48	2022-02-06 13:49:48	Kyra VRENKEN	kyra-vrenken	2004	2	\N	\N
74	2022-02-06 13:49:48	2022-02-06 13:49:48	Zhang SISHI	zhang-sishi	1993	2	\N	\N
76	2022-02-06 13:49:48	2022-02-06 13:49:48	Chelsea GILLETT	chelsea-gillett	1997	2	\N	\N
77	2022-02-06 13:49:48	2022-02-06 13:49:48	Francesca CRISTETTI	francesca-cristetti	1997	2	\N	\N
78	2022-02-06 13:49:48	2022-02-06 13:49:48	Sara ONGARO	sara-ongaro	1999	2	\N	\N
79	2022-02-06 13:49:48	2022-02-06 13:49:48	Mariah JONES	mariah-jones	1993	2	\N	\N
80	2022-02-06 13:49:48	2022-02-06 13:49:48	Tsz Ching MS CHAN	tsz-ching-ms-chan	2000	2	\N	\N
81	2022-02-06 13:49:48	2022-02-06 13:49:48	Nuria PAYOLA ANGLADA	nuria-payola-anglada	1999	2	\N	\N
82	2022-02-06 13:49:48	2022-02-06 13:49:48	Esther GARCIA DE LA VIRGEN	esther-garcia-de-la-virgen	1999	2	\N	\N
83	2022-02-06 13:49:48	2022-02-06 13:49:48	Laura MALAVE CASCALES	laura-malave-cascales	1998	2	\N	\N
73	2022-02-06 13:49:48	2022-02-07 18:20:25	Prue DAVIES	prue-davies	1997	2	\N	["AU"]
84	2022-02-06 13:49:48	2022-02-06 13:49:48	Nerea VILA GARRO	nerea-vila-garro	1998	2	\N	\N
85	2022-02-06 13:49:48	2022-02-06 13:49:48	Geng MENGYU	geng-mengyu	2000	2	\N	\N
86	2022-02-06 13:49:48	2022-02-06 13:49:48	Carolina GANADO AMADOR	carolina-ganado-amador	1999	2	\N	\N
87	2022-02-06 13:49:48	2022-02-06 13:49:48	Tereza POLACHOVA	tereza-polachova	1997	2	\N	\N
88	2022-02-06 13:49:48	2022-02-06 13:49:48	Celina SEIDEL	celina-seidel	1999	2	\N	\N
89	2022-02-06 13:49:48	2022-02-06 13:49:48	Fiona MEUFFELS	fiona-meuffels	1995	2	\N	\N
90	2022-02-06 13:49:48	2022-02-06 13:49:48	Vera MOONEN	vera-moonen	1998	2	\N	\N
91	2022-02-06 13:49:48	2022-02-06 13:49:48	Aniek RESINK	aniek-resink	1995	2	\N	\N
92	2022-02-06 13:49:48	2022-02-06 13:49:48	Jessica GRAU	jessica-grau	2000	2	\N	\N
93	2022-02-06 13:49:48	2022-02-06 13:49:48	Chiara BERTUOLA	chiara-bertuola	1999	2	\N	\N
94	2022-02-06 13:49:49	2022-02-06 13:49:49	Celine BRINK	celine-brink	2000	2	\N	\N
95	2022-02-06 13:49:49	2022-02-06 13:49:49	Merle HINRICHS	merle-hinrichs	1997	2	\N	\N
96	2022-02-06 13:49:49	2022-02-06 13:49:49	Emelye SANDERS	emelye-sanders	1999	2	\N	\N
97	2022-02-06 13:49:49	2022-02-06 13:49:49	Ginevra CHIARAVALLI	ginevra-chiaravalli	1997	2	\N	\N
98	2022-02-06 13:49:49	2022-02-06 13:49:49	Denise DE VRIES	denise-de-vries	1991	2	\N	\N
99	2022-02-06 13:49:49	2022-02-06 13:49:49	Nynke YTSMA	nynke-ytsma	1997	2	\N	\N
100	2022-02-06 13:49:49	2022-02-06 13:49:49	Sam CARPENTER	sam-carpenter	1996	2	\N	\N
101	2022-02-06 13:49:49	2022-02-06 13:49:49	Daniela MARTY	daniela-marty	1995	2	\N	\N
102	2022-02-06 13:49:49	2022-02-06 13:49:49	Johanna SCHULTE	johanna-schulte	2000	2	\N	\N
103	2022-02-06 13:49:49	2022-02-06 13:49:49	Marsha VAN DEN HEUVEL	marsha-van-den-heuvel	1998	2	\N	\N
104	2022-02-06 13:49:49	2022-02-06 13:49:49	Vannessa SCHULTZ	vannessa-schultz	1996	2	\N	\N
105	2022-02-06 13:49:49	2022-02-06 13:49:49	Ricarda GOTTSCHLICH	ricarda-gottschlich	1998	2	\N	\N
106	2022-02-06 13:49:49	2022-02-06 13:49:49	Lara SPUERCK	lara-spuerck	1999	2	\N	\N
107	2022-02-06 13:49:49	2022-02-06 13:49:49	Saskia STEIN	saskia-stein	1998	2	\N	\N
108	2022-02-06 13:49:49	2022-02-06 13:49:49	Saskia JOHNEN	saskia-johnen	2000	2	\N	\N
109	2022-02-06 13:49:49	2022-02-06 13:49:49	Isabelle JANSSEN	isabelle-janssen	2000	2	\N	\N
110	2022-02-06 13:49:49	2022-02-06 13:49:49	Patricia LENZ	patricia-lenz	1997	2	\N	\N
111	2022-02-06 13:49:49	2022-02-06 13:49:49	Kelly VAN ZADEL	kelly-van-zadel	1990	2	\N	\N
112	2022-02-06 13:49:49	2022-02-06 13:49:49	Renee BOUTER	renee-bouter	1998	2	\N	\N
113	2022-02-06 13:49:49	2022-02-06 13:49:49	Chantal GALLASCH	chantal-gallasch	1993	2	\N	\N
114	2022-02-06 13:49:49	2022-02-06 13:49:49	Cadie CHANDLER	cadie-chandler	1999	2	\N	\N
115	2022-02-06 13:49:49	2022-02-06 13:49:49	Sarah SCHNEIDER	sarah-schneider	1992	2	\N	\N
116	2022-02-06 13:49:49	2022-02-06 13:49:49	Antonia RENTSCHLER	antonia-rentschler	1997	2	\N	\N
117	2022-02-06 13:49:49	2022-02-06 13:49:49	Svenja OSTENDORP	svenja-ostendorp	1994	2	\N	\N
118	2022-02-06 13:49:49	2022-02-06 13:49:49	Bo VAN DUIJNHOVEN	bo-van-duijnhoven	1996	2	\N	\N
119	2022-02-06 13:49:49	2022-02-06 13:49:49	Marisa BRUNNER	marisa-brunner	1998	2	\N	\N
120	2022-02-06 13:49:49	2022-02-06 13:49:49	Maike NIEUWENHUIS	maike-nieuwenhuis	1994	2	\N	\N
121	2022-02-06 13:49:49	2022-02-06 13:49:49	Nele VANBUEL	nele-vanbuel	1985	2	\N	\N
122	2022-02-06 13:49:49	2022-02-06 13:49:49	Sina WIENHOLDT	sina-wienholdt	1989	2	\N	\N
123	2022-02-06 13:49:49	2022-02-06 13:49:49	Christina SCHULTE	christina-schulte	1982	2	\N	\N
124	2022-02-06 13:49:49	2022-02-06 13:49:49	Ine VISTER	ine-vister	1984	2	\N	\N
125	2022-02-06 13:49:49	2022-02-06 13:49:49	Claudine ROEMEN	claudine-roemen	1974	2	\N	\N
126	2022-02-06 13:49:49	2022-02-06 13:49:49	Francoise DURAND	francoise-durand	1969	2	\N	\N
129	2022-02-06 13:49:49	2022-02-06 13:49:49	Ling HUANAN	ling-huanan	1997	1	\N	\N
130	2022-02-06 13:49:49	2022-02-06 13:49:49	Jake SMITH	jake-smith	1997	1	\N	\N
131	2022-02-06 13:49:49	2022-02-06 13:49:49	Jacob LOUGHNAN	jacob-loughnan	2000	1	\N	\N
132	2022-02-06 13:49:49	2022-02-06 13:49:49	Edoardo Giuseppe PIROLA	edoardo-giuseppe-pirola	1999	1	\N	\N
133	2022-02-06 13:49:49	2022-02-06 13:49:49	Marco BALDI	marco-baldi	1995	1	\N	\N
134	2022-02-06 13:49:49	2022-02-06 13:49:49	Thomas HOLZENDORF DIONIS	thomas-holzendorf-dionis	1997	1	\N	\N
135	2022-02-06 13:49:49	2022-02-06 13:49:49	Jack MEERTEN	jack-meerten	1997	1	\N	\N
136	2022-02-06 13:49:49	2022-02-06 13:49:49	Feys SAMMY	feys-sammy	2000	1	\N	\N
137	2022-02-06 13:49:49	2022-02-06 13:49:49	Youri KOOL	youri-kool	1996	1	\N	\N
138	2022-02-06 13:49:49	2022-02-06 13:49:49	Rick BONGERS	rick-bongers	2000	1	\N	\N
139	2022-02-06 13:49:49	2022-02-06 13:49:49	Steven DEFOIN	steven-defoin	1996	1	\N	\N
140	2022-02-06 13:49:49	2022-02-06 13:49:49	Chin Chun MR LAM	chin-chun-mr-lam	1997	1	\N	\N
141	2022-02-06 13:49:49	2022-02-06 13:49:49	Steffen HONOLD	steffen-honold	1999	1	\N	\N
142	2022-02-06 13:49:49	2022-02-06 13:49:49	Luuk WILLEMS	luuk-willems	1997	1	\N	\N
143	2022-02-06 13:49:49	2022-02-06 13:49:49	Oliver WANGER	oliver-wanger	1992	1	\N	\N
144	2022-02-06 13:49:49	2022-02-06 13:49:49	Philipp LENGKEIT	philipp-lengkeit	1993	1	\N	\N
145	2022-02-06 13:49:49	2022-02-06 13:49:49	Noah MEIERTOBERENS	noah-meiertoberens	1999	1	\N	\N
146	2022-02-06 13:49:49	2022-02-06 13:49:49	luigi MARUOTTI	luigi-maruotti	1997	1	\N	\N
147	2022-02-06 13:49:49	2022-02-06 13:49:49	Bas BRAUN	bas-braun	1991	1	\N	\N
148	2022-02-06 13:49:49	2022-02-06 13:49:49	Felix BRANDL	felix-brandl	1996	1	\N	\N
149	2022-02-06 13:49:49	2022-02-06 13:49:49	Kevin HOBBEL	kevin-hobbel	1997	1	\N	\N
150	2022-02-06 13:49:49	2022-02-06 13:49:49	Tim DE REUVER	tim-de-reuver	1999	1	\N	\N
151	2022-02-06 13:49:49	2022-02-06 13:49:49	Tom VAN VAN DAM	tom-van-van-dam	1992	1	\N	\N
152	2022-02-06 13:49:49	2022-02-06 13:49:49	Alessandro SBAFFONI	alessandro-sbaffoni	2000	1	\N	\N
153	2022-02-06 13:49:49	2022-02-06 13:49:49	Bauke YTSMA	bauke-ytsma	1993	1	\N	\N
154	2022-02-06 13:49:49	2022-02-06 13:49:49	John MEERTEN	john-meerten	1997	1	\N	\N
155	2022-02-06 13:49:49	2022-02-06 13:49:49	Christopher BECKER	christopher-becker	1997	1	\N	\N
156	2022-02-06 13:49:49	2022-02-06 13:49:49	Jan-Henrik NIMZ	jan-henrik-nimz	1995	1	\N	\N
157	2022-02-06 13:49:49	2022-02-06 13:49:49	Lucas HERBORT	lucas-herbort	1999	1	\N	\N
158	2022-02-06 13:49:49	2022-02-06 13:49:49	Valentin VERBEEK	valentin-verbeek	2000	1	\N	\N
159	2022-02-06 13:49:49	2022-02-06 13:49:49	Sing Chung MR LEE	sing-chung-mr-lee	1990	1	\N	\N
160	2022-02-06 13:49:49	2022-02-06 13:49:49	Nicolas JAMBE	nicolas-jambe	1990	1	\N	\N
161	2022-02-06 13:49:49	2022-02-06 13:49:49	Kevin RIEDIJK	kevin-riedijk	1991	1	\N	\N
162	2022-02-06 13:49:49	2022-02-06 13:49:49	Callum GILROY	callum-gilroy	1999	1	\N	\N
163	2022-02-06 13:49:49	2022-02-06 13:49:49	Timm KREUTZ	timm-kreutz	1996	1	\N	\N
164	2022-02-06 13:49:49	2022-02-06 13:49:49	Rik OP HET VELD	rik-op-het-veld	1986	1	\N	\N
165	2022-02-06 13:49:49	2022-02-06 13:49:49	Ingemar VOSKAMP	ingemar-voskamp	1987	1	\N	\N
166	2022-02-06 13:49:49	2022-02-06 13:49:49	Bastiaan DE KNOOP	bastiaan-de-knoop	1986	1	\N	\N
128	2022-02-06 13:49:49	2022-02-07 18:20:57	Steven KENT	steven-kent	1988	1	\N	["NZ"]
167	2022-02-06 13:49:49	2022-02-06 13:49:49	Stefano SIDORETTI	stefano-sidoretti	1989	1	\N	\N
168	2022-02-06 13:49:49	2022-02-06 13:49:49	Stefan VAN DE RIET	stefan-van-de-riet	1984	1	\N	\N
169	2022-02-06 13:49:49	2022-02-06 13:49:49	Timo TABAK	timo-tabak	1982	1	\N	\N
170	2022-02-06 13:49:49	2022-02-06 13:49:49	Martijn KUEHN	martijn-kuehn	1983	1	\N	\N
171	2022-02-06 13:49:49	2022-02-06 13:49:49	Ryan SHINN	ryan-shinn	1980	1	\N	\N
172	2022-02-06 13:49:49	2022-02-06 13:49:49	Christophe ATTRAIT	christophe-attrait	1975	1	\N	\N
173	2022-02-06 13:49:49	2022-02-06 13:49:49	Sven ROEMEN	sven-roemen	1970	1	\N	\N
174	2022-02-06 13:49:49	2022-02-06 13:49:49	Guus VAN DE GOOR	guus-van-de-goor	1977	1	\N	\N
175	2022-02-06 13:49:49	2022-02-06 13:49:49	Erik VAN DAALEN	erik-van-daalen	1965	1	\N	\N
176	2022-02-06 13:49:49	2022-02-06 13:49:49	Wim VAN GRIEKEN	wim-van-grieken	1969	1	\N	\N
177	2022-02-06 13:49:49	2022-02-06 13:49:49	Hans TE HENNEPE	hans-te-hennepe	1968	1	\N	\N
178	2022-02-06 13:49:49	2022-02-06 13:49:49	Tony MCMASTER	tony-mcmaster	1964	1	\N	\N
179	2022-02-06 13:49:49	2022-02-06 13:49:49	Marcel IN 'T VELD	marcel-in-t-veld	1969	1	\N	\N
180	2022-02-06 13:49:49	2022-02-06 13:49:49	Libby BRADLEY	libby-bradley	\N	2	\N	\N
181	2022-02-06 13:49:49	2022-02-06 13:49:49	Natalie PEAT	natalie-peat	\N	2	\N	\N
182	2022-02-06 13:49:49	2022-02-06 13:49:49	Lucy MAKAEA	lucy-makaea	\N	2	\N	\N
183	2022-02-06 13:49:49	2022-02-06 13:49:49	Zhang BINYU	zhang-binyu	\N	2	\N	\N
184	2022-02-06 13:49:49	2022-02-06 13:49:49	Zhu JIAYU	zhu-jiayu	\N	2	\N	\N
185	2022-02-06 13:49:49	2022-02-06 13:49:49	Greta PEZZIARDI	greta-pezziardi	\N	2	\N	\N
186	2022-02-06 13:49:49	2022-02-06 13:49:49	Lola CABALLERO FUSET	lola-caballero-fuset	\N	2	\N	\N
187	2022-02-06 13:49:49	2022-02-06 13:49:49	Maria RODRIGUEZ RODDRIGUEZ DE LA SIERRA	maria-rodriguez-roddriguez-de-la-sierra	\N	2	\N	\N
188	2022-02-06 13:49:49	2022-02-06 13:49:49	Wai Lam MS KWOK	wai-lam-ms-kwok	\N	2	\N	\N
189	2022-02-06 13:49:49	2022-02-06 13:49:49	Hei Man MS CHOW	hei-man-ms-chow	\N	2	\N	\N
190	2022-02-06 13:49:49	2022-02-06 13:49:49	Hock Wing Winnie MS WONG	hock-wing-winnie-ms-wong	\N	2	\N	\N
191	2022-02-06 13:49:49	2022-02-06 13:49:49	Jana ANSORGOVA	jana-ansorgova	\N	2	\N	\N
192	2022-02-06 13:49:49	2022-02-06 13:49:49	Zdenka KRCALOVA	zdenka-krcalova	\N	2	\N	\N
193	2022-02-06 13:49:49	2022-02-06 13:49:49	Lucia EGUILUZ DE CELIS	lucia-eguiluz-de-celis	\N	2	\N	\N
194	2022-02-06 13:49:49	2022-02-06 13:49:49	Mathilde GARCIA MARTINES	mathilde-garcia-martines	\N	2	\N	\N
195	2022-02-06 13:49:49	2022-02-06 13:49:49	Mercia INCERA SALAS	mercia-incera-salas	\N	2	\N	\N
196	2022-02-06 13:49:49	2022-02-06 13:49:49	Melissa MURA CITTADINI	melissa-mura-cittadini	\N	2	\N	\N
197	2022-02-06 13:49:49	2022-02-06 13:49:49	Gaia BACILE	gaia-bacile	\N	2	\N	\N
198	2022-02-06 13:49:49	2022-02-06 13:49:49	Natalie KANTOVA	natalie-kantova	\N	2	\N	\N
199	2022-02-06 13:49:49	2022-02-06 13:49:49	Chantal SENDEN	chantal-senden	\N	2	\N	\N
200	2022-02-06 13:49:49	2022-02-06 13:49:49	Janneke RAS	janneke-ras	\N	2	\N	\N
201	2022-02-06 13:49:49	2022-02-06 13:49:49	Marielle SIMONS	marielle-simons	\N	2	\N	\N
202	2022-02-06 13:49:49	2022-02-06 13:49:49	Joy KARTAL	joy-kartal	\N	2	\N	\N
203	2022-02-06 13:49:49	2022-02-06 13:49:49	Anna LINDER	anna-linder	\N	2	\N	\N
204	2022-02-06 13:49:49	2022-02-06 13:49:49	Loreen QUINKE	loreen-quinke	\N	2	\N	\N
205	2022-02-06 13:49:50	2022-02-06 13:49:50	Charline SEIDEL	charline-seidel	\N	2	\N	\N
206	2022-02-06 13:49:50	2022-02-06 13:49:50	Jessica GROTE	jessica-grote	\N	2	\N	\N
207	2022-02-06 13:49:50	2022-02-06 13:49:50	Kathy GROOT	kathy-groot	\N	2	\N	\N
208	2022-02-06 13:49:50	2022-02-06 13:49:50	Myrthe BAKKER	myrthe-bakker	\N	2	\N	\N
209	2022-02-06 13:49:50	2022-02-06 13:49:50	Kimberley BOROWIAK	kimberley-borowiak	\N	2	\N	\N
210	2022-02-06 13:49:50	2022-02-06 13:49:50	Hannah KRAUSS	hannah-krauss	\N	2	\N	\N
211	2022-02-06 13:49:50	2022-02-06 13:49:50	Theresa KOCH	theresa-koch	\N	2	\N	\N
212	2022-02-06 13:49:50	2022-02-06 13:49:50	Alexandra SCHOLZ	alexandra-scholz	\N	2	\N	\N
213	2022-02-06 13:49:50	2022-02-06 13:49:50	Leonie ATRES	leonie-atres	\N	2	\N	\N
214	2022-02-06 13:49:50	2022-02-06 13:49:50	Rhiannah MCCOURT	rhiannah-mccourt	\N	2	\N	\N
215	2022-02-06 13:49:50	2022-02-06 13:49:50	Ellie DICKERSON WEEDY	ellie-dickerson-weedy	\N	2	\N	\N
216	2022-02-06 13:49:50	2022-02-06 13:49:50	Charlotte RICHARDSON	charlotte-richardson	\N	2	\N	\N
217	2022-02-06 13:49:50	2022-02-06 13:49:50	Nora FISCHER	nora-fischer	\N	2	\N	\N
218	2022-02-06 13:49:50	2022-02-06 13:49:50	Katharina GEBBE	katharina-gebbe	\N	2	\N	\N
219	2022-02-06 13:49:50	2022-02-06 13:49:50	Franziska MAGIERA	franziska-magiera	\N	2	\N	\N
220	2022-02-06 13:49:50	2022-02-06 13:49:50	Louise VAN HOFTEN	louise-van-hoften	\N	2	\N	\N
221	2022-02-06 13:49:50	2022-02-06 13:49:50	Selina STOKBROECKX	selina-stokbroeckx	\N	2	\N	\N
222	2022-02-06 13:49:50	2022-02-06 13:49:50	Aylin SCHOENSTEDT	aylin-schoenstedt	\N	2	\N	\N
223	2022-02-06 13:49:50	2022-02-06 13:49:50	Maira HINRICHS	maira-hinrichs	\N	2	\N	\N
224	2022-02-06 13:49:50	2022-02-06 13:49:50	Lisa ALBRECHT	lisa-albrecht	\N	2	\N	\N
225	2022-02-06 13:49:50	2022-02-06 13:49:50	Katrin SCHUMACHER	katrin-schumacher	\N	2	\N	\N
226	2022-02-06 13:49:50	2022-02-06 13:49:50	Selina GRAF	selina-graf	\N	2	\N	\N
227	2022-02-06 13:49:50	2022-02-06 13:49:50	Sabrina LOOSLI	sabrina-loosli	\N	2	\N	\N
228	2022-02-06 13:49:50	2022-02-06 13:49:50	Melanie SANDERS	melanie-sanders	\N	2	\N	\N
229	2022-02-06 13:49:50	2022-02-06 13:49:50	Isa CUIJPERS	isa-cuijpers	\N	2	\N	\N
230	2022-02-06 13:49:50	2022-02-06 13:49:50	Marlou JACOBS	marlou-jacobs	\N	2	\N	\N
231	2022-02-06 13:49:50	2022-02-06 13:49:50	Enya KRANENBURG	enya-kranenburg	\N	2	\N	\N
232	2022-02-06 13:49:50	2022-02-06 13:49:50	Katharina MAIER	katharina-maier	\N	2	\N	\N
233	2022-02-06 13:49:50	2022-02-06 13:49:50	Katharina ZIRNGAST	katharina-zirngast	\N	2	\N	\N
234	2022-02-06 13:49:50	2022-02-06 13:49:50	Lina MOELDERS	lina-moelders	\N	2	\N	\N
235	2022-02-06 13:49:50	2022-02-06 13:49:50	Judith MOELDERS	judith-moelders	\N	2	\N	\N
236	2022-02-06 13:49:50	2022-02-06 13:49:50	Rianne GOLSTEIJN	rianne-golsteijn	\N	2	\N	\N
237	2022-02-06 13:49:50	2022-02-06 13:49:50	Mieke HOVER	mieke-hover	\N	2	\N	\N
238	2022-02-06 13:49:50	2022-02-06 13:49:50	Sharon WOLFS	sharon-wolfs	\N	2	\N	\N
239	2022-02-06 13:49:50	2022-02-06 13:49:50	Louisa HILLE	louisa-hille	\N	2	\N	\N
240	2022-02-06 13:49:50	2022-02-06 13:49:50	Mareike WALDE	mareike-walde	\N	2	\N	\N
241	2022-02-06 13:49:50	2022-02-06 13:49:50	Maike EBELING	maike-ebeling	\N	2	\N	\N
242	2022-02-06 13:49:50	2022-02-06 13:49:50	Annika PREISS	annika-preiss	\N	2	\N	\N
243	2022-02-06 13:49:50	2022-02-06 13:49:50	Maike JETTEN	maike-jetten	\N	2	\N	\N
244	2022-02-06 13:49:50	2022-02-06 13:49:50	Lotte VAN GELLEKOM	lotte-van-gellekom	\N	2	\N	\N
245	2022-02-06 13:49:50	2022-02-06 13:49:50	Lynn VAN DER VORST	lynn-van-der-vorst	\N	2	\N	\N
246	2022-02-06 13:49:50	2022-02-06 13:49:50	Vera ZUIDGEEST	vera-zuidgeest	\N	2	\N	\N
247	2022-02-06 13:49:50	2022-02-06 13:49:50	Brecht VAN DEN HEUVEL	brecht-van-den-heuvel	\N	2	\N	\N
248	2022-02-06 13:49:50	2022-02-06 13:49:50	Nikki HEIN	nikki-hein	\N	2	\N	\N
249	2022-02-06 13:49:50	2022-02-06 13:49:50	Anouk HOFSTEDE	anouk-hofstede	\N	2	\N	\N
250	2022-02-06 13:49:50	2022-02-06 13:49:50	Elin SEITZ	elin-seitz	\N	2	\N	\N
251	2022-02-06 13:49:50	2022-02-06 13:49:50	Julia BARAN	julia-baran	\N	2	\N	\N
252	2022-02-06 13:49:50	2022-02-06 13:49:50	Matthew DAVIS	matthew-davis	\N	1	\N	\N
253	2022-02-06 13:49:50	2022-02-06 13:49:50	Sam BELL	sam-bell	\N	1	\N	\N
254	2022-02-06 13:49:50	2022-02-06 13:49:50	Mattia PONZIANI	mattia-ponziani	\N	1	\N	\N
255	2022-02-06 13:49:50	2022-02-06 13:49:50	Mauro FERRO	mauro-ferro	\N	1	\N	\N
256	2022-02-06 13:49:50	2022-02-06 13:49:50	Davide PETRUZZI	davide-petruzzi	\N	1	\N	\N
257	2022-02-06 13:49:50	2022-02-06 13:49:50	Levi ATA	levi-ata	\N	1	\N	\N
258	2022-02-06 13:49:50	2022-02-06 13:49:50	Chris DAWSON	chris-dawson	\N	1	\N	\N
259	2022-02-06 13:49:50	2022-02-06 13:49:50	Oscar WILLIAMS	oscar-williams	\N	1	\N	\N
260	2022-02-06 13:49:50	2022-02-06 13:49:50	Diego PRADO ESTEBAN	diego-prado-esteban	\N	1	\N	\N
261	2022-02-06 13:49:50	2022-02-06 13:49:50	Sergio CALDERON GONZALVEZ	sergio-calderon-gonzalvez	\N	1	\N	\N
262	2022-02-06 13:49:50	2022-02-06 13:49:50	Miguel Angel LOPEZ TORIBIO	miguel-angel-lopez-toribio	\N	1	\N	\N
263	2022-02-06 13:49:50	2022-02-06 13:49:50	Alwin HILLEBRINK	alwin-hillebrink	\N	1	\N	\N
264	2022-02-06 13:49:50	2022-02-06 13:49:50	Jelmar HILLEBRINK	jelmar-hillebrink	\N	1	\N	\N
265	2022-02-06 13:49:50	2022-02-06 13:49:50	Ruben VAN ERK	ruben-van-erk	\N	1	\N	\N
266	2022-02-06 13:49:50	2022-02-06 13:49:50	Melvin VAN DER MEIJ	melvin-van-der-meij	\N	1	\N	\N
267	2022-02-06 13:49:50	2022-02-06 13:49:50	Ivan ROMERO FERNANDEZ	ivan-romero-fernandez	\N	1	\N	\N
268	2022-02-06 13:49:50	2022-02-06 13:49:50	Javier PEREZ SANCHEZ	javier-perez-sanchez	\N	1	\N	\N
269	2022-02-06 13:49:50	2022-02-06 13:49:50	Neizan GOMEZ CASTELLO	neizan-gomez-castello	\N	1	\N	\N
270	2022-02-06 13:49:50	2022-02-06 13:49:50	Alvaro MERINO MONTES DE OCA	alvaro-merino-montes-de-oca	\N	1	\N	\N
271	2022-02-06 13:49:50	2022-02-06 13:49:50	Matteo DI DOMENICO	matteo-di-domenico	\N	1	\N	\N
272	2022-02-06 13:49:50	2022-02-06 13:49:50	Daniele DI SILVESTRE	daniele-di-silvestre	\N	1	\N	\N
273	2022-02-06 13:49:50	2022-02-06 13:49:50	Allesandro DE VINCENTIIS	allesandro-de-vincentiis	\N	1	\N	\N
274	2022-02-06 13:49:50	2022-02-06 13:49:50	Nicolo IACONI	nicolo-iaconi	\N	1	\N	\N
275	2022-02-06 13:49:50	2022-02-06 13:49:50	Ho Hin MR KAN	ho-hin-mr-kan	\N	1	\N	\N
276	2022-02-06 13:49:50	2022-02-06 13:49:50	Shun Lai MR WONG	shun-lai-mr-wong	\N	1	\N	\N
277	2022-02-06 13:49:50	2022-02-06 13:49:50	Nick ALINK	nick-alink	\N	1	\N	\N
278	2022-02-06 13:49:51	2022-02-06 13:49:51	daniele ORABONA	daniele-orabona	\N	1	\N	\N
279	2022-02-06 13:49:51	2022-02-06 13:49:51	Daniele BOMARSI	daniele-bomarsi	\N	1	\N	\N
280	2022-02-06 13:49:51	2022-02-06 13:49:51	Luuk MEERTEN	luuk-meerten	\N	1	\N	\N
281	2022-02-06 13:49:51	2022-02-06 13:49:51	Jonas DECKERS	jonas-deckers	\N	1	\N	\N
282	2022-02-06 13:49:51	2022-02-06 13:49:51	Nils MUENDELEIN	nils-muendelein	\N	1	\N	\N
283	2022-02-06 13:49:51	2022-02-06 13:49:51	Torge CHRISTEL	torge-christel	\N	1	\N	\N
284	2022-02-06 13:49:51	2022-02-06 13:49:51	Fabian THUMM	fabian-thumm	\N	1	\N	\N
285	2022-02-06 13:49:51	2022-02-06 13:49:51	Jannis MUELLER	jannis-mueller	\N	1	\N	\N
286	2022-02-06 13:49:51	2022-02-06 13:49:51	Paul-Louis ABEL	paul-louis-abel	\N	1	\N	\N
287	2022-02-06 13:49:51	2022-02-06 13:49:51	Elias AUSTERMANN	elias-austermann	\N	1	\N	\N
288	2022-02-06 13:49:51	2022-02-06 13:49:51	Erik MUELLER	erik-mueller	\N	1	\N	\N
289	2022-02-06 13:49:51	2022-02-06 13:49:51	Mauro RICCI	mauro-ricci	\N	1	\N	\N
290	2022-02-06 13:49:51	2022-02-06 13:49:51	Davide MIGLIORELLI	davide-migliorelli	\N	1	\N	\N
291	2022-02-06 13:49:51	2022-02-06 13:49:51	Francesco DANTIMI	francesco-dantimi	\N	1	\N	\N
292	2022-02-06 13:49:51	2022-02-06 13:49:51	Tiziano COSTANZA	tiziano-costanza	\N	1	\N	\N
293	2022-02-06 13:49:51	2022-02-06 13:49:51	Roelof STOETZER	roelof-stoetzer	\N	1	\N	\N
294	2022-02-06 13:49:51	2022-02-06 13:49:51	Rob VAN GRIEKEN	rob-van-grieken	\N	1	\N	\N
295	2022-02-06 13:49:51	2022-02-06 13:49:51	Bjoern HAHNE	bjoern-hahne	\N	1	\N	\N
296	2022-02-06 13:49:51	2022-02-06 13:49:51	Mario KNUEPPE	mario-knueppe	\N	1	\N	\N
297	2022-02-06 13:49:51	2022-02-06 13:49:51	Christopher TIMM	christopher-timm	\N	1	\N	\N
298	2022-02-06 13:49:51	2022-02-06 13:49:51	Flavio FELICIANGELI	flavio-feliciangeli	\N	1	\N	\N
299	2022-02-06 13:49:51	2022-02-06 13:49:51	Roberto CHIAVACCI	roberto-chiavacci	\N	1	\N	\N
300	2022-02-06 13:49:51	2022-02-06 13:49:51	Christian BACILE	christian-bacile	\N	1	\N	\N
301	2022-02-06 13:49:51	2022-02-06 13:49:51	Giacomo SILVA	giacomo-silva	\N	1	\N	\N
302	2022-02-06 13:49:51	2022-02-06 13:49:51	David MACEK	david-macek	\N	1	\N	\N
303	2022-02-06 13:49:51	2022-02-06 13:49:51	Jaroslav OBDRZAL	jaroslav-obdrzal	\N	1	\N	\N
304	2022-02-06 13:49:51	2022-02-06 13:49:51	David SOBESLAVSKY	david-sobeslavsky	\N	1	\N	\N
305	2022-02-06 13:49:51	2022-02-06 13:49:51	Ondrej ZALUDEK	ondrej-zaludek	\N	1	\N	\N
306	2022-02-06 13:49:51	2022-02-06 13:49:51	Bas VAN DEN AKKER	bas-van-den-akker	\N	1	\N	\N
307	2022-02-06 13:49:51	2022-02-06 13:49:51	Tom VAN DEN AKKER	tom-van-den-akker	\N	1	\N	\N
308	2022-02-06 13:49:51	2022-02-06 13:49:51	Seth VAN HOFTEN	seth-van-hoften	\N	1	\N	\N
309	2022-02-06 13:49:51	2022-02-06 13:49:51	David JETTEN	david-jetten	\N	1	\N	\N
310	2022-02-06 13:49:51	2022-02-06 13:49:51	Paul BORN	paul-born	\N	1	\N	\N
311	2022-02-06 13:49:51	2022-02-06 13:49:51	Moritz BRAUN	moritz-braun	\N	1	\N	\N
312	2022-02-06 13:49:51	2022-02-06 13:49:51	Vinzenz SCHWIND	vinzenz-schwind	\N	1	\N	\N
313	2022-02-06 13:49:51	2022-02-06 13:49:51	Jan ENZENHOFER	jan-enzenhofer	\N	1	\N	\N
314	2022-02-06 13:49:51	2022-02-06 13:49:51	Lukas HOELZL	lukas-hoelzl	\N	1	\N	\N
315	2022-02-06 13:49:51	2022-02-06 13:49:51	Rudolf LOFERER	rudolf-loferer	\N	1	\N	\N
316	2022-02-06 13:49:51	2022-02-06 13:49:51	Patrick REISTER	patrick-reister	\N	1	\N	\N
317	2022-02-06 13:49:51	2022-02-06 13:49:51	Axel SCHRADER	axel-schrader	\N	1	\N	\N
318	2022-02-06 13:49:51	2022-02-06 13:49:51	Markus WORTMANN	markus-wortmann	\N	1	\N	\N
319	2022-02-06 13:49:51	2022-02-06 13:49:51	Soeren BIEBRICH	soeren-biebrich	\N	1	\N	\N
320	2022-02-06 13:49:51	2022-02-06 13:49:51	Tino PRITZKOW	tino-pritzkow	\N	1	\N	\N
321	2022-02-06 13:49:51	2022-02-06 13:49:51	Pascal MISCHNER	pascal-mischner	\N	1	\N	\N
322	2022-02-06 13:49:51	2022-02-06 13:49:51	Torsten PRITZKOW	torsten-pritzkow	\N	1	\N	\N
323	2022-02-06 13:49:51	2022-02-06 13:49:51	Lucas VOGLER	lucas-vogler	\N	1	\N	\N
324	2022-02-06 13:49:51	2022-02-06 13:49:51	Tim HAUKE	tim-hauke	\N	1	\N	\N
325	2022-02-06 13:49:51	2022-02-06 13:49:51	Jonas Connor MELVIN	jonas-connor-melvin	\N	1	\N	\N
326	2022-02-06 13:49:51	2022-02-06 13:49:51	Max FREY	max-frey	\N	1	\N	\N
327	2022-02-06 13:49:51	2022-02-06 13:49:51	Marcel STROBACH	marcel-strobach	\N	1	\N	\N
328	2022-02-06 13:49:51	2022-02-06 13:49:51	Timo DIEBEL	timo-diebel	\N	1	\N	\N
329	2022-02-06 13:49:51	2022-02-06 13:49:51	Daniel WYKHOFF	daniel-wykhoff	\N	1	\N	\N
330	2022-02-06 13:49:51	2022-02-06 13:49:51	Otto MATTHIAS	otto-matthias	\N	1	\N	\N
331	2022-02-06 13:49:51	2022-02-06 13:49:51	Ben HILLEN	ben-hillen	\N	1	\N	\N
332	2022-02-06 13:49:51	2022-02-06 13:49:51	Vincent VOGEL	vincent-vogel	\N	1	\N	\N
333	2022-02-06 13:49:51	2022-02-06 13:49:51	Timm WIENHOLDT	timm-wienholdt	\N	1	\N	\N
334	2022-02-06 13:49:51	2022-02-06 13:49:51	Renke HINRICHS	renke-hinrichs	\N	1	\N	\N
335	2022-02-06 13:49:51	2022-02-06 13:49:51	Shawn ANDRAE	shawn-andrae	\N	1	\N	\N
336	2022-02-06 13:49:51	2022-02-06 13:49:51	Rico HOPP	rico-hopp	\N	1	\N	\N
337	2022-02-06 13:49:51	2022-02-06 13:49:51	Phillip TERPORTEN	phillip-terporten	\N	1	\N	\N
338	2022-02-06 13:49:51	2022-02-06 13:49:51	Tim GUSCH	tim-gusch	\N	1	\N	\N
339	2022-02-06 13:49:51	2022-02-06 13:49:51	Kai HENSE	kai-hense	\N	1	\N	\N
340	2022-02-06 13:49:51	2022-02-06 13:49:51	Tim PASTOORS	tim-pastoors	\N	1	\N	\N
341	2022-02-06 13:49:51	2022-02-06 13:49:51	Vincent VAN DER MEER	vincent-van-der-meer	\N	1	\N	\N
342	2022-02-06 13:49:51	2022-02-06 13:49:51	Jan-Willem DEN HARTOG	jan-willem-den-hartog	\N	1	\N	\N
343	2022-02-06 13:49:51	2022-02-06 13:49:51	Marco SCHULTZ	marco-schultz	\N	1	\N	\N
344	2022-02-06 13:49:51	2022-02-06 13:49:51	Paul BITTMANN	paul-bittmann	\N	1	\N	\N
345	2022-02-06 13:49:51	2022-02-06 13:49:51	Jannik KELLER	jannik-keller	\N	1	\N	\N
346	2022-02-06 13:49:51	2022-02-06 13:49:51	Joe WALKER - HARDWICK	joe-walker-hardwick	\N	1	\N	\N
347	2022-02-06 13:49:51	2022-02-06 13:49:51	Owen BROWN	owen-brown	\N	1	\N	\N
348	2022-02-06 13:49:51	2022-02-06 13:49:51	Matthew GUY	matthew-guy	\N	1	\N	\N
349	2022-02-06 13:49:51	2022-02-06 13:49:51	Nathan MCMASTER	nathan-mcmaster	\N	1	\N	\N
350	2022-02-06 13:49:51	2022-02-06 13:49:51	Remco DOLDERSUM	remco-doldersum	\N	1	\N	\N
351	2022-02-06 13:49:51	2022-02-06 13:49:51	Mathijs DE WITTE	mathijs-de-witte	\N	1	\N	\N
352	2022-02-06 13:49:51	2022-02-06 13:49:51	Jesse DE KOE	jesse-de-koe	\N	1	\N	\N
353	2022-02-06 13:49:51	2022-02-06 13:49:51	Sven KAMPHUIS	sven-kamphuis	\N	1	\N	\N
354	2022-02-06 13:49:51	2022-02-06 13:49:51	Jan LEIJTEN	jan-leijten	\N	1	\N	\N
355	2022-02-06 13:49:51	2022-02-06 13:49:51	Huub VAN KIMMENADE	huub-van-kimmenade	\N	1	\N	\N
356	2022-02-06 13:49:51	2022-02-06 13:49:51	Martijn SMITS	martijn-smits	\N	1	\N	\N
357	2022-02-06 13:49:51	2022-02-06 13:49:51	Mark CHANDLER	mark-chandler	\N	1	\N	\N
358	2022-02-06 13:49:51	2022-02-06 13:49:51	Richard WALKER HARDWICK	richard-walker-hardwick	\N	1	\N	\N
359	2022-02-06 13:49:51	2022-02-06 13:49:51	Luca BENSMANN	luca-bensmann	\N	1	\N	\N
360	2022-02-06 13:49:51	2022-02-06 13:49:51	Ole LAUER	ole-lauer	\N	1	\N	\N
361	2022-02-06 13:49:51	2022-02-06 13:49:51	Jan NAUMMANN	jan-naummann	\N	1	\N	\N
362	2022-02-06 13:49:51	2022-02-06 13:49:51	Patrick TAUBE	patrick-taube	\N	1	\N	\N
363	2022-02-06 13:49:51	2022-02-06 13:49:51	Christine KITTEL	christine-kittel	\N	2	\N	\N
364	2022-02-06 13:49:51	2022-02-06 13:49:51	Beatriz MASCARIS NUNEZ	beatriz-mascaris-nunez	\N	2	\N	\N
365	2022-02-06 13:49:52	2022-02-06 13:49:52	Rody VANHIJFTE	rody-vanhijfte	\N	2	\N	\N
366	2022-02-06 13:49:52	2022-02-06 13:49:52	Chantal BERNARD	chantal-bernard	\N	2	\N	\N
367	2022-02-06 13:49:52	2022-02-06 13:49:52	Renate VAN HAAREN	renate-van-haaren	\N	2	\N	\N
368	2022-02-06 13:49:52	2022-02-06 13:49:52	Rosa ARKESTEIJN	rosa-arkesteijn	\N	2	\N	\N
369	2022-02-06 13:49:52	2022-02-06 13:49:52	Kathrin BORNEMANN	kathrin-bornemann	\N	2	\N	\N
370	2022-02-06 13:49:52	2022-02-06 13:49:52	Madison KIDD	madison-kidd	\N	2	\N	\N
371	2022-02-06 13:49:52	2022-02-06 13:49:52	Federica VOLPINI	federica-volpini	\N	2	\N	\N
372	2022-02-06 13:49:52	2022-02-06 13:49:52	Lelanie LAPU-OS	lelanie-lapu-os	\N	2	\N	\N
373	2022-02-06 13:49:52	2022-02-06 13:49:52	Astrid VAN DER KOOIJ	astrid-van-der-kooij	\N	2	\N	\N
374	2022-02-06 13:49:52	2022-02-06 13:49:52	Jonah HAUG VANDENHOVE	jonah-haug-vandenhove	\N	1	\N	\N
375	2022-02-06 13:49:52	2022-02-06 13:49:52	Joergen SOLVANG ENGESETH	joergen-solvang-engeseth	\N	1	\N	\N
376	2022-02-06 13:49:52	2022-02-06 13:49:52	Tim VAN UDEN	tim-van-uden	\N	1	\N	\N
377	2022-02-06 13:49:52	2022-02-06 13:49:52	Andrea Vittorio PIRODDI	andrea-vittorio-piroddi	\N	1	\N	\N
378	2022-02-06 13:49:52	2022-02-06 13:49:52	Alberto TURRADO ALVAREZ	alberto-turrado-alvarez	\N	1	\N	\N
379	2022-02-06 13:49:52	2022-02-06 13:49:52	Mirko MATTIOLI	mirko-mattioli	\N	1	\N	\N
380	2022-02-06 13:49:52	2022-02-06 13:49:52	Iwan HOBUS	iwan-hobus	\N	1	\N	\N
381	2022-02-06 13:49:52	2022-02-06 13:49:52	Victor ALDERS	victor-alders	\N	1	\N	\N
382	2022-02-06 13:49:52	2022-02-06 13:49:52	Robert VAN DAM	robert-van-dam	\N	1	\N	\N
383	2022-02-06 13:49:52	2022-02-06 13:49:52	Max RENNEBAUM	max-rennebaum	\N	1	\N	\N
384	2022-02-06 13:49:52	2022-02-06 13:49:52	Erik REISICH	erik-reisich	\N	1	\N	\N
385	2022-02-06 13:49:52	2022-02-06 13:49:52	Romuald GASS	romuald-gass	\N	1	\N	\N
386	2022-02-06 13:49:52	2022-02-06 13:49:52	Philipp TRAN	philipp-tran	\N	1	\N	\N
387	2022-02-06 13:49:52	2022-02-06 13:49:52	Jelle VANDERSTEEN	jelle-vandersteen	\N	1	\N	\N
388	2022-02-06 13:49:52	2022-02-06 13:49:52	Erik DEKKER	erik-dekker	\N	1	\N	\N
389	2022-02-06 13:49:52	2022-02-06 13:49:52	Joseph BENOI	joseph-benoi	\N	1	\N	\N
390	2022-02-06 13:49:52	2022-02-06 13:49:52	Linu VALLOORAN POULOSE	linu-vallooran-poulose	\N	1	\N	\N
391	2022-02-06 13:49:52	2022-02-06 13:49:52	Calvin VAN HELVOIRT	calvin-van-helvoirt	\N	1	\N	\N
392	2022-02-06 13:49:52	2022-02-06 13:49:52	Bas DE REUVER	bas-de-reuver	\N	1	\N	\N
393	2022-02-06 13:49:52	2022-02-06 13:49:52	Lola CABALLERO FUSET	lola-caballero-fuset-1	2004	2	\N	\N
394	2022-02-06 13:49:52	2022-02-06 13:49:52	Beatriz MASCARIS NUNEZ	beatriz-mascaris-nunez-1	2002	2	\N	\N
395	2022-02-06 13:49:53	2022-02-06 13:49:53	Sofia PEZZA	sofia-pezza	2001	2	\N	\N
396	2022-02-06 13:49:53	2022-02-06 13:49:53	Martina TOMASSETTI	martina-tomassetti	2002	2	\N	\N
397	2022-02-06 13:49:53	2022-02-06 13:49:53	Zhang BINYU	zhang-binyu-1	2001	2	\N	\N
398	2022-02-06 13:49:53	2022-02-06 13:49:53	Ida LILLEBO SLETTEN	ida-lillebo-sletten	2001	2	\N	\N
399	2022-02-06 13:49:53	2022-02-06 13:49:53	Kimberley BOROWIAK	kimberley-borowiak-1	2002	2	\N	\N
400	2022-02-06 13:49:53	2022-02-06 13:49:53	Maike JETTEN	maike-jetten-1	2002	2	\N	\N
401	2022-02-06 13:49:53	2022-02-06 13:49:53	Rhiannah MCCOURT	rhiannah-mccourt-1	2001	2	\N	\N
402	2022-02-06 13:49:53	2022-02-06 13:49:53	Katharina GEBBE	katharina-gebbe-1	2002	2	\N	\N
403	2022-02-06 13:49:53	2022-02-06 13:49:53	Rosa ARKESTEIJN	rosa-arkesteijn-1	2002	2	\N	\N
404	2022-02-06 13:49:53	2022-02-06 13:49:53	Louisa HILLE	louisa-hille-1	2004	2	\N	\N
405	2022-02-06 13:49:53	2022-02-06 13:49:53	Selina STOKBROECKX	selina-stokbroeckx-1	2003	2	\N	\N
406	2022-02-06 13:49:53	2022-02-06 13:49:53	Hannah KRAUSS	hannah-krauss-1	2004	2	\N	\N
407	2022-02-06 13:49:53	2022-02-06 13:49:53	Ellie DICKERSON WEEDY	ellie-dickerson-weedy-1	2002	2	\N	\N
408	2022-02-06 13:49:53	2022-02-06 13:49:53	Gina Angelique MEHLIS	gina-angelique-mehlis	2002	2	\N	\N
409	2022-02-06 13:49:53	2022-02-06 13:49:53	Nikki HEIN	nikki-hein-1	2002	2	\N	\N
410	2022-02-06 13:49:53	2022-02-06 13:49:53	Rosalie BOERBOOM	rosalie-boerboom	2003	2	\N	\N
411	2022-02-06 13:49:53	2022-02-06 13:49:53	Issy DICKERSON WEEDY	issy-dickerson-weedy	2004	2	\N	\N
412	2022-02-06 13:49:53	2022-02-06 13:49:53	Julia BARAN	julia-baran-1	2003	2	\N	\N
413	2022-02-06 13:49:53	2022-02-06 13:49:53	Charlotte RICHARDSON	charlotte-richardson-1	2004	2	\N	\N
414	2022-02-06 13:49:53	2022-02-06 13:49:53	Franziska MAGIERA	franziska-magiera-1	2001	2	\N	\N
415	2022-02-06 13:49:53	2022-02-06 13:49:53	Lynn VAN DER VORST	lynn-van-der-vorst-1	2004	2	\N	\N
416	2022-02-06 13:49:53	2022-02-06 13:49:53	Rachel EDDY	rachel-eddy	1998	2	\N	\N
417	2022-02-06 13:49:53	2022-02-06 13:49:53	Lucy MAKAEA	lucy-makaea-1	2000	2	\N	\N
418	2022-02-06 13:49:53	2022-02-06 13:49:53	Natalie PEAT	natalie-peat-1	1994	2	\N	\N
419	2022-02-06 13:49:53	2022-02-06 13:49:53	Greta PEZZIARDI	greta-pezziardi-1	1998	2	\N	\N
420	2022-02-06 13:49:53	2022-02-06 13:49:53	Marine HARZE	marine-harze	1997	2	\N	\N
421	2022-02-06 13:49:53	2022-02-06 13:49:53	Chantal SENDEN	chantal-senden-1	1993	2	\N	\N
422	2022-02-06 13:49:53	2022-02-06 13:49:53	Jessica GROTE	jessica-grote-1	1996	2	\N	\N
423	2022-02-06 13:49:53	2022-02-06 13:49:53	Myrthe BAKKER	myrthe-bakker-1	2000	2	\N	\N
424	2022-02-06 13:49:53	2022-02-06 13:49:53	Wai Lam MS KWOK	wai-lam-ms-kwok-1	1993	2	\N	\N
425	2022-02-06 13:49:53	2022-02-06 13:49:53	Maria Eugenia ACEBO MONCALIAN	maria-eugenia-acebo-moncalian	2000	2	\N	\N
426	2022-02-06 13:49:53	2022-02-06 13:49:53	Gaia BACILE	gaia-bacile-1	1998	2	\N	\N
427	2022-02-06 13:49:53	2022-02-06 13:49:53	Hei Man MS CHOW	hei-man-ms-chow-1	1996	2	\N	\N
428	2022-02-06 13:49:53	2022-02-06 13:49:53	Katharina STUPPY	katharina-stuppy	1994	2	\N	\N
429	2022-02-06 13:49:53	2022-02-06 13:49:53	Theresa KOCH	theresa-koch-1	1999	2	\N	\N
430	2022-02-06 13:49:53	2022-02-06 13:49:53	Sharon WOLFS	sharon-wolfs-1	2000	2	\N	\N
431	2022-02-06 13:49:53	2022-02-06 13:49:53	Katharina ZIRNGAST	katharina-zirngast-1	1995	2	\N	\N
432	2022-02-06 13:49:53	2022-02-06 13:49:53	Alexandra SCHOLZ	alexandra-scholz-1	1997	2	\N	\N
433	2022-02-06 13:49:53	2022-02-06 13:49:53	Melanie SANDERS	melanie-sanders-1	1995	2	\N	\N
434	2022-02-06 13:49:53	2022-02-06 13:49:53	Katharina MAIER	katharina-maier-1	2000	2	\N	\N
435	2022-02-06 13:49:53	2022-02-06 13:49:53	Aylin SCHOENSTEDT	aylin-schoenstedt-1	1997	2	\N	\N
436	2022-02-06 13:49:53	2022-02-06 13:49:53	Inge JACOBS	inge-jacobs	2000	2	\N	\N
437	2022-02-06 13:49:53	2022-02-06 13:49:53	Zdenka KRCALOVA	zdenka-krcalova-1	1984	2	\N	\N
438	2022-02-06 13:49:53	2022-02-06 13:49:53	Christine KITTEL	christine-kittel-1	1985	2	\N	\N
439	2022-02-06 13:49:53	2022-02-06 13:49:53	Cathy SEDGWICK	cathy-sedgwick	1986	2	\N	\N
440	2022-02-06 13:49:53	2022-02-06 13:49:53	Marielle SIMONS	marielle-simons-1	1971	2	\N	\N
442	2022-02-06 13:49:53	2022-02-06 13:49:53	Francesco IPPOLITO	francesco-ippolito	1996	1	\N	\N
443	2022-02-06 13:49:53	2022-02-06 13:49:53	Mattia PONZIANI	mattia-ponziani-1	1996	1	\N	\N
444	2022-02-06 13:49:53	2022-02-06 13:49:53	Mauro FERRO	mauro-ferro-1	1993	1	\N	\N
445	2022-02-06 13:49:53	2022-02-06 13:49:53	Chris DAWSON	chris-dawson-1	1993	1	\N	\N
446	2022-02-06 13:49:53	2022-02-06 13:49:53	Davide TOMINEC	davide-tominec	1995	1	\N	\N
447	2022-02-06 13:49:53	2022-02-06 13:49:53	Miguel Angel LOPEZ TORIBIO	miguel-angel-lopez-toribio-1	1997	1	\N	\N
448	2022-02-06 13:49:53	2022-02-06 13:49:53	Melvin VAN DER MEIJ	melvin-van-der-meij-1	1993	1	\N	\N
449	2022-02-06 13:49:53	2022-02-06 13:49:53	Fabian THUMM	fabian-thumm-1	1999	1	\N	\N
450	2022-02-06 13:49:53	2022-02-06 13:49:53	Maarten VAN LAETHEM	maarten-van-laethem	1999	1	\N	\N
451	2022-02-06 13:49:53	2022-02-06 13:49:53	Flavio FELICIANGELI	flavio-feliciangeli-1	2000	1	\N	\N
452	2022-02-06 13:49:53	2022-02-06 13:49:53	Christopher TIMM	christopher-timm-1	1995	1	\N	\N
453	2022-02-06 13:49:53	2022-02-06 13:49:53	Huang HONGLI	huang-hongli	2000	1	\N	\N
454	2022-02-06 13:49:53	2022-02-06 13:49:53	daniele ORABONA	daniele-orabona-1	1990	1	\N	\N
455	2022-02-06 13:49:53	2022-02-06 13:49:53	Paul BORN	paul-born-1	1999	1	\N	\N
456	2022-02-06 13:49:53	2022-02-06 13:49:53	Moritz BRAUN	moritz-braun-1	1994	1	\N	\N
457	2022-02-06 13:49:53	2022-02-06 13:49:53	Sean SLATTERY	sean-slattery	2000	1	\N	\N
458	2022-02-06 13:49:53	2022-02-06 13:49:53	Simon STRICKER	simon-stricker	2000	1	\N	\N
459	2022-02-06 13:49:53	2022-02-06 13:49:53	Jan ENZENHOFER	jan-enzenhofer-1	2000	1	\N	\N
460	2022-02-06 13:49:53	2022-02-06 13:49:53	Rico HOPP	rico-hopp-1	1992	1	\N	\N
461	2022-02-06 13:49:53	2022-02-06 13:49:53	Tim VAN UDEN	tim-van-uden-1	1991	1	\N	\N
462	2022-02-06 13:49:53	2022-02-06 13:49:53	Greef DE RICK	greef-de-rick	1984	1	\N	\N
463	2022-02-06 13:49:53	2022-02-06 13:49:53	Max FREY	max-frey-1	1986	1	\N	\N
464	2022-02-06 13:49:53	2022-02-06 13:49:53	Vincent VAN DER MEER	vincent-van-der-meer-1	1979	1	\N	\N
465	2022-02-06 13:49:53	2022-02-06 13:49:53	Martijn SMITS	martijn-smits-1	1979	1	\N	\N
466	2022-02-06 13:49:53	2022-02-06 13:49:53	Chris KUBLER	chris-kubler	1973	1	\N	\N
467	2022-02-06 13:49:53	2022-02-06 13:49:53	Dennis BEZEMER	dennis-bezemer	1968	1	\N	\N
468	2022-02-06 13:49:53	2022-02-06 13:49:53	Jan LEIJTEN	jan-leijten-1	1954	1	\N	\N
469	2022-02-06 13:49:53	2022-02-06 13:49:53	Loreen QUINKE	loreen-quinke-1	2001	2	\N	\N
470	2022-02-06 13:49:53	2022-02-06 13:49:53	Mathilde GARCIA MARTINES	mathilde-garcia-martines-1	2004	2	\N	\N
471	2022-02-06 13:49:53	2022-02-06 13:49:53	Noelia LOUREIRO SERRANO	noelia-loureiro-serrano	2001	2	\N	\N
472	2022-02-06 13:49:53	2022-02-06 13:49:53	Charline SEIDEL	charline-seidel-1	2002	2	\N	\N
473	2022-02-06 13:49:53	2022-02-06 13:49:53	Melissa MURA CITTADINI	melissa-mura-cittadini-1	2003	2	\N	\N
474	2022-02-06 13:49:53	2022-02-06 13:49:53	Natalie KANTOVA	natalie-kantova-1	2001	2	\N	\N
475	2022-02-06 13:49:54	2022-02-06 13:49:54	Joy KARTAL	joy-kartal-1	2001	2	\N	\N
476	2022-02-06 13:49:54	2022-02-06 13:49:54	Nora FISCHER	nora-fischer-1	2003	2	\N	\N
477	2022-02-06 13:49:54	2022-02-06 13:49:54	Maira HINRICHS	maira-hinrichs-1	2001	2	\N	\N
478	2022-02-06 13:49:54	2022-02-06 13:49:54	Vera ZUIDGEEST	vera-zuidgeest-1	2003	2	\N	\N
479	2022-02-06 13:49:54	2022-02-06 13:49:54	Lina MOELDERS	lina-moelders-1	2001	2	\N	\N
480	2022-02-06 13:49:54	2022-02-06 13:49:54	Antonia OBERLING	antonia-oberling	2004	2	\N	\N
481	2022-02-06 13:49:54	2022-02-06 13:49:54	Lotte VAN GELLEKOM	lotte-van-gellekom-1	2003	2	\N	\N
482	2022-02-06 13:49:54	2022-02-06 13:49:54	Isabell SCHLUETERMANN	isabell-schluetermann	2003	2	\N	\N
483	2022-02-06 13:49:54	2022-02-06 13:49:54	Anouk HOFSTEDE	anouk-hofstede-1	2004	2	\N	\N
484	2022-02-06 13:49:54	2022-02-06 13:49:54	Mercia INCERA SALAS	mercia-incera-salas-1	2004	2	\N	\N
485	2022-02-06 13:49:54	2022-02-06 13:49:54	Lisa ALBRECHT	lisa-albrecht-1	2002	2	\N	\N
486	2022-02-06 13:49:54	2022-02-06 13:49:54	Brecht VAN DEN HEUVEL	brecht-van-den-heuvel-1	2003	2	\N	\N
488	2022-02-06 13:49:54	2022-02-06 13:49:54	Madison KIDD	madison-kidd-1	1997	2	\N	\N
489	2022-02-06 13:49:54	2022-02-06 13:49:54	Janneke RAS	janneke-ras-1	1995	2	\N	\N
490	2022-02-06 13:49:54	2022-02-06 13:49:54	Mercedes SANCHEZ PEIDRO	mercedes-sanchez-peidro	1995	2	\N	\N
491	2022-02-06 13:49:54	2022-02-06 13:49:54	Marina MACARTNEY	marina-macartney	1990	2	\N	\N
492	2022-02-06 13:49:54	2022-02-06 13:49:54	Lucia EGUILUZ DE CELIS	lucia-eguiluz-de-celis-1	1996	2	\N	\N
493	2022-02-06 13:49:54	2022-02-06 13:49:54	Mia Louise LOEKSTAD GJERMUNDSEN	mia-louise-loekstad-gjermundsen	1993	2	\N	\N
494	2022-02-06 13:49:54	2022-02-06 13:49:54	Isa CUIJPERS	isa-cuijpers-1	1999	2	\N	\N
495	2022-02-06 13:49:54	2022-02-06 13:49:54	Jana ANSORGOVA	jana-ansorgova-1	1995	2	\N	\N
496	2022-02-06 13:49:54	2022-02-06 13:49:54	Stefanie STUCH	stefanie-stuch	1998	2	\N	\N
497	2022-02-06 13:49:54	2022-02-06 13:49:54	Chloe PORTON	chloe-porton	2000	2	\N	\N
441	2022-02-06 13:49:53	2022-02-07 18:20:50	Matthew DAVIS	matthew-davis-1	1996	1	\N	["AU"]
498	2022-02-06 13:49:54	2022-02-06 13:49:54	Marlou JACOBS	marlou-jacobs-1	1995	2	\N	\N
499	2022-02-06 13:49:54	2022-02-06 13:49:54	Kaat GEUBELS	kaat-geubels	1996	2	\N	\N
500	2022-02-06 13:49:54	2022-02-06 13:49:54	Desiree MOONEN	desiree-moonen	1995	2	\N	\N
501	2022-02-06 13:49:54	2022-02-06 13:49:54	Judith MOELDERS	judith-moelders-1	1996	2	\N	\N
502	2022-02-06 13:49:54	2022-02-06 13:49:54	Leonie ATRES	leonie-atres-1	2000	2	\N	\N
503	2022-02-06 13:49:54	2022-02-06 13:49:54	Martina TREBAIOCCHI	martina-trebaiocchi	1999	2	\N	\N
504	2022-02-06 13:49:54	2022-02-06 13:49:54	Caroline PAUL	caroline-paul	1994	2	\N	\N
505	2022-02-06 13:49:54	2022-02-06 13:49:54	Zhu JIAYU	zhu-jiayu-1	1997	2	\N	\N
506	2022-02-06 13:49:54	2022-02-06 13:49:54	Rody VANHIJFTE	rody-vanhijfte-1	1994	2	\N	\N
507	2022-02-06 13:49:54	2022-02-06 13:49:54	Sabrina LOOSLI	sabrina-loosli-1	1990	2	\N	\N
508	2022-02-06 13:49:54	2022-02-06 13:49:54	Renate VAN HAAREN	renate-van-haaren-1	1992	2	\N	\N
509	2022-02-06 13:49:54	2022-02-06 13:49:54	Lola GOMEZ RODRIGUEZ	lola-gomez-rodriguez	2000	2	\N	\N
510	2022-02-06 13:49:54	2022-02-06 13:49:54	Libby BRADLEY	libby-bradley-1	1999	2	\N	\N
511	2022-02-06 13:49:54	2022-02-06 13:49:54	Selina GRAF	selina-graf-1	1992	2	\N	\N
512	2022-02-06 13:49:54	2022-02-06 13:49:54	Anna LINDER	anna-linder-1	1986	2	\N	\N
513	2022-02-06 13:49:54	2022-02-06 13:49:54	Hock Wing Winnie MS WONG	hock-wing-winnie-ms-wong-1	1987	2	\N	\N
514	2022-02-06 13:49:54	2022-02-06 13:49:54	Rianne GOLSTEIJN	rianne-golsteijn-1	1986	2	\N	\N
515	2022-02-06 13:49:54	2022-02-06 13:49:54	Maike EBELING	maike-ebeling-1	1986	2	\N	\N
516	2022-02-06 13:49:54	2022-02-06 13:49:54	Kathrin BORNEMANN	kathrin-bornemann-1	1984	2	\N	\N
517	2022-02-06 13:49:54	2022-02-06 13:49:54	Katrin SCHUMACHER	katrin-schumacher-1	1989	2	\N	\N
518	2022-02-06 13:49:54	2022-02-06 13:49:54	Miriam PISTERS	miriam-pisters	1970	2	\N	\N
519	2022-02-06 13:49:54	2022-02-06 13:49:54	Mieke HOVER	mieke-hover-1	1961	2	\N	\N
520	2022-02-06 13:49:54	2022-02-06 13:49:54	Astrid VAN DER KOOIJ	astrid-van-der-kooij-1	1964	2	\N	\N
521	2022-02-06 13:49:54	2022-02-06 13:49:54	Lelanie LAPU-OS	lelanie-lapu-os-1	1967	2	\N	\N
523	2022-02-06 13:49:54	2022-02-06 13:49:54	Sam BELL	sam-bell-1	1992	1	\N	\N
524	2022-02-06 13:49:54	2022-02-06 13:49:54	Francisco JAVIER CATALA LLINARES	francisco-javier-catala-llinares	1989	1	\N	\N
525	2022-02-06 13:49:55	2022-02-06 13:49:55	Sergio CALDERON GONZALVEZ	sergio-calderon-gonzalvez-1	1994	1	\N	\N
527	2022-02-06 13:49:55	2022-02-06 13:49:55	Oscar WILLIAMS	oscar-williams-1	2000	1	\N	\N
528	2022-02-06 13:49:55	2022-02-06 13:49:55	Jannik BOEWING	jannik-boewing	1998	1	\N	\N
529	2022-02-06 13:49:55	2022-02-06 13:49:55	German SILVESTRE VERCHER	german-silvestre-vercher	1998	1	\N	\N
530	2022-02-06 13:49:55	2022-02-06 13:49:55	Matteo DI DOMENICO	matteo-di-domenico-1	2000	1	\N	\N
531	2022-02-06 13:49:55	2022-02-06 13:49:55	Jonas Connor MELVIN	jonas-connor-melvin-1	1997	1	\N	\N
532	2022-02-06 13:49:55	2022-02-06 13:49:55	Jelmar HILLEBRINK	jelmar-hillebrink-1	1995	1	\N	\N
534	2022-02-06 13:49:55	2022-02-06 13:49:55	Lucas VOGLER	lucas-vogler-1	1999	1	\N	\N
535	2022-02-06 13:49:55	2022-02-06 13:49:55	Julien VAN LIEFFERINGE	julien-van-liefferinge	1991	1	\N	\N
536	2022-02-06 13:49:55	2022-02-06 13:49:55	Nick ALINK	nick-alink-1	1995	1	\N	\N
537	2022-02-06 13:49:55	2022-02-06 13:49:55	Pierre BRONCHART	pierre-bronchart	1996	1	\N	\N
538	2022-02-06 13:49:55	2022-02-06 13:49:55	Sem RUSSCHEN	sem-russchen	1999	1	\N	\N
539	2022-02-06 13:49:55	2022-02-06 13:49:55	Timm WIENHOLDT	timm-wienholdt-1	1991	1	\N	\N
540	2022-02-06 13:49:55	2022-02-06 13:49:55	Luuk MEERTEN	luuk-meerten-1	1999	1	\N	\N
541	2022-02-06 13:49:55	2022-02-06 13:49:55	Shun Lai MR WONG	shun-lai-mr-wong-1	1997	1	\N	\N
542	2022-02-06 13:49:55	2022-02-06 13:49:55	Diego PRADO ESTEBAN	diego-prado-esteban-1	1999	1	\N	\N
543	2022-02-06 13:49:55	2022-02-06 13:49:55	Lukas HOELZL	lukas-hoelzl-1	2000	1	\N	\N
544	2022-02-06 13:49:55	2022-02-06 13:49:55	Renke HINRICHS	renke-hinrichs-1	1999	1	\N	\N
545	2022-02-06 13:49:55	2022-02-06 13:49:55	Marco SCHULTZ	marco-schultz-1	2000	1	\N	\N
546	2022-02-06 13:49:55	2022-02-06 13:49:55	Jannik KELLER	jannik-keller-1	1997	1	\N	\N
547	2022-02-06 13:49:55	2022-02-06 13:49:55	Levi ATA	levi-ata-1	2000	1	\N	\N
548	2022-02-06 13:49:55	2022-02-06 13:49:55	Roelof STOETZER	roelof-stoetzer-1	1997	1	\N	\N
549	2022-02-06 13:49:55	2022-02-06 13:49:55	Daniele BOMARSI	daniele-bomarsi-1	1999	1	\N	\N
550	2022-02-06 13:49:55	2022-02-06 13:49:55	Vincent VOGEL	vincent-vogel-1	2000	1	\N	\N
551	2022-02-06 13:49:55	2022-02-06 13:49:55	Mario KNUEPPE	mario-knueppe-1	1983	1	\N	\N
552	2022-02-06 13:49:55	2022-02-06 13:49:55	Rudolf LOFERER	rudolf-loferer-1	1988	1	\N	\N
553	2022-02-06 13:49:55	2022-02-06 13:49:55	Alex DEN BOEF	alex-den-boef	1971	1	\N	\N
554	2022-02-06 13:49:55	2022-02-06 13:49:55	Mark CHANDLER	mark-chandler-1	1970	1	\N	\N
555	2022-02-06 13:49:55	2022-02-06 13:49:55	Stefan ENGELHARDT	stefan-engelhardt	1966	1	\N	\N
556	2022-02-06 13:49:55	2022-02-06 13:49:55	Huub VAN KIMMENADE	huub-van-kimmenade-1	1956	1	\N	\N
557	2022-02-06 13:49:55	2022-02-06 13:49:55	Robert VAN DAM	robert-van-dam-1	1966	1	\N	\N
558	2022-02-06 13:49:55	2022-02-06 13:49:55	Kim BRUIJNIKS	kim-bruijniks	\N	2	\N	\N
559	2022-02-06 13:49:55	2022-02-06 13:49:55	Lea SPLIETHOFF	lea-spliethoff	\N	2	\N	\N
560	2022-02-06 13:49:56	2022-02-06 13:49:56	Kathrin MARK	kathrin-mark	\N	2	\N	\N
561	2022-02-06 13:49:56	2022-02-06 13:49:56	Oscar BERMEJO SANTAMARIA	oscar-bermejo-santamaria	\N	1	\N	\N
562	2022-02-06 13:49:56	2022-02-06 13:49:56	Andrea CRESCIMBENI	andrea-crescimbeni	\N	1	\N	\N
563	2022-02-06 13:49:56	2022-02-06 13:49:56	Gianluca BELLUARDO	gianluca-belluardo	\N	1	\N	\N
564	2022-02-06 13:49:56	2022-02-06 13:49:56	Jos BECKERS	jos-beckers	\N	1	\N	\N
565	2022-02-06 13:49:56	2022-02-06 13:49:56	Jop VERHOEF	jop-verhoef	\N	1	\N	\N
566	2022-02-06 13:49:56	2022-02-06 13:49:56	Tom RUSSCHEN	tom-russchen	\N	1	\N	\N
567	2022-02-06 13:49:56	2022-02-06 13:49:56	Marijn IN 'T VELD	marijn-in-t-veld	\N	1	\N	\N
568	2022-02-06 13:49:56	2022-02-06 13:49:56	Jason VAN DER BEEK	jason-van-der-beek	\N	1	\N	\N
569	2022-02-06 13:49:57	2022-02-06 13:49:57	Irina VAN HELVOORT	irina-van-helvoort	2003	2	\N	\N
570	2022-02-06 13:49:57	2022-02-06 13:49:57	Kathy GROOT	kathy-groot-1	1997	2	\N	\N
571	2022-02-06 13:49:57	2022-02-06 13:49:57	Jinske FLORUS	jinske-florus	2000	2	\N	\N
572	2022-02-06 13:49:57	2022-02-06 13:49:57	Anne KEURENTJES	anne-keurentjes	1995	2	\N	\N
573	2022-02-06 13:49:57	2022-02-06 13:49:57	Elin SEITZ	elin-seitz-1	1996	2	\N	\N
574	2022-02-06 13:49:57	2022-02-06 13:49:57	Saskia HOPMAN	saskia-hopman	1981	2	\N	\N
575	2022-02-06 13:49:57	2022-02-06 13:49:57	Corentin STAVART	corentin-stavart	1999	1	\N	\N
576	2022-02-06 13:49:57	2022-02-06 13:49:57	Reinier VAN DAM	reinier-van-dam	1995	1	\N	\N
577	2022-02-06 13:49:57	2022-02-06 13:49:57	Felix FOCKE	felix-focke	1997	1	\N	\N
578	2022-02-06 13:49:57	2022-02-06 13:49:57	Pieter VAN LUIJTELAAR	pieter-van-luijtelaar	1983	1	\N	\N
533	2022-02-06 13:49:55	2022-02-13 15:41:39	Ruben VAN ERK	ruben-van-erk-1	1996	1	\N	["NL"]
526	2022-02-06 13:49:55	2022-03-24 13:50:49	Andrea Vittorio PIRODDI	andrea-vittorio-piroddi-1	1992	1	\N	["IT"]
579	2022-02-06 13:49:57	2022-02-06 13:49:57	Idwer STEENSTRA	idwer-steenstra	1985	1	\N	\N
580	2022-02-06 13:49:58	2022-02-06 13:49:58	Maike VETTER	maike-vetter	\N	2	\N	\N
581	2022-02-06 13:49:58	2022-02-06 13:49:58	Jana TERLIESNER	jana-terliesner	\N	2	\N	\N
582	2022-02-06 13:49:58	2022-02-06 13:49:58	Sarah VAN DEN HEUVEL	sarah-van-den-heuvel	\N	2	\N	\N
583	2022-02-06 13:49:58	2022-02-06 13:49:58	Simone VAN ROOSMALEN	simone-van-roosmalen	\N	2	\N	\N
584	2022-02-06 13:49:58	2022-02-06 13:49:58	Laura TIELEN	laura-tielen	\N	2	\N	\N
585	2022-02-06 13:49:58	2022-02-06 13:49:58	Eline THIJSEN	eline-thijsen	\N	2	\N	\N
586	2022-02-06 13:49:58	2022-02-06 13:49:58	Zoe VAN STIJN	zoe-van-stijn	\N	2	\N	\N
587	2022-02-06 13:49:58	2022-02-06 13:49:58	Gianmarco PAVONE	gianmarco-pavone	\N	1	\N	\N
588	2022-02-06 13:49:58	2022-02-06 13:49:58	Simon ASSENMACHER	simon-assenmacher	\N	1	\N	\N
589	2022-02-06 13:49:58	2022-02-06 13:49:58	Florian TIETZE	florian-tietze	\N	1	\N	\N
590	2022-02-06 13:49:59	2022-02-06 13:49:59	Maike VETTER	maike-vetter-1	2001	2	\N	\N
591	2022-02-06 13:49:59	2022-02-06 13:49:59	Zoe VAN STIJN	zoe-van-stijn-1	2002	2	\N	\N
592	2022-02-06 13:49:59	2022-02-06 13:49:59	Sydney BAUM	sydney-baum	1993	2	\N	\N
593	2022-02-06 13:49:59	2022-02-06 13:49:59	Dirkje VAN DEN HOEVEN	dirkje-van-den-hoeven	2000	2	\N	\N
594	2022-02-06 13:49:59	2022-02-06 13:49:59	Eline THIJSEN	eline-thijsen-1	2000	2	\N	\N
595	2022-02-06 13:49:59	2022-02-06 13:49:59	Simone VAN ROOSMALEN	simone-van-roosmalen-1	2000	2	\N	\N
596	2022-02-06 13:49:59	2022-02-06 13:49:59	Myrthe BOERBOOM	myrthe-boerboom	2000	2	\N	\N
597	2022-02-06 13:49:59	2022-02-06 13:49:59	Alwin HILLEBRINK	alwin-hillebrink-1	1992	1	\N	\N
598	2022-02-06 13:49:59	2022-02-06 13:49:59	Lin YONGQING	lin-yongqing	1992	1	\N	\N
599	2022-02-06 13:49:59	2022-02-06 13:49:59	Marijn IN 'T VELD	marijn-in-t-veld-1	2000	1	\N	\N
600	2022-02-06 13:50:00	2022-02-06 13:50:00	Jesse DEENEN	jesse-deenen	1997	1	\N	\N
601	2022-02-06 13:50:00	2022-02-06 13:50:00	Maximilian BAUSCH	maximilian-bausch	1992	1	\N	\N
602	2022-02-06 13:50:00	2022-02-06 13:50:00	Stef BRUSSELERS	stef-brusselers	2000	1	\N	\N
603	2022-02-06 13:50:00	2022-02-06 13:50:00	Bjoern HAHNE	bjoern-hahne-1	1988	1	\N	\N
604	2022-02-06 13:50:00	2022-02-06 13:50:00	Alexander AHMAD	alexander-ahmad	1987	1	\N	\N
605	2022-02-06 13:50:00	2022-02-06 13:50:00	Erik HOPMAN	erik-hopman	1982	1	\N	\N
606	2022-02-06 13:50:00	2022-02-06 13:50:00	Jos BECKERS	jos-beckers-1	1969	1	\N	\N
607	2022-02-06 13:50:00	2022-02-06 13:50:00	Erwin TER-HUERNE	erwin-ter-huerne	1964	1	\N	\N
608	2022-02-06 13:50:00	2022-02-06 13:50:00	Wolfgang HAKE	wolfgang-hake	1964	1	\N	\N
609	2022-02-06 13:50:00	2022-02-06 13:50:00	Enya KRANENBURG	enya-kranenburg-1	2003	2	\N	\N
610	2022-02-06 13:50:11	2022-02-06 13:50:11	Emma FRANZOT	emma-franzot	2000	2	\N	\N
611	2022-02-06 13:50:11	2022-02-06 13:50:11	Ally CHISLETT	ally-chislett	2001	2	\N	\N
612	2022-02-06 13:50:11	2022-02-06 13:50:11	Bianca OPPERMAN	bianca-opperman	2002	2	\N	\N
613	2022-02-06 13:50:11	2022-02-06 13:50:11	Dehanke VAN RENSBURG	dehanke-van-rensburg	2001	2	\N	\N
614	2022-02-06 13:50:11	2022-02-06 13:50:11	Zanri PIETERSE	zanri-pieterse	2001	2	\N	\N
615	2022-02-06 13:50:11	2022-02-06 13:50:11	Beatrice GUELI	beatrice-gueli	2003	2	\N	\N
616	2022-02-06 13:50:11	2022-02-06 13:50:11	Carolin STELTING	carolin-stelting	2002	2	\N	\N
617	2022-02-06 13:50:11	2022-02-06 13:50:11	Carli SMIT	carli-smit	2002	2	\N	\N
618	2022-02-06 13:50:11	2022-02-06 13:50:11	Lisanne WITTENBERG	lisanne-wittenberg	2000	2	\N	\N
619	2022-02-06 13:50:11	2022-02-06 13:50:11	Pia UTERMUELLER	pia-utermueller	2001	2	\N	\N
620	2022-02-06 13:50:11	2022-02-06 13:50:11	Chirsna VENTER	chirsna-venter	2000	2	\N	\N
621	2022-02-06 13:50:11	2022-02-06 13:50:11	Danique VAN BEBBER	danique-van-bebber	2000	2	\N	\N
622	2022-02-06 13:50:11	2022-02-06 13:50:11	Mia Carina LUESS	mia-carina-luess	2001	2	\N	\N
623	2022-02-06 13:50:11	2022-02-06 13:50:11	Lisa BUNTJER	lisa-buntjer	2001	2	\N	\N
624	2022-02-06 13:50:11	2022-02-06 13:50:11	Julia HARTH	julia-harth	2002	2	\N	\N
626	2022-02-06 13:50:11	2022-02-06 13:50:11	Tove VAN ZYL	tove-van-zyl	1997	2	\N	\N
627	2022-02-06 13:50:11	2022-02-06 13:50:11	Ellen HUISINGA	ellen-huisinga	1992	2	\N	\N
628	2022-02-06 13:50:11	2022-02-06 13:50:11	Marsha VAN DE HEUVEL	marsha-van-de-heuvel	1998	2	\N	\N
629	2022-02-06 13:50:11	2022-02-06 13:50:11	Kaykee KOCH	kaykee-koch	1993	2	\N	\N
630	2022-02-06 13:50:11	2022-02-06 13:50:11	Sharon GELMERS	sharon-gelmers	1994	2	\N	\N
631	2022-02-06 13:50:11	2022-02-06 13:50:11	Kim BRUIJNIKS	kim-bruijniks-1	1999	2	\N	\N
632	2022-02-06 13:50:11	2022-02-06 13:50:11	Tamara CASPERS	tamara-caspers	1990	2	\N	\N
633	2022-02-06 13:50:11	2022-02-06 13:50:11	Vanessa Anna SCHULTZ	vanessa-anna-schultz	1996	2	\N	\N
634	2022-02-06 13:50:11	2022-02-06 13:50:11	Romy TICHELAAR	romy-tichelaar	1995	2	\N	\N
635	2022-02-06 13:50:11	2022-02-06 13:50:11	Katharina MARX	katharina-marx	1994	2	\N	\N
636	2022-02-06 13:50:11	2022-02-06 13:50:11	Jana SCHMIEDNER	jana-schmiedner	1999	2	\N	\N
637	2022-02-06 13:50:11	2022-02-06 13:50:11	Lea Maria BRENNEISER	lea-maria-brenneiser	1999	2	\N	\N
638	2022-02-06 13:50:11	2022-02-06 13:50:11	Francesca Andrea SCHULTZ	francesca-andrea-schultz	1994	2	\N	\N
639	2022-02-06 13:50:11	2022-02-06 13:50:11	Diede SPEL	diede-spel	1995	2	\N	\N
640	2022-02-06 13:50:11	2022-02-06 13:50:11	Jasmin FREUDIGER	jasmin-freudiger	1986	2	\N	\N
641	2022-02-06 13:50:11	2022-02-06 13:50:11	Danielle STEVENS	danielle-stevens	1988	2	\N	\N
642	2022-02-06 13:50:11	2022-02-06 13:50:11	Steph DITTSCHAR	steph-dittschar	1968	2	\N	\N
643	2022-02-06 13:50:11	2022-02-06 13:50:11	Michaela HAKE	michaela-hake	1966	2	\N	\N
644	2022-02-06 13:50:11	2022-02-06 13:50:11	Mark KLEINHANS	mark-kleinhans	2001	1	\N	\N
645	2022-02-06 13:50:11	2022-02-06 13:50:11	Seyuran PERUMAL	seyuran-perumal	2001	1	\N	\N
646	2022-02-06 13:50:11	2022-02-06 13:50:11	Botha DU TOIT	botha-du-toit	2000	1	\N	\N
647	2022-02-06 13:50:11	2022-02-06 13:50:11	Luca BENSMANN	luca-bensmann-1	2001	1	\N	\N
648	2022-02-06 13:50:11	2022-02-06 13:50:11	Jonas SCHWERTHELM	jonas-schwerthelm	2000	1	\N	\N
649	2022-02-06 13:50:11	2022-02-06 13:50:11	Elias ROESEMEIER	elias-roesemeier	2001	1	\N	\N
650	2022-02-06 13:50:11	2022-02-06 13:50:11	Branden WILLOWS	branden-willows	2001	1	\N	\N
651	2022-02-06 13:50:11	2022-02-06 13:50:11	Tom VAN DEN AKKER	tom-van-den-akker-1	2002	1	\N	\N
652	2022-02-06 13:50:11	2022-02-06 13:50:11	Bas VAN DEN AKKER	bas-van-den-akker-1	2002	1	\N	\N
653	2022-02-06 13:50:11	2022-02-06 13:50:11	Maximilian KIEHNE	maximilian-kiehne	2003	1	\N	\N
654	2022-02-06 13:50:11	2022-02-06 13:50:11	Flynn WOLTERMAN	flynn-wolterman	2003	1	\N	\N
655	2022-02-06 13:50:11	2022-02-06 13:50:11	Mats TREDER	mats-treder	2003	1	\N	\N
656	2022-02-06 13:50:11	2022-02-06 13:50:11	Rob VAN GRIEKEN	rob-van-grieken-1	2003	1	\N	\N
657	2022-02-06 13:50:11	2022-02-06 13:50:11	Marco Philip SCHULTZ	marco-philip-schultz	2000	1	\N	\N
658	2022-02-06 13:50:11	2022-02-06 13:50:11	Jaden VAN HOUTEM	jaden-van-houtem	2002	1	\N	\N
659	2022-02-06 13:50:11	2022-02-06 13:50:11	Joergen SOLVANG ENGESETH	joergen-solvang-engeseth-1	2003	1	\N	\N
660	2022-02-06 13:50:11	2022-02-06 13:50:11	Roy KAMPHUIS	roy-kamphuis	2001	1	\N	\N
661	2022-02-06 13:50:11	2022-02-06 13:50:11	Vinzenz SCHWIND	vinzenz-schwind-1	2002	1	\N	\N
662	2022-02-06 13:50:11	2022-02-06 13:50:11	Lukas POETTER	lukas-poetter	2001	1	\N	\N
663	2022-02-06 13:50:11	2022-02-06 13:50:11	Sven KAMPHUIS	sven-kamphuis-1	2002	1	\N	\N
664	2022-02-06 13:50:11	2022-02-06 13:50:11	Paul BITTMANN	paul-bittmann-1	2003	1	\N	\N
665	2022-02-06 13:50:11	2022-02-06 13:50:11	Aaron HAUPTVOGEL	aaron-hauptvogel	2001	1	\N	\N
666	2022-02-06 13:50:11	2022-02-06 13:50:11	Tom RUSSCHEN	tom-russchen-1	2002	1	\N	\N
669	2022-02-06 13:50:11	2022-02-06 13:50:11	Fabio PEZZOTTI	fabio-pezzotti	1997	1	\N	\N
670	2022-02-06 13:50:11	2022-02-06 13:50:11	Brian CLOCCHIATTI	brian-clocchiatti	1998	1	\N	\N
671	2022-02-06 13:50:11	2022-02-06 13:50:11	Cole DRINNAN	cole-drinnan	1997	1	\N	\N
672	2022-02-06 13:50:11	2022-02-06 13:50:11	Chin-chun LAM	chin-chun-lam	1997	1	\N	\N
673	2022-02-06 13:50:11	2022-02-06 13:50:11	Kurt RAUTENBACH	kurt-rautenbach	1999	1	\N	\N
674	2022-02-06 13:50:11	2022-02-06 13:50:11	Oliver WOELBING	oliver-woelbing	1999	1	\N	\N
675	2022-02-06 13:50:11	2022-02-06 13:50:11	Lars SIEVAL	lars-sieval	1993	1	\N	\N
676	2022-02-06 13:50:11	2022-02-06 13:50:11	Stephan KEMPKES	stephan-kempkes	1988	1	\N	\N
677	2022-02-06 13:50:11	2022-02-06 13:50:11	Tom SCHWEGMANN	tom-schwegmann	1994	1	\N	\N
678	2022-02-06 13:50:11	2022-02-06 13:50:11	Jan-Ole STERNER	jan-ole-sterner	1995	1	\N	\N
679	2022-02-06 13:50:11	2022-02-06 13:50:11	Jonas DEBBELER	jonas-debbeler	1996	1	\N	\N
680	2022-02-06 13:50:11	2022-02-06 13:50:11	Daniel KUNK	daniel-kunk	1990	1	\N	\N
681	2022-02-06 13:50:11	2022-02-06 13:50:11	Leon HILDEBRANDT	leon-hildebrandt	1997	1	\N	\N
682	2022-02-06 13:50:11	2022-02-06 13:50:11	Cedric KOEHNE	cedric-koehne	1997	1	\N	\N
683	2022-02-06 13:50:11	2022-02-06 13:50:11	Nick VAN DER KROGT	nick-van-der-krogt	1995	1	\N	\N
684	2022-02-06 13:50:11	2022-02-06 13:50:11	Justus KUHLMANN	justus-kuhlmann	1998	1	\N	\N
685	2022-02-06 13:50:11	2022-02-06 13:50:11	Wouter TUINSTRA	wouter-tuinstra	1995	1	\N	\N
686	2022-02-06 13:50:11	2022-02-06 13:50:11	Niklas BOERMANN	niklas-boermann	1997	1	\N	\N
687	2022-02-06 13:50:11	2022-02-06 13:50:11	Daniel HAUPTVOGEL	daniel-hauptvogel	1999	1	\N	\N
688	2022-02-06 13:50:11	2022-02-06 13:50:11	van 't GERRIT OEVER	van-t-gerrit-oever	1987	1	\N	\N
689	2022-02-06 13:50:11	2022-02-06 13:50:11	Rik DE GREEF	rik-de-greef	1984	1	\N	\N
690	2022-02-06 13:50:11	2022-02-06 13:50:11	Rene WOLTERS	rene-wolters	1987	1	\N	\N
691	2022-02-06 13:50:11	2022-02-06 13:50:11	Josef BAUER	josef-bauer	1967	1	\N	\N
692	2022-02-06 13:50:11	2022-02-06 13:50:11	Frank WALFORT	frank-walfort	1968	1	\N	\N
693	2022-02-06 13:50:11	2022-02-06 13:50:11	Piet PRAET	piet-praet	1956	1	\N	\N
694	2022-02-06 13:50:12	2022-02-06 13:50:12	Paola EGUILUZ DE CELIS	paola-eguiluz-de-celis	2001	2	\N	\N
695	2022-02-06 13:50:12	2022-02-06 13:50:12	Eugenia ACEBO MONCALIA	eugenia-acebo-moncalia	2000	2	\N	\N
696	2022-02-06 13:50:12	2022-02-06 13:50:12	Alessia LOCCHI	alessia-locchi	2000	2	\N	\N
697	2022-02-06 13:50:12	2022-02-06 13:50:12	Sulinke VAN DEN BERG	sulinke-van-den-berg	2002	2	\N	\N
698	2022-02-06 13:50:12	2022-02-06 13:50:12	Deborah DREDGE	deborah-dredge	2002	2	\N	\N
699	2022-02-06 13:50:12	2022-02-06 13:50:12	Louisa HOELSCHER	louisa-hoelscher	2003	2	\N	\N
700	2022-02-06 13:50:12	2022-02-06 13:50:12	Nora Boelling INGEBERG	nora-boelling-ingeberg	2002	2	\N	\N
701	2022-02-06 13:50:12	2022-02-06 13:50:12	Charlotte HOEHNE	charlotte-hoehne	2003	2	\N	\N
702	2022-02-06 13:50:12	2022-02-06 13:50:12	Francesca ANTONII	francesca-antonii	2002	2	\N	\N
703	2022-02-06 13:50:12	2022-02-06 13:50:12	Micky PERDIJK	micky-perdijk	2002	2	\N	\N
704	2022-02-06 13:50:12	2022-02-06 13:50:12	Melissa BOL	melissa-bol	2001	2	\N	\N
705	2022-02-06 13:50:12	2022-02-06 13:50:12	Lotte GELLEKOM	lotte-gellekom	2003	2	\N	\N
706	2022-02-06 13:50:12	2022-02-06 13:50:12	Anita GARCIA SILVA	anita-garcia-silva	1998	2	\N	\N
707	2022-02-06 13:50:12	2022-02-06 13:50:12	Kirsten LUEHR	kirsten-luehr	1991	2	\N	\N
708	2022-02-06 13:50:12	2022-02-06 13:50:12	Samantha FERRARI	samantha-ferrari	1992	2	\N	\N
709	2022-02-06 13:50:12	2022-02-06 13:50:12	Alice MARZELLA	alice-marzella	1994	2	\N	\N
710	2022-02-06 13:50:12	2022-02-06 13:50:12	Isabel COSTA PORTILLA	isabel-costa-portilla	1995	2	\N	\N
711	2022-02-06 13:50:12	2022-02-06 13:50:12	Josefine NILSSON	josefine-nilsson	1993	2	\N	\N
712	2022-02-06 13:50:12	2022-02-06 13:50:12	Hanna SCHUERKMANN	hanna-schuerkmann	1999	2	\N	\N
713	2022-02-06 13:50:12	2022-02-06 13:50:12	Charlotte VAN DER HOEK	charlotte-van-der-hoek	1999	2	\N	\N
714	2022-02-06 13:50:12	2022-02-06 13:50:12	Kim SICKING	kim-sicking	1999	2	\N	\N
715	2022-02-06 13:50:12	2022-02-06 13:50:12	Kitty SCHIPHORST PREUPER	kitty-schiphorst-preuper	1991	2	\N	\N
716	2022-02-06 13:50:12	2022-02-06 13:50:12	Ane LILLEBO SLETTEN	ane-lillebo-sletten	1997	2	\N	\N
717	2022-02-06 13:50:12	2022-02-06 13:50:12	Katja WEISSPHAL	katja-weissphal	1999	2	\N	\N
718	2022-02-06 13:50:13	2022-02-06 13:50:13	Celina MCGRORY	celina-mcgrory	1999	2	\N	\N
719	2022-02-06 13:50:13	2022-02-06 13:50:13	Wing-sue YUE	wing-sue-yue	1999	2	\N	\N
720	2022-02-06 13:50:13	2022-02-06 13:50:13	Hei-man CHOW	hei-man-chow	1996	2	\N	\N
721	2022-02-06 13:50:13	2022-02-06 13:50:13	Lou PFLIPS	lou-pflips	1999	2	\N	\N
722	2022-02-06 13:50:13	2022-02-06 13:50:13	Loes VAN DE WETERING	loes-van-de-wetering	1999	2	\N	\N
723	2022-02-06 13:50:13	2022-02-06 13:50:13	Julia Marie BOTT	julia-marie-bott	1999	2	\N	\N
724	2022-02-06 13:50:13	2022-02-06 13:50:13	Louise COMPAGNER VAN DER HEIJDEN	louise-compagner-van-der-heijden	1991	2	\N	\N
725	2022-02-06 13:50:13	2022-02-06 13:50:13	Iris BAST	iris-bast	1999	2	\N	\N
726	2022-02-06 13:50:13	2022-02-06 13:50:13	Kelly VAN HOEK	kelly-van-hoek	1998	2	\N	\N
727	2022-02-06 13:50:13	2022-02-06 13:50:13	Robin HEEMELS	robin-heemels	1999	2	\N	\N
728	2022-02-06 13:50:13	2022-02-06 13:50:13	Ela HUTTEN	ela-hutten	1993	2	\N	\N
729	2022-02-06 13:50:13	2022-02-06 13:50:13	Nele-Cornelia VANBUEL-GOFFIN	nele-cornelia-vanbuel-goffin	1985	2	\N	\N
730	2022-02-06 13:50:13	2022-02-06 13:50:13	Marina NASS	marina-nass	1987	2	\N	\N
731	2022-02-06 13:50:13	2022-02-06 13:50:13	Winnie Hock-wing WONG	winnie-hock-wing-wong	1987	2	\N	\N
732	2022-02-06 13:50:13	2022-02-06 13:50:13	Sabrina HOHENHORST	sabrina-hohenhorst	1982	2	\N	\N
733	2022-02-06 13:50:13	2022-02-06 13:50:13	Marjolein VAN LOENHOUT	marjolein-van-loenhout	1976	2	\N	\N
734	2022-02-06 13:50:13	2022-02-06 13:50:13	Wilna CELIE	wilna-celie	1958	2	\N	\N
735	2022-02-06 13:50:13	2022-02-06 13:50:13	Jp VAN ZYL	jp-van-zyl	2000	1	\N	\N
736	2022-02-06 13:50:13	2022-02-06 13:50:13	Mirco MEYER	mirco-meyer	2001	1	\N	\N
737	2022-02-06 13:50:13	2022-02-06 13:50:13	Robin KUIPHOF	robin-kuiphof	2003	1	\N	\N
738	2022-02-06 13:50:13	2022-02-06 13:50:13	Christopher VAN GIESEN	christopher-van-giesen	2002	1	\N	\N
739	2022-02-06 13:50:13	2022-02-06 13:50:13	Jonah HAUG VANDENHOVE	jonah-haug-vandenhove-1	2003	1	\N	\N
740	2022-02-06 13:50:13	2022-02-06 13:50:13	Jop VERHOEF	jop-verhoef-1	2002	1	\N	\N
741	2022-02-06 13:50:13	2022-02-06 13:50:13	Anil SEZEN	anil-sezen	1992	1	\N	\N
668	2022-02-06 13:50:11	2022-03-24 13:50:54	Federico GILARDI	federico-gilardi	1991	1	\N	["IT"]
742	2022-02-06 13:50:13	2022-02-06 13:50:13	Tim BRANG	tim-brang	1997	1	\N	\N
743	2022-02-06 13:50:13	2022-02-06 13:50:13	Martin MAGNUSSON	martin-magnusson	1995	1	\N	\N
744	2022-02-06 13:50:13	2022-02-06 13:50:13	Sing-chung LEE	sing-chung-lee	1990	1	\N	\N
745	2022-02-06 13:50:13	2022-02-06 13:50:13	Daniele SANNA	daniele-sanna	1989	1	\N	\N
746	2022-02-06 13:50:13	2022-02-06 13:50:13	Barry HAZENOOT	barry-hazenoot	1991	1	\N	\N
747	2022-02-06 13:50:13	2022-02-06 13:50:13	Ting-kin LO	ting-kin-lo	1996	1	\N	\N
748	2022-02-06 13:50:13	2022-02-06 13:50:13	Lennart VOSS	lennart-voss	1994	1	\N	\N
749	2022-02-06 13:50:13	2022-02-06 13:50:13	Tim HAUKE	tim-hauke-1	1992	1	\N	\N
750	2022-02-06 13:50:13	2022-02-06 13:50:13	Jeroen GELLEKOM	jeroen-gellekom	1999	1	\N	\N
751	2022-02-06 13:50:13	2022-02-06 13:50:13	Shun-lai WONG	shun-lai-wong	1997	1	\N	\N
752	2022-02-06 13:50:13	2022-02-06 13:50:13	Michiel VAN DER HEIJDEN	michiel-van-der-heijden	1986	1	\N	\N
753	2022-02-06 13:50:13	2022-02-06 13:50:13	Stefan UBBINK	stefan-ubbink	1978	1	\N	\N
754	2022-02-06 13:50:13	2022-02-06 13:50:13	Heiko VENOHR	heiko-venohr	1963	1	\N	\N
755	2022-02-06 13:50:13	2022-02-06 13:50:13	Erwin TER HUERNE	erwin-ter-huerne-1	1964	1	\N	\N
756	2022-02-06 13:50:14	2022-02-06 13:50:14	Paula SCHUERKMANN	paula-schuerkmann	2003	2	\N	\N
757	2022-02-06 13:50:14	2022-02-06 13:50:14	Juliette DANKELMAN	juliette-dankelman	2001	2	\N	\N
758	2022-02-06 13:50:14	2022-02-06 13:50:14	Cristina LEANZA	cristina-leanza	1988	2	\N	\N
759	2022-02-06 13:50:14	2022-02-06 13:50:14	Erna STEENBEKKERS	erna-steenbekkers	1971	2	\N	\N
760	2022-02-06 13:50:14	2022-02-06 13:50:14	Iwan HOBUS	iwan-hobus-1	2001	1	\N	\N
761	2022-02-06 13:50:14	2022-02-06 13:50:14	Roberto CIOTOLA	roberto-ciotola	1994	1	\N	\N
762	2022-02-06 13:50:14	2022-02-06 13:50:14	Robert GROOT	robert-groot	1993	1	\N	\N
763	2022-02-06 13:50:14	2022-02-06 13:50:14	Femke WESTENENG	femke-westeneng	2003	2	\N	\N
764	2022-02-06 13:50:14	2022-02-06 13:50:14	Maud VAN DER ELSEN	maud-van-der-elsen	2003	2	\N	\N
765	2022-02-06 13:50:14	2022-02-06 13:50:14	Valentiana PRIORI	valentiana-priori	2003	2	\N	\N
766	2022-02-06 13:50:15	2022-02-06 13:50:15	Elise PENNINGS	elise-pennings	1995	2	\N	\N
767	2022-02-06 13:50:15	2022-02-06 13:50:15	Elianne VAN SOEST	elianne-van-soest	1990	2	\N	\N
768	2022-02-06 13:50:15	2022-02-06 13:50:15	Kirsten KOOISTRA	kirsten-kooistra	1993	2	\N	\N
769	2022-02-06 13:50:15	2022-02-06 13:50:15	Anouk BRESSERS	anouk-bressers	1996	2	\N	\N
770	2022-02-06 13:50:15	2022-02-06 13:50:15	Anna Alicia ABAD SIEPER	anna-alicia-abad-sieper	1995	2	\N	\N
771	2022-02-06 13:50:15	2022-02-06 13:50:15	Wendy VAN BOGGELEN	wendy-van-boggelen	1987	2	\N	\N
772	2022-02-06 13:50:15	2022-02-06 13:50:15	Saskia HOPMAN VAN SCHAIK	saskia-hopman-van-schaik	1981	2	\N	\N
773	2022-02-06 13:50:15	2022-02-06 13:50:15	Francoise DURAN	francoise-duran	1969	2	\N	\N
774	2022-02-06 13:50:15	2022-02-06 13:50:15	Hermann-Josef KILDERS	hermann-josef-kilders	1968	1	\N	\N
775	2022-02-06 13:50:15	2022-02-06 13:50:15	Erik DE REUVER	erik-de-reuver	1967	1	\N	\N
776	2022-02-06 13:50:16	2022-02-06 13:50:16	Janne VAN DER ELSEN	janne-van-der-elsen	1998	2	\N	\N
777	2022-02-06 13:50:16	2022-02-06 13:50:16	Calvin VAN HELVOIRT	calvin-van-helvoirt-1	2001	1	\N	\N
778	2022-02-06 13:50:16	2022-02-06 13:50:16	Bjorn DE KLERK	bjorn-de-klerk	2002	1	\N	\N
779	2022-02-06 13:50:16	2022-02-06 13:50:16	Ben KREFT	ben-kreft	2001	1	\N	\N
780	2022-02-06 13:50:16	2022-02-06 13:50:16	Bas DE REUVER	bas-de-reuver-1	2001	1	\N	\N
781	2022-02-06 13:50:16	2022-02-06 13:50:16	Joeri JACOBS	joeri-jacobs	1997	1	\N	\N
782	2022-02-06 13:50:16	2022-02-06 13:50:16	Aliya Kavindu GAYASHAN	aliya-kavindu-gayashan	1993	1	\N	\N
783	2022-02-06 13:50:16	2022-02-06 13:50:16	Jan BRINK	jan-brink	1962	1	\N	\N
75	2022-02-06 13:49:48	2022-02-07 18:20:00	Lani PALLISTER	lani-pallister	2002	2	\N	["AU"]
487	2022-02-06 13:49:54	2022-02-07 18:20:14	Federica VOLPINI	federica-volpini-1	1993	2	\N	["IT"]
127	2022-02-06 13:49:49	2022-02-07 18:20:43	James KOCH	james-koch	1998	1	\N	["AU"]
522	2022-02-06 13:49:54	2022-02-07 18:21:11	Davide PETRUZZI	davide-petruzzi-1	1992	1	\N	["IT"]
785	2022-03-24 10:49:30	2022-03-24 10:49:30	MADDALENA DARAIO	maddalena-daraio	2003	2	\N	\N
786	2022-03-24 10:49:30	2022-03-24 10:49:30	Lucia GONZALEZ GOMEZ	lucia-gonzalez-gomez	2005	2	\N	\N
787	2022-03-24 10:49:30	2022-03-24 10:49:30	Romane BOUDES	romane-boudes	2006	2	\N	\N
788	2022-03-24 10:49:30	2022-03-24 10:49:30	Magdalena BENZMUELLER	magdalena-benzmueller	2005	2	\N	\N
789	2022-03-24 10:49:30	2022-03-24 10:49:30	Letizia TITO	letizia-tito	2006	2	\N	\N
790	2022-03-24 10:49:30	2022-03-24 10:49:30	Lysann WIECZOREK	lysann-wieczorek	2005	2	\N	\N
791	2022-03-24 10:49:30	2022-03-24 10:49:30	Ilaria CIPOLLETTI	ilaria-cipolletti	2006	2	\N	\N
792	2022-03-24 10:49:30	2022-03-24 10:49:30	Paulina BUDZINSKA	paulina-budzinska	2003	2	\N	\N
793	2022-03-24 10:49:30	2022-03-24 10:49:30	Aneta DRABIK	aneta-drabik	2004	2	\N	\N
794	2022-03-24 10:49:30	2022-03-24 10:49:30	Kim MOELLER	kim-moeller	2003	2	\N	\N
795	2022-03-24 10:49:30	2022-03-24 10:49:30	Fiona BERTORELLE	fiona-bertorelle	2006	2	\N	\N
796	2022-03-24 10:49:30	2022-03-24 10:49:30	Carlotta PASQUALI	carlotta-pasquali	2006	2	\N	\N
797	2022-03-24 10:49:30	2022-03-24 10:49:30	Asia CANNONE	asia-cannone	2004	2	\N	\N
798	2022-03-24 10:49:30	2022-03-24 10:49:30	Giulia PIOVANI	giulia-piovani	2005	2	\N	\N
799	2022-03-24 10:49:31	2022-03-24 10:49:31	Mirte S'HEEREN	mirte-sheeren	2006	2	\N	\N
800	2022-03-24 10:49:31	2022-03-24 10:49:31	Sara MONGIA	sara-mongia	2006	2	\N	\N
801	2022-03-24 10:49:31	2022-03-24 10:49:31	Talea FELLENSIEK	talea-fellensiek	2004	2	\N	\N
802	2022-03-24 10:49:31	2022-03-24 10:49:31	Franka RIEDRICH	franka-riedrich	2005	2	\N	\N
803	2022-03-24 10:49:31	2022-03-24 10:49:31	Lien STICKER	lien-sticker	2006	2	\N	\N
804	2022-03-24 10:49:31	2022-03-24 10:49:31	Svea FELLENSIEK	svea-fellensiek	2005	2	\N	\N
805	2022-03-24 10:49:31	2022-03-24 10:49:31	Michelle DELAMARE	michelle-delamare	2005	2	\N	\N
806	2022-03-24 10:49:31	2022-03-24 10:49:31	Fien DERWAEL	fien-derwael	2006	2	\N	\N
807	2022-03-24 10:49:31	2022-03-24 10:49:31	Christin MEESKE	christin-meeske	2005	2	\N	\N
808	2022-03-24 10:49:31	2022-03-24 10:49:31	Giorgia ZAPPONE	giorgia-zappone	2003	2	\N	\N
809	2022-03-24 10:49:31	2022-03-24 10:49:31	Livia PUGGIONI	livia-puggioni	2003	2	\N	\N
810	2022-03-24 10:49:31	2022-03-24 10:49:31	Sofia BELLI	sofia-belli	2005	2	\N	\N
811	2022-03-24 10:49:31	2022-03-24 10:49:31	Loes WIJNANT	loes-wijnant	2005	2	\N	\N
812	2022-03-24 10:49:31	2022-03-24 10:49:31	Sophie KOITKA	sophie-koitka	2006	2	\N	\N
813	2022-03-24 10:49:31	2022-03-24 10:49:31	Martina ROSA	martina-rosa	2004	2	\N	\N
814	2022-03-24 10:49:31	2022-03-24 10:49:31	Jill KELLENERS	jill-kelleners	2006	2	\N	\N
815	2022-03-24 10:49:31	2022-03-24 10:49:31	Amelie EUBE	amelie-eube	2005	2	\N	\N
816	2022-03-24 10:49:31	2022-03-24 10:49:31	Indy VAN PINXTEREN	indy-van-pinxteren	2005	2	\N	\N
817	2022-03-24 10:49:31	2022-03-24 10:49:31	Paula ZUKOWSKA	paula-zukowska	1993	2	\N	\N
818	2022-03-24 10:49:31	2022-03-24 10:49:31	Zoe FOGLIUZZI	zoe-fogliuzzi	1998	2	\N	\N
819	2022-03-24 10:49:31	2022-03-24 10:49:31	Klaudia NAZIEBLO	klaudia-nazieblo	1993	2	\N	\N
820	2022-03-24 10:49:31	2022-03-24 10:49:31	Alica GEBHARDT	alica-gebhardt	1997	2	\N	\N
821	2022-03-24 10:49:31	2022-03-24 10:49:31	Chiara AMBROSI	chiara-ambrosi	2002	2	\N	\N
822	2022-03-24 10:49:31	2022-03-24 10:49:31	Natalia LEWANDOWSKA	natalia-lewandowska	2001	2	\N	\N
823	2022-03-24 10:49:31	2022-03-24 10:49:31	Carol-Ann BOREL	carol-ann-borel	1999	2	\N	\N
824	2022-03-24 10:49:31	2022-03-24 10:49:31	Lea ROYER VEIL	lea-royer-veil	2001	2	\N	\N
825	2022-03-24 10:49:31	2022-03-24 10:49:31	Hanna VAN OS	hanna-van-os	2002	2	\N	\N
826	2022-03-24 10:49:32	2022-03-24 10:49:32	Laura ROESSIGER	laura-roessiger	2000	2	\N	\N
827	2022-03-24 10:49:32	2022-03-24 10:49:32	Victoria DISNEY	victoria-disney	2001	2	\N	\N
828	2022-03-24 10:49:32	2022-03-24 10:49:32	Martina REPETTO	martina-repetto	1998	2	\N	\N
829	2022-03-24 10:49:32	2022-03-24 10:49:32	Carlos CORONADO TEJEDA	carlos-coronado-tejeda	2003	1	\N	\N
830	2022-03-24 10:49:32	2022-03-24 10:49:32	LORENZO MANCARDO	lorenzo-mancardo	2003	1	\N	\N
831	2022-03-24 10:49:32	2022-03-24 10:49:32	Konrad ROGOZINSKI	konrad-rogozinski	2004	1	\N	\N
832	2022-03-24 10:49:32	2022-03-24 10:49:32	Andrea COCIANNI	andrea-cocianni	2003	1	\N	\N
833	2022-03-24 10:49:32	2022-03-24 10:49:32	Milosz MADRZAK	milosz-madrzak	2005	1	\N	\N
834	2022-03-24 10:49:32	2022-03-24 10:49:32	Franco DI SIMONE	franco-di-simone	2003	1	\N	\N
835	2022-03-24 10:49:32	2022-03-24 10:49:32	Riccardo ALDRIGO	riccardo-aldrigo	2005	1	\N	\N
836	2022-03-24 10:49:32	2022-03-24 10:49:32	Matteo BELLOLI	matteo-belloli	2005	1	\N	\N
837	2022-03-24 10:49:32	2022-03-24 10:49:32	Emanuele ACHILLI	emanuele-achilli	2006	1	\N	\N
838	2022-03-24 10:49:32	2022-03-24 10:49:32	Paolo FERRAGOSTO	paolo-ferragosto	2003	1	\N	\N
839	2022-03-24 10:49:32	2022-03-24 10:49:32	Krzysztof ROSIAK	krzysztof-rosiak	2003	1	\N	\N
840	2022-03-24 10:49:32	2022-03-24 10:49:32	Marco INDERBITZIN	marco-inderbitzin	2001	1	\N	\N
841	2022-03-24 10:49:32	2022-03-24 10:49:32	Tom BALSEN VERSTEEG	tom-balsen-versteeg	2000	1	\N	\N
842	2022-03-24 10:49:32	2022-03-24 10:49:32	Sammy FEYS	sammy-feys	2000	1	\N	\N
843	2022-03-24 10:49:32	2022-03-24 10:49:32	Sandro SCHLEICH	sandro-schleich	2001	1	\N	\N
844	2022-03-24 10:49:32	2022-03-24 10:49:32	Nils MUENDELEIN	nils-muendelein-1	2001	1	\N	\N
845	2022-03-24 10:49:32	2022-03-24 10:49:32	Davide MIGLIORELLI	davide-migliorelli-1	2001	1	\N	\N
846	2022-03-24 10:49:32	2022-03-24 10:49:32	Thomas HERRMANN	thomas-herrmann	1999	1	\N	\N
847	2022-03-24 10:49:32	2022-03-24 10:49:32	Matteo CUGLIARI	matteo-cugliari	1995	1	\N	\N
848	2022-03-24 10:49:32	2022-03-24 10:49:32	Guido BRINK	guido-brink	2002	1	\N	\N
849	2022-03-24 10:49:32	2022-03-24 10:49:32	Gerd SCHMIEMANN	gerd-schmiemann	2002	1	\N	\N
850	2022-03-24 10:49:32	2022-03-24 10:49:32	Jonas MELVIN	jonas-melvin	1997	1	\N	\N
851	2022-03-24 10:49:32	2022-03-24 10:49:32	Luigi MARUOTTI	luigi-maruotti-1	1997	1	\N	\N
852	2022-03-24 10:49:32	2022-03-24 10:49:32	Harry VERSPAGEN	harry-verspagen	2001	1	\N	\N
853	2022-03-24 10:49:33	2022-03-24 10:49:33	Bjoern VAN HOFF	bjoern-van-hoff	2002	1	\N	\N
854	2022-03-24 10:49:33	2022-03-24 10:49:33	Ryan WHEELER	ryan-wheeler	1995	1	\N	\N
855	2022-03-24 10:49:33	2022-03-24 10:49:33	Moritz ENKING	moritz-enking	1996	1	\N	\N
856	2022-03-24 10:49:33	2022-03-24 10:49:33	Jan-Willem DEN HARTOG	jan-willem-den-hartog-1	1986	1	\N	\N
857	2022-03-24 10:49:33	2022-03-24 10:49:33	Melvin DE VREEDE	melvin-de-vreede	1985	1	\N	\N
858	2022-03-24 10:49:33	2022-03-24 10:49:33	Bart STOPPELENBURG	bart-stoppelenburg	1985	1	\N	\N
859	2022-03-24 10:49:33	2022-03-24 10:49:33	Kornelia FIEDKIEWICZ	kornelia-fiedkiewicz	\N	2	\N	\N
860	2022-03-24 10:49:33	2022-03-24 10:49:33	Alicja TCHORZ	alicja-tchorz	\N	2	\N	\N
861	2022-03-24 10:49:33	2022-03-24 10:49:33	Lucrezia FABRETTI	lucrezia-fabretti	\N	2	\N	\N
862	2022-03-24 10:49:33	2022-03-24 10:49:33	Francesca PASQUINO	francesca-pasquino	\N	2	\N	\N
863	2022-03-24 10:49:33	2022-03-24 10:49:33	Helene GIOVANELLI	helene-giovanelli	\N	2	\N	\N
864	2022-03-24 10:49:33	2022-03-24 10:49:33	Lucrezia NAPOLETANO	lucrezia-napoletano	\N	2	\N	\N
865	2022-03-24 10:49:33	2022-03-24 10:49:33	Antia GARCIA SILVA	antia-garcia-silva	\N	2	\N	\N
866	2022-03-24 10:49:33	2022-03-24 10:49:33	Emma DURAND	emma-durand	\N	2	\N	\N
867	2022-03-24 10:49:33	2022-03-24 10:49:33	Manon MARCO	manon-marco	\N	2	\N	\N
868	2022-03-24 10:49:33	2022-03-24 10:49:33	Aurelie ROMANINI	aurelie-romanini	\N	2	\N	\N
869	2022-03-24 10:49:33	2022-03-24 10:49:33	Stefanie LINDEKENS	stefanie-lindekens	\N	2	\N	\N
870	2022-03-24 10:49:33	2022-03-24 10:49:33	Beatriz MASCAROS NUNEZ	beatriz-mascaros-nunez	\N	2	\N	\N
871	2022-03-24 10:49:34	2022-03-24 10:49:34	Lena OPPERMANN	lena-oppermann	\N	2	\N	\N
872	2022-03-24 10:49:34	2022-03-24 10:49:34	Melissa GIORDANO	melissa-giordano	\N	2	\N	\N
873	2022-03-24 10:49:34	2022-03-24 10:49:34	Solene RAUZY	solene-rauzy	\N	2	\N	\N
874	2022-03-24 10:49:34	2022-03-24 10:49:34	Louenn CLOTEAUX	louenn-cloteaux	\N	2	\N	\N
875	2022-03-24 10:49:34	2022-03-24 10:49:34	Karolina FASZCZEWSKA	karolina-faszczewska	\N	2	\N	\N
876	2022-03-24 10:49:34	2022-03-24 10:49:34	Anna POPIEL	anna-popiel	\N	2	\N	\N
877	2022-03-24 10:49:34	2022-03-24 10:49:34	Wiktoria JANISZEWSKA	wiktoria-janiszewska	\N	2	\N	\N
878	2022-03-24 10:49:34	2022-03-24 10:49:34	Anna KARWOWSKA	anna-karwowska	\N	2	\N	\N
879	2022-03-24 10:49:34	2022-03-24 10:49:34	Marta SKUDLIK	marta-skudlik	\N	2	\N	\N
880	2022-03-24 10:49:34	2022-03-24 10:49:34	Joanna CZOK	joanna-czok	\N	2	\N	\N
881	2022-03-24 10:49:34	2022-03-24 10:49:34	Mona GRUNDMEIER	mona-grundmeier	\N	2	\N	\N
882	2022-03-24 10:49:34	2022-03-24 10:49:34	Monia SCHMIEMANN	monia-schmiemann	\N	2	\N	\N
883	2022-03-24 10:49:34	2022-03-24 10:49:34	Greta BUECKEN	greta-buecken	\N	2	\N	\N
884	2022-03-24 10:49:34	2022-03-24 10:49:34	Chiara BONETTI	chiara-bonetti	\N	2	\N	\N
885	2022-03-24 10:49:34	2022-03-24 10:49:34	Noemi MONTENEGREO	noemi-montenegreo	\N	2	\N	\N
886	2022-03-24 10:49:34	2022-03-24 10:49:34	Denise VAGLIVIELLO	denise-vagliviello	\N	2	\N	\N
887	2022-03-24 10:49:34	2022-03-24 10:49:34	Angelica DOMINJANNI	angelica-dominjanni	\N	2	\N	\N
888	2022-03-24 10:49:34	2022-03-24 10:49:34	Jennifer SETTI	jennifer-setti	\N	2	\N	\N
889	2022-03-24 10:49:34	2022-03-24 10:49:34	Chakyra HAASJES	chakyra-haasjes	\N	2	\N	\N
890	2022-03-24 10:49:34	2022-03-24 10:49:34	Lena ROMANCZYK	lena-romanczyk	\N	2	\N	\N
891	2022-03-24 10:49:34	2022-03-24 10:49:34	Jule WRIGGERS	jule-wriggers	\N	2	\N	\N
892	2022-03-24 10:49:34	2022-03-24 10:49:34	Lianne PERRIENS	lianne-perriens	\N	2	\N	\N
893	2022-03-24 10:49:35	2022-03-24 10:49:35	Bence GYARFAS	bence-gyarfas	\N	1	\N	\N
894	2022-03-24 10:49:35	2022-03-24 10:49:35	Krisztian TAKACS	krisztian-takacs	\N	1	\N	\N
895	2022-03-24 10:49:35	2022-03-24 10:49:35	Matyas Zsolt GICZI	matyas-zsolt-giczi	\N	1	\N	\N
896	2022-03-24 10:49:35	2022-03-24 10:49:35	Gabor BALOG	gabor-balog	\N	1	\N	\N
897	2022-03-24 10:49:35	2022-03-24 10:49:35	Simone LOCCHI	simone-locchi	\N	1	\N	\N
898	2022-03-24 10:49:35	2022-03-24 10:49:35	Pau BELTRAN CABEDO	pau-beltran-cabedo	\N	1	\N	\N
899	2022-03-24 10:49:35	2022-03-24 10:49:35	Roberto MORENO DIAZ	roberto-moreno-diaz	\N	1	\N	\N
900	2022-03-24 10:49:35	2022-03-24 10:49:35	Raul Marek SPUZNAR ROSA	raul-marek-spuznar-rosa	\N	1	\N	\N
901	2022-03-24 10:49:35	2022-03-24 10:49:35	Andrea NICIARELLI	andrea-niciarelli	\N	1	\N	\N
902	2022-03-24 10:49:35	2022-03-24 10:49:35	Mattia D'IPPOLITO	mattia-dippolito	\N	1	\N	\N
903	2022-03-24 10:49:35	2022-03-24 10:49:35	Davide MARCHESE	davide-marchese	\N	1	\N	\N
904	2022-03-24 10:49:35	2022-03-24 10:49:35	Hubert NAKIELSKI	hubert-nakielski	\N	1	\N	\N
905	2022-03-24 10:49:35	2022-03-24 10:49:35	Adam DUBIEL	adam-dubiel	\N	1	\N	\N
906	2022-03-24 10:49:35	2022-03-24 10:49:35	Radoslaw ROGOZINSKI	radoslaw-rogozinski	\N	1	\N	\N
907	2022-03-24 10:49:35	2022-03-24 10:49:35	Mateusz GRABSKI	mateusz-grabski	\N	1	\N	\N
908	2022-03-24 10:49:35	2022-03-24 10:49:35	Javier HUERGA SANCHEZ	javier-huerga-sanchez	\N	1	\N	\N
909	2022-03-24 10:49:35	2022-03-24 10:49:35	Marco PLAZUELO JIMENEZ	marco-plazuelo-jimenez	\N	1	\N	\N
910	2022-03-24 10:49:35	2022-03-24 10:49:35	Tom BESSON GAZON	tom-besson-gazon	\N	1	\N	\N
911	2022-03-24 10:49:35	2022-03-24 10:49:35	dylan VIALETTES	dylan-vialettes	\N	1	\N	\N
912	2022-03-24 10:49:35	2022-03-24 10:49:35	Arnaud CORDOBA	arnaud-cordoba	\N	1	\N	\N
913	2022-03-24 10:49:35	2022-03-24 10:49:35	Martin ROQUES	martin-roques	\N	1	\N	\N
914	2022-03-24 10:49:35	2022-03-24 10:49:35	Frederick SICURO	frederick-sicuro	\N	1	\N	\N
915	2022-03-24 10:49:35	2022-03-24 10:49:35	Erik CAPORALE	erik-caporale	\N	1	\N	\N
916	2022-03-24 10:49:35	2022-03-24 10:49:35	ENRICO MANCARDO	enrico-mancardo	\N	1	\N	\N
917	2022-03-24 10:49:35	2022-03-24 10:49:35	ANDREA VIVALDA	andrea-vivalda	\N	1	\N	\N
918	2022-03-24 10:49:35	2022-03-24 10:49:35	DAVIDE VIVALDA	davide-vivalda	\N	1	\N	\N
919	2022-03-24 10:49:35	2022-03-24 10:49:35	Tito QUIDACCIOLU	tito-quidacciolu	\N	1	\N	\N
920	2022-03-24 10:49:35	2022-03-24 10:49:35	Emilio MAZZA	emilio-mazza	\N	1	\N	\N
921	2022-03-24 10:49:35	2022-03-24 10:49:35	Lorenzo OMERO	lorenzo-omero	\N	1	\N	\N
922	2022-03-24 10:49:35	2022-03-24 10:49:35	Gabriele GIACONIA	gabriele-giaconia	\N	1	\N	\N
923	2022-03-24 10:49:35	2022-03-24 10:49:35	Arne WULF	arne-wulf	\N	1	\N	\N
924	2022-03-24 10:49:35	2022-03-24 10:49:35	Max STERN	max-stern	\N	1	\N	\N
925	2022-03-24 10:49:35	2022-03-24 10:49:35	Lars-Erik WENGER	lars-erik-wenger	\N	1	\N	\N
926	2022-03-24 10:49:35	2022-03-24 10:49:35	Alessandro DE VINCENTIIS	alessandro-de-vincentiis	\N	1	\N	\N
927	2022-03-24 10:49:35	2022-03-24 10:49:35	Kacper WROBLEWSKI	kacper-wroblewski	\N	1	\N	\N
928	2022-03-24 10:49:35	2022-03-24 10:49:35	Piotr NAZARUK	piotr-nazaruk	\N	1	\N	\N
929	2022-03-24 10:49:36	2022-03-24 10:49:36	Max TESCH	max-tesch	\N	1	\N	\N
930	2022-03-24 10:49:36	2022-03-24 10:49:36	Tom DURAGER	tom-durager	\N	1	\N	\N
931	2022-03-24 10:49:36	2022-03-24 10:49:36	Tom BERGERON	tom-bergeron	\N	1	\N	\N
932	2022-03-24 10:49:36	2022-03-24 10:49:36	Simon LEVEQUE	simon-leveque	\N	1	\N	\N
933	2022-03-24 10:49:36	2022-03-24 10:49:36	Axel AIELLO	axel-aiello	\N	1	\N	\N
934	2022-03-24 10:49:36	2022-03-24 10:49:36	Antonio PUGGIONI	antonio-puggioni	\N	1	\N	\N
935	2022-03-24 10:49:36	2022-03-24 10:49:36	Federico FRONTERA	federico-frontera	\N	1	\N	\N
936	2022-03-24 10:49:36	2022-03-24 10:49:36	Dominik KOSOWSKI	dominik-kosowski	\N	1	\N	\N
937	2022-03-24 10:49:36	2022-03-24 10:49:36	Szymon CZERW	szymon-czerw	\N	1	\N	\N
938	2022-03-24 10:49:36	2022-03-24 10:49:36	Szymon BIERNACIK	szymon-biernacik	\N	1	\N	\N
939	2022-03-24 10:49:36	2022-03-24 10:49:36	Aleksander JASINSKI	aleksander-jasinski	\N	1	\N	\N
940	2022-03-24 10:49:36	2022-03-24 10:49:36	Vincenzo COPPOLA	vincenzo-coppola	\N	1	\N	\N
941	2022-03-24 10:49:36	2022-03-24 10:49:36	Matteo PENNESI	matteo-pennesi	\N	1	\N	\N
942	2022-03-24 10:49:36	2022-03-24 10:49:36	Jakub MELKOWSKI	jakub-melkowski	\N	1	\N	\N
943	2022-03-24 10:49:36	2022-03-24 10:49:36	Kamil KURZAK	kamil-kurzak	\N	1	\N	\N
944	2022-03-24 10:49:36	2022-03-24 10:49:36	Igor WROBEL	igor-wrobel	\N	1	\N	\N
945	2022-03-24 10:49:36	2022-03-24 10:49:36	Jonas BODENBURG	jonas-bodenburg	\N	1	\N	\N
946	2022-03-24 10:49:36	2022-03-24 10:49:36	Henrik DICKE	henrik-dicke	\N	1	\N	\N
947	2022-03-24 10:49:36	2022-03-24 10:49:36	Johannes VERFUERTH	johannes-verfuerth	\N	1	\N	\N
948	2022-03-24 10:49:36	2022-03-24 10:49:36	Patrick WELZEL	patrick-welzel	\N	1	\N	\N
949	2022-03-24 10:49:36	2022-03-24 10:49:36	Tommaso LO BUE	tommaso-lo-bue	\N	1	\N	\N
950	2022-03-24 10:49:36	2022-03-24 10:49:36	Andrea BANARI	andrea-banari	\N	1	\N	\N
951	2022-03-24 10:49:36	2022-03-24 10:49:36	Diego GARCIA CASTRO	diego-garcia-castro	\N	1	\N	\N
952	2022-03-24 10:49:36	2022-03-24 10:49:36	Mario GIORGETTI	mario-giorgetti	\N	1	\N	\N
953	2022-03-24 10:49:36	2022-03-24 10:49:36	Jonas SPLIETHOFF	jonas-spliethoff	\N	1	\N	\N
954	2022-03-24 10:49:36	2022-03-24 10:49:36	Emiliano FRONTERA	emiliano-frontera	\N	1	\N	\N
955	2022-03-24 10:49:36	2022-03-24 10:49:36	Paolo COLASANTI	paolo-colasanti	\N	1	\N	\N
956	2022-03-24 10:49:36	2022-03-24 10:49:36	Paolo BERNACCHIA	paolo-bernacchia	\N	1	\N	\N
957	2022-03-24 10:49:36	2022-03-24 10:49:36	Daniele FAMIGLIETTI	daniele-famiglietti	\N	1	\N	\N
958	2022-03-24 10:49:36	2022-03-24 10:49:36	Rick JACOBS	rick-jacobs	\N	1	\N	\N
959	2022-03-24 10:49:36	2022-03-24 10:49:36	Ian WEEKERS	ian-weekers	\N	1	\N	\N
960	2022-03-24 10:49:36	2022-03-24 10:49:36	Volker HEROLD	volker-herold	\N	1	\N	\N
961	2022-03-24 10:49:36	2022-03-24 10:49:36	Fabian MESSER	fabian-messer	\N	1	\N	\N
962	2022-03-24 10:49:36	2022-03-24 10:49:36	Ashef RAHMATULLAH	ashef-rahmatullah	\N	1	\N	\N
963	2022-03-24 10:49:36	2022-03-24 10:49:36	Nico Joe JUNG	nico-joe-jung	\N	1	\N	\N
964	2022-03-24 10:49:36	2022-03-24 10:49:36	Soeren MODDER	soeren-modder	\N	1	\N	\N
965	2022-03-24 10:49:36	2022-03-24 10:49:36	Ben PREUSS	ben-preuss	\N	1	\N	\N
966	2022-03-24 10:49:36	2022-03-24 10:49:36	Johann REINKE	johann-reinke	\N	1	\N	\N
967	2022-03-24 10:49:36	2022-03-24 10:49:36	Melvin HULST	melvin-hulst	\N	1	\N	\N
968	2022-03-24 10:49:36	2022-03-24 10:49:36	Stefan DE WITTE	stefan-de-witte	\N	1	\N	\N
969	2022-03-24 10:49:37	2022-03-24 10:49:37	Ella JACOBS	ella-jacobs	\N	2	\N	\N
970	2022-03-24 10:49:37	2022-03-24 10:49:37	Maria RODRIGUEZ RODRIGUEZ DE LA SIERRA	maria-rodriguez-rodriguez-de-la-sierra	\N	2	\N	\N
971	2022-03-24 10:49:37	2022-03-24 10:49:37	Annika WIENHOLDT	annika-wienholdt	\N	2	\N	\N
972	2022-03-24 10:49:37	2022-03-24 10:49:37	Lieke GERAATS	lieke-geraats	\N	2	\N	\N
973	2022-03-24 10:49:37	2022-03-24 10:49:37	Sara PICCARDI	sara-piccardi	\N	2	\N	\N
974	2022-03-24 10:49:37	2022-03-24 10:49:37	Vittoria OLIVIERI	vittoria-olivieri	\N	2	\N	\N
975	2022-03-24 10:49:37	2022-03-24 10:49:37	Emma NAUTA	emma-nauta	\N	2	\N	\N
976	2022-03-24 10:49:37	2022-03-24 10:49:37	Carlotta TORTELLO	carlotta-tortello	\N	2	\N	\N
977	2022-03-24 10:49:37	2022-03-24 10:49:37	Alice MIDEI	alice-midei	\N	2	\N	\N
978	2022-03-24 10:49:38	2022-03-24 10:49:38	Paola LANZILLOTTI	paola-lanzillotti	\N	2	\N	\N
979	2022-03-24 10:49:38	2022-03-24 10:49:38	Vera JANSSEN	vera-janssen	\N	2	\N	\N
980	2022-03-24 10:49:38	2022-03-24 10:49:38	Calista LONG	calista-long	\N	2	\N	\N
981	2022-03-24 10:49:38	2022-03-24 10:49:38	Meline BONHOMME	meline-bonhomme	\N	2	\N	\N
982	2022-03-24 10:49:38	2022-03-24 10:49:38	Janice BONHOMME	janice-bonhomme	\N	2	\N	\N
983	2022-03-24 10:49:38	2022-03-24 10:49:38	Kinga Szczembara KINGA SZCZEMBARA	kinga-szczembara-kinga-szczembara	\N	2	\N	\N
984	2022-03-24 10:49:38	2022-03-24 10:49:38	Max KUBLER	max-kubler	\N	1	\N	\N
985	2022-03-24 10:49:38	2022-03-24 10:49:38	Maximilian VINZ	maximilian-vinz	\N	1	\N	\N
986	2022-03-24 10:49:38	2022-03-24 10:49:38	Yves ROEMEN	yves-roemen	\N	1	\N	\N
987	2022-03-24 10:49:39	2022-03-24 10:49:39	Jason VAN BEEK	jason-van-beek	\N	1	\N	\N
988	2022-03-24 10:49:39	2022-03-24 10:49:39	Timo VAN DAM	timo-van-dam	\N	1	\N	\N
989	2022-03-24 10:49:39	2022-03-24 10:49:39	Luca MUELLER	luca-mueller	\N	1	\N	\N
990	2022-03-24 10:49:39	2022-03-24 10:49:39	Brivael FORMANN	brivael-formann	\N	1	\N	\N
991	2022-03-24 10:49:39	2022-03-24 10:49:39	Loris ROSOLEN	loris-rosolen	\N	1	\N	\N
992	2022-03-24 10:49:39	2022-03-24 10:49:39	Ingmar LAMFERS	ingmar-lamfers	\N	1	\N	\N
993	2022-03-24 10:49:40	2022-03-24 10:49:40	Andrea ROSSI	andrea-rossi	\N	1	\N	\N
994	2022-03-24 10:49:40	2022-03-24 10:49:40	Lorenzo CARRARINI	lorenzo-carrarini	\N	1	\N	\N
995	2022-03-24 10:49:40	2022-03-24 10:49:40	Karim MAKUAKUA	karim-makuakua	\N	1	\N	\N
996	2022-03-24 10:49:40	2022-03-24 10:49:40	Lorenzo SEIDEL	lorenzo-seidel	\N	1	\N	\N
997	2022-03-24 10:49:40	2022-03-24 10:49:40	Nick HARKES	nick-harkes	\N	1	\N	\N
998	2022-03-24 10:49:40	2022-03-24 10:49:40	Timo BOOMERS	timo-boomers	\N	1	\N	\N
999	2022-03-24 10:49:40	2022-03-24 10:49:40	Tillman THEISS	tillman-theiss	\N	1	\N	\N
1000	2022-03-24 10:49:40	2022-03-24 10:49:40	Lena OPPERMANN	lena-oppermann-1	2005	2	\N	\N
1001	2022-03-24 10:49:40	2022-03-24 10:49:40	Ella JACOBS	ella-jacobs-1	2005	2	\N	\N
1002	2022-03-24 10:49:40	2022-03-24 10:49:40	Alice TIRONI	alice-tironi	2005	2	\N	\N
1003	2022-03-24 10:49:40	2022-03-24 10:49:40	Sofia POJUM	sofia-pojum	2006	2	\N	\N
1004	2022-03-24 10:49:41	2022-03-24 10:49:41	Louenn CLOTEAUX	louenn-cloteaux-1	2005	2	\N	\N
1005	2022-03-24 10:49:41	2022-03-24 10:49:41	Gina ZECH	gina-zech	2005	2	\N	\N
1006	2022-03-24 10:49:41	2022-03-24 10:49:41	Meline BONHOMME	meline-bonhomme-1	2004	2	\N	\N
1007	2022-03-24 10:49:41	2022-03-24 10:49:41	Joanna CZOK	joanna-czok-1	2003	2	\N	\N
1008	2022-03-24 10:49:41	2022-03-24 10:49:41	Nell DEWAEL	nell-dewael	2006	2	\N	\N
1009	2022-03-24 10:49:41	2022-03-24 10:49:41	Ruth DE GREEF	ruth-de-greef	2003	2	\N	\N
1010	2022-03-24 10:49:41	2022-03-24 10:49:41	Fenne MENNEN	fenne-mennen	2006	2	\N	\N
1011	2022-03-24 10:49:41	2022-03-24 10:49:41	Wiktoria JANISZEWSKA	wiktoria-janiszewska-1	2004	2	\N	\N
1012	2022-03-24 10:49:41	2022-03-24 10:49:41	Lune HUYSMANS	lune-huysmans	2006	2	\N	\N
1013	2022-03-24 10:49:41	2022-03-24 10:49:41	Calista LONG	calista-long-1	2005	2	\N	\N
1014	2022-03-24 10:49:41	2022-03-24 10:49:41	Janice BONHOMME	janice-bonhomme-1	2006	2	\N	\N
1015	2022-03-24 10:49:41	2022-03-24 10:49:41	Hannah KRAUSS	hannah-krauss-2	2005	2	\N	\N
1016	2022-03-24 10:49:41	2022-03-24 10:49:41	Lieke GERAATS	lieke-geraats-1	2006	2	\N	\N
1017	2022-03-24 10:49:41	2022-03-24 10:49:41	Vera JANSSEN	vera-janssen-1	2005	2	\N	\N
1018	2022-03-24 10:49:41	2022-03-24 10:49:41	Mona GRUNDMEIER	mona-grundmeier-1	2005	2	\N	\N
1019	2022-03-24 10:49:41	2022-03-24 10:49:41	Chakyra HAASJES	chakyra-haasjes-1	2004	2	\N	\N
1020	2022-03-24 10:49:41	2022-03-24 10:49:41	Monia SCHMIEMANN	monia-schmiemann-1	2004	2	\N	\N
1021	2022-03-24 10:49:41	2022-03-24 10:49:41	Kinga Szczembara KINGA SZCZEMBARA	kinga-szczembara-kinga-szczembara-1	2006	2	\N	\N
1022	2022-03-24 10:49:41	2022-03-24 10:49:41	Lianne PERRIENS	lianne-perriens-1	2006	2	\N	\N
1023	2022-03-24 10:49:41	2022-03-24 10:49:41	Julia BARBU	julia-barbu	2006	2	\N	\N
1024	2022-03-24 10:49:41	2022-03-24 10:49:41	Emma NAUTA	emma-nauta-1	2006	2	\N	\N
1026	2022-03-24 10:49:42	2022-03-24 10:49:42	Aurelie ROMANINI	aurelie-romanini-1	1987	2	\N	\N
1027	2022-03-24 10:49:42	2022-03-24 10:49:42	Manon MARCO	manon-marco-1	2001	2	\N	\N
1028	2022-03-24 10:49:42	2022-03-24 10:49:42	Kerstin LANGE	kerstin-lange	1991	2	\N	\N
1029	2022-03-24 10:49:42	2022-03-24 10:49:42	Beatriz MASCAROS NUNEZ	beatriz-mascaros-nunez-1	2002	2	\N	\N
1030	2022-03-24 10:49:42	2022-03-24 10:49:42	Emma DURAND	emma-durand-1	2000	2	\N	\N
1031	2022-03-24 10:49:42	2022-03-24 10:49:42	Karolina FASZCZEWSKA	karolina-faszczewska-1	1999	2	\N	\N
1032	2022-03-24 10:49:42	2022-03-24 10:49:42	Kornelia FIEDKIEWICZ	kornelia-fiedkiewicz-1	2001	2	\N	\N
1033	2022-03-24 10:49:42	2022-03-24 10:49:42	Stefanie LINDEKENS	stefanie-lindekens-1	1997	2	\N	\N
1035	2022-03-24 10:49:43	2022-03-24 10:49:43	Simone LOCCHI	simone-locchi-1	2004	1	\N	\N
1036	2022-03-24 10:49:43	2022-03-24 10:49:43	Mateusz GRABSKI	mateusz-grabski-1	2003	1	\N	\N
1037	2022-03-24 10:49:43	2022-03-24 10:49:43	Ben CUSSELLE	ben-cusselle	2003	1	\N	\N
1038	2022-03-24 10:49:43	2022-03-24 10:49:43	Simon LEVEQUE	simon-leveque-1	2005	1	\N	\N
1039	2022-03-24 10:49:43	2022-03-24 10:49:43	Seth VAN HOFTEN	seth-van-hoften-1	2004	1	\N	\N
1040	2022-03-24 10:49:43	2022-03-24 10:49:43	ENRICO MANCARDO	enrico-mancardo-1	2001	1	\N	\N
1041	2022-03-24 10:49:43	2022-03-24 10:49:43	Gabriele GIACONIA	gabriele-giaconia-1	1996	1	\N	\N
1042	2022-03-24 10:49:43	2022-03-24 10:49:43	Timo ZEMBOLD	timo-zembold	2002	1	\N	\N
1043	2022-03-24 10:49:43	2022-03-24 10:49:43	Jelle VANDERSTEEN	jelle-vandersteen-1	2002	1	\N	\N
1044	2022-03-24 10:49:43	2022-03-24 10:49:43	Alessandro DE VINCENTIIS	alessandro-de-vincentiis-1	2002	1	\N	\N
1045	2022-03-24 10:49:43	2022-03-24 10:49:43	Daniele DI SILVESTRE	daniele-di-silvestre-1	2002	1	\N	\N
1046	2022-03-24 10:49:43	2022-03-24 10:49:43	Robbe WILMOTS	robbe-wilmots	2000	1	\N	\N
1047	2022-03-24 10:49:43	2022-03-24 10:49:43	Jonas SPLIETHOFF	jonas-spliethoff-1	2001	1	\N	\N
1048	2022-03-24 10:49:43	2022-03-24 10:49:43	Phillip TERPORTEN	phillip-terporten-1	2002	1	\N	\N
1049	2022-03-24 10:49:43	2022-03-24 10:49:43	Patrick TAUBE	patrick-taube-1	2002	1	\N	\N
1050	2022-03-24 10:49:43	2022-03-24 10:49:43	Tim PASTOORS	tim-pastoors-1	2001	1	\N	\N
1051	2022-03-24 10:49:43	2022-03-24 10:49:43	Emiliano FRONTERA	emiliano-frontera-1	2002	1	\N	\N
1052	2022-03-24 10:49:44	2022-03-24 10:49:44	David BROWNE	david-browne	1972	1	\N	\N
1053	2022-03-24 10:49:44	2022-03-24 10:49:44	Melissa GIORDANO	melissa-giordano-1	2006	2	\N	\N
1054	2022-03-24 10:49:44	2022-03-24 10:49:44	Sheila BARRENA PONCE	sheila-barrena-ponce	2003	2	\N	\N
1055	2022-03-24 10:49:44	2022-03-24 10:49:44	Solene RAUZY	solene-rauzy-1	2005	2	\N	\N
1056	2022-03-24 10:49:44	2022-03-24 10:49:44	Natalia PASEK	natalia-pasek	2005	2	\N	\N
1057	2022-03-24 10:49:44	2022-03-24 10:49:44	Chiara BONETTI	chiara-bonetti-1	2006	2	\N	\N
1058	2022-03-24 10:49:44	2022-03-24 10:49:44	Noemi MONTENEGREO	noemi-montenegreo-1	2003	2	\N	\N
1059	2022-03-24 10:49:44	2022-03-24 10:49:44	Carlotta D'ALESSANDRO	carlotta-dalessandro	2006	2	\N	\N
1060	2022-03-24 10:49:44	2022-03-24 10:49:44	Denise VAGLIVIELLO	denise-vagliviello-1	2005	2	\N	\N
1061	2022-03-24 10:49:44	2022-03-24 10:49:44	Laura PETRUNGARO	laura-petrungaro	2006	2	\N	\N
1062	2022-03-24 10:49:44	2022-03-24 10:49:44	Anna KARWOWSKA	anna-karwowska-1	2003	2	\N	\N
1063	2022-03-24 10:49:45	2022-03-24 10:49:45	Greta BUECKEN	greta-buecken-1	2005	2	\N	\N
1064	2022-03-24 10:49:45	2022-03-24 10:49:45	Sveva FERRIGNO	sveva-ferrigno	2005	2	\N	\N
1065	2022-03-24 10:49:45	2022-03-24 10:49:45	Lea SPLIETHOFF	lea-spliethoff-1	2004	2	\N	\N
1066	2022-03-24 10:49:45	2022-03-24 10:49:45	Angelica DOMINJANNI	angelica-dominjanni-1	2006	2	\N	\N
1067	2022-03-24 10:49:46	2022-03-24 10:49:46	Lena ROMANCZYK	lena-romanczyk-1	2006	2	\N	\N
1025	2022-03-24 10:49:41	2022-03-24 13:51:19	Helene GIOVANELLI	helene-giovanelli-1	2002	2	\N	["IT"]
1068	2022-03-24 10:49:46	2022-03-24 10:49:46	Jennifer SETTI	jennifer-setti-1	2005	2	\N	\N
1069	2022-03-24 10:49:46	2022-03-24 10:49:46	Francesca TUBILI	francesca-tubili	2006	2	\N	\N
1070	2022-03-24 10:49:46	2022-03-24 10:49:46	Jule WRIGGERS	jule-wriggers-1	2004	2	\N	\N
1071	2022-03-24 10:49:46	2022-03-24 10:49:46	Bo VAN DE PLAS	bo-van-de-plas	2001	2	\N	\N
1072	2022-03-24 10:49:46	2022-03-24 10:49:46	Jasmin DZIURON	jasmin-dziuron	1993	2	\N	\N
1073	2022-03-24 10:49:46	2022-03-24 10:49:46	Martina QUADRELLI	martina-quadrelli	2000	2	\N	\N
1074	2022-03-24 10:49:46	2022-03-24 10:49:46	Valeria FILIPPINI	valeria-filippini	1999	2	\N	\N
1075	2022-03-24 10:49:47	2022-03-24 10:49:47	Marta SKUDLIK	marta-skudlik-1	2001	2	\N	\N
1076	2022-03-24 10:49:47	2022-03-24 10:49:47	Anna POPIEL	anna-popiel-1	2001	2	\N	\N
1077	2022-03-24 10:49:47	2022-03-24 10:49:47	Lucrezia FABRETTI	lucrezia-fabretti-1	2001	2	\N	\N
1078	2022-03-24 10:49:47	2022-03-24 10:49:47	Paola LANZILLOTTI	paola-lanzillotti-1	1997	2	\N	\N
1079	2022-03-24 10:49:47	2022-03-24 10:49:47	Alice MIDEI	alice-midei-1	2001	2	\N	\N
1080	2022-03-24 10:49:47	2022-03-24 10:49:47	Sara PICCARDI	sara-piccardi-1	2002	2	\N	\N
1081	2022-03-24 10:49:47	2022-03-24 10:49:47	Silvia MICHESI	silvia-michesi	2000	2	\N	\N
1082	2022-03-24 10:49:47	2022-03-24 10:49:47	Jana TERLIESNER	jana-terliesner-1	1995	2	\N	\N
1083	2022-03-24 10:49:47	2022-03-24 10:49:47	Carlotta TORTELLO	carlotta-tortello-1	2002	2	\N	\N
1084	2022-03-24 10:49:48	2022-03-24 10:49:48	Vivian ZANDER	vivian-zander	1998	2	\N	\N
1085	2022-03-24 10:49:48	2022-03-24 10:49:48	Astrid VAN DE KOOIJ	astrid-van-de-kooij	1964	2	\N	\N
1086	2022-03-24 10:49:48	2022-03-24 10:49:48	Alberto TURRADO ALVAREZ	alberto-turrado-alvarez-1	2004	1	\N	\N
1087	2022-03-24 10:49:48	2022-03-24 10:49:48	Tom DURAGER	tom-durager-1	2005	1	\N	\N
1088	2022-03-24 10:49:48	2022-03-24 10:49:48	Radoslaw ROGOZINSKI	radoslaw-rogozinski-1	2003	1	\N	\N
1089	2022-03-24 10:49:48	2022-03-24 10:49:48	Roberto CHIAVACCI	roberto-chiavacci-1	2004	1	\N	\N
1090	2022-03-24 10:49:48	2022-03-24 10:49:48	Jan CWIKLINSKI	jan-cwiklinski	2004	1	\N	\N
1091	2022-03-24 10:49:48	2022-03-24 10:49:48	Ivan ROMERO FERNANDEZ	ivan-romero-fernandez-1	2003	1	\N	\N
1092	2022-03-24 10:49:48	2022-03-24 10:49:48	Brivael FORMANN	brivael-formann-1	2004	1	\N	\N
1093	2022-03-24 10:49:48	2022-03-24 10:49:48	Piotr NAZARUK	piotr-nazaruk-1	2003	1	\N	\N
1094	2022-03-24 10:49:48	2022-03-24 10:49:48	Antonio PUGGIONI	antonio-puggioni-1	2004	1	\N	\N
1095	2022-03-24 10:49:48	2022-03-24 10:49:48	Paul-Louis ABEL	paul-louis-abel-1	2004	1	\N	\N
1096	2022-03-24 10:49:48	2022-03-24 10:49:48	Riccardo NEICA	riccardo-neica	2005	1	\N	\N
1097	2022-03-24 10:49:48	2022-03-24 10:49:48	Dominik KOSOWSKI	dominik-kosowski-1	2006	1	\N	\N
1098	2022-03-24 10:49:48	2022-03-24 10:49:48	Mario GIORGETTI	mario-giorgetti-1	2006	1	\N	\N
1099	2022-03-24 10:49:48	2022-03-24 10:49:48	Stef ABBEEL	stef-abbeel	2005	1	\N	\N
1100	2022-03-24 10:49:48	2022-03-24 10:49:48	Paolo COLASANTI	paolo-colasanti-1	2005	1	\N	\N
1101	2022-03-24 10:49:48	2022-03-24 10:49:48	Emanuele DELLI PASSERI	emanuele-delli-passeri	2005	1	\N	\N
1102	2022-03-24 10:49:48	2022-03-24 10:49:48	Tito QUIDACCIOLU	tito-quidacciolu-1	2003	1	\N	\N
1103	2022-03-24 10:49:48	2022-03-24 10:49:48	Aiko KNUTS	aiko-knuts	2006	1	\N	\N
1104	2022-03-24 10:49:48	2022-03-24 10:49:48	Axel AIELLO	axel-aiello-1	2005	1	\N	\N
1105	2022-03-24 10:49:49	2022-03-24 10:49:49	Paolo BERNACCHIA	paolo-bernacchia-1	2003	1	\N	\N
1106	2022-03-24 10:49:49	2022-03-24 10:49:49	Szymon BIERNACIK	szymon-biernacik-1	2004	1	\N	\N
1107	2022-03-24 10:49:49	2022-03-24 10:49:49	Maximilian VINZ	maximilian-vinz-1	2005	1	\N	\N
1108	2022-03-24 10:49:49	2022-03-24 10:49:49	Ben PREUSS	ben-preuss-1	2005	1	\N	\N
1109	2022-03-24 10:49:49	2022-03-24 10:49:49	Loris ROSOLEN	loris-rosolen-1	2005	1	\N	\N
1110	2022-03-24 10:49:49	2022-03-24 10:49:49	Tommaso LO BUE	tommaso-lo-bue-1	2006	1	\N	\N
1111	2022-03-24 10:49:49	2022-03-24 10:49:49	Jason VAN BEEK	jason-van-beek-1	2004	1	\N	\N
1112	2022-03-24 10:49:49	2022-03-24 10:49:49	Matisse CROES	matisse-croes	2006	1	\N	\N
1113	2022-03-24 10:49:49	2022-03-24 10:49:49	Federico FRONTERA	federico-frontera-1	1999	1	\N	\N
1114	2022-03-24 10:49:49	2022-03-24 10:49:49	Nicolo IACONI	nicolo-iaconi-1	2002	1	\N	\N
1115	2022-03-24 10:49:49	2022-03-24 10:49:49	Massimiliano MORO	massimiliano-moro	1998	1	\N	\N
1116	2022-03-24 10:49:49	2022-03-24 10:49:49	Mateusz SZURMIEJ	mateusz-szurmiej	1985	1	\N	\N
1117	2022-03-24 10:49:50	2022-03-24 10:49:50	Burak BASTURK	burak-basturk	1972	1	\N	\N
1118	2022-03-24 10:49:52	2022-03-24 10:49:52	Manuel ADAMO	manuel-adamo	\N	1	\N	\N
1119	2022-03-24 10:49:52	2022-03-24 10:49:52	Maximilian ULRICH	maximilian-ulrich	\N	1	\N	\N
1120	2022-03-24 10:49:52	2022-03-24 10:49:52	Kevin LEHR	kevin-lehr	\N	1	\N	\N
1121	2022-03-24 10:49:55	2022-03-24 10:49:55	Anouk HACKEN	anouk-hacken	2004	2	\N	\N
1122	2022-03-24 10:49:56	2022-03-24 10:49:56	Michelle VAN HILLO	michelle-van-hillo	2000	2	\N	\N
1123	2022-03-24 10:49:57	2022-03-24 10:49:57	Gabriele BADUTO	gabriele-baduto	2004	1	\N	\N
1124	2022-03-24 10:49:57	2022-03-24 10:49:57	Andrea ROSSI	andrea-rossi-1	2003	1	\N	\N
1125	2022-03-24 10:49:57	2022-03-24 10:49:57	Igor WROBEL	igor-wrobel-1	2003	1	\N	\N
1126	2022-03-24 10:49:57	2022-03-24 10:49:57	Jonas BODENBURG	jonas-bodenburg-1	2005	1	\N	\N
1127	2022-03-24 10:49:57	2022-03-24 10:49:57	Nico Joe JUNG	nico-joe-jung-1	2004	1	\N	\N
1128	2022-03-24 10:49:57	2022-03-24 10:49:57	Jan NAUMANN	jan-naumann	2003	1	\N	\N
1129	2022-03-24 10:49:58	2022-03-24 10:49:58	Vincenzo COPPOLA	vincenzo-coppola-1	2003	1	\N	\N
1130	2022-03-24 10:49:58	2022-03-24 10:49:58	Wojciech PASTERNAK	wojciech-pasternak	2005	1	\N	\N
1131	2022-03-24 10:49:58	2022-03-24 10:49:58	Rick JACOBS	rick-jacobs-1	2005	1	\N	\N
1132	2022-03-24 10:49:58	2022-03-24 10:49:58	Yves ROEMEN	yves-roemen-1	2006	1	\N	\N
1133	2022-03-24 10:49:58	2022-03-24 10:49:58	Jasper CLOET	jasper-cloet	2006	1	\N	\N
1134	2022-03-24 10:49:58	2022-03-24 10:49:58	Johann REINKE	johann-reinke-1	2006	1	\N	\N
1135	2022-03-24 10:49:58	2022-03-24 10:49:58	Max RENNEBAUM	max-rennebaum-1	2003	1	\N	\N
1136	2022-03-24 10:49:58	2022-03-24 10:49:58	Timo VAN DAM	timo-van-dam-1	2006	1	\N	\N
1137	2022-03-24 10:49:58	2022-03-24 10:49:58	Tillman THEISS	tillman-theiss-1	2005	1	\N	\N
1138	2022-03-24 10:49:58	2022-03-24 10:49:58	Ian WEEKERS	ian-weekers-1	2004	1	\N	\N
1139	2022-03-24 10:49:58	2022-03-24 10:49:58	Boaz BAKHUYZEN	boaz-bakhuyzen	2005	1	\N	\N
1140	2022-03-24 10:49:58	2022-03-24 10:49:58	Nick HARKES	nick-harkes-1	2005	1	\N	\N
1141	2022-03-24 10:49:58	2022-03-24 10:49:58	Kennet KOHN	kennet-kohn	2006	1	\N	\N
1142	2022-03-24 10:54:47	2022-03-24 10:54:47	Timo BOOMERS	timo-boomers-1	2006	1	\N	\N
1143	2022-03-24 10:54:47	2022-03-24 10:54:47	ANDREA VIVALDA	andrea-vivalda-1	2001	1	\N	\N
1144	2022-03-24 10:54:47	2022-03-24 10:54:47	Koen VAN DE BAAN	koen-van-de-baan	2000	1	\N	\N
1145	2022-03-24 10:54:47	2022-03-24 10:54:47	Jur BANGMA	jur-bangma	2001	1	\N	\N
1146	2022-03-24 10:54:47	2022-03-24 10:54:47	Javier PEREZ SANCHEZ	javier-perez-sanchez-1	2002	1	\N	\N
1147	2022-03-24 10:54:52	2022-03-24 10:54:52	Francisco Javier CATALA LLINARES	francisco-javier-catala-llinares-1	\N	1	\N	\N
1148	2022-03-24 10:54:56	2022-03-24 10:54:56	Joey VAN HOFF	joey-van-hoff	\N	1	\N	\N
1149	2022-03-24 10:55:05	2022-03-24 10:55:05	Alicja TCHORZ	alicja-tchorz-1	1992	2	\N	\N
1150	2022-03-24 10:55:08	2022-03-24 10:55:08	Vittoria OLIVIERI	vittoria-olivieri-1	2000	2	\N	\N
1151	2022-03-24 10:55:11	2022-03-24 10:55:11	Ben BROWNING	ben-browning	2003	1	\N	\N
1152	2022-03-24 10:55:11	2022-03-24 10:55:11	Francesco FERRARO	francesco-ferraro	2006	1	\N	\N
1153	2022-03-24 10:55:11	2022-03-24 10:55:11	Kacper WROBLEWSKI	kacper-wroblewski-1	2005	1	\N	\N
1154	2022-03-24 10:55:11	2022-03-24 10:55:11	Patrick WELZEL	patrick-welzel-1	2006	1	\N	\N
1155	2022-03-24 10:55:12	2022-03-24 10:55:12	Kamil KURZAK	kamil-kurzak-1	2004	1	\N	\N
1156	2022-03-24 10:55:13	2022-03-24 10:55:13	Gabriele CARADONNA	gabriele-caradonna	2003	1	\N	\N
1157	2022-03-24 10:55:13	2022-03-24 10:55:13	Gabriele CIRILLI	gabriele-cirilli	2005	1	\N	\N
1158	2022-03-24 10:55:14	2022-03-24 10:55:14	Tom BERGERON	tom-bergeron-1	2006	1	\N	\N
1159	2022-03-24 10:55:14	2022-03-24 10:55:14	Pau BELTRAN CABEDO	pau-beltran-cabedo-1	1993	1	\N	\N
1160	2022-03-24 10:55:14	2022-03-24 10:55:14	Lars-Erik WENGER	lars-erik-wenger-1	1997	1	\N	\N
1161	2022-03-24 10:55:14	2022-03-24 10:55:14	Tom BESSON GAZON	tom-besson-gazon-1	2000	1	\N	\N
1162	2022-03-24 10:55:14	2022-03-24 10:55:14	Frederick SICURO	frederick-sicuro-1	2001	1	\N	\N
1163	2022-03-24 10:55:15	2022-03-24 10:55:15	Drew MODROV	drew-modrov	1991	1	\N	\N
1164	2022-03-24 10:55:15	2022-03-24 10:55:15	Arne WULF	arne-wulf-1	2002	1	\N	\N
1165	2022-03-24 10:55:15	2022-03-24 10:55:15	Emilio MAZZA	emilio-mazza-1	1997	1	\N	\N
1166	2022-03-24 10:55:15	2022-03-24 10:55:15	Martin ROQUES	martin-roques-1	2002	1	\N	\N
1167	2022-03-24 10:55:15	2022-03-24 10:55:15	Maximilian ULRICH	maximilian-ulrich-1	1997	1	\N	\N
1168	2022-03-24 10:55:16	2022-03-24 10:55:16	Matteo PENNESI	matteo-pennesi-1	1995	1	\N	\N
1169	2022-03-24 10:55:16	2022-03-24 10:55:16	Mauro RICCI	mauro-ricci-1	2002	1	\N	\N
1170	2022-03-24 10:55:16	2022-03-24 10:55:16	Manuel ADAMO	manuel-adamo-1	2000	1	\N	\N
1171	2022-03-24 10:55:16	2022-03-24 10:55:16	Elias ROEOESLI	elias-roeoesli	2001	1	\N	\N
1172	2022-03-24 10:55:17	2022-03-24 10:55:17	Tiziano COSTANZA	tiziano-costanza-1	2001	1	\N	\N
1173	2022-03-24 10:55:17	2022-03-24 10:55:17	Andrea CRESCIMBENI	andrea-crescimbeni-1	2001	1	\N	\N
1174	2022-03-24 10:55:18	2022-03-24 10:55:18	Erik CAPORALE	erik-caporale-1	2001	1	\N	\N
1175	2022-03-24 10:55:18	2022-03-24 10:55:18	Bram VOS	bram-vos	1994	1	\N	\N
1176	2022-03-24 10:55:19	2022-03-24 10:55:19	Frank VAN DER WIJST	frank-van-der-wijst	1990	1	\N	\N
1177	2022-03-24 10:55:20	2022-03-24 10:55:20	Maria RODRIGUEZ RODRIGUEZ DE LA SIERRA	maria-rodriguez-rodriguez-de-la-sierra-1	2004	2	\N	\N
1178	2022-03-24 10:55:31	2022-03-24 10:55:31	DAVIDE VIVALDA	davide-vivalda-1	2003	1	\N	\N
1179	2022-03-24 10:55:31	2022-03-24 10:55:31	Jannis MUELLER	jannis-mueller-1	2004	1	\N	\N
1180	2022-03-24 10:55:33	2022-03-24 10:55:33	Diego GARCIA CASTRO	diego-garcia-castro-1	2005	1	\N	\N
1181	2022-03-24 10:55:35	2022-03-24 10:55:35	Szymon CZERW	szymon-czerw-1	2005	1	\N	\N
1182	2022-03-24 10:55:35	2022-03-24 10:55:35	Mathijs VANLAER	mathijs-vanlaer	2006	1	\N	\N
1183	2022-03-24 10:55:35	2022-03-24 10:55:35	Torge CHRISTEL	torge-christel-1	2003	1	\N	\N
1184	2022-03-24 10:55:35	2022-03-24 10:55:35	Wout VAN OEVELEN	wout-van-oevelen	2004	1	\N	\N
1185	2022-03-24 10:55:36	2022-03-24 10:55:36	Andrea BANARI	andrea-banari-1	2006	1	\N	\N
1186	2022-03-24 10:55:36	2022-03-24 10:55:36	Henrik DICKE	henrik-dicke-1	2003	1	\N	\N
1187	2022-03-24 10:55:36	2022-03-24 10:55:36	Johannes VERFUERTH	johannes-verfuerth-1	2005	1	\N	\N
1188	2022-03-24 10:55:38	2022-03-24 10:55:38	Luca MUELLER	luca-mueller-1	2000	1	\N	\N
1189	2022-03-24 10:55:38	2022-03-24 10:55:38	Lorenzo OMERO	lorenzo-omero-1	2002	1	\N	\N
667	2022-02-06 13:50:11	2022-03-24 13:50:27	Steve KENT	steve-kent	1988	1	\N	["NZ"]
1034	2022-03-24 10:49:43	2022-03-24 13:50:38	Mattia D'IPPOLITO	mattia-dippolito-1	2003	1	\N	["IT"]
784	2022-03-24 10:49:30	2022-03-24 13:51:15	Giulia VETRANO	giulia-vetrano	2005	2	\N	["IT"]
625	2022-02-06 13:50:11	2022-03-24 13:51:24	Silvia MESCHIARI	silvia-meschiari	1992	2	\N	["IT"]
\.


--
-- Data for Name: competition_categories; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.competition_categories (id, created_at, updated_at, name, competition_id) FROM stdin;
1	2022-02-06 13:49:48	2022-02-06 13:49:48	Junioren	9
2	2022-02-06 13:49:48	2022-02-06 13:49:48	Senioren	9
3	2022-02-06 13:49:49	2022-02-06 13:49:49	Masters 30-39	9
4	2022-02-06 13:49:49	2022-02-06 13:49:49	Masters 40-49	9
5	2022-02-06 13:49:49	2022-02-06 13:49:49	Masters 50+	9
6	2022-02-06 13:49:49	2022-02-06 13:49:49	Masters 49-49	9
7	2022-02-06 13:50:11	2022-02-06 13:50:11	Junioren	1
8	2022-02-06 13:50:11	2022-02-06 13:50:11	Senioren	1
9	2022-02-06 13:50:11	2022-02-06 13:50:11	Masters 30-39	1
10	2022-02-06 13:50:11	2022-02-06 13:50:11	Masters 50+	1
11	2022-02-06 13:50:11	2022-02-06 13:50:11	Masters 40-49	1
12	2022-03-24 10:49:30	2022-03-24 10:49:30	Junioren	11
13	2022-03-24 10:49:31	2022-03-24 10:49:31	Senioren	11
14	2022-03-24 10:49:32	2022-03-24 10:49:32	Masters 30 - 39	11
15	2022-03-24 10:49:32	2022-03-24 10:49:32	Masters 40 - 49	11
16	2022-03-24 10:49:33	2022-03-24 10:49:33	Masters 50+	11
\.


--
-- Data for Name: competition_venue; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.competition_venue (id, competition_id, venue_id) FROM stdin;
1	1	1
2	9	1
3	10	2
4	11	3
5	12	4
6	13	4
\.


--
-- Data for Name: competitions; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.competitions (id, created_at, updated_at, name, slug, start_date, end_date, timekeeping, published_at, status, comment, ils_sanctioned, file_link, videos) FROM stdin;
10	2022-03-24 08:12:12	2022-03-24 09:10:35	ILSE Dordrecht 2022	ilse-dordrecht-2022	2022-03-19	2022-03-20	0	\N	3	First and last name can not be separated reliably.	f	\N	[]
9	2022-02-06 13:41:38	2022-03-24 14:05:43	Orange Cup 2019	orange-cup-2019	2019-11-30	2019-12-01	2	\N	4	Sit occaecat ad aliq	t	\N	[{"title":"Highlights","url":"https:\\/\\/www.youtube.com\\/watch?v=xkobdu60HNE"},{"title":"Some heats by Reddingsclub Ternat Asse Lebbeke","url":"https:\\/\\/youtube.com\\/playlist?list=PLmALooChErzKd7NTiDjAt8X6Gr0tAHcxH"}]
11	2022-03-24 09:26:36	2022-03-24 14:16:28	Orange Cup 2021	orange-cup-2021	2021-11-27	2021-11-28	2	\N	4	\N	t	\N	[{"title":"Some heats by Reddingsclub Ternat Asse Lebbeke","url":"https:\\/\\/youtube.com\\/playlist?list=PLIQ-lhRO6aznD-qDuoa5oyPYt2uwyga1S"}]
1	2022-02-06 13:39:42	2022-03-25 12:51:15	Orange Cup 2018	orange-cup-2018	2018-06-23	2018-06-24	2	\N	4	\N	t	\N	[]
12	2022-05-16 18:43:55	2022-05-16 18:43:55	Campionato Italiano Primaverile Lifesaving di Categoria	campionato-italiano-primaverile-lifesaving-di-categoria	2022-04-20	2022-04-25	2	\N	2	\N	f	\N	[]
13	2022-05-16 18:45:56	2022-05-16 18:45:56	Campionato Italiano Assoluto Invernale Lifesaving	campionato-italiano-assoluto-invernale-lifesaving	2021-12-11	2021-12-12	2	\N	2	\N	f	\N	[]
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.events (id, created_at, updated_at, name, slug, type, sort_order) FROM stdin;
1	2022-02-06 13:45:42	2022-02-06 13:45:42	200m obstacle swim	200m-obstacle-swim	5	1
2	2022-02-06 13:45:42	2022-02-06 13:45:42	50m manikin carry	50m-manikin-carry	5	2
3	2022-02-06 13:45:42	2022-02-06 13:45:42	100m rescue medley	100m-rescue-medley	5	3
4	2022-02-06 13:45:42	2022-02-06 13:45:42	100m manikin carry with fins	100m-manikin-carry-with-fins	5	4
5	2022-02-06 13:45:42	2022-02-06 13:45:42	100m manikin tow with fins	100m-manikin-tow-with-fins	5	5
6	2022-02-06 13:45:42	2022-02-06 13:45:42	200m super lifesaver	200m-super-lifesaver	5	6
7	2022-02-06 13:45:42	2022-02-06 13:45:42	100m obstacle swim	100m-obstacle-swim	5	7
8	2022-02-06 13:45:42	2022-02-06 13:45:42	Surf race	surf-race	9	1
9	2022-02-06 13:45:42	2022-02-06 13:45:42	Rescue tube race	rescue-tube-race	9	2
10	2022-02-06 13:45:42	2022-02-06 13:45:42	Run-swim-run	run-swim-run	9	3
11	2022-02-06 13:45:42	2022-02-06 13:45:42	Beach flags	beach-flags	9	4
12	2022-02-06 13:45:42	2022-02-06 13:45:42	Beach sprint	beach-sprint	9	5
13	2022-02-06 13:45:42	2022-02-06 13:45:42	1km beach run	1km-beach-run	9	6
14	2022-02-06 13:45:42	2022-02-06 13:45:42	2km beach run	2km-beach-run	9	7
15	2022-02-06 13:45:42	2022-02-06 13:45:42	Surf ski race	surf-ski-race	9	8
16	2022-02-06 13:45:42	2022-02-06 13:45:42	Board race	board-race	9	9
17	2022-02-06 13:45:42	2022-02-06 13:45:42	Oceanman/oceanwoman	oceanmanoceanwoman	9	10
18	2022-02-06 13:45:42	2022-02-06 13:45:42	Ocean M	ocean-m	9	11
19	2022-02-06 13:45:42	2022-02-06 13:45:42	Oceanman/oceanwoman eliminator	oceanmanoceanwoman-eliminator	9	12
20	2022-02-06 13:45:42	2022-02-06 13:45:42	12.5m line throw	125m-line-throw	6	8
21	2022-02-06 13:45:42	2022-02-06 13:45:42	Throw	throw	7	1
22	2022-02-06 13:45:42	2022-02-06 13:45:42	Swim	swim	7	2
23	2022-02-06 13:45:42	2022-02-06 13:45:42	4×25m manikin relay	425m-manikin-relay	6	9
24	2022-02-06 13:45:42	2022-02-06 13:45:42	25m manikin carry	25m-manikin-carry	7	3
25	2022-02-06 13:45:42	2022-02-06 13:45:42	4×50m obstacle relay	450m-obstacle-relay	6	10
26	2022-02-06 13:45:42	2022-02-06 13:45:42	50m obstacle swim	50m-obstacle-swim	7	4
27	2022-02-06 13:45:42	2022-02-06 13:45:42	4×50m medley relay	450m-medley-relay	6	11
28	2022-02-06 13:45:42	2022-02-06 13:45:42	50m freestyle	50m-freestyle	7	5
29	2022-02-06 13:45:42	2022-02-06 13:45:42	50m freestyle with fins	50m-freestyle-with-fins	7	6
30	2022-02-06 13:45:42	2022-02-06 13:45:42	50m freestyle with rescue tube	50m-freestyle-with-rescue-tube	7	7
31	2022-02-06 13:45:42	2022-02-06 13:45:42	50m person tow	50m-person-tow	7	8
32	2022-02-06 13:45:42	2022-02-06 13:45:42	4×50m pool lifesaver relay	450m-pool-lifesaver-relay	6	12
33	2022-02-06 13:45:42	2022-02-06 13:45:42	50m manikin carry	50m-manikin-carry-1	7	9
34	2022-02-06 13:45:42	2022-02-06 13:45:42	50m manikin carry with fins	50m-manikin-carry-with-fins	7	10
35	2022-02-06 13:45:42	2022-02-06 13:45:42	Surf teams race	surf-teams-race	10	1
36	2022-02-06 13:45:42	2022-02-06 13:45:42	Rescue tube rescue	rescue-tube-rescue	10	2
37	2022-02-06 13:45:42	2022-02-06 13:45:42	Victim	victim	11	1
38	2022-02-06 13:45:42	2022-02-06 13:45:42	Rescue tube swimmer	rescue-tube-swimmer	11	2
39	2022-02-06 13:45:42	2022-02-06 13:45:42	Rescuer	rescuer	11	3
40	2022-02-06 13:45:42	2022-02-06 13:45:42	3×1km beach run relay	31km-beach-run-relay	10	3
41	2022-02-06 13:45:42	2022-02-06 13:45:42	1km run	1km-run	11	4
42	2022-02-06 13:45:42	2022-02-06 13:45:42	Beach relay	beach-relay	10	4
43	2022-02-06 13:45:42	2022-02-06 13:45:42	90m run	90m-run	11	5
44	2022-02-06 13:45:42	2022-02-06 13:45:42	Surf ski relay	surf-ski-relay	10	5
45	2022-02-06 13:45:42	2022-02-06 13:45:42	Board relay	board-relay	10	6
46	2022-02-06 13:45:42	2022-02-06 13:45:42	Board rescue	board-rescue	10	7
47	2022-02-06 13:45:42	2022-02-06 13:45:42	Swimmer	swimmer	11	6
48	2022-02-06 13:45:42	2022-02-06 13:45:42	Boarder	boarder	11	7
49	2022-02-06 13:45:42	2022-02-06 13:45:42	Oceanman/oceanwoman relay	oceanmanoceanwoman-relay	10	8
50	2022-02-06 13:45:42	2022-02-06 13:45:42	Swim	swim-1	11	6
51	2022-02-06 13:45:42	2022-02-06 13:45:42	Board	board	11	7
52	2022-02-06 13:45:42	2022-02-06 13:45:42	Ski	ski	11	8
53	2022-02-06 13:45:42	2022-02-06 13:45:42	Run	run	11	9
54	2022-02-06 13:45:42	2022-02-06 13:45:42	Ocean M lifesaver relay	ocean-m-lifesaver-relay	10	9
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
1	612cc8e1-4103-406b-b000-1fda7d6cc0e2	redis	default	{"uuid":"612cc8e1-4103-406b-b000-1fda7d6cc0e2","timeout":null,"id":"G9MoRYq4qGjAQWEGyKo6r8Vzvq5sulDY","backoff":null,"displayName":"App\\\\Jobs\\\\ImportCompetitionFile","maxTries":null,"failOnTimeout":false,"maxExceptions":null,"retryUntil":null,"job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","data":{"command":"O:30:\\"App\\\\Jobs\\\\ImportCompetitionFile\\":2:{s:18:\\"\\u0000*\\u0000competitionFile\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":4:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Media\\";s:2:\\"id\\";i:12;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"pgsql\\";}s:11:\\"\\u0000*\\u0000statusId\\";i:1;}","commandName":"App\\\\Jobs\\\\ImportCompetitionFile"},"attempts":2}	Illuminate\\Queue\\MaxAttemptsExceededException: App\\Jobs\\ImportCompetitionFile has been attempted too many times or run too long. The job may have previously timed out. in /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php:750\nStack trace:\n#0 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(213): Illuminate\\Queue\\Worker->maxAttemptsExceededException()\n#1 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Query/Grammars/Grammar.php(96): Illuminate\\Queue\\Worker->Illuminate\\Queue\\{closure}()\n#2 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Query/Grammars/Grammar.php(72): Illuminate\\Database\\Query\\Grammars\\Grammar->compileComponents()\n#3 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Query/Grammars/Grammar.php(946): Illuminate\\Database\\Query\\Grammars\\Grammar->compileSelect()\n#4 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Query/Builder.php(2878): Illuminate\\Database\\Query\\Grammars\\Grammar->compileExists()\n#5 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Builder.php(1707): Illuminate\\Database\\Query\\Builder->exists()\n#6 /home/ploi/new.lifesavingrankings.com/vendor/spatie/laravel-sluggable/src/HasSlug.php(149): Illuminate\\Database\\Eloquent\\Builder->__call()\n#7 /home/ploi/new.lifesavingrankings.com/vendor/spatie/laravel-sluggable/src/HasSlug.php(125): App\\Models\\Team->otherRecordExistsWithSlug()\n#8 /home/ploi/new.lifesavingrankings.com/vendor/spatie/laravel-sluggable/src/HasSlug.php(74): App\\Models\\Team->makeSlugUnique()\n#9 /home/ploi/new.lifesavingrankings.com/vendor/spatie/laravel-sluggable/src/HasSlug.php(40): App\\Models\\Team->addSlug()\n#10 /home/ploi/new.lifesavingrankings.com/vendor/spatie/laravel-sluggable/src/HasSlug.php(18): App\\Models\\Team->generateSlugOnCreate()\n#11 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(421): App\\Models\\Team::Spatie\\Sluggable\\{closure}()\n#12 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(249): Illuminate\\Events\\Dispatcher->Illuminate\\Events\\{closure}()\n#13 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(222): Illuminate\\Events\\Dispatcher->dispatch()\n#14 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Concerns/HasEvents.php(189): Illuminate\\Events\\Dispatcher->until()\n#15 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(1138): Illuminate\\Database\\Eloquent\\Model->fireModelEvent()\n#16 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Database/Eloquent/Model.php(996): Illuminate\\Database\\Eloquent\\Model->performInsert()\n#17 /home/ploi/new.lifesavingrankings.com/app/Actions/SaveResultValueObject.php(34): Illuminate\\Database\\Eloquent\\Model->save()\n#18 /home/ploi/new.lifesavingrankings.com/app/Jobs/ImportCompetitionFile.php(43): App\\Actions\\SaveResultValueObject->handle()\n#19 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\ImportCompetitionFile->handle()\n#20 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#22 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#23 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#24 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#25 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#26 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#27 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#28 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(119): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#29 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(141): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#30 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(116): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#31 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then()\n#32 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#33 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#34 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(428): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(378): Illuminate\\Queue\\Worker->process()\n#36 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(172): Illuminate\\Queue\\Worker->runJob()\n#37 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(126): Illuminate\\Queue\\Worker->daemon()\n#38 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(110): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#39 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#42 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#43 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Container/Container.php(653): Illuminate\\Container\\BoundMethod::call()\n#44 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#45 /home/ploi/new.lifesavingrankings.com/vendor/symfony/console/Command/Command.php(291): Illuminate\\Console\\Command->execute()\n#46 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#47 /home/ploi/new.lifesavingrankings.com/vendor/symfony/console/Application.php(989): Illuminate\\Console\\Command->run()\n#48 /home/ploi/new.lifesavingrankings.com/vendor/symfony/console/Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand()\n#49 /home/ploi/new.lifesavingrankings.com/vendor/symfony/console/Application.php(171): Symfony\\Component\\Console\\Application->doRun()\n#50 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Console/Application.php(102): Symfony\\Component\\Console\\Application->run()\n#51 /home/ploi/new.lifesavingrankings.com/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#52 /home/ploi/new.lifesavingrankings.com/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#53 {main}	2022-03-24 10:53:06
\.


--
-- Data for Name: job_statuses; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.job_statuses (id, job_id, type, queue, attempts, progress_now, progress_max, status, input, output, created_at, updated_at, started_at, finished_at) FROM stdin;
3	ktbWS7mX84dn5alUD2zelaboRAwFUHY9	App\\Jobs\\ImportCompetitionFile	default	1	1370	1370	finished	\N	\N	2022-03-24 10:53:26	2022-03-24 10:55:40	2022-03-24 10:53:32	2022-03-24 10:55:40
4	4nXrvQ40QWZNknwrWFxza6eUkp9X3kPN	App\\Jobs\\ImportCompetitionFile	default	1	1370	1370	finished	\N	\N	2022-03-25 17:43:58	2022-03-25 17:44:41	2022-03-25 17:43:59	2022-03-25 17:44:41
1	G9MoRYq4qGjAQWEGyKo6r8Vzvq5sulDY	App\\Jobs\\ImportCompetitionFile	default	3	376	1370	failed	\N	\N	2022-03-24 10:49:25	2022-03-24 10:53:06	2022-03-24 10:52:36	2022-03-24 10:53:06
2	DVorggD0faWTPDrxtRSE9SstYIC4sKU8	App\\Jobs\\ImportCompetitionFile	default	2	1370	1370	finished	\N	\N	2022-03-24 10:51:47	2022-03-24 10:56:39	2022-03-24 10:55:40	2022-03-24 10:56:39
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.media (id, model_type, model_id, uuid, collection_name, name, file_name, mime_type, disk, conversions_disk, size, manipulations, custom_properties, generated_conversions, responsive_images, order_column, created_at, updated_at) FROM stdin;
2	App\\Models\\Competition	1	01eeaca9-eed1-4d00-9add-da0694ab2999	files	media-libraryyQExEP	2018-orangecup.pdf	application/pdf	public	public	889558	[]	[]	[]	[]	2	2022-02-06 13:42:11	2022-02-06 13:42:11
8	App\\Models\\Competition	9	7b4c2b63-a512-4345-81ac-60a3bfc90acf	files		2019-orange-cup.pdf	application/pdf	s3	s3	995040	[]	[]	[]	[]	1	2022-03-23 16:51:28	2022-03-23 16:51:28
9	App\\Models\\Competition	10	11637f95-c546-4812-b0f1-016b3049f87e	files	2022-ilse-dordrecht	2022-ilse-dordrecht.pdf	application/pdf	s3	s3	210743	[]	[]	[]	[]	2	2022-03-24 08:12:12	2022-03-24 08:12:12
12	App\\Models\\Competition	11	d86b6094-3906-4271-b72c-ceb4229cee24	files		2021-orange-cup.pdf	application/pdf	s3	s3	944386	[]	[]	[]	[]	1	2022-03-24 10:42:39	2022-03-24 10:42:39
13	App\\Models\\Competition	12	ff582131-d364-4a1e-88dd-03fbb490ee46	files		SA_2022_04_20-25_Milano.csv	text/csv	s3	s3	372185	[]	[]	[]	[]	1	2022-05-16 18:44:37	2022-05-16 18:44:37
14	App\\Models\\Competition	13	74f00e8d-1aa3-4e2d-b830-7e4c87963809	files		SA_2021_12_11-12_Milano.csv	text/csv	s3	s3	103744	[]	[]	[]	[]	1	2022-05-16 18:45:56	2022-05-16 18:45:56
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2021_08_13_153553_create_venues_table	1
5	2021_08_13_153602_create_competitions_table	1
6	2021_08_13_160817_create_competition_venue_table	1
7	2021_08_20_100000_create_media_table	1
8	2021_08_20_100026_create_events_table	1
9	2021_08_20_114052_create_relay_segments_table	1
10	2021_08_20_144438_create_teams_table	1
11	2021_08_20_151304_create_athletes_table	1
12	2021_08_20_162541_create_results_table	1
13	2021_09_02_185940_create_splits_table	1
14	2022_01_05_194210_create_permission_tables	1
15	2022_01_09_170151_create_parser_configs_table	1
16	2022_01_11_205549_create_competition_categories_table	1
17	2022_01_15_095224_add_file_link_to_competition	1
18	2022_01_15_125649_country_to_country_code	1
19	2022_01_16_091747_competitions_add_videos	1
20	2022_01_26_200231_results_add_splits_as_array	1
21	2022_01_28_131412_create_jobs_table	1
22	2022_01_28_155947_athlete_rename_nationalities	1
23	2022_01_28_172053_create_relay_teams_table	1
24	2022_01_31_204740_add_segment_of_to_results_table	1
25	2022_02_04_145519_create_sponsors_table	1
26	2017_05_01_000000_create_job_statuses_table	2
27	2022_03_22_150229_add_job_status_to_parser_configs	3
28	2022_05_26_063100_create_athlete_id_types_table	4
29	2022_05_26_063121_create_athlete_ids_table	4
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
2	App\\Models\\User	1
3	App\\Models\\User	1
1	App\\Models\\User	1
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: parser_configs; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.parser_configs (id, created_at, updated_at, options, media_id, job_status_id) FROM stdin;
8	2022-03-24 10:42:44	2022-03-25 17:43:58	{"200m_obstacle_swim":{"value":"\\/200m Obstacle Swim\\/","occurs_on_next_line":false},"50m_manikin_carry":{"value":"\\/50m Manikin Carry\\/","occurs_on_next_line":false},"100m_rescue_medley":{"value":"\\/100m Rescue Medley\\/","occurs_on_next_line":false},"100m_manikin_carry_with_fins":{"value":"\\/100m Manikin Carry with Fins\\/","occurs_on_next_line":false},"100m_manikin_tow_with_fins":{"value":"\\/100m Manikin Tow with Fins\\/","occurs_on_next_line":false},"200m_super_lifesaver":{"value":"\\/200m Super Lifesaver\\/","occurs_on_next_line":false},"100m_obstacle_swim":{"value":"","occurs_on_next_line":false},"125m_line_throw":{"value":"\\/Line Throw\\/","occurs_on_next_line":false},"425m_manikin_relay":{"value":"\\/4 x 25m Manikin Relay\\/","occurs_on_next_line":false},"450m_obstacle_relay":{"value":"\\/4 x 50m Obstacle Relay\\/","occurs_on_next_line":false},"450m_medley_relay":{"value":"\\/4 x 50m Medley Relay\\/","occurs_on_next_line":false},"450m_pool_lifesaver_relay":{"value":"\\/4 x 50m Pool Lifesaving Relay\\/","occurs_on_next_line":false},"throw":{"value":"","occurs_on_next_line":false},"swim":{"value":"","occurs_on_next_line":false},"25m_manikin_carry":{"value":"","occurs_on_next_line":false},"50m_obstacle_swim":{"value":"","occurs_on_next_line":false},"50m_freestyle":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_fins":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_rescue_tube":{"value":"","occurs_on_next_line":false},"50m_person_tow":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_1":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_with_fins":{"value":"","occurs_on_next_line":false},"surf_race":{"value":"","occurs_on_next_line":false},"rescue_tube_race":{"value":"","occurs_on_next_line":false},"run_swim_run":{"value":"","occurs_on_next_line":false},"beach_flags":{"value":"","occurs_on_next_line":false},"beach_sprint":{"value":"","occurs_on_next_line":false},"1km_beach_run":{"value":"","occurs_on_next_line":false},"2km_beach_run":{"value":"","occurs_on_next_line":false},"surf_ski_race":{"value":"","occurs_on_next_line":false},"board_race":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman":{"value":"","occurs_on_next_line":false},"ocean_m":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_eliminator":{"value":"","occurs_on_next_line":false},"surf_teams_race":{"value":"","occurs_on_next_line":false},"rescue_tube_rescue":{"value":"","occurs_on_next_line":false},"31km_beach_run_relay":{"value":"","occurs_on_next_line":false},"beach_relay":{"value":"","occurs_on_next_line":false},"surf_ski_relay":{"value":"","occurs_on_next_line":false},"board_relay":{"value":"","occurs_on_next_line":false},"board_rescue":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_relay":{"value":"","occurs_on_next_line":false},"ocean_m_lifesaver_relay":{"value":"","occurs_on_next_line":false},"victim":{"value":"","occurs_on_next_line":false},"rescue_tube_swimmer":{"value":"","occurs_on_next_line":false},"rescuer":{"value":"","occurs_on_next_line":false},"1km_run":{"value":"","occurs_on_next_line":false},"90m_run":{"value":"","occurs_on_next_line":false},"swimmer":{"value":"","occurs_on_next_line":false},"swim_1":{"value":"","occurs_on_next_line":false},"board":{"value":"","occurs_on_next_line":false},"boarder":{"value":"","occurs_on_next_line":false},"ski":{"value":"","occurs_on_next_line":false},"run":{"value":"","occurs_on_next_line":false},"event_indicator":{"value":"\\/Event\\/","occurs_on_next_line":false},"event_rejector":{"value":"","occurs_on_next_line":false},"category_matcher":{"value":"\\/^(Junioren|Senioren|Masters).*\\/","occurs_on_next_line":false},"men_matcher":{"value":"\\/Men\\/","occurs_on_next_line":false},"women_matcher":{"value":"\\/Women\\/","occurs_on_next_line":false},"result_indicator":{"value":"\\/(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2}$\\/","occurs_on_next_line":false},"time_matcher":{"value":"\\/(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2}$\\/","occurs_on_next_line":false},"splits_matcher":{"value":"","occurs_on_next_line":false},"dsq_matcher":{"value":"\\/^DSQ\\/","occurs_on_next_line":false},"dnf_matcher":{"value":"\\/^(OTL|DNF)\\/","occurs_on_next_line":false},"dns_matcher":{"value":"\\/^DNS\\/","occurs_on_next_line":false},"wdr_matcher":{"value":"\\/^(sick|WDR)\\/","occurs_on_next_line":false},"relay_team_matcher":{"value":"\\/(?<=\\\\t)[^\\\\t]+\\/","occurs_on_next_line":false},"team_mate_matcher":{"value":"\\/.+\\/","occurs_on_next_line":true},"athlete_matcher":{"value":"\\/[^\\\\t\\\\d]+(?=\\\\t\\\\d{2})\\/","occurs_on_next_line":false},"year_of_birth_matcher":{"value":"\\/(?<=\\\\t)\\\\d{2}(?=\\\\t)\\/","occurs_on_next_line":false},"team_matcher":{"value":"\\/((?<=\\\\d{2}\\\\t)[^\\\\t]+)|((?<=\\\\t)[^\\\\t\\\\.]{3,}$)|(?<=\\\\t)[^\\\\t]{3,}(?=\\\\t(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2})|(?<=\\\\t)[^\\\\t]{3,}(?=\\\\t\\\\d{2}$)\\/","occurs_on_next_line":false},"text_remover":{"value":"","occurs_on_next_line":false},"horizontal_offset":{"value":"\\\\t","occurs_on_next_line":false}}	12	4
6	2022-03-24 10:23:51	2022-03-24 10:23:51	\N	8	\N
3	2022-03-24 08:16:25	2022-03-24 09:09:38	{"200m_obstacle_swim":{"value":"","occurs_on_next_line":false},"50m_manikin_carry":{"value":"","occurs_on_next_line":false},"100m_rescue_medley":{"value":"","occurs_on_next_line":false},"100m_manikin_carry_with_fins":{"value":"","occurs_on_next_line":false},"100m_manikin_tow_with_fins":{"value":"","occurs_on_next_line":false},"200m_super_lifesaver":{"value":"","occurs_on_next_line":false},"100m_obstacle_swim":{"value":"","occurs_on_next_line":false},"125m_line_throw":{"value":"","occurs_on_next_line":false},"425m_manikin_relay":{"value":"","occurs_on_next_line":false},"450m_obstacle_relay":{"value":"","occurs_on_next_line":false},"450m_medley_relay":{"value":"","occurs_on_next_line":false},"450m_pool_lifesaver_relay":{"value":"","occurs_on_next_line":false},"throw":{"value":"","occurs_on_next_line":false},"swim":{"value":"","occurs_on_next_line":false},"25m_manikin_carry":{"value":"","occurs_on_next_line":false},"50m_obstacle_swim":{"value":"","occurs_on_next_line":false},"50m_freestyle":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_fins":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_rescue_tube":{"value":"","occurs_on_next_line":false},"50m_person_tow":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_1":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_with_fins":{"value":"","occurs_on_next_line":false},"surf_race":{"value":"","occurs_on_next_line":false},"rescue_tube_race":{"value":"","occurs_on_next_line":false},"run_swim_run":{"value":"","occurs_on_next_line":false},"beach_flags":{"value":"","occurs_on_next_line":false},"beach_sprint":{"value":"","occurs_on_next_line":false},"1km_beach_run":{"value":"","occurs_on_next_line":false},"2km_beach_run":{"value":"","occurs_on_next_line":false},"surf_ski_race":{"value":"","occurs_on_next_line":false},"board_race":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman":{"value":"","occurs_on_next_line":false},"ocean_m":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_eliminator":{"value":"","occurs_on_next_line":false},"surf_teams_race":{"value":"","occurs_on_next_line":false},"rescue_tube_rescue":{"value":"","occurs_on_next_line":false},"31km_beach_run_relay":{"value":"","occurs_on_next_line":false},"beach_relay":{"value":"","occurs_on_next_line":false},"surf_ski_relay":{"value":"","occurs_on_next_line":false},"board_relay":{"value":"","occurs_on_next_line":false},"board_rescue":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_relay":{"value":"","occurs_on_next_line":false},"ocean_m_lifesaver_relay":{"value":"","occurs_on_next_line":false},"victim":{"value":"","occurs_on_next_line":false},"rescue_tube_swimmer":{"value":"","occurs_on_next_line":false},"rescuer":{"value":"","occurs_on_next_line":false},"1km_run":{"value":"","occurs_on_next_line":false},"90m_run":{"value":"","occurs_on_next_line":false},"swimmer":{"value":"","occurs_on_next_line":false},"swim_1":{"value":"","occurs_on_next_line":false},"board":{"value":"","occurs_on_next_line":false},"boarder":{"value":"","occurs_on_next_line":false},"ski":{"value":"","occurs_on_next_line":false},"run":{"value":"","occurs_on_next_line":false},"event_indicator":{"value":"\\/Event\\/","occurs_on_next_line":false},"event_rejector":{"value":"","occurs_on_next_line":false},"category_matcher":{"value":"","occurs_on_next_line":false},"men_matcher":{"value":"","occurs_on_next_line":false},"women_matcher":{"value":"","occurs_on_next_line":false},"result_indicator":{"value":"","occurs_on_next_line":false},"time_matcher":{"value":"","occurs_on_next_line":false},"splits_matcher":{"value":"","occurs_on_next_line":false},"dsq_matcher":{"value":"","occurs_on_next_line":false},"dnf_matcher":{"value":"","occurs_on_next_line":false},"dns_matcher":{"value":"","occurs_on_next_line":false},"wdr_matcher":{"value":"","occurs_on_next_line":false},"relay_team_matcher":{"value":"","occurs_on_next_line":false},"team_mate_matcher":{"value":"","occurs_on_next_line":false},"athlete_matcher":{"value":"","occurs_on_next_line":false},"year_of_birth_matcher":{"value":"","occurs_on_next_line":false},"team_matcher":{"value":"","occurs_on_next_line":false},"text_remover":{"value":"","occurs_on_next_line":false},"horizontal_offset":{"value":"\\\\t","occurs_on_next_line":false}}	9	\N
2	2022-01-29 12:07:38	2022-02-19 13:27:35	{"200m_obstacle_swim":{"value":"\\/200m Obstacle Swim\\/","occurs_on_next_line":false},"50m_manikin_carry":{"value":"\\/50m Manikin Carry\\/","occurs_on_next_line":false},"100m_rescue_medley":{"value":"\\/100m Rescue Medley\\/","occurs_on_next_line":false},"100m_manikin_carry_with_fins":{"value":"\\/100m Manikin Carry with Fins\\/","occurs_on_next_line":false},"100m_manikin_tow_with_fins":{"value":"\\/100m Manikin Tow with Fins\\/","occurs_on_next_line":false},"200m_super_lifesaver":{"value":"\\/200m Super Lifesaver\\/","occurs_on_next_line":false},"100m_obstacle_swim":{"value":"","occurs_on_next_line":false},"125m_line_throw":{"value":"\\/Line Throw\\/","occurs_on_next_line":false},"425m_manikin_relay":{"value":"\\/4 x 25m Manikin Relay\\/","occurs_on_next_line":false},"450m_obstacle_relay":{"value":"\\/4 x 50m Obstacle Relay\\/","occurs_on_next_line":false},"450m_medley_relay":{"value":"\\/4 x 50m Medley Relay\\/","occurs_on_next_line":false},"450m_pool_lifesaver_relay":{"value":"\\/4 x 50m Lifesaving Relay\\/","occurs_on_next_line":false},"throw":{"value":"","occurs_on_next_line":false},"swim":{"value":"","occurs_on_next_line":false},"25m_manikin_carry":{"value":"","occurs_on_next_line":false},"50m_obstacle_swim":{"value":"","occurs_on_next_line":false},"50m_freestyle":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_fins":{"value":"","occurs_on_next_line":false},"50m_freestyle_with_rescue_tube":{"value":"","occurs_on_next_line":false},"50m_person_tow":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_1":{"value":"","occurs_on_next_line":false},"50m_manikin_carry_with_fins":{"value":"","occurs_on_next_line":false},"surf_race":{"value":"","occurs_on_next_line":false},"rescue_tube_race":{"value":"","occurs_on_next_line":false},"run_swim_run":{"value":"","occurs_on_next_line":false},"beach_flags":{"value":"","occurs_on_next_line":false},"beach_sprint":{"value":"","occurs_on_next_line":false},"1km_beach_run":{"value":"","occurs_on_next_line":false},"2km_beach_run":{"value":"","occurs_on_next_line":false},"surf_ski_race":{"value":"","occurs_on_next_line":false},"board_race":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman":{"value":"","occurs_on_next_line":false},"ocean_m":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_eliminator":{"value":"","occurs_on_next_line":false},"surf_teams_race":{"value":"","occurs_on_next_line":false},"rescue_tube_rescue":{"value":"","occurs_on_next_line":false},"31km_beach_run_relay":{"value":"","occurs_on_next_line":false},"beach_relay":{"value":"","occurs_on_next_line":false},"surf_ski_relay":{"value":"","occurs_on_next_line":false},"board_relay":{"value":"","occurs_on_next_line":false},"board_rescue":{"value":"","occurs_on_next_line":false},"oceanmanoceanwoman_relay":{"value":"","occurs_on_next_line":false},"ocean_m_lifesaver_relay":{"value":"","occurs_on_next_line":false},"victim":{"value":"","occurs_on_next_line":false},"rescue_tube_swimmer":{"value":"","occurs_on_next_line":false},"rescuer":{"value":"","occurs_on_next_line":false},"1km_run":{"value":"","occurs_on_next_line":false},"90m_run":{"value":"","occurs_on_next_line":false},"swimmer":{"value":"","occurs_on_next_line":false},"swim_1":{"value":"","occurs_on_next_line":false},"board":{"value":"","occurs_on_next_line":false},"boarder":{"value":"","occurs_on_next_line":false},"ski":{"value":"","occurs_on_next_line":false},"run":{"value":"","occurs_on_next_line":false},"event_indicator":{"value":"\\/Event\\/","occurs_on_next_line":false},"event_rejector":{"value":"","occurs_on_next_line":false},"category_matcher":{"value":"\\/^(Junioren|Senioren|Masters).*\\/","occurs_on_next_line":false},"men_matcher":{"value":"\\/Men\\/","occurs_on_next_line":false},"women_matcher":{"value":"\\/Women\\/","occurs_on_next_line":false},"result_indicator":{"value":"\\/(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2}$\\/","occurs_on_next_line":false},"time_matcher":{"value":"\\/(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2}$\\/","occurs_on_next_line":false},"splits_matcher":{"value":"","occurs_on_next_line":false},"dsq_matcher":{"value":"\\/^DSQ\\/","occurs_on_next_line":false},"dnf_matcher":{"value":"\\/^(OTL|DNF)\\/","occurs_on_next_line":false},"dns_matcher":{"value":"","occurs_on_next_line":false},"wdr_matcher":{"value":"\\/^sick\\/","occurs_on_next_line":false},"relay_team_matcher":{"value":"\\/(?<=\\\\t)[^\\\\t]+\\/","occurs_on_next_line":false},"team_mate_matcher":{"value":"","occurs_on_next_line":false},"athlete_matcher":{"value":"\\/[^\\\\t\\\\d]+(?=\\\\t\\\\d{2})\\/","occurs_on_next_line":false},"year_of_birth_matcher":{"value":"\\/(?<=\\\\t)\\\\d{2}(?=\\\\t)\\/","occurs_on_next_line":false},"team_matcher":{"value":"\\/((?<=\\\\d{2}\\\\t)[^\\\\t]+)|((?<=\\\\t)[^\\\\t\\\\.]{3,}$)|(?<=\\\\t)[^\\\\t]{3,}(?=\\\\t(\\\\d{1,2}:)?\\\\d{1,2}\\\\.\\\\d{2})|(?<=\\\\t)[^\\\\t]{3,}(?=\\\\t\\\\d{2}$)\\/","occurs_on_next_line":false},"text_remover":{"value":"","occurs_on_next_line":false},"horizontal_offset":{"value":"\\\\t","occurs_on_next_line":false}}	2	\N
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.password_resets (email, token, created_at) FROM stdin;
ruben@lifesavingrankings.com	$2y$10$yTKQ8tIhfS1YPSiXhPrY6.tW.bppMmERabUf2MZ9nFpQzfx.IlK3e	2022-11-13 13:21:13
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	parse competitions	web	2022-02-06 13:45:42	2022-02-06 13:45:42
2	edit competitions	web	2022-02-06 13:45:42	2022-02-06 13:45:42
3	edit athletes	web	2022-02-06 13:45:42	2022-02-06 13:45:42
\.


--
-- Data for Name: relay_segments; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.relay_segments (id, created_at, updated_at, event_id, segment_id, "order") FROM stdin;
1	2022-02-06 13:45:42	2022-02-06 13:45:42	20	21	1
2	2022-02-06 13:45:42	2022-02-06 13:45:42	20	22	2
3	2022-02-06 13:45:42	2022-02-06 13:45:42	23	24	1
4	2022-02-06 13:45:42	2022-02-06 13:45:42	23	24	2
5	2022-02-06 13:45:42	2022-02-06 13:45:42	23	24	3
6	2022-02-06 13:45:42	2022-02-06 13:45:42	23	24	4
7	2022-02-06 13:45:42	2022-02-06 13:45:42	25	26	1
8	2022-02-06 13:45:42	2022-02-06 13:45:42	25	26	2
9	2022-02-06 13:45:42	2022-02-06 13:45:42	25	26	3
10	2022-02-06 13:45:42	2022-02-06 13:45:42	25	26	4
11	2022-02-06 13:45:42	2022-02-06 13:45:42	27	28	1
12	2022-02-06 13:45:42	2022-02-06 13:45:42	27	29	2
13	2022-02-06 13:45:42	2022-02-06 13:45:42	27	30	3
14	2022-02-06 13:45:42	2022-02-06 13:45:42	27	31	4
15	2022-02-06 13:45:42	2022-02-06 13:45:42	32	28	1
16	2022-02-06 13:45:42	2022-02-06 13:45:42	32	29	2
17	2022-02-06 13:45:42	2022-02-06 13:45:42	32	33	3
18	2022-02-06 13:45:42	2022-02-06 13:45:42	32	34	4
19	2022-02-06 13:45:42	2022-02-06 13:45:42	36	37	1
20	2022-02-06 13:45:42	2022-02-06 13:45:42	36	38	2
21	2022-02-06 13:45:42	2022-02-06 13:45:42	36	39	3
22	2022-02-06 13:45:42	2022-02-06 13:45:42	40	41	1
23	2022-02-06 13:45:42	2022-02-06 13:45:42	40	41	2
24	2022-02-06 13:45:42	2022-02-06 13:45:42	40	41	3
25	2022-02-06 13:45:42	2022-02-06 13:45:42	42	43	1
26	2022-02-06 13:45:42	2022-02-06 13:45:42	42	43	2
27	2022-02-06 13:45:42	2022-02-06 13:45:42	42	43	3
28	2022-02-06 13:45:42	2022-02-06 13:45:42	42	43	4
29	2022-02-06 13:45:42	2022-02-06 13:45:42	46	47	1
30	2022-02-06 13:45:42	2022-02-06 13:45:42	46	48	2
31	2022-02-06 13:45:42	2022-02-06 13:45:42	49	50	1
32	2022-02-06 13:45:42	2022-02-06 13:45:42	49	51	2
33	2022-02-06 13:45:42	2022-02-06 13:45:42	49	52	3
34	2022-02-06 13:45:42	2022-02-06 13:45:42	49	53	4
35	2022-02-06 13:45:42	2022-02-06 13:45:42	54	50	1
36	2022-02-06 13:45:42	2022-02-06 13:45:42	54	51	2
37	2022-02-06 13:45:42	2022-02-06 13:45:42	54	52	3
38	2022-02-06 13:45:42	2022-02-06 13:45:42	54	53	4
\.


--
-- Data for Name: relay_teams; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.relay_teams (id, created_at, updated_at, name, gender, country_code, competition_id) FROM stdin;
1	2022-02-06 13:49:49	2022-02-06 13:49:49	Australia 1	2	\N	9
2	2022-02-06 13:49:49	2022-02-06 13:49:49	NewZlnd 1	2	\N	9
3	2022-02-06 13:49:49	2022-02-06 13:49:49	China LST	2	\N	9
4	2022-02-06 13:49:49	2022-02-06 13:49:49	Italy	2	\N	9
5	2022-02-06 13:49:49	2022-02-06 13:49:49	Spain	2	\N	9
6	2022-02-06 13:49:49	2022-02-06 13:49:49	Spain Y	2	\N	9
7	2022-02-06 13:49:49	2022-02-06 13:49:49	HongKong 1	2	\N	9
8	2022-02-06 13:49:49	2022-02-06 13:49:49	Czech Republic 1	2	\N	9
9	2022-02-06 13:49:49	2022-02-06 13:49:49	NojaPlaya 1	2	\N	9
10	2022-02-06 13:49:49	2022-02-06 13:49:49	ACC di Salvamento	2	\N	9
11	2022-02-06 13:49:49	2022-02-06 13:49:49	Chech Republic Y	2	\N	9
12	2022-02-06 13:49:49	2022-02-06 13:49:49	RB Dordrecht 1	2	\N	9
13	2022-02-06 13:49:49	2022-02-06 13:49:49	Athena	2	\N	9
14	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Harsewinkel 1	2	\N	9
15	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Sachsen 1	2	\N	9
16	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Dordrecht 2	2	\N	9
17	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Nordrhein 1	2	\N	9
18	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Niedersachsen 1	2	\N	9
19	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG ALpen 1	2	\N	9
20	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Gouda 1	2	\N	9
21	2022-02-06 13:49:50	2022-02-06 13:49:50	Blyth Y	2	\N	9
22	2022-02-06 13:49:50	2022-02-06 13:49:50	Blyth	2	\N	9
23	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Bad Wünnenberg J	2	\N	9
24	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Heytse 2	2	\N	9
25	2022-02-06 13:49:50	2022-02-06 13:49:50	Celle 1	2	\N	9
26	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Gelsenkirchen-Buer 1	2	\N	9
27	2022-02-06 13:49:50	2022-02-06 13:49:50	SLRG Olten 1	2	\N	9
28	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Heytse 1	2	\N	9
29	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Dordrecht Y	2	\N	9
30	2022-02-06 13:49:50	2022-02-06 13:49:50	Austria 1	2	\N	9
31	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Rheurdt-Schaephuysen 1	2	\N	9
32	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Echt 1	2	\N	9
33	2022-02-06 13:49:50	2022-02-06 13:49:50	Kusel CHiXXX	2	\N	9
34	2022-02-06 13:49:50	2022-02-06 13:49:50	Gütersloh 1	2	\N	9
35	2022-02-06 13:49:50	2022-02-06 13:49:50	Duisburg-Homberg	2	\N	9
36	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Echt Junioren	2	\N	9
37	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Delft 1	2	\N	9
38	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Staphorst 1	2	\N	9
39	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Gouda J	2	\N	9
40	2022-02-06 13:49:50	2022-02-06 13:49:50	DLRG Ludwigshafen 2	2	\N	9
41	2022-02-06 13:49:50	2022-02-06 13:49:50	Australia 1	1	\N	9
42	2022-02-06 13:49:50	2022-02-06 13:49:50	Italy	1	\N	9
43	2022-02-06 13:49:50	2022-02-06 13:49:50	NewZlnd 1	1	\N	9
44	2022-02-06 13:49:50	2022-02-06 13:49:50	Spain	1	\N	9
45	2022-02-06 13:49:50	2022-02-06 13:49:50	RB Dordrecht 1	1	\N	9
46	2022-02-06 13:49:50	2022-02-06 13:49:50	Spain Y	1	\N	9
47	2022-02-06 13:49:50	2022-02-06 13:49:50	ASD Rosetana	1	\N	9
48	2022-02-06 13:49:50	2022-02-06 13:49:50	HongKong 1	1	\N	9
49	2022-02-06 13:49:50	2022-02-06 13:49:50	Defensie	1	\N	9
50	2022-02-06 13:49:51	2022-02-06 13:49:51	Athena 2	1	\N	9
51	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Echt 1	1	\N	9
52	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Nordrhein 2	1	\N	9
53	2022-02-06 13:49:51	2022-02-06 13:49:51	Gütersloh 1	1	\N	9
54	2022-02-06 13:49:51	2022-02-06 13:49:51	Athena 1	1	\N	9
55	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Gouda 1	1	\N	9
56	2022-02-06 13:49:51	2022-02-06 13:49:51	Langenberg 1	1	\N	9
57	2022-02-06 13:49:51	2022-02-06 13:49:51	ACC di Salvamento	1	\N	9
58	2022-02-06 13:49:51	2022-02-06 13:49:51	Czech Republic 1	1	\N	9
59	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Echt Junioren	1	\N	9
60	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Dordrecht 2	1	\N	9
61	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG NiederOlm 1	1	\N	9
62	2022-02-06 13:49:51	2022-02-06 13:49:51	Austria 1	1	\N	9
63	2022-02-06 13:49:51	2022-02-06 13:49:51	Langenberg 2	1	\N	9
64	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Berlin 1	1	\N	9
65	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Buchholz 1	1	\N	9
66	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Berlin Y	1	\N	9
67	2022-02-06 13:49:51	2022-02-06 13:49:51	Duisburg-Homberg Men	1	\N	9
68	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Echt 2	1	\N	9
69	2022-02-06 13:49:51	2022-02-06 13:49:51	Celle 1	1	\N	9
70	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG ALpen 1	1	\N	9
71	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Stadlohn 1	1	\N	9
72	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Amersfoort 1	1	\N	9
73	2022-02-06 13:49:51	2022-02-06 13:49:51	Kusel DIXXX	1	\N	9
74	2022-02-06 13:49:51	2022-02-06 13:49:51	Blyth Y	1	\N	9
75	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Staphorst 1	1	\N	9
76	2022-02-06 13:49:51	2022-02-06 13:49:51	RB Weert 1	1	\N	9
77	2022-02-06 13:49:51	2022-02-06 13:49:51	Blyth	1	\N	9
78	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Niedersachsen 1	1	\N	9
79	2022-02-06 13:49:51	2022-02-06 13:49:51	Romenike 1	2	\N	9
80	2022-02-06 13:49:52	2022-02-06 13:49:52	Defensie	2	\N	9
81	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Oss 1	2	\N	9
82	2022-02-06 13:49:52	2022-02-06 13:49:52	Dordrecht Y	2	\N	9
83	2022-02-06 13:49:52	2022-02-06 13:49:52	Blyth M	2	\N	9
84	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Weert 1	2	\N	9
85	2022-02-06 13:49:52	2022-02-06 13:49:52	STRC Dames	2	\N	9
86	2022-02-06 13:49:52	2022-02-06 13:49:52	Czech Republic 2	2	\N	9
87	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Nordrhein 3	2	\N	9
88	2022-02-06 13:49:52	2022-02-06 13:49:52	Dordrecht M	2	\N	9
89	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Zevenaar 1	2	\N	9
90	2022-02-06 13:49:52	2022-02-06 13:49:52	Starfish 1	1	\N	9
91	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG ALpen	1	\N	9
92	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Oss S	1	\N	9
93	2022-02-06 13:49:52	2022-02-06 13:49:52	Dordrecht M	1	\N	9
94	2022-02-06 13:49:52	2022-02-06 13:49:52	Czech Republic 2	1	\N	9
95	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Nordrhein 4	1	\N	9
96	2022-02-06 13:49:52	2022-02-06 13:49:52	Blyth M	1	\N	9
97	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Heytse 1	1	\N	9
98	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda J	1	\N	9
99	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda M2	1	\N	9
100	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda M1	1	\N	9
101	2022-02-06 13:49:52	2022-02-06 13:49:52	Cork SL 1	1	\N	9
102	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Delft 2	1	\N	9
103	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Ludwigshafen 1	1	\N	9
104	2022-02-06 13:49:52	2022-02-06 13:49:52	STRC Heren	1	\N	9
105	2022-02-06 13:49:52	2022-02-06 13:49:52	India	1	\N	9
106	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Oss J	1	\N	9
107	2022-02-06 13:49:55	2022-02-06 13:49:55	DLRG Nordrhein 5	2	\N	9
108	2022-02-06 13:49:55	2022-02-06 13:49:55	Starfish 1	2	\N	9
109	2022-02-06 13:49:56	2022-02-06 13:49:56	DLRG Nordrhein 6	1	\N	9
110	2022-02-06 13:49:57	2022-02-06 13:49:57	DLRG Nordrhein 7	2	\N	9
111	2022-02-06 13:49:58	2022-02-06 13:49:58	RB DenBosch 1	2	\N	9
112	2022-02-06 13:49:58	2022-02-06 13:49:58	DLRG Nordrhein 8	1	\N	9
113	2022-02-06 13:50:11	2022-02-06 13:50:11	Nederland Senioren	2	\N	1
114	2022-02-06 13:50:12	2022-02-06 13:50:12	Italy 1	2	\N	1
115	2022-02-06 13:50:12	2022-02-06 13:50:12	South Africa 1	2	\N	1
116	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Senioren	2	\N	1
117	2022-02-06 13:50:12	2022-02-06 13:50:12	Buchholz 1	2	\N	1
118	2022-02-06 13:50:12	2022-02-06 13:50:12	NL Defensie Lifesaving 1	2	\N	1
119	2022-02-06 13:50:12	2022-02-06 13:50:12	South Africa 2	2	\N	1
120	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG LV Niedersachsen 1	2	\N	1
121	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 2	2	\N	1
122	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Heythuysen 1	2	\N	1
123	2022-02-06 13:50:12	2022-02-06 13:50:12	Team Starfish	2	\N	1
124	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Ascheberg-Herbern 1	2	\N	1
125	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Junioren	2	\N	1
126	2022-02-06 13:50:12	2022-02-06 13:50:12	3T Sporting Club 1	2	\N	1
127	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 1	2	\N	1
128	2022-02-06 13:50:12	2022-02-06 13:50:12	Kusel ChiXXX	2	\N	1
129	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Duisburg-Homberg 1	2	\N	1
130	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Staphorst 1	2	\N	1
131	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Masters	2	\N	1
132	2022-02-06 13:50:12	2022-02-06 13:50:12	Italy 1	1	\N	1
133	2022-02-06 13:50:12	2022-02-06 13:50:12	Gorizia Nuoto Asd 1	1	\N	1
134	2022-02-06 13:50:12	2022-02-06 13:50:12	Nederland Senioren	1	\N	1
135	2022-02-06 13:50:12	2022-02-06 13:50:12	NL Defensie Lifesaving 1	1	\N	1
136	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Goslar 1	1	\N	1
137	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG LV Niedersachsen 1	1	\N	1
138	2022-02-06 13:50:12	2022-02-06 13:50:12	South Africa 1	1	\N	1
139	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Echt 1	1	\N	1
140	2022-02-06 13:50:12	2022-02-06 13:50:12	Hong Kong Lifesaving team 1	1	\N	1
141	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Senioren	1	\N	1
142	2022-02-06 13:50:12	2022-02-06 13:50:12	Buchholz 2	1	\N	1
143	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Junioren	1	\N	1
144	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG OG Stadtlohn e.V. 1	1	\N	1
145	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Haltern 1	1	\N	1
146	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Staphorst 1	1	\N	1
147	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Masters	1	\N	1
148	2022-02-06 13:50:12	2022-02-06 13:50:12	Hong Kong Lifesaving team 1	2	\N	1
149	2022-02-06 13:50:12	2022-02-06 13:50:12	SA 2	2	\N	1
150	2022-02-06 13:50:12	2022-02-06 13:50:12	Ennigerloh	2	\N	1
151	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Schwerte 1	2	\N	1
152	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Haltern 1	2	\N	1
153	2022-02-06 13:50:12	2022-02-06 13:50:12	Team Starfish senior	2	\N	1
154	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Oss 1	2	\N	1
155	2022-02-06 13:50:12	2022-02-06 13:50:12	Oss Masters	2	\N	1
156	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Ascheberg-Herbern 2	2	\N	1
157	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Echt 1	2	\N	1
158	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Heythuysen 2	2	\N	1
159	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 3	2	\N	1
160	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Oss 2	2	\N	1
161	2022-02-06 13:50:12	2022-02-06 13:50:12	Team Starfish junior 2	2	\N	1
162	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Staphorst 2	2	\N	1
163	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Schwerte 1	1	\N	1
164	2022-02-06 13:50:12	2022-02-06 13:50:12	Team Starfish junior	1	\N	1
165	2022-02-06 13:50:12	2022-02-06 13:50:12	Kusel DiXXX	1	\N	1
166	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG OG Stadtlohn e.V. 3	1	\N	1
167	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 2	1	\N	1
168	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 1	1	\N	1
169	2022-02-06 13:50:12	2022-02-06 13:50:12	SA 2	1	\N	1
170	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 3	1	\N	1
171	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Staphorst 2	1	\N	1
172	2022-02-06 13:50:13	2022-02-06 13:50:13	DLRG OG Stadtlohn e.V. 2	1	\N	1
173	2022-02-06 13:50:15	2022-02-06 13:50:15	RB Amersfoort 1	2	\N	1
174	2022-03-24 10:49:33	2022-03-24 10:49:33	Poland Dolnoslaskie Wopr 1	2	\N	11
175	2022-03-24 10:49:33	2022-03-24 10:49:33	Italy NT 2	2	\N	11
176	2022-03-24 10:49:33	2022-03-24 10:49:33	Italy NT 1	2	\N	11
177	2022-03-24 10:49:33	2022-03-24 10:49:33	Spain NT 2	2	\N	11
178	2022-03-24 10:49:33	2022-03-24 10:49:33	France NT 1	2	\N	11
179	2022-03-24 10:49:33	2022-03-24 10:49:33	Belgium NT 1	2	\N	11
180	2022-03-24 10:49:33	2022-03-24 10:49:33	Nederland NT 1	2	\N	11
181	2022-03-24 10:49:33	2022-03-24 10:49:33	Spain NT 1	2	\N	11
182	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Sachsen-Anhalt 1	2	\N	11
183	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Bracciano 1	2	\N	11
184	2022-03-24 10:49:34	2022-03-24 10:49:34	France NT 2	2	\N	11
185	2022-03-24 10:49:34	2022-03-24 10:49:34	CKS Szczecin 1	2	\N	11
186	2022-03-24 10:49:34	2022-03-24 10:49:34	Slaskie WOPR 1	2	\N	11
187	2022-03-24 10:49:34	2022-03-24 10:49:34	Accademia Di Salvamento 1	2	\N	11
188	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Nordrhein-Westfalen 1	2	\N	11
189	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Niedersachsen 2	2	\N	11
190	2022-03-24 10:49:34	2022-03-24 10:49:34	RB Echt 1	2	\N	11
191	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Bracciano 2	2	\N	11
192	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Niedersachsen 1	2	\N	11
193	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Alpen 1	2	\N	11
194	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Salvamento 1	2	\N	11
195	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Salvamento 2	2	\N	11
196	2022-03-24 10:49:34	2022-03-24 10:49:34	RB Staphorst 1	2	\N	11
197	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Gütersloh 1	2	\N	11
198	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Duisburg-Homberg  1	2	\N	11
199	2022-03-24 10:49:34	2022-03-24 10:49:34	RB Echt 2	2	\N	11
200	2022-03-24 10:49:34	2022-03-24 10:49:34	Hungarian NT 1	1	\N	11
201	2022-03-24 10:49:35	2022-03-24 10:49:35	Italy NT 1	1	\N	11
202	2022-03-24 10:49:35	2022-03-24 10:49:35	Spain NT 2	1	\N	11
203	2022-03-24 10:49:35	2022-03-24 10:49:35	Italy NT 2	1	\N	11
204	2022-03-24 10:49:35	2022-03-24 10:49:35	Polen NT 1	1	\N	11
205	2022-03-24 10:49:35	2022-03-24 10:49:35	Spain NT 1	1	\N	11
206	2022-03-24 10:49:35	2022-03-24 10:49:35	France NT 2	1	\N	11
207	2022-03-24 10:49:35	2022-03-24 10:49:35	ASD Gorizia Nuoto 1	1	\N	11
208	2022-03-24 10:49:35	2022-03-24 10:49:35	SAFA 2000 1	1	\N	11
209	2022-03-24 10:49:35	2022-03-24 10:49:35	A.S.D. Sportiva Sturla 1	1	\N	11
210	2022-03-24 10:49:35	2022-03-24 10:49:35	Athena Bracciano 1	1	\N	11
211	2022-03-24 10:49:35	2022-03-24 10:49:35	DLRG Luckenwalde 1	1	\N	11
212	2022-03-24 10:49:35	2022-03-24 10:49:35	ASD Rosetana Nuoto 1	1	\N	11
213	2022-03-24 10:49:35	2022-03-24 10:49:35	CKS Szczecin 1	1	\N	11
214	2022-03-24 10:49:35	2022-03-24 10:49:35	DLRG Nordrhein-Westfalen 1	1	\N	11
215	2022-03-24 10:49:36	2022-03-24 10:49:36	France NT 1	1	\N	11
216	2022-03-24 10:49:36	2022-03-24 10:49:36	Accademia Di Salvamento 1	1	\N	11
217	2022-03-24 10:49:36	2022-03-24 10:49:36	MKS Szczecin 1	1	\N	11
218	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Buchholz United 1	1	\N	11
219	2022-03-24 10:49:36	2022-03-24 10:49:36	Athena Salvamento 1	1	\N	11
220	2022-03-24 10:49:36	2022-03-24 10:49:36	Slaskie WOPR 1	1	\N	11
221	2022-03-24 10:49:36	2022-03-24 10:49:36	RB Echt 1	1	\N	11
222	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Nordrhein-Westfalen 2	1	\N	11
223	2022-03-24 10:49:36	2022-03-24 10:49:36	Athena Bracciano 2	1	\N	11
224	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Alpen 1	1	\N	11
225	2022-03-24 10:49:36	2022-03-24 10:49:36	Accademia Di Salvamento 2	1	\N	11
226	2022-03-24 10:49:36	2022-03-24 10:49:36	RB Echt 2	1	\N	11
227	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Duisburg-Homberg  1	1	\N	11
228	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Niedersachsen 1	1	\N	11
229	2022-03-24 10:49:36	2022-03-24 10:49:36	RB Staphorst 1	1	\N	11
230	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Waddinxveen 1	1	\N	11
231	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Delft 1	1	\N	11
232	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Gouda 1	1	\N	11
233	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Dordrecht 1	2	\N	11
234	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Dordrecht 2	2	\N	11
235	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Heytse 2	2	\N	11
236	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Oss 2	2	\N	11
237	2022-03-24 10:49:37	2022-03-24 10:49:37	Kusel ChiXXX	2	\N	11
238	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Oss 3	2	\N	11
239	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Echt 3	2	\N	11
240	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Oss 1	2	\N	11
241	2022-03-24 10:49:37	2022-03-24 10:49:37	A.S.D. Sportiva Sturla 1	2	\N	11
242	2022-03-24 10:49:37	2022-03-24 10:49:37	Accademia Di Salvamento 2	2	\N	11
243	2022-03-24 10:49:37	2022-03-24 10:49:37	Accademia Di Salvamento 3	2	\N	11
244	2022-03-24 10:49:38	2022-03-24 10:49:38	RB Echt 5	2	\N	11
245	2022-03-24 10:49:38	2022-03-24 10:49:38	RB Echt 4	2	\N	11
246	2022-03-24 10:49:38	2022-03-24 10:49:38	Liège Sauvetage Club 2	2	\N	11
247	2022-03-24 10:49:38	2022-03-24 10:49:38	Slaskie WOPR 2	2	\N	11
248	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Nordrhein-Westfalen 2	2	\N	11
249	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Gütersloh 1	1	\N	11
250	2022-03-24 10:49:38	2022-03-24 10:49:38	RB Echt 3	1	\N	11
251	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Sachsen-Anhalt 1	1	\N	11
252	2022-03-24 10:49:38	2022-03-24 10:49:38	RB Echt 5	1	\N	11
253	2022-03-24 10:49:38	2022-03-24 10:49:38	RB Echt 4	1	\N	11
254	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Niedersachsen	1	\N	11
255	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Dordrecht 1	1	\N	11
256	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Dordrecht 2	1	\N	11
257	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Oss 1	1	\N	11
258	2022-03-24 10:49:39	2022-03-24 10:49:39	Belgium NT 1	1	\N	11
259	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Echt 7	1	\N	11
260	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Gütersloh 2	1	\N	11
261	2022-03-24 10:49:39	2022-03-24 10:49:39	Liège Sauvetage Club 1	1	\N	11
262	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Amersfoort 1	1	\N	11
263	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Waddinxveen 2	1	\N	11
264	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Schwerte 1	1	\N	11
265	2022-03-24 10:49:39	2022-03-24 10:49:39	Beacon Lifesaving Club 1	1	\N	11
266	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft 2	1	\N	11
267	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft 3	1	\N	11
268	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft 4	1	\N	11
269	2022-03-24 10:49:40	2022-03-24 10:49:40	RB Gouda 2	1	\N	11
270	2022-03-24 10:49:40	2022-03-24 10:49:40	RB Amersfoort 2	1	\N	11
271	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento 3	1	\N	11
272	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento 4	1	\N	11
273	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento 5	1	\N	11
274	2022-03-24 10:49:40	2022-03-24 10:49:40	RB Echt 6	1	\N	11
275	2022-03-24 10:49:40	2022-03-24 10:49:40	Kusel DiXXX	1	\N	11
276	2022-03-24 10:49:40	2022-03-24 10:49:40	Slaskie WOPR 2	1	\N	11
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.results (id, created_at, updated_at, original_line_number, original_line, entrant_type, entrant_id, competition_id, event_id, status, "time", team_id, media_id, competition_category_id, splits, parent_id) FROM stdin;
19013	2022-03-25 17:44:01	2022-03-25 17:44:01	8	1.\tVETRANO, Giulia\t05\tItaly NT\t2:07.63	App\\Models\\Athlete	784	11	1	\N	12763	3201	12	12	[]	\N
19014	2022-03-25 17:44:01	2022-03-25 17:44:01	9	2.\tDARAIO, MADDALENA\t03\tSAFA 2000\t2:17.82	App\\Models\\Athlete	785	11	1	\N	13782	3202	12	12	[]	\N
19015	2022-03-25 17:44:01	2022-03-25 17:44:01	10	3.\tMAZZI, Gioia\t04\tAccademia Di Salvamento\t2:18.05	App\\Models\\Athlete	4	11	1	\N	13805	3203	12	12	[]	\N
19016	2022-03-25 17:44:01	2022-03-25 17:44:01	11	4.\tGONZALEZ GOMEZ, Lucia\t05\tSpain NT\t2:21.15	App\\Models\\Athlete	786	11	1	\N	14115	3204	12	12	[]	\N
19017	2022-03-25 17:44:01	2022-03-25 17:44:02	12	5.\tBOUDES, Romane\t06\tFrance NT\t2:23.58	App\\Models\\Athlete	787	11	1	\N	14358	3205	12	12	[]	\N
19018	2022-03-25 17:44:02	2022-03-25 17:44:02	13	6.\tDELL'OSPEDALE, Sara\t03\tAccademia Di Salvamento\t2:24.70	App\\Models\\Athlete	10	11	1	\N	14470	3203	12	12	[]	\N
19019	2022-03-25 17:44:02	2022-03-25 17:44:02	14	7.\tCROES, Elise\t04\tBelgium NT\t2:28.52	App\\Models\\Athlete	14	11	1	\N	14852	3206	12	12	[]	\N
19020	2022-03-25 17:44:02	2022-03-25 17:44:02	15	8.\tBENZMUELLER, Magdalena\t05\tKusel KiXXX\t2:28.82	App\\Models\\Athlete	788	11	1	\N	14882	3207	12	12	[]	\N
19021	2022-03-25 17:44:02	2022-03-25 17:44:02	16	9.\tTITO, Letizia\t06\tIn Sport Rane Rosse\t2:32.52	App\\Models\\Athlete	789	11	1	\N	15252	3208	12	12	[]	\N
19022	2022-03-25 17:44:02	2022-03-25 17:44:02	17	10.\tWIECZOREK, Lysann\t05\tDLRG Sachsen-Anhalt\t2:32.74	App\\Models\\Athlete	790	11	1	\N	15274	3209	12	12	[]	\N
19023	2022-03-25 17:44:02	2022-03-25 17:44:03	18	11.\tCIPOLLETTI, Ilaria\t06\tAthena Bracciano\t2:33.03	App\\Models\\Athlete	791	11	1	\N	15303	3210	12	12	[]	\N
19024	2022-03-25 17:44:03	2022-03-25 17:44:03	19	12.\tBUDZINSKA, Paulina\t03\tSlaskie WOPR\t2:34.04	App\\Models\\Athlete	792	11	1	\N	15404	3211	12	12	[]	\N
19025	2022-03-25 17:44:03	2022-03-25 17:44:03	20	13.\tDRABIK, Aneta\t04\tSlaskie WOPR\t2:34.81	App\\Models\\Athlete	793	11	1	\N	15481	3211	12	12	[]	\N
19026	2022-03-25 17:44:03	2022-03-25 17:44:03	21	14.\tMOELLER, Kim\t03\tDLRG Niedersachsen\t2:35.35	App\\Models\\Athlete	794	11	1	\N	15535	3212	12	12	[]	\N
19027	2022-03-25 17:44:03	2022-03-25 17:44:03	22	15.\tBERTORELLE, Fiona\t06\tFrance NT\t2:36.57	App\\Models\\Athlete	795	11	1	\N	15657	3205	12	12	[]	\N
19028	2022-03-25 17:44:03	2022-03-25 17:44:03	23	16.\tPASQUALI, Carlotta\t06\tAthena Bracciano\t2:36.76	App\\Models\\Athlete	796	11	1	\N	15676	3210	12	12	[]	\N
19029	2022-03-25 17:44:03	2022-03-25 17:44:03	24	17.\tKLOMP, Dyonne\t04\tRB Weert\t2:38.32	App\\Models\\Athlete	31	11	1	\N	15832	12	12	12	[]	\N
19030	2022-03-25 17:44:03	2022-03-25 17:44:03	25	18.\tCANNONE, Asia\t04\tAthena Salvamento\t2:39.29	App\\Models\\Athlete	797	11	1	\N	15929	3213	12	12	[]	\N
19031	2022-03-25 17:44:03	2022-03-25 17:44:03	26	19.\tPIOVANI, Giulia\t05\tIn Sport Rane Rosse\t2:39.32	App\\Models\\Athlete	798	11	1	\N	15932	3208	12	12	[]	\N
19032	2022-03-25 17:44:03	2022-03-25 17:44:03	27	20.\tS'HEEREN, Mirte\t06\tSint-Truidense RC\t2:39.84	App\\Models\\Athlete	799	11	1	\N	15984	3214	12	12	[]	\N
19033	2022-03-25 17:44:03	2022-03-25 17:44:04	28	21.\tMONGIA, Sara\t06\tASD Rosetana Nuoto\t2:40.54	App\\Models\\Athlete	800	11	1	\N	16054	3215	12	12	[]	\N
19034	2022-03-25 17:44:04	2022-03-25 17:44:04	29	22.\tFELLENSIEK, Talea\t04\tDLRG Niedersachsen\t2:41.92	App\\Models\\Athlete	801	11	1	\N	16192	3212	12	12	[]	\N
19035	2022-03-25 17:44:04	2022-03-25 17:44:04	30	23.\tRIEDRICH, Franka\t05\tDLRG Nuernberg-Roth-Schwabach\t2:41.98	App\\Models\\Athlete	802	11	1	\N	16198	3216	12	12	[]	\N
19036	2022-03-25 17:44:04	2022-03-25 17:44:04	31	24.\tSTICKER, Lien\t06\tRctal\t2:42.38	App\\Models\\Athlete	803	11	1	\N	16238	3217	12	12	[]	\N
19037	2022-03-25 17:44:04	2022-03-25 17:44:04	32	25.\tFELLENSIEK, Svea\t05\tDLRG Niedersachsen\t2:42.95	App\\Models\\Athlete	804	11	1	\N	16295	3212	12	12	[]	\N
19038	2022-03-25 17:44:04	2022-03-25 17:44:04	33	26.\tDELAMARE, Michelle\t05\tAthena Bracciano\t2:44.01	App\\Models\\Athlete	805	11	1	\N	16401	3210	12	12	[]	\N
19039	2022-03-25 17:44:04	2022-03-25 17:44:04	34	27.\tDERWAEL, Fien\t06\tSint-Truidense RC\t2:44.25	App\\Models\\Athlete	806	11	1	\N	16425	3214	12	12	[]	\N
19040	2022-03-25 17:44:04	2022-03-25 17:44:04	35	28.\tMEESKE, Christin\t05\tDLRG Niedersachsen\t2:45.52	App\\Models\\Athlete	807	11	1	\N	16552	3212	12	12	[]	\N
19041	2022-03-25 17:44:04	2022-03-25 17:44:04	36	29.\tZAPPONE, Giorgia\t03\tAthena Salvamento\t2:45.83	App\\Models\\Athlete	808	11	1	\N	16583	3213	12	12	[]	\N
19042	2022-03-25 17:44:04	2022-03-25 17:44:04	37	30.\tDE KONING, Sanne\t04\tRB Gouda\t2:46.27	App\\Models\\Athlete	43	11	1	\N	16627	17	12	12	[]	\N
19043	2022-03-25 17:44:04	2022-03-25 17:44:04	38	31.\tPUGGIONI, Livia\t03\tAccademia Di Salvamento\t2:46.34	App\\Models\\Athlete	809	11	1	\N	16634	3203	12	12	[]	\N
19044	2022-03-25 17:44:04	2022-03-25 17:44:04	39	32.\tBELLI, Sofia\t05\tAthena Salvamento\t2:47.53	App\\Models\\Athlete	810	11	1	\N	16753	3213	12	12	[]	\N
19045	2022-03-25 17:44:04	2022-03-25 17:44:04	40	33.\tDALHUISEN, Renske\t03\tNederland NT\t2:48.90	App\\Models\\Athlete	30	11	1	\N	16890	3218	12	12	[]	\N
19046	2022-03-25 17:44:04	2022-03-25 17:44:04	41	34.\tSPLIETHOFF, Maja\t04\tDLRG Alpen\t2:51.14	App\\Models\\Athlete	42	11	1	\N	17114	261	12	12	[]	\N
19047	2022-03-25 17:44:04	2022-03-25 17:44:04	42	35.\tSPUERCK, Hanna\t03\tDLRG Nordrhein-Westfalen\t2:51.33	App\\Models\\Athlete	39	11	1	\N	17133	3219	12	12	[]	\N
19048	2022-03-25 17:44:04	2022-03-25 17:44:04	43	36.\tSCHOSTOK, Lena\t04\tDLRG Alpen\t2:55.42	App\\Models\\Athlete	47	11	1	\N	17542	261	12	12	[]	\N
19049	2022-03-25 17:44:04	2022-03-25 17:44:04	44	37.\tWIJNANT, Loes\t05\tRctal\t2:59.67	App\\Models\\Athlete	811	11	1	\N	17967	3217	12	12	[]	\N
19050	2022-03-25 17:44:04	2022-03-25 17:44:04	45	38.\tHILLE, Louisa\t04\tDLRG Guetersloh\t3:06.10	App\\Models\\Athlete	404	11	1	\N	18610	3220	12	12	[]	\N
6544	2022-02-19 13:27:45	2022-02-19 13:27:45	40	1.\tFRANZOT, Emma\t00\tGorizia Nuoto Asd\t2:16.46	App\\Models\\Athlete	610	1	1	\N	13646	231	2	7	[]	\N
19051	2022-03-25 17:44:04	2022-03-25 17:44:04	46	39.\tKOITKA, Sophie\t06\tDLRG Guetersloh\t3:06.62	App\\Models\\Athlete	812	11	1	\N	18662	3220	12	12	[]	\N
19052	2022-03-25 17:44:04	2022-03-25 17:44:04	47	40.\tROSA, Martina\t04\tAthena Bracciano\t3:10.28	App\\Models\\Athlete	813	11	1	\N	19028	3210	12	12	[]	\N
19053	2022-03-25 17:44:04	2022-03-25 17:44:04	48	41.\tZUIDGEEST, Vera\t03\tRB Delft\t3:15.45	App\\Models\\Athlete	478	11	1	\N	19545	3221	12	12	[]	\N
19054	2022-03-25 17:44:04	2022-03-25 17:44:04	49	42.\tVRENKEN, Kyra\t04\tRB Echt\t3:20.18	App\\Models\\Athlete	72	11	1	\N	20018	15	12	12	[]	\N
19055	2022-03-25 17:44:04	2022-03-25 17:44:04	50	43.\tEGGERDING, Pip\t03\tRB Staphorst\t3:20.53	App\\Models\\Athlete	62	11	1	\N	20053	26	12	12	[]	\N
19056	2022-03-25 17:44:04	2022-03-25 17:44:04	51	44.\tKELLENERS, Jill\t06\tRB Echt\t3:26.22	App\\Models\\Athlete	814	11	1	\N	20622	15	12	12	[]	\N
19057	2022-03-25 17:44:04	2022-03-25 17:44:04	52	45.\tVAN DER VORST, Lynn\t04\tRB Echt\t3:30.83	App\\Models\\Athlete	415	11	1	\N	21083	15	12	12	[]	\N
19058	2022-03-25 17:44:04	2022-03-25 17:44:04	53	46.\tEUBE, Amelie\t05\tDLRG Guetersloh\t3:41.93	App\\Models\\Athlete	815	11	1	\N	22193	3220	12	12	[]	\N
19059	2022-03-25 17:44:04	2022-03-25 17:44:04	54	47.\tHOFSTEDE, Anouk\t04\tRB Staphorst\t3:47.46	App\\Models\\Athlete	483	11	1	\N	22746	26	12	12	[]	\N
19060	2022-03-25 17:44:04	2022-03-25 17:44:04	55	48.\tVAN PINXTEREN, Indy\t05\tRB Oss\t3:47.68	App\\Models\\Athlete	816	11	1	\N	22768	43	12	12	[]	\N
19061	2022-03-25 17:44:04	2022-03-25 17:44:04	61	1.\tMESCHIARI, Silvia\t92\tItaly NT\t2:09.83	App\\Models\\Athlete	625	11	1	\N	12983	3201	12	13	[]	\N
19062	2022-03-25 17:44:04	2022-03-25 17:44:05	62	2.\tZUKOWSKA, Paula\t93\tPoland Dolnoslaskie Wopr\t2:10.58	App\\Models\\Athlete	817	11	1	\N	13058	3222	12	13	[]	\N
19063	2022-03-25 17:44:05	2022-03-25 17:44:05	63	3.\tFOGLIUZZI, Zoe\t98\tItaly NT\t2:11.01	App\\Models\\Athlete	818	11	1	\N	13101	3201	12	13	[]	\N
19064	2022-03-25 17:44:05	2022-03-25 17:44:05	64	4.\tNAZIEBLO, Klaudia\t93\tPoland Dolnoslaskie Wopr\t2:14.00	App\\Models\\Athlete	819	11	1	\N	13400	3222	12	13	[]	\N
19065	2022-03-25 17:44:05	2022-03-25 17:44:05	65	5.\tGEBHARDT, Alica\t97\tDLRG Bad Oldesloe\t2:17.15	App\\Models\\Athlete	820	11	1	\N	13715	3223	12	13	[]	\N
19066	2022-03-25 17:44:05	2022-03-25 17:44:05	66	6.\tAMBROSI, Chiara\t02\tASD Gorizia Nuoto\t2:19.47	App\\Models\\Athlete	821	11	1	\N	13947	3224	12	13	[]	\N
19067	2022-03-25 17:44:05	2022-03-25 17:44:05	67	7.\tLEWANDOWSKA, Natalia\t01\tPoland Dolnoslaskie Wopr\t2:19.80	App\\Models\\Athlete	822	11	1	\N	13980	3222	12	13	[]	\N
19068	2022-03-25 17:44:05	2022-03-25 17:44:05	68	8.\tBOREL, Carol-Ann\t99\tFrance NT\t2:19.90	App\\Models\\Athlete	823	11	1	\N	13990	3205	12	13	[]	\N
19069	2022-03-25 17:44:05	2022-03-25 17:44:05	69	9.\tGANADO AMADOR, Carolina\t99\tSpain NT\t2:20.32	App\\Models\\Athlete	86	11	1	\N	14032	3204	12	13	[]	\N
19070	2022-03-25 17:44:05	2022-03-25 17:44:05	70	10.\tROYER VEIL, Lea\t01\tFrance NT\t2:22.87	App\\Models\\Athlete	824	11	1	\N	14287	3205	12	13	[]	\N
19071	2022-03-25 17:44:05	2022-03-25 17:44:05	71	11.\tVAN OS, Hanna\t02\tDLRG Sachsen-Anhalt\t2:23.73	App\\Models\\Athlete	825	11	1	\N	14373	3209	12	13	[]	\N
19072	2022-03-25 17:44:05	2022-03-25 17:44:05	72	12.\tHARZE, Marine\t97\tBelgium NT\t2:24.89	App\\Models\\Athlete	420	11	1	\N	14489	3206	12	13	[]	\N
19073	2022-03-25 17:44:05	2022-03-25 17:44:05	73	13.\tCARADONNA, Irene\t01\tAthena Bracciano\t2:35.20	App\\Models\\Athlete	21	11	1	\N	15520	3210	12	13	[]	\N
19074	2022-03-25 17:44:05	2022-03-25 17:44:05	74	14.\tBECKERS, Fleur\t02\tRB Echt\t2:35.90	App\\Models\\Athlete	26	11	1	\N	15590	15	12	13	[]	\N
19075	2022-03-25 17:44:05	2022-03-25 17:44:05	75	15.\tKLOMP, Danique\t02\tNederland NT\t2:36.55	App\\Models\\Athlete	19	11	1	\N	15655	3218	12	13	[]	\N
19076	2022-03-25 17:44:05	2022-03-25 17:44:05	76	16.\tGRAU, Jessica\t00\tKusel KiXXX\t2:36.56	App\\Models\\Athlete	92	11	1	\N	15656	3207	12	13	[]	\N
19077	2022-03-25 17:44:05	2022-03-25 17:44:05	77	17.\tBERTUOLA, Chiara\t99\tAthena Bracciano\t2:37.53	App\\Models\\Athlete	93	11	1	\N	15753	3210	12	13	[]	\N
19078	2022-03-25 17:44:05	2022-03-25 17:44:05	78	18.\tCHIARAVALLI, Ginevra\t97\tAthena Bracciano\t2:38.55	App\\Models\\Athlete	97	11	1	\N	15855	3210	12	13	[]	\N
19079	2022-03-25 17:44:05	2022-03-25 17:44:05	79	19.\tGROOT, Kathy\t97\tRB Dordrecht\t2:47.09	App\\Models\\Athlete	570	11	1	\N	16709	13	12	13	[]	\N
19080	2022-03-25 17:44:05	2022-03-25 17:44:05	80	20.\tPISTERS, Nathalie\t01\tRB Echt\t2:49.63	App\\Models\\Athlete	35	11	1	\N	16963	15	12	13	[]	\N
19081	2022-03-25 17:44:05	2022-03-25 17:44:05	81	21.\tMODDER, Louisa\t02\tDLRG Niedersachsen\t2:53.15	App\\Models\\Athlete	33	11	1	\N	17315	3212	12	13	[]	\N
19082	2022-03-25 17:44:05	2022-03-25 17:44:05	82	22.\tROESSIGER, Laura\t00\tDLRG Luckenwalde\t2:54.44	App\\Models\\Athlete	826	11	1	\N	17444	3225	12	13	[]	\N
19083	2022-03-25 17:44:05	2022-03-25 17:44:05	83	23.\tVAN ELP, Jennifer\t01\tRB Staphorst\t3:01.48	App\\Models\\Athlete	51	11	1	\N	18148	26	12	13	[]	\N
19084	2022-03-25 17:44:05	2022-03-25 17:44:05	84	24.\tVAN DE WETERING, Loes\t99\tRB Oss\t3:12.32	App\\Models\\Athlete	722	11	1	\N	19232	43	12	13	[]	\N
19085	2022-03-25 17:44:05	2022-03-25 17:44:05	85	25.\tDISNEY, Victoria\t01\tRB Gouda\t3:31.65	App\\Models\\Athlete	827	11	1	\N	21165	17	12	13	[]	\N
19086	2022-03-25 17:44:05	2022-03-25 17:44:05	86	DNS\tMODDER, Alena\t02\tDLRG Niedersachsen	App\\Models\\Athlete	41	11	1	2	\N	3212	12	13	[]	\N
19087	2022-03-25 17:44:05	2022-03-25 17:44:05	87	WDR\tREPETTO, Martina\t98\tA.S.D. Sportiva Sturla	App\\Models\\Athlete	828	11	1	0	\N	3226	12	13	[]	\N
19088	2022-03-25 17:44:05	2022-03-25 17:44:05	89	1.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t2:48.32	App\\Models\\Athlete	640	11	1	\N	16832	243	12	14	[]	\N
19089	2022-03-25 17:44:05	2022-03-25 17:44:05	90	2.\tSTEVENS, Danielle\t88\tRB Oss\t2:58.78	App\\Models\\Athlete	641	11	1	\N	17878	43	12	14	[]	\N
19090	2022-03-25 17:44:05	2022-03-25 17:44:05	92	1.\tROEMEN, Claudine\t74\tRB Echt\t2:51.28	App\\Models\\Athlete	125	11	1	\N	17128	15	12	15	[]	\N
19091	2022-03-25 17:44:05	2022-03-25 17:44:05	98	1.\tCORONADO TEJEDA, Carlos\t03\tSpain NT\t2:04.29	App\\Models\\Athlete	829	11	1	\N	12429	3204	12	12	[]	\N
19092	2022-03-25 17:44:05	2022-03-25 17:44:05	99	2.\tMANCARDO, LORENZO\t03\tSAFA 2000\t2:04.73	App\\Models\\Athlete	830	11	1	\N	12473	3202	12	12	[]	\N
19093	2022-03-25 17:44:05	2022-03-25 17:44:05	100	3.\tROGOZINSKI, Konrad\t04\tCKS Szczecin\t2:05.38	App\\Models\\Athlete	831	11	1	\N	12538	3227	12	12	[]	\N
19094	2022-03-25 17:44:05	2022-03-25 17:44:05	101	4.\tCOCIANNI, Andrea\t03\tASD Gorizia Nuoto\t2:07.07	App\\Models\\Athlete	832	11	1	\N	12707	3224	12	12	[]	\N
19095	2022-03-25 17:44:05	2022-03-25 17:44:05	102	5.\tMADRZAK, Milosz\t05\tCKS Szczecin\t2:12.38	App\\Models\\Athlete	833	11	1	\N	13238	3227	12	12	[]	\N
19096	2022-03-25 17:44:05	2022-03-25 17:44:06	103	6.\tDI SIMONE, Franco\t03\tSDS - Specialisti dello Sport \t2:12.92	App\\Models\\Athlete	834	11	1	\N	13292	3228	12	12	[]	\N
19097	2022-03-25 17:44:06	2022-03-25 17:44:06	104	7.\tALDRIGO, Riccardo\t05\tASD Gorizia Nuoto\t2:13.51	App\\Models\\Athlete	835	11	1	\N	13351	3224	12	12	[]	\N
19098	2022-03-25 17:44:06	2022-03-25 17:44:06	105	8.\tBELLOLI, Matteo\t05\tIn Sport Rane Rosse\t2:15.27	App\\Models\\Athlete	836	11	1	\N	13527	3208	12	12	[]	\N
19099	2022-03-25 17:44:06	2022-03-25 17:44:06	106	9.\tACHILLI, Emanuele\t06\tIn Sport Rane Rosse\t2:16.01	App\\Models\\Athlete	837	11	1	\N	13601	3208	12	12	[]	\N
19100	2022-03-25 17:44:06	2022-03-25 17:44:06	107	10.\tFERRAGOSTO, Paolo\t03\tSDS - Specialisti dello Sport \t2:17.11	App\\Models\\Athlete	838	11	1	\N	13711	3228	12	12	[]	\N
19101	2022-03-25 17:44:06	2022-03-25 17:44:06	108	11.\tROSIAK, Krzysztof\t03\tSlaskie WOPR\t2:17.22	App\\Models\\Athlete	839	11	1	\N	13722	3211	12	12	[]	\N
19102	2022-03-25 17:44:06	2022-03-25 17:44:06	173	13.\tINDERBITZIN, Marco\t01\tSLRG Innerschwyz\t2:14.32	App\\Models\\Athlete	840	11	1	\N	13432	243	12	13	[]	\N
19103	2022-03-25 17:44:06	2022-03-25 17:44:06	174	14.\tBALSEN VERSTEEG, Tom\t00\tRB Dordrecht\t2:15.21	App\\Models\\Athlete	841	11	1	\N	13521	13	12	13	[]	\N
19104	2022-03-25 17:44:06	2022-03-25 17:44:06	175	15.\tHOBUS, Iwan\t01\tRB Heytse\t2:16.60	App\\Models\\Athlete	760	11	1	\N	13660	3229	12	13	[]	\N
19105	2022-03-25 17:44:06	2022-03-25 17:44:06	176	16.\tFEYS, Sammy\t00\tBelgium NT\t2:17.68	App\\Models\\Athlete	842	11	1	\N	13768	3206	12	13	[]	\N
19106	2022-03-25 17:44:06	2022-03-25 17:44:06	177	17.\tBONGERS, Rick\t00\tRB Heytse\t2:17.82	App\\Models\\Athlete	138	11	1	\N	13782	3229	12	13	[]	\N
19107	2022-03-25 17:44:06	2022-03-25 17:44:06	178	18.\tSCHLEICH, Sandro\t01\tSLRG Innerschwyz\t2:19.06	App\\Models\\Athlete	843	11	1	\N	13906	243	12	13	[]	\N
19108	2022-03-25 17:44:06	2022-03-25 17:44:06	179	19.\tMUENDELEIN, Nils\t01\tDLRG Nordrhein-Westfalen\t2:19.76	App\\Models\\Athlete	844	11	1	\N	13976	3219	12	13	[]	\N
19109	2022-03-25 17:44:06	2022-03-25 17:44:06	180	20.\tBALDI, Marco\t95\tAthena Bracciano\t2:21.07	App\\Models\\Athlete	133	11	1	\N	14107	3210	12	13	[]	\N
19110	2022-03-25 17:44:06	2022-03-25 17:44:06	181	21.\tMIGLIORELLI, Davide\t01\tAthena Salvamento\t2:21.35	App\\Models\\Athlete	845	11	1	\N	14135	3213	12	13	[]	\N
19111	2022-03-25 17:44:06	2022-03-25 17:44:06	182	22.\tMEERTEN, Jack\t97\tRB Echt\t2:22.62	App\\Models\\Athlete	135	11	1	\N	14262	15	12	13	[]	\N
19112	2022-03-25 17:44:06	2022-03-25 17:44:06	183	23.\tHERRMANN, Thomas\t99\tDLRG Luckenwalde\t2:22.63	App\\Models\\Athlete	846	11	1	\N	14263	3225	12	13	[]	\N
19113	2022-03-25 17:44:06	2022-03-25 17:44:06	184	24.\tVAN DEN AKKER, Tom\t02\tRB Echt\t2:23.27	App\\Models\\Athlete	651	11	1	\N	14327	15	12	13	[]	\N
19114	2022-03-25 17:44:06	2022-03-25 17:44:06	185	25.\tCUGLIARI, Matteo\t95\tAthena Bracciano\t2:24.73	App\\Models\\Athlete	847	11	1	\N	14473	3210	12	13	[]	\N
19115	2022-03-25 17:44:06	2022-03-25 17:44:06	186	26.\tVAN DEN AKKER, Bas\t02\tRB Echt\t2:27.73	App\\Models\\Athlete	652	11	1	\N	14773	15	12	13	[]	\N
19116	2022-03-25 17:44:06	2022-03-25 17:44:06	187	27.\tDE REUVER, Bas\t01\tRB Oss\t2:28.69	App\\Models\\Athlete	780	11	1	\N	14869	43	12	13	[]	\N
19117	2022-03-25 17:44:06	2022-03-25 17:44:06	188	28.\tBRINK, Guido\t02\tRB Vlissingen\t2:30.55	App\\Models\\Athlete	848	11	1	\N	15055	248	12	13	[]	\N
19118	2022-03-25 17:44:06	2022-03-25 17:44:06	189	29.\tMEERTEN, John\t97\tRB Echt\t2:33.35	App\\Models\\Athlete	154	11	1	\N	15335	15	12	13	[]	\N
19119	2022-03-25 17:44:06	2022-03-25 17:44:06	190	30.\tSCHMIEMANN, Gerd\t02\tDLRG Niedersachsen\t2:35.32	App\\Models\\Athlete	849	11	1	\N	15532	3212	12	13	[]	\N
19120	2022-03-25 17:44:06	2022-03-25 17:44:06	191	31.\tMELVIN, Jonas\t97\tDLRG Buchholz United\t2:35.71	App\\Models\\Athlete	850	11	1	\N	15571	3230	12	13	[]	\N
19121	2022-03-25 17:44:06	2022-03-25 17:44:06	192	32.\tHOBBEL, Kevin\t97\tRB Echt\t2:35.80	App\\Models\\Athlete	149	11	1	\N	15580	15	12	13	[]	\N
19122	2022-03-25 17:44:06	2022-03-25 17:44:06	193	33.\tMARUOTTI, Luigi\t97\tAthena Bracciano\t2:36.17	App\\Models\\Athlete	851	11	1	\N	15617	3210	12	13	[]	\N
19123	2022-03-25 17:44:06	2022-03-25 17:44:06	194	34.\tKREUTZ, Timm\t96\tKusel KiXXX\t2:51.56	App\\Models\\Athlete	163	11	1	\N	17156	3207	12	13	[]	\N
19124	2022-03-25 17:44:06	2022-03-25 17:44:06	195	35.\tVERSPAGEN, Harry\t01\tRB Weert\t3:13.88	App\\Models\\Athlete	852	11	1	\N	19388	12	12	13	[]	\N
19125	2022-03-25 17:44:06	2022-03-25 17:44:06	196	36.\tVAN HOFF, Bjoern\t02\tRB Waddinxveen\t3:14.44	App\\Models\\Athlete	853	11	1	\N	19444	3231	12	13	[]	\N
19126	2022-03-25 17:44:06	2022-03-25 17:44:06	197	DNS\tWHEELER, Ryan\t95\tBeacon Lifesaving Club	App\\Models\\Athlete	854	11	1	2	\N	3232	12	13	[]	\N
6545	2022-02-19 13:27:45	2022-02-19 13:27:45	41	2.\tCHISLETT, Ally\t01\tSouth Africa\t2:16.79	App\\Models\\Athlete	611	1	1	\N	13679	232	2	7	[]	\N
19127	2022-03-25 17:44:06	2022-03-25 17:44:06	198	DNS\tENKING, Moritz\t96\tDLRG Buchholz United	App\\Models\\Athlete	855	11	1	2	\N	3230	12	13	[]	\N
19128	2022-03-25 17:44:06	2022-03-25 17:44:06	200	1.\tGILARDI, Federico\t91\tItaly NT\t2:00.46	App\\Models\\Athlete	668	11	1	\N	12046	3201	12	14	[]	\N
19129	2022-03-25 17:44:06	2022-03-25 17:44:06	201	2.\tKEMPKES, Stephan\t88\tDLRG Buchholz United\t2:23.38	App\\Models\\Athlete	676	11	1	\N	14338	3230	12	14	[]	\N
19130	2022-03-25 17:44:06	2022-03-25 17:44:06	202	3.\tSIDORETTI, Stefano\t89\tAthena Bracciano\t2:36.19	App\\Models\\Athlete	167	11	1	\N	15619	3210	12	14	[]	\N
19131	2022-03-25 17:44:06	2022-03-25 17:44:06	203	4.\tDEN HARTOG, Jan-Willem\t86\tRB Amersfoort\t2:41.51	App\\Models\\Athlete	856	11	1	\N	16151	22	12	14	[]	\N
19132	2022-03-25 17:44:06	2022-03-25 17:44:06	204	5.\tVAN DE RIET, Stefan\t84\tRB Delft\t2:44.31	App\\Models\\Athlete	168	11	1	\N	16431	3221	12	14	[]	\N
19133	2022-03-25 17:44:06	2022-03-25 17:44:06	205	DNS\tVAN DER HEIJDEN, Michiel\t86\tRB Staphorst	App\\Models\\Athlete	752	11	1	2	\N	26	12	14	[]	\N
19134	2022-03-25 17:44:06	2022-03-25 17:44:06	206	DNS\tDE VREEDE, Melvin\t85\tRB Delft	App\\Models\\Athlete	857	11	1	2	\N	3221	12	14	[]	\N
19135	2022-03-25 17:44:06	2022-03-25 17:44:06	207	DNF\tSTOPPELENBURG, Bart\t85\tRB Delft	App\\Models\\Athlete	858	11	1	3	\N	3221	12	14	[]	\N
19136	2022-03-25 17:44:06	2022-03-25 17:44:06	209	1.\tVAN DE GOOR, Guus\t77\tRB Echt\t2:48.68	App\\Models\\Athlete	174	11	1	\N	16868	15	12	15	[]	\N
19137	2022-03-25 17:44:06	2022-03-25 17:44:06	210	2.\tSHINN, Ryan\t80\tRB Amersfoort\t4:02.23	App\\Models\\Athlete	171	11	1	\N	24223	22	12	15	[]	\N
19138	2022-03-25 17:44:06	2022-03-25 17:44:06	212	1.\tROEMEN, Sven\t70\tRB Echt\t2:35.90	App\\Models\\Athlete	173	11	1	\N	15590	15	12	16	[]	\N
19139	2022-03-25 17:44:06	2022-03-25 17:44:06	213	2.\tVAN DAALEN, Erik\t65\tRB Gouda\t2:52.17	App\\Models\\Athlete	175	11	1	\N	17217	17	12	16	[]	\N
19140	2022-03-25 17:44:06	2022-03-25 17:44:06	214	3.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t3:16.77	App\\Models\\Athlete	179	11	1	\N	19677	13	12	16	[]	\N
19141	2022-03-25 17:44:07	2022-03-25 17:44:07	215	4.\tPRAET, Piet\t56\tRB Dordrecht\t3:31.27	App\\Models\\Athlete	693	11	1	\N	21127	13	12	16	[]	\N
19143	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	859	11	25	\N	\N	\N	12	\N	[]	19142
19144	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	819	11	25	\N	\N	\N	12	\N	[]	19142
19145	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	817	11	25	\N	\N	\N	12	\N	[]	19142
19146	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	860	11	25	\N	\N	\N	12	\N	[]	19142
19142	2022-03-25 17:44:07	2022-03-25 17:44:07	223	1.\tPoland Dolnoslaskie Wopr 1\tPoland Dolnoslaskie Wopr\t1:50.11	App\\Models\\RelayTeam	174	11	25	\N	11011	3222	12	\N	[]	\N
19148	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	625	11	25	\N	\N	\N	12	\N	[]	19147
19149	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	784	11	25	\N	\N	\N	12	\N	[]	19147
19150	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	818	11	25	\N	\N	\N	12	\N	[]	19147
19151	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	758	11	25	\N	\N	\N	12	\N	[]	19147
19147	2022-03-25 17:44:07	2022-03-25 17:44:07	225	2.\tItaly NT 2\tItaly NT\t1:51.80	App\\Models\\RelayTeam	175	11	25	\N	11180	3201	12	\N	[]	\N
19153	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	861	11	25	\N	\N	\N	12	\N	[]	19152
19154	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	862	11	25	\N	\N	\N	12	\N	[]	19152
19155	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	863	11	25	\N	\N	\N	12	\N	[]	19152
19156	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	864	11	25	\N	\N	\N	12	\N	[]	19152
19152	2022-03-25 17:44:07	2022-03-25 17:44:07	227	3.\tItaly NT 1\tItaly NT\t1:51.94	App\\Models\\RelayTeam	176	11	25	\N	11194	3201	12	\N	[]	\N
19158	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	865	11	25	\N	\N	\N	12	\N	[]	19157
19159	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	82	11	25	\N	\N	\N	12	\N	[]	19157
19160	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	5	11	25	\N	\N	\N	12	\N	[]	19157
19161	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	81	11	25	\N	\N	\N	12	\N	[]	19157
19157	2022-03-25 17:44:07	2022-03-25 17:44:07	229	4.\tSpain NT 2\tSpain NT\t1:52.93	App\\Models\\RelayTeam	177	11	25	\N	11293	3204	12	\N	[]	\N
19163	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	823	11	25	\N	\N	\N	12	\N	[]	19162
19164	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	824	11	25	\N	\N	\N	12	\N	[]	19162
19165	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	866	11	25	\N	\N	\N	12	\N	[]	19162
19166	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	867	11	25	\N	\N	\N	12	\N	[]	19162
19162	2022-03-25 17:44:07	2022-03-25 17:44:07	231	5.\tFrance NT 1\tFrance NT\t1:57.02	App\\Models\\RelayTeam	178	11	25	\N	11702	3205	12	\N	[]	\N
19168	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	868	11	25	\N	\N	\N	12	\N	[]	19167
19169	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	869	11	25	\N	\N	\N	12	\N	[]	19167
19170	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	14	11	25	\N	\N	\N	12	\N	[]	19167
19171	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	420	11	25	\N	\N	\N	12	\N	[]	19167
19167	2022-03-25 17:44:07	2022-03-25 17:44:07	233	6.\tBelgium NT 1\tBelgium NT\t1:57.58	App\\Models\\RelayTeam	179	11	25	\N	11758	3206	12	\N	[]	\N
19173	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	199	11	25	\N	\N	\N	12	\N	[]	19172
19174	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	19	11	25	\N	\N	\N	12	\N	[]	19172
19175	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	200	11	25	\N	\N	\N	12	\N	[]	19172
19176	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	208	11	25	\N	\N	\N	12	\N	[]	19172
19172	2022-03-25 17:44:07	2022-03-25 17:44:07	235	7.\tNederland NT 1\tNederland NT\t1:58.15	App\\Models\\RelayTeam	180	11	25	\N	11815	3218	12	\N	[]	\N
19178	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	786	11	25	\N	\N	\N	12	\N	[]	19177
19179	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	86	11	25	\N	\N	\N	12	\N	[]	19177
19180	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	870	11	25	\N	\N	\N	12	\N	[]	19177
19181	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	186	11	25	\N	\N	\N	12	\N	[]	19177
19177	2022-03-25 17:44:07	2022-03-25 17:44:07	237	8.\tSpain NT 1\tSpain NT\t2:00.13	App\\Models\\RelayTeam	181	11	25	\N	12013	3204	12	\N	[]	\N
19183	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	871	11	25	\N	\N	\N	12	\N	[]	19182
19184	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	825	11	25	\N	\N	\N	12	\N	[]	19182
19185	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	790	11	25	\N	\N	\N	12	\N	[]	19182
19186	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	206	11	25	\N	\N	\N	12	\N	[]	19182
19182	2022-03-25 17:44:07	2022-03-25 17:44:07	239	9.\tDLRG Sachsen-Anhalt 1\tDLRG Sachsen-Anhalt\t2:03.44	App\\Models\\RelayTeam	182	11	25	\N	12344	3209	12	\N	[]	\N
19188	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	796	11	25	\N	\N	\N	12	\N	[]	19187
19189	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	791	11	25	\N	\N	\N	12	\N	[]	19187
19190	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	97	11	25	\N	\N	\N	12	\N	[]	19187
19191	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	872	11	25	\N	\N	\N	12	\N	[]	19187
19187	2022-03-25 17:44:07	2022-03-25 17:44:07	241	10.\tAthena Bracciano 1\tAthena Bracciano\t2:05.15	App\\Models\\RelayTeam	183	11	25	\N	12515	3210	12	\N	[]	\N
19193	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	795	11	25	\N	\N	\N	12	\N	[]	19192
19194	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	873	11	25	\N	\N	\N	12	\N	[]	19192
19195	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	787	11	25	\N	\N	\N	12	\N	[]	19192
19196	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	874	11	25	\N	\N	\N	12	\N	[]	19192
19192	2022-03-25 17:44:07	2022-03-25 17:44:07	243	11.\tFrance NT 2\tFrance NT\t2:05.25	App\\Models\\RelayTeam	184	11	25	\N	12525	3205	12	\N	[]	\N
19198	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	875	11	25	\N	\N	\N	12	\N	[]	19197
19199	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	876	11	25	\N	\N	\N	12	\N	[]	19197
19200	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	877	11	25	\N	\N	\N	12	\N	[]	19197
19201	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	878	11	25	\N	\N	\N	12	\N	[]	19197
19197	2022-03-25 17:44:07	2022-03-25 17:44:07	245	12.\tCKS Szczecin 1\tCKS Szczecin\t2:05.69	App\\Models\\RelayTeam	185	11	25	\N	12569	3227	12	\N	[]	\N
19203	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	879	11	25	\N	\N	\N	12	\N	[]	19202
19204	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	793	11	25	\N	\N	\N	12	\N	[]	19202
19205	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	880	11	25	\N	\N	\N	12	\N	[]	19202
19206	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	792	11	25	\N	\N	\N	12	\N	[]	19202
19202	2022-03-25 17:44:07	2022-03-25 17:44:07	247	13.\tSlaskie WOPR 1\tSlaskie WOPR\t2:08.18	App\\Models\\RelayTeam	186	11	25	\N	12818	3211	12	\N	[]	\N
19208	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	4	11	25	\N	\N	\N	12	\N	[]	19207
19209	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	10	11	25	\N	\N	\N	12	\N	[]	19207
19210	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	809	11	25	\N	\N	\N	12	\N	[]	19207
19211	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	23	11	25	\N	\N	\N	12	\N	[]	19207
19207	2022-03-25 17:44:07	2022-03-25 17:44:07	249	14.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t2:08.32	App\\Models\\RelayTeam	187	11	25	\N	12832	3203	12	\N	[]	\N
19213	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	204	11	25	\N	\N	\N	12	\N	[]	19212
19214	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	881	11	25	\N	\N	\N	12	\N	[]	19212
19215	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	60	11	25	\N	\N	\N	12	\N	[]	19212
19216	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	39	11	25	\N	\N	\N	12	\N	[]	19212
19212	2022-03-25 17:44:07	2022-03-25 17:44:07	251	15.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t2:11.08	App\\Models\\RelayTeam	188	11	25	\N	13108	3219	12	\N	[]	\N
19218	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	804	11	25	\N	\N	\N	12	\N	[]	19217
19219	2022-03-25 17:44:07	2022-03-25 17:44:07	\N	\N	App\\Models\\Athlete	801	11	25	\N	\N	\N	12	\N	[]	19217
19220	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	807	11	25	\N	\N	\N	12	\N	[]	19217
19221	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	794	11	25	\N	\N	\N	12	\N	[]	19217
19217	2022-03-25 17:44:07	2022-03-25 17:44:08	253	16.\tDLRG Niedersachsen 2\tDLRG Niedersachsen\t2:12.02	App\\Models\\RelayTeam	189	11	25	\N	13202	3212	12	\N	[]	\N
19223	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	26	11	25	\N	\N	\N	12	\N	[]	19222
19224	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	243	11	25	\N	\N	\N	12	\N	[]	19222
19225	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	35	11	25	\N	\N	\N	12	\N	[]	19222
19226	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	238	11	25	\N	\N	\N	12	\N	[]	19222
19222	2022-03-25 17:44:08	2022-03-25 17:44:08	255	17.\tRB Echt 1\tRB Echt\t2:13.94	App\\Models\\RelayTeam	190	11	25	\N	13394	15	12	\N	[]	\N
19228	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	21	11	25	\N	\N	\N	12	\N	[]	19227
19229	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	805	11	25	\N	\N	\N	12	\N	[]	19227
19230	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	813	11	25	\N	\N	\N	12	\N	[]	19227
19231	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	93	11	25	\N	\N	\N	12	\N	[]	19227
19227	2022-03-25 17:44:08	2022-03-25 17:44:08	257	18.\tAthena Bracciano 2\tAthena Bracciano\t2:15.50	App\\Models\\RelayTeam	191	11	25	\N	13550	3210	12	\N	[]	\N
19233	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	882	11	25	\N	\N	\N	12	\N	[]	19232
19234	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	41	11	25	\N	\N	\N	12	\N	[]	19232
19235	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	33	11	25	\N	\N	\N	12	\N	[]	19232
19236	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	210	11	25	\N	\N	\N	12	\N	[]	19232
19232	2022-03-25 17:44:08	2022-03-25 17:44:08	259	19.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t2:17.03	App\\Models\\RelayTeam	192	11	25	\N	13703	3212	12	\N	[]	\N
19238	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	42	11	25	\N	\N	\N	12	\N	[]	19237
19239	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	47	11	25	\N	\N	\N	12	\N	[]	19237
19240	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	559	11	25	\N	\N	\N	12	\N	[]	19237
19241	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	883	11	25	\N	\N	\N	12	\N	[]	19237
19237	2022-03-25 17:44:08	2022-03-25 17:44:08	261	20.\tDLRG Alpen 1\tDLRG Alpen\t2:17.84	App\\Models\\RelayTeam	193	11	25	\N	13784	261	12	\N	[]	\N
19243	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	810	11	25	\N	\N	\N	12	\N	[]	19242
19244	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	884	11	25	\N	\N	\N	12	\N	[]	19242
19245	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	885	11	25	\N	\N	\N	12	\N	[]	19242
19246	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	886	11	25	\N	\N	\N	12	\N	[]	19242
19242	2022-03-25 17:44:08	2022-03-25 17:44:08	263	21.\tAthena Salvamento 1\tAthena Salvamento\t2:17.90	App\\Models\\RelayTeam	194	11	25	\N	13790	3213	12	\N	[]	\N
19248	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	808	11	25	\N	\N	\N	12	\N	[]	19247
19249	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	887	11	25	\N	\N	\N	12	\N	[]	19247
19250	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	797	11	25	\N	\N	\N	12	\N	[]	19247
19251	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	888	11	25	\N	\N	\N	12	\N	[]	19247
19247	2022-03-25 17:44:08	2022-03-25 17:44:08	265	22.\tAthena Salvamento 2\tAthena Salvamento\t2:22.53	App\\Models\\RelayTeam	195	11	25	\N	14253	3213	12	\N	[]	\N
19253	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	889	11	25	\N	\N	\N	12	\N	[]	19252
19254	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	62	11	25	\N	\N	\N	12	\N	[]	19252
19255	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	248	11	25	\N	\N	\N	12	\N	[]	19252
19256	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	51	11	25	\N	\N	\N	12	\N	[]	19252
19252	2022-03-25 17:44:08	2022-03-25 17:44:08	267	23.\tRB Staphorst 1\tRB Staphorst\t2:29.17	App\\Models\\RelayTeam	196	11	25	\N	14917	26	12	\N	[]	\N
19258	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	68	11	25	\N	\N	\N	12	\N	[]	19257
19259	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	815	11	25	\N	\N	\N	12	\N	[]	19257
19260	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	239	11	25	\N	\N	\N	12	\N	[]	19257
19261	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	812	11	25	\N	\N	\N	12	\N	[]	19257
19257	2022-03-25 17:44:08	2022-03-25 17:44:08	274	24.\tDLRG Gütersloh 1\tDLRG Guetersloh\t2:33.11	App\\Models\\RelayTeam	197	11	25	\N	15311	3220	12	\N	[]	\N
19263	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	581	11	25	\N	\N	\N	12	\N	[]	19262
19264	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	890	11	25	\N	\N	\N	12	\N	[]	19262
19265	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	891	11	25	\N	\N	\N	12	\N	[]	19262
19266	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	108	11	25	\N	\N	\N	12	\N	[]	19262
19262	2022-03-25 17:44:08	2022-03-25 17:44:08	276	25.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t2:33.52	App\\Models\\RelayTeam	198	11	25	\N	15352	39	12	\N	[]	\N
19268	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	892	11	25	\N	\N	\N	12	\N	[]	19267
19269	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	72	11	25	\N	\N	\N	12	\N	[]	19267
19270	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	814	11	25	\N	\N	\N	12	\N	[]	19267
19271	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	245	11	25	\N	\N	\N	12	\N	[]	19267
19267	2022-03-25 17:44:08	2022-03-25 17:44:08	278	26.\tRB Echt 2\tRB Echt\t2:40.02	App\\Models\\RelayTeam	199	11	25	\N	16002	15	12	\N	[]	\N
19273	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	893	11	25	\N	\N	\N	12	\N	[]	19272
19274	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	894	11	25	\N	\N	\N	12	\N	[]	19272
19275	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	895	11	25	\N	\N	\N	12	\N	[]	19272
19276	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	896	11	25	\N	\N	\N	12	\N	[]	19272
19272	2022-03-25 17:44:08	2022-03-25 17:44:08	284	1.\tHungarian NT 1\tHungarian NT\t1:38.42	App\\Models\\RelayTeam	200	11	25	\N	9842	3233	12	\N	[]	\N
6546	2022-02-19 13:27:45	2022-02-19 13:27:45	42	3.\tOPPERMAN, Bianca\t02\tSouth Africa\t2:23.82	App\\Models\\Athlete	612	1	1	\N	14382	232	2	7	[]	\N
19278	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	442	11	25	\N	\N	\N	12	\N	[]	19277
19279	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	255	11	25	\N	\N	\N	12	\N	[]	19277
19280	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	897	11	25	\N	\N	\N	12	\N	[]	19277
19281	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	668	11	25	\N	\N	\N	12	\N	[]	19277
19277	2022-03-25 17:44:08	2022-03-25 17:44:08	286	2.\tItaly NT 1\tItaly NT\t1:39.12	App\\Models\\RelayTeam	201	11	25	\N	9912	3201	12	\N	[]	\N
19283	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	898	11	25	\N	\N	\N	12	\N	[]	19282
19284	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	268	11	25	\N	\N	\N	12	\N	[]	19282
19285	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	899	11	25	\N	\N	\N	12	\N	[]	19282
19286	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	900	11	25	\N	\N	\N	12	\N	[]	19282
19282	2022-03-25 17:44:08	2022-03-25 17:44:08	288	3.\tSpain NT 2\tSpain NT\t1:41.40	App\\Models\\RelayTeam	202	11	25	\N	10140	3204	12	\N	[]	\N
19288	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	901	11	25	\N	\N	\N	12	\N	[]	19287
19289	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	254	11	25	\N	\N	\N	12	\N	[]	19287
19290	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	902	11	25	\N	\N	\N	12	\N	[]	19287
19291	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	903	11	25	\N	\N	\N	12	\N	[]	19287
19287	2022-03-25 17:44:08	2022-03-25 17:44:08	290	4.\tItaly NT 2\tItaly NT\t1:41.83	App\\Models\\RelayTeam	203	11	25	\N	10183	3201	12	\N	[]	\N
19293	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	904	11	25	\N	\N	\N	12	\N	[]	19292
19294	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	905	11	25	\N	\N	\N	12	\N	[]	19292
19295	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	906	11	25	\N	\N	\N	12	\N	[]	19292
19296	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	907	11	25	\N	\N	\N	12	\N	[]	19292
19292	2022-03-25 17:44:08	2022-03-25 17:44:08	292	5.\tPolen NT 1\tPolen NT\t1:41.94	App\\Models\\RelayTeam	204	11	25	\N	10194	3234	12	\N	[]	\N
19298	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	908	11	25	\N	\N	\N	12	\N	[]	19297
19299	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	267	11	25	\N	\N	\N	12	\N	[]	19297
19300	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	909	11	25	\N	\N	\N	12	\N	[]	19297
19301	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	829	11	25	\N	\N	\N	12	\N	[]	19297
19297	2022-03-25 17:44:08	2022-03-25 17:44:08	294	6.\tSpain NT 1\tSpain NT\t1:45.89	App\\Models\\RelayTeam	205	11	25	\N	10589	3204	12	\N	[]	\N
19303	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	910	11	25	\N	\N	\N	12	\N	[]	19302
19304	2022-03-25 17:44:08	2022-03-25 17:44:08	\N	\N	App\\Models\\Athlete	911	11	25	\N	\N	\N	12	\N	[]	19302
19305	2022-03-25 17:44:08	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	912	11	25	\N	\N	\N	12	\N	[]	19302
19306	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	913	11	25	\N	\N	\N	12	\N	[]	19302
19302	2022-03-25 17:44:08	2022-03-25 17:44:09	296	7.\tFrance NT 2\tFrance NT\t1:46.57	App\\Models\\RelayTeam	206	11	25	\N	10657	3205	12	\N	[]	\N
19308	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	914	11	25	\N	\N	\N	12	\N	[]	19307
19309	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	915	11	25	\N	\N	\N	12	\N	[]	19307
19310	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	835	11	25	\N	\N	\N	12	\N	[]	19307
19311	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	832	11	25	\N	\N	\N	12	\N	[]	19307
19307	2022-03-25 17:44:09	2022-03-25 17:44:09	298	8.\tASD Gorizia Nuoto 1\tASD Gorizia Nuoto\t1:47.46	App\\Models\\RelayTeam	207	11	25	\N	10746	3224	12	\N	[]	\N
19313	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	916	11	25	\N	\N	\N	12	\N	[]	19312
19314	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	917	11	25	\N	\N	\N	12	\N	[]	19312
19315	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	918	11	25	\N	\N	\N	12	\N	[]	19312
19316	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	830	11	25	\N	\N	\N	12	\N	[]	19312
19312	2022-03-25 17:44:09	2022-03-25 17:44:09	300	9.\tSAFA 2000 1\tSAFA 2000\t1:47.99	App\\Models\\RelayTeam	208	11	25	\N	10799	3202	12	\N	[]	\N
19318	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	919	11	25	\N	\N	\N	12	\N	[]	19317
19319	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	920	11	25	\N	\N	\N	12	\N	[]	19317
19320	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	921	11	25	\N	\N	\N	12	\N	[]	19317
19321	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	922	11	25	\N	\N	\N	12	\N	[]	19317
19317	2022-03-25 17:44:09	2022-03-25 17:44:09	302	10.\tA.S.D. Sportiva Sturla 1\tA.S.D. Sportiva Sturla\t1:48.95	App\\Models\\RelayTeam	209	11	25	\N	10895	3235	12	\N	[]	\N
19323	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	847	11	25	\N	\N	\N	12	\N	[]	19322
19324	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	133	11	25	\N	\N	\N	12	\N	[]	19322
19325	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	289	11	25	\N	\N	\N	12	\N	[]	19322
19326	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	851	11	25	\N	\N	\N	12	\N	[]	19322
19322	2022-03-25 17:44:09	2022-03-25 17:44:09	304	11.\tAthena Bracciano 1\tAthena Bracciano\t1:49.18	App\\Models\\RelayTeam	210	11	25	\N	10918	3210	12	\N	[]	\N
19328	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	846	11	25	\N	\N	\N	12	\N	[]	19327
19329	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	923	11	25	\N	\N	\N	12	\N	[]	19327
19330	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	924	11	25	\N	\N	\N	12	\N	[]	19327
19331	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	925	11	25	\N	\N	\N	12	\N	[]	19327
19327	2022-03-25 17:44:09	2022-03-25 17:44:09	306	12.\tDLRG Luckenwalde 1\tDLRG Luckenwalde\t1:49.74	App\\Models\\RelayTeam	211	11	25	\N	10974	3225	12	\N	[]	\N
19333	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	926	11	25	\N	\N	\N	12	\N	[]	19332
19334	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	274	11	25	\N	\N	\N	12	\N	[]	19332
19335	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	272	11	25	\N	\N	\N	12	\N	[]	19332
19336	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	587	11	25	\N	\N	\N	12	\N	[]	19332
19332	2022-03-25 17:44:09	2022-03-25 17:44:09	308	13.\tASD Rosetana Nuoto 1\tASD Rosetana Nuoto\t1:50.99	App\\Models\\RelayTeam	212	11	25	\N	11099	3215	12	\N	[]	\N
19338	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	831	11	25	\N	\N	\N	12	\N	[]	19337
19339	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	927	11	25	\N	\N	\N	12	\N	[]	19337
19340	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	833	11	25	\N	\N	\N	12	\N	[]	19337
19341	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	928	11	25	\N	\N	\N	12	\N	[]	19337
19337	2022-03-25 17:44:09	2022-03-25 17:44:09	310	14.\tCKS Szczecin 1\tCKS Szczecin\t1:51.30	App\\Models\\RelayTeam	213	11	25	\N	11130	3227	12	\N	[]	\N
19343	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	283	11	25	\N	\N	\N	12	\N	[]	19342
19344	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	282	11	25	\N	\N	\N	12	\N	[]	19342
19345	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	929	11	25	\N	\N	\N	12	\N	[]	19342
19346	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	284	11	25	\N	\N	\N	12	\N	[]	19342
19342	2022-03-25 17:44:09	2022-03-25 17:44:09	312	15.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t1:51.40	App\\Models\\RelayTeam	214	11	25	\N	11140	3219	12	\N	[]	\N
19348	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	930	11	25	\N	\N	\N	12	\N	[]	19347
19349	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	931	11	25	\N	\N	\N	12	\N	[]	19347
19350	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	932	11	25	\N	\N	\N	12	\N	[]	19347
19351	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	933	11	25	\N	\N	\N	12	\N	[]	19347
19347	2022-03-25 17:44:09	2022-03-25 17:44:09	314	16.\tFrance NT 1\tFrance NT\t1:54.12	App\\Models\\RelayTeam	215	11	25	\N	11412	3205	12	\N	[]	\N
19353	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	299	11	25	\N	\N	\N	12	\N	[]	19352
19354	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	298	11	25	\N	\N	\N	12	\N	[]	19352
19355	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	934	11	25	\N	\N	\N	12	\N	[]	19352
19356	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	935	11	25	\N	\N	\N	12	\N	[]	19352
19352	2022-03-25 17:44:09	2022-03-25 17:44:09	316	17.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t1:54.27	App\\Models\\RelayTeam	216	11	25	\N	11427	3203	12	\N	[]	\N
19358	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	936	11	25	\N	\N	\N	12	\N	[]	19357
19359	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	937	11	25	\N	\N	\N	12	\N	[]	19357
19360	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	938	11	25	\N	\N	\N	12	\N	[]	19357
19361	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	939	11	25	\N	\N	\N	12	\N	[]	19357
19357	2022-03-25 17:44:09	2022-03-25 17:44:09	318	18.\tMKS Szczecin 1\tMKS Szczecin\t1:56.54	App\\Models\\RelayTeam	217	11	25	\N	11654	3236	12	\N	[]	\N
19363	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	326	11	25	\N	\N	\N	12	\N	[]	19362
19364	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	850	11	25	\N	\N	\N	12	\N	[]	19362
19365	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	676	11	25	\N	\N	\N	12	\N	[]	19362
19366	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	855	11	25	\N	\N	\N	12	\N	[]	19362
19362	2022-03-25 17:44:09	2022-03-25 17:44:09	325	19.\tDLRG Buchholz United 1\tDLRG Buchholz United\t1:56.94	App\\Models\\RelayTeam	218	11	25	\N	11694	3230	12	\N	[]	\N
19368	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	940	11	25	\N	\N	\N	12	\N	[]	19367
19369	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	290	11	25	\N	\N	\N	12	\N	[]	19367
19370	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	292	11	25	\N	\N	\N	12	\N	[]	19367
19371	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	941	11	25	\N	\N	\N	12	\N	[]	19367
19367	2022-03-25 17:44:09	2022-03-25 17:44:09	327	20.\tAthena Salvamento 1\tAthena Salvamento\t1:57.23	App\\Models\\RelayTeam	219	11	25	\N	11723	3213	12	\N	[]	\N
19373	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	839	11	25	\N	\N	\N	12	\N	[]	19372
19374	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	942	11	25	\N	\N	\N	12	\N	[]	19372
19375	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	943	11	25	\N	\N	\N	12	\N	[]	19372
19376	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	944	11	25	\N	\N	\N	12	\N	[]	19372
19372	2022-03-25 17:44:09	2022-03-25 17:44:09	329	21.\tSlaskie WOPR 1\tSlaskie WOPR\t1:57.45	App\\Models\\RelayTeam	220	11	25	\N	11745	3211	12	\N	[]	\N
19378	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	135	11	25	\N	\N	\N	12	\N	[]	19377
19379	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	280	11	25	\N	\N	\N	12	\N	[]	19377
19380	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	154	11	25	\N	\N	\N	12	\N	[]	19377
7571	2022-02-19 13:27:51	2022-02-19 13:27:51	1626	19.\tBORN, Paul\t99\tDLRG Nieder-Olm/Woerrstadt\t2:35.22	App\\Models\\Athlete	455	1	6	\N	15522	249	2	8	[]	\N
19381	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	306	11	25	\N	\N	\N	12	\N	[]	19377
19377	2022-03-25 17:44:09	2022-03-25 17:44:09	331	22.\tRB Echt 1\tRB Echt\t1:57.63	App\\Models\\RelayTeam	221	11	25	\N	11763	15	12	\N	[]	\N
19383	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	945	11	25	\N	\N	\N	12	\N	[]	19382
19384	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	946	11	25	\N	\N	\N	12	\N	[]	19382
19385	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	947	11	25	\N	\N	\N	12	\N	[]	19382
19386	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	948	11	25	\N	\N	\N	12	\N	[]	19382
19382	2022-03-25 17:44:09	2022-03-25 17:44:09	333	23.\tDLRG Nordrhein-Westfalen 2\tDLRG Nordrhein-Westfalen\t2:01.23	App\\Models\\RelayTeam	222	11	25	\N	12123	3219	12	\N	[]	\N
19388	2022-03-25 17:44:09	2022-03-25 17:44:09	\N	\N	App\\Models\\Athlete	949	11	25	\N	\N	\N	12	\N	[]	19387
19389	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	950	11	25	\N	\N	\N	12	\N	[]	19387
19390	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	951	11	25	\N	\N	\N	12	\N	[]	19387
19391	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	952	11	25	\N	\N	\N	12	\N	[]	19387
19387	2022-03-25 17:44:09	2022-03-25 17:44:10	335	24.\tAthena Bracciano 2\tAthena Bracciano\t2:01.92	App\\Models\\RelayTeam	223	11	25	\N	12192	3210	12	\N	[]	\N
19393	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	953	11	25	\N	\N	\N	12	\N	[]	19392
19394	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	337	11	25	\N	\N	\N	12	\N	[]	19392
19395	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	338	11	25	\N	\N	\N	12	\N	[]	19392
19396	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	340	11	25	\N	\N	\N	12	\N	[]	19392
19392	2022-03-25 17:44:10	2022-03-25 17:44:10	337	25.\tDLRG Alpen 1\tDLRG Alpen\t2:03.09	App\\Models\\RelayTeam	224	11	25	\N	12309	261	12	\N	[]	\N
19398	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	954	11	25	\N	\N	\N	12	\N	[]	19397
19399	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	955	11	25	\N	\N	\N	12	\N	[]	19397
19400	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	956	11	25	\N	\N	\N	12	\N	[]	19397
19401	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	957	11	25	\N	\N	\N	12	\N	[]	19397
19397	2022-03-25 17:44:10	2022-03-25 17:44:10	339	26.\tAccademia Di Salvamento 2\tAccademia Di Salvamento\t2:03.38	App\\Models\\RelayTeam	225	11	25	\N	12338	3203	12	\N	[]	\N
19403	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	958	11	25	\N	\N	\N	12	\N	[]	19402
19404	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	959	11	25	\N	\N	\N	12	\N	[]	19402
19405	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	309	11	25	\N	\N	\N	12	\N	[]	19402
19406	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	308	11	25	\N	\N	\N	12	\N	[]	19402
19402	2022-03-25 17:44:10	2022-03-25 17:44:10	341	27.\tRB Echt 2\tRB Echt\t2:04.09	App\\Models\\RelayTeam	226	11	25	\N	12409	15	12	\N	[]	\N
19408	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	960	11	25	\N	\N	\N	12	\N	[]	19407
19409	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	961	11	25	\N	\N	\N	12	\N	[]	19407
19410	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	962	11	25	\N	\N	\N	12	\N	[]	19407
19411	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	333	11	25	\N	\N	\N	12	\N	[]	19407
19407	2022-03-25 17:44:10	2022-03-25 17:44:10	343	28.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t2:08.12	App\\Models\\RelayTeam	227	11	25	\N	12812	39	12	\N	[]	\N
19413	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	963	11	25	\N	\N	\N	12	\N	[]	19412
19414	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	964	11	25	\N	\N	\N	12	\N	[]	19412
19415	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	965	11	25	\N	\N	\N	12	\N	[]	19412
19416	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	966	11	25	\N	\N	\N	12	\N	[]	19412
19412	2022-03-25 17:44:10	2022-03-25 17:44:10	345	29.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t2:10.86	App\\Models\\RelayTeam	228	11	25	\N	13086	3212	12	\N	[]	\N
19418	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	967	11	25	\N	\N	\N	12	\N	[]	19417
19419	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	351	11	25	\N	\N	\N	12	\N	[]	19417
19420	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	968	11	25	\N	\N	\N	12	\N	[]	19417
19421	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	350	11	25	\N	\N	\N	12	\N	[]	19417
19417	2022-03-25 17:44:10	2022-03-25 17:44:10	347	30.\tRB Staphorst 1\tRB Staphorst\t2:23.16	App\\Models\\RelayTeam	229	11	25	\N	14316	26	12	\N	[]	\N
19422	2022-03-25 17:44:10	2022-03-25 17:44:10	349	DSQ\tRB Waddinxveen 1\tRB Waddinxveen	App\\Models\\RelayTeam	230	11	25	1	\N	3231	12	\N	[]	\N
19423	2022-03-25 17:44:10	2022-03-25 17:44:10	352	DNS\tRB Delft 1\tRB Delft	App\\Models\\RelayTeam	231	11	25	2	\N	3221	12	\N	[]	\N
19424	2022-03-25 17:44:10	2022-03-25 17:44:10	353	DNS\tRB Gouda 1\tRB Gouda	App\\Models\\RelayTeam	232	11	25	2	\N	17	12	\N	[]	\N
19426	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	368	11	20	\N	\N	\N	12	\N	[]	19425
19427	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	207	11	20	\N	\N	\N	12	\N	[]	19425
19425	2022-03-25 17:44:10	2022-03-25 17:44:10	358	1.\tRB Dordrecht 1\tRB Dordrecht\t12.81	App\\Models\\RelayTeam	233	11	20	\N	1281	13	12	\N	[]	\N
19429	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	969	11	20	\N	\N	\N	12	\N	[]	19428
19430	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	869	11	20	\N	\N	\N	12	\N	[]	19428
6547	2022-02-19 13:27:45	2022-02-19 13:27:45	43	4.\tBRINK, Celine\t00\tRB Dordrecht\t2:32.15	App\\Models\\Athlete	94	1	1	\N	15215	13	2	7	[]	\N
19428	2022-03-25 17:44:10	2022-03-25 17:44:10	360	2.\tBelgium NT 1\tBelgium NT\t15.25	App\\Models\\RelayTeam	179	11	20	\N	1525	3206	12	\N	[]	\N
19432	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	865	11	20	\N	\N	\N	12	\N	[]	19431
19433	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	970	11	20	\N	\N	\N	12	\N	[]	19431
19431	2022-03-25 17:44:10	2022-03-25 17:44:10	362	3.\tSpain NT 2\tSpain NT\t15.91	App\\Models\\RelayTeam	177	11	20	\N	1591	3204	12	\N	[]	\N
19435	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	363	11	20	\N	\N	\N	12	\N	[]	19434
19436	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	882	11	20	\N	\N	\N	12	\N	[]	19434
19434	2022-03-25 17:44:10	2022-03-25 17:44:10	364	4.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t16.50	App\\Models\\RelayTeam	192	11	20	\N	1650	3212	12	\N	[]	\N
19438	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	866	11	20	\N	\N	\N	12	\N	[]	19437
19439	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	867	11	20	\N	\N	\N	12	\N	[]	19437
19437	2022-03-25 17:44:10	2022-03-25 17:44:10	366	5.\tFrance NT 1\tFrance NT\t17.02	App\\Models\\RelayTeam	178	11	20	\N	1702	3205	12	\N	[]	\N
19441	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	883	11	20	\N	\N	\N	12	\N	[]	19440
19442	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	47	11	20	\N	\N	\N	12	\N	[]	19440
19440	2022-03-25 17:44:10	2022-03-25 17:44:10	368	6.\tDLRG Alpen 1\tDLRG Alpen\t18.28	App\\Models\\RelayTeam	193	11	20	\N	1828	261	12	\N	[]	\N
19444	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	372	11	20	\N	\N	\N	12	\N	[]	19443
19445	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	734	11	20	\N	\N	\N	12	\N	[]	19443
19443	2022-03-25 17:44:10	2022-03-25 17:44:10	375	7.\tRB Dordrecht 2\tRB Dordrecht\t18.46	App\\Models\\RelayTeam	234	11	20	\N	1846	13	12	\N	[]	\N
19447	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	794	11	20	\N	\N	\N	12	\N	[]	19446
19448	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	807	11	20	\N	\N	\N	12	\N	[]	19446
19446	2022-03-25 17:44:10	2022-03-25 17:44:10	377	8.\tDLRG Niedersachsen 2\tDLRG Niedersachsen\t18.79	App\\Models\\RelayTeam	189	11	20	\N	1879	3212	12	\N	[]	\N
19450	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	871	11	20	\N	\N	\N	12	\N	[]	19449
19451	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	790	11	20	\N	\N	\N	12	\N	[]	19449
19449	2022-03-25 17:44:10	2022-03-25 17:44:10	379	9.\tDLRG Sachsen-Anhalt 1\tDLRG Sachsen-Anhalt\t19.31	App\\Models\\RelayTeam	182	11	20	\N	1931	3209	12	\N	[]	\N
19453	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	881	11	20	\N	\N	\N	12	\N	[]	19452
19454	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	60	11	20	\N	\N	\N	12	\N	[]	19452
19452	2022-03-25 17:44:10	2022-03-25 17:44:10	381	10.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t19.38	App\\Models\\RelayTeam	188	11	20	\N	1938	3219	12	\N	[]	\N
19456	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	971	11	20	\N	\N	\N	12	\N	[]	19455
19457	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	108	11	20	\N	\N	\N	12	\N	[]	19455
19455	2022-03-25 17:44:10	2022-03-25 17:44:10	383	11.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t19.78	App\\Models\\RelayTeam	198	11	20	\N	1978	39	12	\N	[]	\N
19459	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	55	11	20	\N	\N	\N	12	\N	[]	19458
19460	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	972	11	20	\N	\N	\N	12	\N	[]	19458
19458	2022-03-25 17:44:10	2022-03-25 17:44:10	385	12.\tRB Heytse 2\tRB Heytse\t19.92	App\\Models\\RelayTeam	235	11	20	\N	1992	3229	12	\N	[]	\N
19462	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	878	11	20	\N	\N	\N	12	\N	[]	19461
19463	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	877	11	20	\N	\N	\N	12	\N	[]	19461
19461	2022-03-25 17:44:10	2022-03-25 17:44:10	387	13.\tCKS Szczecin 1\tCKS Szczecin\t20.59	App\\Models\\RelayTeam	185	11	20	\N	2059	3227	12	\N	[]	\N
19465	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	973	11	20	\N	\N	\N	12	\N	[]	19464
19466	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	974	11	20	\N	\N	\N	12	\N	[]	19464
19464	2022-03-25 17:44:10	2022-03-25 17:44:10	389	14.\tAthena Bracciano 2\tAthena Bracciano\t21.56	App\\Models\\RelayTeam	191	11	20	\N	2156	3210	12	\N	[]	\N
19468	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	816	11	20	\N	\N	\N	12	\N	[]	19467
19469	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	975	11	20	\N	\N	\N	12	\N	[]	19467
19467	2022-03-25 17:44:10	2022-03-25 17:44:10	391	15.\tRB Oss 2\tRB Oss\t23.03	App\\Models\\RelayTeam	236	11	20	\N	2303	43	12	\N	[]	\N
19471	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	92	11	20	\N	\N	\N	12	\N	[]	19470
19472	2022-03-25 17:44:10	2022-03-25 17:44:10	\N	\N	App\\Models\\Athlete	788	11	20	\N	\N	\N	12	\N	[]	19470
19470	2022-03-25 17:44:10	2022-03-25 17:44:10	393	16.\tKusel ChiXXX\tKusel KiXXX\t26.84	App\\Models\\RelayTeam	237	11	20	\N	2684	3207	12	\N	[]	\N
19474	2022-03-25 17:44:10	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	722	11	20	\N	\N	\N	12	\N	[]	19473
19475	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	641	11	20	\N	\N	\N	12	\N	[]	19473
19473	2022-03-25 17:44:10	2022-03-25 17:44:11	395	17.\tRB Oss 3\tRB Oss\t27.44	App\\Models\\RelayTeam	238	11	20	\N	2744	43	12	\N	[]	\N
19477	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	814	11	20	\N	\N	\N	12	\N	[]	19476
19478	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	72	11	20	\N	\N	\N	12	\N	[]	19476
19476	2022-03-25 17:44:11	2022-03-25 17:44:11	397	18.\tRB Echt 3\tRB Echt\t34.50	App\\Models\\RelayTeam	239	11	20	\N	3450	15	12	\N	[]	\N
19480	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	885	11	20	\N	\N	\N	12	\N	[]	19479
19481	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	810	11	20	\N	\N	\N	12	\N	[]	19479
19479	2022-03-25 17:44:11	2022-03-25 17:44:11	399	19.\tAthena Salvamento 1\tAthena Salvamento\t38.46	App\\Models\\RelayTeam	194	11	20	\N	3846	3213	12	\N	[]	\N
19483	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	371	11	20	\N	\N	\N	12	\N	[]	19482
19484	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	863	11	20	\N	\N	\N	12	\N	[]	19482
19482	2022-03-25 17:44:11	2022-03-25 17:44:11	401	20.\tItaly NT 1\tItaly NT\t41.53	App\\Models\\RelayTeam	176	11	20	\N	4153	3201	12	\N	[]	\N
19486	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	249	11	20	\N	\N	\N	12	\N	[]	19485
19487	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	889	11	20	\N	\N	\N	12	\N	[]	19485
19485	2022-03-25 17:44:11	2022-03-25 17:44:11	403	21.\tRB Staphorst 1\tRB Staphorst\t44.79	App\\Models\\RelayTeam	196	11	20	\N	4479	26	12	\N	[]	\N
19489	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	26	11	20	\N	\N	\N	12	\N	[]	19488
19490	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	243	11	20	\N	\N	\N	12	\N	[]	19488
19488	2022-03-25 17:44:11	2022-03-25 17:44:11	405	22.\tRB Echt 1\tRB Echt\t45.12	App\\Models\\RelayTeam	190	11	20	\N	4512	15	12	\N	[]	\N
19491	2022-03-25 17:44:11	2022-03-25 17:44:11	407	DNS\tRB Oss 1\tRB Oss	App\\Models\\RelayTeam	240	11	20	2	\N	43	12	\N	[]	\N
19492	2022-03-25 17:44:11	2022-03-25 17:44:11	408	DNF\tA.S.D. Sportiva Sturla 1\tA.S.D. Sportiva Sturla	App\\Models\\RelayTeam	241	11	20	3	\N	\N	12	\N	[]	\N
19493	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	976	11	20	\N	\N	\N	12	\N	[]	19492
19494	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	828	11	20	\N	\N	\N	12	\N	[]	19492
19496	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	977	11	20	\N	\N	\N	12	\N	[]	19495
19497	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	809	11	20	\N	\N	\N	12	\N	[]	19495
19495	2022-03-25 17:44:11	2022-03-25 17:44:11	410	DNF\tAccademia Di Salvamento 1\tAccademia Di Salvamento	App\\Models\\RelayTeam	187	11	20	3	\N	3203	12	\N	[]	\N
19499	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	10	11	20	\N	\N	\N	12	\N	[]	19498
19500	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	196	11	20	\N	\N	\N	12	\N	[]	19498
19498	2022-03-25 17:44:11	2022-03-25 17:44:11	412	DNF\tAccademia Di Salvamento 2\tAccademia Di Salvamento	App\\Models\\RelayTeam	242	11	20	3	\N	3203	12	\N	[]	\N
19502	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	23	11	20	\N	\N	\N	12	\N	[]	19501
19503	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	395	11	20	\N	\N	\N	12	\N	[]	19501
19501	2022-03-25 17:44:11	2022-03-25 17:44:11	414	DNF\tAccademia Di Salvamento 3\tAccademia Di Salvamento	App\\Models\\RelayTeam	243	11	20	3	\N	3203	12	\N	[]	\N
19505	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	808	11	20	\N	\N	\N	12	\N	[]	19504
19506	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	887	11	20	\N	\N	\N	12	\N	[]	19504
19504	2022-03-25 17:44:11	2022-03-25 17:44:11	416	DNF\tAthena Salvamento 2\tAthena Salvamento	App\\Models\\RelayTeam	195	11	20	3	\N	3213	12	\N	[]	\N
19508	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	796	11	20	\N	\N	\N	12	\N	[]	19507
19509	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	97	11	20	\N	\N	\N	12	\N	[]	19507
19507	2022-03-25 17:44:11	2022-03-25 17:44:11	418	DNF\tAthena Bracciano 1\tAthena Bracciano	App\\Models\\RelayTeam	183	11	20	3	\N	3210	12	\N	[]	\N
19511	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	978	11	20	\N	\N	\N	12	\N	[]	19510
19512	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	758	11	20	\N	\N	\N	12	\N	[]	19510
19510	2022-03-25 17:44:11	2022-03-25 17:44:11	420	DNF\tItaly NT 2\tItaly NT	App\\Models\\RelayTeam	175	11	20	3	\N	3201	12	\N	[]	\N
19514	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	186	11	20	\N	\N	\N	12	\N	[]	19513
19515	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	86	11	20	\N	\N	\N	12	\N	[]	19513
19513	2022-03-25 17:44:11	2022-03-25 17:44:11	422	DNF\tSpain NT 1\tSpain NT	App\\Models\\RelayTeam	181	11	20	3	\N	3204	12	\N	[]	\N
19517	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	979	11	20	\N	\N	\N	12	\N	[]	19516
19518	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	980	11	20	\N	\N	\N	12	\N	[]	19516
19516	2022-03-25 17:44:11	2022-03-25 17:44:11	429	DNF\tRB Echt 2\tRB Echt	App\\Models\\RelayTeam	199	11	20	3	\N	15	12	\N	[]	\N
19520	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	245	11	20	\N	\N	\N	12	\N	[]	19519
19521	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	892	11	20	\N	\N	\N	12	\N	[]	19519
19519	2022-03-25 17:44:11	2022-03-25 17:44:11	431	DNF\tRB Echt 5\tRB Echt	App\\Models\\RelayTeam	244	11	20	3	\N	15	12	\N	[]	\N
19523	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	238	11	20	\N	\N	\N	12	\N	[]	19522
19524	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	35	11	20	\N	\N	\N	12	\N	[]	19522
19522	2022-03-25 17:44:11	2022-03-25 17:44:11	433	DNF\tRB Echt 4\tRB Echt	App\\Models\\RelayTeam	245	11	20	3	\N	15	12	\N	[]	\N
19526	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	873	11	20	\N	\N	\N	12	\N	[]	19525
19527	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	874	11	20	\N	\N	\N	12	\N	[]	19525
19525	2022-03-25 17:44:11	2022-03-25 17:44:11	435	DNF\tFrance NT 2\tFrance NT	App\\Models\\RelayTeam	184	11	20	3	\N	3205	12	\N	[]	\N
19529	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	981	11	20	\N	\N	\N	12	\N	[]	19528
19528	2022-03-25 17:44:11	2022-03-25 17:44:11	437	DNF\tLiège Sauvetage Club 2\tLiege Sauvetage Club	App\\Models\\RelayTeam	246	11	20	3	\N	3237	12	\N	[]	\N
6548	2022-02-19 13:27:45	2022-02-19 13:27:45	44	5.\tVAN RENSBURG, Dehanke\t01\tSouth Africa\t2:32.30	App\\Models\\Athlete	613	1	1	\N	15230	232	2	7	[]	\N
19530	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	982	11	20	\N	\N	\N	12	\N	[]	19528
19532	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	30	11	20	\N	\N	\N	12	\N	[]	19531
19533	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	208	11	20	\N	\N	\N	12	\N	[]	19531
19531	2022-03-25 17:44:11	2022-03-25 17:44:11	439	DNF\tNederland NT 1\tNederland NT	App\\Models\\RelayTeam	180	11	20	3	\N	3218	12	\N	[]	\N
19535	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	983	11	20	\N	\N	\N	12	\N	[]	19534
19536	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	879	11	20	\N	\N	\N	12	\N	[]	19534
19534	2022-03-25 17:44:11	2022-03-25 17:44:11	441	DNF\tSlaskie WOPR 1\tSlaskie WOPR	App\\Models\\RelayTeam	186	11	20	3	\N	3211	12	\N	[]	\N
19538	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	792	11	20	\N	\N	\N	12	\N	[]	19537
19539	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	880	11	20	\N	\N	\N	12	\N	[]	19537
19537	2022-03-25 17:44:11	2022-03-25 17:44:11	443	DNF\tSlaskie WOPR 2\tSlaskie WOPR	App\\Models\\RelayTeam	247	11	20	3	\N	3211	12	\N	[]	\N
19541	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	239	11	20	\N	\N	\N	12	\N	[]	19540
19542	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	812	11	20	\N	\N	\N	12	\N	[]	19540
19540	2022-03-25 17:44:11	2022-03-25 17:44:11	445	DNF\tDLRG Gütersloh 1\tDLRG Guetersloh	App\\Models\\RelayTeam	197	11	20	3	\N	3220	12	\N	[]	\N
19544	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	204	11	20	\N	\N	\N	12	\N	[]	19543
19545	2022-03-25 17:44:11	2022-03-25 17:44:11	\N	\N	App\\Models\\Athlete	203	11	20	\N	\N	\N	12	\N	[]	19543
19543	2022-03-25 17:44:11	2022-03-25 17:44:11	447	DNF\tDLRG Nordrhein-Westfalen 2\tDLRG Nordrhein-Westfalen	App\\Models\\RelayTeam	248	11	20	3	\N	3219	12	\N	[]	\N
19547	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	285	11	20	\N	\N	\N	12	\N	[]	19546
19548	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	383	11	20	\N	\N	\N	12	\N	[]	19546
19546	2022-03-25 17:44:12	2022-03-25 17:44:12	455	1.\tDLRG Gütersloh 1\tDLRG Guetersloh\t11.44	App\\Models\\RelayTeam	249	11	20	\N	1144	3220	12	\N	[]	\N
19550	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	307	11	20	\N	\N	\N	12	\N	[]	19549
19551	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	306	11	20	\N	\N	\N	12	\N	[]	19549
19549	2022-03-25 17:44:12	2022-03-25 17:44:12	457	2.\tRB Echt 3\tRB Echt\t12.50	App\\Models\\RelayTeam	250	11	20	\N	1250	15	12	\N	[]	\N
19553	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	984	11	20	\N	\N	\N	12	\N	[]	19552
19554	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	985	11	20	\N	\N	\N	12	\N	[]	19552
19552	2022-03-25 17:44:12	2022-03-25 17:44:12	459	3.\tDLRG Sachsen-Anhalt 1\tDLRG Sachsen-Anhalt\t12.81	App\\Models\\RelayTeam	251	11	20	\N	1281	3209	12	\N	[]	\N
19556	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	911	11	20	\N	\N	\N	12	\N	[]	19555
19557	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	913	11	20	\N	\N	\N	12	\N	[]	19555
19555	2022-03-25 17:44:12	2022-03-25 17:44:12	461	4.\tFrance NT 2\tFrance NT\t12.93	App\\Models\\RelayTeam	206	11	20	\N	1293	3205	12	\N	[]	\N
19559	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	154	11	20	\N	\N	\N	12	\N	[]	19558
19560	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	280	11	20	\N	\N	\N	12	\N	[]	19558
19558	2022-03-25 17:44:12	2022-03-25 17:44:12	463	5.\tRB Echt 5\tRB Echt\t13.03	App\\Models\\RelayTeam	252	11	20	\N	1303	15	12	\N	[]	\N
19562	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	901	11	20	\N	\N	\N	12	\N	[]	19561
19563	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	254	11	20	\N	\N	\N	12	\N	[]	19561
19561	2022-03-25 17:44:12	2022-03-25 17:44:12	465	6.\tItaly NT 2\tItaly NT\t13.75	App\\Models\\RelayTeam	203	11	20	\N	1375	3201	12	\N	[]	\N
19565	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	830	11	20	\N	\N	\N	12	\N	[]	19564
19566	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	917	11	20	\N	\N	\N	12	\N	[]	19564
19564	2022-03-25 17:44:12	2022-03-25 17:44:12	467	7.\tSAFA 2000 1\tSAFA 2000\t13.81	App\\Models\\RelayTeam	208	11	20	\N	1381	3202	12	\N	[]	\N
19568	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	965	11	20	\N	\N	\N	12	\N	[]	19567
19569	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	966	11	20	\N	\N	\N	12	\N	[]	19567
19567	2022-03-25 17:44:12	2022-03-25 17:44:12	469	8.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t14.64	App\\Models\\RelayTeam	228	11	20	\N	1464	3212	12	\N	[]	\N
19571	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	135	11	20	\N	\N	\N	12	\N	[]	19570
19572	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	149	11	20	\N	\N	\N	12	\N	[]	19570
19570	2022-03-25 17:44:12	2022-03-25 17:44:12	471	9.\tRB Echt 1\tRB Echt\t14.85	App\\Models\\RelayTeam	221	11	20	\N	1485	15	12	\N	[]	\N
19574	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	986	11	20	\N	\N	\N	12	\N	[]	19573
19575	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	959	11	20	\N	\N	\N	12	\N	[]	19573
19573	2022-03-25 17:44:12	2022-03-25 17:44:12	478	10.\tRB Echt 4\tRB Echt\t14.93	App\\Models\\RelayTeam	253	11	20	\N	1493	15	12	\N	[]	\N
19577	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	362	11	20	\N	\N	\N	12	\N	[]	19576
19578	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	849	11	20	\N	\N	\N	12	\N	[]	19576
19576	2022-03-25 17:44:12	2022-03-25 17:44:12	480	DLRG Niedersachsen 2\tDLRG Niedersachsen\t14.93	App\\Models\\RelayTeam	254	11	20	\N	1493	3212	12	\N	[]	\N
19579	2022-03-25 17:44:12	2022-03-25 17:44:12	482	12.\tCKS Szczecin 1\tCKS Szczecin\t15.35	App\\Models\\RelayTeam	213	11	20	\N	1535	3227	12	\N	[]	\N
7572	2022-02-19 13:27:51	2022-02-19 13:27:51	1627	20.\tRAUTENBACH, Kurt\t99\tSouth Africa\t2:36.01	App\\Models\\Athlete	673	1	6	\N	15601	232	2	8	[]	\N
19580	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	831	11	20	\N	\N	\N	12	\N	[]	19579
19581	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	833	11	20	\N	\N	\N	12	\N	[]	19579
19583	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	298	11	20	\N	\N	\N	12	\N	[]	19582
19584	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	299	11	20	\N	\N	\N	12	\N	[]	19582
19582	2022-03-25 17:44:12	2022-03-25 17:44:12	484	13.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t15.97	App\\Models\\RelayTeam	216	11	20	\N	1597	3203	12	\N	[]	\N
19586	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	906	11	20	\N	\N	\N	12	\N	[]	19585
19587	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	907	11	20	\N	\N	\N	12	\N	[]	19585
19585	2022-03-25 17:44:12	2022-03-25 17:44:12	486	14.\tPolen NT 1\tPolen NT\t16.00	App\\Models\\RelayTeam	204	11	20	\N	1600	3234	12	\N	[]	\N
19589	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	987	11	20	\N	\N	\N	12	\N	[]	19588
19590	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	308	11	20	\N	\N	\N	12	\N	[]	19588
19588	2022-03-25 17:44:12	2022-03-25 17:44:12	488	15.\tRB Echt 2\tRB Echt\t16.35	App\\Models\\RelayTeam	226	11	20	\N	1635	15	12	\N	[]	\N
19592	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	841	11	20	\N	\N	\N	12	\N	[]	19591
19593	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	566	11	20	\N	\N	\N	12	\N	[]	19591
19591	2022-03-25 17:44:12	2022-03-25 17:44:12	490	16.\tRB Dordrecht 1\tRB Dordrecht\t16.81	App\\Models\\RelayTeam	255	11	20	\N	1681	13	12	\N	[]	\N
19595	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	587	11	20	\N	\N	\N	12	\N	[]	19594
19596	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	926	11	20	\N	\N	\N	12	\N	[]	19594
19594	2022-03-25 17:44:12	2022-03-25 17:44:12	492	17.\tASD Rosetana Nuoto 1\tASD Rosetana Nuoto\t17.85	App\\Models\\RelayTeam	212	11	20	\N	1785	3215	12	\N	[]	\N
19597	2022-03-25 17:44:12	2022-03-25 17:44:12	494	18.\tRB Dordrecht 2\tRB Dordrecht\t19.07	App\\Models\\RelayTeam	256	11	20	\N	1907	13	12	\N	[]	\N
19599	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	950	11	20	\N	\N	\N	12	\N	[]	19598
19600	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	949	11	20	\N	\N	\N	12	\N	[]	19598
19598	2022-03-25 17:44:12	2022-03-25 17:44:12	496	19.\tAthena Bracciano 2\tAthena Bracciano\t19.10	App\\Models\\RelayTeam	223	11	20	\N	1910	3210	12	\N	[]	\N
19602	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	150	11	20	\N	\N	\N	12	\N	[]	19601
19603	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	392	11	20	\N	\N	\N	12	\N	[]	19601
19601	2022-03-25 17:44:12	2022-03-25 17:44:12	498	20.\tRB Oss 1\tRB Oss\t19.41	App\\Models\\RelayTeam	257	11	20	\N	1941	43	12	\N	[]	\N
19605	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	939	11	20	\N	\N	\N	12	\N	[]	19604
19606	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	937	11	20	\N	\N	\N	12	\N	[]	19604
19604	2022-03-25 17:44:12	2022-03-25 17:44:12	500	21.\tMKS Szczecin 1\tMKS Szczecin\t20.25	App\\Models\\RelayTeam	217	11	20	\N	2025	3236	12	\N	[]	\N
19608	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	941	11	20	\N	\N	\N	12	\N	[]	19607
19609	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	292	11	20	\N	\N	\N	12	\N	[]	19607
19607	2022-03-25 17:44:12	2022-03-25 17:44:12	502	22.\tAthena Salvamento 1\tAthena Salvamento\t21.09	App\\Models\\RelayTeam	219	11	20	\N	2109	3213	12	\N	[]	\N
19611	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	929	11	20	\N	\N	\N	12	\N	[]	19610
19612	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	284	11	20	\N	\N	\N	12	\N	[]	19610
19610	2022-03-25 17:44:12	2022-03-25 17:44:12	504	23.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t21.47	App\\Models\\RelayTeam	214	11	20	\N	2147	3219	12	\N	[]	\N
19614	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	988	11	20	\N	\N	\N	12	\N	[]	19613
19615	2022-03-25 17:44:12	2022-03-25 17:44:12	\N	\N	App\\Models\\Athlete	294	11	20	\N	\N	\N	12	\N	[]	19613
19613	2022-03-25 17:44:12	2022-03-25 17:44:12	506	24.\tRB Gouda 1\tRB Gouda\t22.25	App\\Models\\RelayTeam	232	11	20	\N	2225	17	12	\N	[]	\N
19617	2022-03-25 17:44:12	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	387	11	20	\N	\N	\N	12	\N	[]	19616
19618	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	842	11	20	\N	\N	\N	12	\N	[]	19616
19616	2022-03-25 17:44:12	2022-03-25 17:44:13	508	25.\tBelgium NT 1\tBelgium NT\t25.10	App\\Models\\RelayTeam	258	11	20	\N	2510	3206	12	\N	[]	\N
19620	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	341	11	20	\N	\N	\N	12	\N	[]	19619
19621	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	168	11	20	\N	\N	\N	12	\N	[]	19619
19619	2022-03-25 17:44:13	2022-03-25 17:44:13	510	26.\tRB Delft 1\tRB Delft\t27.63	App\\Models\\RelayTeam	231	11	20	\N	2763	3221	12	\N	[]	\N
19623	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	340	11	20	\N	\N	\N	12	\N	[]	19622
19624	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	338	11	20	\N	\N	\N	12	\N	[]	19622
19622	2022-03-25 17:44:13	2022-03-25 17:44:13	512	27.\tDLRG Alpen 1\tDLRG Alpen\t27.72	App\\Models\\RelayTeam	224	11	20	\N	2772	261	12	\N	[]	\N
19626	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	173	11	20	\N	\N	\N	12	\N	[]	19625
19627	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	174	11	20	\N	\N	\N	12	\N	[]	19625
19625	2022-03-25 17:44:13	2022-03-25 17:44:13	514	28.\tRB Echt 7\tRB Echt\t27.88	App\\Models\\RelayTeam	259	11	20	\N	2788	15	12	\N	[]	\N
19629	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	350	11	20	\N	\N	\N	12	\N	[]	19628
19628	2022-03-25 17:44:13	2022-03-25 17:44:13	516	29.\tRB Staphorst 1\tRB Staphorst\t29.28	App\\Models\\RelayTeam	229	11	20	\N	2928	26	12	\N	[]	\N
6549	2022-02-19 13:27:45	2022-02-19 13:27:45	45	6.\tKLOMP, Danique\t02\tRB Weert\t2:33.96	App\\Models\\Athlete	19	1	1	\N	15396	12	2	7	[]	\N
19630	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	351	11	20	\N	\N	\N	12	\N	[]	19628
19632	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	286	11	20	\N	\N	\N	12	\N	[]	19631
19633	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	989	11	20	\N	\N	\N	12	\N	[]	19631
19631	2022-03-25 17:44:13	2022-03-25 17:44:13	518	30.\tDLRG Gütersloh 2\tDLRG Guetersloh\t29.75	App\\Models\\RelayTeam	260	11	20	\N	2975	3220	12	\N	[]	\N
19635	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	676	11	20	\N	\N	\N	12	\N	[]	19634
19636	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	855	11	20	\N	\N	\N	12	\N	[]	19634
19634	2022-03-25 17:44:13	2022-03-25 17:44:13	520	31.\tDLRG Buchholz United 1\tDLRG Buchholz United\t30.85	App\\Models\\RelayTeam	218	11	20	\N	3085	3230	12	\N	[]	\N
19638	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	133	11	20	\N	\N	\N	12	\N	[]	19637
19639	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	847	11	20	\N	\N	\N	12	\N	[]	19637
19637	2022-03-25 17:44:13	2022-03-25 17:44:13	522	32.\tAthena Bracciano 1\tAthena Bracciano\t33.69	App\\Models\\RelayTeam	210	11	20	\N	3369	3210	12	\N	[]	\N
19641	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	378	11	20	\N	\N	\N	12	\N	[]	19640
19642	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	908	11	20	\N	\N	\N	12	\N	[]	19640
19640	2022-03-25 17:44:13	2022-03-25 17:44:13	524	33.\tSpain NT 1\tSpain NT\t35.57	App\\Models\\RelayTeam	205	11	20	\N	3557	3204	12	\N	[]	\N
19644	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	990	11	20	\N	\N	\N	12	\N	[]	19643
19645	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	991	11	20	\N	\N	\N	12	\N	[]	19643
19643	2022-03-25 17:44:13	2022-03-25 17:44:13	531	34.\tLiège Sauvetage Club 1\tLiege Sauvetage Club\t42.06	App\\Models\\RelayTeam	261	11	20	\N	4206	3238	12	\N	[]	\N
19647	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	171	11	20	\N	\N	\N	12	\N	[]	19646
19648	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	992	11	20	\N	\N	\N	12	\N	[]	19646
19646	2022-03-25 17:44:13	2022-03-25 17:44:13	533	35.\tRB Amersfoort 1\tRB Amersfoort\t43.12	App\\Models\\RelayTeam	262	11	20	\N	4312	22	12	\N	[]	\N
19649	2022-03-25 17:44:13	2022-03-25 17:44:13	535	DSQ\tRB Waddinxveen 2\tRB Waddinxveen	App\\Models\\RelayTeam	263	11	20	1	\N	3231	12	\N	[]	\N
19650	2022-03-25 17:44:13	2022-03-25 17:44:13	538	DSQ\tDLRG Nordrhein-Westfalen 2\tDLRG Nordrhein-Westfalen	App\\Models\\RelayTeam	222	11	20	1	\N	3219	12	\N	[]	\N
19651	2022-03-25 17:44:13	2022-03-25 17:44:13	541	DNS\tDLRG Schwerte 1\tDLRG Schwerte	App\\Models\\RelayTeam	264	11	20	2	\N	109	12	\N	[]	\N
19652	2022-03-25 17:44:13	2022-03-25 17:44:13	542	DNS\tBeacon Lifesaving Club 1\tBeacon Lifesaving Club	App\\Models\\RelayTeam	265	11	20	2	\N	3239	12	\N	[]	\N
19653	2022-03-25 17:44:13	2022-03-25 17:44:13	543	DNS\tRB Delft 2\tRB Delft	App\\Models\\RelayTeam	266	11	20	2	\N	3221	12	\N	[]	\N
19654	2022-03-25 17:44:13	2022-03-25 17:44:13	544	DNS\tRB Delft 3\tRB Delft	App\\Models\\RelayTeam	267	11	20	2	\N	3221	12	\N	[]	\N
19655	2022-03-25 17:44:13	2022-03-25 17:44:13	545	DNS\tRB Delft 4\tRB Delft	App\\Models\\RelayTeam	268	11	20	2	\N	3221	12	\N	[]	\N
19656	2022-03-25 17:44:13	2022-03-25 17:44:13	546	DNS\tRB Gouda 2\tRB Gouda	App\\Models\\RelayTeam	269	11	20	2	\N	17	12	\N	[]	\N
19657	2022-03-25 17:44:13	2022-03-25 17:44:13	547	DNS\tRB Amersfoort 2\tRB Amersfoort	App\\Models\\RelayTeam	270	11	20	2	\N	22	12	\N	[]	\N
19659	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	962	11	20	\N	\N	\N	12	\N	[]	19658
19660	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	961	11	20	\N	\N	\N	12	\N	[]	19658
19658	2022-03-25 17:44:13	2022-03-25 17:44:13	548	DNF\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg 	App\\Models\\RelayTeam	227	11	20	3	\N	39	12	\N	[]	\N
19661	2022-03-25 17:44:13	2022-03-25 17:44:13	550	DNF\tA.S.D. Sportiva Sturla 1\tA.S.D. Sportiva Sturla	App\\Models\\RelayTeam	209	11	20	3	\N	\N	12	\N	[]	\N
19662	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	993	11	20	\N	\N	\N	12	\N	[]	19661
19663	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	921	11	20	\N	\N	\N	12	\N	[]	19661
19665	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	935	11	20	\N	\N	\N	12	\N	[]	19664
19666	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	956	11	20	\N	\N	\N	12	\N	[]	19664
19664	2022-03-25 17:44:13	2022-03-25 17:44:13	552	DNF\tAccademia Di Salvamento 2\tAccademia Di Salvamento	App\\Models\\RelayTeam	225	11	20	3	\N	3203	12	\N	[]	\N
19668	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	955	11	20	\N	\N	\N	12	\N	[]	19667
19669	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	994	11	20	\N	\N	\N	12	\N	[]	19667
19667	2022-03-25 17:44:13	2022-03-25 17:44:13	554	DNF\tAccademia Di Salvamento 3\tAccademia Di Salvamento	App\\Models\\RelayTeam	271	11	20	3	\N	3203	12	\N	[]	\N
19671	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	995	11	20	\N	\N	\N	12	\N	[]	19670
19672	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	957	11	20	\N	\N	\N	12	\N	[]	19670
19670	2022-03-25 17:44:13	2022-03-25 17:44:13	556	DNF\tAccademia Di Salvamento 4\tAccademia Di Salvamento	App\\Models\\RelayTeam	272	11	20	3	\N	3203	12	\N	[]	\N
19674	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	954	11	20	\N	\N	\N	12	\N	[]	19673
19675	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	996	11	20	\N	\N	\N	12	\N	[]	19673
19673	2022-03-25 17:44:13	2022-03-25 17:44:13	558	DNF\tAccademia Di Salvamento 5\tAccademia Di Salvamento	App\\Models\\RelayTeam	273	11	20	3	\N	3203	12	\N	[]	\N
19676	2022-03-25 17:44:13	2022-03-25 17:44:13	560	DNF\tASD Gorizia Nuoto 1\tASD Gorizia Nuoto	App\\Models\\RelayTeam	207	11	20	3	\N	3224	12	\N	[]	\N
19677	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	915	11	20	\N	\N	\N	12	\N	[]	19676
19678	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	914	11	20	\N	\N	\N	12	\N	[]	19676
19680	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	997	11	20	\N	\N	\N	12	\N	[]	19679
19681	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	998	11	20	\N	\N	\N	12	\N	[]	19679
19679	2022-03-25 17:44:13	2022-03-25 17:44:13	562	DNF\tRB Waddinxveen 1\tRB Waddinxveen	App\\Models\\RelayTeam	230	11	20	3	\N	3231	12	\N	[]	\N
19683	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	900	11	20	\N	\N	\N	12	\N	[]	19682
19684	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	262	11	20	\N	\N	\N	12	\N	[]	19682
19682	2022-03-25 17:44:13	2022-03-25 17:44:13	564	DNF\tSpain NT 2\tSpain NT	App\\Models\\RelayTeam	202	11	20	3	\N	3204	12	\N	[]	\N
19686	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	309	11	20	\N	\N	\N	12	\N	[]	19685
19687	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	958	11	20	\N	\N	\N	12	\N	[]	19685
19685	2022-03-25 17:44:13	2022-03-25 17:44:13	566	DNF\tRB Echt 6\tRB Echt	App\\Models\\RelayTeam	274	11	20	3	\N	15	12	\N	[]	\N
19689	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	930	11	20	\N	\N	\N	12	\N	[]	19688
19690	2022-03-25 17:44:13	2022-03-25 17:44:13	\N	\N	App\\Models\\Athlete	931	11	20	\N	\N	\N	12	\N	[]	19688
19688	2022-03-25 17:44:13	2022-03-25 17:44:13	568	DNF\tFrance NT 1\tFrance NT	App\\Models\\RelayTeam	215	11	20	3	\N	3205	12	\N	[]	\N
19692	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	897	11	20	\N	\N	\N	12	\N	[]	19691
19693	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	669	11	20	\N	\N	\N	12	\N	[]	19691
19691	2022-03-25 17:44:13	2022-03-25 17:44:14	570	DNF\tItaly NT 1\tItaly NT	App\\Models\\RelayTeam	201	11	20	3	\N	3201	12	\N	[]	\N
19695	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	163	11	20	\N	\N	\N	12	\N	[]	19694
19696	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	999	11	20	\N	\N	\N	12	\N	[]	19694
19694	2022-03-25 17:44:14	2022-03-25 17:44:14	572	DNF\tKusel DiXXX\tKusel KiXXX	App\\Models\\RelayTeam	275	11	20	3	\N	3207	12	\N	[]	\N
19698	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	944	11	20	\N	\N	\N	12	\N	[]	19697
19699	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	942	11	20	\N	\N	\N	12	\N	[]	19697
19697	2022-03-25 17:44:14	2022-03-25 17:44:14	574	DNF\tSlaskie WOPR 1\tSlaskie WOPR	App\\Models\\RelayTeam	220	11	20	3	\N	3211	12	\N	[]	\N
19701	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	943	11	20	\N	\N	\N	12	\N	[]	19700
19702	2022-03-25 17:44:14	2022-03-25 17:44:14	\N	\N	App\\Models\\Athlete	839	11	20	\N	\N	\N	12	\N	[]	19700
19700	2022-03-25 17:44:14	2022-03-25 17:44:14	576	DNF\tSlaskie WOPR 2\tSlaskie WOPR	App\\Models\\RelayTeam	276	11	20	3	\N	3211	12	\N	[]	\N
19703	2022-03-25 17:44:14	2022-03-25 17:44:14	586	1.\tOPPERMANN, Lena\t05\tDLRG Sachsen-Anhalt\t1:14.99	App\\Models\\Athlete	1000	11	3	\N	7499	3209	12	12	[]	\N
19704	2022-03-25 17:44:14	2022-03-25 17:44:14	587	2.\tBOUDES, Romane\t06\tFrance NT\t1:18.43	App\\Models\\Athlete	787	11	3	\N	7843	3205	12	12	[]	\N
19705	2022-03-25 17:44:14	2022-03-25 17:44:14	588	3.\tJACOBS, Ella\t05\tBelgium NT\t1:20.89	App\\Models\\Athlete	1001	11	3	\N	8089	3206	12	12	[]	\N
19706	2022-03-25 17:44:14	2022-03-25 17:44:14	589	4.\tTIRONI, Alice\t05\tSDS - Specialisti dello Sport \t1:22.25	App\\Models\\Athlete	1002	11	3	\N	8225	3228	12	12	[]	\N
19707	2022-03-25 17:44:14	2022-03-25 17:44:14	590	5.\tDARAIO, MADDALENA\t03\tSAFA 2000\t1:22.46	App\\Models\\Athlete	785	11	3	\N	8246	3202	12	12	[]	\N
19708	2022-03-25 17:44:14	2022-03-25 17:44:14	591	6.\tPOJUM, Sofia\t06\tIn Sport Rane Rosse\t1:22.74	App\\Models\\Athlete	1003	11	3	\N	8274	3208	12	12	[]	\N
19709	2022-03-25 17:44:14	2022-03-25 17:44:14	592	7.\tMAZZI, Gioia\t04\tAccademia Di Salvamento\t1:23.52	App\\Models\\Athlete	4	11	3	\N	8352	3203	12	12	[]	\N
19710	2022-03-25 17:44:14	2022-03-25 17:44:14	593	8.\tDELL'OSPEDALE, Sara\t03\tAccademia Di Salvamento\t1:23.58	App\\Models\\Athlete	10	11	3	\N	8358	3203	12	12	[]	\N
19711	2022-03-25 17:44:14	2022-03-25 17:44:14	594	9.\tCLOTEAUX, Louenn\t05\tFrance NT\t1:23.74	App\\Models\\Athlete	1004	11	3	\N	8374	3205	12	12	[]	\N
19712	2022-03-25 17:44:14	2022-03-25 17:44:14	595	10.\tZECH, Gina\t05\tDLRG Sachsen-Anhalt\t1:24.72	App\\Models\\Athlete	1005	11	3	\N	8472	3209	12	12	[]	\N
19713	2022-03-25 17:44:14	2022-03-25 17:44:14	596	11.\tBONHOMME, Meline\t04\tLiege Sauvetage Club\t1:24.86	App\\Models\\Athlete	1006	11	3	\N	8486	3238	12	12	[]	\N
19714	2022-03-25 17:44:14	2022-03-25 17:44:14	597	12.\tCZOK, Joanna\t03\tSlaskie WOPR\t1:26.97	App\\Models\\Athlete	1007	11	3	\N	8697	3211	12	12	[]	\N
19715	2022-03-25 17:44:14	2022-03-25 17:44:14	598	13.\tTITO, Letizia\t06\tIn Sport Rane Rosse\t1:28.10	App\\Models\\Athlete	789	11	3	\N	8810	3208	12	12	[]	\N
19716	2022-03-25 17:44:14	2022-03-25 17:44:14	599	14.\tCANNONE, Asia\t04\tAthena Salvamento\t1:28.50	App\\Models\\Athlete	797	11	3	\N	8850	3213	12	12	[]	\N
19717	2022-03-25 17:44:14	2022-03-25 17:44:14	600	15.\tFELLENSIEK, Talea\t04\tDLRG Niedersachsen\t1:28.65	App\\Models\\Athlete	801	11	3	\N	8865	3212	12	12	[]	\N
19718	2022-03-25 17:44:14	2022-03-25 17:44:14	601	16.\tFELLENSIEK, Svea\t05\tDLRG Niedersachsen\t1:30.20	App\\Models\\Athlete	804	11	3	\N	9020	3212	12	12	[]	\N
19719	2022-03-25 17:44:14	2022-03-25 17:44:14	602	17.\tDEWAEL, Nell\t06\tLiege Sauvetage Club\t1:30.81	App\\Models\\Athlete	1008	11	3	\N	9081	3238	12	12	[]	\N
19720	2022-03-25 17:44:14	2022-03-25 17:44:14	603	18.\tDE GREEF, Ruth\t03\tRctal\t1:31.78	App\\Models\\Athlete	1009	11	3	\N	9178	3217	12	12	[]	\N
19721	2022-03-25 17:44:14	2022-03-25 17:44:14	604	19.\tDERWAEL, Fien\t06\tSint-Truidense RC\t1:33.60	App\\Models\\Athlete	806	11	3	\N	9360	3214	12	12	[]	\N
19722	2022-03-25 17:44:14	2022-03-25 17:44:14	605	20.\tMENNEN, Fenne\t06\tRB Heytse\t1:34.16	App\\Models\\Athlete	1010	11	3	\N	9416	3229	12	12	[]	\N
19723	2022-03-25 17:44:14	2022-03-25 17:44:14	606	21.\tJANISZEWSKA, Wiktoria\t04\tCKS Szczecin\t1:34.80	App\\Models\\Athlete	1011	11	3	\N	9480	3227	12	12	[]	\N
19724	2022-03-25 17:44:14	2022-03-25 17:44:14	607	22.\tZAPPONE, Giorgia\t03\tAthena Salvamento\t1:35.50	App\\Models\\Athlete	808	11	3	\N	9550	3213	12	12	[]	\N
19725	2022-03-25 17:44:14	2022-03-25 17:44:14	608	23.\tHUYSMANS, Lune\t06\tSint-Truidense RC\t1:36.10	App\\Models\\Athlete	1012	11	3	\N	9610	3214	12	12	[]	\N
19726	2022-03-25 17:44:14	2022-03-25 17:44:14	609	24.\tSPLIETHOFF, Maja\t04\tDLRG Alpen\t1:36.67	App\\Models\\Athlete	42	11	3	\N	9667	261	12	12	[]	\N
19727	2022-03-25 17:44:14	2022-03-25 17:44:14	610	25.\tLONG, Calista\t05\tRB Echt\t1:36.69	App\\Models\\Athlete	1013	11	3	\N	9669	15	12	12	[]	\N
19728	2022-03-25 17:44:14	2022-03-25 17:44:14	611	26.\tBONHOMME, Janice\t06\tLiege Sauvetage Club\t1:38.14	App\\Models\\Athlete	1014	11	3	\N	9814	3238	12	12	[]	\N
19729	2022-03-25 17:44:14	2022-03-25 17:44:14	612	27.\tKRAUSS, Hannah\t05\tDLRG Niedersachsen\t1:38.17	App\\Models\\Athlete	1015	11	3	\N	9817	3212	12	12	[]	\N
19730	2022-03-25 17:44:14	2022-03-25 17:44:14	613	28.\tGERAATS, Lieke\t06\tRB Heytse\t1:39.75	App\\Models\\Athlete	1016	11	3	\N	9975	3229	12	12	[]	\N
19731	2022-03-25 17:44:14	2022-03-25 17:44:14	614	29.\tSCHOSTOK, Lena\t04\tDLRG Alpen\t1:41.97	App\\Models\\Athlete	47	11	3	\N	10197	261	12	12	[]	\N
19732	2022-03-25 17:44:14	2022-03-25 17:44:14	615	30.\tJANSSEN, Vera\t05\tRB Echt\t1:42.88	App\\Models\\Athlete	1017	11	3	\N	10288	15	12	12	[]	\N
19733	2022-03-25 17:44:14	2022-03-25 17:44:14	616	31.\tKOITKA, Sophie\t06\tDLRG Guetersloh\t1:42.93	App\\Models\\Athlete	812	11	3	\N	10293	3220	12	12	[]	\N
19734	2022-03-25 17:44:14	2022-03-25 17:44:14	617	32.\tEGGERDING, Pip\t03\tRB Staphorst\t1:44.93	App\\Models\\Athlete	62	11	3	\N	10493	26	12	12	[]	\N
19735	2022-03-25 17:44:14	2022-03-25 17:44:15	618	33.\tGRUNDMEIER, Mona\t05\tDLRG Nordrhein-Westfalen\t1:45.13	App\\Models\\Athlete	1018	11	3	\N	10513	3219	12	12	[]	\N
19736	2022-03-25 17:44:15	2022-03-25 17:44:15	619	34.\tHAASJES, Chakyra\t04\tRB Staphorst\t1:47.51	App\\Models\\Athlete	1019	11	3	\N	10751	26	12	12	[]	\N
19737	2022-03-25 17:44:15	2022-03-25 17:44:15	620	35.\tSCHMIEMANN, Monia\t04\tDLRG Niedersachsen\t1:48.35	App\\Models\\Athlete	1020	11	3	\N	10835	3212	12	12	[]	\N
19738	2022-03-25 17:44:15	2022-03-25 17:44:15	621	36.\tKINGA SZCZEMBARA, Kinga Szczembara\t06\tSlaskie WOPR\t1:48.48	App\\Models\\Athlete	1021	11	3	\N	10848	3211	12	12	[]	\N
19739	2022-03-25 17:44:15	2022-03-25 17:44:15	622	37.\tGERAATS, Kim\t04\tRB Heytse\t1:50.74	App\\Models\\Athlete	55	11	3	\N	11074	3229	12	12	[]	\N
19740	2022-03-25 17:44:15	2022-03-25 17:44:15	623	38.\tPERRIENS, Lianne\t06\tRB Echt\t1:53.29	App\\Models\\Athlete	1022	11	3	\N	11329	15	12	12	[]	\N
19741	2022-03-25 17:44:15	2022-03-25 17:44:15	624	39.\tBARBU, Julia\t06\tRB Dordrecht\t1:56.93	App\\Models\\Athlete	1023	11	3	\N	11693	13	12	12	[]	\N
19742	2022-03-25 17:44:15	2022-03-25 17:44:15	625	40.\tVAN PINXTEREN, Indy\t05\tRB Oss\t2:24.91	App\\Models\\Athlete	816	11	3	\N	14491	43	12	12	[]	\N
19743	2022-03-25 17:44:15	2022-03-25 17:44:15	626	DNS\tMOELLER, Kim\t03\tDLRG Niedersachsen	App\\Models\\Athlete	794	11	3	2	\N	3212	12	12	[]	\N
19744	2022-03-25 17:44:15	2022-03-25 17:44:15	627	WDR\tNAUTA, Emma\t06\tRB Oss	App\\Models\\Athlete	1024	11	3	0	\N	43	12	12	[]	\N
19745	2022-03-25 17:44:15	2022-03-25 17:44:15	629	1.\tGIOVANELLI, Helene\t02\tItaly NT\t1:11.54	App\\Models\\Athlete	1025	11	3	\N	7154	3201	12	13	[]	\N
19746	2022-03-25 17:44:15	2022-03-25 17:44:15	630	2.\tCRISTETTI, Francesca\t97\tItaly NT\t1:12.24	App\\Models\\Athlete	77	11	3	\N	7224	3201	12	13	[]	\N
19747	2022-03-25 17:44:15	2022-03-25 17:44:15	631	3.\tROMANINI, Aurelie\t87\tBelgium NT\t1:13.23	App\\Models\\Athlete	1026	11	3	\N	7323	3206	12	13	[]	\N
19748	2022-03-25 17:44:15	2022-03-25 17:44:15	632	4.\tMARCO, Manon\t01\tFrance NT\t1:13.90	App\\Models\\Athlete	1027	11	3	\N	7390	3205	12	13	[]	\N
19749	2022-03-25 17:44:15	2022-03-25 17:44:15	633	5.\tSENDEN, Chantal\t93\tNederland NT\t1:16.59	App\\Models\\Athlete	421	11	3	\N	7659	3218	12	13	[]	\N
19750	2022-03-25 17:44:15	2022-03-25 17:44:15	634	6.\tLANGE, Kerstin\t91\tDLRG Schwerte\t1:17.03	App\\Models\\Athlete	1028	11	3	\N	7703	109	12	13	[]	\N
19751	2022-03-25 17:44:15	2022-03-25 17:44:15	635	7.\tVAN OS, Hanna\t02\tDLRG Sachsen-Anhalt\t1:17.83	App\\Models\\Athlete	825	11	3	\N	7783	3209	12	13	[]	\N
19752	2022-03-25 17:44:15	2022-03-25 17:44:15	641	8.\tGANADO AMADOR, Carolina\t99\tSpain NT\t1:18.41	App\\Models\\Athlete	86	11	3	\N	7841	3204	12	13	[]	\N
19753	2022-03-25 17:44:15	2022-03-25 17:44:15	642	9.\tMASCAROS NUNEZ, Beatriz\t02\tSpain NT\t1:19.23	App\\Models\\Athlete	1029	11	3	\N	7923	3204	12	13	[]	\N
19754	2022-03-25 17:44:15	2022-03-25 17:44:15	643	10.\tDURAND, Emma\t00\tFrance NT\t1:21.96	App\\Models\\Athlete	1030	11	3	\N	8196	3205	12	13	[]	\N
19755	2022-03-25 17:44:15	2022-03-25 17:44:15	644	11.\tFASZCZEWSKA, Karolina\t99\tCKS Szczecin\t1:23.78	App\\Models\\Athlete	1031	11	3	\N	8378	3227	12	13	[]	\N
19756	2022-03-25 17:44:15	2022-03-25 17:44:15	645	12.\tBECKERS, Fleur\t02\tRB Echt\t1:24.90	App\\Models\\Athlete	26	11	3	\N	8490	15	12	13	[]	\N
19757	2022-03-25 17:44:15	2022-03-25 17:44:15	646	13.\tSIMONI, Giulia\t02\tAccademia Di Salvamento\t1:25.42	App\\Models\\Athlete	23	11	3	\N	8542	3203	12	13	[]	\N
19758	2022-03-25 17:44:15	2022-03-25 17:44:15	647	14.\tWOLFS, Sharon\t00\tRB Echt\t1:28.89	App\\Models\\Athlete	430	11	3	\N	8889	15	12	13	[]	\N
19759	2022-03-25 17:44:15	2022-03-25 17:44:15	648	15.\tPEZZA, Sofia\t01\tAccademia Di Salvamento\t1:31.54	App\\Models\\Athlete	395	11	3	\N	9154	3203	12	13	[]	\N
19760	2022-03-25 17:44:15	2022-03-25 17:44:15	649	16.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg \t1:31.80	App\\Models\\Athlete	108	11	3	\N	9180	39	12	13	[]	\N
6550	2022-02-19 13:27:45	2022-02-19 13:27:45	46	7.\tPIETERSE, Zanri\t01\tSouth Africa\t2:34.56	App\\Models\\Athlete	614	1	1	\N	15456	232	2	7	[]	\N
19761	2022-03-25 17:44:15	2022-03-25 17:44:15	650	17.\tCARADONNA, Irene\t01\tAthena Bracciano\t1:31.98	App\\Models\\Athlete	21	11	3	\N	9198	3210	12	13	[]	\N
19762	2022-03-25 17:44:15	2022-03-25 17:44:15	651	18.\tMODDER, Louisa\t02\tDLRG Niedersachsen\t1:35.74	App\\Models\\Athlete	33	11	3	\N	9574	3212	12	13	[]	\N
19763	2022-03-25 17:44:15	2022-03-25 17:44:15	652	19.\tROESSIGER, Laura\t00\tDLRG Luckenwalde\t1:38.57	App\\Models\\Athlete	826	11	3	\N	9857	3225	12	13	[]	\N
19764	2022-03-25 17:44:15	2022-03-25 17:44:15	653	20.\tVAN HAAREN, Renate\t92\tRB Oss\t1:41.23	App\\Models\\Athlete	508	11	3	\N	10123	43	12	13	[]	\N
19765	2022-03-25 17:44:15	2022-03-25 17:44:15	654	21.\tJETTEN, Maike\t02\tRB Echt\t1:41.47	App\\Models\\Athlete	400	11	3	\N	10147	15	12	13	[]	\N
19766	2022-03-25 17:44:15	2022-03-25 17:44:15	655	22.\tVAN ELP, Jennifer\t01\tRB Staphorst\t1:41.65	App\\Models\\Athlete	51	11	3	\N	10165	26	12	13	[]	\N
19767	2022-03-25 17:44:15	2022-03-25 17:44:15	656	23.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:43.62	App\\Models\\Athlete	722	11	3	\N	10362	43	12	13	[]	\N
19768	2022-03-25 17:44:15	2022-03-25 17:44:15	657	24.\tHEIN, Nikki\t02\tRB Staphorst\t1:45.25	App\\Models\\Athlete	409	11	3	\N	10525	26	12	13	[]	\N
19769	2022-03-25 17:44:15	2022-03-25 17:44:15	658	DSQ\tBAKKER, Myrthe\t00\tNederland NT	App\\Models\\Athlete	423	11	3	1	\N	3218	12	13	[]	\N
19770	2022-03-25 17:44:15	2022-03-25 17:44:15	660	DNS\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	11	3	2	\N	43	12	13	[]	\N
19771	2022-03-25 17:44:15	2022-03-25 17:44:15	661	DNS\tGEBHARDT, Alica\t97\tDLRG Bad Oldesloe	App\\Models\\Athlete	820	11	3	2	\N	3223	12	13	[]	\N
19772	2022-03-25 17:44:15	2022-03-25 17:44:15	662	DNS\tMODDER, Alena\t02\tDLRG Niedersachsen	App\\Models\\Athlete	41	11	3	2	\N	3212	12	13	[]	\N
19773	2022-03-25 17:44:15	2022-03-25 17:44:15	663	DNS\tFIEDKIEWICZ, Kornelia\t01\tPoland Dolnoslaskie Wopr	App\\Models\\Athlete	1032	11	3	2	\N	3222	12	13	[]	\N
19774	2022-03-25 17:44:15	2022-03-25 17:44:15	664	WDR\tLINDEKENS, Stefanie\t97\tBelgium NT	App\\Models\\Athlete	1033	11	3	0	\N	3206	12	13	[]	\N
19775	2022-03-25 17:44:15	2022-03-25 17:44:15	665	WDR\tHARZE, Marine\t97\tBelgium NT	App\\Models\\Athlete	420	11	3	0	\N	3206	12	13	[]	\N
19776	2022-03-25 17:44:15	2022-03-25 17:44:15	666	WDR\tNAZIEBLO, Klaudia\t93\tPoland Dolnoslaskie Wopr	App\\Models\\Athlete	819	11	3	0	\N	3222	12	13	[]	\N
19777	2022-03-25 17:44:15	2022-03-25 17:44:15	668	1.\tKITTEL, Christine\t85\tDLRG Niedersachsen\t1:26.30	App\\Models\\Athlete	438	11	3	\N	8630	3212	12	14	[]	\N
19778	2022-03-25 17:44:15	2022-03-25 17:44:15	669	2.\tSTEVENS, Danielle\t88\tRB Oss\t1:50.79	App\\Models\\Athlete	641	11	3	\N	11079	43	12	14	[]	\N
19779	2022-03-25 17:44:15	2022-03-25 17:44:15	671	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t2:00.84	App\\Models\\Athlete	440	11	3	\N	12084	13	12	16	[]	\N
19780	2022-03-25 17:44:15	2022-03-25 17:44:16	677	1.\tD'IPPOLITO, Mattia\t03\tItaly NT\t1:03.29	App\\Models\\Athlete	1034	11	3	\N	6329	3201	12	12	[]	\N
19781	2022-03-25 17:44:16	2022-03-25 17:44:16	678	2.\tLOCCHI, Simone\t04\tItaly NT\t1:03.38	App\\Models\\Athlete	1035	11	3	\N	6338	3201	12	12	[]	\N
19782	2022-03-25 17:44:16	2022-03-25 17:44:16	679	3.\tCOCIANNI, Andrea\t03\tASD Gorizia Nuoto\t1:03.95	App\\Models\\Athlete	832	11	3	\N	6395	3224	12	12	[]	\N
19783	2022-03-25 17:44:16	2022-03-25 17:44:16	680	4.\tCORONADO TEJEDA, Carlos\t03\tSpain NT\t1:04.99	App\\Models\\Athlete	829	11	3	\N	6499	3204	12	12	[]	\N
19784	2022-03-25 17:44:16	2022-03-25 17:44:16	681	5.\tMANCARDO, LORENZO\t03\tSAFA 2000\t1:05.70	App\\Models\\Athlete	830	11	3	\N	6570	3202	12	12	[]	\N
19785	2022-03-25 17:44:16	2022-03-25 17:44:16	682	6.\tGRABSKI, Mateusz\t03\tPolen NT\t1:05.88	App\\Models\\Athlete	1036	11	3	\N	6588	3234	12	12	[]	\N
19786	2022-03-25 17:44:16	2022-03-25 17:44:16	683	7.\tBELLOLI, Matteo\t05\tIn Sport Rane Rosse\t1:09.07	App\\Models\\Athlete	836	11	3	\N	6907	3208	12	12	[]	\N
19787	2022-03-25 17:44:16	2022-03-25 17:44:16	684	8.\tCUSSELLE, Ben\t03\tBeacon Lifesaving Club\t1:09.34	App\\Models\\Athlete	1037	11	3	\N	6934	3240	12	12	[]	\N
19788	2022-03-25 17:44:16	2022-03-25 17:44:16	685	9.\tKUIPHOF, Robin\t03\tRB Dordrecht\t1:11.28	App\\Models\\Athlete	737	11	3	\N	7128	13	12	12	[]	\N
19789	2022-03-25 17:44:16	2022-03-25 17:44:16	687	10.\tLEVEQUE, Simon\t05\tFrance NT\t1:11.43	App\\Models\\Athlete	1038	11	3	\N	7143	3205	12	12	[]	\N
19790	2022-03-25 17:44:16	2022-03-25 17:44:16	688	11.\tVAN HOFTEN, Seth\t04\tRB Echt\t1:12.01	App\\Models\\Athlete	1039	11	3	\N	7201	15	12	12	[]	\N
19791	2022-03-25 17:44:16	2022-03-25 17:44:16	753	12.\tMANCARDO, ENRICO\t01\tSAFA 2000\t1:09.61	App\\Models\\Athlete	1040	11	3	\N	6961	3202	12	13	[]	\N
19792	2022-03-25 17:44:16	2022-03-25 17:44:16	754	13.\tMUENDELEIN, Nils\t01\tDLRG Nordrhein-Westfalen\t1:09.69	App\\Models\\Athlete	844	11	3	\N	6969	3219	12	13	[]	\N
19793	2022-03-25 17:44:16	2022-03-25 17:44:16	755	14.\tGIACONIA, Gabriele\t96\tA.S.D. Sportiva Sturla\t1:09.83	App\\Models\\Athlete	1041	11	3	\N	6983	3235	12	13	[]	\N
19794	2022-03-25 17:44:16	2022-03-25 17:44:16	756	15.\tZEMBOLD, Timo\t02\tDLRG Lueneburg e.V.\t1:10.65	App\\Models\\Athlete	1042	11	3	\N	7065	3241	12	13	[]	\N
19795	2022-03-25 17:44:16	2022-03-25 17:44:16	757	16.\tFELICIANGELI, Flavio\t00\tAccademia Di Salvamento\t1:11.83	App\\Models\\Athlete	451	11	3	\N	7183	3203	12	13	[]	\N
19796	2022-03-25 17:44:16	2022-03-25 17:44:16	758	17.\tVANDERSTEEN, Jelle\t02\tBelgium NT\t1:12.28	App\\Models\\Athlete	1043	11	3	\N	7228	3206	12	13	[]	\N
19797	2022-03-25 17:44:16	2022-03-25 17:44:16	759	18.\tDE VINCENTIIS, Alessandro\t02\tASD Rosetana Nuoto\t1:12.62	App\\Models\\Athlete	1044	11	3	\N	7262	3215	12	13	[]	\N
19798	2022-03-25 17:44:16	2022-03-25 17:44:16	760	19.\tHOBUS, Iwan\t01\tRB Heytse\t1:12.84	App\\Models\\Athlete	760	11	3	\N	7284	3229	12	13	[]	\N
7573	2022-02-19 13:27:51	2022-02-19 13:27:51	1628	21.\tDEBBELER, Jonas\t96\tDLRG Goslar\t2:38.02	App\\Models\\Athlete	679	1	6	\N	15802	246	2	8	[]	\N
19799	2022-03-25 17:44:16	2022-03-25 17:44:16	761	20.\tBALSEN VERSTEEG, Tom\t00\tRB Dordrecht\t1:13.37	App\\Models\\Athlete	841	11	3	\N	7337	13	12	13	[]	\N
19800	2022-03-25 17:44:16	2022-03-25 17:44:16	762	21.\tBONGERS, Rick\t00\tRB Heytse\t1:15.01	App\\Models\\Athlete	138	11	3	\N	7501	3229	12	13	[]	\N
19801	2022-03-25 17:44:16	2022-03-25 17:44:16	763	22.\tMEERTEN, Jack\t97\tRB Echt\t1:15.37	App\\Models\\Athlete	135	11	3	\N	7537	15	12	13	[]	\N
19802	2022-03-25 17:44:16	2022-03-25 17:44:16	764	23.\tHERRMANN, Thomas\t99\tDLRG Luckenwalde\t1:15.74	App\\Models\\Athlete	846	11	3	\N	7574	3225	12	13	[]	\N
19803	2022-03-25 17:44:16	2022-03-25 17:44:16	765	24.\tDI SILVESTRE, Daniele\t02\tASD Rosetana Nuoto\t1:17.31	App\\Models\\Athlete	1045	11	3	\N	7731	3215	12	13	[]	\N
19804	2022-03-25 17:44:16	2022-03-25 17:44:16	766	25.\tWILMOTS, Robbe\t00\tRctal\t1:18.34	App\\Models\\Athlete	1046	11	3	\N	7834	3217	12	13	[]	\N
19805	2022-03-25 17:44:16	2022-03-25 17:44:16	767	26.\tSCHMIEMANN, Gerd\t02\tDLRG Niedersachsen\t1:18.54	App\\Models\\Athlete	849	11	3	\N	7854	3212	12	13	[]	\N
19806	2022-03-25 17:44:16	2022-03-25 17:44:16	768	27.\tDE REUVER, Tim\t99\tRB Oss\t1:19.41	App\\Models\\Athlete	150	11	3	\N	7941	43	12	13	[]	\N
19807	2022-03-25 17:44:16	2022-03-25 17:44:16	769	28.\tRUSSCHEN, Tom\t02\tRB Dordrecht\t1:20.19	App\\Models\\Athlete	666	11	3	\N	8019	13	12	13	[]	\N
19808	2022-03-25 17:44:16	2022-03-25 17:44:16	770	29.\tSPLIETHOFF, Jonas\t01\tDLRG Alpen\t1:20.67	App\\Models\\Athlete	1047	11	3	\N	8067	261	12	13	[]	\N
19809	2022-03-25 17:44:16	2022-03-25 17:44:16	771	30.\tTERPORTEN, Phillip\t02\tDLRG Alpen\t1:21.30	App\\Models\\Athlete	1048	11	3	\N	8130	261	12	13	[]	\N
19810	2022-03-25 17:44:16	2022-03-25 17:44:16	772	31.\tVAN DEN AKKER, Tom\t02\tRB Echt\t1:21.57	App\\Models\\Athlete	651	11	3	\N	8157	15	12	13	[]	\N
19811	2022-03-25 17:44:16	2022-03-25 17:44:16	773	32.\tVAN DEN AKKER, Bas\t02\tRB Echt\t1:22.42	App\\Models\\Athlete	652	11	3	\N	8242	15	12	13	[]	\N
19812	2022-03-25 17:44:16	2022-03-25 17:44:16	774	33.\tTAUBE, Patrick\t02\tDLRG Niedersachsen\t1:24.00	App\\Models\\Athlete	1049	11	3	\N	8400	3212	12	13	[]	\N
19813	2022-03-25 17:44:16	2022-03-25 17:44:16	775	34.\tBRINK, Guido\t02\tRB Vlissingen\t1:24.97	App\\Models\\Athlete	848	11	3	\N	8497	248	12	13	[]	\N
19814	2022-03-25 17:44:16	2022-03-25 17:44:16	776	35.\tPASTOORS, Tim\t01\tDLRG Alpen\t1:25.65	App\\Models\\Athlete	1050	11	3	\N	8565	261	12	13	[]	\N
19815	2022-03-25 17:44:16	2022-03-25 17:44:16	777	36.\tVAN HOFF, Bjoern\t02\tRB Waddinxveen\t1:42.74	App\\Models\\Athlete	853	11	3	\N	10274	3231	12	13	[]	\N
19816	2022-03-25 17:44:16	2022-03-25 17:44:16	778	37.\tVERSPAGEN, Harry\t01\tRB Weert\t1:43.59	App\\Models\\Athlete	852	11	3	\N	10359	12	12	13	[]	\N
19817	2022-03-25 17:44:16	2022-03-25 17:44:16	779	DSQ\tFRONTERA, Emiliano\t02\tAccademia Di Salvamento	App\\Models\\Athlete	1051	11	3	1	\N	3203	12	13	[]	\N
19818	2022-03-25 17:44:16	2022-03-25 17:44:16	782	1.\tVAN DER HEIJDEN, Michiel\t86\tRB Staphorst\t1:36.82	App\\Models\\Athlete	752	11	3	\N	9682	26	12	14	[]	\N
19819	2022-03-25 17:44:16	2022-03-25 17:44:16	783	DNS\tDE VREEDE, Melvin\t85\tRB Delft	App\\Models\\Athlete	857	11	3	2	\N	3221	12	14	[]	\N
19820	2022-03-25 17:44:16	2022-03-25 17:44:16	784	DNS\tSTOPPELENBURG, Bart\t85\tRB Delft	App\\Models\\Athlete	858	11	3	2	\N	3221	12	14	[]	\N
19821	2022-03-25 17:44:16	2022-03-25 17:44:16	786	1.\tVAN DER MEER, Vincent\t79\tRB Delft\t1:28.24	App\\Models\\Athlete	464	11	3	\N	8824	3221	12	15	[]	\N
19822	2022-03-25 17:44:16	2022-03-25 17:44:16	787	2.\tBROWNE, David\t72\tSt. John Berchmans Life Saving Club\t1:36.57	App\\Models\\Athlete	1052	11	3	\N	9657	3242	12	15	[]	\N
19823	2022-03-25 17:44:16	2022-03-25 17:44:16	789	1.\tVAN DAALEN, Erik\t65\tRB Gouda\t1:28.08	App\\Models\\Athlete	175	11	3	\N	8808	17	12	16	[]	\N
19824	2022-03-25 17:44:16	2022-03-25 17:44:16	798	1.\tGIORDANO, Masha\t04\tItaly NT\t1:01.23	App\\Models\\Athlete	7	11	5	\N	6123	3201	12	12	[]	\N
19825	2022-03-25 17:44:16	2022-03-25 17:44:16	799	2.\tGONZALEZ GOMEZ, Lucia\t05\tSpain NT\t1:02.16	App\\Models\\Athlete	786	11	5	\N	6216	3204	12	12	[]	\N
19826	2022-03-25 17:44:16	2022-03-25 17:44:16	800	3.\tCABALLERO FUSET, Lola\t04\tSpain NT\t1:02.89	App\\Models\\Athlete	393	11	5	\N	6289	3204	12	12	[]	\N
19827	2022-03-25 17:44:17	2022-03-25 17:44:17	801	4.\tPIOVANI, Giulia\t05\tIn Sport Rane Rosse\t1:02.98	App\\Models\\Athlete	798	11	5	\N	6298	3208	12	12	[]	\N
19828	2022-03-25 17:44:17	2022-03-25 17:44:17	802	5.\tOPPERMANN, Lena\t05\tDLRG Sachsen-Anhalt\t1:03.49	App\\Models\\Athlete	1000	11	5	\N	6349	3209	12	12	[]	\N
19829	2022-03-25 17:44:17	2022-03-25 17:44:17	803	6.\tGIORDANO, Melissa\t06\tAthena Bracciano\t1:03.76	App\\Models\\Athlete	1053	11	5	\N	6376	3210	12	12	[]	\N
19830	2022-03-25 17:44:17	2022-03-25 17:44:17	804	7.\tBARRENA PONCE, Sheila\t03\tSpain NT\t1:04.71	App\\Models\\Athlete	1054	11	5	\N	6471	3204	12	12	[]	\N
19831	2022-03-25 17:44:17	2022-03-25 17:44:17	805	8.\tDELL'OSPEDALE, Sara\t03\tAccademia Di Salvamento\t1:05.29	App\\Models\\Athlete	10	11	5	\N	6529	3203	12	12	[]	\N
19832	2022-03-25 17:44:17	2022-03-25 17:44:17	806	9.\tCIPOLLETTI, Ilaria\t06\tAthena Bracciano\t1:05.45	App\\Models\\Athlete	791	11	5	\N	6545	3210	12	12	[]	\N
19833	2022-03-25 17:44:17	2022-03-25 17:44:17	807	10.\tMAZZI, Gioia\t04\tAccademia Di Salvamento\t1:05.91	App\\Models\\Athlete	4	11	5	\N	6591	3203	12	12	[]	\N
19834	2022-03-25 17:44:17	2022-03-25 17:44:17	808	11.\tCROES, Elise\t04\tBelgium NT\t1:05.95	App\\Models\\Athlete	14	11	5	\N	6595	3206	12	12	[]	\N
19835	2022-03-25 17:44:17	2022-03-25 17:44:17	809	12.\tRAUZY, Solene\t05\tFrance NT\t1:06.07	App\\Models\\Athlete	1055	11	5	\N	6607	3205	12	12	[]	\N
6551	2022-02-19 13:27:45	2022-02-19 13:27:45	47	8.\tGUELI, Beatrice\t03\t3T Sporting Club\t2:35.53	App\\Models\\Athlete	615	1	1	\N	15553	233	2	7	[]	\N
19836	2022-03-25 17:44:17	2022-03-25 17:44:17	810	13.\tPASEK, Natalia\t05\tSlaskie WOPR\t1:06.44	App\\Models\\Athlete	1056	11	5	\N	6644	3211	12	12	[]	\N
19837	2022-03-25 17:44:17	2022-03-25 17:44:17	811	14.\tPASQUALI, Carlotta\t06\tAthena Bracciano\t1:06.67	App\\Models\\Athlete	796	11	5	\N	6667	3210	12	12	[]	\N
19838	2022-03-25 17:44:17	2022-03-25 17:44:17	812	15.\tBONETTI, Chiara\t06\tAthena Salvamento\t1:07.27	App\\Models\\Athlete	1057	11	5	\N	6727	3213	12	12	[]	\N
19839	2022-03-25 17:44:17	2022-03-25 17:44:17	813	16.\tBONHOMME, Meline\t04\tLiege Sauvetage Club\t1:07.41	App\\Models\\Athlete	1006	11	5	\N	6741	3238	12	12	[]	\N
19840	2022-03-25 17:44:17	2022-03-25 17:44:17	814	17.\tMONTENEGREO, Noemi\t03\tAthena Salvamento\t1:07.83	App\\Models\\Athlete	1058	11	5	\N	6783	3213	12	12	[]	\N
19841	2022-03-25 17:44:17	2022-03-25 17:44:17	815	18.\tZECH, Gina\t05\tDLRG Sachsen-Anhalt\t1:08.12	App\\Models\\Athlete	1005	11	5	\N	6812	3209	12	12	[]	\N
19842	2022-03-25 17:44:17	2022-03-25 17:44:17	816	19.\tD'ALESSANDRO, Carlotta\t06\tIn Sport Rane Rosse\t1:08.24	App\\Models\\Athlete	1059	11	5	\N	6824	3208	12	12	[]	\N
19843	2022-03-25 17:44:17	2022-03-25 17:44:17	817	20.\tTIRONI, Alice\t05\tSDS - Specialisti dello Sport \t1:09.27	App\\Models\\Athlete	1002	11	5	\N	6927	3228	12	12	[]	\N
19844	2022-03-25 17:44:17	2022-03-25 17:44:17	818	21.\tDEWAEL, Nell\t06\tLiege Sauvetage Club\t1:09.46	App\\Models\\Athlete	1008	11	5	\N	6946	3238	12	12	[]	\N
19845	2022-03-25 17:44:17	2022-03-25 17:44:17	819	22.\tVAGLIVIELLO, Denise\t05\tAthena Salvamento\t1:09.56	App\\Models\\Athlete	1060	11	5	\N	6956	3213	12	12	[]	\N
19846	2022-03-25 17:44:17	2022-03-25 17:44:17	820	23.\tPETRUNGARO, Laura\t06\tIn Sport Rane Rosse\t1:09.96	App\\Models\\Athlete	1061	11	5	\N	6996	3208	12	12	[]	\N
19847	2022-03-25 17:44:17	2022-03-25 17:44:17	821	24.\tS'HEEREN, Mirte\t06\tSint-Truidense RC\t1:10.24	App\\Models\\Athlete	799	11	5	\N	7024	3214	12	12	[]	\N
19848	2022-03-25 17:44:17	2022-03-25 17:44:17	822	25.\tFELLENSIEK, Talea\t04\tDLRG Niedersachsen\t1:10.25	App\\Models\\Athlete	801	11	5	\N	7025	3212	12	12	[]	\N
19849	2022-03-25 17:44:17	2022-03-25 17:44:17	823	26.\tKARWOWSKA, Anna\t03\tCKS Szczecin\t1:10.61	App\\Models\\Athlete	1062	11	5	\N	7061	3227	12	12	[]	\N
19850	2022-03-25 17:44:17	2022-03-25 17:44:17	824	27.\tDALHUISEN, Renske\t03\tNederland NT\t1:10.85	App\\Models\\Athlete	30	11	5	\N	7085	3218	12	12	[]	\N
19851	2022-03-25 17:44:17	2022-03-25 17:44:17	825	28.\tCLOTEAUX, Louenn\t05\tFrance NT\t1:11.25	App\\Models\\Athlete	1004	11	5	\N	7125	3205	12	12	[]	\N
19852	2022-03-25 17:44:17	2022-03-25 17:44:17	826	29.\tHILLE, Louisa\t04\tDLRG Guetersloh\t1:11.44	App\\Models\\Athlete	404	11	5	\N	7144	3220	12	12	[]	\N
19853	2022-03-25 17:44:17	2022-03-25 17:44:17	827	30.\tSTICKER, Lien\t06\tRctal\t1:11.83	App\\Models\\Athlete	803	11	5	\N	7183	3217	12	12	[]	\N
19854	2022-03-25 17:44:17	2022-03-25 17:44:17	828	31.\tFELLENSIEK, Svea\t05\tDLRG Niedersachsen\t1:12.05	App\\Models\\Athlete	804	11	5	\N	7205	3212	12	12	[]	\N
19855	2022-03-25 17:44:17	2022-03-25 17:44:17	829	32.\tDRABIK, Aneta\t04\tSlaskie WOPR\t1:12.07	App\\Models\\Athlete	793	11	5	\N	7207	3211	12	12	[]	\N
19856	2022-03-25 17:44:17	2022-03-25 17:44:17	830	33.\tDARAIO, MADDALENA\t03\tSAFA 2000\t1:12.92	App\\Models\\Athlete	785	11	5	\N	7292	3202	12	12	[]	\N
19857	2022-03-25 17:44:17	2022-03-25 17:44:17	831	34.\tSPUERCK, Hanna\t03\tDLRG Nordrhein-Westfalen\t1:13.24	App\\Models\\Athlete	39	11	5	\N	7324	3219	12	12	[]	\N
19858	2022-03-25 17:44:17	2022-03-25 17:44:17	832	35.\tDE GREEF, Ruth\t03\tRctal\t1:13.42	App\\Models\\Athlete	1009	11	5	\N	7342	3217	12	12	[]	\N
19859	2022-03-25 17:44:17	2022-03-25 17:44:17	833	36.\tJANISZEWSKA, Wiktoria\t04\tCKS Szczecin\t1:14.30	App\\Models\\Athlete	1011	11	5	\N	7430	3227	12	12	[]	\N
19860	2022-03-25 17:44:17	2022-03-25 17:44:17	834	37.\tKLOMP, Dyonne\t04\tRB Weert\t1:14.89	App\\Models\\Athlete	31	11	5	\N	7489	12	12	12	[]	\N
19861	2022-03-25 17:44:17	2022-03-25 17:44:17	835	38.\tBUECKEN, Greta\t05\tDLRG Alpen\t1:14.95	App\\Models\\Athlete	1063	11	5	\N	7495	261	12	12	[]	\N
19862	2022-03-25 17:44:17	2022-03-25 17:44:17	836	39.\tMURA CITTADINI, Melissa\t03\tAccademia Di Salvamento\t1:15.00	App\\Models\\Athlete	473	11	5	\N	7500	3203	12	12	[]	\N
19863	2022-03-25 17:44:17	2022-03-25 17:44:17	837	FERRIGNO, Sveva\t05\tIn Sport Rane Rosse\t1:15.00	App\\Models\\Athlete	1064	11	5	\N	7500	3208	12	12	[]	\N
19864	2022-03-25 17:44:17	2022-03-25 17:44:17	838	41.\tDE KONING, Sanne\t04\tRB Gouda\t1:15.17	App\\Models\\Athlete	43	11	5	\N	7517	17	12	12	[]	\N
19865	2022-03-25 17:44:17	2022-03-25 17:44:17	839	42.\tSCHMIEMANN, Monia\t04\tDLRG Niedersachsen\t1:15.30	App\\Models\\Athlete	1020	11	5	\N	7530	3212	12	12	[]	\N
19866	2022-03-25 17:44:17	2022-03-25 17:44:17	840	43.\tBENZMUELLER, Magdalena\t05\tKusel KiXXX\t1:15.46	App\\Models\\Athlete	788	11	5	\N	7546	3207	12	12	[]	\N
19867	2022-03-25 17:44:17	2022-03-25 17:44:17	841	44.\tJANSSEN, Vera\t05\tRB Echt\t1:15.69	App\\Models\\Athlete	1017	11	5	\N	7569	15	12	12	[]	\N
19868	2022-03-25 17:44:17	2022-03-25 17:44:17	842	45.\tBELLI, Sofia\t05\tAthena Salvamento\t1:15.73	App\\Models\\Athlete	810	11	5	\N	7573	3213	12	12	[]	\N
19869	2022-03-25 17:44:17	2022-03-25 17:44:17	843	46.\tBARBU, Julia\t06\tRB Dordrecht\t1:16.14	App\\Models\\Athlete	1023	11	5	\N	7614	13	12	12	[]	\N
19870	2022-03-25 17:44:17	2022-03-25 17:44:17	844	47.\tZUIDGEEST, Vera\t03\tRB Delft\t1:16.26	App\\Models\\Athlete	478	11	5	\N	7626	3221	12	12	[]	\N
19871	2022-03-25 17:44:17	2022-03-25 17:44:17	845	48.\tPERRIENS, Lianne\t06\tRB Echt\t1:16.42	App\\Models\\Athlete	1022	11	5	\N	7642	15	12	12	[]	\N
19872	2022-03-25 17:44:18	2022-03-25 17:44:18	846	49.\tRIEDRICH, Franka\t05\tDLRG Nuernberg-Roth-Schwabach\t1:16.44	App\\Models\\Athlete	802	11	5	\N	7644	3216	12	12	[]	\N
19873	2022-03-25 17:44:18	2022-03-25 17:44:18	847	50.\tMEESKE, Christin\t05\tDLRG Niedersachsen\t1:17.37	App\\Models\\Athlete	807	11	5	\N	7737	3212	12	12	[]	\N
19874	2022-03-25 17:44:18	2022-03-25 17:44:18	848	51.\tBONHOMME, Janice\t06\tLiege Sauvetage Club\t1:17.70	App\\Models\\Athlete	1014	11	5	\N	7770	3238	12	12	[]	\N
19875	2022-03-25 17:44:18	2022-03-25 17:44:18	854	52.\tKRAUSS, Hannah\t05\tDLRG Niedersachsen\t1:18.44	App\\Models\\Athlete	1015	11	5	\N	7844	3212	12	12	[]	\N
19876	2022-03-25 17:44:18	2022-03-25 17:44:18	855	53.\tWIJNANT, Loes\t05\tRctal\t1:19.47	App\\Models\\Athlete	811	11	5	\N	7947	3217	12	12	[]	\N
19877	2022-03-25 17:44:18	2022-03-25 17:44:18	856	54.\tPUGGIONI, Livia\t03\tAccademia Di Salvamento\t1:19.56	App\\Models\\Athlete	809	11	5	\N	7956	3203	12	12	[]	\N
19878	2022-03-25 17:44:18	2022-03-25 17:44:18	857	ROSA, Martina\t04\tAthena Bracciano\t1:19.56	App\\Models\\Athlete	813	11	5	\N	7956	3210	12	12	[]	\N
19879	2022-03-25 17:44:18	2022-03-25 17:44:18	858	56.\tSPLIETHOFF, Lea\t04\tDLRG Alpen\t1:19.75	App\\Models\\Athlete	1065	11	5	\N	7975	261	12	12	[]	\N
19880	2022-03-25 17:44:18	2022-03-25 17:44:18	859	57.\tBUDZINSKA, Paulina\t03\tSlaskie WOPR\t1:20.41	App\\Models\\Athlete	792	11	5	\N	8041	3211	12	12	[]	\N
19881	2022-03-25 17:44:18	2022-03-25 17:44:18	860	58.\tWIECZOREK, Lysann\t05\tDLRG Sachsen-Anhalt\t1:20.72	App\\Models\\Athlete	790	11	5	\N	8072	3209	12	12	[]	\N
19882	2022-03-25 17:44:18	2022-03-25 17:44:18	861	59.\tDOMINJANNI, Angelica\t06\tAthena Salvamento\t1:21.53	App\\Models\\Athlete	1066	11	5	\N	8153	3213	12	12	[]	\N
19883	2022-03-25 17:44:18	2022-03-25 17:44:18	862	60.\tHAASJES, Chakyra\t04\tRB Staphorst\t1:22.24	App\\Models\\Athlete	1019	11	5	\N	8224	26	12	12	[]	\N
19884	2022-03-25 17:44:18	2022-03-25 17:44:18	863	61.\tLONG, Calista\t05\tRB Echt\t1:22.25	App\\Models\\Athlete	1013	11	5	\N	8225	15	12	12	[]	\N
19885	2022-03-25 17:44:18	2022-03-25 17:44:18	864	62.\tSCHOSTOK, Lena\t04\tDLRG Alpen\t1:22.34	App\\Models\\Athlete	47	11	5	\N	8234	261	12	12	[]	\N
19886	2022-03-25 17:44:18	2022-03-25 17:44:18	865	63.\tGERAATS, Lieke\t06\tRB Heytse\t1:22.68	App\\Models\\Athlete	1016	11	5	\N	8268	3229	12	12	[]	\N
19887	2022-03-25 17:44:18	2022-03-25 17:44:18	866	64.\tVRENKEN, Kyra\t04\tRB Echt\t1:25.24	App\\Models\\Athlete	72	11	5	\N	8524	15	12	12	[]	\N
19888	2022-03-25 17:44:18	2022-03-25 17:44:18	867	65.\tKINGA SZCZEMBARA, Kinga Szczembara\t06\tSlaskie WOPR\t1:25.34	App\\Models\\Athlete	1021	11	5	\N	8534	3211	12	12	[]	\N
19889	2022-03-25 17:44:18	2022-03-25 17:44:18	868	66.\tVAN DER VORST, Lynn\t04\tRB Echt\t1:25.45	App\\Models\\Athlete	415	11	5	\N	8545	15	12	12	[]	\N
19890	2022-03-25 17:44:18	2022-03-25 17:44:18	869	67.\tCZOK, Joanna\t03\tSlaskie WOPR\t1:26.62	App\\Models\\Athlete	1007	11	5	\N	8662	3211	12	12	[]	\N
19891	2022-03-25 17:44:18	2022-03-25 17:44:18	870	68.\tSPLIETHOFF, Maja\t04\tDLRG Alpen\t1:27.93	App\\Models\\Athlete	42	11	5	\N	8793	261	12	12	[]	\N
19892	2022-03-25 17:44:18	2022-03-25 17:44:18	871	69.\tROMANCZYK, Lena\t06\tDLRG Duisburg-Homberg \t1:32.44	App\\Models\\Athlete	1067	11	5	\N	9244	39	12	12	[]	\N
19893	2022-03-25 17:44:18	2022-03-25 17:44:18	872	70.\tGERAATS, Kim\t04\tRB Heytse\t1:33.82	App\\Models\\Athlete	55	11	5	\N	9382	3229	12	12	[]	\N
19894	2022-03-25 17:44:18	2022-03-25 17:44:18	873	71.\tNAUTA, Emma\t06\tRB Oss\t1:37.15	App\\Models\\Athlete	1024	11	5	\N	9715	43	12	12	[]	\N
19895	2022-03-25 17:44:18	2022-03-25 17:44:18	874	72.\tVAN PINXTEREN, Indy\t05\tRB Oss\t1:38.17	App\\Models\\Athlete	816	11	5	\N	9817	43	12	12	[]	\N
19896	2022-03-25 17:44:18	2022-03-25 17:44:18	875	73.\tHOFSTEDE, Anouk\t04\tRB Staphorst\t1:38.60	App\\Models\\Athlete	483	11	5	\N	9860	26	12	12	[]	\N
19897	2022-03-25 17:44:18	2022-03-25 17:44:18	876	74.\tKELLENERS, Jill\t06\tRB Echt\t1:42.81	App\\Models\\Athlete	814	11	5	\N	10281	15	12	12	[]	\N
19898	2022-03-25 17:44:18	2022-03-25 17:44:18	877	75.\tEGGERDING, Pip\t03\tRB Staphorst\t1:47.97	App\\Models\\Athlete	62	11	5	\N	10797	26	12	12	[]	\N
19899	2022-03-25 17:44:18	2022-03-25 17:44:18	878	DSQ\tSETTI, Jennifer\t05\tAthena Salvamento	App\\Models\\Athlete	1068	11	5	1	\N	3213	12	12	[]	\N
19900	2022-03-25 17:44:18	2022-03-25 17:44:18	880	DSQ\tMENNEN, Fenne\t06\tRB Heytse	App\\Models\\Athlete	1010	11	5	1	\N	3229	12	12	[]	\N
19901	2022-03-25 17:44:18	2022-03-25 17:44:18	882	DSQ\tTUBILI, Francesca\t06\tIn Sport Rane Rosse	App\\Models\\Athlete	1069	11	5	1	\N	3208	12	12	[]	\N
19902	2022-03-25 17:44:18	2022-03-25 17:44:18	884	DSQ\tSCHAEFER, Julia\t04\tDLRG Nordrhein-Westfalen	App\\Models\\Athlete	60	11	5	1	\N	3219	12	12	[]	\N
19903	2022-03-25 17:44:18	2022-03-25 17:44:18	886	DSQ\tPOJUM, Sofia\t06\tIn Sport Rane Rosse	App\\Models\\Athlete	1003	11	5	1	\N	3208	12	12	[]	\N
19904	2022-03-25 17:44:18	2022-03-25 17:44:18	888	DSQ\tTITO, Letizia\t06\tIn Sport Rane Rosse	App\\Models\\Athlete	789	11	5	1	\N	3208	12	12	[]	\N
19905	2022-03-25 17:44:18	2022-03-25 17:44:18	890	DSQ\tMONGIA, Sara\t06\tASD Rosetana Nuoto	App\\Models\\Athlete	800	11	5	1	\N	3215	12	12	[]	\N
19906	2022-03-25 17:44:18	2022-03-25 17:44:18	892	DSQ\tEUBE, Mareike\t03\tDLRG Guetersloh	App\\Models\\Athlete	68	11	5	1	\N	3220	12	12	[]	\N
19907	2022-03-25 17:44:18	2022-03-25 17:44:18	895	DSQ\tEUBE, Amelie\t05\tDLRG Guetersloh	App\\Models\\Athlete	815	11	5	1	\N	3220	12	12	[]	\N
19908	2022-03-25 17:44:18	2022-03-25 17:44:18	897	DSQ\tBERTORELLE, Fiona\t06\tFrance NT	App\\Models\\Athlete	795	11	5	1	\N	3205	12	12	[]	\N
19909	2022-03-25 17:44:18	2022-03-25 17:44:18	899	DSQ\tWRIGGERS, Jule\t04\tDLRG Duisburg-Homberg 	App\\Models\\Athlete	1070	11	5	1	\N	39	12	12	[]	\N
19910	2022-03-25 17:44:18	2022-03-25 17:44:18	901	DSQ\tDELAMARE, Michelle\t05\tAthena Bracciano	App\\Models\\Athlete	805	11	5	1	\N	3210	12	12	[]	\N
19911	2022-03-25 17:44:18	2022-03-25 17:44:18	904	DSQ\tHUYSMANS, Lune\t06\tSint-Truidense RC	App\\Models\\Athlete	1012	11	5	1	\N	3214	12	12	[]	\N
19912	2022-03-25 17:44:18	2022-03-25 17:44:18	909	1.\tVOLPINI, Federica\t93\tItaly NT\t58.93	App\\Models\\Athlete	487	11	5	\N	5893	3201	12	13	[]	\N
19913	2022-03-25 17:44:18	2022-03-25 17:44:18	910	2.\tVAN DE PLAS, Bo\t01\tBelgium NT\t59.49	App\\Models\\Athlete	1071	11	5	\N	5949	3206	12	13	[]	\N
19914	2022-03-25 17:44:18	2022-03-25 17:44:18	911	3.\tFOGLIUZZI, Zoe\t98\tItaly NT\t59.81	App\\Models\\Athlete	818	11	5	\N	5981	3201	12	13	[]	\N
19915	2022-03-25 17:44:18	2022-03-25 17:44:18	912	4.\tMARCO, Manon\t01\tFrance NT\t1:02.33	App\\Models\\Athlete	1027	11	5	\N	6233	3205	12	13	[]	\N
19916	2022-03-25 17:44:18	2022-03-25 17:44:18	913	5.\tVANBUEL, Nele\t85\tBelgium NT\t1:02.73	App\\Models\\Athlete	121	11	5	\N	6273	3206	12	13	[]	\N
19917	2022-03-25 17:44:18	2022-03-25 17:44:18	914	6.\tRAS, Janneke\t95\tNederland NT\t1:02.74	App\\Models\\Athlete	489	11	5	\N	6274	3218	12	13	[]	\N
19918	2022-03-25 17:44:18	2022-03-25 17:44:19	915	7.\tLOUREIRO SERRANO, Noelia\t01\tSpain NT\t1:02.80	App\\Models\\Athlete	471	11	5	\N	6280	3204	12	13	[]	\N
19919	2022-03-25 17:44:19	2022-03-25 17:44:19	916	8.\tDZIURON, Jasmin\t93\tDLRG Schlossholte-Stukenbrock\t1:03.26	App\\Models\\Athlete	1072	11	5	\N	6326	3243	12	13	[]	\N
19920	2022-03-25 17:44:19	2022-03-25 17:44:19	917	9.\tDURAND, Emma\t00\tFrance NT\t1:04.62	App\\Models\\Athlete	1030	11	5	\N	6462	3205	12	13	[]	\N
19921	2022-03-25 17:44:19	2022-03-25 17:44:19	918	10.\tQUADRELLI, Martina\t00\tIn Sport Rane Rosse\t1:04.84	App\\Models\\Athlete	1073	11	5	\N	6484	3208	12	13	[]	\N
19922	2022-03-25 17:44:19	2022-03-25 17:44:19	919	11.\tFILIPPINI, Valeria\t99\tIn Sport Rane Rosse\t1:05.14	App\\Models\\Athlete	1074	11	5	\N	6514	3208	12	13	[]	\N
19923	2022-03-25 17:44:19	2022-03-25 17:44:19	920	12.\tQUINKE, Loreen\t01\tDLRG Nordrhein-Westfalen\t1:05.33	App\\Models\\Athlete	469	11	5	\N	6533	3219	12	13	[]	\N
19924	2022-03-25 17:44:19	2022-03-25 17:44:19	921	13.\tBAKKER, Myrthe\t00\tNederland NT\t1:05.62	App\\Models\\Athlete	423	11	5	\N	6562	3218	12	13	[]	\N
19925	2022-03-25 17:44:19	2022-03-25 17:44:19	922	14.\tSKUDLIK, Marta\t01\tSlaskie WOPR\t1:06.10	App\\Models\\Athlete	1075	11	5	\N	6610	3211	12	13	[]	\N
19926	2022-03-25 17:44:19	2022-03-25 17:44:19	923	15.\tPOPIEL, Anna\t01\tCKS Szczecin\t1:06.50	App\\Models\\Athlete	1076	11	5	\N	6650	3227	12	13	[]	\N
19927	2022-03-25 17:44:19	2022-03-25 17:44:19	924	16.\tFABRETTI, Lucrezia\t01\tItaly NT\t1:06.74	App\\Models\\Athlete	1077	11	5	\N	6674	3201	12	13	[]	\N
19928	2022-03-25 17:44:19	2022-03-25 17:44:19	925	17.\tWOLFS, Sharon\t00\tRB Echt\t1:08.75	App\\Models\\Athlete	430	11	5	\N	6875	15	12	13	[]	\N
19929	2022-03-25 17:44:19	2022-03-25 17:44:19	926	18.\tLANZILLOTTI, Paola\t97\tItaly NT\t1:08.93	App\\Models\\Athlete	1078	11	5	\N	6893	3201	12	13	[]	\N
19930	2022-03-25 17:44:19	2022-03-25 17:44:19	927	19.\tKLOMP, Danique\t02\tNederland NT\t1:09.52	App\\Models\\Athlete	19	11	5	\N	6952	3218	12	13	[]	\N
19931	2022-03-25 17:44:19	2022-03-25 17:44:19	928	20.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg \t1:10.49	App\\Models\\Athlete	108	11	5	\N	7049	39	12	13	[]	\N
19932	2022-03-25 17:44:19	2022-03-25 17:44:19	929	21.\tCHIARAVALLI, Ginevra\t97\tAthena Bracciano\t1:11.27	App\\Models\\Athlete	97	11	5	\N	7127	3210	12	13	[]	\N
19933	2022-03-25 17:44:19	2022-03-25 17:44:19	930	22.\tMIDEI, Alice\t01\tAccademia Di Salvamento\t1:11.76	App\\Models\\Athlete	1079	11	5	\N	7176	3203	12	13	[]	\N
19934	2022-03-25 17:44:19	2022-03-25 17:44:19	931	23.\tGROOT, Kathy\t97\tRB Dordrecht\t1:12.84	App\\Models\\Athlete	570	11	5	\N	7284	13	12	13	[]	\N
19935	2022-03-25 17:44:19	2022-03-25 17:44:19	932	24.\tSIMONI, Giulia\t02\tAccademia Di Salvamento\t1:14.07	App\\Models\\Athlete	23	11	5	\N	7407	3203	12	13	[]	\N
19936	2022-03-25 17:44:19	2022-03-25 17:44:19	933	25.\tGRAU, Jessica\t00\tKusel KiXXX\t1:14.43	App\\Models\\Athlete	92	11	5	\N	7443	3207	12	13	[]	\N
19937	2022-03-25 17:44:19	2022-03-25 17:44:19	934	26.\tPEZZA, Sofia\t01\tAccademia Di Salvamento\t1:14.44	App\\Models\\Athlete	395	11	5	\N	7444	3203	12	13	[]	\N
19938	2022-03-25 17:44:19	2022-03-25 17:44:19	935	27.\tBERTUOLA, Chiara\t99\tAthena Bracciano\t1:15.42	App\\Models\\Athlete	93	11	5	\N	7542	3210	12	13	[]	\N
19939	2022-03-25 17:44:19	2022-03-25 17:44:19	936	28.\tMODDER, Louisa\t02\tDLRG Niedersachsen\t1:15.85	App\\Models\\Athlete	33	11	5	\N	7585	3212	12	13	[]	\N
19940	2022-03-25 17:44:19	2022-03-25 17:44:19	937	29.\tAMBROSI, Chiara\t02\tASD Gorizia Nuoto\t1:17.13	App\\Models\\Athlete	821	11	5	\N	7713	3224	12	13	[]	\N
19941	2022-03-25 17:44:19	2022-03-25 17:44:19	938	30.\tPICCARDI, Sara\t02\tAthena Bracciano\t1:18.16	App\\Models\\Athlete	1080	11	5	\N	7816	3210	12	13	[]	\N
19942	2022-03-25 17:44:19	2022-03-25 17:44:19	939	31.\tMICHESI, Silvia\t00\tAthena Bracciano\t1:18.53	App\\Models\\Athlete	1081	11	5	\N	7853	3210	12	13	[]	\N
19943	2022-03-25 17:44:19	2022-03-25 17:44:19	940	32.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t1:18.68	App\\Models\\Athlete	403	11	5	\N	7868	13	12	13	[]	\N
19944	2022-03-25 17:44:19	2022-03-25 17:44:19	941	33.\tGROTE, Jessica\t96\tDLRG Sachsen-Anhalt\t1:19.26	App\\Models\\Athlete	422	11	5	\N	7926	3209	12	13	[]	\N
19945	2022-03-25 17:44:19	2022-03-25 17:44:19	942	34.\tTERLIESNER, Jana\t95\tDLRG Duisburg-Homberg \t1:19.80	App\\Models\\Athlete	1082	11	5	\N	7980	39	12	13	[]	\N
19946	2022-03-25 17:44:19	2022-03-25 17:44:19	943	35.\tPISTERS, Nathalie\t01\tRB Echt\t1:19.99	App\\Models\\Athlete	35	11	5	\N	7999	15	12	13	[]	\N
19947	2022-03-25 17:44:19	2022-03-25 17:44:19	944	36.\tVAN HAAREN, Renate\t92\tRB Oss\t1:20.24	App\\Models\\Athlete	508	11	5	\N	8024	43	12	13	[]	\N
19948	2022-03-25 17:44:19	2022-03-25 17:44:19	945	37.\tVAN ELP, Jennifer\t01\tRB Staphorst\t1:20.91	App\\Models\\Athlete	51	11	5	\N	8091	26	12	13	[]	\N
19949	2022-03-25 17:44:19	2022-03-25 17:44:19	946	38.\tHEIN, Nikki\t02\tRB Staphorst\t1:21.43	App\\Models\\Athlete	409	11	5	\N	8143	26	12	13	[]	\N
19950	2022-03-25 17:44:19	2022-03-25 17:44:19	947	39.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:22.58	App\\Models\\Athlete	722	11	5	\N	8258	43	12	13	[]	\N
19951	2022-03-25 17:44:19	2022-03-25 17:44:19	948	40.\tDISNEY, Victoria\t01\tRB Gouda\t1:26.48	App\\Models\\Athlete	827	11	5	\N	8648	17	12	13	[]	\N
19952	2022-03-25 17:44:19	2022-03-25 17:44:19	949	DSQ\tBOREL, Carol-Ann\t99\tFrance NT	App\\Models\\Athlete	823	11	5	1	\N	3205	12	13	[]	\N
19953	2022-03-25 17:44:19	2022-03-25 17:44:19	951	DSQ\tTORTELLO, Carlotta\t02\tA.S.D. Sportiva Sturla	App\\Models\\Athlete	1083	11	5	1	\N	3235	12	13	[]	\N
19954	2022-03-25 17:44:19	2022-03-25 17:44:19	954	DSQ\tJETTEN, Maike\t02\tRB Echt	App\\Models\\Athlete	400	11	5	1	\N	15	12	13	[]	\N
19955	2022-03-25 17:44:19	2022-03-25 17:44:19	956	DNS\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	11	5	2	\N	43	12	13	[]	\N
19956	2022-03-25 17:44:19	2022-03-25 17:44:19	957	DNS\tMODDER, Alena\t02\tDLRG Niedersachsen	App\\Models\\Athlete	41	11	5	2	\N	3212	12	13	[]	\N
19957	2022-03-25 17:44:19	2022-03-25 17:44:19	958	DNF\tROYER VEIL, Lea\t01\tFrance NT	App\\Models\\Athlete	824	11	5	3	\N	3205	12	13	[]	\N
19958	2022-03-25 17:44:19	2022-03-25 17:44:19	961	WDR\tREPETTO, Martina\t98\tA.S.D. Sportiva Sturla	App\\Models\\Athlete	828	11	5	0	\N	3235	12	13	[]	\N
19959	2022-03-25 17:44:19	2022-03-25 17:44:19	962	WDR\tZANDER, Vivian\t98\tDLRG Schlossholte-Stukenbrock	App\\Models\\Athlete	1084	11	5	0	\N	3243	12	13	[]	\N
19960	2022-03-25 17:44:19	2022-03-25 17:44:19	968	1.\tKITTEL, Christine\t85\tDLRG Niedersachsen\t1:07.08	App\\Models\\Athlete	438	11	5	\N	6708	3212	12	14	[]	\N
19961	2022-03-25 17:44:19	2022-03-25 17:44:19	969	2.\tLINDER, Anna\t86\tDLRG Nordrhein-Westfalen\t1:08.64	App\\Models\\Athlete	512	11	5	\N	6864	3219	12	14	[]	\N
19962	2022-03-25 17:44:19	2022-03-25 17:44:19	970	3.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t1:10.00	App\\Models\\Athlete	640	11	5	\N	7000	243	12	14	[]	\N
19963	2022-03-25 17:44:19	2022-03-25 17:44:19	971	4.\tSTEVENS, Danielle\t88\tRB Oss\t1:27.28	App\\Models\\Athlete	641	11	5	\N	8728	43	12	14	[]	\N
19964	2022-03-25 17:44:19	2022-03-25 17:44:19	973	1.\tROEMEN, Claudine\t74\tRB Echt\t1:10.67	App\\Models\\Athlete	125	11	5	\N	7067	15	12	15	[]	\N
19965	2022-03-25 17:44:19	2022-03-25 17:44:19	975	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t1:25.86	App\\Models\\Athlete	440	11	5	\N	8586	13	12	16	[]	\N
19966	2022-03-25 17:44:19	2022-03-25 17:44:19	976	2.\tVAN DE KOOIJ, Astrid\t64\tRB Dordrecht\t1:32.51	App\\Models\\Athlete	1085	11	5	\N	9251	13	12	16	[]	\N
19967	2022-03-25 17:44:19	2022-03-25 17:44:20	977	3.\tCELIE, Wilna\t58\tRB Dordrecht\t2:04.89	App\\Models\\Athlete	734	11	5	\N	12489	13	12	16	[]	\N
19968	2022-03-25 17:44:20	2022-03-25 17:44:20	978	4.\tLAPU-OS, Lelanie\t67\tRB Dordrecht\t2:19.76	App\\Models\\Athlete	521	11	5	\N	13976	13	12	16	[]	\N
19969	2022-03-25 17:44:20	2022-03-25 17:44:20	984	1.\tTURRADO ALVAREZ, Alberto\t04\tSpain NT\t53.03	App\\Models\\Athlete	1086	11	5	\N	5303	3204	12	12	[]	\N
19970	2022-03-25 17:44:20	2022-03-25 17:44:20	985	2.\tDURAGER, Tom\t05\tFrance NT\t57.14	App\\Models\\Athlete	1087	11	5	\N	5714	3205	12	12	[]	\N
19971	2022-03-25 17:44:20	2022-03-25 17:44:20	986	3.\tROGOZINSKI, Radoslaw\t03\tPolen NT\t57.23	App\\Models\\Athlete	1088	11	5	\N	5723	3234	12	12	[]	\N
19972	2022-03-25 17:44:20	2022-03-25 17:44:20	987	4.\tCHIAVACCI, Roberto\t04\tAccademia Di Salvamento\t57.82	App\\Models\\Athlete	1089	11	5	\N	5782	3203	12	12	[]	\N
19973	2022-03-25 17:44:20	2022-03-25 17:44:20	988	5.\tROGOZINSKI, Konrad\t04\tCKS Szczecin\t58.01	App\\Models\\Athlete	831	11	5	\N	5801	3227	12	12	[]	\N
19974	2022-03-25 17:44:20	2022-03-25 17:44:20	989	6.\tCWIKLINSKI, Jan\t04\tCKS Szczecin\t58.16	App\\Models\\Athlete	1090	11	5	\N	5816	3227	12	12	[]	\N
19975	2022-03-25 17:44:20	2022-03-25 17:44:20	990	7.\tROMERO FERNANDEZ, Ivan\t03\tSpain NT\t58.26	App\\Models\\Athlete	1091	11	5	\N	5826	3204	12	12	[]	\N
19976	2022-03-25 17:44:20	2022-03-25 17:44:20	991	8.\tKUIPHOF, Robin\t03\tRB Dordrecht\t58.28	App\\Models\\Athlete	737	11	5	\N	5828	13	12	12	[]	\N
19977	2022-03-25 17:44:20	2022-03-25 17:44:20	992	9.\tFORMANN, Brivael\t04\tLiege Sauvetage Club\t58.29	App\\Models\\Athlete	1092	11	5	\N	5829	3238	12	12	[]	\N
19978	2022-03-25 17:44:20	2022-03-25 17:44:20	993	10.\tNAZARUK, Piotr\t03\tCKS Szczecin\t59.05	App\\Models\\Athlete	1093	11	5	\N	5905	3227	12	12	[]	\N
19979	2022-03-25 17:44:20	2022-03-25 17:44:20	994	11.\tPUGGIONI, Antonio\t04\tAccademia Di Salvamento\t59.49	App\\Models\\Athlete	1094	11	5	\N	5949	3203	12	12	[]	\N
19980	2022-03-25 17:44:20	2022-03-25 17:44:20	995	12.\tABEL, Paul-Louis\t04\tDLRG Guetersloh\t59.52	App\\Models\\Athlete	1095	11	5	\N	5952	3220	12	12	[]	\N
19981	2022-03-25 17:44:20	2022-03-25 17:44:20	996	13.\tNEICA, Riccardo\t05\tIn Sport Rane Rosse\t1:00.31	App\\Models\\Athlete	1096	11	5	\N	6031	3208	12	12	[]	\N
19982	2022-03-25 17:44:20	2022-03-25 17:44:20	997	14.\tGRABSKI, Mateusz\t03\tPolen NT\t1:00.40	App\\Models\\Athlete	1036	11	5	\N	6040	3234	12	12	[]	\N
19983	2022-03-25 17:44:20	2022-03-25 17:44:20	998	KOSOWSKI, Dominik\t06\tMKS Szczecin\t1:00.40	App\\Models\\Athlete	1097	11	5	\N	6040	3236	12	12	[]	\N
19984	2022-03-25 17:44:20	2022-03-25 17:44:20	999	16.\tGIORGETTI, Mario\t06\tAthena Bracciano\t1:00.78	App\\Models\\Athlete	1098	11	5	\N	6078	3210	12	12	[]	\N
19985	2022-03-25 17:44:20	2022-03-25 17:44:20	1000	17.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t1:00.86	App\\Models\\Athlete	656	11	5	\N	6086	17	12	12	[]	\N
19986	2022-03-25 17:44:20	2022-03-25 17:44:20	1001	18.\tABBEEL, Stef\t05\tVZW Vrije Zwemmers Wenduine-De Haan\t1:01.60	App\\Models\\Athlete	1099	11	5	\N	6160	3244	12	12	[]	\N
19987	2022-03-25 17:44:20	2022-03-25 17:44:20	1002	19.\tCOLASANTI, Paolo\t05\tAccademia Di Salvamento\t1:01.96	App\\Models\\Athlete	1100	11	5	\N	6196	3203	12	12	[]	\N
19988	2022-03-25 17:44:20	2022-03-25 17:44:20	1003	20.\tDELLI PASSERI, Emanuele\t05\tASD Rosetana Nuoto\t1:01.97	App\\Models\\Athlete	1101	11	5	\N	6197	3215	12	12	[]	\N
19989	2022-03-25 17:44:20	2022-03-25 17:44:20	1004	21.\tQUIDACCIOLU, Tito\t03\tA.S.D. Sportiva Sturla\t1:02.06	App\\Models\\Athlete	1102	11	5	\N	6206	3235	12	12	[]	\N
19990	2022-03-25 17:44:20	2022-03-25 17:44:20	1005	22.\tKNUTS, Aiko\t06\tSint-Truidense RC\t1:02.60	App\\Models\\Athlete	1103	11	5	\N	6260	3214	12	12	[]	\N
6552	2022-02-19 13:27:45	2022-02-19 13:27:45	48	9.\tSTELTING, Carolin\t02\tDLRG Buchholz e.V.\t2:36.16	App\\Models\\Athlete	616	1	1	\N	15616	234	2	7	[]	\N
19991	2022-03-25 17:44:20	2022-03-25 17:44:20	1006	23.\tAIELLO, Axel\t05\tFrance NT\t1:02.81	App\\Models\\Athlete	1104	11	5	\N	6281	3205	12	12	[]	\N
19992	2022-03-25 17:44:20	2022-03-25 17:44:20	1007	24.\tBERNACCHIA, Paolo\t03\tAccademia Di Salvamento\t1:02.82	App\\Models\\Athlete	1105	11	5	\N	6282	3203	12	12	[]	\N
19993	2022-03-25 17:44:20	2022-03-25 17:44:20	1008	25.\tBIERNACIK, Szymon\t04\tMKS Szczecin\t1:03.08	App\\Models\\Athlete	1106	11	5	\N	6308	3236	12	12	[]	\N
19994	2022-03-25 17:44:20	2022-03-25 17:44:20	1009	26.\tVINZ, Maximilian\t05\tDLRG Sachsen-Anhalt\t1:03.41	App\\Models\\Athlete	1107	11	5	\N	6341	3209	12	12	[]	\N
19995	2022-03-25 17:44:20	2022-03-25 17:44:20	1010	27.\tPREUSS, Ben\t05\tDLRG Niedersachsen\t1:03.45	App\\Models\\Athlete	1108	11	5	\N	6345	3212	12	12	[]	\N
19996	2022-03-25 17:44:20	2022-03-25 17:44:20	1011	28.\tROSOLEN, Loris\t05\tLiege Sauvetage Club\t1:03.71	App\\Models\\Athlete	1109	11	5	\N	6371	3238	12	12	[]	\N
19997	2022-03-25 17:44:20	2022-03-25 17:44:20	1012	29.\tLO BUE, Tommaso\t06\tAthena Bracciano\t1:03.76	App\\Models\\Athlete	1110	11	5	\N	6376	3210	12	12	[]	\N
19998	2022-03-25 17:44:20	2022-03-25 17:44:20	1013	30.\tVAN BEEK, Jason\t04\tRB Echt\t1:03.77	App\\Models\\Athlete	1111	11	5	\N	6377	15	12	12	[]	\N
19999	2022-03-25 17:44:20	2022-03-25 17:44:20	1014	31.\tCROES, Matisse\t06\tSint-Truidense RC\t1:03.80	App\\Models\\Athlete	1112	11	5	\N	6380	3214	12	12	[]	\N
20000	2022-03-25 17:44:20	2022-03-25 17:44:20	1015	32.\tLEVEQUE, Simon\t05\tFrance NT\t1:03.98	App\\Models\\Athlete	1038	11	5	\N	6398	3205	12	12	[]	\N
20001	2022-03-25 17:44:20	2022-03-25 17:44:20	1139	51.\tVERHOEF, Jop\t02\tRB Dordrecht\t1:08.91	App\\Models\\Athlete	740	11	5	\N	6891	13	12	13	[]	\N
20002	2022-03-25 17:44:20	2022-03-25 17:44:20	1140	52.\tDE REUVER, Tim\t99\tRB Oss\t1:09.18	App\\Models\\Athlete	150	11	5	\N	6918	43	12	13	[]	\N
20003	2022-03-25 17:44:20	2022-03-25 17:44:20	1141	53.\tTERPORTEN, Phillip\t02\tDLRG Alpen\t1:09.25	App\\Models\\Athlete	1048	11	5	\N	6925	261	12	13	[]	\N
20004	2022-03-25 17:44:20	2022-03-25 17:44:20	1142	54.\tVAN DEN AKKER, Tom\t02\tRB Echt\t1:11.06	App\\Models\\Athlete	651	11	5	\N	7106	15	12	13	[]	\N
20005	2022-03-25 17:44:20	2022-03-25 17:44:20	1143	55.\tKREUTZ, Timm\t96\tKusel KiXXX\t1:11.27	App\\Models\\Athlete	163	11	5	\N	7127	3207	12	13	[]	\N
20006	2022-03-25 17:44:20	2022-03-25 17:44:20	1144	56.\tVAN HOFF, Bjoern\t02\tRB Waddinxveen\t1:17.28	App\\Models\\Athlete	853	11	5	\N	7728	3231	12	13	[]	\N
20007	2022-03-25 17:44:20	2022-03-25 17:44:20	1145	57.\tVERSPAGEN, Harry\t01\tRB Weert\t1:28.76	App\\Models\\Athlete	852	11	5	\N	8876	12	12	13	[]	\N
20008	2022-03-25 17:44:20	2022-03-25 17:44:20	1146	DSQ\tTHUMM, Fabian\t99\tDLRG Nordrhein-Westfalen	App\\Models\\Athlete	449	11	5	1	\N	3219	12	13	[]	\N
20009	2022-03-25 17:44:20	2022-03-25 17:44:20	1149	DSQ\tMELVIN, Jonas\t97\tDLRG Buchholz United	App\\Models\\Athlete	850	11	5	1	\N	3230	12	13	[]	\N
20010	2022-03-25 17:44:20	2022-03-25 17:44:20	1151	DSQ\tFRONTERA, Federico\t99\tAccademia Di Salvamento	App\\Models\\Athlete	1113	11	5	1	\N	3203	12	13	[]	\N
20011	2022-03-25 17:44:20	2022-03-25 17:44:20	1154	DNS\tIACONI, Nicolo\t02\tASD Rosetana Nuoto	App\\Models\\Athlete	1114	11	5	2	\N	3215	12	13	[]	\N
20012	2022-03-25 17:44:20	2022-03-25 17:44:20	1155	DNS\tENKING, Moritz\t96\tDLRG Buchholz United	App\\Models\\Athlete	855	11	5	2	\N	3230	12	13	[]	\N
20013	2022-03-25 17:44:20	2022-03-25 17:44:20	1156	DNF\tMORO, Massimiliano\t98\tIn Sport Rane Rosse	App\\Models\\Athlete	1115	11	5	3	\N	3208	12	13	[]	\N
20014	2022-03-25 17:44:20	2022-03-25 17:44:20	1158	1.\tGILARDI, Federico\t91\tItaly NT\t54.74	App\\Models\\Athlete	668	11	5	\N	5474	3201	12	14	[]	\N
20015	2022-03-25 17:44:20	2022-03-25 17:44:21	1159	2.\tSZURMIEJ, Mateusz\t85\tPolen NT\t1:01.15	App\\Models\\Athlete	1116	11	5	\N	6115	3234	12	14	[]	\N
20016	2022-03-25 17:44:21	2022-03-25 17:44:21	1160	3.\tFREY, Max\t86\tDLRG Buchholz United\t1:02.49	App\\Models\\Athlete	463	11	5	\N	6249	3230	12	14	[]	\N
20017	2022-03-25 17:44:21	2022-03-25 17:44:21	1161	4.\tVAN DE RIET, Stefan\t84\tRB Delft\t1:10.79	App\\Models\\Athlete	168	11	5	\N	7079	3221	12	14	[]	\N
20018	2022-03-25 17:44:21	2022-03-25 17:44:21	1162	5.\tDEN HARTOG, Jan-Willem\t86\tRB Amersfoort\t1:10.92	App\\Models\\Athlete	856	11	5	\N	7092	22	12	14	[]	\N
20019	2022-03-25 17:44:21	2022-03-25 17:44:21	1163	6.\tSIDORETTI, Stefano\t89\tAthena Bracciano\t1:11.55	App\\Models\\Athlete	167	11	5	\N	7155	3210	12	14	[]	\N
20020	2022-03-25 17:44:21	2022-03-25 17:44:21	1164	7.\tVAN DER HEIJDEN, Michiel\t86\tRB Staphorst\t1:16.76	App\\Models\\Athlete	752	11	5	\N	7676	26	12	14	[]	\N
20021	2022-03-25 17:44:21	2022-03-25 17:44:21	1165	8.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t1:18.11	App\\Models\\Athlete	579	11	5	\N	7811	22	12	14	[]	\N
20022	2022-03-25 17:44:21	2022-03-25 17:44:21	1166	DSQ\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg 	App\\Models\\Athlete	539	11	5	1	\N	39	12	14	[]	\N
20023	2022-03-25 17:44:21	2022-03-25 17:44:21	1168	DNF\tSTOPPELENBURG, Bart\t85\tRB Delft	App\\Models\\Athlete	858	11	5	3	\N	3221	12	14	[]	\N
20024	2022-03-25 17:44:21	2022-03-25 17:44:21	1170	1.\tVAN DE GOOR, Guus\t77\tRB Echt\t1:09.38	App\\Models\\Athlete	174	11	5	\N	6938	15	12	15	[]	\N
20025	2022-03-25 17:44:21	2022-03-25 17:44:21	1171	2.\tVAN DER MEER, Vincent\t79\tRB Delft\t1:12.47	App\\Models\\Athlete	464	11	5	\N	7247	3221	12	15	[]	\N
20026	2022-03-25 17:44:21	2022-03-25 17:44:21	1172	3.\tBASTURK, Burak\t72\tLiege Sauvetage Club\t1:12.94	App\\Models\\Athlete	1117	11	5	\N	7294	3238	12	15	[]	\N
20027	2022-03-25 17:44:21	2022-03-25 17:44:21	1173	4.\tBROWNE, David\t72\tSt. John Berchmans Life Saving Club\t1:16.28	App\\Models\\Athlete	1052	11	5	\N	7628	3242	12	15	[]	\N
20028	2022-03-25 17:44:21	2022-03-25 17:44:21	1174	DNF\tSHINN, Ryan\t80\tRB Amersfoort	App\\Models\\Athlete	171	11	5	3	\N	22	12	15	[]	\N
7574	2022-02-19 13:27:51	2022-02-19 13:27:51	1634	22.\tKUNK, Daniel\t90\tDLRG LV Niedersachsen\t2:38.34	App\\Models\\Athlete	680	1	6	\N	15834	236	2	8	[]	\N
20029	2022-03-25 17:44:21	2022-03-25 17:44:21	1176	1.\tROEMEN, Sven\t70\tRB Echt\t1:04.01	App\\Models\\Athlete	173	11	5	\N	6401	15	12	16	[]	\N
20030	2022-03-25 17:44:21	2022-03-25 17:44:21	1177	2.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t1:16.96	App\\Models\\Athlete	179	11	5	\N	7696	13	12	16	[]	\N
20031	2022-03-25 17:44:21	2022-03-25 17:44:21	1178	3.\tPRAET, Piet\t56\tRB Dordrecht\t1:19.77	App\\Models\\Athlete	693	11	5	\N	7977	13	12	16	[]	\N
20032	2022-03-25 17:44:21	2022-03-25 17:44:21	1179	DSQ\tVAN DAALEN, Erik\t65\tRB Gouda	App\\Models\\Athlete	175	11	5	1	\N	17	12	16	[]	\N
20034	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	420	11	23	\N	\N	\N	12	\N	[]	20033
20035	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	869	11	23	\N	\N	\N	12	\N	[]	20033
20036	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	121	11	23	\N	\N	\N	12	\N	[]	20033
20037	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	868	11	23	\N	\N	\N	12	\N	[]	20033
20033	2022-03-25 17:44:21	2022-03-25 17:44:21	1188	1.\tBelgium NT 1\tBelgium NT\t1:21.50	App\\Models\\RelayTeam	179	11	23	\N	8150	3206	12	\N	[]	\N
20039	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	81	11	23	\N	\N	\N	12	\N	[]	20038
20040	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	970	11	23	\N	\N	\N	12	\N	[]	20038
20041	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	82	11	23	\N	\N	\N	12	\N	[]	20038
20042	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	865	11	23	\N	\N	\N	12	\N	[]	20038
20038	2022-03-25 17:44:21	2022-03-25 17:44:21	1190	2.\tSpain NT 2\tSpain NT\t1:22.87	App\\Models\\RelayTeam	177	11	23	\N	8287	3204	12	\N	[]	\N
20044	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	861	11	23	\N	\N	\N	12	\N	[]	20043
20045	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	371	11	23	\N	\N	\N	12	\N	[]	20043
20046	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	862	11	23	\N	\N	\N	12	\N	[]	20043
20047	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	863	11	23	\N	\N	\N	12	\N	[]	20043
20043	2022-03-25 17:44:21	2022-03-25 17:44:21	1192	3.\tItaly NT 1\tItaly NT\t1:25.17	App\\Models\\RelayTeam	176	11	23	\N	8517	3201	12	\N	[]	\N
20049	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	823	11	23	\N	\N	\N	12	\N	[]	20048
20050	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	824	11	23	\N	\N	\N	12	\N	[]	20048
20051	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	866	11	23	\N	\N	\N	12	\N	[]	20048
20052	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	867	11	23	\N	\N	\N	12	\N	[]	20048
20048	2022-03-25 17:44:21	2022-03-25 17:44:21	1194	4.\tFrance NT 1\tFrance NT\t1:26.76	App\\Models\\RelayTeam	178	11	23	\N	8676	3205	12	\N	[]	\N
20054	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	978	11	23	\N	\N	\N	12	\N	[]	20053
20055	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	625	11	23	\N	\N	\N	12	\N	[]	20053
20056	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	818	11	23	\N	\N	\N	12	\N	[]	20053
20057	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	758	11	23	\N	\N	\N	12	\N	[]	20053
20053	2022-03-25 17:44:21	2022-03-25 17:44:21	1196	5.\tItaly NT 2\tItaly NT\t1:27.08	App\\Models\\RelayTeam	175	11	23	\N	8708	3201	12	\N	[]	\N
20059	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	870	11	23	\N	\N	\N	12	\N	[]	20058
20060	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	86	11	23	\N	\N	\N	12	\N	[]	20058
20061	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	1054	11	23	\N	\N	\N	12	\N	[]	20058
20062	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	186	11	23	\N	\N	\N	12	\N	[]	20058
20058	2022-03-25 17:44:21	2022-03-25 17:44:21	1198	6.\tSpain NT 1\tSpain NT\t1:28.59	App\\Models\\RelayTeam	181	11	23	\N	8859	3204	12	\N	[]	\N
20064	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	860	11	23	\N	\N	\N	12	\N	[]	20063
20065	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	822	11	23	\N	\N	\N	12	\N	[]	20063
20066	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	817	11	23	\N	\N	\N	12	\N	[]	20063
20067	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	859	11	23	\N	\N	\N	12	\N	[]	20063
20063	2022-03-25 17:44:21	2022-03-25 17:44:21	1200	7.\tPoland Dolnoslaskie Wopr 1\tPoland Dolnoslaskie Wopr\t1:29.09	App\\Models\\RelayTeam	174	11	23	\N	8909	3222	12	\N	[]	\N
20069	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	208	11	23	\N	\N	\N	12	\N	[]	20068
20070	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	19	11	23	\N	\N	\N	12	\N	[]	20068
20071	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	200	11	23	\N	\N	\N	12	\N	[]	20068
20072	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	199	11	23	\N	\N	\N	12	\N	[]	20068
20068	2022-03-25 17:44:21	2022-03-25 17:44:21	1202	8.\tNederland NT 1\tNederland NT\t1:31.48	App\\Models\\RelayTeam	180	11	23	\N	9148	3218	12	\N	[]	\N
20074	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	206	11	23	\N	\N	\N	12	\N	[]	20073
20075	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	871	11	23	\N	\N	\N	12	\N	[]	20073
20076	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	825	11	23	\N	\N	\N	12	\N	[]	20073
20077	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	790	11	23	\N	\N	\N	12	\N	[]	20073
20073	2022-03-25 17:44:21	2022-03-25 17:44:21	1204	9.\tDLRG Sachsen-Anhalt 1\tDLRG Sachsen-Anhalt\t1:34.98	App\\Models\\RelayTeam	182	11	23	\N	9498	3209	12	\N	[]	\N
20078	2022-03-25 17:44:21	2022-03-25 17:44:21	1206	10.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t1:36.86	App\\Models\\RelayTeam	187	11	23	\N	9686	3203	12	\N	[]	\N
20079	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	4	11	23	\N	\N	\N	12	\N	[]	20078
20080	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	395	11	23	\N	\N	\N	12	\N	[]	20078
20081	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	10	11	23	\N	\N	\N	12	\N	[]	20078
20082	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	23	11	23	\N	\N	\N	12	\N	[]	20078
20084	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	880	11	23	\N	\N	\N	12	\N	[]	20083
20085	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	792	11	23	\N	\N	\N	12	\N	[]	20083
20086	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	1056	11	23	\N	\N	\N	12	\N	[]	20083
20087	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	879	11	23	\N	\N	\N	12	\N	[]	20083
20083	2022-03-25 17:44:21	2022-03-25 17:44:21	1208	11.\tSlaskie WOPR 1\tSlaskie WOPR\t1:39.18	App\\Models\\RelayTeam	186	11	23	\N	9918	3211	12	\N	[]	\N
20089	2022-03-25 17:44:21	2022-03-25 17:44:21	\N	\N	App\\Models\\Athlete	795	11	23	\N	\N	\N	12	\N	[]	20088
20090	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	873	11	23	\N	\N	\N	12	\N	[]	20088
20091	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	787	11	23	\N	\N	\N	12	\N	[]	20088
20092	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	874	11	23	\N	\N	\N	12	\N	[]	20088
20088	2022-03-25 17:44:21	2022-03-25 17:44:22	1210	12.\tFrance NT 2\tFrance NT\t1:39.20	App\\Models\\RelayTeam	184	11	23	\N	9920	3205	12	\N	[]	\N
20094	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	875	11	23	\N	\N	\N	12	\N	[]	20093
20095	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	877	11	23	\N	\N	\N	12	\N	[]	20093
20096	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	878	11	23	\N	\N	\N	12	\N	[]	20093
20097	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	876	11	23	\N	\N	\N	12	\N	[]	20093
20093	2022-03-25 17:44:22	2022-03-25 17:44:22	1212	13.\tCKS Szczecin 1\tCKS Szczecin\t1:40.22	App\\Models\\RelayTeam	185	11	23	\N	10022	3227	12	\N	[]	\N
20099	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	804	11	23	\N	\N	\N	12	\N	[]	20098
20100	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	801	11	23	\N	\N	\N	12	\N	[]	20098
20101	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	794	11	23	\N	\N	\N	12	\N	[]	20098
20102	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	807	11	23	\N	\N	\N	12	\N	[]	20098
20098	2022-03-25 17:44:22	2022-03-25 17:44:22	1214	14.\tDLRG Niedersachsen 2\tDLRG Niedersachsen\t1:41.29	App\\Models\\RelayTeam	189	11	23	\N	10129	3212	12	\N	[]	\N
20104	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	97	11	23	\N	\N	\N	12	\N	[]	20103
20105	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	791	11	23	\N	\N	\N	12	\N	[]	20103
20106	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	796	11	23	\N	\N	\N	12	\N	[]	20103
20107	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	872	11	23	\N	\N	\N	12	\N	[]	20103
20103	2022-03-25 17:44:22	2022-03-25 17:44:22	1216	15.\tAthena Bracciano 1\tAthena Bracciano\t1:41.99	App\\Models\\RelayTeam	183	11	23	\N	10199	3210	12	\N	[]	\N
20109	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	210	11	23	\N	\N	\N	12	\N	[]	20108
20110	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	41	11	23	\N	\N	\N	12	\N	[]	20108
20111	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	33	11	23	\N	\N	\N	12	\N	[]	20108
20112	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	882	11	23	\N	\N	\N	12	\N	[]	20108
20108	2022-03-25 17:44:22	2022-03-25 17:44:22	1218	16.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t1:43.59	App\\Models\\RelayTeam	192	11	23	\N	10359	3212	12	\N	[]	\N
20114	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	26	11	23	\N	\N	\N	12	\N	[]	20113
20115	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	35	11	23	\N	\N	\N	12	\N	[]	20113
20116	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	125	11	23	\N	\N	\N	12	\N	[]	20113
20117	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	238	11	23	\N	\N	\N	12	\N	[]	20113
20113	2022-03-25 17:44:22	2022-03-25 17:44:22	1220	17.\tRB Echt 1\tRB Echt\t1:43.97	App\\Models\\RelayTeam	190	11	23	\N	10397	15	12	\N	[]	\N
20119	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	204	11	23	\N	\N	\N	12	\N	[]	20118
20120	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	881	11	23	\N	\N	\N	12	\N	[]	20118
20121	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	60	11	23	\N	\N	\N	12	\N	[]	20118
20122	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	39	11	23	\N	\N	\N	12	\N	[]	20118
20118	2022-03-25 17:44:22	2022-03-25 17:44:22	1222	18.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t1:45.71	App\\Models\\RelayTeam	188	11	23	\N	10571	3219	12	\N	[]	\N
20124	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	559	11	23	\N	\N	\N	12	\N	[]	20123
20125	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	883	11	23	\N	\N	\N	12	\N	[]	20123
20126	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	47	11	23	\N	\N	\N	12	\N	[]	20123
20127	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	42	11	23	\N	\N	\N	12	\N	[]	20123
20123	2022-03-25 17:44:22	2022-03-25 17:44:22	1224	19.\tDLRG Alpen 1\tDLRG Alpen\t1:50.23	App\\Models\\RelayTeam	193	11	23	\N	11023	261	12	\N	[]	\N
20129	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	1081	11	23	\N	\N	\N	12	\N	[]	20128
20130	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	805	11	23	\N	\N	\N	12	\N	[]	20128
20131	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	93	11	23	\N	\N	\N	12	\N	[]	20128
6553	2022-02-19 13:27:45	2022-02-19 13:27:45	49	10.\tDEN BOEF, Abigail\t02\tRB Dordrecht\t2:36.60	App\\Models\\Athlete	25	1	1	\N	15660	13	2	7	[]	\N
20132	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	21	11	23	\N	\N	\N	12	\N	[]	20128
20128	2022-03-25 17:44:22	2022-03-25 17:44:22	1226	20.\tAthena Bracciano 2\tAthena Bracciano\t1:51.79	App\\Models\\RelayTeam	191	11	23	\N	11179	3210	12	\N	[]	\N
20134	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	885	11	23	\N	\N	\N	12	\N	[]	20133
20135	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	884	11	23	\N	\N	\N	12	\N	[]	20133
20136	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	810	11	23	\N	\N	\N	12	\N	[]	20133
20137	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	886	11	23	\N	\N	\N	12	\N	[]	20133
20133	2022-03-25 17:44:22	2022-03-25 17:44:22	1228	21.\tAthena Salvamento 1\tAthena Salvamento\t1:52.21	App\\Models\\RelayTeam	194	11	23	\N	11221	3213	12	\N	[]	\N
20139	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	887	11	23	\N	\N	\N	12	\N	[]	20138
20140	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	888	11	23	\N	\N	\N	12	\N	[]	20138
20141	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	808	11	23	\N	\N	\N	12	\N	[]	20138
20142	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	797	11	23	\N	\N	\N	12	\N	[]	20138
20138	2022-03-25 17:44:22	2022-03-25 17:44:22	1230	22.\tAthena Salvamento 2\tAthena Salvamento\t1:58.45	App\\Models\\RelayTeam	195	11	23	\N	11845	3213	12	\N	[]	\N
20144	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	971	11	23	\N	\N	\N	12	\N	[]	20143
20145	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	581	11	23	\N	\N	\N	12	\N	[]	20143
20146	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	891	11	23	\N	\N	\N	12	\N	[]	20143
20147	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	108	11	23	\N	\N	\N	12	\N	[]	20143
20143	2022-03-25 17:44:22	2022-03-25 17:44:22	1232	23.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t2:01.07	App\\Models\\RelayTeam	198	11	23	\N	12107	39	12	\N	[]	\N
20149	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	979	11	23	\N	\N	\N	12	\N	[]	20148
20150	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	980	11	23	\N	\N	\N	12	\N	[]	20148
20151	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	892	11	23	\N	\N	\N	12	\N	[]	20148
20152	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	72	11	23	\N	\N	\N	12	\N	[]	20148
20148	2022-03-25 17:44:22	2022-03-25 17:44:22	1239	24.\tRB Echt 2\tRB Echt\t2:04.36	App\\Models\\RelayTeam	199	11	23	\N	12436	15	12	\N	[]	\N
20154	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	68	11	23	\N	\N	\N	12	\N	[]	20153
20155	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	815	11	23	\N	\N	\N	12	\N	[]	20153
20156	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	239	11	23	\N	\N	\N	12	\N	[]	20153
20157	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	812	11	23	\N	\N	\N	12	\N	[]	20153
20153	2022-03-25 17:44:22	2022-03-25 17:44:22	1241	25.\tDLRG Gütersloh 1\tDLRG Guetersloh\t2:05.70	App\\Models\\RelayTeam	197	11	23	\N	12570	3220	12	\N	[]	\N
20159	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	51	11	23	\N	\N	\N	12	\N	[]	20158
20160	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	249	11	23	\N	\N	\N	12	\N	[]	20158
20161	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	62	11	23	\N	\N	\N	12	\N	[]	20158
20162	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	248	11	23	\N	\N	\N	12	\N	[]	20158
20158	2022-03-25 17:44:22	2022-03-25 17:44:22	1243	26.\tRB Staphorst 1\tRB Staphorst\t2:09.37	App\\Models\\RelayTeam	196	11	23	\N	12937	26	12	\N	[]	\N
20164	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	262	11	23	\N	\N	\N	12	\N	[]	20163
20165	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	898	11	23	\N	\N	\N	12	\N	[]	20163
20166	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	899	11	23	\N	\N	\N	12	\N	[]	20163
20167	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	900	11	23	\N	\N	\N	12	\N	[]	20163
20163	2022-03-25 17:44:22	2022-03-25 17:44:22	1249	1.\tSpain NT 2\tSpain NT\t1:07.20	App\\Models\\RelayTeam	202	11	23	\N	6720	3204	12	\N	[]	\N
20169	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	906	11	23	\N	\N	\N	12	\N	[]	20168
20170	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	907	11	23	\N	\N	\N	12	\N	[]	20168
20171	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	905	11	23	\N	\N	\N	12	\N	[]	20168
20172	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	904	11	23	\N	\N	\N	12	\N	[]	20168
20168	2022-03-25 17:44:22	2022-03-25 17:44:22	1251	2.\tPolen NT 1\tPolen NT\t1:08.27	App\\Models\\RelayTeam	204	11	23	\N	6827	3234	12	\N	[]	\N
20174	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	442	11	23	\N	\N	\N	12	\N	[]	20173
20175	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	255	11	23	\N	\N	\N	12	\N	[]	20173
20176	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	897	11	23	\N	\N	\N	12	\N	[]	20173
20177	2022-03-25 17:44:22	2022-03-25 17:44:22	\N	\N	App\\Models\\Athlete	668	11	23	\N	\N	\N	12	\N	[]	20173
20173	2022-03-25 17:44:22	2022-03-25 17:44:22	1253	3.\tItaly NT 1\tItaly NT\t1:08.37	App\\Models\\RelayTeam	201	11	23	\N	6837	3201	12	\N	[]	\N
20179	2022-03-25 17:44:22	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	901	11	23	\N	\N	\N	12	\N	[]	20178
20180	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	446	11	23	\N	\N	\N	12	\N	[]	20178
20181	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	254	11	23	\N	\N	\N	12	\N	[]	20178
20182	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	902	11	23	\N	\N	\N	12	\N	[]	20178
20178	2022-03-25 17:44:22	2022-03-25 17:44:23	1255	4.\tItaly NT 2\tItaly NT\t1:10.02	App\\Models\\RelayTeam	203	11	23	\N	7002	3201	12	\N	[]	\N
20184	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	909	11	23	\N	\N	\N	12	\N	[]	20183
20185	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	267	11	23	\N	\N	\N	12	\N	[]	20183
20186	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	829	11	23	\N	\N	\N	12	\N	[]	20183
20187	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	908	11	23	\N	\N	\N	12	\N	[]	20183
20183	2022-03-25 17:44:23	2022-03-25 17:44:23	1257	5.\tSpain NT 1\tSpain NT\t1:11.56	App\\Models\\RelayTeam	205	11	23	\N	7156	3204	12	\N	[]	\N
20189	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	917	11	23	\N	\N	\N	12	\N	[]	20188
20190	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	916	11	23	\N	\N	\N	12	\N	[]	20188
20191	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	918	11	23	\N	\N	\N	12	\N	[]	20188
20192	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	830	11	23	\N	\N	\N	12	\N	[]	20188
20188	2022-03-25 17:44:23	2022-03-25 17:44:23	1259	6.\tSAFA 2000 1\tSAFA 2000\t1:13.83	App\\Models\\RelayTeam	208	11	23	\N	7383	3202	12	\N	[]	\N
20194	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	910	11	23	\N	\N	\N	12	\N	[]	20193
20195	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	911	11	23	\N	\N	\N	12	\N	[]	20193
20196	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	912	11	23	\N	\N	\N	12	\N	[]	20193
20197	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	913	11	23	\N	\N	\N	12	\N	[]	20193
20193	2022-03-25 17:44:23	2022-03-25 17:44:23	1261	7.\tFrance NT 2\tFrance NT\t1:14.61	App\\Models\\RelayTeam	206	11	23	\N	7461	3205	12	\N	[]	\N
20199	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	915	11	23	\N	\N	\N	12	\N	[]	20198
20200	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	1118	11	23	\N	\N	\N	12	\N	[]	20198
20201	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	832	11	23	\N	\N	\N	12	\N	[]	20198
20202	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	914	11	23	\N	\N	\N	12	\N	[]	20198
20198	2022-03-25 17:44:23	2022-03-25 17:44:23	1263	8.\tASD Gorizia Nuoto 1\tASD Gorizia Nuoto\t1:16.44	App\\Models\\RelayTeam	207	11	23	\N	7644	3224	12	\N	[]	\N
20204	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	920	11	23	\N	\N	\N	12	\N	[]	20203
20205	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	919	11	23	\N	\N	\N	12	\N	[]	20203
20206	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	921	11	23	\N	\N	\N	12	\N	[]	20203
20207	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	922	11	23	\N	\N	\N	12	\N	[]	20203
20203	2022-03-25 17:44:23	2022-03-25 17:44:23	1265	9.\tA.S.D. Sportiva Sturla 1\tA.S.D. Sportiva Sturla\t1:17.20	App\\Models\\RelayTeam	209	11	23	\N	7720	3235	12	\N	[]	\N
20209	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	928	11	23	\N	\N	\N	12	\N	[]	20208
20210	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	831	11	23	\N	\N	\N	12	\N	[]	20208
20211	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	927	11	23	\N	\N	\N	12	\N	[]	20208
20212	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	1090	11	23	\N	\N	\N	12	\N	[]	20208
20208	2022-03-25 17:44:23	2022-03-25 17:44:23	1267	10.\tCKS Szczecin 1\tCKS Szczecin\t1:19.22	App\\Models\\RelayTeam	213	11	23	\N	7922	3227	12	\N	[]	\N
20214	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	851	11	23	\N	\N	\N	12	\N	[]	20213
20215	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	847	11	23	\N	\N	\N	12	\N	[]	20213
20216	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	133	11	23	\N	\N	\N	12	\N	[]	20213
20217	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	289	11	23	\N	\N	\N	12	\N	[]	20213
20213	2022-03-25 17:44:23	2022-03-25 17:44:23	1269	11.\tAthena Bracciano 1\tAthena Bracciano\t1:19.48	App\\Models\\RelayTeam	210	11	23	\N	7948	3210	12	\N	[]	\N
20219	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	285	11	23	\N	\N	\N	12	\N	[]	20218
20220	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	286	11	23	\N	\N	\N	12	\N	[]	20218
20221	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	383	11	23	\N	\N	\N	12	\N	[]	20218
20222	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	989	11	23	\N	\N	\N	12	\N	[]	20218
20218	2022-03-25 17:44:23	2022-03-25 17:44:23	1271	12.\tDLRG Gütersloh 1\tDLRG Guetersloh\t1:19.70	App\\Models\\RelayTeam	249	11	23	\N	7970	3220	12	\N	[]	\N
20224	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	893	11	23	\N	\N	\N	12	\N	[]	20223
20225	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	894	11	23	\N	\N	\N	12	\N	[]	20223
20226	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	896	11	23	\N	\N	\N	12	\N	[]	20223
20227	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	895	11	23	\N	\N	\N	12	\N	[]	20223
20223	2022-03-25 17:44:23	2022-03-25 17:44:23	1273	13.\tHungarian NT 1\tHungarian NT\t1:20.52	App\\Models\\RelayTeam	200	11	23	\N	8052	3233	12	\N	[]	\N
20229	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	298	11	23	\N	\N	\N	12	\N	[]	20228
20230	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	299	11	23	\N	\N	\N	12	\N	[]	20228
20231	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	954	11	23	\N	\N	\N	12	\N	[]	20228
20232	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	934	11	23	\N	\N	\N	12	\N	[]	20228
20228	2022-03-25 17:44:23	2022-03-25 17:44:23	1275	14.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t1:20.71	App\\Models\\RelayTeam	216	11	23	\N	8071	3203	12	\N	[]	\N
6554	2022-02-19 13:27:45	2022-02-19 13:27:45	50	11.\tSMIT, Carli\t02\tSouth Africa\t2:38.58	App\\Models\\Athlete	617	1	1	\N	15858	232	2	7	[]	\N
20234	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	283	11	23	\N	\N	\N	12	\N	[]	20233
20235	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	282	11	23	\N	\N	\N	12	\N	[]	20233
20236	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	929	11	23	\N	\N	\N	12	\N	[]	20233
20237	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	284	11	23	\N	\N	\N	12	\N	[]	20233
20233	2022-03-25 17:44:23	2022-03-25 17:44:23	1277	15.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t1:21.20	App\\Models\\RelayTeam	214	11	23	\N	8120	3219	12	\N	[]	\N
20239	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	1119	11	23	\N	\N	\N	12	\N	[]	20238
20240	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	923	11	23	\N	\N	\N	12	\N	[]	20238
20241	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	1120	11	23	\N	\N	\N	12	\N	[]	20238
20242	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	925	11	23	\N	\N	\N	12	\N	[]	20238
20238	2022-03-25 17:44:23	2022-03-25 17:44:23	1279	16.\tDLRG Luckenwalde 1\tDLRG Luckenwalde\t1:22.44	App\\Models\\RelayTeam	211	11	23	\N	8244	3225	12	\N	[]	\N
20244	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	135	11	23	\N	\N	\N	12	\N	[]	20243
20245	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	280	11	23	\N	\N	\N	12	\N	[]	20243
20246	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	149	11	23	\N	\N	\N	12	\N	[]	20243
20247	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	307	11	23	\N	\N	\N	12	\N	[]	20243
20243	2022-03-25 17:44:23	2022-03-25 17:44:23	1281	17.\tRB Echt 1\tRB Echt\t1:24.69	App\\Models\\RelayTeam	221	11	23	\N	8469	15	12	\N	[]	\N
20249	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	326	11	23	\N	\N	\N	12	\N	[]	20248
20250	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	676	11	23	\N	\N	\N	12	\N	[]	20248
20251	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	850	11	23	\N	\N	\N	12	\N	[]	20248
20252	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	855	11	23	\N	\N	\N	12	\N	[]	20248
20248	2022-03-25 17:44:23	2022-03-25 17:44:23	1283	18.\tDLRG Buchholz United 1\tDLRG Buchholz United\t1:25.51	App\\Models\\RelayTeam	218	11	23	\N	8551	3230	12	\N	[]	\N
20254	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	930	11	23	\N	\N	\N	12	\N	[]	20253
20255	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	931	11	23	\N	\N	\N	12	\N	[]	20253
20256	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	932	11	23	\N	\N	\N	12	\N	[]	20253
20257	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	933	11	23	\N	\N	\N	12	\N	[]	20253
20253	2022-03-25 17:44:23	2022-03-25 17:44:23	1290	19.\tFrance NT 1\tFrance NT\t1:25.86	App\\Models\\RelayTeam	215	11	23	\N	8586	3205	12	\N	[]	\N
20259	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	566	11	23	\N	\N	\N	12	\N	[]	20258
20260	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	565	11	23	\N	\N	\N	12	\N	[]	20258
20261	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	737	11	23	\N	\N	\N	12	\N	[]	20258
20262	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	841	11	23	\N	\N	\N	12	\N	[]	20258
20258	2022-03-25 17:44:23	2022-03-25 17:44:23	1292	20.\tRB Dordrecht 1\tRB Dordrecht\t1:26.80	App\\Models\\RelayTeam	255	11	23	\N	8680	13	12	\N	[]	\N
20264	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	950	11	23	\N	\N	\N	12	\N	[]	20263
20265	2022-03-25 17:44:23	2022-03-25 17:44:23	\N	\N	App\\Models\\Athlete	952	11	23	\N	\N	\N	12	\N	[]	20263
20266	2022-03-25 17:44:23	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	951	11	23	\N	\N	\N	12	\N	[]	20263
20267	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	949	11	23	\N	\N	\N	12	\N	[]	20263
20263	2022-03-25 17:44:23	2022-03-25 17:44:24	1294	21.\tAthena Bracciano 2\tAthena Bracciano\t1:29.24	App\\Models\\RelayTeam	223	11	23	\N	8924	3210	12	\N	[]	\N
20269	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	944	11	23	\N	\N	\N	12	\N	[]	20268
20270	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	839	11	23	\N	\N	\N	12	\N	[]	20268
20271	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	942	11	23	\N	\N	\N	12	\N	[]	20268
20272	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	943	11	23	\N	\N	\N	12	\N	[]	20268
20268	2022-03-25 17:44:24	2022-03-25 17:44:24	1296	22.\tSlaskie WOPR 1\tSlaskie WOPR\t1:29.39	App\\Models\\RelayTeam	220	11	23	\N	8939	3211	12	\N	[]	\N
20274	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	308	11	23	\N	\N	\N	12	\N	[]	20273
20275	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	958	11	23	\N	\N	\N	12	\N	[]	20273
20276	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	986	11	23	\N	\N	\N	12	\N	[]	20273
20277	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	987	11	23	\N	\N	\N	12	\N	[]	20273
20273	2022-03-25 17:44:24	2022-03-25 17:44:24	1298	23.\tRB Echt 2\tRB Echt\t1:29.55	App\\Models\\RelayTeam	226	11	23	\N	8955	15	12	\N	[]	\N
20279	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	945	11	23	\N	\N	\N	12	\N	[]	20278
20280	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	946	11	23	\N	\N	\N	12	\N	[]	20278
20281	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	947	11	23	\N	\N	\N	12	\N	[]	20278
20282	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	948	11	23	\N	\N	\N	12	\N	[]	20278
20278	2022-03-25 17:44:24	2022-03-25 17:44:24	1300	24.\tDLRG Nordrhein-Westfalen 2\tDLRG Nordrhein-Westfalen\t1:30.00	App\\Models\\RelayTeam	222	11	23	\N	9000	3219	12	\N	[]	\N
20283	2022-03-25 17:44:24	2022-03-25 17:44:24	1302	25.\tDLRG Alpen 1\tDLRG Alpen\t1:31.89	App\\Models\\RelayTeam	224	11	23	\N	9189	261	12	\N	[]	\N
20284	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	953	11	23	\N	\N	\N	12	\N	[]	20283
20285	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	340	11	23	\N	\N	\N	12	\N	[]	20283
20286	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	338	11	23	\N	\N	\N	12	\N	[]	20283
20287	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	337	11	23	\N	\N	\N	12	\N	[]	20283
20289	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	935	11	23	\N	\N	\N	12	\N	[]	20288
20290	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	957	11	23	\N	\N	\N	12	\N	[]	20288
20291	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	955	11	23	\N	\N	\N	12	\N	[]	20288
20292	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	994	11	23	\N	\N	\N	12	\N	[]	20288
20288	2022-03-25 17:44:24	2022-03-25 17:44:24	1304	26.\tAccademia Di Salvamento 2\tAccademia Di Salvamento\t1:32.46	App\\Models\\RelayTeam	225	11	23	\N	9246	3203	12	\N	[]	\N
20294	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	960	11	23	\N	\N	\N	12	\N	[]	20293
20295	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	961	11	23	\N	\N	\N	12	\N	[]	20293
20296	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	962	11	23	\N	\N	\N	12	\N	[]	20293
20297	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	333	11	23	\N	\N	\N	12	\N	[]	20293
20293	2022-03-25 17:44:24	2022-03-25 17:44:24	1306	27.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t1:33.89	App\\Models\\RelayTeam	227	11	23	\N	9389	39	12	\N	[]	\N
20299	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	941	11	23	\N	\N	\N	12	\N	[]	20298
20300	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	290	11	23	\N	\N	\N	12	\N	[]	20298
20301	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	562	11	23	\N	\N	\N	12	\N	[]	20298
20302	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	940	11	23	\N	\N	\N	12	\N	[]	20298
20298	2022-03-25 17:44:24	2022-03-25 17:44:24	1308	28.\tAthena Salvamento 1\tAthena Salvamento\t1:35.05	App\\Models\\RelayTeam	219	11	23	\N	9505	3213	12	\N	[]	\N
20304	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	963	11	23	\N	\N	\N	12	\N	[]	20303
20305	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	965	11	23	\N	\N	\N	12	\N	[]	20303
20306	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	966	11	23	\N	\N	\N	12	\N	[]	20303
20307	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	964	11	23	\N	\N	\N	12	\N	[]	20303
20303	2022-03-25 17:44:24	2022-03-25 17:44:24	1310	29.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t1:57.21	App\\Models\\RelayTeam	228	11	23	\N	11721	3212	12	\N	[]	\N
20309	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	967	11	23	\N	\N	\N	12	\N	[]	20308
20310	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	351	11	23	\N	\N	\N	12	\N	[]	20308
20311	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	968	11	23	\N	\N	\N	12	\N	[]	20308
20312	2022-03-25 17:44:24	2022-03-25 17:44:24	\N	\N	App\\Models\\Athlete	350	11	23	\N	\N	\N	12	\N	[]	20308
20308	2022-03-25 17:44:24	2022-03-25 17:44:24	1312	30.\tRB Staphorst 1\tRB Staphorst\t2:08.52	App\\Models\\RelayTeam	229	11	23	\N	12852	26	12	\N	[]	\N
20313	2022-03-25 17:44:24	2022-03-25 17:44:24	1314	DSQ\tASD Rosetana Nuoto 1\tASD Rosetana Nuoto	App\\Models\\RelayTeam	212	11	23	1	\N	3215	12	\N	[]	\N
20314	2022-03-25 17:44:24	2022-03-25 17:44:24	1318	DSQ\tMKS Szczecin 1\tMKS Szczecin	App\\Models\\RelayTeam	217	11	23	1	\N	3236	12	\N	[]	\N
20315	2022-03-25 17:44:24	2022-03-25 17:44:24	1321	DNS\tRB Delft 1\tRB Delft	App\\Models\\RelayTeam	231	11	23	2	\N	3221	12	\N	[]	\N
20316	2022-03-25 17:44:24	2022-03-25 17:44:24	1322	DNS\tRB Gouda 1\tRB Gouda	App\\Models\\RelayTeam	232	11	23	2	\N	17	12	\N	[]	\N
20317	2022-03-25 17:44:24	2022-03-25 17:44:24	1328	1.\tCABALLERO FUSET, Lola\t04\tSpain NT\t2:30.75	App\\Models\\Athlete	393	11	6	\N	15075	3204	12	12	[]	\N
20318	2022-03-25 17:44:24	2022-03-25 17:44:24	1329	2.\tMAZZI, Gioia\t04\tAccademia Di Salvamento\t2:36.45	App\\Models\\Athlete	4	11	6	\N	15645	3203	12	12	[]	\N
20319	2022-03-25 17:44:24	2022-03-25 17:44:24	1330	3.\tDARAIO, MADDALENA\t03\tSAFA 2000\t2:38.34	App\\Models\\Athlete	785	11	6	\N	15834	3202	12	12	[]	\N
20320	2022-03-25 17:44:24	2022-03-25 17:44:24	1331	4.\tPOJUM, Sofia\t06\tIn Sport Rane Rosse\t2:38.45	App\\Models\\Athlete	1003	11	6	\N	15845	3208	12	12	[]	\N
20321	2022-03-25 17:44:24	2022-03-25 17:44:24	1332	5.\tGIORDANO, Masha\t04\tItaly NT\t2:38.87	App\\Models\\Athlete	7	11	6	\N	15887	3201	12	12	[]	\N
20322	2022-03-25 17:44:24	2022-03-25 17:44:24	1333	6.\tTIRONI, Alice\t05\tSDS - Specialisti dello Sport \t2:39.71	App\\Models\\Athlete	1002	11	6	\N	15971	3228	12	12	[]	\N
20323	2022-03-25 17:44:24	2022-03-25 17:44:24	1334	7.\tBARRENA PONCE, Sheila\t03\tSpain NT\t2:41.88	App\\Models\\Athlete	1054	11	6	\N	16188	3204	12	12	[]	\N
20324	2022-03-25 17:44:24	2022-03-25 17:44:24	1335	8.\tTUBILI, Francesca\t06\tIn Sport Rane Rosse\t2:44.19	App\\Models\\Athlete	1069	11	6	\N	16419	3208	12	12	[]	\N
20325	2022-03-25 17:44:24	2022-03-25 17:44:24	1336	9.\tOPPERMANN, Lena\t05\tDLRG Sachsen-Anhalt\t2:45.03	App\\Models\\Athlete	1000	11	6	\N	16503	3209	12	12	[]	\N
20326	2022-03-25 17:44:24	2022-03-25 17:44:24	1342	10.\tCLOTEAUX, Louenn\t05\tFrance NT\t2:45.51	App\\Models\\Athlete	1004	11	6	\N	16551	3205	12	12	[]	\N
20327	2022-03-25 17:44:24	2022-03-25 17:44:24	1343	11.\tDELL'OSPEDALE, Sara\t03\tAccademia Di Salvamento\t2:45.94	App\\Models\\Athlete	10	11	6	\N	16594	3203	12	12	[]	\N
20328	2022-03-25 17:44:24	2022-03-25 17:44:24	1344	12.\tZECH, Gina\t05\tDLRG Sachsen-Anhalt\t2:46.60	App\\Models\\Athlete	1005	11	6	\N	16660	3209	12	12	[]	\N
20329	2022-03-25 17:44:24	2022-03-25 17:44:24	1345	13.\tBENZMUELLER, Magdalena\t05\tKusel KiXXX\t2:47.28	App\\Models\\Athlete	788	11	6	\N	16728	3207	12	12	[]	\N
7575	2022-02-19 13:27:51	2022-02-19 13:27:51	1635	23.\tWILLEMS, Luuk\t97\tRB Echt\t2:41.10	App\\Models\\Athlete	142	1	6	\N	16110	15	2	8	[]	\N
20330	2022-03-25 17:44:24	2022-03-25 17:44:24	1346	14.\tPASQUALI, Carlotta\t06\tAthena Bracciano\t2:47.30	App\\Models\\Athlete	796	11	6	\N	16730	3210	12	12	[]	\N
20331	2022-03-25 17:44:24	2022-03-25 17:44:24	1347	15.\tBONHOMME, Meline\t04\tLiege Sauvetage Club\t2:48.76	App\\Models\\Athlete	1006	11	6	\N	16876	3238	12	12	[]	\N
20332	2022-03-25 17:44:24	2022-03-25 17:44:24	1348	16.\tPASEK, Natalia\t05\tSlaskie WOPR\t2:49.32	App\\Models\\Athlete	1056	11	6	\N	16932	3211	12	12	[]	\N
20333	2022-03-25 17:44:24	2022-03-25 17:44:24	1349	17.\tFELLENSIEK, Talea\t04\tDLRG Niedersachsen\t2:49.92	App\\Models\\Athlete	801	11	6	\N	16992	3212	12	12	[]	\N
20334	2022-03-25 17:44:24	2022-03-25 17:44:24	1350	18.\tDE GREEF, Ruth\t03\tRctal\t2:50.03	App\\Models\\Athlete	1009	11	6	\N	17003	3217	12	12	[]	\N
20335	2022-03-25 17:44:24	2022-03-25 17:44:24	1351	19.\tGIORDANO, Melissa\t06\tAthena Bracciano\t2:51.32	App\\Models\\Athlete	1053	11	6	\N	17132	3210	12	12	[]	\N
20336	2022-03-25 17:44:24	2022-03-25 17:44:25	1352	20.\tPETRUNGARO, Laura\t06\tIn Sport Rane Rosse\t2:51.33	App\\Models\\Athlete	1061	11	6	\N	17133	3208	12	12	[]	\N
20337	2022-03-25 17:44:25	2022-03-25 17:44:25	1353	21.\tRAUZY, Solene\t05\tFrance NT\t2:53.56	App\\Models\\Athlete	1055	11	6	\N	17356	3205	12	12	[]	\N
20338	2022-03-25 17:44:25	2022-03-25 17:44:25	1354	22.\tFERRIGNO, Sveva\t05\tIn Sport Rane Rosse\t2:54.54	App\\Models\\Athlete	1064	11	6	\N	17454	3208	12	12	[]	\N
20339	2022-03-25 17:44:25	2022-03-25 17:44:25	1355	23.\tCIPOLLETTI, Ilaria\t06\tAthena Bracciano\t2:54.61	App\\Models\\Athlete	791	11	6	\N	17461	3210	12	12	[]	\N
20340	2022-03-25 17:44:25	2022-03-25 17:44:25	1356	24.\tSCHAEFER, Julia\t04\tDLRG Nordrhein-Westfalen\t2:55.70	App\\Models\\Athlete	60	11	6	\N	17570	3219	12	12	[]	\N
20341	2022-03-25 17:44:25	2022-03-25 17:44:25	1357	25.\tFELLENSIEK, Svea\t05\tDLRG Niedersachsen\t2:56.16	App\\Models\\Athlete	804	11	6	\N	17616	3212	12	12	[]	\N
20342	2022-03-25 17:44:25	2022-03-25 17:44:25	1358	26.\tS'HEEREN, Mirte\t06\tSint-Truidense RC\t2:57.23	App\\Models\\Athlete	799	11	6	\N	17723	3214	12	12	[]	\N
20343	2022-03-25 17:44:25	2022-03-25 17:44:25	1359	27.\tMONTENEGREO, Noemi\t03\tAthena Salvamento\t2:59.82	App\\Models\\Athlete	1058	11	6	\N	17982	3213	12	12	[]	\N
20344	2022-03-25 17:44:25	2022-03-25 17:44:25	1360	28.\tMURA CITTADINI, Melissa\t03\tAccademia Di Salvamento\t3:00.37	App\\Models\\Athlete	473	11	6	\N	18037	3203	12	12	[]	\N
20345	2022-03-25 17:44:25	2022-03-25 17:44:25	1361	29.\tD'ALESSANDRO, Carlotta\t06\tIn Sport Rane Rosse\t3:00.62	App\\Models\\Athlete	1059	11	6	\N	18062	3208	12	12	[]	\N
20346	2022-03-25 17:44:25	2022-03-25 17:44:25	1362	30.\tVAGLIVIELLO, Denise\t05\tAthena Salvamento\t3:01.01	App\\Models\\Athlete	1060	11	6	\N	18101	3213	12	12	[]	\N
20347	2022-03-25 17:44:25	2022-03-25 17:44:25	1363	31.\tKLOMP, Dyonne\t04\tRB Weert\t3:01.16	App\\Models\\Athlete	31	11	6	\N	18116	12	12	12	[]	\N
20348	2022-03-25 17:44:25	2022-03-25 17:44:25	1364	32.\tDE KONING, Sanne\t04\tRB Gouda\t3:01.44	App\\Models\\Athlete	43	11	6	\N	18144	17	12	12	[]	\N
20349	2022-03-25 17:44:25	2022-03-25 17:44:25	1365	33.\tBUDZINSKA, Paulina\t03\tSlaskie WOPR\t3:01.97	App\\Models\\Athlete	792	11	6	\N	18197	3211	12	12	[]	\N
20350	2022-03-25 17:44:25	2022-03-25 17:44:25	1366	34.\tSTICKER, Lien\t06\tRctal\t3:02.70	App\\Models\\Athlete	803	11	6	\N	18270	3217	12	12	[]	\N
20351	2022-03-25 17:44:25	2022-03-25 17:44:25	1367	35.\tWIJNANT, Loes\t05\tRctal\t3:03.80	App\\Models\\Athlete	811	11	6	\N	18380	3217	12	12	[]	\N
20352	2022-03-25 17:44:25	2022-03-25 17:44:25	1368	36.\tKARWOWSKA, Anna\t03\tCKS Szczecin\t3:04.28	App\\Models\\Athlete	1062	11	6	\N	18428	3227	12	12	[]	\N
20353	2022-03-25 17:44:25	2022-03-25 17:44:25	1369	37.\tDERWAEL, Fien\t06\tSint-Truidense RC\t3:04.73	App\\Models\\Athlete	806	11	6	\N	18473	3214	12	12	[]	\N
20354	2022-03-25 17:44:25	2022-03-25 17:44:25	1370	38.\tDALHUISEN, Renske\t03\tNederland NT\t3:04.86	App\\Models\\Athlete	30	11	6	\N	18486	3218	12	12	[]	\N
20355	2022-03-25 17:44:25	2022-03-25 17:44:25	1371	39.\tRIEDRICH, Franka\t05\tDLRG Nuernberg-Roth-Schwabach\t3:05.53	App\\Models\\Athlete	802	11	6	\N	18553	3216	12	12	[]	\N
20356	2022-03-25 17:44:25	2022-03-25 17:44:25	1372	40.\tHUYSMANS, Lune\t06\tSint-Truidense RC\t3:07.85	App\\Models\\Athlete	1012	11	6	\N	18785	3214	12	12	[]	\N
20357	2022-03-25 17:44:25	2022-03-25 17:44:25	1373	41.\tDELAMARE, Michelle\t05\tAthena Bracciano\t3:09.04	App\\Models\\Athlete	805	11	6	\N	18904	3210	12	12	[]	\N
20358	2022-03-25 17:44:25	2022-03-25 17:44:25	1374	42.\tJANSSEN, Vera\t05\tRB Echt\t3:10.13	App\\Models\\Athlete	1017	11	6	\N	19013	15	12	12	[]	\N
20359	2022-03-25 17:44:25	2022-03-25 17:44:25	1375	43.\tBUECKEN, Greta\t05\tDLRG Alpen\t3:11.25	App\\Models\\Athlete	1063	11	6	\N	19125	261	12	12	[]	\N
20360	2022-03-25 17:44:25	2022-03-25 17:44:25	1376	44.\tGERAATS, Lieke\t06\tRB Heytse\t3:11.82	App\\Models\\Athlete	1016	11	6	\N	19182	3229	12	12	[]	\N
20361	2022-03-25 17:44:25	2022-03-25 17:44:25	1377	45.\tMENNEN, Fenne\t06\tRB Heytse\t3:15.44	App\\Models\\Athlete	1010	11	6	\N	19544	3229	12	12	[]	\N
20362	2022-03-25 17:44:25	2022-03-25 17:44:25	1378	46.\tVAN GELLEKOM, Lotte\t03\tRB Echt\t3:16.56	App\\Models\\Athlete	481	11	6	\N	19656	15	12	12	[]	\N
20363	2022-03-25 17:44:25	2022-03-25 17:44:25	1379	47.\tHILLE, Louisa\t04\tDLRG Guetersloh\t3:18.14	App\\Models\\Athlete	404	11	6	\N	19814	3220	12	12	[]	\N
20364	2022-03-25 17:44:25	2022-03-25 17:44:25	1380	48.\tLONG, Calista\t05\tRB Echt\t3:19.17	App\\Models\\Athlete	1013	11	6	\N	19917	15	12	12	[]	\N
20365	2022-03-25 17:44:25	2022-03-25 17:44:25	1381	49.\tBARBU, Julia\t06\tRB Dordrecht\t3:24.34	App\\Models\\Athlete	1023	11	6	\N	20434	13	12	12	[]	\N
20366	2022-03-25 17:44:25	2022-03-25 17:44:25	1382	50.\tSPLIETHOFF, Lea\t04\tDLRG Alpen\t3:25.11	App\\Models\\Athlete	1065	11	6	\N	20511	261	12	12	[]	\N
20367	2022-03-25 17:44:25	2022-03-25 17:44:25	1383	51.\tZUIDGEEST, Vera\t03\tRB Delft\t3:25.24	App\\Models\\Athlete	478	11	6	\N	20524	3221	12	12	[]	\N
20368	2022-03-25 17:44:25	2022-03-25 17:44:25	1384	52.\tBELLI, Sofia\t05\tAthena Salvamento\t3:25.32	App\\Models\\Athlete	810	11	6	\N	20532	3213	12	12	[]	\N
20369	2022-03-25 17:44:25	2022-03-25 17:44:25	1385	53.\tMEESKE, Christin\t05\tDLRG Niedersachsen\t3:26.06	App\\Models\\Athlete	807	11	6	\N	20606	3212	12	12	[]	\N
20370	2022-03-25 17:44:25	2022-03-25 17:44:25	1386	54.\tEUBE, Mareike\t03\tDLRG Guetersloh\t3:32.42	App\\Models\\Athlete	68	11	6	\N	21242	3220	12	12	[]	\N
20371	2022-03-25 17:44:25	2022-03-25 17:44:25	1387	55.\tKRAUSS, Hannah\t05\tDLRG Niedersachsen\t3:33.05	App\\Models\\Athlete	1015	11	6	\N	21305	3212	12	12	[]	\N
20372	2022-03-25 17:44:25	2022-03-25 17:44:25	1388	56.\tKELLENERS, Jill\t06\tRB Echt\t3:37.80	App\\Models\\Athlete	814	11	6	\N	21780	15	12	12	[]	\N
20373	2022-03-25 17:44:25	2022-03-25 17:44:25	1389	57.\tVRENKEN, Kyra\t04\tRB Echt\t3:40.68	App\\Models\\Athlete	72	11	6	\N	22068	15	12	12	[]	\N
20374	2022-03-25 17:44:25	2022-03-25 17:44:25	1390	58.\tPERRIENS, Lianne\t06\tRB Echt\t3:42.31	App\\Models\\Athlete	1022	11	6	\N	22231	15	12	12	[]	\N
20375	2022-03-25 17:44:25	2022-03-25 17:44:25	1391	59.\tVAN DER VORST, Lynn\t04\tRB Echt\t4:02.71	App\\Models\\Athlete	415	11	6	\N	24271	15	12	12	[]	\N
20376	2022-03-25 17:44:25	2022-03-25 17:44:25	1392	DSQ\tDEWAEL, Nell\t06\tLiege Sauvetage Club	App\\Models\\Athlete	1008	11	6	1	\N	3238	12	12	[]	\N
20377	2022-03-25 17:44:25	2022-03-25 17:44:25	1395	DSQ\tHACKEN, Anouk\t04\tRB Boxtel	App\\Models\\Athlete	1121	11	6	1	\N	122	12	12	[]	\N
20378	2022-03-25 17:44:25	2022-03-25 17:44:25	1399	DNS\tMOELLER, Kim\t03\tDLRG Niedersachsen	App\\Models\\Athlete	794	11	6	2	\N	3212	12	12	[]	\N
20379	2022-03-25 17:44:25	2022-03-25 17:44:25	1400	DNS\tGERAATS, Kim\t04\tRB Heytse	App\\Models\\Athlete	55	11	6	2	\N	3229	12	12	[]	\N
20380	2022-03-25 17:44:25	2022-03-25 17:44:25	1402	1.\tMESCHIARI, Silvia\t92\tItaly NT\t2:21.47	App\\Models\\Athlete	625	11	6	\N	14147	3201	12	13	[]	\N
20381	2022-03-25 17:44:25	2022-03-25 17:44:25	1403	2.\tGEBHARDT, Alica\t97\tDLRG Bad Oldesloe\t2:25.91	App\\Models\\Athlete	820	11	6	\N	14591	3223	12	13	[]	\N
20382	2022-03-25 17:44:25	2022-03-25 17:44:25	1404	3.\tLANZILLOTTI, Paola\t97\tItaly NT\t2:28.42	App\\Models\\Athlete	1078	11	6	\N	14842	3201	12	13	[]	\N
20383	2022-03-25 17:44:25	2022-03-25 17:44:25	1405	4.\tVAN DE PLAS, Bo\t01\tBelgium NT\t2:31.45	App\\Models\\Athlete	1071	11	6	\N	15145	3206	12	13	[]	\N
20384	2022-03-25 17:44:25	2022-03-25 17:44:25	1406	5.\tLOUREIRO SERRANO, Noelia\t01\tSpain NT\t2:33.53	App\\Models\\Athlete	471	11	6	\N	15353	3204	12	13	[]	\N
20385	2022-03-25 17:44:25	2022-03-25 17:44:25	1407	6.\tVAN OS, Hanna\t02\tDLRG Sachsen-Anhalt\t2:35.25	App\\Models\\Athlete	825	11	6	\N	15525	3209	12	13	[]	\N
20386	2022-03-25 17:44:25	2022-03-25 17:44:25	1408	7.\tMASCAROS NUNEZ, Beatriz\t02\tSpain NT\t2:38.54	App\\Models\\Athlete	1029	11	6	\N	15854	3204	12	13	[]	\N
20387	2022-03-25 17:44:25	2022-03-25 17:44:26	1409	8.\tVANBUEL, Nele\t85\tBelgium NT\t2:39.16	App\\Models\\Athlete	121	11	6	\N	15916	3206	12	13	[]	\N
20388	2022-03-25 17:44:26	2022-03-25 17:44:26	1410	9.\tGANADO AMADOR, Carolina\t99\tSpain NT\t2:39.19	App\\Models\\Athlete	86	11	6	\N	15919	3204	12	13	[]	\N
20389	2022-03-25 17:44:26	2022-03-25 17:44:26	1411	10.\tHARZE, Marine\t97\tBelgium NT\t2:39.88	App\\Models\\Athlete	420	11	6	\N	15988	3206	12	13	[]	\N
20390	2022-03-25 17:44:26	2022-03-25 17:44:26	1412	11.\tGROTE, Jessica\t96\tDLRG Sachsen-Anhalt\t2:43.27	App\\Models\\Athlete	422	11	6	\N	16327	3209	12	13	[]	\N
20391	2022-03-25 17:44:26	2022-03-25 17:44:26	1413	12.\tRAS, Janneke\t95\tNederland NT\t2:45.33	App\\Models\\Athlete	489	11	6	\N	16533	3218	12	13	[]	\N
20392	2022-03-25 17:44:26	2022-03-25 17:44:26	1414	13.\tFILIPPINI, Valeria\t99\tIn Sport Rane Rosse\t2:46.32	App\\Models\\Athlete	1074	11	6	\N	16632	3208	12	13	[]	\N
20393	2022-03-25 17:44:26	2022-03-25 17:44:26	1415	14.\tSIMONI, Giulia\t02\tAccademia Di Salvamento\t2:46.77	App\\Models\\Athlete	23	11	6	\N	16677	3203	12	13	[]	\N
20394	2022-03-25 17:44:26	2022-03-25 17:44:26	1416	15.\tTORTELLO, Carlotta\t02\tA.S.D. Sportiva Sturla\t2:49.05	App\\Models\\Athlete	1083	11	6	\N	16905	3235	12	13	[]	\N
20395	2022-03-25 17:44:26	2022-03-25 17:44:26	1417	16.\tAMBROSI, Chiara\t02\tASD Gorizia Nuoto\t2:50.24	App\\Models\\Athlete	821	11	6	\N	17024	3224	12	13	[]	\N
20396	2022-03-25 17:44:26	2022-03-25 17:44:26	1418	17.\tGEUBELS, Kaat\t96\tRctal\t2:52.31	App\\Models\\Athlete	499	11	6	\N	17231	3217	12	13	[]	\N
20397	2022-03-25 17:44:26	2022-03-25 17:44:26	1419	18.\tQUINKE, Loreen\t01\tDLRG Nordrhein-Westfalen\t2:54.00	App\\Models\\Athlete	469	11	6	\N	17400	3219	12	13	[]	\N
20398	2022-03-25 17:44:26	2022-03-25 17:44:26	1420	19.\tGRAU, Jessica\t00\tKusel KiXXX\t2:55.21	App\\Models\\Athlete	92	11	6	\N	17521	3207	12	13	[]	\N
20399	2022-03-25 17:44:26	2022-03-25 17:44:26	1421	20.\tWOLFS, Sharon\t00\tRB Echt\t2:55.91	App\\Models\\Athlete	430	11	6	\N	17591	15	12	13	[]	\N
20400	2022-03-25 17:44:26	2022-03-25 17:44:26	1422	21.\tGROOT, Kathy\t97\tRB Dordrecht\t2:56.72	App\\Models\\Athlete	570	11	6	\N	17672	13	12	13	[]	\N
20401	2022-03-25 17:44:26	2022-03-25 17:44:26	1423	22.\tKLOMP, Danique\t02\tNederland NT\t2:58.24	App\\Models\\Athlete	19	11	6	\N	17824	3218	12	13	[]	\N
20402	2022-03-25 17:44:26	2022-03-25 17:44:26	1424	23.\tCHIARAVALLI, Ginevra\t97\tAthena Bracciano\t3:01.12	App\\Models\\Athlete	97	11	6	\N	18112	3210	12	13	[]	\N
20403	2022-03-25 17:44:26	2022-03-25 17:44:26	1425	24.\tBERTUOLA, Chiara\t99\tAthena Bracciano\t3:01.57	App\\Models\\Athlete	93	11	6	\N	18157	3210	12	13	[]	\N
20404	2022-03-25 17:44:26	2022-03-25 17:44:26	1426	25.\tMODDER, Louisa\t02\tDLRG Niedersachsen\t3:11.38	App\\Models\\Athlete	33	11	6	\N	19138	3212	12	13	[]	\N
20405	2022-03-25 17:44:26	2022-03-25 17:44:26	1427	26.\tMICHESI, Silvia\t00\tAthena Bracciano\t3:11.72	App\\Models\\Athlete	1081	11	6	\N	19172	3210	12	13	[]	\N
20406	2022-03-25 17:44:26	2022-03-25 17:44:26	1428	27.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t3:13.93	App\\Models\\Athlete	403	11	6	\N	19393	13	12	13	[]	\N
6555	2022-02-19 13:27:45	2022-02-19 13:27:45	51	12.\tOESTMO, Helene Marie\t03\tStarfish SLC\t2:39.07	App\\Models\\Athlete	9	1	1	\N	15907	235	2	7	[]	\N
20407	2022-03-25 17:44:26	2022-03-25 17:44:26	1429	28.\tPISTERS, Nathalie\t01\tRB Echt\t3:15.48	App\\Models\\Athlete	35	11	6	\N	19548	15	12	13	[]	\N
20408	2022-03-25 17:44:26	2022-03-25 17:44:26	1430	29.\tJETTEN, Maike\t02\tRB Echt\t3:18.75	App\\Models\\Athlete	400	11	6	\N	19875	15	12	13	[]	\N
20409	2022-03-25 17:44:26	2022-03-25 17:44:26	1431	30.\tVAN HAAREN, Renate\t92\tRB Oss\t3:20.69	App\\Models\\Athlete	508	11	6	\N	20069	43	12	13	[]	\N
20410	2022-03-25 17:44:26	2022-03-25 17:44:26	1432	31.\tVAN HILLO, Michelle\t00\tRB Boxtel\t3:38.90	App\\Models\\Athlete	1122	11	6	\N	21890	122	12	13	[]	\N
20411	2022-03-25 17:44:26	2022-03-25 17:44:26	1433	DSQ\tMARCO, Manon\t01\tFrance NT	App\\Models\\Athlete	1027	11	6	1	\N	3205	12	13	[]	\N
20412	2022-03-25 17:44:26	2022-03-25 17:44:26	1436	DSQ\tDURAND, Emma\t00\tFrance NT	App\\Models\\Athlete	1030	11	6	1	\N	3205	12	13	[]	\N
20413	2022-03-25 17:44:26	2022-03-25 17:44:26	1439	DSQ\tQUADRELLI, Martina\t00\tIn Sport Rane Rosse	App\\Models\\Athlete	1073	11	6	1	\N	3208	12	13	[]	\N
20414	2022-03-25 17:44:26	2022-03-25 17:44:26	1442	DNS\tMODDER, Alena\t02\tDLRG Niedersachsen	App\\Models\\Athlete	41	11	6	2	\N	3212	12	13	[]	\N
20415	2022-03-25 17:44:26	2022-03-25 17:44:26	1443	DNF\tBRINK, Celine\t00\tRB Dordrecht	App\\Models\\Athlete	94	11	6	3	\N	13	12	13	[]	\N
20416	2022-03-25 17:44:26	2022-03-25 17:44:26	1444	WDR\tCRISTETTI, Francesca\t97\tItaly NT	App\\Models\\Athlete	77	11	6	0	\N	3201	12	13	[]	\N
20417	2022-03-25 17:44:26	2022-03-25 17:44:26	1446	1.\tKITTEL, Christine\t85\tDLRG Niedersachsen\t2:53.51	App\\Models\\Athlete	438	11	6	\N	17351	3212	12	14	[]	\N
20418	2022-03-25 17:44:26	2022-03-25 17:44:26	1447	2.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t3:06.87	App\\Models\\Athlete	640	11	6	\N	18687	243	12	14	[]	\N
20419	2022-03-25 17:44:26	2022-03-25 17:44:26	1448	3.\tSTEVENS, Danielle\t88\tRB Oss\t3:19.32	App\\Models\\Athlete	641	11	6	\N	19932	43	12	14	[]	\N
20420	2022-03-25 17:44:26	2022-03-25 17:44:26	1454	DNF\tROEMEN, Claudine\t74\tRB Echt	App\\Models\\Athlete	125	11	6	3	\N	15	12	15	[]	\N
20421	2022-03-25 17:44:26	2022-03-25 17:44:26	1456	1.\tVAN DE KOOIJ, Astrid\t64\tRB Dordrecht\t4:04.66	App\\Models\\Athlete	1085	11	6	\N	24466	13	12	16	[]	\N
20422	2022-03-25 17:44:26	2022-03-25 17:44:26	1462	1.\tCORONADO TEJEDA, Carlos\t03\tSpain NT\t2:10.64	App\\Models\\Athlete	829	11	6	\N	13064	3204	12	12	[]	\N
20423	2022-03-25 17:44:26	2022-03-25 17:44:26	1463	2.\tMANCARDO, LORENZO\t03\tSAFA 2000\t2:17.81	App\\Models\\Athlete	830	11	6	\N	13781	3202	12	12	[]	\N
20424	2022-03-25 17:44:26	2022-03-25 17:44:27	1464	3.\tROGOZINSKI, Konrad\t04\tCKS Szczecin\t2:18.16	App\\Models\\Athlete	831	11	6	\N	13816	3227	12	12	[]	\N
20425	2022-03-25 17:44:27	2022-03-25 17:44:27	1465	4.\tCHIAVACCI, Roberto\t04\tAccademia Di Salvamento\t2:20.92	App\\Models\\Athlete	1089	11	6	\N	14092	3203	12	12	[]	\N
20426	2022-03-25 17:44:27	2022-03-25 17:44:27	1466	5.\tKUIPHOF, Robin\t03\tRB Dordrecht\t2:23.84	App\\Models\\Athlete	737	11	6	\N	14384	13	12	12	[]	\N
20427	2022-03-25 17:44:27	2022-03-25 17:44:27	1467	6.\tCOCIANNI, Andrea\t03\tASD Gorizia Nuoto\t2:24.39	App\\Models\\Athlete	832	11	6	\N	14439	3224	12	12	[]	\N
20428	2022-03-25 17:44:27	2022-03-25 17:44:27	1468	7.\tBADUTO, Gabriele\t04\tIn Sport Rane Rosse\t2:26.47	App\\Models\\Athlete	1123	11	6	\N	14647	3208	12	12	[]	\N
20429	2022-03-25 17:44:27	2022-03-25 17:44:27	1469	8.\tFORMANN, Brivael\t04\tLiege Sauvetage Club\t2:27.95	App\\Models\\Athlete	1092	11	6	\N	14795	3238	12	12	[]	\N
20430	2022-03-25 17:44:27	2022-03-25 17:44:27	1470	9.\tACHILLI, Emanuele\t06\tIn Sport Rane Rosse\t2:28.52	App\\Models\\Athlete	837	11	6	\N	14852	3208	12	12	[]	\N
20431	2022-03-25 17:44:27	2022-03-25 17:44:27	1471	10.\tDURAGER, Tom\t05\tFrance NT\t2:29.88	App\\Models\\Athlete	1087	11	6	\N	14988	3205	12	12	[]	\N
20432	2022-03-25 17:44:27	2022-03-25 17:44:27	1472	11.\tDELLI PASSERI, Emanuele\t05\tASD Rosetana Nuoto\t2:32.40	App\\Models\\Athlete	1101	11	6	\N	15240	3215	12	12	[]	\N
20433	2022-03-25 17:44:27	2022-03-25 17:44:27	1473	12.\tGIORGETTI, Mario\t06\tAthena Bracciano\t2:32.66	App\\Models\\Athlete	1098	11	6	\N	15266	3210	12	12	[]	\N
20434	2022-03-25 17:44:27	2022-03-25 17:44:27	1474	13.\tROSSI, Andrea\t03\tA.S.D. Sportiva Sturla\t2:34.72	App\\Models\\Athlete	1124	11	6	\N	15472	3235	12	12	[]	\N
20435	2022-03-25 17:44:27	2022-03-25 17:44:27	1475	14.\tNAZARUK, Piotr\t03\tCKS Szczecin\t2:34.92	App\\Models\\Athlete	1093	11	6	\N	15492	3227	12	12	[]	\N
20436	2022-03-25 17:44:27	2022-03-25 17:44:27	1476	15.\tROSOLEN, Loris\t05\tLiege Sauvetage Club\t2:35.40	App\\Models\\Athlete	1109	11	6	\N	15540	3238	12	12	[]	\N
20437	2022-03-25 17:44:27	2022-03-25 17:44:27	1477	16.\tVAN BEEK, Jason\t04\tRB Echt\t2:35.83	App\\Models\\Athlete	1111	11	6	\N	15583	15	12	12	[]	\N
20438	2022-03-25 17:44:27	2022-03-25 17:44:27	1478	17.\tROSIAK, Krzysztof\t03\tSlaskie WOPR\t2:36.02	App\\Models\\Athlete	839	11	6	\N	15602	3211	12	12	[]	\N
20439	2022-03-25 17:44:27	2022-03-25 17:44:27	1479	18.\tQUIDACCIOLU, Tito\t03\tA.S.D. Sportiva Sturla\t2:36.66	App\\Models\\Athlete	1102	11	6	\N	15666	3235	12	12	[]	\N
20440	2022-03-25 17:44:27	2022-03-25 17:44:27	1480	19.\tLO BUE, Tommaso\t06\tAthena Bracciano\t2:36.75	App\\Models\\Athlete	1110	11	6	\N	15675	3210	12	12	[]	\N
20441	2022-03-25 17:44:27	2022-03-25 17:44:27	1481	20.\tWROBEL, Igor\t03\tSlaskie WOPR\t2:39.65	App\\Models\\Athlete	1125	11	6	\N	15965	3211	12	12	[]	\N
20442	2022-03-25 17:44:27	2022-03-25 17:44:27	1482	21.\tBODENBURG, Jonas\t05\tDLRG Nordrhein-Westfalen\t2:40.52	App\\Models\\Athlete	1126	11	6	\N	16052	3219	12	12	[]	\N
20443	2022-03-25 17:44:27	2022-03-25 17:44:27	1483	22.\tPREUSS, Ben\t05\tDLRG Niedersachsen\t2:41.71	App\\Models\\Athlete	1108	11	6	\N	16171	3212	12	12	[]	\N
20444	2022-03-25 17:44:27	2022-03-25 17:44:27	1484	23.\tJUNG, Nico Joe\t04\tDLRG Niedersachsen\t2:41.74	App\\Models\\Athlete	1127	11	6	\N	16174	3212	12	12	[]	\N
20445	2022-03-25 17:44:27	2022-03-25 17:44:27	1485	24.\tNAUMANN, Jan\t03\tDLRG Niedersachsen\t2:42.52	App\\Models\\Athlete	1128	11	6	\N	16252	3212	12	12	[]	\N
20446	2022-03-25 17:44:27	2022-03-25 17:44:27	1486	25.\tKNUTS, Aiko\t06\tSint-Truidense RC\t2:43.27	App\\Models\\Athlete	1103	11	6	\N	16327	3214	12	12	[]	\N
20447	2022-03-25 17:44:27	2022-03-25 17:44:27	1487	26.\tCROES, Matisse\t06\tSint-Truidense RC\t2:45.52	App\\Models\\Athlete	1112	11	6	\N	16552	3214	12	12	[]	\N
20448	2022-03-25 17:44:27	2022-03-25 17:44:27	1488	27.\tCOPPOLA, Vincenzo\t03\tAthena Salvamento\t2:47.31	App\\Models\\Athlete	1129	11	6	\N	16731	3213	12	12	[]	\N
20449	2022-03-25 17:44:27	2022-03-25 17:44:27	1489	28.\tPUGGIONI, Antonio\t04\tAccademia Di Salvamento\t2:47.72	App\\Models\\Athlete	1094	11	6	\N	16772	3203	12	12	[]	\N
20450	2022-03-25 17:44:27	2022-03-25 17:44:27	1490	29.\tPASTERNAK, Wojciech\t05\tMKS Szczecin\t2:48.26	App\\Models\\Athlete	1130	11	6	\N	16826	3236	12	12	[]	\N
20451	2022-03-25 17:44:27	2022-03-25 17:44:27	1491	30.\tCOLASANTI, Paolo\t05\tAccademia Di Salvamento\t2:48.50	App\\Models\\Athlete	1100	11	6	\N	16850	3203	12	12	[]	\N
20452	2022-03-25 17:44:27	2022-03-25 17:44:27	1492	31.\tJACOBS, Rick\t05\tRB Echt\t2:49.23	App\\Models\\Athlete	1131	11	6	\N	16923	15	12	12	[]	\N
20453	2022-03-25 17:44:27	2022-03-25 17:44:27	1493	32.\tROEMEN, Yves\t06\tRB Echt\t2:51.72	App\\Models\\Athlete	1132	11	6	\N	17172	15	12	12	[]	\N
20454	2022-03-25 17:44:27	2022-03-25 17:44:27	1494	33.\tCLOET, Jasper\t06\tVZW Vrije Zwemmers Wenduine-De Haan\t2:51.97	App\\Models\\Athlete	1133	11	6	\N	17197	3244	12	12	[]	\N
20455	2022-03-25 17:44:27	2022-03-25 17:44:27	1495	34.\tREINKE, Johann\t06\tDLRG Niedersachsen\t2:54.28	App\\Models\\Athlete	1134	11	6	\N	17428	3212	12	12	[]	\N
20456	2022-03-25 17:44:27	2022-03-25 17:44:27	1496	35.\tRENNEBAUM, Max\t03\tDLRG Guetersloh\t2:56.06	App\\Models\\Athlete	1135	11	6	\N	17606	3220	12	12	[]	\N
20457	2022-03-25 17:44:27	2022-03-25 17:44:27	1497	36.\tVAN DAM, Timo\t06\tRB Gouda\t3:01.78	App\\Models\\Athlete	1136	11	6	\N	18178	17	12	12	[]	\N
20458	2022-03-25 17:44:27	2022-03-25 17:44:27	1498	37.\tTHEISS, Tillman\t05\tKusel KiXXX\t3:05.88	App\\Models\\Athlete	1137	11	6	\N	18588	3207	12	12	[]	\N
20459	2022-03-25 17:44:27	2022-03-25 17:44:27	1499	38.\tWEEKERS, Ian\t04\tRB Echt\t3:16.38	App\\Models\\Athlete	1138	11	6	\N	19638	15	12	12	[]	\N
20460	2022-03-25 17:44:27	2022-03-25 17:44:27	1500	39.\tBAKHUYZEN, Boaz\t05\tRB Waddinxveen\t3:24.80	App\\Models\\Athlete	1139	11	6	\N	20480	3231	12	12	[]	\N
20461	2022-03-25 17:44:27	2022-03-25 17:44:27	1501	40.\tHARKES, Nick\t05\tRB Waddinxveen\t3:25.13	App\\Models\\Athlete	1140	11	6	\N	20513	3231	12	12	[]	\N
20462	2022-03-25 17:44:27	2022-03-25 17:44:27	1502	41.\tKOHN, Kennet\t06\tKusel KiXXX\t3:39.15	App\\Models\\Athlete	1141	11	6	\N	21915	3207	12	12	[]	\N
20463	2022-03-25 17:44:27	2022-03-25 17:44:27	1503	42.\tBOOMERS, Timo\t06\tRB Waddinxveen\t3:41.61	App\\Models\\Athlete	1142	11	6	\N	22161	3231	12	12	[]	\N
20464	2022-03-25 17:44:27	2022-03-25 17:44:27	1568	42.\tSCHMIEMANN, Gerd\t02\tDLRG Niedersachsen\t2:48.86	App\\Models\\Athlete	849	11	6	\N	16886	3212	12	13	[]	\N
20465	2022-03-25 17:44:27	2022-03-25 17:44:27	1569	43.\tTERPORTEN, Phillip\t02\tDLRG Alpen\t2:50.25	App\\Models\\Athlete	1048	11	6	\N	17025	261	12	13	[]	\N
20466	2022-03-25 17:44:27	2022-03-25 17:44:27	1570	44.\tPASTOORS, Tim\t01\tDLRG Alpen\t2:58.79	App\\Models\\Athlete	1050	11	6	\N	17879	261	12	13	[]	\N
20467	2022-03-25 17:44:27	2022-03-25 17:44:27	1571	45.\tKREUTZ, Timm\t96\tKusel KiXXX\t3:02.76	App\\Models\\Athlete	163	11	6	\N	18276	3207	12	13	[]	\N
20468	2022-03-25 17:44:27	2022-03-25 17:44:27	1572	46.\tDEENEN, Jesse\t97\tRB Boxtel\t3:12.25	App\\Models\\Athlete	600	11	6	\N	19225	122	12	13	[]	\N
20469	2022-03-25 17:44:27	2022-03-25 17:44:27	1573	DSQ\tVIVALDA, ANDREA\t01\tSAFA 2000	App\\Models\\Athlete	1143	11	6	1	\N	3202	12	13	[]	\N
20470	2022-03-25 17:44:27	2022-03-25 17:44:27	1576	DNS\tVAN DE BAAN, Koen\t00\tRB Delft	App\\Models\\Athlete	1144	11	6	2	\N	3221	12	13	[]	\N
20471	2022-03-25 17:44:27	2022-03-25 17:44:27	1577	DNS\tBANGMA, Jur\t01\tRB Delft	App\\Models\\Athlete	1145	11	6	2	\N	3221	12	13	[]	\N
20472	2022-03-25 17:44:27	2022-03-25 17:44:27	1578	DNS\tSPLIETHOFF, Jonas\t01\tDLRG Alpen	App\\Models\\Athlete	1047	11	6	2	\N	261	12	13	[]	\N
20473	2022-03-25 17:44:28	2022-03-25 17:44:28	1579	WDR\tPEREZ SANCHEZ, Javier\t02\tSpain NT	App\\Models\\Athlete	1146	11	6	0	\N	3204	12	13	[]	\N
20474	2022-03-25 17:44:28	2022-03-25 17:44:28	1581	1.\tGILARDI, Federico\t91\tItaly NT\t2:07.72	App\\Models\\Athlete	668	11	6	\N	12772	3201	12	14	[]	\N
20475	2022-03-25 17:44:28	2022-03-25 17:44:28	1582	2.\tKEMPKES, Stephan\t88\tDLRG Buchholz United\t2:37.06	App\\Models\\Athlete	676	11	6	\N	15706	3230	12	14	[]	\N
20476	2022-03-25 17:44:28	2022-03-25 17:44:28	1583	3.\tVAN LUIJTELAAR, Pieter\t83\tRB Boxtel\t3:04.12	App\\Models\\Athlete	578	11	6	\N	18412	122	12	14	[]	\N
20477	2022-03-25 17:44:28	2022-03-25 17:44:28	1584	4.\tDEN HARTOG, Jan-Willem\t86\tRB Amersfoort\t3:07.76	App\\Models\\Athlete	856	11	6	\N	18776	22	12	14	[]	\N
20478	2022-03-25 17:44:28	2022-03-25 17:44:28	1585	5.\tVAN DE RIET, Stefan\t84\tRB Delft\t3:08.12	App\\Models\\Athlete	168	11	6	\N	18812	3221	12	14	[]	\N
20479	2022-03-25 17:44:28	2022-03-25 17:44:28	1586	6.\tKUEHN, Martijn\t83\tRB Gouda\t3:18.66	App\\Models\\Athlete	170	11	6	\N	19866	17	12	14	[]	\N
20480	2022-03-25 17:44:28	2022-03-25 17:44:28	1587	7.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t3:28.38	App\\Models\\Athlete	579	11	6	\N	20838	22	12	14	[]	\N
20481	2022-03-25 17:44:28	2022-03-25 17:44:28	1589	1.\tVAN DE GOOR, Guus\t77\tRB Echt\t2:56.77	App\\Models\\Athlete	174	11	6	\N	17677	15	12	15	[]	\N
20482	2022-03-25 17:44:28	2022-03-25 17:44:28	1590	2.\tVAN DER MEER, Vincent\t79\tRB Delft\t2:57.04	App\\Models\\Athlete	464	11	6	\N	17704	3221	12	15	[]	\N
20483	2022-03-25 17:44:28	2022-03-25 17:44:28	1591	3.\tBROWNE, David\t72\tSt. John Berchmans Life Saving Club\t3:26.58	App\\Models\\Athlete	1052	11	6	\N	20658	3242	12	15	[]	\N
20484	2022-03-25 17:44:28	2022-03-25 17:44:28	1593	1.\tROEMEN, Sven\t70\tRB Echt\t2:44.95	App\\Models\\Athlete	173	11	6	\N	16495	15	12	16	[]	\N
20485	2022-03-25 17:44:28	2022-03-25 17:44:28	1594	2.\tVAN DAALEN, Erik\t65\tRB Gouda\t3:00.96	App\\Models\\Athlete	175	11	6	\N	18096	17	12	16	[]	\N
20486	2022-03-25 17:44:28	2022-03-25 17:44:28	1595	3.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t3:27.68	App\\Models\\Athlete	179	11	6	\N	20768	13	12	16	[]	\N
20487	2022-03-25 17:44:28	2022-03-25 17:44:28	1596	4.\tPRAET, Piet\t56\tRB Dordrecht\t3:39.71	App\\Models\\Athlete	693	11	6	\N	21971	13	12	16	[]	\N
20489	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	861	11	27	\N	\N	\N	12	\N	[]	20488
20490	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	371	11	27	\N	\N	\N	12	\N	[]	20488
20491	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	862	11	27	\N	\N	\N	12	\N	[]	20488
20492	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	864	11	27	\N	\N	\N	12	\N	[]	20488
20488	2022-03-25 17:44:28	2022-03-25 17:44:28	1601	1.\tItaly NT 1\tItaly NT\t1:40.95	App\\Models\\RelayTeam	176	11	27	\N	10095	3201	12	\N	[]	\N
20494	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	978	11	27	\N	\N	\N	12	\N	[]	20493
20495	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	625	11	27	\N	\N	\N	12	\N	[]	20493
20496	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	818	11	27	\N	\N	\N	12	\N	[]	20493
20497	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	784	11	27	\N	\N	\N	12	\N	[]	20493
20493	2022-03-25 17:44:28	2022-03-25 17:44:28	1603	2.\tItaly NT 2\tItaly NT\t1:42.48	App\\Models\\RelayTeam	175	11	27	\N	10248	3201	12	\N	[]	\N
20499	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	822	11	27	\N	\N	\N	12	\N	[]	20498
20500	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	817	11	27	\N	\N	\N	12	\N	[]	20498
20501	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	859	11	27	\N	\N	\N	12	\N	[]	20498
20502	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	860	11	27	\N	\N	\N	12	\N	[]	20498
20498	2022-03-25 17:44:28	2022-03-25 17:44:28	1605	3.\tPoland Dolnoslaskie Wopr 1\tPoland Dolnoslaskie Wopr\t1:42.59	App\\Models\\RelayTeam	174	11	27	\N	10259	3222	12	\N	[]	\N
20504	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	5	11	27	\N	\N	\N	12	\N	[]	20503
20505	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	865	11	27	\N	\N	\N	12	\N	[]	20503
20506	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	81	11	27	\N	\N	\N	12	\N	[]	20503
20507	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	970	11	27	\N	\N	\N	12	\N	[]	20503
20503	2022-03-25 17:44:28	2022-03-25 17:44:28	1607	4.\tSpain NT 2\tSpain NT\t1:42.61	App\\Models\\RelayTeam	177	11	27	\N	10261	3204	12	\N	[]	\N
20509	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	786	11	27	\N	\N	\N	12	\N	[]	20508
20510	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	1054	11	27	\N	\N	\N	12	\N	[]	20508
20511	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	186	11	27	\N	\N	\N	12	\N	[]	20508
20512	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	471	11	27	\N	\N	\N	12	\N	[]	20508
20508	2022-03-25 17:44:28	2022-03-25 17:44:28	1609	5.\tSpain NT 1\tSpain NT\t1:45.40	App\\Models\\RelayTeam	181	11	27	\N	10540	3204	12	\N	[]	\N
20514	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	199	11	27	\N	\N	\N	12	\N	[]	20513
20515	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	30	11	27	\N	\N	\N	12	\N	[]	20513
20516	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	208	11	27	\N	\N	\N	12	\N	[]	20513
20517	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	200	11	27	\N	\N	\N	12	\N	[]	20513
20513	2022-03-25 17:44:28	2022-03-25 17:44:28	1611	6.\tNederland NT 1\tNederland NT\t1:45.76	App\\Models\\RelayTeam	180	11	27	\N	10576	3218	12	\N	[]	\N
20519	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	868	11	27	\N	\N	\N	12	\N	[]	20518
20520	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	14	11	27	\N	\N	\N	12	\N	[]	20518
20521	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	869	11	27	\N	\N	\N	12	\N	[]	20518
20522	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	121	11	27	\N	\N	\N	12	\N	[]	20518
20518	2022-03-25 17:44:28	2022-03-25 17:44:28	1618	7.\tBelgium NT 1\tBelgium NT\t1:46.43	App\\Models\\RelayTeam	179	11	27	\N	10643	3206	12	\N	[]	\N
20524	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	823	11	27	\N	\N	\N	12	\N	[]	20523
20525	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	824	11	27	\N	\N	\N	12	\N	[]	20523
20526	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	866	11	27	\N	\N	\N	12	\N	[]	20523
20527	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	867	11	27	\N	\N	\N	12	\N	[]	20523
20523	2022-03-25 17:44:28	2022-03-25 17:44:28	1620	8.\tFrance NT 1\tFrance NT\t1:46.64	App\\Models\\RelayTeam	178	11	27	\N	10664	3205	12	\N	[]	\N
20529	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	1005	11	27	\N	\N	\N	12	\N	[]	20528
20530	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	871	11	27	\N	\N	\N	12	\N	[]	20528
20531	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	825	11	27	\N	\N	\N	12	\N	[]	20528
20532	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	206	11	27	\N	\N	\N	12	\N	[]	20528
20528	2022-03-25 17:44:28	2022-03-25 17:44:28	1622	9.\tDLRG Sachsen-Anhalt 1\tDLRG Sachsen-Anhalt\t1:50.21	App\\Models\\RelayTeam	182	11	27	\N	11021	3209	12	\N	[]	\N
20534	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	97	11	27	\N	\N	\N	12	\N	[]	20533
20535	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	791	11	27	\N	\N	\N	12	\N	[]	20533
20533	2022-03-25 17:44:28	2022-03-25 17:44:28	1624	10.\tAthena Bracciano 1\tAthena Bracciano\t1:50.81	App\\Models\\RelayTeam	183	11	27	\N	11081	3210	12	\N	[]	\N
6556	2022-02-19 13:27:45	2022-02-19 13:27:45	52	13.\tWITTENBERG, Lisanne\t00\tDLRG Buchholz e.V.\t2:40.71	App\\Models\\Athlete	618	1	1	\N	16071	234	2	7	[]	\N
20536	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	872	11	27	\N	\N	\N	12	\N	[]	20533
20537	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	796	11	27	\N	\N	\N	12	\N	[]	20533
20539	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	10	11	27	\N	\N	\N	12	\N	[]	20538
20540	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	977	11	27	\N	\N	\N	12	\N	[]	20538
20541	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	4	11	27	\N	\N	\N	12	\N	[]	20538
20542	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	196	11	27	\N	\N	\N	12	\N	[]	20538
20538	2022-03-25 17:44:28	2022-03-25 17:44:28	1626	11.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t1:51.12	App\\Models\\RelayTeam	187	11	27	\N	11112	3203	12	\N	[]	\N
20544	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	875	11	27	\N	\N	\N	12	\N	[]	20543
20545	2022-03-25 17:44:28	2022-03-25 17:44:28	\N	\N	App\\Models\\Athlete	878	11	27	\N	\N	\N	12	\N	[]	20543
20546	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	877	11	27	\N	\N	\N	12	\N	[]	20543
20547	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	876	11	27	\N	\N	\N	12	\N	[]	20543
20543	2022-03-25 17:44:28	2022-03-25 17:44:29	1628	12.\tCKS Szczecin 1\tCKS Szczecin\t1:51.13	App\\Models\\RelayTeam	185	11	27	\N	11113	3227	12	\N	[]	\N
20549	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	795	11	27	\N	\N	\N	12	\N	[]	20548
20550	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	873	11	27	\N	\N	\N	12	\N	[]	20548
20551	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	787	11	27	\N	\N	\N	12	\N	[]	20548
20552	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	874	11	27	\N	\N	\N	12	\N	[]	20548
20548	2022-03-25 17:44:29	2022-03-25 17:44:29	1630	13.\tFrance NT 2\tFrance NT\t1:51.93	App\\Models\\RelayTeam	184	11	27	\N	11193	3205	12	\N	[]	\N
20554	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	880	11	27	\N	\N	\N	12	\N	[]	20553
20555	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	879	11	27	\N	\N	\N	12	\N	[]	20553
20556	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	792	11	27	\N	\N	\N	12	\N	[]	20553
20557	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	1056	11	27	\N	\N	\N	12	\N	[]	20553
20553	2022-03-25 17:44:29	2022-03-25 17:44:29	1632	14.\tSlaskie WOPR 1\tSlaskie WOPR\t1:52.16	App\\Models\\RelayTeam	186	11	27	\N	11216	3211	12	\N	[]	\N
20559	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	804	11	27	\N	\N	\N	12	\N	[]	20558
20560	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	801	11	27	\N	\N	\N	12	\N	[]	20558
20561	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	807	11	27	\N	\N	\N	12	\N	[]	20558
20562	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	794	11	27	\N	\N	\N	12	\N	[]	20558
20558	2022-03-25 17:44:29	2022-03-25 17:44:29	1634	15.\tDLRG Niedersachsen 2\tDLRG Niedersachsen\t1:58.55	App\\Models\\RelayTeam	189	11	27	\N	11855	3212	12	\N	[]	\N
20564	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	204	11	27	\N	\N	\N	12	\N	[]	20563
20565	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	881	11	27	\N	\N	\N	12	\N	[]	20563
20566	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	60	11	27	\N	\N	\N	12	\N	[]	20563
20567	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	39	11	27	\N	\N	\N	12	\N	[]	20563
20563	2022-03-25 17:44:29	2022-03-25 17:44:29	1636	16.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t1:58.65	App\\Models\\RelayTeam	188	11	27	\N	11865	3219	12	\N	[]	\N
20569	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	884	11	27	\N	\N	\N	12	\N	[]	20568
20570	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	886	11	27	\N	\N	\N	12	\N	[]	20568
20571	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	810	11	27	\N	\N	\N	12	\N	[]	20568
20572	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	885	11	27	\N	\N	\N	12	\N	[]	20568
20568	2022-03-25 17:44:29	2022-03-25 17:44:29	1638	17.\tAthena Salvamento 1\tAthena Salvamento\t1:59.16	App\\Models\\RelayTeam	194	11	27	\N	11916	3213	12	\N	[]	\N
20574	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	210	11	27	\N	\N	\N	12	\N	[]	20573
20575	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	41	11	27	\N	\N	\N	12	\N	[]	20573
20576	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	33	11	27	\N	\N	\N	12	\N	[]	20573
20577	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	882	11	27	\N	\N	\N	12	\N	[]	20573
20573	2022-03-25 17:44:29	2022-03-25 17:44:29	1640	18.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t2:01.37	App\\Models\\RelayTeam	192	11	27	\N	12137	3212	12	\N	[]	\N
20579	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	21	11	27	\N	\N	\N	12	\N	[]	20578
20580	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	805	11	27	\N	\N	\N	12	\N	[]	20578
20581	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	93	11	27	\N	\N	\N	12	\N	[]	20578
20582	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	1081	11	27	\N	\N	\N	12	\N	[]	20578
20578	2022-03-25 17:44:29	2022-03-25 17:44:29	1642	19.\tAthena Bracciano 2\tAthena Bracciano\t2:02.09	App\\Models\\RelayTeam	191	11	27	\N	12209	3210	12	\N	[]	\N
20584	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	243	11	27	\N	\N	\N	12	\N	[]	20583
20585	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	35	11	27	\N	\N	\N	12	\N	[]	20583
20586	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	244	11	27	\N	\N	\N	12	\N	[]	20583
20587	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	238	11	27	\N	\N	\N	12	\N	[]	20583
7576	2022-02-19 13:27:51	2022-02-19 13:27:51	1636	24.\tKOEHNE, Cedric\t97\tDLRG Herzebrock-Clarholz\t2:42.66	App\\Models\\Athlete	682	1	6	\N	16266	250	2	8	[]	\N
20583	2022-03-25 17:44:29	2022-03-25 17:44:29	1644	20.\tRB Echt 1\tRB Echt\t2:02.93	App\\Models\\RelayTeam	190	11	27	\N	12293	15	12	\N	[]	\N
20589	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	883	11	27	\N	\N	\N	12	\N	[]	20588
20590	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	559	11	27	\N	\N	\N	12	\N	[]	20588
20591	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	42	11	27	\N	\N	\N	12	\N	[]	20588
20592	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	47	11	27	\N	\N	\N	12	\N	[]	20588
20588	2022-03-25 17:44:29	2022-03-25 17:44:29	1646	21.\tDLRG Alpen 1\tDLRG Alpen\t2:03.98	App\\Models\\RelayTeam	193	11	27	\N	12398	261	12	\N	[]	\N
20594	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	808	11	27	\N	\N	\N	12	\N	[]	20593
20595	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	887	11	27	\N	\N	\N	12	\N	[]	20593
20596	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	797	11	27	\N	\N	\N	12	\N	[]	20593
20597	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	888	11	27	\N	\N	\N	12	\N	[]	20593
20593	2022-03-25 17:44:29	2022-03-25 17:44:29	1648	22.\tAthena Salvamento 2\tAthena Salvamento\t2:10.35	App\\Models\\RelayTeam	195	11	27	\N	13035	3213	12	\N	[]	\N
20598	2022-03-25 17:44:29	2022-03-25 17:44:29	1650	23.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t2:12.48	App\\Models\\RelayTeam	198	11	27	\N	13248	39	12	\N	[]	\N
20600	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	68	11	27	\N	\N	\N	12	\N	[]	20599
20601	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	815	11	27	\N	\N	\N	12	\N	[]	20599
20602	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	239	11	27	\N	\N	\N	12	\N	[]	20599
20603	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	812	11	27	\N	\N	\N	12	\N	[]	20599
20599	2022-03-25 17:44:29	2022-03-25 17:44:29	1652	24.\tDLRG Gütersloh 1\tDLRG Guetersloh\t2:14.16	App\\Models\\RelayTeam	197	11	27	\N	13416	3220	12	\N	[]	\N
20605	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	814	11	27	\N	\N	\N	12	\N	[]	20604
20606	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	245	11	27	\N	\N	\N	12	\N	[]	20604
20607	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	979	11	27	\N	\N	\N	12	\N	[]	20604
20608	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	980	11	27	\N	\N	\N	12	\N	[]	20604
20604	2022-03-25 17:44:29	2022-03-25 17:44:29	1654	25.\tRB Echt 2\tRB Echt\t2:15.68	App\\Models\\RelayTeam	199	11	27	\N	13568	15	12	\N	[]	\N
20610	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	894	11	27	\N	\N	\N	12	\N	[]	20609
20611	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	896	11	27	\N	\N	\N	12	\N	[]	20609
20612	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	895	11	27	\N	\N	\N	12	\N	[]	20609
20613	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	893	11	27	\N	\N	\N	12	\N	[]	20609
20609	2022-03-25 17:44:29	2022-03-25 17:44:29	1663	1.\tHungarian NT 1\tHungarian NT\t1:29.51	App\\Models\\RelayTeam	200	11	27	\N	8951	3233	12	\N	[]	\N
20615	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	442	11	27	\N	\N	\N	12	\N	[]	20614
20616	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	255	11	27	\N	\N	\N	12	\N	[]	20614
20617	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	897	11	27	\N	\N	\N	12	\N	[]	20614
20618	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	669	11	27	\N	\N	\N	12	\N	[]	20614
20614	2022-03-25 17:44:29	2022-03-25 17:44:29	1665	2.\tItaly NT 1\tItaly NT\t1:29.56	App\\Models\\RelayTeam	201	11	27	\N	8956	3201	12	\N	[]	\N
20620	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	901	11	27	\N	\N	\N	12	\N	[]	20619
20621	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	446	11	27	\N	\N	\N	12	\N	[]	20619
20622	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	902	11	27	\N	\N	\N	12	\N	[]	20619
20623	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	903	11	27	\N	\N	\N	12	\N	[]	20619
20619	2022-03-25 17:44:29	2022-03-25 17:44:29	1667	3.\tItaly NT 2\tItaly NT\t1:30.19	App\\Models\\RelayTeam	203	11	27	\N	9019	3201	12	\N	[]	\N
20625	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	830	11	27	\N	\N	\N	12	\N	[]	20624
20626	2022-03-25 17:44:29	2022-03-25 17:44:29	\N	\N	App\\Models\\Athlete	918	11	27	\N	\N	\N	12	\N	[]	20624
20627	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	916	11	27	\N	\N	\N	12	\N	[]	20624
20628	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	917	11	27	\N	\N	\N	12	\N	[]	20624
20624	2022-03-25 17:44:29	2022-03-25 17:44:30	1669	4.\tSAFA 2000 1\tSAFA 2000\t1:30.56	App\\Models\\RelayTeam	208	11	27	\N	9056	3202	12	\N	[]	\N
20630	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	904	11	27	\N	\N	\N	12	\N	[]	20629
20631	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1116	11	27	\N	\N	\N	12	\N	[]	20629
20632	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	905	11	27	\N	\N	\N	12	\N	[]	20629
20633	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	906	11	27	\N	\N	\N	12	\N	[]	20629
20629	2022-03-25 17:44:30	2022-03-25 17:44:30	1671	5.\tPolen NT 1\tPolen NT\t1:31.18	App\\Models\\RelayTeam	204	11	27	\N	9118	3234	12	\N	[]	\N
20635	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	925	11	27	\N	\N	\N	12	\N	[]	20634
20636	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1119	11	27	\N	\N	\N	12	\N	[]	20634
20637	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	923	11	27	\N	\N	\N	12	\N	[]	20634
20638	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1120	11	27	\N	\N	\N	12	\N	[]	20634
6557	2022-02-19 13:27:45	2022-02-19 13:27:45	53	14.\tVAN LOON, Isabel\t02\tRB Gouda\t2:42.62	App\\Models\\Athlete	28	1	1	\N	16262	17	2	7	[]	\N
20634	2022-03-25 17:44:30	2022-03-25 17:44:30	1673	6.\tDLRG Luckenwalde 1\tDLRG Luckenwalde\t1:31.61	App\\Models\\RelayTeam	211	11	27	\N	9161	3225	12	\N	[]	\N
6558	2022-02-19 13:27:45	2022-02-19 13:27:45	54	15.\tUTERMUELLER, Pia\t01\tDLRG Buchholz e.V.\t2:42.67	App\\Models\\Athlete	619	1	1	\N	16267	234	2	7	[]	\N
6559	2022-02-19 13:27:45	2022-02-19 13:27:45	55	16.\tVENTER, Chirsna\t00\tSouth Africa\t2:43.78	App\\Models\\Athlete	620	1	1	\N	16378	232	2	7	[]	\N
6560	2022-02-19 13:27:45	2022-02-19 13:27:45	56	17.\tDELL'OSPEDALE, Sara\t03\t3T Sporting Club\t2:45.06	App\\Models\\Athlete	10	1	1	\N	16506	233	2	7	[]	\N
6561	2022-02-19 13:27:45	2022-02-19 13:27:45	57	18.\tBOROWIAK, Kimberley\t02\tDLRG LV Niedersachsen\t2:47.02	App\\Models\\Athlete	399	1	1	\N	16702	236	2	7	[]	\N
6562	2022-02-19 13:27:45	2022-02-19 13:27:45	58	19.\tVAN BEBBER, Danique\t00\tRB Heythuysen\t2:47.94	App\\Models\\Athlete	621	1	1	\N	16794	237	2	7	[]	\N
6563	2022-02-19 13:27:45	2022-02-19 13:27:45	59	20.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg\t2:48.86	App\\Models\\Athlete	108	1	1	\N	16886	39	2	7	[]	\N
6564	2022-02-19 13:27:45	2022-02-19 13:27:45	60	21.\tJANSSEN, Isabelle\t00\tRB Dordrecht\t2:49.79	App\\Models\\Athlete	109	1	1	\N	16979	13	2	7	[]	\N
6565	2022-02-19 13:27:45	2022-02-19 13:27:45	61	22.\tDALHUISEN, Renske\t03\tRB Gouda\t2:50.74	App\\Models\\Athlete	30	1	1	\N	17074	17	2	7	[]	\N
6566	2022-02-19 13:27:45	2022-02-19 13:27:45	62	23.\tPISTERS, Nathalie\t01\tRB Heythuysen\t2:51.66	App\\Models\\Athlete	35	1	1	\N	17166	237	2	7	[]	\N
6567	2022-02-19 13:27:45	2022-02-19 13:27:45	63	24.\tLUESS, Mia Carina\t01\tDLRG Buchholz e.V.\t2:52.08	App\\Models\\Athlete	622	1	1	\N	17208	234	2	7	[]	\N
6568	2022-02-19 13:27:45	2022-02-19 13:27:45	64	25.\tHOVIND GROEV, Ida\t03\tStarfish SLC\t2:56.87	App\\Models\\Athlete	40	1	1	\N	17687	235	2	7	[]	\N
6569	2022-02-19 13:27:45	2022-02-19 13:27:45	65	26.\tSTOKBROECKX, Selina\t03\tRB Heythuysen\t2:58.06	App\\Models\\Athlete	405	1	1	\N	17806	237	2	7	[]	\N
6570	2022-02-19 13:27:45	2022-02-19 13:27:45	66	27.\tBUNTJER, Lisa\t01\tDLRG LV Niedersachsen\t3:01.35	App\\Models\\Athlete	623	1	1	\N	18135	236	2	7	[]	\N
6571	2022-02-19 13:27:45	2022-02-19 13:27:45	67	28.\tJANSSEN, Fabienne\t03\tRB Heythuysen\t3:03.90	App\\Models\\Athlete	57	1	1	\N	18390	237	2	7	[]	\N
6572	2022-02-19 13:27:45	2022-02-19 13:27:45	68	29.\tEGGERDING, Pip\t03\tRB Staphorst\t3:14.31	App\\Models\\Athlete	62	1	1	\N	19431	26	2	7	[]	\N
6573	2022-02-19 13:27:45	2022-02-19 13:27:45	69	30.\tLISSMANN, Lea\t03\tDLRG Kusel KiXX\t3:18.24	App\\Models\\Athlete	64	1	1	\N	19824	238	2	7	[]	\N
6574	2022-02-19 13:27:45	2022-02-19 13:27:45	70	31.\tHEIN, Nikki\t02\tRB Staphorst\t3:20.31	App\\Models\\Athlete	409	1	1	\N	20031	26	2	7	[]	\N
6575	2022-02-19 13:27:45	2022-02-19 13:27:45	71	32.\tHARTH, Julia\t02\tDLRG Kusel KiXX\t3:38.21	App\\Models\\Athlete	624	1	1	\N	21821	238	2	7	[]	\N
6576	2022-02-19 13:27:45	2022-02-19 13:27:45	73	1.\tMESCHIARI, Silvia\t92\tItaly\t2:11.34	App\\Models\\Athlete	625	1	1	\N	13134	1	2	8	[]	\N
6577	2022-02-19 13:27:45	2022-02-19 13:27:45	74	2.\tVAN ZYL, Tove\t97\tSouth Africa\t2:28.27	App\\Models\\Athlete	626	1	1	\N	14827	232	2	8	[]	\N
6578	2022-02-19 13:27:45	2022-02-19 13:27:45	75	3.\tMEUFFELS, Fiona\t95\tRB Nederweert\t2:30.14	App\\Models\\Athlete	89	1	1	\N	15014	35	2	8	[]	\N
6579	2022-02-19 13:27:45	2022-02-19 13:27:45	76	4.\tRESINK, Aniek\t95\tRB Dordrecht\t2:36.09	App\\Models\\Athlete	91	1	1	\N	15609	13	2	8	[]	\N
6580	2022-02-19 13:27:45	2022-02-19 13:27:45	77	5.\tSTEIN, Saskia\t98\tDLRG LV Niedersachsen\t2:40.27	App\\Models\\Athlete	107	1	1	\N	16027	236	2	8	[]	\N
6581	2022-02-19 13:27:45	2022-02-19 13:27:45	78	6.\tHUISINGA, Ellen\t92\tDLRG LV Niedersachsen\t2:41.43	App\\Models\\Athlete	627	1	1	\N	16143	236	2	8	[]	\N
6582	2022-02-19 13:27:45	2022-02-19 13:27:45	79	7.\tVAN DE HEUVEL, Marsha\t98\tRB Gouda\t2:42.04	App\\Models\\Athlete	628	1	1	\N	16204	17	2	8	[]	\N
6583	2022-02-19 13:27:45	2022-02-19 13:27:45	80	8.\tKOCH, Kaykee\t93\tNL Defensie Lifesaving\t2:42.77	App\\Models\\Athlete	629	1	1	\N	16277	239	2	8	[]	\N
6584	2022-02-19 13:27:45	2022-02-19 13:27:45	81	9.\tGELMERS, Sharon\t94\tNL Defensie Lifesaving\t2:43.49	App\\Models\\Athlete	630	1	1	\N	16349	239	2	8	[]	\N
6585	2022-02-19 13:27:45	2022-02-19 13:27:45	82	10.\tBRUIJNIKS, Kim\t99\tRB Gouda\t2:43.95	App\\Models\\Athlete	631	1	1	\N	16395	17	2	8	[]	\N
6586	2022-02-19 13:27:45	2022-02-19 13:27:45	83	11.\tGROOT, Kathy\t97\tRB Dordrecht\t2:46.30	App\\Models\\Athlete	570	1	1	\N	16630	13	2	8	[]	\N
6587	2022-02-19 13:27:45	2022-02-19 13:27:45	84	12.\tDE VRIES, Denise\t91\tNL Defensie Lifesaving\t2:46.50	App\\Models\\Athlete	98	1	1	\N	16650	239	2	8	[]	\N
6588	2022-02-19 13:27:45	2022-02-19 13:27:45	85	13.\tVAN ZADEL, Kelly\t90\tRB Zevenaar 'De Breuly'\t2:49.61	App\\Models\\Athlete	111	1	1	\N	16961	240	2	8	[]	\N
6589	2022-02-19 13:27:45	2022-02-19 13:27:45	86	14.\tCASPERS, Tamara\t90\tRB Dordrecht\t2:49.77	App\\Models\\Athlete	632	1	1	\N	16977	13	2	8	[]	\N
6590	2022-02-19 13:27:45	2022-02-19 13:27:45	87	15.\tSCHULTZ, Vanessa Anna\t96\tDLRG Kusel KiXX\t2:51.90	App\\Models\\Athlete	633	1	1	\N	17190	238	2	8	[]	\N
6591	2022-02-19 13:27:45	2022-02-19 13:27:45	88	16.\tYTSMA, Nynke\t97\tNL Defensie Lifesaving\t2:52.39	App\\Models\\Athlete	99	1	1	\N	17239	239	2	8	[]	\N
6592	2022-02-19 13:27:45	2022-02-19 13:27:45	89	17.\tTICHELAAR, Romy\t95\tRB Zevenaar 'De Breuly'\t2:56.04	App\\Models\\Athlete	634	1	1	\N	17604	240	2	8	[]	\N
6593	2022-02-19 13:27:45	2022-02-19 13:27:45	90	18.\tMARX, Katharina\t94\tDLRG Haltern\t3:01.49	App\\Models\\Athlete	635	1	1	\N	18149	241	2	8	[]	\N
6594	2022-02-19 13:27:45	2022-02-19 13:27:45	96	19.\tWIENHOLDT, Sina\t89\tDLRG Duisburg-Homberg\t3:01.92	App\\Models\\Athlete	122	1	1	\N	18192	39	2	8	[]	\N
6595	2022-02-19 13:27:45	2022-02-19 13:27:45	97	20.\tKEURENTJES, Anne\t95\tRB Boxtel\t3:07.53	App\\Models\\Athlete	572	1	1	\N	18753	122	2	8	[]	\N
7577	2022-02-19 13:27:51	2022-02-19 13:27:51	1637	25.\tVOSS, Lennart\t94\tDLRG Buchholz e.V.\t2:43.70	App\\Models\\Athlete	748	1	6	\N	16370	234	2	8	[]	\N
6596	2022-02-19 13:27:45	2022-02-19 13:27:45	98	21.\tSCHMIEDNER, Jana\t99\tDLRG Duisburg-Homberg\t3:07.75	App\\Models\\Athlete	636	1	1	\N	18775	39	2	8	[]	\N
6597	2022-02-19 13:27:45	2022-02-19 13:27:45	99	22.\tBRENNEISER, Lea Maria\t99\tDLRG Kusel KiXX\t3:08.01	App\\Models\\Athlete	637	1	1	\N	18801	238	2	8	[]	\N
6598	2022-02-19 13:27:45	2022-02-19 13:27:45	100	23.\tSCHULTZ, Francesca Andrea\t94\tDLRG Kusel KiXX\t3:13.61	App\\Models\\Athlete	638	1	1	\N	19361	238	2	8	[]	\N
6599	2022-02-19 13:27:45	2022-02-19 13:27:45	101	24.\tSPEL, Diede\t95\tRB Zwolle\t3:14.06	App\\Models\\Athlete	639	1	1	\N	19406	242	2	8	[]	\N
6600	2022-02-19 13:27:45	2022-02-19 13:27:45	103	1.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t2:46.05	App\\Models\\Athlete	640	1	1	\N	16605	243	2	9	[]	\N
6601	2022-02-19 13:27:45	2022-02-19 13:27:45	104	2.\tLINDER, Anna\t86\tDLRG Ennigerloh e.V.\t2:47.94	App\\Models\\Athlete	512	1	1	\N	16794	244	2	9	[]	\N
6602	2022-02-19 13:27:45	2022-02-19 13:27:45	105	3.\tSTEVENS, Danielle\t88\tRB Oss\t3:05.46	App\\Models\\Athlete	641	1	1	\N	18546	43	2	9	[]	\N
6603	2022-02-19 13:27:45	2022-02-19 13:27:45	107	1.\tDITTSCHAR, Steph\t68\tDLRG Ennigerloh e.V.\t2:51.93	App\\Models\\Athlete	642	1	1	\N	17193	244	2	10	[]	\N
6604	2022-02-19 13:27:45	2022-02-19 13:27:45	108	2.\tHAKE, Michaela\t66\tDLRG OG Stadtlohn e.V.\t3:50.43	App\\Models\\Athlete	643	1	1	\N	23043	245	2	10	[]	\N
6605	2022-02-19 13:27:45	2022-02-19 13:27:45	113	1.\tKLEINHANS, Mark\t01\tSouth Africa\t2:12.58	App\\Models\\Athlete	644	1	1	\N	13258	232	2	7	[]	\N
6606	2022-02-19 13:27:45	2022-02-19 13:27:45	114	2.\tPERUMAL, Seyuran\t01\tSouth Africa\t2:15.72	App\\Models\\Athlete	645	1	1	\N	13572	232	2	7	[]	\N
6607	2022-02-19 13:27:45	2022-02-19 13:27:45	115	3.\tDU TOIT, Botha\t00\tSouth Africa\t2:15.82	App\\Models\\Athlete	646	1	1	\N	13582	232	2	7	[]	\N
6608	2022-02-19 13:27:45	2022-02-19 13:27:45	116	4.\tBENSMANN, Luca\t01\tDLRG LV Niedersachsen\t2:16.74	App\\Models\\Athlete	647	1	1	\N	13674	236	2	7	[]	\N
6609	2022-02-19 13:27:45	2022-02-19 13:27:45	117	5.\tSCHWERTHELM, Jonas\t00\tDLRG Goslar\t2:22.73	App\\Models\\Athlete	648	1	1	\N	14273	246	2	7	[]	\N
6610	2022-02-19 13:27:45	2022-02-19 13:27:45	118	6.\tROESEMEIER, Elias\t01\tDLRG LV Niedersachsen\t2:23.89	App\\Models\\Athlete	649	1	1	\N	14389	236	2	7	[]	\N
6611	2022-02-19 13:27:45	2022-02-19 13:27:45	119	7.\tWILLOWS, Branden\t01\tSouth Africa\t2:24.32	App\\Models\\Athlete	650	1	1	\N	14432	232	2	7	[]	\N
6612	2022-02-19 13:27:45	2022-02-19 13:27:45	120	8.\tBONGERS, Rick\t00\tRB Heythuysen\t2:24.81	App\\Models\\Athlete	138	1	1	\N	14481	237	2	7	[]	\N
6613	2022-02-19 13:27:45	2022-02-19 13:27:45	121	9.\tSLATTERY, Sean\t00\tCork Surf Lifesaving Club\t2:24.91	App\\Models\\Athlete	457	1	1	\N	14491	247	2	7	[]	\N
6614	2022-02-19 13:27:45	2022-02-19 13:27:45	122	10.\tVAN DEN AKKER, Tom\t02\tRB Echt\t2:29.73	App\\Models\\Athlete	651	1	1	\N	14973	15	2	7	[]	\N
6615	2022-02-19 13:27:45	2022-02-19 13:27:45	123	11.\tVAN DEN AKKER, Bas\t02\tRB Echt\t2:30.49	App\\Models\\Athlete	652	1	1	\N	15049	15	2	7	[]	\N
6616	2022-02-19 13:27:45	2022-02-19 13:27:45	124	12.\tKIEHNE, Maximilian\t03\tDLRG LV Niedersachsen\t2:30.52	App\\Models\\Athlete	653	1	1	\N	15052	236	2	7	[]	\N
6617	2022-02-19 13:27:45	2022-02-19 13:27:45	125	13.\tWOLTERMAN, Flynn\t03\tRB Vlissingen\t2:34.78	App\\Models\\Athlete	654	1	1	\N	15478	248	2	7	[]	\N
6618	2022-02-19 13:27:45	2022-02-19 13:27:45	126	14.\tTREDER, Mats\t03\tDLRG Haltern\t2:37.14	App\\Models\\Athlete	655	1	1	\N	15714	241	2	7	[]	\N
6619	2022-02-19 13:27:45	2022-02-19 13:27:45	127	15.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t2:37.16	App\\Models\\Athlete	656	1	1	\N	15716	17	2	7	[]	\N
6620	2022-02-19 13:27:45	2022-02-19 13:27:45	128	16.\tSCHULTZ, Marco Philip\t00\tDLRG Kusel KiXX\t2:37.96	App\\Models\\Athlete	657	1	1	\N	15796	238	2	7	[]	\N
6621	2022-02-19 13:27:45	2022-02-19 13:27:45	129	17.\tVAN HOUTEM, Jaden\t02\tRB Echt\t2:39.74	App\\Models\\Athlete	658	1	1	\N	15974	15	2	7	[]	\N
6622	2022-02-19 13:27:45	2022-02-19 13:27:45	130	18.\tSOLVANG ENGESETH, Joergen\t03\tStarfish SLC\t2:45.36	App\\Models\\Athlete	659	1	1	\N	16536	235	2	7	[]	\N
6623	2022-02-19 13:27:45	2022-02-19 13:27:45	131	19.\tKAMPHUIS, Roy\t01\tRB Staphorst\t2:48.05	App\\Models\\Athlete	660	1	1	\N	16805	26	2	7	[]	\N
6624	2022-02-19 13:27:45	2022-02-19 13:27:45	132	20.\tSCHWIND, Vinzenz\t02\tDLRG Nieder-Olm/Woerrstadt\t2:48.20	App\\Models\\Athlete	661	1	1	\N	16820	249	2	7	[]	\N
6625	2022-02-19 13:27:45	2022-02-19 13:27:45	133	21.\tPOETTER, Lukas\t01\tDLRG Herzebrock-Clarholz\t2:53.98	App\\Models\\Athlete	662	1	1	\N	17398	250	2	7	[]	\N
6626	2022-02-19 13:27:45	2022-02-19 13:27:45	134	22.\tKAMPHUIS, Sven\t02\tRB Staphorst\t3:07.08	App\\Models\\Athlete	663	1	1	\N	18708	26	2	7	[]	\N
6627	2022-02-19 13:27:45	2022-02-19 13:27:45	135	23.\tBITTMANN, Paul\t03\tDLRG Kusel KiXX\t3:08.04	App\\Models\\Athlete	664	1	1	\N	18804	238	2	7	[]	\N
6628	2022-02-19 13:27:45	2022-02-19 13:27:45	136	24.\tHAUPTVOGEL, Aaron\t01\tDLRG Haltern\t3:10.27	App\\Models\\Athlete	665	1	1	\N	19027	241	2	7	[]	\N
6629	2022-02-19 13:27:45	2022-02-19 13:27:45	137	25.\tRUSSCHEN, Tom\t02\tRB Dordrecht\t3:10.29	App\\Models\\Athlete	666	1	1	\N	19029	13	2	7	[]	\N
6630	2022-02-19 13:27:45	2022-02-19 13:27:45	143	1.\tKENT, Steve\t88\tBlack Fins Squad\t1:56.18	App\\Models\\Athlete	667	1	1	\N	11618	251	2	8	[]	\N
6631	2022-02-19 13:27:45	2022-02-19 13:27:45	144	2.\tGILARDI, Federico\t91\tItaly\t1:56.79	App\\Models\\Athlete	668	1	1	\N	11679	1	2	8	[]	\N
6632	2022-02-19 13:27:45	2022-02-19 13:27:45	145	3.\tPEZZOTTI, Fabio\t97\tItaly\t1:56.83	App\\Models\\Athlete	669	1	1	\N	11683	1	2	8	[]	\N
6633	2022-02-19 13:27:45	2022-02-19 13:27:45	146	4.\tIPPOLITO, Francesco\t96\tGorizia Nuoto Asd\t2:01.64	App\\Models\\Athlete	442	1	1	\N	12164	231	2	8	[]	\N
6634	2022-02-19 13:27:45	2022-02-19 13:27:45	147	5.\tCLOCCHIATTI, Brian\t98\tGorizia Nuoto Asd\t2:02.96	App\\Models\\Athlete	670	1	1	\N	12296	231	2	8	[]	\N
20640	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	898	11	27	\N	\N	\N	12	\N	[]	20639
20641	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	268	11	27	\N	\N	\N	12	\N	[]	20639
20642	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	899	11	27	\N	\N	\N	12	\N	[]	20639
20643	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	900	11	27	\N	\N	\N	12	\N	[]	20639
20639	2022-03-25 17:44:30	2022-03-25 17:44:30	1675	7.\tSpain NT 2\tSpain NT\t1:32.00	App\\Models\\RelayTeam	202	11	27	\N	9200	3204	12	\N	[]	\N
20645	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	908	11	27	\N	\N	\N	12	\N	[]	20644
20646	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1147	11	27	\N	\N	\N	12	\N	[]	20644
20647	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	829	11	27	\N	\N	\N	12	\N	[]	20644
20648	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	378	11	27	\N	\N	\N	12	\N	[]	20644
20644	2022-03-25 17:44:30	2022-03-25 17:44:30	1677	8.\tSpain NT 1\tSpain NT\t1:32.38	App\\Models\\RelayTeam	205	11	27	\N	9238	3204	12	\N	[]	\N
20650	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	910	11	27	\N	\N	\N	12	\N	[]	20649
20651	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	911	11	27	\N	\N	\N	12	\N	[]	20649
20652	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	912	11	27	\N	\N	\N	12	\N	[]	20649
20653	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	913	11	27	\N	\N	\N	12	\N	[]	20649
20649	2022-03-25 17:44:30	2022-03-25 17:44:30	1679	9.\tFrance NT 2\tFrance NT\t1:34.77	App\\Models\\RelayTeam	206	11	27	\N	9477	3205	12	\N	[]	\N
20655	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	847	11	27	\N	\N	\N	12	\N	[]	20654
20656	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	851	11	27	\N	\N	\N	12	\N	[]	20654
20657	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	289	11	27	\N	\N	\N	12	\N	[]	20654
20658	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	133	11	27	\N	\N	\N	12	\N	[]	20654
20654	2022-03-25 17:44:30	2022-03-25 17:44:30	1681	10.\tAthena Bracciano 1\tAthena Bracciano\t1:35.78	App\\Models\\RelayTeam	210	11	27	\N	9578	3210	12	\N	[]	\N
20660	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	835	11	27	\N	\N	\N	12	\N	[]	20659
20661	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	832	11	27	\N	\N	\N	12	\N	[]	20659
20662	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	914	11	27	\N	\N	\N	12	\N	[]	20659
20663	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	915	11	27	\N	\N	\N	12	\N	[]	20659
20659	2022-03-25 17:44:30	2022-03-25 17:44:30	1683	11.\tASD Gorizia Nuoto 1\tASD Gorizia Nuoto\t1:36.05	App\\Models\\RelayTeam	207	11	27	\N	9605	3224	12	\N	[]	\N
20665	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	919	11	27	\N	\N	\N	12	\N	[]	20664
20666	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	921	11	27	\N	\N	\N	12	\N	[]	20664
20667	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	922	11	27	\N	\N	\N	12	\N	[]	20664
20668	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	920	11	27	\N	\N	\N	12	\N	[]	20664
20664	2022-03-25 17:44:30	2022-03-25 17:44:30	1685	12.\tA.S.D. Sportiva Sturla 1\tA.S.D. Sportiva Sturla\t1:37.45	App\\Models\\RelayTeam	209	11	27	\N	9745	3235	12	\N	[]	\N
20670	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	283	11	27	\N	\N	\N	12	\N	[]	20669
20671	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	282	11	27	\N	\N	\N	12	\N	[]	20669
20672	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	929	11	27	\N	\N	\N	12	\N	[]	20669
20673	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	284	11	27	\N	\N	\N	12	\N	[]	20669
20669	2022-03-25 17:44:30	2022-03-25 17:44:30	1687	13.\tDLRG Nordrhein-Westfalen 1\tDLRG Nordrhein-Westfalen\t1:37.92	App\\Models\\RelayTeam	214	11	27	\N	9792	3219	12	\N	[]	\N
20675	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	928	11	27	\N	\N	\N	12	\N	[]	20674
20676	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	831	11	27	\N	\N	\N	12	\N	[]	20674
20677	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	833	11	27	\N	\N	\N	12	\N	[]	20674
20678	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1090	11	27	\N	\N	\N	12	\N	[]	20674
20674	2022-03-25 17:44:30	2022-03-25 17:44:30	1689	14.\tCKS Szczecin 1\tCKS Szczecin\t1:38.12	App\\Models\\RelayTeam	213	11	27	\N	9812	3227	12	\N	[]	\N
20680	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	930	11	27	\N	\N	\N	12	\N	[]	20679
20681	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	931	11	27	\N	\N	\N	12	\N	[]	20679
20682	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	932	11	27	\N	\N	\N	12	\N	[]	20679
20683	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	933	11	27	\N	\N	\N	12	\N	[]	20679
20679	2022-03-25 17:44:30	2022-03-25 17:44:30	1691	15.\tFrance NT 1\tFrance NT\t1:39.23	App\\Models\\RelayTeam	215	11	27	\N	9923	3205	12	\N	[]	\N
20685	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	272	11	27	\N	\N	\N	12	\N	[]	20684
20686	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	926	11	27	\N	\N	\N	12	\N	[]	20684
20687	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1101	11	27	\N	\N	\N	12	\N	[]	20684
20688	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	587	11	27	\N	\N	\N	12	\N	[]	20684
20684	2022-03-25 17:44:30	2022-03-25 17:44:30	1693	16.\tASD Rosetana Nuoto 1\tASD Rosetana Nuoto\t1:39.62	App\\Models\\RelayTeam	212	11	27	\N	9962	3215	12	\N	[]	\N
20690	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	989	11	27	\N	\N	\N	12	\N	[]	20689
20691	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	286	11	27	\N	\N	\N	12	\N	[]	20689
20692	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	383	11	27	\N	\N	\N	12	\N	[]	20689
20693	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	285	11	27	\N	\N	\N	12	\N	[]	20689
20689	2022-03-25 17:44:30	2022-03-25 17:44:30	1695	17.\tDLRG Gütersloh 1\tDLRG Guetersloh\t1:39.70	App\\Models\\RelayTeam	249	11	27	\N	9970	3220	12	\N	[]	\N
20695	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	935	11	27	\N	\N	\N	12	\N	[]	20694
20696	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	299	11	27	\N	\N	\N	12	\N	[]	20694
20697	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	934	11	27	\N	\N	\N	12	\N	[]	20694
20698	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	298	11	27	\N	\N	\N	12	\N	[]	20694
20694	2022-03-25 17:44:30	2022-03-25 17:44:30	1697	18.\tAccademia Di Salvamento 1\tAccademia Di Salvamento\t1:40.67	App\\Models\\RelayTeam	216	11	27	\N	10067	3203	12	\N	[]	\N
20700	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	855	11	27	\N	\N	\N	12	\N	[]	20699
20701	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	326	11	27	\N	\N	\N	12	\N	[]	20699
20702	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	676	11	27	\N	\N	\N	12	\N	[]	20699
20703	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	850	11	27	\N	\N	\N	12	\N	[]	20699
20699	2022-03-25 17:44:30	2022-03-25 17:44:30	1699	19.\tDLRG Buchholz United 1\tDLRG Buchholz United\t1:42.88	App\\Models\\RelayTeam	218	11	27	\N	10288	3230	12	\N	[]	\N
20705	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	937	11	27	\N	\N	\N	12	\N	[]	20704
20706	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	936	11	27	\N	\N	\N	12	\N	[]	20704
20707	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	939	11	27	\N	\N	\N	12	\N	[]	20704
20708	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	1130	11	27	\N	\N	\N	12	\N	[]	20704
20704	2022-03-25 17:44:30	2022-03-25 17:44:30	1701	20.\tMKS Szczecin 1\tMKS Szczecin\t1:45.30	App\\Models\\RelayTeam	217	11	27	\N	10530	3236	12	\N	[]	\N
20710	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	280	11	27	\N	\N	\N	12	\N	[]	20709
20711	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	135	11	27	\N	\N	\N	12	\N	[]	20709
20712	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	306	11	27	\N	\N	\N	12	\N	[]	20709
20713	2022-03-25 17:44:30	2022-03-25 17:44:30	\N	\N	App\\Models\\Athlete	149	11	27	\N	\N	\N	12	\N	[]	20709
20709	2022-03-25 17:44:30	2022-03-25 17:44:30	1703	21.\tRB Echt 1\tRB Echt\t1:45.50	App\\Models\\RelayTeam	221	11	27	\N	10550	15	12	\N	[]	\N
20715	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	943	11	27	\N	\N	\N	12	\N	[]	20714
20716	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	942	11	27	\N	\N	\N	12	\N	[]	20714
20717	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	839	11	27	\N	\N	\N	12	\N	[]	20714
20718	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	944	11	27	\N	\N	\N	12	\N	[]	20714
20714	2022-03-25 17:44:30	2022-03-25 17:44:31	1705	22.\tSlaskie WOPR 1\tSlaskie WOPR\t1:45.75	App\\Models\\RelayTeam	220	11	27	\N	10575	3211	12	\N	[]	\N
20720	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	996	11	27	\N	\N	\N	12	\N	[]	20719
20721	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	956	11	27	\N	\N	\N	12	\N	[]	20719
20722	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	957	11	27	\N	\N	\N	12	\N	[]	20719
20723	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	955	11	27	\N	\N	\N	12	\N	[]	20719
20719	2022-03-25 17:44:31	2022-03-25 17:44:31	1707	23.\tAccademia Di Salvamento 2\tAccademia Di Salvamento\t1:47.76	App\\Models\\RelayTeam	225	11	27	\N	10776	3203	12	\N	[]	\N
20725	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	950	11	27	\N	\N	\N	12	\N	[]	20724
20726	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	952	11	27	\N	\N	\N	12	\N	[]	20724
20727	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	949	11	27	\N	\N	\N	12	\N	[]	20724
20728	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	951	11	27	\N	\N	\N	12	\N	[]	20724
20724	2022-03-25 17:44:31	2022-03-25 17:44:31	1714	24.\tAthena Bracciano 2\tAthena Bracciano\t1:48.86	App\\Models\\RelayTeam	223	11	27	\N	10886	3210	12	\N	[]	\N
20730	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	953	11	27	\N	\N	\N	12	\N	[]	20729
20731	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	338	11	27	\N	\N	\N	12	\N	[]	20729
20732	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	337	11	27	\N	\N	\N	12	\N	[]	20729
20733	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	340	11	27	\N	\N	\N	12	\N	[]	20729
20729	2022-03-25 17:44:31	2022-03-25 17:44:31	1716	25.\tDLRG Alpen 1\tDLRG Alpen\t1:50.90	App\\Models\\RelayTeam	224	11	27	\N	11090	261	12	\N	[]	\N
20735	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	963	11	27	\N	\N	\N	12	\N	[]	20734
20736	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	964	11	27	\N	\N	\N	12	\N	[]	20734
20737	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	965	11	27	\N	\N	\N	12	\N	[]	20734
20738	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	966	11	27	\N	\N	\N	12	\N	[]	20734
20734	2022-03-25 17:44:31	2022-03-25 17:44:31	1718	26.\tDLRG Niedersachsen 1\tDLRG Niedersachsen\t1:52.25	App\\Models\\RelayTeam	228	11	27	\N	11225	3212	12	\N	[]	\N
20740	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	960	11	27	\N	\N	\N	12	\N	[]	20739
20741	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	961	11	27	\N	\N	\N	12	\N	[]	20739
20742	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	962	11	27	\N	\N	\N	12	\N	[]	20739
20743	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	333	11	27	\N	\N	\N	12	\N	[]	20739
6635	2022-02-19 13:27:45	2022-02-19 13:27:45	148	6.\tDRINNAN, Cole\t97\tBlack Fins Squad\t2:05.93	App\\Models\\Athlete	671	1	1	\N	12593	251	2	8	[]	\N
20739	2022-03-25 17:44:31	2022-03-25 17:44:31	1720	27.\tDLRG Duisburg-Homberg  1\tDLRG Duisburg-Homberg \t1:56.98	App\\Models\\RelayTeam	227	11	27	\N	11698	39	12	\N	[]	\N
20745	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	986	11	27	\N	\N	\N	12	\N	[]	20744
20746	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	309	11	27	\N	\N	\N	12	\N	[]	20744
20747	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	959	11	27	\N	\N	\N	12	\N	[]	20744
20748	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	987	11	27	\N	\N	\N	12	\N	[]	20744
20744	2022-03-25 17:44:31	2022-03-25 17:44:31	1722	28.\tRB Echt 2\tRB Echt\t1:58.71	App\\Models\\RelayTeam	226	11	27	\N	11871	15	12	\N	[]	\N
20750	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	1148	11	27	\N	\N	\N	12	\N	[]	20749
20751	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	998	11	27	\N	\N	\N	12	\N	[]	20749
20752	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	1139	11	27	\N	\N	\N	12	\N	[]	20749
20753	2022-03-25 17:44:31	2022-03-25 17:44:31	\N	\N	App\\Models\\Athlete	997	11	27	\N	\N	\N	12	\N	[]	20749
20749	2022-03-25 17:44:31	2022-03-25 17:44:31	1724	29.\tRB Waddinxveen 1\tRB Waddinxveen\t2:19.99	App\\Models\\RelayTeam	230	11	27	\N	13999	3231	12	\N	[]	\N
20754	2022-03-25 17:44:31	2022-03-25 17:44:31	1726	DSQ\tAthena Salvamento 1\tAthena Salvamento	App\\Models\\RelayTeam	219	11	27	1	\N	3213	12	\N	[]	\N
20755	2022-03-25 17:44:31	2022-03-25 17:44:31	1729	DSQ\tDLRG Nordrhein-Westfalen 2\tDLRG Nordrhein-Westfalen	App\\Models\\RelayTeam	222	11	27	1	\N	3219	12	\N	[]	\N
20756	2022-03-25 17:44:31	2022-03-25 17:44:31	1732	DNS\tRB Delft 2\tRB Delft	App\\Models\\RelayTeam	266	11	27	2	\N	3221	12	\N	[]	\N
20757	2022-03-25 17:44:31	2022-03-25 17:44:31	1733	DNS\tRB Gouda 1\tRB Gouda	App\\Models\\RelayTeam	232	11	27	2	\N	17	12	\N	[]	\N
20758	2022-03-25 17:44:31	2022-03-25 17:44:31	1734	WDR\tRB Dordrecht 1\tRB Dordrecht	App\\Models\\RelayTeam	255	11	27	0	\N	13	12	\N	[]	\N
20759	2022-03-25 17:44:31	2022-03-25 17:44:31	1740	1.\tDARAIO, MADDALENA\t03\tSAFA 2000\t36.52	App\\Models\\Athlete	785	11	2	\N	3652	3202	12	12	[]	\N
20760	2022-03-25 17:44:31	2022-03-25 17:44:31	1741	2.\tOPPERMANN, Lena\t05\tDLRG Sachsen-Anhalt\t36.88	App\\Models\\Athlete	1000	11	2	\N	3688	3209	12	12	[]	\N
20761	2022-03-25 17:44:31	2022-03-25 17:44:31	1742	3.\tMAZZI, Gioia\t04\tAccademia Di Salvamento\t38.26	App\\Models\\Athlete	4	11	2	\N	3826	3203	12	12	[]	\N
20762	2022-03-25 17:44:31	2022-03-25 17:44:31	1743	4.\tJACOBS, Ella\t05\tBelgium NT\t38.30	App\\Models\\Athlete	1001	11	2	\N	3830	3206	12	12	[]	\N
20763	2022-03-25 17:44:31	2022-03-25 17:44:31	1744	5.\tVETRANO, Giulia\t05\tItaly NT\t38.39	App\\Models\\Athlete	784	11	2	\N	3839	3201	12	12	[]	\N
20764	2022-03-25 17:44:31	2022-03-25 17:44:31	1745	6.\tDELL'OSPEDALE, Sara\t03\tAccademia Di Salvamento\t39.35	App\\Models\\Athlete	10	11	2	\N	3935	3203	12	12	[]	\N
20765	2022-03-25 17:44:31	2022-03-25 17:44:31	1746	7.\tGIORDANO, Melissa\t06\tAthena Bracciano\t40.93	App\\Models\\Athlete	1053	11	2	\N	4093	3210	12	12	[]	\N
20766	2022-03-25 17:44:31	2022-03-25 17:44:31	1747	8.\tMOELLER, Kim\t03\tDLRG Niedersachsen\t41.02	App\\Models\\Athlete	794	11	2	\N	4102	3212	12	12	[]	\N
20767	2022-03-25 17:44:31	2022-03-25 17:44:31	1748	9.\tBENZMUELLER, Magdalena\t05\tKusel KiXXX\t41.13	App\\Models\\Athlete	788	11	2	\N	4113	3207	12	12	[]	\N
20768	2022-03-25 17:44:31	2022-03-25 17:44:31	1749	10.\tBONETTI, Chiara\t06\tAthena Salvamento\t41.18	App\\Models\\Athlete	1057	11	2	\N	4118	3213	12	12	[]	\N
20769	2022-03-25 17:44:31	2022-03-25 17:44:31	1750	TIRONI, Alice\t05\tSDS - Specialisti dello Sport \t41.18	App\\Models\\Athlete	1002	11	2	\N	4118	3228	12	12	[]	\N
20770	2022-03-25 17:44:31	2022-03-25 17:44:31	1751	12.\tBOUDES, Romane\t06\tFrance NT\t41.27	App\\Models\\Athlete	787	11	2	\N	4127	3205	12	12	[]	\N
20771	2022-03-25 17:44:31	2022-03-25 17:44:31	1752	13.\tPIOVANI, Giulia\t05\tIn Sport Rane Rosse\t41.49	App\\Models\\Athlete	798	11	2	\N	4149	3208	12	12	[]	\N
20772	2022-03-25 17:44:31	2022-03-25 17:44:31	1753	14.\tBONHOMME, Meline\t04\tLiege Sauvetage Club\t41.54	App\\Models\\Athlete	1006	11	2	\N	4154	3238	12	12	[]	\N
20773	2022-03-25 17:44:31	2022-03-25 17:44:31	1754	15.\tKLOMP, Dyonne\t04\tRB Weert\t41.72	App\\Models\\Athlete	31	11	2	\N	4172	12	12	12	[]	\N
20774	2022-03-25 17:44:31	2022-03-25 17:44:31	1755	16.\tCZOK, Joanna\t03\tSlaskie WOPR\t41.80	App\\Models\\Athlete	1007	11	2	\N	4180	3211	12	12	[]	\N
20775	2022-03-25 17:44:31	2022-03-25 17:44:31	1756	17.\tFELLENSIEK, Talea\t04\tDLRG Niedersachsen\t41.88	App\\Models\\Athlete	801	11	2	\N	4188	3212	12	12	[]	\N
20776	2022-03-25 17:44:31	2022-03-25 17:44:31	1757	18.\tDRABIK, Aneta\t04\tSlaskie WOPR\t42.41	App\\Models\\Athlete	793	11	2	\N	4241	3211	12	12	[]	\N
20777	2022-03-25 17:44:31	2022-03-25 17:44:31	1758	19.\tTITO, Letizia\t06\tIn Sport Rane Rosse\t42.91	App\\Models\\Athlete	789	11	2	\N	4291	3208	12	12	[]	\N
20778	2022-03-25 17:44:32	2022-03-25 17:44:32	1759	20.\tFELLENSIEK, Svea\t05\tDLRG Niedersachsen\t42.92	App\\Models\\Athlete	804	11	2	\N	4292	3212	12	12	[]	\N
20779	2022-03-25 17:44:32	2022-03-25 17:44:32	1760	21.\tBUDZINSKA, Paulina\t03\tSlaskie WOPR\t43.04	App\\Models\\Athlete	792	11	2	\N	4304	3211	12	12	[]	\N
20780	2022-03-25 17:44:32	2022-03-25 17:44:32	1761	22.\tD'ALESSANDRO, Carlotta\t06\tIn Sport Rane Rosse\t43.57	App\\Models\\Athlete	1059	11	2	\N	4357	3208	12	12	[]	\N
20781	2022-03-25 17:44:32	2022-03-25 17:44:32	1762	23.\tMEESKE, Christin\t05\tDLRG Niedersachsen\t43.96	App\\Models\\Athlete	807	11	2	\N	4396	3212	12	12	[]	\N
20782	2022-03-25 17:44:32	2022-03-25 17:44:32	1768	24.\tPETRUNGARO, Laura\t06\tIn Sport Rane Rosse\t44.05	App\\Models\\Athlete	1061	11	2	\N	4405	3208	12	12	[]	\N
20783	2022-03-25 17:44:32	2022-03-25 17:44:32	1769	25.\tDE GREEF, Ruth\t03\tRctal\t44.10	App\\Models\\Athlete	1009	11	2	\N	4410	3217	12	12	[]	\N
20784	2022-03-25 17:44:32	2022-03-25 17:44:32	1770	26.\tBUECKEN, Greta\t05\tDLRG Alpen\t44.18	App\\Models\\Athlete	1063	11	2	\N	4418	261	12	12	[]	\N
7578	2022-02-19 13:27:51	2022-02-19 13:27:51	1638	26.\tHILDEBRANDT, Leon\t97\tDLRG Goslar\t2:44.17	App\\Models\\Athlete	681	1	6	\N	16417	246	2	8	[]	\N
20785	2022-03-25 17:44:32	2022-03-25 17:44:32	1771	27.\tWIECZOREK, Lysann\t05\tDLRG Sachsen-Anhalt\t44.20	App\\Models\\Athlete	790	11	2	\N	4420	3209	12	12	[]	\N
20786	2022-03-25 17:44:32	2022-03-25 17:44:32	1772	28.\tCANNONE, Asia\t04\tAthena Salvamento\t44.39	App\\Models\\Athlete	797	11	2	\N	4439	3213	12	12	[]	\N
20787	2022-03-25 17:44:32	2022-03-25 17:44:32	1773	29.\tTUBILI, Francesca\t06\tIn Sport Rane Rosse\t44.70	App\\Models\\Athlete	1069	11	2	\N	4470	3208	12	12	[]	\N
20788	2022-03-25 17:44:32	2022-03-25 17:44:32	1774	30.\tMONGIA, Sara\t06\tASD Rosetana Nuoto\t44.71	App\\Models\\Athlete	800	11	2	\N	4471	3215	12	12	[]	\N
20789	2022-03-25 17:44:32	2022-03-25 17:44:32	1775	31.\tSPUERCK, Hanna\t03\tDLRG Nordrhein-Westfalen\t44.76	App\\Models\\Athlete	39	11	2	\N	4476	3219	12	12	[]	\N
20790	2022-03-25 17:44:32	2022-03-25 17:44:32	1776	32.\tSCHAEFER, Julia\t04\tDLRG Nordrhein-Westfalen\t44.94	App\\Models\\Athlete	60	11	2	\N	4494	3219	12	12	[]	\N
20791	2022-03-25 17:44:32	2022-03-25 17:44:32	1777	33.\tSTICKER, Lien\t06\tRctal\t45.01	App\\Models\\Athlete	803	11	2	\N	4501	3217	12	12	[]	\N
20792	2022-03-25 17:44:32	2022-03-25 17:44:32	1778	34.\tMENNEN, Fenne\t06\tRB Heytse\t45.13	App\\Models\\Athlete	1010	11	2	\N	4513	3229	12	12	[]	\N
20793	2022-03-25 17:44:32	2022-03-25 17:44:32	1779	35.\tJANISZEWSKA, Wiktoria\t04\tCKS Szczecin\t45.20	App\\Models\\Athlete	1011	11	2	\N	4520	3227	12	12	[]	\N
20794	2022-03-25 17:44:32	2022-03-25 17:44:32	1780	36.\tDEWAEL, Nell\t06\tLiege Sauvetage Club\t45.84	App\\Models\\Athlete	1008	11	2	\N	4584	3238	12	12	[]	\N
20795	2022-03-25 17:44:32	2022-03-25 17:44:32	1781	37.\tKRAUSS, Hannah\t05\tDLRG Niedersachsen\t45.87	App\\Models\\Athlete	1015	11	2	\N	4587	3212	12	12	[]	\N
20796	2022-03-25 17:44:32	2022-03-25 17:44:32	1782	38.\tSPLIETHOFF, Maja\t04\tDLRG Alpen\t45.92	App\\Models\\Athlete	42	11	2	\N	4592	261	12	12	[]	\N
20797	2022-03-25 17:44:32	2022-03-25 17:44:32	1783	39.\tGERAATS, Lieke\t06\tRB Heytse\t46.12	App\\Models\\Athlete	1016	11	2	\N	4612	3229	12	12	[]	\N
20798	2022-03-25 17:44:32	2022-03-25 17:44:32	1784	40.\tDERWAEL, Fien\t06\tSint-Truidense RC\t46.48	App\\Models\\Athlete	806	11	2	\N	4648	3214	12	12	[]	\N
20799	2022-03-25 17:44:32	2022-03-25 17:44:32	1785	41.\tMURA CITTADINI, Melissa\t03\tAccademia Di Salvamento\t46.52	App\\Models\\Athlete	473	11	2	\N	4652	3203	12	12	[]	\N
20800	2022-03-25 17:44:32	2022-03-25 17:44:32	1786	42.\tHUYSMANS, Lune\t06\tSint-Truidense RC\t46.68	App\\Models\\Athlete	1012	11	2	\N	4668	3214	12	12	[]	\N
20801	2022-03-25 17:44:32	2022-03-25 17:44:32	1787	43.\tDE KONING, Sanne\t04\tRB Gouda\t46.70	App\\Models\\Athlete	43	11	2	\N	4670	17	12	12	[]	\N
20802	2022-03-25 17:44:32	2022-03-25 17:44:32	1788	44.\tPUGGIONI, Livia\t03\tAccademia Di Salvamento\t46.73	App\\Models\\Athlete	809	11	2	\N	4673	3203	12	12	[]	\N
20803	2022-03-25 17:44:32	2022-03-25 17:44:32	1789	45.\tLONG, Calista\t05\tRB Echt\t46.87	App\\Models\\Athlete	1013	11	2	\N	4687	15	12	12	[]	\N
20804	2022-03-25 17:44:32	2022-03-25 17:44:32	1790	46.\tZAPPONE, Giorgia\t03\tAthena Salvamento\t47.04	App\\Models\\Athlete	808	11	2	\N	4704	3213	12	12	[]	\N
20805	2022-03-25 17:44:32	2022-03-25 17:44:32	1791	47.\tGRUNDMEIER, Mona\t05\tDLRG Nordrhein-Westfalen\t47.56	App\\Models\\Athlete	1018	11	2	\N	4756	3219	12	12	[]	\N
20806	2022-03-25 17:44:32	2022-03-25 17:44:32	1792	48.\tRIEDRICH, Franka\t05\tDLRG Nuernberg-Roth-Schwabach\t47.67	App\\Models\\Athlete	802	11	2	\N	4767	3216	12	12	[]	\N
20807	2022-03-25 17:44:32	2022-03-25 17:44:32	1793	49.\tBONHOMME, Janice\t06\tLiege Sauvetage Club\t47.90	App\\Models\\Athlete	1014	11	2	\N	4790	3238	12	12	[]	\N
20808	2022-03-25 17:44:32	2022-03-25 17:44:32	1794	50.\tSCHMIEMANN, Monia\t04\tDLRG Niedersachsen\t48.01	App\\Models\\Athlete	1020	11	2	\N	4801	3212	12	12	[]	\N
20809	2022-03-25 17:44:32	2022-03-25 17:44:32	1795	51.\tS'HEEREN, Mirte\t06\tSint-Truidense RC\t48.05	App\\Models\\Athlete	799	11	2	\N	4805	3214	12	12	[]	\N
20810	2022-03-25 17:44:32	2022-03-25 17:44:32	1796	52.\tSCHOSTOK, Lena\t04\tDLRG Alpen\t48.14	App\\Models\\Athlete	47	11	2	\N	4814	261	12	12	[]	\N
20811	2022-03-25 17:44:32	2022-03-25 17:44:32	1797	53.\tSPLIETHOFF, Lea\t04\tDLRG Alpen\t48.40	App\\Models\\Athlete	1065	11	2	\N	4840	261	12	12	[]	\N
20812	2022-03-25 17:44:32	2022-03-25 17:44:32	1798	54.\tVAN GELLEKOM, Lotte\t03\tRB Echt\t48.41	App\\Models\\Athlete	481	11	2	\N	4841	15	12	12	[]	\N
20813	2022-03-25 17:44:32	2022-03-25 17:44:32	1799	55.\tBARBU, Julia\t06\tRB Dordrecht\t48.74	App\\Models\\Athlete	1023	11	2	\N	4874	13	12	12	[]	\N
20814	2022-03-25 17:44:32	2022-03-25 17:44:32	1800	56.\tWIJNANT, Loes\t05\tRctal\t49.58	App\\Models\\Athlete	811	11	2	\N	4958	3217	12	12	[]	\N
20815	2022-03-25 17:44:32	2022-03-25 17:44:32	1801	57.\tSETTI, Jennifer\t05\tAthena Salvamento\t49.75	App\\Models\\Athlete	1068	11	2	\N	4975	3213	12	12	[]	\N
20816	2022-03-25 17:44:32	2022-03-25 17:44:32	1802	58.\tDOMINJANNI, Angelica\t06\tAthena Salvamento\t50.73	App\\Models\\Athlete	1066	11	2	\N	5073	3213	12	12	[]	\N
20817	2022-03-25 17:44:32	2022-03-25 17:44:32	1803	59.\tJANSSEN, Vera\t05\tRB Echt\t50.77	App\\Models\\Athlete	1017	11	2	\N	5077	15	12	12	[]	\N
20818	2022-03-25 17:44:32	2022-03-25 17:44:32	1804	60.\tROSA, Martina\t04\tAthena Bracciano\t50.80	App\\Models\\Athlete	813	11	2	\N	5080	3210	12	12	[]	\N
20819	2022-03-25 17:44:32	2022-03-25 17:44:32	1805	61.\tMONTENEGREO, Noemi\t03\tAthena Salvamento\t50.99	App\\Models\\Athlete	1058	11	2	\N	5099	3213	12	12	[]	\N
20820	2022-03-25 17:44:32	2022-03-25 17:44:32	1806	62.\tHACKEN, Anouk\t04\tRB Boxtel\t51.16	App\\Models\\Athlete	1121	11	2	\N	5116	122	12	12	[]	\N
20821	2022-03-25 17:44:32	2022-03-25 17:44:32	1807	63.\tKINGA SZCZEMBARA, Kinga Szczembara\t06\tSlaskie WOPR\t51.32	App\\Models\\Athlete	1021	11	2	\N	5132	3211	12	12	[]	\N
20822	2022-03-25 17:44:32	2022-03-25 17:44:32	1808	64.\tKOITKA, Sophie\t06\tDLRG Guetersloh\t51.98	App\\Models\\Athlete	812	11	2	\N	5198	3220	12	12	[]	\N
20823	2022-03-25 17:44:32	2022-03-25 17:44:32	1809	65.\tZUIDGEEST, Vera\t03\tRB Delft\t52.34	App\\Models\\Athlete	478	11	2	\N	5234	3221	12	12	[]	\N
20824	2022-03-25 17:44:32	2022-03-25 17:44:32	1810	66.\tEUBE, Mareike\t03\tDLRG Guetersloh\t54.09	App\\Models\\Athlete	68	11	2	\N	5409	3220	12	12	[]	\N
20825	2022-03-25 17:44:32	2022-03-25 17:44:32	1811	67.\tPERRIENS, Lianne\t06\tRB Echt\t54.22	App\\Models\\Athlete	1022	11	2	\N	5422	15	12	12	[]	\N
20826	2022-03-25 17:44:32	2022-03-25 17:44:32	1812	68.\tVAGLIVIELLO, Denise\t05\tAthena Salvamento\t56.85	App\\Models\\Athlete	1060	11	2	\N	5685	3213	12	12	[]	\N
20827	2022-03-25 17:44:32	2022-03-25 17:44:32	1813	69.\tVRENKEN, Kyra\t04\tRB Echt\t58.55	App\\Models\\Athlete	72	11	2	\N	5855	15	12	12	[]	\N
20828	2022-03-25 17:44:32	2022-03-25 17:44:32	1814	70.\tNAUTA, Emma\t06\tRB Oss\t59.24	App\\Models\\Athlete	1024	11	2	\N	5924	43	12	12	[]	\N
20829	2022-03-25 17:44:32	2022-03-25 17:44:32	1815	71.\tKELLENERS, Jill\t06\tRB Echt\t1:00.02	App\\Models\\Athlete	814	11	2	\N	6002	15	12	12	[]	\N
20830	2022-03-25 17:44:33	2022-03-25 17:44:33	1816	72.\tVAN DER VORST, Lynn\t04\tRB Echt\t1:02.42	App\\Models\\Athlete	415	11	2	\N	6242	15	12	12	[]	\N
20831	2022-03-25 17:44:33	2022-03-25 17:44:33	1817	73.\tROMANCZYK, Lena\t06\tDLRG Duisburg-Homberg \t1:04.10	App\\Models\\Athlete	1067	11	2	\N	6410	39	12	12	[]	\N
20832	2022-03-25 17:44:33	2022-03-25 17:44:33	1818	DSQ\tEUBE, Amelie\t05\tDLRG Guetersloh	App\\Models\\Athlete	815	11	2	1	\N	3220	12	12	[]	\N
20833	2022-03-25 17:44:33	2022-03-25 17:44:33	1820	DNS\tGERAATS, Kim\t04\tRB Heytse	App\\Models\\Athlete	55	11	2	2	\N	3229	12	12	[]	\N
20834	2022-03-25 17:44:33	2022-03-25 17:44:33	1821	WDR\tDALHUISEN, Renske\t03\tNederland NT	App\\Models\\Athlete	30	11	2	0	\N	3218	12	12	[]	\N
20835	2022-03-25 17:44:33	2022-03-25 17:44:33	1827	1.\tGIOVANELLI, Helene\t02\tItaly NT\t34.13	App\\Models\\Athlete	1025	11	2	\N	3413	3201	12	13	[]	\N
20836	2022-03-25 17:44:33	2022-03-25 17:44:33	1828	2.\tLANGE, Kerstin\t91\tDLRG Schwerte\t34.29	App\\Models\\Athlete	1028	11	2	\N	3429	109	12	13	[]	\N
20837	2022-03-25 17:44:33	2022-03-25 17:44:33	1829	3.\tROMANINI, Aurelie\t87\tBelgium NT\t35.22	App\\Models\\Athlete	1026	11	2	\N	3522	3206	12	13	[]	\N
20838	2022-03-25 17:44:33	2022-03-25 17:44:33	1830	4.\tCRISTETTI, Francesca\t97\tItaly NT\t35.28	App\\Models\\Athlete	77	11	2	\N	3528	3201	12	13	[]	\N
20839	2022-03-25 17:44:33	2022-03-25 17:44:33	1831	5.\tSENDEN, Chantal\t93\tNederland NT\t35.97	App\\Models\\Athlete	421	11	2	\N	3597	3218	12	13	[]	\N
20840	2022-03-25 17:44:33	2022-03-25 17:44:33	1833	6.\tTCHORZ, Alicja\t92\tPoland Dolnoslaskie Wopr\t36.17	App\\Models\\Athlete	1149	11	2	\N	3617	3222	12	13	[]	\N
20841	2022-03-25 17:44:33	2022-03-25 17:44:33	1834	7.\tROYER VEIL, Lea\t01\tFrance NT\t36.22	App\\Models\\Athlete	824	11	2	\N	3622	3205	12	13	[]	\N
20842	2022-03-25 17:44:33	2022-03-25 17:44:33	1835	8.\tLOPEZ RUIZ, Elsa\t02\tSpain NT\t36.49	App\\Models\\Athlete	5	11	2	\N	3649	3204	12	13	[]	\N
20843	2022-03-25 17:44:33	2022-03-25 17:44:33	1836	9.\tMARCO, Manon\t01\tFrance NT\t36.89	App\\Models\\Athlete	1027	11	2	\N	3689	3205	12	13	[]	\N
20844	2022-03-25 17:44:33	2022-03-25 17:44:33	1837	10.\tBAKKER, Myrthe\t00\tNederland NT\t37.00	App\\Models\\Athlete	423	11	2	\N	3700	3218	12	13	[]	\N
20845	2022-03-25 17:44:33	2022-03-25 17:44:33	1838	11.\tMASCAROS NUNEZ, Beatriz\t02\tSpain NT\t37.02	App\\Models\\Athlete	1029	11	2	\N	3702	3204	12	13	[]	\N
20846	2022-03-25 17:44:33	2022-03-25 17:44:33	1839	12.\tLANZILLOTTI, Paola\t97\tItaly NT\t37.46	App\\Models\\Athlete	1078	11	2	\N	3746	3201	12	13	[]	\N
20847	2022-03-25 17:44:33	2022-03-25 17:44:33	1840	13.\tBOREL, Carol-Ann\t99\tFrance NT\t37.55	App\\Models\\Athlete	823	11	2	\N	3755	3205	12	13	[]	\N
20848	2022-03-25 17:44:33	2022-03-25 17:44:33	1841	14.\tGEBHARDT, Alica\t97\tDLRG Bad Oldesloe\t37.92	App\\Models\\Athlete	820	11	2	\N	3792	3223	12	13	[]	\N
20849	2022-03-25 17:44:33	2022-03-25 17:44:33	1842	15.\tVANBUEL, Nele\t85\tBelgium NT\t39.11	App\\Models\\Athlete	121	11	2	\N	3911	3206	12	13	[]	\N
20850	2022-03-25 17:44:33	2022-03-25 17:44:33	1843	16.\tRAS, Janneke\t95\tNederland NT\t40.09	App\\Models\\Athlete	489	11	2	\N	4009	3218	12	13	[]	\N
20851	2022-03-25 17:44:33	2022-03-25 17:44:33	1844	17.\tFASZCZEWSKA, Karolina\t99\tCKS Szczecin\t40.10	App\\Models\\Athlete	1031	11	2	\N	4010	3227	12	13	[]	\N
20852	2022-03-25 17:44:33	2022-03-25 17:44:33	1845	18.\tLINDEKENS, Stefanie\t97\tBelgium NT\t40.57	App\\Models\\Athlete	1033	11	2	\N	4057	3206	12	13	[]	\N
20853	2022-03-25 17:44:33	2022-03-25 17:44:33	1846	19.\tBECKERS, Fleur\t02\tRB Echt\t40.97	App\\Models\\Athlete	26	11	2	\N	4097	15	12	13	[]	\N
20854	2022-03-25 17:44:33	2022-03-25 17:44:33	1847	20.\tPEZZA, Sofia\t01\tAccademia Di Salvamento\t41.07	App\\Models\\Athlete	395	11	2	\N	4107	3203	12	13	[]	\N
20855	2022-03-25 17:44:33	2022-03-25 17:44:33	1848	21.\tCARADONNA, Irene\t01\tAthena Bracciano\t41.40	App\\Models\\Athlete	21	11	2	\N	4140	3210	12	13	[]	\N
20856	2022-03-25 17:44:33	2022-03-25 17:44:33	1849	22.\tAMBROSI, Chiara\t02\tASD Gorizia Nuoto\t41.41	App\\Models\\Athlete	821	11	2	\N	4141	3224	12	13	[]	\N
20857	2022-03-25 17:44:33	2022-03-25 17:44:33	1850	23.\tTORTELLO, Carlotta\t02\tA.S.D. Sportiva Sturla\t42.25	App\\Models\\Athlete	1083	11	2	\N	4225	3235	12	13	[]	\N
20858	2022-03-25 17:44:33	2022-03-25 17:44:33	1851	24.\tGEUBELS, Kaat\t96\tRctal\t42.30	App\\Models\\Athlete	499	11	2	\N	4230	3217	12	13	[]	\N
20859	2022-03-25 17:44:33	2022-03-25 17:44:33	1852	POPIEL, Anna\t01\tCKS Szczecin\t42.30	App\\Models\\Athlete	1076	11	2	\N	4230	3227	12	13	[]	\N
20860	2022-03-25 17:44:33	2022-03-25 17:44:33	1853	26.\tGRAU, Jessica\t00\tKusel KiXXX\t43.04	App\\Models\\Athlete	92	11	2	\N	4304	3207	12	13	[]	\N
20861	2022-03-25 17:44:33	2022-03-25 17:44:33	1854	27.\tSIMONI, Giulia\t02\tAccademia Di Salvamento\t43.59	App\\Models\\Athlete	23	11	2	\N	4359	3203	12	13	[]	\N
20862	2022-03-25 17:44:33	2022-03-25 17:44:33	1855	28.\tKLOMP, Danique\t02\tNederland NT\t43.64	App\\Models\\Athlete	19	11	2	\N	4364	3218	12	13	[]	\N
20863	2022-03-25 17:44:33	2022-03-25 17:44:33	1856	29.\tSKUDLIK, Marta\t01\tSlaskie WOPR\t43.97	App\\Models\\Athlete	1075	11	2	\N	4397	3211	12	13	[]	\N
6636	2022-02-19 13:27:45	2022-02-19 13:27:45	149	7.\tTOMINEC, Davide\t95\tGorizia Nuoto Asd\t2:09.39	App\\Models\\Athlete	446	1	1	\N	12939	231	2	8	[]	\N
6637	2022-02-19 13:27:45	2022-02-19 13:27:45	150	8.\tLAM, Chin-chun\t97\tHong Kong Lifesaving team\t2:13.83	App\\Models\\Athlete	672	1	1	\N	13383	252	2	8	[]	\N
6638	2022-02-19 13:27:45	2022-02-19 13:27:45	151	9.\tRAUTENBACH, Kurt\t99\tSouth Africa\t2:14.44	App\\Models\\Athlete	673	1	1	\N	13444	232	2	8	[]	\N
6639	2022-02-19 13:27:45	2022-02-19 13:27:45	152	10.\tWOELBING, Oliver\t99\tDLRG Kelkheim\t2:17.44	App\\Models\\Athlete	674	1	1	\N	13744	253	2	8	[]	\N
6640	2022-02-19 13:27:45	2022-02-19 13:27:45	153	11.\tSIEVAL, Lars\t93\tNL Defensie Lifesaving\t2:17.93	App\\Models\\Athlete	675	1	1	\N	13793	239	2	8	[]	\N
6641	2022-02-19 13:27:45	2022-02-19 13:27:45	154	12.\tKEMPKES, Stephan\t88\tDLRG LV Niedersachsen\t2:18.39	App\\Models\\Athlete	676	1	1	\N	13839	236	2	8	[]	\N
6642	2022-02-19 13:27:45	2022-02-19 13:27:45	155	13.\tSCHWEGMANN, Tom\t94\tDLRG Schwerte\t2:19.29	App\\Models\\Athlete	677	1	1	\N	13929	109	2	8	[]	\N
6643	2022-02-19 13:27:45	2022-02-19 13:27:45	156	14.\tBORN, Paul\t99\tDLRG Nieder-Olm/Woerrstadt\t2:21.47	App\\Models\\Athlete	455	1	1	\N	14147	249	2	8	[]	\N
6644	2022-02-19 13:27:45	2022-02-19 13:27:45	157	15.\tSTERNER, Jan-Ole\t95\tDLRG Goslar\t2:21.97	App\\Models\\Athlete	678	1	1	\N	14197	246	2	8	[]	\N
6645	2022-02-19 13:27:45	2022-02-19 13:27:45	158	16.\tWILLEMS, Luuk\t97\tRB Echt\t2:23.00	App\\Models\\Athlete	142	1	1	\N	14300	15	2	8	[]	\N
6646	2022-02-19 13:27:45	2022-02-19 13:27:45	159	17.\tDEBBELER, Jonas\t96\tDLRG Goslar\t2:24.41	App\\Models\\Athlete	679	1	1	\N	14441	246	2	8	[]	\N
6647	2022-02-19 13:27:45	2022-02-19 13:27:45	160	18.\tKUNK, Daniel\t90\tDLRG LV Niedersachsen\t2:24.87	App\\Models\\Athlete	680	1	1	\N	14487	236	2	8	[]	\N
6648	2022-02-19 13:27:45	2022-02-19 13:27:45	161	19.\tMEERTEN, John\t97\tRB Echt\t2:27.42	App\\Models\\Athlete	154	1	1	\N	14742	15	2	8	[]	\N
6649	2022-02-19 13:27:45	2022-02-19 13:27:45	162	20.\tHILDEBRANDT, Leon\t97\tDLRG Goslar\t2:28.95	App\\Models\\Athlete	681	1	1	\N	14895	246	2	8	[]	\N
6650	2022-02-19 13:27:45	2022-02-19 13:27:45	163	21.\tRUSSCHEN, Sem\t99\tRB Dordrecht\t2:29.68	App\\Models\\Athlete	538	1	1	\N	14968	13	2	8	[]	\N
6651	2022-02-19 13:27:45	2022-02-19 13:27:45	164	22.\tMEERTEN, Luuk\t99\tRB Echt\t2:29.98	App\\Models\\Athlete	540	1	1	\N	14998	15	2	8	[]	\N
6652	2022-02-19 13:27:45	2022-02-19 13:27:45	165	23.\tKOEHNE, Cedric\t97\tDLRG Herzebrock-Clarholz\t2:32.19	App\\Models\\Athlete	682	1	1	\N	15219	250	2	8	[]	\N
6653	2022-02-19 13:27:45	2022-02-19 13:27:45	166	24.\tVAN DER KROGT, Nick\t95\tRB Dordrecht\t2:34.29	App\\Models\\Athlete	683	1	1	\N	15429	13	2	8	[]	\N
6654	2022-02-19 13:27:45	2022-02-19 13:27:45	167	25.\tDE REUVER, Tim\t99\tRB Oss\t2:37.67	App\\Models\\Athlete	150	1	1	\N	15767	43	2	8	[]	\N
6655	2022-02-19 13:27:45	2022-02-19 13:27:45	168	26.\tKUHLMANN, Justus\t98\tDLRG Haltern\t2:55.94	App\\Models\\Athlete	684	1	1	\N	17594	241	2	8	[]	\N
6656	2022-02-19 13:27:45	2022-02-19 13:27:45	169	27.\tTUINSTRA, Wouter\t95\tRB Staphorst\t2:56.54	App\\Models\\Athlete	685	1	1	\N	17654	26	2	8	[]	\N
6657	2022-02-19 13:27:45	2022-02-19 13:27:45	170	28.\tBOERMANN, Niklas\t97\tDLRG Haltern\t2:57.21	App\\Models\\Athlete	686	1	1	\N	17721	241	2	8	[]	\N
6658	2022-02-19 13:27:45	2022-02-19 13:27:45	171	29.\tHAUPTVOGEL, Daniel\t99\tDLRG Haltern\t3:01.54	App\\Models\\Athlete	687	1	1	\N	18154	241	2	8	[]	\N
6659	2022-02-19 13:27:45	2022-02-19 13:27:45	173	1.\tGERRIT OEVER, van 't\t87\tNL Defensie Lifesaving\t2:11.10	App\\Models\\Athlete	688	1	1	\N	13110	239	2	9	[]	\N
6660	2022-02-19 13:27:45	2022-02-19 13:27:45	174	2.\tVOSKAMP, Ingemar\t87\tNL Defensie Lifesaving\t2:16.54	App\\Models\\Athlete	165	1	1	\N	13654	239	2	9	[]	\N
6661	2022-02-19 13:27:45	2022-02-19 13:27:45	175	3.\tDE GREEF, Rik\t84\tNL Defensie Lifesaving\t2:23.99	App\\Models\\Athlete	689	1	1	\N	14399	239	2	9	[]	\N
6662	2022-02-19 13:27:45	2022-02-19 13:27:45	176	4.\tDE KNOOP, Bastiaan\t86\tRB Gouda\t2:24.00	App\\Models\\Athlete	166	1	1	\N	14400	17	2	9	[]	\N
6663	2022-02-19 13:27:45	2022-02-19 13:27:45	177	5.\tWOLTERS, Rene\t87\tDLRG OG Stadtlohn e.V.\t2:25.41	App\\Models\\Athlete	690	1	1	\N	14541	245	2	9	[]	\N
6664	2022-02-19 13:27:45	2022-02-19 13:27:45	179	1.\tROEMEN, Sven\t70\tRB Echt\t2:31.02	App\\Models\\Athlete	173	1	1	\N	15102	15	2	11	[]	\N
6665	2022-02-19 13:27:45	2022-02-19 13:27:45	180	2.\tVAN GRIEKEN, Wim\t69\tRB Gouda\t2:41.69	App\\Models\\Athlete	176	1	1	\N	16169	17	2	11	[]	\N
6666	2022-02-19 13:27:45	2022-02-19 13:27:45	181	3.\tVAN DE GOOR, Guus\t77\tRB Echt\t2:45.27	App\\Models\\Athlete	174	1	1	\N	16527	15	2	11	[]	\N
6667	2022-02-19 13:27:45	2022-02-19 13:27:45	182	4.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t3:15.10	App\\Models\\Athlete	179	1	1	\N	19510	13	2	11	[]	\N
6668	2022-02-19 13:27:45	2022-02-19 13:27:45	183	5.\tDEN BOEF, Alex\t71\tRB Dordrecht\t4:00.99	App\\Models\\Athlete	553	1	1	\N	24099	13	2	11	[]	\N
6669	2022-02-19 13:27:45	2022-02-19 13:27:45	185	1.\tBAUER, Josef\t67\tDLRG OG Stadtlohn e.V.\t2:29.37	App\\Models\\Athlete	691	1	1	\N	14937	245	2	10	[]	\N
6670	2022-02-19 13:27:45	2022-02-19 13:27:45	186	2.\tWALFORT, Frank\t68\tDLRG OG Stadtlohn e.V.\t2:40.59	App\\Models\\Athlete	692	1	1	\N	16059	245	2	10	[]	\N
6671	2022-02-19 13:27:45	2022-02-19 13:27:45	187	3.\tVAN DAALEN, Erik\t65\tRB Dordrecht\t2:49.15	App\\Models\\Athlete	175	1	1	\N	16915	13	2	10	[]	\N
6672	2022-02-19 13:27:45	2022-02-19 13:27:45	188	4.\tHAKE, Wolfgang\t64\tDLRG OG Stadtlohn e.V.\t2:57.50	App\\Models\\Athlete	608	1	1	\N	17750	245	2	10	[]	\N
6673	2022-02-19 13:27:45	2022-02-19 13:27:45	189	5.\tTE HENNEPE, Hans\t68\tRB Gouda\t3:08.81	App\\Models\\Athlete	177	1	1	\N	18881	17	2	10	[]	\N
6674	2022-02-19 13:27:45	2022-02-19 13:27:45	190	6.\tPRAET, Piet\t56\tRB Dordrecht\t3:17.37	App\\Models\\Athlete	693	1	1	\N	19737	13	2	10	[]	\N
7579	2022-02-19 13:27:51	2022-02-19 13:27:51	1639	27.\tSTERNER, Jan-Ole\t95\tDLRG Goslar\t2:45.12	App\\Models\\Athlete	678	1	6	\N	16512	246	2	8	[]	\N
20864	2022-03-25 17:44:33	2022-03-25 17:44:33	1857	30.\tBERTUOLA, Chiara\t99\tAthena Bracciano\t45.44	App\\Models\\Athlete	93	11	2	\N	4544	3210	12	13	[]	\N
20865	2022-03-25 17:44:33	2022-03-25 17:44:33	1858	31.\tBRINK, Celine\t00\tRB Dordrecht\t45.69	App\\Models\\Athlete	94	11	2	\N	4569	13	12	13	[]	\N
20866	2022-03-25 17:44:33	2022-03-25 17:44:33	1859	32.\tMODDER, Louisa\t02\tDLRG Niedersachsen\t46.22	App\\Models\\Athlete	33	11	2	\N	4622	3212	12	13	[]	\N
20867	2022-03-25 17:44:33	2022-03-25 17:44:33	1860	33.\tVAN HAAREN, Renate\t92\tRB Oss\t46.89	App\\Models\\Athlete	508	11	2	\N	4689	43	12	13	[]	\N
20868	2022-03-25 17:44:33	2022-03-25 17:44:33	1861	34.\tWOLFS, Sharon\t00\tRB Echt\t47.12	App\\Models\\Athlete	430	11	2	\N	4712	15	12	13	[]	\N
20869	2022-03-25 17:44:33	2022-03-25 17:44:33	1862	35.\tMIDEI, Alice\t01\tAccademia Di Salvamento\t47.75	App\\Models\\Athlete	1079	11	2	\N	4775	3203	12	13	[]	\N
20870	2022-03-25 17:44:34	2022-03-25 17:44:34	1863	36.\tROESSIGER, Laura\t00\tDLRG Luckenwalde\t48.01	App\\Models\\Athlete	826	11	2	\N	4801	3225	12	13	[]	\N
20871	2022-03-25 17:44:34	2022-03-25 17:44:34	1864	37.\tPISTERS, Nathalie\t01\tRB Echt\t48.45	App\\Models\\Athlete	35	11	2	\N	4845	15	12	13	[]	\N
20872	2022-03-25 17:44:34	2022-03-25 17:44:34	1865	38.\tMICHESI, Silvia\t00\tAthena Bracciano\t48.92	App\\Models\\Athlete	1081	11	2	\N	4892	3210	12	13	[]	\N
20873	2022-03-25 17:44:34	2022-03-25 17:44:34	1866	39.\tVAN HILLO, Michelle\t00\tRB Boxtel\t49.32	App\\Models\\Athlete	1122	11	2	\N	4932	122	12	13	[]	\N
20874	2022-03-25 17:44:34	2022-03-25 17:44:34	1867	40.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t49.97	App\\Models\\Athlete	403	11	2	\N	4997	13	12	13	[]	\N
20875	2022-03-25 17:44:34	2022-03-25 17:44:34	1868	41.\tJETTEN, Maike\t02\tRB Echt\t52.12	App\\Models\\Athlete	400	11	2	\N	5212	15	12	13	[]	\N
20876	2022-03-25 17:44:34	2022-03-25 17:44:34	1869	42.\tPICCARDI, Sara\t02\tAthena Bracciano\t53.28	App\\Models\\Athlete	1080	11	2	\N	5328	3210	12	13	[]	\N
20877	2022-03-25 17:44:34	2022-03-25 17:44:34	1870	43.\tOLIVIERI, Vittoria\t00\tAthena Bracciano\t57.64	App\\Models\\Athlete	1150	11	2	\N	5764	3210	12	13	[]	\N
20878	2022-03-25 17:44:34	2022-03-25 17:44:34	1871	DNS\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	11	2	2	\N	43	12	13	[]	\N
20879	2022-03-25 17:44:34	2022-03-25 17:44:34	1872	DNS\tMODDER, Alena\t02\tDLRG Niedersachsen	App\\Models\\Athlete	41	11	2	2	\N	3212	12	13	[]	\N
20880	2022-03-25 17:44:34	2022-03-25 17:44:34	1873	DNS\tFIEDKIEWICZ, Kornelia\t01\tPoland Dolnoslaskie Wopr	App\\Models\\Athlete	1032	11	2	2	\N	3222	12	13	[]	\N
20881	2022-03-25 17:44:34	2022-03-25 17:44:34	1874	WDR\tREPETTO, Martina\t98\tA.S.D. Sportiva Sturla	App\\Models\\Athlete	828	11	2	0	\N	3235	12	13	[]	\N
20882	2022-03-25 17:44:34	2022-03-25 17:44:34	1875	WDR\tHARZE, Marine\t97\tBelgium NT	App\\Models\\Athlete	420	11	2	0	\N	3206	12	13	[]	\N
20883	2022-03-25 17:44:34	2022-03-25 17:44:34	1877	1.\tLEANZA, Cristina\t88\tItaly NT\t36.72	App\\Models\\Athlete	758	11	2	\N	3672	3201	12	14	[]	\N
20884	2022-03-25 17:44:34	2022-03-25 17:44:34	1878	2.\tKITTEL, Christine\t85\tDLRG Niedersachsen\t39.74	App\\Models\\Athlete	438	11	2	\N	3974	3212	12	14	[]	\N
20885	2022-03-25 17:44:34	2022-03-25 17:44:34	1884	1.\tROEMEN, Claudine\t74\tRB Echt\t45.42	App\\Models\\Athlete	125	11	2	\N	4542	15	12	15	[]	\N
20886	2022-03-25 17:44:34	2022-03-25 17:44:34	1886	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t54.86	App\\Models\\Athlete	440	11	2	\N	5486	13	12	16	[]	\N
20887	2022-03-25 17:44:34	2022-03-25 17:44:34	1887	2.\tVAN DE KOOIJ, Astrid\t64\tRB Dordrecht\t1:02.43	App\\Models\\Athlete	1085	11	2	\N	6243	13	12	16	[]	\N
20888	2022-03-25 17:44:34	2022-03-25 17:44:34	1888	3.\tCELIE, Wilna\t58\tRB Dordrecht\t1:09.72	App\\Models\\Athlete	734	11	2	\N	6972	13	12	16	[]	\N
20889	2022-03-25 17:44:34	2022-03-25 17:44:34	1889	4.\tLAPU-OS, Lelanie\t67\tRB Dordrecht\t1:29.53	App\\Models\\Athlete	521	11	2	\N	8953	13	12	16	[]	\N
20890	2022-03-25 17:44:34	2022-03-25 17:44:34	1895	1.\tD'IPPOLITO, Mattia\t03\tItaly NT\t30.37	App\\Models\\Athlete	1034	11	2	\N	3037	3201	12	12	[]	\N
20891	2022-03-25 17:44:34	2022-03-25 17:44:34	1896	2.\tLOCCHI, Simone\t04\tItaly NT\t30.42	App\\Models\\Athlete	1035	11	2	\N	3042	3201	12	12	[]	\N
20892	2022-03-25 17:44:34	2022-03-25 17:44:34	1897	3.\tCOCIANNI, Andrea\t03\tASD Gorizia Nuoto\t30.76	App\\Models\\Athlete	832	11	2	\N	3076	3224	12	12	[]	\N
20893	2022-03-25 17:44:34	2022-03-25 17:44:34	1898	4.\tCORONADO TEJEDA, Carlos\t03\tSpain NT\t31.11	App\\Models\\Athlete	829	11	2	\N	3111	3204	12	12	[]	\N
20894	2022-03-25 17:44:34	2022-03-25 17:44:34	1899	5.\tGRABSKI, Mateusz\t03\tPolen NT\t31.19	App\\Models\\Athlete	1036	11	2	\N	3119	3234	12	12	[]	\N
20895	2022-03-25 17:44:34	2022-03-25 17:44:34	1900	6.\tMANCARDO, LORENZO\t03\tSAFA 2000\t31.87	App\\Models\\Athlete	830	11	2	\N	3187	3202	12	12	[]	\N
20896	2022-03-25 17:44:34	2022-03-25 17:44:34	1901	7.\tROGOZINSKI, Radoslaw\t03\tPolen NT\t32.17	App\\Models\\Athlete	1088	11	2	\N	3217	3234	12	12	[]	\N
20897	2022-03-25 17:44:34	2022-03-25 17:44:34	1902	8.\tCUSSELLE, Ben\t03\tBeacon Lifesaving Club\t32.51	App\\Models\\Athlete	1037	11	2	\N	3251	3240	12	12	[]	\N
20898	2022-03-25 17:44:34	2022-03-25 17:44:34	1903	9.\tROMERO FERNANDEZ, Ivan\t03\tSpain NT\t33.43	App\\Models\\Athlete	1091	11	2	\N	3343	3204	12	12	[]	\N
20899	2022-03-25 17:44:34	2022-03-25 17:44:34	1904	10.\tLEVEQUE, Simon\t05\tFrance NT\t33.44	App\\Models\\Athlete	1038	11	2	\N	3344	3205	12	12	[]	\N
20900	2022-03-25 17:44:34	2022-03-25 17:44:34	1905	11.\tCWIKLINSKI, Jan\t04\tCKS Szczecin\t33.85	App\\Models\\Athlete	1090	11	2	\N	3385	3227	12	12	[]	\N
20901	2022-03-25 17:44:34	2022-03-25 17:44:34	1906	12.\tBROWNING, Ben\t03\tBeacon Lifesaving Club\t33.94	App\\Models\\Athlete	1151	11	2	\N	3394	3240	12	12	[]	\N
20902	2022-03-25 17:44:34	2022-03-25 17:44:34	1907	13.\tVAN HOFTEN, Seth\t04\tRB Echt\t34.30	App\\Models\\Athlete	1039	11	2	\N	3430	15	12	12	[]	\N
6675	2022-02-19 13:27:45	2022-02-19 13:27:45	197	1.\tNederland Senioren\tRB Dordrecht\t1:52.92	App\\Models\\RelayTeam	113	1	25	\N	11292	13	2	\N	[]	\N
20903	2022-03-25 17:44:34	2022-03-25 17:44:34	1908	14.\tBELLOLI, Matteo\t05\tIn Sport Rane Rosse\t34.33	App\\Models\\Athlete	836	11	2	\N	3433	3208	12	12	[]	\N
20904	2022-03-25 17:44:34	2022-03-25 17:44:34	1909	15.\tDI SIMONE, Franco\t03\tSDS - Specialisti dello Sport \t34.40	App\\Models\\Athlete	834	11	2	\N	3440	3228	12	12	[]	\N
20905	2022-03-25 17:44:34	2022-03-25 17:44:34	1910	16.\tCHIAVACCI, Roberto\t04\tAccademia Di Salvamento\t34.56	App\\Models\\Athlete	1089	11	2	\N	3456	3203	12	12	[]	\N
20906	2022-03-25 17:44:34	2022-03-25 17:44:34	1911	17.\tFERRARO, Francesco\t06\tIn Sport Rane Rosse\t34.61	App\\Models\\Athlete	1152	11	2	\N	3461	3208	12	12	[]	\N
20907	2022-03-25 17:44:34	2022-03-25 17:44:34	1912	18.\tNAZARUK, Piotr\t03\tCKS Szczecin\t34.82	App\\Models\\Athlete	1093	11	2	\N	3482	3227	12	12	[]	\N
20908	2022-03-25 17:44:34	2022-03-25 17:44:34	1913	19.\tWROBLEWSKI, Kacper\t05\tCKS Szczecin\t34.95	App\\Models\\Athlete	1153	11	2	\N	3495	3227	12	12	[]	\N
20909	2022-03-25 17:44:34	2022-03-25 17:44:34	1914	20.\tKUIPHOF, Robin\t03\tRB Dordrecht\t34.96	App\\Models\\Athlete	737	11	2	\N	3496	13	12	12	[]	\N
20910	2022-03-25 17:44:34	2022-03-25 17:44:34	1915	21.\tWELZEL, Patrick\t06\tDLRG Nordrhein-Westfalen\t35.03	App\\Models\\Athlete	1154	11	2	\N	3503	3219	12	12	[]	\N
20911	2022-03-25 17:44:34	2022-03-25 17:44:34	1916	22.\tABBEEL, Stef\t05\tVZW Vrije Zwemmers Wenduine-De Haan\t35.14	App\\Models\\Athlete	1099	11	2	\N	3514	3244	12	12	[]	\N
20912	2022-03-25 17:44:35	2022-03-25 17:44:35	1917	23.\tQUIDACCIOLU, Tito\t03\tA.S.D. Sportiva Sturla\t35.67	App\\Models\\Athlete	1102	11	2	\N	3567	3235	12	12	[]	\N
20913	2022-03-25 17:44:35	2022-03-25 17:44:35	1918	24.\tALDRIGO, Riccardo\t05\tASD Gorizia Nuoto\t35.70	App\\Models\\Athlete	835	11	2	\N	3570	3224	12	12	[]	\N
20914	2022-03-25 17:44:35	2022-03-25 17:44:35	1919	25.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t35.93	App\\Models\\Athlete	656	11	2	\N	3593	17	12	12	[]	\N
20915	2022-03-25 17:44:35	2022-03-25 17:44:35	1920	KURZAK, Kamil\t04\tSlaskie WOPR\t35.93	App\\Models\\Athlete	1155	11	2	\N	3593	3211	12	12	[]	\N
20916	2022-03-25 17:44:35	2022-03-25 17:44:35	1921	27.\tBIERNACIK, Szymon\t04\tMKS Szczecin\t36.10	App\\Models\\Athlete	1106	11	2	\N	3610	3236	12	12	[]	\N
20917	2022-03-25 17:44:35	2022-03-25 17:44:35	1922	28.\tPREUSS, Ben\t05\tDLRG Niedersachsen\t36.19	App\\Models\\Athlete	1108	11	2	\N	3619	3212	12	12	[]	\N
20918	2022-03-25 17:44:35	2022-03-25 17:44:35	1923	29.\tNEICA, Riccardo\t05\tIn Sport Rane Rosse\t36.37	App\\Models\\Athlete	1096	11	2	\N	3637	3208	12	12	[]	\N
20919	2022-03-25 17:44:35	2022-03-25 17:44:35	1924	30.\tPUGGIONI, Antonio\t04\tAccademia Di Salvamento\t36.51	App\\Models\\Athlete	1094	11	2	\N	3651	3203	12	12	[]	\N
20920	2022-03-25 17:44:35	2022-03-25 17:44:35	1925	31.\tRENNEBAUM, Max\t03\tDLRG Guetersloh\t36.65	App\\Models\\Athlete	1135	11	2	\N	3665	3220	12	12	[]	\N
20921	2022-03-25 17:44:35	2022-03-25 17:44:35	1926	32.\tACHILLI, Emanuele\t06\tIn Sport Rane Rosse\t36.83	App\\Models\\Athlete	837	11	2	\N	3683	3208	12	12	[]	\N
20922	2022-03-25 17:44:35	2022-03-25 17:44:35	1927	33.\tFORMANN, Brivael\t04\tLiege Sauvetage Club\t36.93	App\\Models\\Athlete	1092	11	2	\N	3693	3238	12	12	[]	\N
20923	2022-03-25 17:44:35	2022-03-25 17:44:35	1928	34.\tCARADONNA, Gabriele\t03\tAthena Salvamento\t37.07	App\\Models\\Athlete	1156	11	2	\N	3707	3213	12	12	[]	\N
20924	2022-03-25 17:44:35	2022-03-25 17:44:35	1929	35.\tCIRILLI, Gabriele\t05\tIn Sport Rane Rosse\t37.08	App\\Models\\Athlete	1157	11	2	\N	3708	3208	12	12	[]	\N
20925	2022-03-25 17:44:35	2022-03-25 17:44:35	1930	36.\tAIELLO, Axel\t05\tFrance NT\t37.09	App\\Models\\Athlete	1104	11	2	\N	3709	3205	12	12	[]	\N
20926	2022-03-25 17:44:35	2022-03-25 17:44:35	1931	37.\tNAUMANN, Jan\t03\tDLRG Niedersachsen\t37.10	App\\Models\\Athlete	1128	11	2	\N	3710	3212	12	12	[]	\N
20927	2022-03-25 17:44:35	2022-03-25 17:44:35	1932	38.\tWROBEL, Igor\t03\tSlaskie WOPR\t37.12	App\\Models\\Athlete	1125	11	2	\N	3712	3211	12	12	[]	\N
20928	2022-03-25 17:44:35	2022-03-25 17:44:35	1933	39.\tBERGERON, Tom\t06\tFrance NT\t37.16	App\\Models\\Athlete	1158	11	2	\N	3716	3205	12	12	[]	\N
20929	2022-03-25 17:44:35	2022-03-25 17:44:35	1998	10.\tBELTRAN CABEDO, Pau\t93\tSpain NT\t31.31	App\\Models\\Athlete	1159	11	2	\N	3131	3204	12	13	[]	\N
20930	2022-03-25 17:44:35	2022-03-25 17:44:35	1999	11.\tWENGER, Lars-Erik\t97\tDLRG Luckenwalde\t31.33	App\\Models\\Athlete	1160	11	2	\N	3133	3225	12	13	[]	\N
20931	2022-03-25 17:44:35	2022-03-25 17:44:35	2000	12.\tBESSON GAZON, Tom\t00\tFrance NT\t31.63	App\\Models\\Athlete	1161	11	2	\N	3163	3205	12	13	[]	\N
20932	2022-03-25 17:44:35	2022-03-25 17:44:35	2001	13.\tMANCARDO, ENRICO\t01\tSAFA 2000\t31.89	App\\Models\\Athlete	1040	11	2	\N	3189	3202	12	13	[]	\N
20933	2022-03-25 17:44:35	2022-03-25 17:44:35	2002	14.\tMUENDELEIN, Nils\t01\tDLRG Nordrhein-Westfalen\t31.93	App\\Models\\Athlete	844	11	2	\N	3193	3219	12	13	[]	\N
20934	2022-03-25 17:44:35	2022-03-25 17:44:35	2003	15.\tSICURO, Frederick\t01\tASD Gorizia Nuoto\t32.00	App\\Models\\Athlete	1162	11	2	\N	3200	3224	12	13	[]	\N
20935	2022-03-25 17:44:35	2022-03-25 17:44:35	2004	16.\tDE VINCENTIIS, Alessandro\t02\tASD Rosetana Nuoto\t32.05	App\\Models\\Athlete	1044	11	2	\N	3205	3215	12	13	[]	\N
20936	2022-03-25 17:44:35	2022-03-25 17:44:35	2005	17.\tMODROV, Drew\t91\tRiis Park\t32.22	App\\Models\\Athlete	1163	11	2	\N	3222	3245	12	13	[]	\N
20937	2022-03-25 17:44:35	2022-03-25 17:44:35	2006	18.\tGIACONIA, Gabriele\t96\tA.S.D. Sportiva Sturla\t32.55	App\\Models\\Athlete	1041	11	2	\N	3255	3235	12	13	[]	\N
20938	2022-03-25 17:44:35	2022-03-25 17:44:35	2007	19.\tWULF, Arne\t02\tDLRG Luckenwalde\t32.95	App\\Models\\Athlete	1164	11	2	\N	3295	3225	12	13	[]	\N
20939	2022-03-25 17:44:35	2022-03-25 17:44:35	2008	20.\tVANDERSTEEN, Jelle\t02\tBelgium NT\t33.33	App\\Models\\Athlete	1043	11	2	\N	3333	3206	12	13	[]	\N
20940	2022-03-25 17:44:35	2022-03-25 17:44:35	2009	21.\tCUGLIARI, Matteo\t95\tAthena Bracciano\t33.41	App\\Models\\Athlete	847	11	2	\N	3341	3210	12	13	[]	\N
20941	2022-03-25 17:44:35	2022-03-25 17:44:35	2010	22.\tMAZZA, Emilio\t97\tA.S.D. Sportiva Sturla\t33.44	App\\Models\\Athlete	1165	11	2	\N	3344	3235	12	13	[]	\N
20942	2022-03-25 17:44:35	2022-03-25 17:44:35	2011	23.\tWHEELER, Ryan\t95\tBeacon Lifesaving Club\t33.55	App\\Models\\Athlete	854	11	2	\N	3355	3240	12	13	[]	\N
20943	2022-03-25 17:44:35	2022-03-25 17:44:35	2012	24.\tROQUES, Martin\t02\tFrance NT\t33.75	App\\Models\\Athlete	1166	11	2	\N	3375	3205	12	13	[]	\N
20944	2022-03-25 17:44:35	2022-03-25 17:44:35	2013	25.\tDI SILVESTRE, Daniele\t02\tASD Rosetana Nuoto\t33.93	App\\Models\\Athlete	1045	11	2	\N	3393	3215	12	13	[]	\N
20945	2022-03-25 17:44:35	2022-03-25 17:44:35	2014	26.\tULRICH, Maximilian\t97\tDLRG Luckenwalde\t33.97	App\\Models\\Athlete	1167	11	2	\N	3397	3225	12	13	[]	\N
20946	2022-03-25 17:44:35	2022-03-25 17:44:35	2015	27.\tMEERTEN, Jack\t97\tRB Echt\t34.03	App\\Models\\Athlete	135	11	2	\N	3403	15	12	13	[]	\N
20947	2022-03-25 17:44:35	2022-03-25 17:44:35	2016	28.\tHOBUS, Iwan\t01\tRB Heytse\t34.34	App\\Models\\Athlete	760	11	2	\N	3434	3229	12	13	[]	\N
20948	2022-03-25 17:44:35	2022-03-25 17:44:35	2017	29.\tBONGERS, Rick\t00\tRB Heytse\t34.81	App\\Models\\Athlete	138	11	2	\N	3481	3229	12	13	[]	\N
20949	2022-03-25 17:44:36	2022-03-25 17:44:36	2018	30.\tBALSEN VERSTEEG, Tom\t00\tRB Dordrecht\t34.86	App\\Models\\Athlete	841	11	2	\N	3486	13	12	13	[]	\N
20950	2022-03-25 17:44:36	2022-03-25 17:44:36	2019	31.\tFELICIANGELI, Flavio\t00\tAccademia Di Salvamento\t35.09	App\\Models\\Athlete	451	11	2	\N	3509	3203	12	13	[]	\N
20951	2022-03-25 17:44:36	2022-03-25 17:44:36	2020	32.\tPENNESI, Matteo\t95\tAthena Salvamento\t35.19	App\\Models\\Athlete	1168	11	2	\N	3519	3213	12	13	[]	\N
20952	2022-03-25 17:44:36	2022-03-25 17:44:36	2021	33.\tFEYS, Sammy\t00\tBelgium NT\t35.23	App\\Models\\Athlete	842	11	2	\N	3523	3206	12	13	[]	\N
20953	2022-03-25 17:44:36	2022-03-25 17:44:36	2022	34.\tRICCI, Mauro\t02\tAthena Bracciano\t35.29	App\\Models\\Athlete	1169	11	2	\N	3529	3210	12	13	[]	\N
20954	2022-03-25 17:44:36	2022-03-25 17:44:36	2023	35.\tIACONI, Nicolo\t02\tASD Rosetana Nuoto\t35.49	App\\Models\\Athlete	1114	11	2	\N	3549	3215	12	13	[]	\N
20955	2022-03-25 17:44:36	2022-03-25 17:44:36	2024	36.\tSCHLEICH, Sandro\t01\tSLRG Innerschwyz\t35.77	App\\Models\\Athlete	843	11	2	\N	3577	243	12	13	[]	\N
20956	2022-03-25 17:44:36	2022-03-25 17:44:36	2025	37.\tHERRMANN, Thomas\t99\tDLRG Luckenwalde\t35.98	App\\Models\\Athlete	846	11	2	\N	3598	3225	12	13	[]	\N
20957	2022-03-25 17:44:36	2022-03-25 17:44:36	2026	38.\tADAMO, Manuel\t00\tASD Gorizia Nuoto\t36.63	App\\Models\\Athlete	1170	11	2	\N	3663	3224	12	13	[]	\N
20958	2022-03-25 17:44:36	2022-03-25 17:44:36	2027	39.\tMEERTEN, Luuk\t99\tRB Echt\t36.95	App\\Models\\Athlete	540	11	2	\N	3695	15	12	13	[]	\N
20959	2022-03-25 17:44:36	2022-03-25 17:44:36	2028	40.\tWILMOTS, Robbe\t00\tRctal\t37.16	App\\Models\\Athlete	1046	11	2	\N	3716	3217	12	13	[]	\N
20960	2022-03-25 17:44:36	2022-03-25 17:44:36	2029	41.\tROEOESLI, Elias\t01\tSLRG Innerschwyz\t37.23	App\\Models\\Athlete	1171	11	2	\N	3723	243	12	13	[]	\N
20961	2022-03-25 17:44:36	2022-03-25 17:44:36	2030	42.\tDE REUVER, Tim\t99\tRB Oss\t37.34	App\\Models\\Athlete	150	11	2	\N	3734	43	12	13	[]	\N
20962	2022-03-25 17:44:36	2022-03-25 17:44:36	2031	43.\tBRINK, Guido\t02\tRB Vlissingen\t37.41	App\\Models\\Athlete	848	11	2	\N	3741	248	12	13	[]	\N
20963	2022-03-25 17:44:36	2022-03-25 17:44:36	2032	44.\tSCHMIEMANN, Gerd\t02\tDLRG Niedersachsen\t37.66	App\\Models\\Athlete	849	11	2	\N	3766	3212	12	13	[]	\N
20964	2022-03-25 17:44:36	2022-03-25 17:44:36	2033	45.\tVAN DEN AKKER, Bas\t02\tRB Echt\t37.69	App\\Models\\Athlete	652	11	2	\N	3769	15	12	13	[]	\N
20965	2022-03-25 17:44:36	2022-03-25 17:44:36	2034	46.\tTAUBE, Patrick\t02\tDLRG Niedersachsen\t37.86	App\\Models\\Athlete	1049	11	2	\N	3786	3212	12	13	[]	\N
20966	2022-03-25 17:44:36	2022-03-25 17:44:36	2035	47.\tSPLIETHOFF, Jonas\t01\tDLRG Alpen\t38.09	App\\Models\\Athlete	1047	11	2	\N	3809	261	12	13	[]	\N
20967	2022-03-25 17:44:36	2022-03-25 17:44:36	2036	48.\tTERPORTEN, Phillip\t02\tDLRG Alpen\t38.33	App\\Models\\Athlete	1048	11	2	\N	3833	261	12	13	[]	\N
20968	2022-03-25 17:44:36	2022-03-25 17:44:36	2037	49.\tCOSTANZA, Tiziano\t01\tAthena Salvamento\t38.45	App\\Models\\Athlete	1172	11	2	\N	3845	3213	12	13	[]	\N
20969	2022-03-25 17:44:36	2022-03-25 17:44:36	2038	50.\tMEERTEN, John\t97\tRB Echt\t38.55	App\\Models\\Athlete	154	11	2	\N	3855	15	12	13	[]	\N
20970	2022-03-25 17:44:36	2022-03-25 17:44:36	2039	51.\tVERHOEF, Jop\t02\tRB Dordrecht\t38.71	App\\Models\\Athlete	740	11	2	\N	3871	13	12	13	[]	\N
20971	2022-03-25 17:44:36	2022-03-25 17:44:36	2040	52.\tHOBBEL, Kevin\t97\tRB Echt\t38.78	App\\Models\\Athlete	149	11	2	\N	3878	15	12	13	[]	\N
20972	2022-03-25 17:44:36	2022-03-25 17:44:36	2041	53.\tVAN DEN AKKER, Tom\t02\tRB Echt\t38.83	App\\Models\\Athlete	651	11	2	\N	3883	15	12	13	[]	\N
20973	2022-03-25 17:44:36	2022-03-25 17:44:36	2042	54.\tFRONTERA, Emiliano\t02\tAccademia Di Salvamento\t38.85	App\\Models\\Athlete	1051	11	2	\N	3885	3203	12	13	[]	\N
20974	2022-03-25 17:44:36	2022-03-25 17:44:36	2043	55.\tCRESCIMBENI, Andrea\t01\tAthena Salvamento\t39.02	App\\Models\\Athlete	1173	11	2	\N	3902	3213	12	13	[]	\N
20975	2022-03-25 17:44:36	2022-03-25 17:44:36	2044	56.\tRUSSCHEN, Tom\t02\tRB Dordrecht\t39.43	App\\Models\\Athlete	666	11	2	\N	3943	13	12	13	[]	\N
20976	2022-03-25 17:44:36	2022-03-25 17:44:36	2045	57.\tDE REUVER, Bas\t01\tRB Oss\t39.45	App\\Models\\Athlete	780	11	2	\N	3945	43	12	13	[]	\N
20977	2022-03-25 17:44:36	2022-03-25 17:44:36	2046	58.\tVAN DAM, Reinier\t95\tRB Gouda\t40.26	App\\Models\\Athlete	576	11	2	\N	4026	17	12	13	[]	\N
20978	2022-03-25 17:44:36	2022-03-25 17:44:36	2047	59.\tPASTOORS, Tim\t01\tDLRG Alpen\t40.64	App\\Models\\Athlete	1050	11	2	\N	4064	261	12	13	[]	\N
20979	2022-03-25 17:44:36	2022-03-25 17:44:36	2048	60.\tDEENEN, Jesse\t97\tRB Boxtel\t41.58	App\\Models\\Athlete	600	11	2	\N	4158	122	12	13	[]	\N
20980	2022-03-25 17:44:36	2022-03-25 17:44:36	2049	61.\tMARUOTTI, Luigi\t97\tAthena Bracciano\t42.31	App\\Models\\Athlete	851	11	2	\N	4231	3210	12	13	[]	\N
6676	2022-02-19 13:27:45	2022-02-19 13:27:45	199	2.\tItaly 1\tItaly\t1:54.51	App\\Models\\RelayTeam	114	1	25	\N	11451	1	2	\N	[]	\N
20981	2022-03-25 17:44:36	2022-03-25 17:44:36	2050	62.\tKREUTZ, Timm\t96\tKusel KiXXX\t42.69	App\\Models\\Athlete	163	11	2	\N	4269	3207	12	13	[]	\N
20982	2022-03-25 17:44:36	2022-03-25 17:44:36	2051	63.\tVERSPAGEN, Harry\t01\tRB Weert\t44.06	App\\Models\\Athlete	852	11	2	\N	4406	12	12	13	[]	\N
20983	2022-03-25 17:44:36	2022-03-25 17:44:36	2052	DNS\tVAN DE BAAN, Koen\t00\tRB Delft	App\\Models\\Athlete	1144	11	2	2	\N	3221	12	13	[]	\N
20984	2022-03-25 17:44:36	2022-03-25 17:44:36	2053	DNS\tBANGMA, Jur\t01\tRB Delft	App\\Models\\Athlete	1145	11	2	2	\N	3221	12	13	[]	\N
20985	2022-03-25 17:44:36	2022-03-25 17:44:36	2059	DNS\tENKING, Moritz\t96\tDLRG Buchholz United	App\\Models\\Athlete	855	11	2	2	\N	3230	12	13	[]	\N
20986	2022-03-25 17:44:36	2022-03-25 17:44:36	2060	WDR\tCAPORALE, Erik\t01\tASD Gorizia Nuoto	App\\Models\\Athlete	1174	11	2	0	\N	3224	12	13	[]	\N
20987	2022-03-25 17:44:36	2022-03-25 17:44:36	2061	WDR\tIN 'T VELD, Marijn\t00\tRB Dordrecht	App\\Models\\Athlete	599	11	2	0	\N	13	12	13	[]	\N
20988	2022-03-25 17:44:36	2022-03-25 17:44:36	2062	WDR\tVOS, Bram\t94\tRB Boxtel	App\\Models\\Athlete	1175	11	2	0	\N	122	12	13	[]	\N
20989	2022-03-25 17:44:36	2022-03-25 17:44:36	2064	1.\tKEMPKES, Stephan\t88\tDLRG Buchholz United\t35.78	App\\Models\\Athlete	676	11	2	\N	3578	3230	12	14	[]	\N
20990	2022-03-25 17:44:36	2022-03-25 17:44:36	2065	2.\tSIDORETTI, Stefano\t89\tAthena Bracciano\t36.38	App\\Models\\Athlete	167	11	2	\N	3638	3210	12	14	[]	\N
20991	2022-03-25 17:44:36	2022-03-25 17:44:36	2066	3.\tFREY, Max\t86\tDLRG Buchholz United\t36.47	App\\Models\\Athlete	463	11	2	\N	3647	3230	12	14	[]	\N
20992	2022-03-25 17:44:36	2022-03-25 17:44:36	2067	4.\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg \t36.75	App\\Models\\Athlete	539	11	2	\N	3675	39	12	14	[]	\N
20993	2022-03-25 17:44:36	2022-03-25 17:44:36	2068	5.\tVAN DER WIJST, Frank\t90\tRB Oss\t40.08	App\\Models\\Athlete	1176	11	2	\N	4008	43	12	14	[]	\N
20994	2022-03-25 17:44:36	2022-03-25 17:44:36	2069	6.\tVAN LUIJTELAAR, Pieter\t83\tRB Boxtel\t40.66	App\\Models\\Athlete	578	11	2	\N	4066	122	12	14	[]	\N
20995	2022-03-25 17:44:36	2022-03-25 17:44:36	2070	7.\tVAN DE RIET, Stefan\t84\tRB Delft\t41.97	App\\Models\\Athlete	168	11	2	\N	4197	3221	12	14	[]	\N
20996	2022-03-25 17:44:36	2022-03-25 17:44:36	2071	8.\tKUEHN, Martijn\t83\tRB Gouda\t44.71	App\\Models\\Athlete	170	11	2	\N	4471	17	12	14	[]	\N
20997	2022-03-25 17:44:36	2022-03-25 17:44:36	2072	9.\tDEN HARTOG, Jan-Willem\t86\tRB Amersfoort\t46.58	App\\Models\\Athlete	856	11	2	\N	4658	22	12	14	[]	\N
20998	2022-03-25 17:44:36	2022-03-25 17:44:36	2073	10.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t48.59	App\\Models\\Athlete	579	11	2	\N	4859	22	12	14	[]	\N
20999	2022-03-25 17:44:36	2022-03-25 17:44:36	2075	1.\tVAN DER MEER, Vincent\t79\tRB Delft\t40.76	App\\Models\\Athlete	464	11	2	\N	4076	3221	12	15	[]	\N
21000	2022-03-25 17:44:36	2022-03-25 17:44:36	2076	2.\tVAN DE GOOR, Guus\t77\tRB Echt\t44.48	App\\Models\\Athlete	174	11	2	\N	4448	15	12	15	[]	\N
21001	2022-03-25 17:44:36	2022-03-25 17:44:36	2077	3.\tBROWNE, David\t72\tSt. John Berchmans Life Saving Club\t47.52	App\\Models\\Athlete	1052	11	2	\N	4752	3242	12	15	[]	\N
21002	2022-03-25 17:44:37	2022-03-25 17:44:37	2078	4.\tSHINN, Ryan\t80\tRB Amersfoort\t54.95	App\\Models\\Athlete	171	11	2	\N	5495	22	12	15	[]	\N
21003	2022-03-25 17:44:37	2022-03-25 17:44:37	2080	1.\tROEMEN, Sven\t70\tRB Echt\t40.53	App\\Models\\Athlete	173	11	2	\N	4053	15	12	16	[]	\N
21004	2022-03-25 17:44:37	2022-03-25 17:44:37	2081	2.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t51.68	App\\Models\\Athlete	179	11	2	\N	5168	13	12	16	[]	\N
21005	2022-03-25 17:44:37	2022-03-25 17:44:37	2082	3.\tPRAET, Piet\t56\tRB Dordrecht\t53.24	App\\Models\\Athlete	693	11	2	\N	5324	13	12	16	[]	\N
21006	2022-03-25 17:44:37	2022-03-25 17:44:37	2088	1.\tPIOVANI, Giulia\t05\tIn Sport Rane Rosse\t54.53	App\\Models\\Athlete	798	11	4	\N	5453	3208	12	12	[]	\N
21007	2022-03-25 17:44:37	2022-03-25 17:44:37	2089	2.\tCROES, Elise\t04\tBelgium NT\t54.62	App\\Models\\Athlete	14	11	4	\N	5462	3206	12	12	[]	\N
21008	2022-03-25 17:44:37	2022-03-25 17:44:37	2090	3.\tRODRIGUEZ RODRIGUEZ DE LA SIERRA, Maria\t04\tSpain NT\t55.34	App\\Models\\Athlete	1177	11	4	\N	5534	3204	12	12	[]	\N
21009	2022-03-25 17:44:37	2022-03-25 17:44:37	2091	4.\tGIORDANO, Masha\t04\tItaly NT\t55.98	App\\Models\\Athlete	7	11	4	\N	5598	3201	12	12	[]	\N
21010	2022-03-25 17:44:37	2022-03-25 17:44:37	2092	5.\tBONETTI, Chiara\t06\tAthena Salvamento\t56.71	App\\Models\\Athlete	1057	11	4	\N	5671	3213	12	12	[]	\N
21011	2022-03-25 17:44:37	2022-03-25 17:44:37	2093	6.\tCIPOLLETTI, Ilaria\t06\tAthena Bracciano\t57.22	App\\Models\\Athlete	791	11	4	\N	5722	3210	12	12	[]	\N
21012	2022-03-25 17:44:37	2022-03-25 17:44:37	2094	7.\tPASEK, Natalia\t05\tSlaskie WOPR\t57.28	App\\Models\\Athlete	1056	11	4	\N	5728	3211	12	12	[]	\N
21013	2022-03-25 17:44:37	2022-03-25 17:44:37	2095	8.\tGIORDANO, Melissa\t06\tAthena Bracciano\t57.93	App\\Models\\Athlete	1053	11	4	\N	5793	3210	12	12	[]	\N
21014	2022-03-25 17:44:37	2022-03-25 17:44:37	2096	9.\tZECH, Gina\t05\tDLRG Sachsen-Anhalt\t58.80	App\\Models\\Athlete	1005	11	4	\N	5880	3209	12	12	[]	\N
21015	2022-03-25 17:44:37	2022-03-25 17:44:37	2097	10.\tBARRENA PONCE, Sheila\t03\tSpain NT\t59.13	App\\Models\\Athlete	1054	11	4	\N	5913	3204	12	12	[]	\N
21016	2022-03-25 17:44:37	2022-03-25 17:44:37	2098	11.\tCLOTEAUX, Louenn\t05\tFrance NT\t1:00.09	App\\Models\\Athlete	1004	11	4	\N	6009	3205	12	12	[]	\N
21017	2022-03-25 17:44:37	2022-03-25 17:44:37	2099	12.\tGONZALEZ GOMEZ, Lucia\t05\tSpain NT\t1:00.27	App\\Models\\Athlete	786	11	4	\N	6027	3204	12	12	[]	\N
21018	2022-03-25 17:44:37	2022-03-25 17:44:37	2100	13.\tDALHUISEN, Renske\t03\tNederland NT\t1:00.48	App\\Models\\Athlete	30	11	4	\N	6048	3218	12	12	[]	\N
21019	2022-03-25 17:44:37	2022-03-25 17:44:37	2101	14.\tDEWAEL, Nell\t06\tLiege Sauvetage Club\t1:01.00	App\\Models\\Athlete	1008	11	4	\N	6100	3238	12	12	[]	\N
7580	2022-02-19 13:27:51	2022-02-19 13:27:51	1640	28.\tRUSSCHEN, Sem\t99\tRB Dordrecht\t2:46.95	App\\Models\\Athlete	538	1	6	\N	16695	13	2	8	[]	\N
21020	2022-03-25 17:44:37	2022-03-25 17:44:37	2102	15.\tPASQUALI, Carlotta\t06\tAthena Bracciano\t1:01.38	App\\Models\\Athlete	796	11	4	\N	6138	3210	12	12	[]	\N
21021	2022-03-25 17:44:37	2022-03-25 17:44:37	2103	16.\tMONGIA, Sara\t06\tASD Rosetana Nuoto\t1:01.73	App\\Models\\Athlete	800	11	4	\N	6173	3215	12	12	[]	\N
21022	2022-03-25 17:44:37	2022-03-25 17:44:37	2104	17.\tPOJUM, Sofia\t06\tIn Sport Rane Rosse\t1:02.13	App\\Models\\Athlete	1003	11	4	\N	6213	3208	12	12	[]	\N
21023	2022-03-25 17:44:37	2022-03-25 17:44:37	2105	18.\tRAUZY, Solene\t05\tFrance NT\t1:04.05	App\\Models\\Athlete	1055	11	4	\N	6405	3205	12	12	[]	\N
21024	2022-03-25 17:44:37	2022-03-25 17:44:37	2111	19.\tBONHOMME, Meline\t04\tLiege Sauvetage Club\t1:04.12	App\\Models\\Athlete	1006	11	4	\N	6412	3238	12	12	[]	\N
21025	2022-03-25 17:44:37	2022-03-25 17:44:37	2112	20.\tBERTORELLE, Fiona\t06\tFrance NT\t1:04.17	App\\Models\\Athlete	795	11	4	\N	6417	3205	12	12	[]	\N
21026	2022-03-25 17:44:37	2022-03-25 17:44:37	2113	21.\tS'HEEREN, Mirte\t06\tSint-Truidense RC\t1:04.42	App\\Models\\Athlete	799	11	4	\N	6442	3214	12	12	[]	\N
21027	2022-03-25 17:44:37	2022-03-25 17:44:37	2114	22.\tDRABIK, Aneta\t04\tSlaskie WOPR\t1:04.52	App\\Models\\Athlete	793	11	4	\N	6452	3211	12	12	[]	\N
21028	2022-03-25 17:44:37	2022-03-25 17:44:37	2115	23.\tTUBILI, Francesca\t06\tIn Sport Rane Rosse\t1:04.55	App\\Models\\Athlete	1069	11	4	\N	6455	3208	12	12	[]	\N
21029	2022-03-25 17:44:37	2022-03-25 17:44:37	2116	24.\tD'ALESSANDRO, Carlotta\t06\tIn Sport Rane Rosse\t1:04.59	App\\Models\\Athlete	1059	11	4	\N	6459	3208	12	12	[]	\N
21030	2022-03-25 17:44:37	2022-03-25 17:44:37	2117	25.\tMONTENEGREO, Noemi\t03\tAthena Salvamento\t1:05.14	App\\Models\\Athlete	1058	11	4	\N	6514	3213	12	12	[]	\N
21031	2022-03-25 17:44:37	2022-03-25 17:44:37	2118	26.\tTIRONI, Alice\t05\tSDS - Specialisti dello Sport \t1:05.74	App\\Models\\Athlete	1002	11	4	\N	6574	3228	12	12	[]	\N
21032	2022-03-25 17:44:37	2022-03-25 17:44:37	2119	27.\tPETRUNGARO, Laura\t06\tIn Sport Rane Rosse\t1:06.36	App\\Models\\Athlete	1061	11	4	\N	6636	3208	12	12	[]	\N
21033	2022-03-25 17:44:37	2022-03-25 17:44:37	2120	28.\tCZOK, Joanna\t03\tSlaskie WOPR\t1:06.38	App\\Models\\Athlete	1007	11	4	\N	6638	3211	12	12	[]	\N
21034	2022-03-25 17:44:37	2022-03-25 17:44:37	2121	29.\tHILLE, Louisa\t04\tDLRG Guetersloh\t1:06.53	App\\Models\\Athlete	404	11	4	\N	6653	3220	12	12	[]	\N
21035	2022-03-25 17:44:37	2022-03-25 17:44:37	2122	30.\tKARWOWSKA, Anna\t03\tCKS Szczecin\t1:06.77	App\\Models\\Athlete	1062	11	4	\N	6677	3227	12	12	[]	\N
21036	2022-03-25 17:44:37	2022-03-25 17:44:37	2123	31.\tMURA CITTADINI, Melissa\t03\tAccademia Di Salvamento\t1:06.97	App\\Models\\Athlete	473	11	4	\N	6697	3203	12	12	[]	\N
21037	2022-03-25 17:44:37	2022-03-25 17:44:37	2124	32.\tVAGLIVIELLO, Denise\t05\tAthena Salvamento\t1:07.15	App\\Models\\Athlete	1060	11	4	\N	6715	3213	12	12	[]	\N
21038	2022-03-25 17:44:37	2022-03-25 17:44:37	2125	33.\tBELLI, Sofia\t05\tAthena Salvamento\t1:08.84	App\\Models\\Athlete	810	11	4	\N	6884	3213	12	12	[]	\N
21039	2022-03-25 17:44:37	2022-03-25 17:44:37	2126	34.\tFERRIGNO, Sveva\t05\tIn Sport Rane Rosse\t1:09.28	App\\Models\\Athlete	1064	11	4	\N	6928	3208	12	12	[]	\N
21040	2022-03-25 17:44:37	2022-03-25 17:44:37	2127	35.\tSTICKER, Lien\t06\tRctal\t1:09.57	App\\Models\\Athlete	803	11	4	\N	6957	3217	12	12	[]	\N
21041	2022-03-25 17:44:37	2022-03-25 17:44:37	2128	36.\tMENNEN, Fenne\t06\tRB Heytse\t1:10.32	App\\Models\\Athlete	1010	11	4	\N	7032	3229	12	12	[]	\N
21042	2022-03-25 17:44:37	2022-03-25 17:44:37	2129	37.\tDE KONING, Sanne\t04\tRB Gouda\t1:10.64	App\\Models\\Athlete	43	11	4	\N	7064	17	12	12	[]	\N
21043	2022-03-25 17:44:37	2022-03-25 17:44:37	2130	38.\tKLOMP, Dyonne\t04\tRB Weert\t1:11.21	App\\Models\\Athlete	31	11	4	\N	7121	12	12	12	[]	\N
21044	2022-03-25 17:44:38	2022-03-25 17:44:38	2131	39.\tSPLIETHOFF, Lea\t04\tDLRG Alpen\t1:11.26	App\\Models\\Athlete	1065	11	4	\N	7126	261	12	12	[]	\N
21045	2022-03-25 17:44:38	2022-03-25 17:44:38	2132	40.\tDE GREEF, Ruth\t03\tRctal\t1:11.60	App\\Models\\Athlete	1009	11	4	\N	7160	3217	12	12	[]	\N
21046	2022-03-25 17:44:38	2022-03-25 17:44:38	2133	41.\tHUYSMANS, Lune\t06\tSint-Truidense RC\t1:11.65	App\\Models\\Athlete	1012	11	4	\N	7165	3214	12	12	[]	\N
21047	2022-03-25 17:44:38	2022-03-25 17:44:38	2134	42.\tDERWAEL, Fien\t06\tSint-Truidense RC\t1:11.73	App\\Models\\Athlete	806	11	4	\N	7173	3214	12	12	[]	\N
21048	2022-03-25 17:44:38	2022-03-25 17:44:38	2135	43.\tBARBU, Julia\t06\tRB Dordrecht\t1:12.68	App\\Models\\Athlete	1023	11	4	\N	7268	13	12	12	[]	\N
21049	2022-03-25 17:44:38	2022-03-25 17:44:38	2136	44.\tJANISZEWSKA, Wiktoria\t04\tCKS Szczecin\t1:13.00	App\\Models\\Athlete	1011	11	4	\N	7300	3227	12	12	[]	\N
21050	2022-03-25 17:44:38	2022-03-25 17:44:38	2137	45.\tDELAMARE, Michelle\t05\tAthena Bracciano\t1:13.17	App\\Models\\Athlete	805	11	4	\N	7317	3210	12	12	[]	\N
21051	2022-03-25 17:44:38	2022-03-25 17:44:38	2138	46.\tWIJNANT, Loes\t05\tRctal\t1:13.32	App\\Models\\Athlete	811	11	4	\N	7332	3217	12	12	[]	\N
21052	2022-03-25 17:44:38	2022-03-25 17:44:38	2139	47.\tRIEDRICH, Franka\t05\tDLRG Nuernberg-Roth-Schwabach\t1:13.34	App\\Models\\Athlete	802	11	4	\N	7334	3216	12	12	[]	\N
21053	2022-03-25 17:44:38	2022-03-25 17:44:38	2140	48.\tSPUERCK, Hanna\t03\tDLRG Nordrhein-Westfalen\t1:13.79	App\\Models\\Athlete	39	11	4	\N	7379	3219	12	12	[]	\N
21054	2022-03-25 17:44:38	2022-03-25 17:44:38	2141	49.\tLONG, Calista\t05\tRB Echt\t1:14.32	App\\Models\\Athlete	1013	11	4	\N	7432	15	12	12	[]	\N
21055	2022-03-25 17:44:38	2022-03-25 17:44:38	2142	50.\tKRAUSS, Hannah\t05\tDLRG Niedersachsen\t1:14.70	App\\Models\\Athlete	1015	11	4	\N	7470	3212	12	12	[]	\N
21056	2022-03-25 17:44:38	2022-03-25 17:44:38	2143	51.\tEUBE, Mareike\t03\tDLRG Guetersloh\t1:14.90	App\\Models\\Athlete	68	11	4	\N	7490	3220	12	12	[]	\N
21057	2022-03-25 17:44:38	2022-03-25 17:44:38	2144	52.\tBUECKEN, Greta\t05\tDLRG Alpen\t1:14.91	App\\Models\\Athlete	1063	11	4	\N	7491	261	12	12	[]	\N
21058	2022-03-25 17:44:38	2022-03-25 17:44:38	2145	53.\tSCHMIEMANN, Monia\t04\tDLRG Niedersachsen\t1:15.04	App\\Models\\Athlete	1020	11	4	\N	7504	3212	12	12	[]	\N
21059	2022-03-25 17:44:38	2022-03-25 17:44:38	2146	54.\tJANSSEN, Vera\t05\tRB Echt\t1:15.11	App\\Models\\Athlete	1017	11	4	\N	7511	15	12	12	[]	\N
21060	2022-03-25 17:44:38	2022-03-25 17:44:38	2147	55.\tROSA, Martina\t04\tAthena Bracciano\t1:16.16	App\\Models\\Athlete	813	11	4	\N	7616	3210	12	12	[]	\N
21061	2022-03-25 17:44:38	2022-03-25 17:44:38	2148	56.\tSETTI, Jennifer\t05\tAthena Salvamento\t1:16.89	App\\Models\\Athlete	1068	11	4	\N	7689	3213	12	12	[]	\N
21062	2022-03-25 17:44:38	2022-03-25 17:44:38	2149	57.\tZUIDGEEST, Vera\t03\tRB Delft\t1:16.96	App\\Models\\Athlete	478	11	4	\N	7696	3221	12	12	[]	\N
21063	2022-03-25 17:44:38	2022-03-25 17:44:38	2150	58.\tPERRIENS, Lianne\t06\tRB Echt\t1:17.19	App\\Models\\Athlete	1022	11	4	\N	7719	15	12	12	[]	\N
21064	2022-03-25 17:44:38	2022-03-25 17:44:38	2151	59.\tGERAATS, Lieke\t06\tRB Heytse\t1:17.90	App\\Models\\Athlete	1016	11	4	\N	7790	3229	12	12	[]	\N
21065	2022-03-25 17:44:38	2022-03-25 17:44:38	2152	60.\tWRIGGERS, Jule\t04\tDLRG Duisburg-Homberg \t1:18.62	App\\Models\\Athlete	1070	11	4	\N	7862	39	12	12	[]	\N
21066	2022-03-25 17:44:38	2022-03-25 17:44:38	2153	61.\tBONHOMME, Janice\t06\tLiege Sauvetage Club\t1:18.75	App\\Models\\Athlete	1014	11	4	\N	7875	3238	12	12	[]	\N
21067	2022-03-25 17:44:38	2022-03-25 17:44:38	2154	62.\tKINGA SZCZEMBARA, Kinga Szczembara\t06\tSlaskie WOPR\t1:20.73	App\\Models\\Athlete	1021	11	4	\N	8073	3211	12	12	[]	\N
21068	2022-03-25 17:44:38	2022-03-25 17:44:38	2155	63.\tKOITKA, Sophie\t06\tDLRG Guetersloh\t1:20.95	App\\Models\\Athlete	812	11	4	\N	8095	3220	12	12	[]	\N
21069	2022-03-25 17:44:38	2022-03-25 17:44:38	2156	64.\tDOMINJANNI, Angelica\t06\tAthena Salvamento\t1:22.00	App\\Models\\Athlete	1066	11	4	\N	8200	3213	12	12	[]	\N
21070	2022-03-25 17:44:38	2022-03-25 17:44:38	2157	65.\tEUBE, Amelie\t05\tDLRG Guetersloh\t1:22.25	App\\Models\\Athlete	815	11	4	\N	8225	3220	12	12	[]	\N
21071	2022-03-25 17:44:38	2022-03-25 17:44:38	2158	66.\tVAN GELLEKOM, Lotte\t03\tRB Echt\t1:22.68	App\\Models\\Athlete	481	11	4	\N	8268	15	12	12	[]	\N
21072	2022-03-25 17:44:38	2022-03-25 17:44:38	2159	67.\tHACKEN, Anouk\t04\tRB Boxtel\t1:23.41	App\\Models\\Athlete	1121	11	4	\N	8341	122	12	12	[]	\N
21073	2022-03-25 17:44:38	2022-03-25 17:44:38	2160	68.\tVRENKEN, Kyra\t04\tRB Echt\t1:24.75	App\\Models\\Athlete	72	11	4	\N	8475	15	12	12	[]	\N
21074	2022-03-25 17:44:38	2022-03-25 17:44:38	2161	69.\tKELLENERS, Jill\t06\tRB Echt\t1:27.60	App\\Models\\Athlete	814	11	4	\N	8760	15	12	12	[]	\N
21075	2022-03-25 17:44:38	2022-03-25 17:44:38	2162	70.\tCANNONE, Asia\t04\tAthena Salvamento\t1:27.71	App\\Models\\Athlete	797	11	4	\N	8771	3213	12	12	[]	\N
21076	2022-03-25 17:44:38	2022-03-25 17:44:38	2163	71.\tROMANCZYK, Lena\t06\tDLRG Duisburg-Homberg \t1:28.53	App\\Models\\Athlete	1067	11	4	\N	8853	39	12	12	[]	\N
21077	2022-03-25 17:44:38	2022-03-25 17:44:38	2164	72.\tVAN DER VORST, Lynn\t04\tRB Echt\t1:31.84	App\\Models\\Athlete	415	11	4	\N	9184	15	12	12	[]	\N
21078	2022-03-25 17:44:38	2022-03-25 17:44:38	2165	DNS\tGERAATS, Kim\t04\tRB Heytse	App\\Models\\Athlete	55	11	4	2	\N	3229	12	12	[]	\N
21079	2022-03-25 17:44:38	2022-03-25 17:44:38	2166	WDR\tNAUTA, Emma\t06\tRB Oss	App\\Models\\Athlete	1024	11	4	0	\N	43	12	12	[]	\N
21080	2022-03-25 17:44:38	2022-03-25 17:44:38	2172	1.\tFABRETTI, Lucrezia\t01\tItaly NT\t52.82	App\\Models\\Athlete	1077	11	4	\N	5282	3201	12	13	[]	\N
21081	2022-03-25 17:44:38	2022-03-25 17:44:38	2173	2.\tVOLPINI, Federica\t93\tItaly NT\t52.90	App\\Models\\Athlete	487	11	4	\N	5290	3201	12	13	[]	\N
21082	2022-03-25 17:44:38	2022-03-25 17:44:38	2174	3.\tTCHORZ, Alicja\t92\tPoland Dolnoslaskie Wopr\t54.91	App\\Models\\Athlete	1149	11	4	\N	5491	3222	12	13	[]	\N
21083	2022-03-25 17:44:38	2022-03-25 17:44:38	2175	4.\tQUADRELLI, Martina\t00\tIn Sport Rane Rosse\t56.67	App\\Models\\Athlete	1073	11	4	\N	5667	3208	12	13	[]	\N
21084	2022-03-25 17:44:38	2022-03-25 17:44:38	2176	5.\tQUINKE, Loreen\t01\tDLRG Nordrhein-Westfalen\t57.84	App\\Models\\Athlete	469	11	4	\N	5784	3219	12	13	[]	\N
21085	2022-03-25 17:44:38	2022-03-25 17:44:38	2177	6.\tLOUREIRO SERRANO, Noelia\t01\tSpain NT\t59.03	App\\Models\\Athlete	471	11	4	\N	5903	3204	12	13	[]	\N
21086	2022-03-25 17:44:38	2022-03-25 17:44:38	2178	7.\tFILIPPINI, Valeria\t99\tIn Sport Rane Rosse\t59.60	App\\Models\\Athlete	1074	11	4	\N	5960	3208	12	13	[]	\N
21087	2022-03-25 17:44:38	2022-03-25 17:44:38	2179	8.\tDURAND, Emma\t00\tFrance NT\t59.78	App\\Models\\Athlete	1030	11	4	\N	5978	3205	12	13	[]	\N
21088	2022-03-25 17:44:38	2022-03-25 17:44:38	2180	9.\tDZIURON, Jasmin\t93\tDLRG Schlossholte-Stukenbrock\t1:00.10	App\\Models\\Athlete	1072	11	4	\N	6010	3243	12	13	[]	\N
21089	2022-03-25 17:44:38	2022-03-25 17:44:38	2181	10.\tVAN OS, Hanna\t02\tDLRG Sachsen-Anhalt\t1:00.35	App\\Models\\Athlete	825	11	4	\N	6035	3209	12	13	[]	\N
21090	2022-03-25 17:44:38	2022-03-25 17:44:39	2182	11.\tPOPIEL, Anna\t01\tCKS Szczecin\t1:00.83	App\\Models\\Athlete	1076	11	4	\N	6083	3227	12	13	[]	\N
21091	2022-03-25 17:44:39	2022-03-25 17:44:39	2183	12.\tCHIARAVALLI, Ginevra\t97\tAthena Bracciano\t1:01.65	App\\Models\\Athlete	97	11	4	\N	6165	3210	12	13	[]	\N
21092	2022-03-25 17:44:39	2022-03-25 17:44:39	2184	13.\tHARZE, Marine\t97\tBelgium NT\t1:02.09	App\\Models\\Athlete	420	11	4	\N	6209	3206	12	13	[]	\N
21093	2022-03-25 17:44:39	2022-03-25 17:44:39	2185	14.\tTORTELLO, Carlotta\t02\tA.S.D. Sportiva Sturla\t1:06.00	App\\Models\\Athlete	1083	11	4	\N	6600	3235	12	13	[]	\N
21094	2022-03-25 17:44:39	2022-03-25 17:44:39	2186	15.\tSKUDLIK, Marta\t01\tSlaskie WOPR\t1:06.03	App\\Models\\Athlete	1075	11	4	\N	6603	3211	12	13	[]	\N
21095	2022-03-25 17:44:39	2022-03-25 17:44:39	2187	16.\tGROOT, Kathy\t97\tRB Dordrecht\t1:07.99	App\\Models\\Athlete	570	11	4	\N	6799	13	12	13	[]	\N
6677	2022-02-19 13:27:45	2022-02-19 13:27:45	201	3.\tSouth Africa 1\tSouth Africa\t2:03.44	App\\Models\\RelayTeam	115	1	25	\N	12344	232	2	\N	[]	\N
6678	2022-02-19 13:27:45	2022-02-19 13:27:45	203	4.\tDordrecht Senioren\tRB Dordrecht\t2:03.75	App\\Models\\RelayTeam	116	1	25	\N	12375	13	2	\N	[]	\N
21096	2022-03-25 17:44:39	2022-03-25 17:44:39	2188	17.\tWOLFS, Sharon\t00\tRB Echt\t1:08.03	App\\Models\\Athlete	430	11	4	\N	6803	15	12	13	[]	\N
21097	2022-03-25 17:44:39	2022-03-25 17:44:39	2189	18.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg \t1:08.55	App\\Models\\Athlete	108	11	4	\N	6855	39	12	13	[]	\N
21098	2022-03-25 17:44:39	2022-03-25 17:44:39	2190	19.\tKLOMP, Danique\t02\tNederland NT\t1:09.10	App\\Models\\Athlete	19	11	4	\N	6910	3218	12	13	[]	\N
21099	2022-03-25 17:44:39	2022-03-25 17:44:39	2191	20.\tGEUBELS, Kaat\t96\tRctal\t1:09.70	App\\Models\\Athlete	499	11	4	\N	6970	3217	12	13	[]	\N
21100	2022-03-25 17:44:39	2022-03-25 17:44:39	2192	21.\tBECKERS, Fleur\t02\tRB Echt\t1:11.61	App\\Models\\Athlete	26	11	4	\N	7161	15	12	13	[]	\N
21101	2022-03-25 17:44:39	2022-03-25 17:44:39	2193	22.\tVAN HILLO, Michelle\t00\tRB Boxtel\t1:12.69	App\\Models\\Athlete	1122	11	4	\N	7269	122	12	13	[]	\N
21102	2022-03-25 17:44:39	2022-03-25 17:44:39	2194	23.\tMICHESI, Silvia\t00\tAthena Bracciano\t1:12.98	App\\Models\\Athlete	1081	11	4	\N	7298	3210	12	13	[]	\N
21103	2022-03-25 17:44:39	2022-03-25 17:44:39	2195	24.\tPISTERS, Nathalie\t01\tRB Echt\t1:14.39	App\\Models\\Athlete	35	11	4	\N	7439	15	12	13	[]	\N
21104	2022-03-25 17:44:39	2022-03-25 17:44:39	2196	25.\tVAN HAAREN, Renate\t92\tRB Oss\t1:17.29	App\\Models\\Athlete	508	11	4	\N	7729	43	12	13	[]	\N
21105	2022-03-25 17:44:39	2022-03-25 17:44:39	2197	26.\tTERLIESNER, Jana\t95\tDLRG Duisburg-Homberg \t1:17.82	App\\Models\\Athlete	1082	11	4	\N	7782	39	12	13	[]	\N
21106	2022-03-25 17:44:39	2022-03-25 17:44:39	2198	27.\tPICCARDI, Sara\t02\tAthena Bracciano\t1:20.08	App\\Models\\Athlete	1080	11	4	\N	8008	3210	12	13	[]	\N
21107	2022-03-25 17:44:39	2022-03-25 17:44:39	2199	28.\tJETTEN, Maike\t02\tRB Echt\t1:23.11	App\\Models\\Athlete	400	11	4	\N	8311	15	12	13	[]	\N
21108	2022-03-25 17:44:39	2022-03-25 17:44:39	2200	DNS\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	11	4	2	\N	43	12	13	[]	\N
21109	2022-03-25 17:44:39	2022-03-25 17:44:39	2201	DNS\tFOGLIUZZI, Zoe\t98\tItaly NT	App\\Models\\Athlete	818	11	4	2	\N	3201	12	13	[]	\N
21110	2022-03-25 17:44:39	2022-03-25 17:44:39	2202	DNS\tRAS, Janneke\t95\tNederland NT	App\\Models\\Athlete	489	11	4	2	\N	3218	12	13	[]	\N
21111	2022-03-25 17:44:39	2022-03-25 17:44:39	2203	WDR\tREPETTO, Martina\t98\tA.S.D. Sportiva Sturla	App\\Models\\Athlete	828	11	4	0	\N	3235	12	13	[]	\N
21112	2022-03-25 17:44:39	2022-03-25 17:44:39	2204	WDR\tZANDER, Vivian\t98\tDLRG Schlossholte-Stukenbrock	App\\Models\\Athlete	1084	11	4	0	\N	3243	12	13	[]	\N
21113	2022-03-25 17:44:39	2022-03-25 17:44:39	2205	WDR\tVANBUEL, Nele\t85\tBelgium NT	App\\Models\\Athlete	121	11	4	0	\N	3206	12	13	[]	\N
21114	2022-03-25 17:44:39	2022-03-25 17:44:39	2206	WDR\tBAKKER, Myrthe\t00\tNederland NT	App\\Models\\Athlete	423	11	4	0	\N	3218	12	13	[]	\N
21115	2022-03-25 17:44:39	2022-03-25 17:44:39	2207	WDR\tBRINK, Celine\t00\tRB Dordrecht	App\\Models\\Athlete	94	11	4	0	\N	13	12	13	[]	\N
21116	2022-03-25 17:44:39	2022-03-25 17:44:39	2209	1.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t1:05.29	App\\Models\\Athlete	640	11	4	\N	6529	243	12	14	[]	\N
21117	2022-03-25 17:44:39	2022-03-25 17:44:39	2210	2.\tLINDER, Anna\t86\tDLRG Nordrhein-Westfalen\t1:06.35	App\\Models\\Athlete	512	11	4	\N	6635	3219	12	14	[]	\N
21118	2022-03-25 17:44:39	2022-03-25 17:44:39	2211	3.\tSTEVENS, Danielle\t88\tRB Oss\t1:22.11	App\\Models\\Athlete	641	11	4	\N	8211	43	12	14	[]	\N
21119	2022-03-25 17:44:39	2022-03-25 17:44:39	2213	1.\tROEMEN, Claudine\t74\tRB Echt\t1:10.11	App\\Models\\Athlete	125	11	4	\N	7011	15	12	15	[]	\N
21120	2022-03-25 17:44:39	2022-03-25 17:44:39	2215	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t1:28.02	App\\Models\\Athlete	440	11	4	\N	8802	13	12	16	[]	\N
21121	2022-03-25 17:44:39	2022-03-25 17:44:39	2216	2.\tLAPU-OS, Lelanie\t67\tRB Dordrecht\t2:18.00	App\\Models\\Athlete	521	11	4	\N	13800	13	12	16	[]	\N
21122	2022-03-25 17:44:39	2022-03-25 17:44:39	2225	1.\tVIVALDA, DAVIDE\t03\tSAFA 2000\t46.86	App\\Models\\Athlete	1178	11	4	\N	4686	3202	12	12	[]	\N
21123	2022-03-25 17:44:39	2022-03-25 17:44:39	2226	2.\tROMERO FERNANDEZ, Ivan\t03\tSpain NT\t49.22	App\\Models\\Athlete	1091	11	4	\N	4922	3204	12	12	[]	\N
21124	2022-03-25 17:44:39	2022-03-25 17:44:39	2227	3.\tMUELLER, Jannis\t04\tDLRG Guetersloh\t49.49	App\\Models\\Athlete	1179	11	4	\N	4949	3220	12	12	[]	\N
21125	2022-03-25 17:44:39	2022-03-25 17:44:39	2228	4.\tLEVEQUE, Simon\t05\tFrance NT\t50.21	App\\Models\\Athlete	1038	11	4	\N	5021	3205	12	12	[]	\N
21126	2022-03-25 17:44:39	2022-03-25 17:44:39	2229	5.\tDURAGER, Tom\t05\tFrance NT\t50.27	App\\Models\\Athlete	1087	11	4	\N	5027	3205	12	12	[]	\N
21127	2022-03-25 17:44:39	2022-03-25 17:44:39	2230	6.\tTURRADO ALVAREZ, Alberto\t04\tSpain NT\t50.67	App\\Models\\Athlete	1086	11	4	\N	5067	3204	12	12	[]	\N
21128	2022-03-25 17:44:39	2022-03-25 17:44:39	2231	7.\tROGOZINSKI, Konrad\t04\tCKS Szczecin\t51.20	App\\Models\\Athlete	831	11	4	\N	5120	3227	12	12	[]	\N
21129	2022-03-25 17:44:39	2022-03-25 17:44:39	2232	8.\tBERGERON, Tom\t06\tFrance NT\t51.55	App\\Models\\Athlete	1158	11	4	\N	5155	3205	12	12	[]	\N
21130	2022-03-25 17:44:39	2022-03-25 17:44:39	2233	9.\tMANCARDO, LORENZO\t03\tSAFA 2000\t51.84	App\\Models\\Athlete	830	11	4	\N	5184	3202	12	12	[]	\N
21131	2022-03-25 17:44:39	2022-03-25 17:44:39	2234	10.\tGRABSKI, Mateusz\t03\tPolen NT\t51.86	App\\Models\\Athlete	1036	11	4	\N	5186	3234	12	12	[]	\N
21132	2022-03-25 17:44:39	2022-03-25 17:44:39	2235	11.\tFORMANN, Brivael\t04\tLiege Sauvetage Club\t51.89	App\\Models\\Athlete	1092	11	4	\N	5189	3238	12	12	[]	\N
21133	2022-03-25 17:44:39	2022-03-25 17:44:39	2236	12.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t52.07	App\\Models\\Athlete	656	11	4	\N	5207	17	12	12	[]	\N
7581	2022-02-19 13:27:51	2022-02-19 13:27:51	1641	29.\tWONG, Shun-lai\t97\tHong Kong Lifesaving team\t2:48.89	App\\Models\\Athlete	751	1	6	\N	16889	252	2	8	[]	\N
6679	2022-02-19 13:27:45	2022-02-19 13:27:45	205	5.\tBuchholz 1\tDLRG Buchholz e.V.\t2:12.27	App\\Models\\RelayTeam	117	1	25	\N	13227	234	2	\N	[]	\N
6680	2022-02-19 13:27:45	2022-02-19 13:27:45	207	6.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t2:12.30	App\\Models\\RelayTeam	118	1	25	\N	13230	239	2	\N	[]	\N
21134	2022-03-25 17:44:39	2022-03-25 17:44:39	2237	13.\tPUGGIONI, Antonio\t04\tAccademia Di Salvamento\t52.10	App\\Models\\Athlete	1094	11	4	\N	5210	3203	12	12	[]	\N
6681	2022-02-19 13:27:45	2022-02-19 13:27:45	209	7.\tSouth Africa 2\tSouth Africa\t2:12.40	App\\Models\\RelayTeam	119	1	25	\N	13240	232	2	\N	[]	\N
6682	2022-02-19 13:27:45	2022-02-19 13:27:45	211	8.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t2:13.42	App\\Models\\RelayTeam	120	1	25	\N	13342	236	2	\N	[]	\N
21135	2022-03-25 17:44:39	2022-03-25 17:44:40	2238	14.\tBADUTO, Gabriele\t04\tIn Sport Rane Rosse\t52.43	App\\Models\\Athlete	1123	11	4	\N	5243	3208	12	12	[]	\N
6683	2022-02-19 13:27:45	2022-02-19 13:27:45	213	9.\tRB Gouda 2\tRB Gouda\t2:14.34	App\\Models\\RelayTeam	121	1	25	\N	13434	17	2	\N	[]	\N
6684	2022-02-19 13:27:45	2022-02-19 13:27:45	215	10.\tRB Heythuysen 1\tRB Heythuysen\t2:16.10	App\\Models\\RelayTeam	122	1	25	\N	13610	237	2	\N	[]	\N
6685	2022-02-19 13:27:45	2022-02-19 13:27:45	217	11.\tTeam Starfish\tStarfish SLC\t2:17.94	App\\Models\\RelayTeam	123	1	25	\N	13794	235	2	\N	[]	\N
21136	2022-03-25 17:44:40	2022-03-25 17:44:40	2239	15.\tABEL, Paul-Louis\t04\tDLRG Guetersloh\t52.58	App\\Models\\Athlete	1095	11	4	\N	5258	3220	12	12	[]	\N
6686	2022-02-19 13:27:45	2022-02-19 13:27:45	219	12.\tDLRG Ascheberg-Herbern 1\tDLRG Ascheberg-Herbern\t2:19.52	App\\Models\\RelayTeam	124	1	25	\N	13952	254	2	\N	[]	\N
6687	2022-02-19 13:27:45	2022-02-19 13:27:45	221	13.\tDordrecht Junioren\tRB Dordrecht\t2:20.01	App\\Models\\RelayTeam	125	1	25	\N	14001	13	2	\N	[]	\N
21137	2022-03-25 17:44:40	2022-03-25 17:44:40	2240	16.\tDI SIMONE, Franco\t03\tSDS - Specialisti dello Sport \t53.20	App\\Models\\Athlete	834	11	4	\N	5320	3228	12	12	[]	\N
6688	2022-02-19 13:27:45	2022-02-19 13:27:45	223	14.\t3T Sporting Club 1\t3T Sporting Club\t2:22.66	App\\Models\\RelayTeam	126	1	25	\N	14266	233	2	\N	[]	\N
6689	2022-02-19 13:27:45	2022-02-19 13:27:45	225	15.\tRB Gouda 1\tRB Gouda\t2:23.85	App\\Models\\RelayTeam	127	1	25	\N	14385	17	2	\N	[]	\N
21138	2022-03-25 17:44:40	2022-03-25 17:44:40	2241	17.\tGARCIA CASTRO, Diego\t05\tAthena Bracciano\t53.42	App\\Models\\Athlete	1180	11	4	\N	5342	3210	12	12	[]	\N
6690	2022-02-19 13:27:45	2022-02-19 13:27:45	227	16.\tKusel ChiXXX\tDLRG Kusel KiXX\t2:28.39	App\\Models\\RelayTeam	128	1	25	\N	14839	238	2	\N	[]	\N
21139	2022-03-25 17:44:40	2022-03-25 17:44:40	2242	18.\tNEICA, Riccardo\t05\tIn Sport Rane Rosse\t54.21	App\\Models\\Athlete	1096	11	4	\N	5421	3208	12	12	[]	\N
6691	2022-02-19 13:27:45	2022-02-19 13:27:45	229	17.\tDLRG Duisburg-Homberg 1\tDLRG Duisburg-Homberg\t2:30.67	App\\Models\\RelayTeam	129	1	25	\N	15067	39	2	\N	[]	\N
21140	2022-03-25 17:44:40	2022-03-25 17:44:40	2243	19.\tNAZARUK, Piotr\t03\tCKS Szczecin\t54.29	App\\Models\\Athlete	1093	11	4	\N	5429	3227	12	12	[]	\N
6692	2022-02-19 13:27:45	2022-02-19 13:27:45	231	18.\tRB Staphorst 1\tRB Staphorst\t2:36.96	App\\Models\\RelayTeam	130	1	25	\N	15696	26	2	\N	[]	\N
21141	2022-03-25 17:44:40	2022-03-25 17:44:40	2244	20.\tAIELLO, Axel\t05\tFrance NT\t54.94	App\\Models\\Athlete	1104	11	4	\N	5494	3205	12	12	[]	\N
21142	2022-03-25 17:44:40	2022-03-25 17:44:40	2245	21.\tCOLASANTI, Paolo\t05\tAccademia Di Salvamento\t55.11	App\\Models\\Athlete	1100	11	4	\N	5511	3203	12	12	[]	\N
6693	2022-02-19 13:27:45	2022-02-19 13:27:45	233	19.\tDordrecht Masters\tRB Dordrecht\t2:58.49	App\\Models\\RelayTeam	131	1	25	\N	17849	13	2	\N	[]	\N
21143	2022-03-25 17:44:40	2022-03-25 17:44:40	2246	22.\tCHIAVACCI, Roberto\t04\tAccademia Di Salvamento\t55.19	App\\Models\\Athlete	1089	11	4	\N	5519	3203	12	12	[]	\N
21144	2022-03-25 17:44:40	2022-03-25 17:44:40	2247	23.\tDELLI PASSERI, Emanuele\t05\tASD Rosetana Nuoto\t55.55	App\\Models\\Athlete	1101	11	4	\N	5555	3215	12	12	[]	\N
21145	2022-03-25 17:44:40	2022-03-25 17:44:40	2248	24.\tGIORGETTI, Mario\t06\tAthena Bracciano\t55.56	App\\Models\\Athlete	1098	11	4	\N	5556	3210	12	12	[]	\N
6694	2022-02-19 13:27:45	2022-02-19 13:27:45	241	1.\tItaly 1\tItaly\t1:42.37	App\\Models\\RelayTeam	132	1	25	\N	10237	1	2	\N	[]	\N
21146	2022-03-25 17:44:40	2022-03-25 17:44:40	2249	25.\tKOSOWSKI, Dominik\t06\tMKS Szczecin\t55.65	App\\Models\\Athlete	1097	11	4	\N	5565	3236	12	12	[]	\N
21147	2022-03-25 17:44:40	2022-03-25 17:44:40	2250	26.\tBROWNING, Ben\t03\tBeacon Lifesaving Club\t55.76	App\\Models\\Athlete	1151	11	4	\N	5576	3240	12	12	[]	\N
6695	2022-02-19 13:27:45	2022-02-19 13:27:45	243	2.\tGorizia Nuoto Asd 1\tGorizia Nuoto Asd\t1:42.42	App\\Models\\RelayTeam	133	1	25	\N	10242	231	2	\N	[]	\N
6696	2022-02-19 13:27:45	2022-02-19 13:27:45	245	3.\tNederland Senioren\tRB Dordrecht\t1:43.89	App\\Models\\RelayTeam	134	1	25	\N	10389	13	2	\N	[]	\N
6697	2022-02-19 13:27:45	2022-02-19 13:27:45	247	4.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t1:49.95	App\\Models\\RelayTeam	135	1	25	\N	10995	239	2	\N	[]	\N
6698	2022-02-19 13:27:46	2022-02-19 13:27:46	249	5.\tDLRG Goslar 1\tDLRG Goslar\t1:52.28	App\\Models\\RelayTeam	136	1	25	\N	11228	246	2	\N	[]	\N
6699	2022-02-19 13:27:46	2022-02-19 13:27:46	251	6.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t1:53.68	App\\Models\\RelayTeam	137	1	25	\N	11368	236	2	\N	[]	\N
6700	2022-02-19 13:27:46	2022-02-19 13:27:46	253	7.\tSouth Africa 1\tSouth Africa\t1:53.70	App\\Models\\RelayTeam	138	1	25	\N	11370	232	2	\N	[]	\N
6701	2022-02-19 13:27:46	2022-02-19 13:27:46	255	8.\tRB Echt 1\tRB Echt\t1:55.02	App\\Models\\RelayTeam	139	1	25	\N	11502	15	2	\N	[]	\N
6702	2022-02-19 13:27:46	2022-02-19 13:27:46	257	9.\tHong Kong Lifesaving team 1\tHong Kong Lifesaving team\t1:55.71	App\\Models\\RelayTeam	140	1	25	\N	11571	252	2	\N	[]	\N
6703	2022-02-19 13:27:46	2022-02-19 13:27:46	259	10.\tDordrecht Senioren\tRB Dordrecht\t1:58.11	App\\Models\\RelayTeam	141	1	25	\N	11811	13	2	\N	[]	\N
6704	2022-02-19 13:27:46	2022-02-19 13:27:46	261	11.\tBuchholz 2\tDLRG Buchholz e.V.\t1:59.76	App\\Models\\RelayTeam	142	1	25	\N	11976	234	2	\N	[]	\N
6705	2022-02-19 13:27:46	2022-02-19 13:27:46	263	12.\tRB Echt 1\tRB Echt\t1:59.86	App\\Models\\RelayTeam	139	1	25	\N	11986	15	2	\N	[]	\N
6706	2022-02-19 13:27:46	2022-02-19 13:27:46	265	13.\tDordrecht Junioren\tRB Dordrecht\t2:03.61	App\\Models\\RelayTeam	143	1	25	\N	12361	13	2	\N	[]	\N
6707	2022-02-19 13:27:46	2022-02-19 13:27:46	267	14.\tDLRG OG Stadtlohn e.V. 1\tDLRG OG Stadtlohn e.V.\t2:09.23	App\\Models\\RelayTeam	144	1	25	\N	12923	245	2	\N	[]	\N
6708	2022-02-19 13:27:46	2022-02-19 13:27:46	269	15.\tDLRG Haltern 1\tDLRG Haltern\t2:14.56	App\\Models\\RelayTeam	145	1	25	\N	13456	241	2	\N	[]	\N
6709	2022-02-19 13:27:46	2022-02-19 13:27:46	271	16.\tRB Staphorst 1\tRB Staphorst\t2:15.07	App\\Models\\RelayTeam	146	1	25	\N	13507	26	2	\N	[]	\N
6710	2022-02-19 13:27:46	2022-02-19 13:27:46	273	17.\tDordrecht Masters\tRB Dordrecht\t2:33.09	App\\Models\\RelayTeam	147	1	25	\N	15309	13	2	\N	[]	\N
6711	2022-02-19 13:27:46	2022-02-19 13:27:46	282	1.\tHong Kong Lifesaving team 1\tHong Kong Lifesaving team\t12.47	App\\Models\\RelayTeam	148	1	20	\N	1247	252	2	\N	[]	\N
6712	2022-02-19 13:27:46	2022-02-19 13:27:46	284	2.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t13.03	App\\Models\\RelayTeam	120	1	20	\N	1303	236	2	\N	[]	\N
6713	2022-02-19 13:27:46	2022-02-19 13:27:46	286	3.\tDordrecht Junioren\tRB Dordrecht\t13.10	App\\Models\\RelayTeam	125	1	20	\N	1310	13	2	\N	[]	\N
6714	2022-02-19 13:27:46	2022-02-19 13:27:46	288	4.\tNederland Senioren\tRB Dordrecht\t13.61	App\\Models\\RelayTeam	113	1	20	\N	1361	13	2	\N	[]	\N
6715	2022-02-19 13:27:46	2022-02-19 13:27:46	290	5.\tRB Gouda 2\tRB Gouda\t15.78	App\\Models\\RelayTeam	121	1	20	\N	1578	17	2	\N	[]	\N
6716	2022-02-19 13:27:46	2022-02-19 13:27:46	292	6.\tSA 2\tSouth Africa\t16.03	App\\Models\\RelayTeam	149	1	20	\N	1603	232	2	\N	[]	\N
6717	2022-02-19 13:27:46	2022-02-19 13:27:46	294	7.\tEnnigerloh\tDLRG Ennigerloh e.V.\t17.00	App\\Models\\RelayTeam	150	1	20	\N	1700	244	2	\N	[]	\N
6718	2022-02-19 13:27:46	2022-02-19 13:27:46	296	8.\tDLRG Schwerte 1\tDLRG Schwerte\t18.84	App\\Models\\RelayTeam	151	1	20	\N	1884	109	2	\N	[]	\N
6719	2022-02-19 13:27:46	2022-02-19 13:27:46	298	9.\tDLRG Haltern 1\tDLRG Haltern\t26.97	App\\Models\\RelayTeam	152	1	20	\N	2697	241	2	\N	[]	\N
6720	2022-02-19 13:27:46	2022-02-19 13:27:46	300	10.\tTeam Starfish senior\tStarfish SLC\t29.12	App\\Models\\RelayTeam	153	1	20	\N	2912	235	2	\N	[]	\N
6721	2022-02-19 13:27:46	2022-02-19 13:27:46	302	11.\tDordrecht Senioren\tRB Dordrecht\t29.41	App\\Models\\RelayTeam	116	1	20	\N	2941	13	2	\N	[]	\N
6722	2022-02-19 13:27:46	2022-02-19 13:27:46	304	12.\tRB Oss 1\tRB Oss\t35.16	App\\Models\\RelayTeam	154	1	20	\N	3516	43	2	\N	[]	\N
6723	2022-02-19 13:27:46	2022-02-19 13:27:46	306	13.\tRB Staphorst 1\tRB Staphorst\t36.94	App\\Models\\RelayTeam	130	1	20	\N	3694	26	2	\N	[]	\N
6724	2022-02-19 13:27:46	2022-02-19 13:27:46	308	14.\tOss Masters\tRB Oss\t42.00	App\\Models\\RelayTeam	155	1	20	\N	4200	43	2	\N	[]	\N
6725	2022-02-19 13:27:46	2022-02-19 13:27:46	310	DSQ\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t51	App\\Models\\RelayTeam	118	1	20	1	\N	239	2	\N	[]	\N
6726	2022-02-19 13:27:46	2022-02-19 13:27:46	313	sick\tRB Gouda 1\tRB Gouda	App\\Models\\RelayTeam	127	1	20	0	\N	17	2	\N	[]	\N
6727	2022-02-19 13:27:46	2022-02-19 13:27:46	314	OTL\tDLRG Ascheberg-Herbern 1\tDLRG Ascheberg-Herbern	App\\Models\\RelayTeam	124	1	20	3	\N	254	2	\N	[]	\N
6728	2022-02-19 13:27:46	2022-02-19 13:27:46	316	OTL\tDLRG Ascheberg-Herbern 2\tDLRG Ascheberg-Herbern	App\\Models\\RelayTeam	156	1	20	3	\N	254	2	\N	[]	\N
6729	2022-02-19 13:27:46	2022-02-19 13:27:46	318	OTL\tDLRG Duisburg-Homberg 1\tDLRG Duisburg-Homberg	App\\Models\\RelayTeam	129	1	20	3	\N	39	2	\N	[]	\N
6730	2022-02-19 13:27:46	2022-02-19 13:27:46	320	OTL\tKusel ChiXXX\tDLRG Kusel KiXX	App\\Models\\RelayTeam	128	1	20	3	\N	238	2	\N	[]	\N
6731	2022-02-19 13:27:46	2022-02-19 13:27:46	322	OTL\tItaly 1\tItaly	App\\Models\\RelayTeam	114	1	20	3	\N	1	2	\N	[]	\N
6732	2022-02-19 13:27:46	2022-02-19 13:27:46	324	OTL\tSouth Africa 1\tSouth Africa	App\\Models\\RelayTeam	115	1	20	3	\N	232	2	\N	[]	\N
6733	2022-02-19 13:27:46	2022-02-19 13:27:46	326	OTL\tSouth Africa 2\tSouth Africa	App\\Models\\RelayTeam	119	1	20	3	\N	232	2	\N	[]	\N
6734	2022-02-19 13:27:46	2022-02-19 13:27:46	328	OTL\tRB Echt 1\tRB Echt	App\\Models\\RelayTeam	157	1	20	3	\N	15	2	\N	[]	\N
6735	2022-02-19 13:27:46	2022-02-19 13:27:46	330	OTL\tDordrecht Masters\tRB Dordrecht	App\\Models\\RelayTeam	131	1	20	3	\N	13	2	\N	[]	\N
6736	2022-02-19 13:27:46	2022-02-19 13:27:46	337	OTL\tRB Heythuysen 1\tRB Heythuysen	App\\Models\\RelayTeam	122	1	20	3	\N	237	2	\N	[]	\N
6737	2022-02-19 13:27:46	2022-02-19 13:27:46	339	OTL\tRB Heythuysen 2\tRB Heythuysen	App\\Models\\RelayTeam	158	1	20	3	\N	237	2	\N	[]	\N
6738	2022-02-19 13:27:46	2022-02-19 13:27:46	341	OTL\tRB Gouda 3\tRB Gouda	App\\Models\\RelayTeam	159	1	20	3	\N	17	2	\N	[]	\N
6739	2022-02-19 13:27:46	2022-02-19 13:27:46	343	OTL\tRB Oss 2\tRB Oss	App\\Models\\RelayTeam	160	1	20	3	\N	43	2	\N	[]	\N
6740	2022-02-19 13:27:46	2022-02-19 13:27:46	345	OTL\tTeam Starfish junior 2\tStarfish SLC	App\\Models\\RelayTeam	161	1	20	3	\N	235	2	\N	[]	\N
6741	2022-02-19 13:27:46	2022-02-19 13:27:46	347	OTL\tRB Staphorst 2\tRB Staphorst	App\\Models\\RelayTeam	162	1	20	3	\N	26	2	\N	[]	\N
6742	2022-02-19 13:27:46	2022-02-19 13:27:46	352	1.\tHong Kong Lifesaving team 1\tHong Kong Lifesaving team\t9.94	App\\Models\\RelayTeam	140	1	20	\N	994	252	2	\N	[]	\N
6743	2022-02-19 13:27:46	2022-02-19 13:27:46	354	2.\tDLRG Schwerte 1\tDLRG Schwerte\t12.38	App\\Models\\RelayTeam	163	1	20	\N	1238	109	2	\N	[]	\N
6744	2022-02-19 13:27:46	2022-02-19 13:27:46	355	3.\tSouth Africa 1\tSouth Africa\t12.55	App\\Models\\RelayTeam	138	1	20	\N	1255	232	2	\N	[]	\N
21148	2022-03-25 17:44:40	2022-03-25 17:44:40	2251	27.\tCIRILLI, Gabriele\t05\tIn Sport Rane Rosse\t55.97	App\\Models\\Athlete	1157	11	4	\N	5597	3208	12	12	[]	\N
7582	2022-02-19 13:27:51	2022-02-19 13:27:51	1642	30.\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg\t2:51.26	App\\Models\\Athlete	539	1	6	\N	17126	39	2	8	[]	\N
7583	2022-02-19 13:27:51	2022-02-19 13:27:51	1643	31.\tALINK, Nick\t95\tNL Defensie Lifesaving\t2:53.22	App\\Models\\Athlete	536	1	6	\N	17322	239	2	8	[]	\N
7584	2022-02-19 13:27:51	2022-02-19 13:27:51	1644	32.\tDE REUVER, Tim\t99\tRB Oss\t2:55.91	App\\Models\\Athlete	150	1	6	\N	17591	43	2	8	[]	\N
21149	2022-03-25 17:44:40	2022-03-25 17:44:40	2252	28.\tKUIPHOF, Robin\t03\tRB Dordrecht\t56.13	App\\Models\\Athlete	737	11	4	\N	5613	13	12	12	[]	\N
7585	2022-02-19 13:27:51	2022-02-19 13:27:51	1645	33.\tDEENEN, Jesse\t97\tRB Boxtel\t3:07.76	App\\Models\\Athlete	600	1	6	\N	18776	122	2	8	[]	\N
7586	2022-02-19 13:27:51	2022-02-19 13:27:51	1646	DSQ\tIPPOLITO, Francesco\t96\tGorizia Nuoto Asd	App\\Models\\Athlete	442	1	6	1	\N	231	2	8	[]	\N
7587	2022-02-19 13:27:51	2022-02-19 13:27:51	1648	DSQ\tGELLEKOM, Jeroen\t99\tRB Echt	App\\Models\\Athlete	750	1	6	1	\N	15	2	8	[]	\N
7588	2022-02-19 13:27:51	2022-02-19 13:27:51	1651	sick\tGAYASHAN, Aliya Kavindu\t93\tDolphin Aquatic Club	App\\Models\\Athlete	782	1	6	0	\N	263	2	8	[]	\N
21150	2022-03-25 17:44:40	2022-03-25 17:44:40	2253	29.\tFERRARO, Francesco\t06\tIn Sport Rane Rosse\t56.27	App\\Models\\Athlete	1152	11	4	\N	5627	3208	12	12	[]	\N
7589	2022-02-19 13:27:51	2022-02-19 13:27:51	1653	1.\tDE KNOOP, Bastiaan\t86\tRB Gouda\t2:37.19	App\\Models\\Athlete	166	1	6	\N	15719	17	2	9	[]	\N
7590	2022-02-19 13:27:51	2022-02-19 13:27:51	1654	2.\tFREY, Max\t86\tDLRG Buchholz e.V.\t2:43.70	App\\Models\\Athlete	463	1	6	\N	16370	234	2	9	[]	\N
7591	2022-02-19 13:27:51	2022-02-19 13:27:51	1655	3.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t3:37.17	App\\Models\\Athlete	579	1	6	\N	21717	22	2	9	[]	\N
7592	2022-02-19 13:27:51	2022-02-19 13:27:51	1656	4.\tSHINN, Ryan\t80\tRB Amersfoort\t4:00.69	App\\Models\\Athlete	171	1	6	\N	24069	22	2	9	[]	\N
7593	2022-02-19 13:27:51	2022-02-19 13:27:51	1657	DSQ\tVAN LUIJTELAAR, Pieter\t83\tRB Boxtel	App\\Models\\Athlete	578	1	6	1	\N	122	2	9	[]	\N
21151	2022-03-25 17:44:40	2022-03-25 17:44:40	2254	30.\tCROES, Matisse\t06\tSint-Truidense RC\t56.61	App\\Models\\Athlete	1112	11	4	\N	5661	3214	12	12	[]	\N
7594	2022-02-19 13:27:51	2022-02-19 13:27:51	1661	1.\tVAN GRIEKEN, Wim\t69\tRB Gouda\t2:56.17	App\\Models\\Athlete	176	1	6	\N	17617	17	2	11	[]	\N
7595	2022-02-19 13:27:51	2022-02-19 13:27:51	1662	2.\tVAN DE GOOR, Guus\t77\tRB Echt\t2:56.68	App\\Models\\Athlete	174	1	6	\N	17668	15	2	11	[]	\N
7596	2022-02-19 13:27:51	2022-02-19 13:27:51	1663	3.\tROEMEN, Sven\t70\tRB Echt\t2:57.58	App\\Models\\Athlete	173	1	6	\N	17758	15	2	11	[]	\N
21152	2022-03-25 17:44:40	2022-03-25 17:44:40	2255	31.\tMADRZAK, Milosz\t05\tCKS Szczecin\t56.97	App\\Models\\Athlete	833	11	4	\N	5697	3227	12	12	[]	\N
7597	2022-02-19 13:27:51	2022-02-19 13:27:51	1664	4.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t3:27.62	App\\Models\\Athlete	179	1	6	\N	20762	13	2	11	[]	\N
7598	2022-02-19 13:27:51	2022-02-19 13:27:51	1665	sick\tDEN BOEF, Alex\t71\tRB Dordrecht	App\\Models\\Athlete	553	1	6	0	\N	13	2	11	[]	\N
7599	2022-02-19 13:27:51	2022-02-19 13:27:51	1667	1.\tVAN DAALEN, Erik\t65\tRB Dordrecht\t2:59.16	App\\Models\\Athlete	175	1	6	\N	17916	13	2	10	[]	\N
7600	2022-02-19 13:27:51	2022-02-19 13:27:51	1668	2.\tPRAET, Piet\t56\tRB Dordrecht\t3:35.25	App\\Models\\Athlete	693	1	6	\N	21525	13	2	10	[]	\N
21153	2022-03-25 17:44:40	2022-03-25 17:44:40	2256	32.\tWROBEL, Igor\t03\tSlaskie WOPR\t57.82	App\\Models\\Athlete	1125	11	4	\N	5782	3211	12	12	[]	\N
7601	2022-02-19 13:27:51	2022-02-19 13:27:51	1669	3.\tBEZEMER, Dennis\t68\tRB Dordrecht\t3:43.92	App\\Models\\Athlete	467	1	6	\N	22392	13	2	10	[]	\N
7602	2022-02-19 13:27:51	2022-02-19 13:27:51	1670	4.\tLEIJTEN, Jan\t54\tRB Weert\t4:27.88	App\\Models\\Athlete	468	1	6	\N	26788	12	2	10	[]	\N
7603	2022-02-19 13:27:51	2022-02-19 13:27:51	1671	5.\tVAN DAM, Robert\t66\tRB Gouda\t4:32.67	App\\Models\\Athlete	557	1	6	\N	27267	17	2	10	[]	\N
7604	2022-02-19 13:27:51	2022-02-19 13:27:51	1672	sick\tBRINK, Jan\t62\tRB Dordrecht	App\\Models\\Athlete	783	1	6	0	\N	13	2	10	[]	\N
21154	2022-03-25 17:44:40	2022-03-25 17:44:40	2257	33.\tROSOLEN, Loris\t05\tLiege Sauvetage Club\t58.14	App\\Models\\Athlete	1109	11	4	\N	5814	3238	12	12	[]	\N
7605	2022-02-19 13:27:51	2022-02-19 13:27:51	1673	sick\tVAN KIMMENADE, Huub\t56\tRB Weert	App\\Models\\Athlete	556	1	6	0	\N	12	2	10	[]	\N
7606	2022-02-19 13:27:51	2022-02-19 13:27:51	1674	sick\tDE REUVER, Erik\t67\tRB Oss	App\\Models\\Athlete	775	1	6	0	\N	43	2	10	[]	\N
21155	2022-03-25 17:44:40	2022-03-25 17:44:40	2258	34.\tCZERW, Szymon\t05\tMKS Szczecin\t58.29	App\\Models\\Athlete	1181	11	4	\N	5829	3236	12	12	[]	\N
21156	2022-03-25 17:44:40	2022-03-25 17:44:40	2259	35.\tLO BUE, Tommaso\t06\tAthena Bracciano\t58.51	App\\Models\\Athlete	1110	11	4	\N	5851	3210	12	12	[]	\N
21157	2022-03-25 17:44:40	2022-03-25 17:44:40	2260	36.\tVANLAER, Mathijs\t06\tSint-Truidense RC\t58.92	App\\Models\\Athlete	1182	11	4	\N	5892	3214	12	12	[]	\N
21158	2022-03-25 17:44:40	2022-03-25 17:44:40	2261	37.\tCHRISTEL, Torge\t03\tDLRG Nordrhein-Westfalen\t59.05	App\\Models\\Athlete	1183	11	4	\N	5905	3219	12	12	[]	\N
21159	2022-03-25 17:44:40	2022-03-25 17:44:40	2262	38.\tABBEEL, Stef\t05\tVZW Vrije Zwemmers Wenduine-De Haan\t59.06	App\\Models\\Athlete	1099	11	4	\N	5906	3244	12	12	[]	\N
21160	2022-03-25 17:44:40	2022-03-25 17:44:40	2263	39.\tBERNACCHIA, Paolo\t03\tAccademia Di Salvamento\t59.32	App\\Models\\Athlete	1105	11	4	\N	5932	3203	12	12	[]	\N
21161	2022-03-25 17:44:40	2022-03-25 17:44:40	2264	40.\tVAN OEVELEN, Wout\t04\tRB Delft\t59.65	App\\Models\\Athlete	1184	11	4	\N	5965	3221	12	12	[]	\N
21162	2022-03-25 17:44:40	2022-03-25 17:44:40	2265	41.\tBANARI, Andrea\t06\tAthena Bracciano\t59.87	App\\Models\\Athlete	1185	11	4	\N	5987	3210	12	12	[]	\N
6745	2022-02-19 13:27:46	2022-02-19 13:27:46	357	4.\tTeam Starfish junior\tStarfish SLC\t13.43	App\\Models\\RelayTeam	164	1	20	\N	1343	235	2	\N	[]	\N
6746	2022-02-19 13:27:46	2022-02-19 13:27:46	359	5.\tDordrecht Senioren\tRB Dordrecht\t14.13	App\\Models\\RelayTeam	141	1	20	\N	1413	13	2	\N	[]	\N
6747	2022-02-19 13:27:46	2022-02-19 13:27:46	361	6.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t14.85	App\\Models\\RelayTeam	137	1	20	\N	1485	236	2	\N	[]	\N
6748	2022-02-19 13:27:46	2022-02-19 13:27:46	363	7.\tRB Echt 1\tRB Echt\t14.91	App\\Models\\RelayTeam	139	1	20	\N	1491	15	2	\N	[]	\N
6749	2022-02-19 13:27:46	2022-02-19 13:27:46	365	8.\tNederland Senioren\tRB Dordrecht\t17.37	App\\Models\\RelayTeam	134	1	20	\N	1737	13	2	\N	[]	\N
6750	2022-02-19 13:27:46	2022-02-19 13:27:46	367	9.\tKusel DiXXX\tDLRG Kusel KiXX\t18.90	App\\Models\\RelayTeam	165	1	20	\N	1890	238	2	\N	[]	\N
6751	2022-02-19 13:27:46	2022-02-19 13:27:46	369	10.\tDLRG OG Stadtlohn e.V. 3\tDLRG OG Stadtlohn e.V.\t19.03	App\\Models\\RelayTeam	166	1	20	\N	1903	245	2	\N	[]	\N
6752	2022-02-19 13:27:46	2022-02-19 13:27:46	371	11.\tDLRG Goslar 1\tDLRG Goslar\t21.22	App\\Models\\RelayTeam	136	1	20	\N	2122	246	2	\N	[]	\N
6753	2022-02-19 13:27:46	2022-02-19 13:27:46	373	12.\tRB Gouda 2\tRB Gouda\t21.78	App\\Models\\RelayTeam	167	1	20	\N	2178	17	2	\N	[]	\N
6754	2022-02-19 13:27:46	2022-02-19 13:27:46	375	13.\tRB Gouda 1\tRB Gouda\t22.86	App\\Models\\RelayTeam	168	1	20	\N	2286	17	2	\N	[]	\N
6755	2022-02-19 13:27:46	2022-02-19 13:27:46	377	14.\tRB Staphorst 1\tRB Staphorst\t23.13	App\\Models\\RelayTeam	146	1	20	\N	2313	26	2	\N	[]	\N
6756	2022-02-19 13:27:46	2022-02-19 13:27:46	379	15.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t23.37	App\\Models\\RelayTeam	135	1	20	\N	2337	239	2	\N	[]	\N
6757	2022-02-19 13:27:46	2022-02-19 13:27:46	381	16.\tSA 2\tSouth Africa\t23.81	App\\Models\\RelayTeam	169	1	20	\N	2381	232	2	\N	[]	\N
6758	2022-02-19 13:27:46	2022-02-19 13:27:46	388	17.\tGorizia Nuoto Asd 1\tGorizia Nuoto Asd\t24.44	App\\Models\\RelayTeam	133	1	20	\N	2444	231	2	\N	[]	\N
6759	2022-02-19 13:27:46	2022-02-19 13:27:46	390	18.\tRB Gouda 3\tRB Gouda\t25.29	App\\Models\\RelayTeam	170	1	20	\N	2529	17	2	\N	[]	\N
6760	2022-02-19 13:27:46	2022-02-19 13:27:46	392	19.\tItaly 1\tItaly\t39.12	App\\Models\\RelayTeam	132	1	20	\N	3912	1	2	\N	[]	\N
6761	2022-02-19 13:27:46	2022-02-19 13:27:46	394	20.\tBuchholz 2\tDLRG Buchholz e.V.\t39.44	App\\Models\\RelayTeam	142	1	20	\N	3944	234	2	\N	[]	\N
6762	2022-02-19 13:27:46	2022-02-19 13:27:46	396	21.\tRB Echt 1\tRB Echt\t39.75	App\\Models\\RelayTeam	139	1	20	\N	3975	15	2	\N	[]	\N
6763	2022-02-19 13:27:46	2022-02-19 13:27:46	398	22.\tRB Staphorst 2\tRB Staphorst\t40.19	App\\Models\\RelayTeam	171	1	20	\N	4019	26	2	\N	[]	\N
6764	2022-02-19 13:27:46	2022-02-19 13:27:46	400	DSQ\tRB Echt 1\tRB Echt	App\\Models\\RelayTeam	139	1	20	1	\N	15	2	\N	[]	\N
6765	2022-02-19 13:27:46	2022-02-19 13:27:46	403	OTL\tDLRG Haltern 1\tDLRG Haltern	App\\Models\\RelayTeam	145	1	20	3	\N	241	2	\N	[]	\N
6766	2022-02-19 13:27:46	2022-02-19 13:27:46	405	OTL\tDLRG Haltern 1\tDLRG Haltern	App\\Models\\RelayTeam	145	1	20	3	\N	241	2	\N	[]	\N
6767	2022-02-19 13:27:46	2022-02-19 13:27:46	407	OTL\tDordrecht Junioren\tRB Dordrecht	App\\Models\\RelayTeam	143	1	20	3	\N	13	2	\N	[]	\N
6768	2022-02-19 13:27:46	2022-02-19 13:27:46	409	OTL\tDordrecht Masters\tRB Dordrecht	App\\Models\\RelayTeam	147	1	20	3	\N	13	2	\N	[]	\N
6769	2022-02-19 13:27:46	2022-02-19 13:27:46	415	1.\tEGUILUZ DE CELIS, Paola\t01\tNoja-Playa Dorada\t1:03.37	App\\Models\\Athlete	694	1	5	\N	6337	255	2	7	[]	\N
6770	2022-02-19 13:27:46	2022-02-19 13:27:46	416	2.\tBAKKER, Myrthe\t00\tRB Dordrecht\t1:04.28	App\\Models\\Athlete	423	1	5	\N	6428	13	2	7	[]	\N
6771	2022-02-19 13:27:46	2022-02-19 13:27:46	417	3.\tACEBO MONCALIA, Eugenia\t00\tNoja-Playa Dorada\t1:05.62	App\\Models\\Athlete	695	1	5	\N	6562	255	2	7	[]	\N
6772	2022-02-19 13:27:46	2022-02-19 13:27:46	418	4.\tLOCCHI, Alessia\t00\tSergio De Gregorio\t1:06.37	App\\Models\\Athlete	696	1	5	\N	6637	256	2	7	[]	\N
6773	2022-02-19 13:27:46	2022-02-19 13:27:46	419	5.\tVAN DEN BERG, Sulinke\t02\tSouth Africa\t1:07.64	App\\Models\\Athlete	697	1	5	\N	6764	232	2	7	[]	\N
6774	2022-02-19 13:27:46	2022-02-19 13:27:46	420	6.\tSCHREIBER, Johanna\t01\tDLRG Kelkheim\t1:09.22	App\\Models\\Athlete	11	1	5	\N	6922	253	2	7	[]	\N
6775	2022-02-19 13:27:46	2022-02-19 13:27:46	421	7.\tDREDGE, Deborah\t02\tSouth Africa\t1:09.35	App\\Models\\Athlete	698	1	5	\N	6935	232	2	7	[]	\N
6776	2022-02-19 13:27:46	2022-02-19 13:27:46	422	8.\tWOLFS, Sharon\t00\tRB Heythuysen\t1:10.08	App\\Models\\Athlete	430	1	5	\N	7008	237	2	7	[]	\N
6777	2022-02-19 13:27:46	2022-02-19 13:27:46	423	9.\tATRES, Leonie\t00\tRB Gouda\t1:11.40	App\\Models\\Athlete	502	1	5	\N	7140	17	2	7	[]	\N
6778	2022-02-19 13:27:46	2022-02-19 13:27:46	424	10.\tKLOMP, Danique\t02\tRB Weert\t1:11.46	App\\Models\\Athlete	19	1	5	\N	7146	12	2	7	[]	\N
6779	2022-02-19 13:27:46	2022-02-19 13:27:46	425	11.\tHOELSCHER, Louisa\t03\tDLRG Ascheberg-Herbern\t1:12.12	App\\Models\\Athlete	699	1	5	\N	7212	254	2	7	[]	\N
6780	2022-02-19 13:27:46	2022-02-19 13:27:46	426	12.\tVAN BEBBER, Danique\t00\tRB Heythuysen\t1:12.32	App\\Models\\Athlete	621	1	5	\N	7232	237	2	7	[]	\N
6781	2022-02-19 13:27:46	2022-02-19 13:27:46	427	13.\tLILLEBO SLETTEN, Ida\t01\tStarfish SLC\t1:13.28	App\\Models\\Athlete	398	1	5	\N	7328	235	2	7	[]	\N
6782	2022-02-19 13:27:46	2022-02-19 13:27:46	428	14.\tJACOBS, Inge\t00\tRB Heythuysen\t1:13.72	App\\Models\\Athlete	436	1	5	\N	7372	237	2	7	[]	\N
6783	2022-02-19 13:27:46	2022-02-19 13:27:46	429	15.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg\t1:13.91	App\\Models\\Athlete	108	1	5	\N	7391	39	2	7	[]	\N
6784	2022-02-19 13:27:46	2022-02-19 13:27:46	430	16.\tOPPERMAN, Bianca\t02\tSouth Africa\t1:14.86	App\\Models\\Athlete	612	1	5	\N	7486	232	2	7	[]	\N
21163	2022-03-25 17:44:40	2022-03-25 17:44:40	2266	42.\tVINZ, Maximilian\t05\tDLRG Sachsen-Anhalt\t59.95	App\\Models\\Athlete	1107	11	4	\N	5995	3209	12	12	[]	\N
21164	2022-03-25 17:44:40	2022-03-25 17:44:40	2267	43.\tJACOBS, Rick\t05\tRB Echt\t1:00.45	App\\Models\\Athlete	1131	11	4	\N	6045	15	12	12	[]	\N
21165	2022-03-25 17:44:40	2022-03-25 17:44:40	2268	44.\tCOPPOLA, Vincenzo\t03\tAthena Salvamento\t1:01.11	App\\Models\\Athlete	1129	11	4	\N	6111	3213	12	12	[]	\N
21166	2022-03-25 17:44:40	2022-03-25 17:44:40	2269	45.\tKURZAK, Kamil\t04\tSlaskie WOPR\t1:01.20	App\\Models\\Athlete	1155	11	4	\N	6120	3211	12	12	[]	\N
21167	2022-03-25 17:44:40	2022-03-25 17:44:40	2270	46.\tROEMEN, Yves\t06\tRB Echt\t1:02.18	App\\Models\\Athlete	1132	11	4	\N	6218	15	12	12	[]	\N
21168	2022-03-25 17:44:40	2022-03-25 17:44:40	2271	47.\tFERRAGOSTO, Paolo\t03\tSDS - Specialisti dello Sport \t1:02.63	App\\Models\\Athlete	838	11	4	\N	6263	3228	12	12	[]	\N
21169	2022-03-25 17:44:40	2022-03-25 17:44:40	2272	48.\tVAN BEEK, Jason\t04\tRB Echt\t1:03.07	App\\Models\\Athlete	1111	11	4	\N	6307	15	12	12	[]	\N
21170	2022-03-25 17:44:40	2022-03-25 17:44:40	2273	49.\tDICKE, Henrik\t03\tDLRG Nordrhein-Westfalen\t1:03.41	App\\Models\\Athlete	1186	11	4	\N	6341	3219	12	12	[]	\N
21171	2022-03-25 17:44:40	2022-03-25 17:44:41	2274	50.\tVERFUERTH, Johannes\t05\tDLRG Nordrhein-Westfalen\t1:03.76	App\\Models\\Athlete	1187	11	4	\N	6376	3219	12	12	[]	\N
21172	2022-03-25 17:44:41	2022-03-25 17:44:41	2275	51.\tREINKE, Johann\t06\tDLRG Niedersachsen\t1:03.84	App\\Models\\Athlete	1134	11	4	\N	6384	3212	12	12	[]	\N
21173	2022-03-25 17:44:41	2022-03-25 17:44:41	2340	28.\tWILMOTS, Robbe\t00\tRctal\t53.98	App\\Models\\Athlete	1046	11	4	\N	5398	3217	12	13	[]	\N
21174	2022-03-25 17:44:41	2022-03-25 17:44:41	2341	29.\tFELICIANGELI, Flavio\t00\tAccademia Di Salvamento\t54.02	App\\Models\\Athlete	451	11	4	\N	5402	3203	12	13	[]	\N
21175	2022-03-25 17:44:41	2022-03-25 17:44:41	2342	30.\tCRESCIMBENI, Andrea\t01\tAthena Salvamento\t55.04	App\\Models\\Athlete	1173	11	4	\N	5504	3213	12	13	[]	\N
21176	2022-03-25 17:44:41	2022-03-25 17:44:41	2343	31.\tCUGLIARI, Matteo\t95\tAthena Bracciano\t55.85	App\\Models\\Athlete	847	11	4	\N	5585	3210	12	13	[]	\N
21177	2022-03-25 17:44:41	2022-03-25 17:44:41	2344	32.\tSCHLEICH, Sandro\t01\tSLRG Innerschwyz\t55.92	App\\Models\\Athlete	843	11	4	\N	5592	243	12	13	[]	\N
21178	2022-03-25 17:44:41	2022-03-25 17:44:41	2345	33.\tMUELLER, Luca\t00\tDLRG Guetersloh\t56.21	App\\Models\\Athlete	1188	11	4	\N	5621	3220	12	13	[]	\N
21179	2022-03-25 17:44:41	2022-03-25 17:44:41	2346	34.\tSICURO, Frederick\t01\tASD Gorizia Nuoto\t56.27	App\\Models\\Athlete	1162	11	4	\N	5627	3224	12	13	[]	\N
21180	2022-03-25 17:44:41	2022-03-25 17:44:41	2347	35.\tMIGLIORELLI, Davide\t01\tAthena Salvamento\t57.32	App\\Models\\Athlete	845	11	4	\N	5732	3213	12	13	[]	\N
21181	2022-03-25 17:44:41	2022-03-25 17:44:41	2348	36.\tMELVIN, Jonas\t97\tDLRG Buchholz United\t57.46	App\\Models\\Athlete	850	11	4	\N	5746	3230	12	13	[]	\N
21182	2022-03-25 17:44:41	2022-03-25 17:44:41	2349	37.\tWHEELER, Ryan\t95\tBeacon Lifesaving Club\t57.57	App\\Models\\Athlete	854	11	4	\N	5757	3240	12	13	[]	\N
21183	2022-03-25 17:44:41	2022-03-25 17:44:41	2350	38.\tPENNESI, Matteo\t95\tAthena Salvamento\t57.59	App\\Models\\Athlete	1168	11	4	\N	5759	3213	12	13	[]	\N
21184	2022-03-25 17:44:41	2022-03-25 17:44:41	2351	39.\tOMERO, Lorenzo\t02\tA.S.D. Sportiva Sturla\t57.71	App\\Models\\Athlete	1189	11	4	\N	5771	3235	12	13	[]	\N
21185	2022-03-25 17:44:41	2022-03-25 17:44:41	2352	40.\tDE REUVER, Tim\t99\tRB Oss\t58.26	App\\Models\\Athlete	150	11	4	\N	5826	43	12	13	[]	\N
21186	2022-03-25 17:44:41	2022-03-25 17:44:41	2353	41.\tMEERTEN, John\t97\tRB Echt\t58.34	App\\Models\\Athlete	154	11	4	\N	5834	15	12	13	[]	\N
21187	2022-03-25 17:44:41	2022-03-25 17:44:41	2354	42.\tBRINK, Guido\t02\tRB Vlissingen\t58.35	App\\Models\\Athlete	848	11	4	\N	5835	248	12	13	[]	\N
21188	2022-03-25 17:44:41	2022-03-25 17:44:41	2355	43.\tVERHOEF, Jop\t02\tRB Dordrecht\t58.49	App\\Models\\Athlete	740	11	4	\N	5849	13	12	13	[]	\N
21189	2022-03-25 17:44:41	2022-03-25 17:44:41	2356	44.\tTAUBE, Patrick\t02\tDLRG Niedersachsen\t59.49	App\\Models\\Athlete	1049	11	4	\N	5949	3212	12	13	[]	\N
21190	2022-03-25 17:44:41	2022-03-25 17:44:41	2357	45.\tHOBBEL, Kevin\t97\tRB Echt\t1:00.75	App\\Models\\Athlete	149	11	4	\N	6075	15	12	13	[]	\N
21191	2022-03-25 17:44:41	2022-03-25 17:44:41	2358	46.\tVAN DEN AKKER, Tom\t02\tRB Echt\t1:00.80	App\\Models\\Athlete	651	11	4	\N	6080	15	12	13	[]	\N
21192	2022-03-25 17:44:41	2022-03-25 17:44:41	2359	47.\tVAN DAM, Reinier\t95\tRB Gouda\t1:00.88	App\\Models\\Athlete	576	11	4	\N	6088	17	12	13	[]	\N
21193	2022-03-25 17:44:41	2022-03-25 17:44:41	2360	48.\tCOSTANZA, Tiziano\t01\tAthena Salvamento\t1:02.14	App\\Models\\Athlete	1172	11	4	\N	6214	3213	12	13	[]	\N
21194	2022-03-25 17:44:41	2022-03-25 17:44:41	2361	49.\tDE REUVER, Bas\t01\tRB Oss\t1:02.42	App\\Models\\Athlete	780	11	4	\N	6242	43	12	13	[]	\N
21195	2022-03-25 17:44:41	2022-03-25 17:44:41	2362	50.\tDEENEN, Jesse\t97\tRB Boxtel\t1:20.91	App\\Models\\Athlete	600	11	4	\N	8091	122	12	13	[]	\N
21196	2022-03-25 17:44:41	2022-03-25 17:44:41	2363	51.\tVERSPAGEN, Harry\t01\tRB Weert\t1:27.50	App\\Models\\Athlete	852	11	4	\N	8750	12	12	13	[]	\N
21197	2022-03-25 17:44:41	2022-03-25 17:44:41	2364	DNS\tIACONI, Nicolo\t02\tASD Rosetana Nuoto	App\\Models\\Athlete	1114	11	4	2	\N	3215	12	13	[]	\N
21198	2022-03-25 17:44:41	2022-03-25 17:44:41	2365	DNS\tWENGER, Lars-Erik\t97\tDLRG Luckenwalde	App\\Models\\Athlete	1160	11	4	2	\N	3225	12	13	[]	\N
21199	2022-03-25 17:44:41	2022-03-25 17:44:41	2366	DNS\tVAN DE BAAN, Koen\t00\tRB Delft	App\\Models\\Athlete	1144	11	4	2	\N	3221	12	13	[]	\N
21200	2022-03-25 17:44:41	2022-03-25 17:44:41	2367	DNS\tBANGMA, Jur\t01\tRB Delft	App\\Models\\Athlete	1145	11	4	2	\N	3221	12	13	[]	\N
21201	2022-03-25 17:44:41	2022-03-25 17:44:41	2368	WDR\tMEERTEN, Luuk\t99\tRB Echt	App\\Models\\Athlete	540	11	4	0	\N	15	12	13	[]	\N
21202	2022-03-25 17:44:41	2022-03-25 17:44:41	2369	WDR\tVOS, Bram\t94\tRB Boxtel	App\\Models\\Athlete	1175	11	4	0	\N	122	12	13	[]	\N
21203	2022-03-25 17:44:41	2022-03-25 17:44:41	2371	1.\tSZURMIEJ, Mateusz\t85\tPolen NT\t50.63	App\\Models\\Athlete	1116	11	4	\N	5063	3234	12	14	[]	\N
21204	2022-03-25 17:44:41	2022-03-25 17:44:41	2372	2.\tFREY, Max\t86\tDLRG Buchholz United\t55.96	App\\Models\\Athlete	463	11	4	\N	5596	3230	12	14	[]	\N
21205	2022-03-25 17:44:41	2022-03-25 17:44:41	2373	3.\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg \t1:01.70	App\\Models\\Athlete	539	11	4	\N	6170	39	12	14	[]	\N
21206	2022-03-25 17:44:41	2022-03-25 17:44:41	2374	4.\tVAN DE RIET, Stefan\t84\tRB Delft\t1:02.25	App\\Models\\Athlete	168	11	4	\N	6225	3221	12	14	[]	\N
21207	2022-03-25 17:44:41	2022-03-25 17:44:41	2375	5.\tVAN DER WIJST, Frank\t90\tRB Oss\t1:04.67	App\\Models\\Athlete	1176	11	4	\N	6467	43	12	14	[]	\N
21208	2022-03-25 17:44:41	2022-03-25 17:44:41	2376	6.\tVAN LUIJTELAAR, Pieter\t83\tRB Boxtel\t1:05.00	App\\Models\\Athlete	578	11	4	\N	6500	122	12	14	[]	\N
21209	2022-03-25 17:44:41	2022-03-25 17:44:41	2377	7.\tKUEHN, Martijn\t83\tRB Gouda\t1:12.02	App\\Models\\Athlete	170	11	4	\N	7202	17	12	14	[]	\N
21210	2022-03-25 17:44:41	2022-03-25 17:44:41	2378	8.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t1:14.60	App\\Models\\Athlete	579	11	4	\N	7460	22	12	14	[]	\N
21211	2022-03-25 17:44:41	2022-03-25 17:44:41	2380	1.\tVAN DER MEER, Vincent\t79\tRB Delft\t1:04.64	App\\Models\\Athlete	464	11	4	\N	6464	3221	12	15	[]	\N
21212	2022-03-25 17:44:41	2022-03-25 17:44:41	2381	2.\tVAN DE GOOR, Guus\t77\tRB Echt\t1:07.44	App\\Models\\Athlete	174	11	4	\N	6744	15	12	15	[]	\N
21213	2022-03-25 17:44:41	2022-03-25 17:44:41	2382	3.\tBROWNE, David\t72\tSt. John Berchmans Life Saving Club\t1:15.08	App\\Models\\Athlete	1052	11	4	\N	7508	3242	12	15	[]	\N
21214	2022-03-25 17:44:41	2022-03-25 17:44:41	2383	4.\tBASTURK, Burak\t72\tLiege Sauvetage Club\t1:15.74	App\\Models\\Athlete	1117	11	4	\N	7574	3238	12	15	[]	\N
21215	2022-03-25 17:44:41	2022-03-25 17:44:41	2384	DNS\tSHINN, Ryan\t80\tRB Amersfoort	App\\Models\\Athlete	171	11	4	2	\N	22	12	15	[]	\N
21216	2022-03-25 17:44:41	2022-03-25 17:44:41	2386	1.\tENGELHARDT, Stefan\t66\tDLRG Alpen\t1:01.58	App\\Models\\Athlete	555	11	4	\N	6158	261	12	16	[]	\N
21217	2022-03-25 17:44:41	2022-03-25 17:44:41	2387	2.\tROEMEN, Sven\t70\tRB Echt\t1:05.47	App\\Models\\Athlete	173	11	4	\N	6547	15	12	16	[]	\N
21218	2022-03-25 17:44:41	2022-03-25 17:44:41	2388	3.\tVAN DAALEN, Erik\t65\tRB Gouda\t1:08.66	App\\Models\\Athlete	175	11	4	\N	6866	17	12	16	[]	\N
21219	2022-03-25 17:44:41	2022-03-25 17:44:41	2389	4.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t1:17.87	App\\Models\\Athlete	179	11	4	\N	7787	13	12	16	[]	\N
21220	2022-03-25 17:44:41	2022-03-25 17:44:41	2390	5.\tPRAET, Piet\t56\tRB Dordrecht\t1:18.83	App\\Models\\Athlete	693	11	4	\N	7883	13	12	16	[]	\N
6785	2022-02-19 13:27:46	2022-02-19 13:27:46	431	17.\tPIETERSE, Zanri\t01\tSouth Africa\t1:15.13	App\\Models\\Athlete	614	1	5	\N	7513	232	2	7	[]	\N
6786	2022-02-19 13:27:46	2022-02-19 13:27:46	432	18.\tBRINK, Celine\t00\tRB Dordrecht\t1:15.35	App\\Models\\Athlete	94	1	5	\N	7535	13	2	7	[]	\N
6787	2022-02-19 13:27:46	2022-02-19 13:27:46	433	19.\tSMIT, Carli\t02\tSouth Africa\t1:15.77	App\\Models\\Athlete	617	1	5	\N	7577	232	2	7	[]	\N
6788	2022-02-19 13:27:46	2022-02-19 13:27:46	434	20.\tVAN LOON, Isabel\t02\tRB Gouda\t1:15.78	App\\Models\\Athlete	28	1	5	\N	7578	17	2	7	[]	\N
6789	2022-02-19 13:27:46	2022-02-19 13:27:46	435	21.\tSTOKBROECKX, Selina\t03\tRB Heythuysen\t1:16.04	App\\Models\\Athlete	405	1	5	\N	7604	237	2	7	[]	\N
6790	2022-02-19 13:27:46	2022-02-19 13:27:46	441	22.\tDEN BOEF, Abigail\t02\tRB Dordrecht\t1:16.91	App\\Models\\Athlete	25	1	5	\N	7691	13	2	7	[]	\N
6791	2022-02-19 13:27:46	2022-02-19 13:27:46	442	23.\tVAN RENSBURG, Dehanke\t01\tSouth Africa\t1:17.36	App\\Models\\Athlete	613	1	5	\N	7736	232	2	7	[]	\N
6792	2022-02-19 13:27:46	2022-02-19 13:27:46	443	24.\tJANSSEN, Isabelle\t00\tRB Dordrecht\t1:18.74	App\\Models\\Athlete	109	1	5	\N	7874	13	2	7	[]	\N
6793	2022-02-19 13:27:46	2022-02-19 13:27:46	444	25.\tDALHUISEN, Renske\t03\tRB Gouda\t1:19.02	App\\Models\\Athlete	30	1	5	\N	7902	17	2	7	[]	\N
6794	2022-02-19 13:27:46	2022-02-19 13:27:46	445	26.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t1:19.55	App\\Models\\Athlete	403	1	5	\N	7955	13	2	7	[]	\N
6795	2022-02-19 13:27:46	2022-02-19 13:27:46	446	27.\tLUESS, Mia Carina\t01\tDLRG Buchholz e.V.\t1:19.71	App\\Models\\Athlete	622	1	5	\N	7971	234	2	7	[]	\N
6796	2022-02-19 13:27:46	2022-02-19 13:27:46	447	28.\tMURA CITTADINI, Melissa\t03\t3T Sporting Club\t1:20.84	App\\Models\\Athlete	473	1	5	\N	8084	233	2	7	[]	\N
6797	2022-02-19 13:27:46	2022-02-19 13:27:46	448	29.\tINGEBERG, Nora Boelling\t02\tStarfish SLC\t1:21.23	App\\Models\\Athlete	700	1	5	\N	8123	235	2	7	[]	\N
6798	2022-02-19 13:27:46	2022-02-19 13:27:46	449	30.\tDELL'OSPEDALE, Sara\t03\t3T Sporting Club\t1:21.38	App\\Models\\Athlete	10	1	5	\N	8138	233	2	7	[]	\N
6799	2022-02-19 13:27:46	2022-02-19 13:27:46	450	31.\tHOVIND GROEV, Ida\t03\tStarfish SLC\t1:23.59	App\\Models\\Athlete	40	1	5	\N	8359	235	2	7	[]	\N
6800	2022-02-19 13:27:46	2022-02-19 13:27:46	451	32.\tGUELI, Beatrice\t03\t3T Sporting Club\t1:23.78	App\\Models\\Athlete	615	1	5	\N	8378	233	2	7	[]	\N
6801	2022-02-19 13:27:46	2022-02-19 13:27:46	452	33.\tOESTMO, Helene Marie\t03\tStarfish SLC\t1:25.49	App\\Models\\Athlete	9	1	5	\N	8549	235	2	7	[]	\N
6802	2022-02-19 13:27:46	2022-02-19 13:27:46	453	34.\tHOEHNE, Charlotte\t03\tDLRG Ascheberg-Herbern\t1:27.01	App\\Models\\Athlete	701	1	5	\N	8701	254	2	7	[]	\N
6803	2022-02-19 13:27:46	2022-02-19 13:27:46	454	35.\tPISTERS, Nathalie\t01\tRB Heythuysen\t1:28.21	App\\Models\\Athlete	35	1	5	\N	8821	237	2	7	[]	\N
6804	2022-02-19 13:27:46	2022-02-19 13:27:46	455	36.\tLISSMANN, Lea\t03\tDLRG Kusel KiXX\t1:28.23	App\\Models\\Athlete	64	1	5	\N	8823	238	2	7	[]	\N
6805	2022-02-19 13:27:46	2022-02-19 13:27:46	456	37.\tUTERMUELLER, Pia\t01\tDLRG Buchholz e.V.\t1:29.22	App\\Models\\Athlete	619	1	5	\N	8922	234	2	7	[]	\N
6806	2022-02-19 13:27:46	2022-02-19 13:27:46	457	38.\tANTONII, Francesca\t02\t3T Sporting Club\t1:29.83	App\\Models\\Athlete	702	1	5	\N	8983	233	2	7	[]	\N
6807	2022-02-19 13:27:46	2022-02-19 13:27:46	458	39.\tHEIN, Nikki\t02\tRB Staphorst\t1:29.87	App\\Models\\Athlete	409	1	5	\N	8987	26	2	7	[]	\N
6808	2022-02-19 13:27:46	2022-02-19 13:27:46	459	40.\tBUNTJER, Lisa\t01\tDLRG LV Niedersachsen\t1:30.06	App\\Models\\Athlete	623	1	5	\N	9006	236	2	7	[]	\N
6809	2022-02-19 13:27:46	2022-02-19 13:27:46	460	41.\tVENTER, Chirsna\t00\tSouth Africa\t1:30.17	App\\Models\\Athlete	620	1	5	\N	9017	232	2	7	[]	\N
6810	2022-02-19 13:27:46	2022-02-19 13:27:46	461	42.\tPERDIJK, Micky\t02\tRB Gouda\t1:30.35	App\\Models\\Athlete	703	1	5	\N	9035	17	2	7	[]	\N
6811	2022-02-19 13:27:46	2022-02-19 13:27:46	462	43.\tHARTH, Julia\t02\tDLRG Kusel KiXX\t1:31.80	App\\Models\\Athlete	624	1	5	\N	9180	238	2	7	[]	\N
6812	2022-02-19 13:27:46	2022-02-19 13:27:46	463	44.\tDON, Elise\t03\tRB Dordrecht\t1:37.81	App\\Models\\Athlete	69	1	5	\N	9781	13	2	7	[]	\N
6813	2022-02-19 13:27:46	2022-02-19 13:27:46	464	45.\tJANSSEN, Fabienne\t03\tRB Heythuysen\t1:40.80	App\\Models\\Athlete	57	1	5	\N	10080	237	2	7	[]	\N
6814	2022-02-19 13:27:46	2022-02-19 13:27:46	465	46.\tBOL, Melissa\t01\tRB Oss\t1:45.28	App\\Models\\Athlete	704	1	5	\N	10528	43	2	7	[]	\N
6815	2022-02-19 13:27:46	2022-02-19 13:27:46	466	47.\tEGGERDING, Pip\t03\tRB Staphorst\t2:06.92	App\\Models\\Athlete	62	1	5	\N	12692	26	2	7	[]	\N
6816	2022-02-19 13:27:46	2022-02-19 13:27:46	467	DSQ\tSTELTING, Carolin\t02\tDLRG Buchholz e.V.	App\\Models\\Athlete	616	1	5	1	\N	234	2	7	[]	\N
6817	2022-02-19 13:27:46	2022-02-19 13:27:46	469	DSQ\tGELLEKOM, Lotte\t03\tRB Echt	App\\Models\\Athlete	705	1	5	1	\N	15	2	7	[]	\N
6818	2022-02-19 13:27:46	2022-02-19 13:27:46	472	1.\tVOLPINI, Federica\t93\tItaly\t57.65	App\\Models\\Athlete	487	1	5	\N	5765	1	2	8	[]	\N
6819	2022-02-19 13:27:46	2022-02-19 13:27:46	473	2.\tGARCIA SILVA, Anita\t98\tNoja-Playa Dorada\t59.41	App\\Models\\Athlete	706	1	5	\N	5941	255	2	8	[]	\N
6820	2022-02-19 13:27:46	2022-02-19 13:27:46	474	3.\tLUEHR, Kirsten\t91\tDLRG Schwerte\t1:01.11	App\\Models\\Athlete	707	1	5	\N	6111	109	2	8	[]	\N
6821	2022-02-19 13:27:46	2022-02-19 13:27:46	475	4.\tFERRARI, Samantha\t92\tItaly\t1:01.87	App\\Models\\Athlete	708	1	5	\N	6187	1	2	8	[]	\N
6822	2022-02-19 13:27:46	2022-02-19 13:27:46	476	5.\tMARZELLA, Alice\t94\tItaly\t1:02.04	App\\Models\\Athlete	709	1	5	\N	6204	1	2	8	[]	\N
6823	2022-02-19 13:27:46	2022-02-19 13:27:46	477	6.\tRAS, Janneke\t95\tRB Dordrecht\t1:02.08	App\\Models\\Athlete	489	1	5	\N	6208	13	2	8	[]	\N
6824	2022-02-19 13:27:46	2022-02-19 13:27:46	478	7.\tPEAT, Natalie\t94\tBlack Fins Squad\t1:02.11	App\\Models\\Athlete	418	1	5	\N	6211	251	2	8	[]	\N
6825	2022-02-19 13:27:46	2022-02-19 13:27:46	479	8.\tCOSTA PORTILLA, Isabel\t95\tNoja-Playa Dorada\t1:03.17	App\\Models\\Athlete	710	1	5	\N	6317	255	2	8	[]	\N
6826	2022-02-19 13:27:46	2022-02-19 13:27:46	480	9.\tNILSSON, Josefine\t93\tLivraddarna Tyloesand\t1:04.50	App\\Models\\Athlete	711	1	5	\N	6450	257	2	8	[]	\N
6827	2022-02-19 13:27:46	2022-02-19 13:27:46	481	10.\tSCHUERKMANN, Hanna\t99\tDLRG Ascheberg-Herbern\t1:06.54	App\\Models\\Athlete	712	1	5	\N	6654	254	2	8	[]	\N
6828	2022-02-19 13:27:46	2022-02-19 13:27:46	482	11.\tVAN DER HOEK, Charlotte\t99\tRB Dordrecht\t1:06.71	App\\Models\\Athlete	713	1	5	\N	6671	13	2	8	[]	\N
6829	2022-02-19 13:27:46	2022-02-19 13:27:46	483	12.\tSICKING, Kim\t99\tDLRG Ascheberg-Herbern\t1:06.89	App\\Models\\Athlete	714	1	5	\N	6689	254	2	8	[]	\N
6830	2022-02-19 13:27:46	2022-02-19 13:27:46	484	13.\tCUIJPERS, Isa\t99\tRB Heythuysen\t1:06.91	App\\Models\\Athlete	494	1	5	\N	6691	237	2	8	[]	\N
6831	2022-02-19 13:27:46	2022-02-19 13:27:46	485	14.\tLOEKSTAD GJERMUNDSEN, Mia Louise\t93\tStarfish SLC\t1:08.63	App\\Models\\Athlete	493	1	5	\N	6863	235	2	8	[]	\N
6832	2022-02-19 13:27:46	2022-02-19 13:27:46	486	15.\tVAN ZYL, Tove\t97\tSouth Africa\t1:09.63	App\\Models\\Athlete	626	1	5	\N	6963	232	2	8	[]	\N
6833	2022-02-19 13:27:46	2022-02-19 13:27:46	487	16.\tHUISINGA, Ellen\t92\tDLRG LV Niedersachsen\t1:10.08	App\\Models\\Athlete	627	1	5	\N	7008	236	2	8	[]	\N
6834	2022-02-19 13:27:46	2022-02-19 13:27:46	488	17.\tSTEIN, Saskia\t98\tDLRG LV Niedersachsen\t1:10.55	App\\Models\\Athlete	107	1	5	\N	7055	236	2	8	[]	\N
6835	2022-02-19 13:27:46	2022-02-19 13:27:46	489	MEUFFELS, Fiona\t95\tRB Nederweert\t1:10.55	App\\Models\\Athlete	89	1	5	\N	7055	35	2	8	[]	\N
6836	2022-02-19 13:27:46	2022-02-19 13:27:46	490	19.\tSCHIPHORST PREUPER, Kitty\t91\tRB Dordrecht\t1:10.62	App\\Models\\Athlete	715	1	5	\N	7062	13	2	8	[]	\N
6837	2022-02-19 13:27:46	2022-02-19 13:27:46	491	20.\tJACOBS, Marlou\t95\tRB Heythuysen\t1:10.98	App\\Models\\Athlete	498	1	5	\N	7098	237	2	8	[]	\N
6838	2022-02-19 13:27:46	2022-02-19 13:27:46	492	21.\tBOUTER, Renee\t98\tRB Gouda\t1:11.37	App\\Models\\Athlete	112	1	5	\N	7137	17	2	8	[]	\N
6839	2022-02-19 13:27:46	2022-02-19 13:27:46	493	22.\tRESINK, Aniek\t95\tRB Dordrecht\t1:12.21	App\\Models\\Athlete	91	1	5	\N	7221	13	2	8	[]	\N
6840	2022-02-19 13:27:46	2022-02-19 13:27:46	494	23.\tLILLEBO SLETTEN, Ane\t97\tStarfish SLC\t1:13.08	App\\Models\\Athlete	716	1	5	\N	7308	235	2	8	[]	\N
6841	2022-02-19 13:27:46	2022-02-19 13:27:46	500	24.\tMARX, Katharina\t94\tDLRG Haltern\t1:13.24	App\\Models\\Athlete	635	1	5	\N	7324	241	2	8	[]	\N
6842	2022-02-19 13:27:46	2022-02-19 13:27:46	501	25.\tWEISSPHAL, Katja\t99\tDLRG Ascheberg-Herbern\t1:13.48	App\\Models\\Athlete	717	1	5	\N	7348	254	2	8	[]	\N
6843	2022-02-19 13:27:46	2022-02-19 13:27:46	502	26.\tGROOT, Kathy\t97\tRB Dordrecht\t1:13.82	App\\Models\\Athlete	570	1	5	\N	7382	13	2	8	[]	\N
6844	2022-02-19 13:27:46	2022-02-19 13:27:46	503	27.\tMCGRORY, Celina\t99\tStarfish SLC\t1:14.66	App\\Models\\Athlete	718	1	5	\N	7466	235	2	8	[]	\N
6845	2022-02-19 13:27:47	2022-02-19 13:27:47	504	28.\tTICHELAAR, Romy\t95\tRB Zevenaar 'De Breuly'\t1:14.67	App\\Models\\Athlete	634	1	5	\N	7467	240	2	8	[]	\N
6846	2022-02-19 13:27:47	2022-02-19 13:27:47	505	29.\tYUE, Wing-sue\t99\tHong Kong Lifesaving team\t1:15.48	App\\Models\\Athlete	719	1	5	\N	7548	252	2	8	[]	\N
6847	2022-02-19 13:27:47	2022-02-19 13:27:47	506	30.\tKEURENTJES, Anne\t95\tRB Boxtel\t1:16.29	App\\Models\\Athlete	572	1	5	\N	7629	122	2	8	[]	\N
6848	2022-02-19 13:27:47	2022-02-19 13:27:47	507	31.\tVAN ZADEL, Kelly\t90\tRB Zevenaar 'De Breuly'\t1:16.41	App\\Models\\Athlete	111	1	5	\N	7641	240	2	8	[]	\N
6849	2022-02-19 13:27:47	2022-02-19 13:27:47	508	32.\tBRENNEISER, Lea Maria\t99\tDLRG Kusel KiXX\t1:16.79	App\\Models\\Athlete	637	1	5	\N	7679	238	2	8	[]	\N
6850	2022-02-19 13:27:47	2022-02-19 13:27:47	509	33.\tSCHULTZ, Vanessa Anna\t96\tDLRG Kusel KiXX\t1:16.93	App\\Models\\Athlete	633	1	5	\N	7693	238	2	8	[]	\N
6851	2022-02-19 13:27:47	2022-02-19 13:27:47	510	34.\tCASPERS, Tamara\t90\tRB Dordrecht\t1:17.05	App\\Models\\Athlete	632	1	5	\N	7705	13	2	8	[]	\N
6852	2022-02-19 13:27:47	2022-02-19 13:27:47	511	35.\tCHOW, Hei-man\t96\tHong Kong Lifesaving team\t1:17.07	App\\Models\\Athlete	720	1	5	\N	7707	252	2	8	[]	\N
6853	2022-02-19 13:27:47	2022-02-19 13:27:47	512	36.\tPFLIPS, Lou\t99\tDLRG Haltern\t1:17.14	App\\Models\\Athlete	721	1	5	\N	7714	241	2	8	[]	\N
6854	2022-02-19 13:27:47	2022-02-19 13:27:47	513	37.\tDE VRIES, Denise\t91\tNL Defensie Lifesaving\t1:17.58	App\\Models\\Athlete	98	1	5	\N	7758	239	2	8	[]	\N
6855	2022-02-19 13:27:47	2022-02-19 13:27:47	514	38.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:21.83	App\\Models\\Athlete	722	1	5	\N	8183	43	2	8	[]	\N
6856	2022-02-19 13:27:47	2022-02-19 13:27:47	515	39.\tBOTT, Julia Marie\t99\tDLRG Kusel KiXX\t1:22.98	App\\Models\\Athlete	723	1	5	\N	8298	238	2	8	[]	\N
6857	2022-02-19 13:27:47	2022-02-19 13:27:47	516	40.\tSCHULTZ, Francesca Andrea\t94\tDLRG Kusel KiXX\t1:24.44	App\\Models\\Athlete	638	1	5	\N	8444	238	2	8	[]	\N
6858	2022-02-19 13:27:47	2022-02-19 13:27:47	517	41.\tSCHMIEDNER, Jana\t99\tDLRG Duisburg-Homberg\t1:24.52	App\\Models\\Athlete	636	1	5	\N	8452	39	2	8	[]	\N
6859	2022-02-19 13:27:47	2022-02-19 13:27:47	518	42.\tCOMPAGNER VAN DER HEIJDEN, Louise\t91\tRB Staphorst\t1:26.58	App\\Models\\Athlete	724	1	5	\N	8658	26	2	8	[]	\N
6860	2022-02-19 13:27:47	2022-02-19 13:27:47	519	43.\tVAN DE HEUVEL, Marsha\t98\tRB Gouda\t1:26.91	App\\Models\\Athlete	628	1	5	\N	8691	17	2	8	[]	\N
6861	2022-02-19 13:27:47	2022-02-19 13:27:47	520	44.\tSPEL, Diede\t95\tRB Zwolle\t1:27.86	App\\Models\\Athlete	639	1	5	\N	8786	242	2	8	[]	\N
6862	2022-02-19 13:27:47	2022-02-19 13:27:47	521	45.\tVANHIJFTE, Rody\t94\tNL Defensie Lifesaving\t1:28.26	App\\Models\\Athlete	506	1	5	\N	8826	239	2	8	[]	\N
6863	2022-02-19 13:27:47	2022-02-19 13:27:47	522	46.\tWIENHOLDT, Sina\t89\tDLRG Duisburg-Homberg\t1:31.04	App\\Models\\Athlete	122	1	5	\N	9104	39	2	8	[]	\N
6864	2022-02-19 13:27:47	2022-02-19 13:27:47	523	47.\tBAST, Iris\t99\tRB Oss\t1:45.56	App\\Models\\Athlete	725	1	5	\N	10556	43	2	8	[]	\N
6865	2022-02-19 13:27:47	2022-02-19 13:27:47	524	48.\tVAN HOEK, Kelly\t98\tRB Oss\t1:49.43	App\\Models\\Athlete	726	1	5	\N	10943	43	2	8	[]	\N
6866	2022-02-19 13:27:47	2022-02-19 13:27:47	525	DSQ\tHEEMELS, Robin\t99\tRB Dordrecht	App\\Models\\Athlete	727	1	5	1	\N	13	2	8	[]	\N
6867	2022-02-19 13:27:47	2022-02-19 13:27:47	527	DSQ\tSENDEN, Chantal\t93\tRB Dordrecht	App\\Models\\Athlete	421	1	5	1	\N	13	2	8	[]	\N
6868	2022-02-19 13:27:47	2022-02-19 13:27:47	529	DSQ\tHUTTEN, Ela\t93\tRB Dordrecht	App\\Models\\Athlete	728	1	5	1	\N	13	2	8	[]	\N
6869	2022-02-19 13:27:47	2022-02-19 13:27:47	532	1.\tKITTEL, Christine\t85\tDLRG LV Niedersachsen\t1:05.35	App\\Models\\Athlete	438	1	5	\N	6535	236	2	9	[]	\N
6870	2022-02-19 13:27:47	2022-02-19 13:27:47	533	2.\tVANBUEL-GOFFIN, Nele-Cornelia\t85\tHossegor Sauvetage Cotier (FRA\t1:05.43	App\\Models\\Athlete	729	1	5	\N	6543	258	2	9	[]	\N
6871	2022-02-19 13:27:47	2022-02-19 13:27:47	534	3.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t1:07.91	App\\Models\\Athlete	640	1	5	\N	6791	243	2	9	[]	\N
6872	2022-02-19 13:27:47	2022-02-19 13:27:47	535	4.\tNASS, Marina\t87\tDLRG Schwerte\t1:08.26	App\\Models\\Athlete	730	1	5	\N	6826	109	2	9	[]	\N
6873	2022-02-19 13:27:47	2022-02-19 13:27:47	536	5.\tLINDER, Anna\t86\tDLRG Ennigerloh e.V.\t1:10.44	App\\Models\\Athlete	512	1	5	\N	7044	244	2	9	[]	\N
6874	2022-02-19 13:27:47	2022-02-19 13:27:47	537	6.\tWONG, Hock-wing, Winnie\t87\tHong Kong Lifesaving team\t1:13.25	App\\Models\\Athlete	731	1	5	\N	7325	252	2	9	[]	\N
6875	2022-02-19 13:27:47	2022-02-19 13:27:47	538	7.\tHOHENHORST, Sabrina\t82\tDLRG Ennigerloh e.V.\t1:18.55	App\\Models\\Athlete	732	1	5	\N	7855	244	2	9	[]	\N
6876	2022-02-19 13:27:47	2022-02-19 13:27:47	539	8.\tSTEVENS, Danielle\t88\tRB Oss\t1:21.83	App\\Models\\Athlete	641	1	5	\N	8183	43	2	9	[]	\N
6877	2022-02-19 13:27:47	2022-02-19 13:27:47	541	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t1:27.54	App\\Models\\Athlete	440	1	5	\N	8754	13	2	11	[]	\N
6878	2022-02-19 13:27:47	2022-02-19 13:27:47	542	2.\tVAN LOENHOUT, Marjolein\t76\tRB Dordrecht\t1:29.43	App\\Models\\Athlete	733	1	5	\N	8943	13	2	11	[]	\N
6879	2022-02-19 13:27:47	2022-02-19 13:27:47	543	3.\tPISTERS, Miriam\t70\tRB Heythuysen\t1:39.68	App\\Models\\Athlete	518	1	5	\N	9968	237	2	11	[]	\N
6880	2022-02-19 13:27:47	2022-02-19 13:27:47	545	1.\tDITTSCHAR, Steph\t68\tDLRG Ennigerloh e.V.\t1:21.28	App\\Models\\Athlete	642	1	5	\N	8128	244	2	10	[]	\N
6881	2022-02-19 13:27:47	2022-02-19 13:27:47	546	2.\tHOVER, Mieke\t61\tRB Echt\t1:34.78	App\\Models\\Athlete	519	1	5	\N	9478	15	2	10	[]	\N
6882	2022-02-19 13:27:47	2022-02-19 13:27:47	547	3.\tCELIE, Wilna\t58\tRB Dordrecht\t1:53.47	App\\Models\\Athlete	734	1	5	\N	11347	13	2	10	[]	\N
6883	2022-02-19 13:27:47	2022-02-19 13:27:47	548	DSQ\tVAN DER KOOIJ, Astrid\t64\tRB Dordrecht	App\\Models\\Athlete	520	1	5	1	\N	13	2	10	[]	\N
6884	2022-02-19 13:27:47	2022-02-19 13:27:47	557	1.\tVAN ZYL, Jp\t00\tSouth Africa\t59.57	App\\Models\\Athlete	735	1	5	\N	5957	232	2	7	[]	\N
6885	2022-02-19 13:27:47	2022-02-19 13:27:47	558	2.\tWILLOWS, Branden\t01\tSouth Africa\t1:01.25	App\\Models\\Athlete	650	1	5	\N	6125	232	2	7	[]	\N
6886	2022-02-19 13:27:47	2022-02-19 13:27:47	559	3.\tDU TOIT, Botha\t00\tSouth Africa\t1:03.07	App\\Models\\Athlete	646	1	5	\N	6307	232	2	7	[]	\N
6887	2022-02-19 13:27:47	2022-02-19 13:27:47	560	4.\tROESEMEIER, Elias\t01\tDLRG LV Niedersachsen\t1:03.14	App\\Models\\Athlete	649	1	5	\N	6314	236	2	7	[]	\N
6888	2022-02-19 13:27:47	2022-02-19 13:27:47	561	5.\tBENSMANN, Luca\t01\tDLRG LV Niedersachsen\t1:04.36	App\\Models\\Athlete	647	1	5	\N	6436	236	2	7	[]	\N
6889	2022-02-19 13:27:47	2022-02-19 13:27:47	562	6.\tSCHWERTHELM, Jonas\t00\tDLRG Goslar\t1:04.58	App\\Models\\Athlete	648	1	5	\N	6458	246	2	7	[]	\N
6890	2022-02-19 13:27:47	2022-02-19 13:27:47	563	7.\tMEYER, Mirco\t01\tDLRG LV Niedersachsen\t1:05.29	App\\Models\\Athlete	736	1	5	\N	6529	236	2	7	[]	\N
6891	2022-02-19 13:27:47	2022-02-19 13:27:47	564	8.\tTREDER, Mats\t03\tDLRG Haltern\t1:06.63	App\\Models\\Athlete	655	1	5	\N	6663	241	2	7	[]	\N
6892	2022-02-19 13:27:47	2022-02-19 13:27:47	565	9.\tKUIPHOF, Robin\t03\tRB Dordrecht\t1:06.72	App\\Models\\Athlete	737	1	5	\N	6672	13	2	7	[]	\N
6893	2022-02-19 13:27:47	2022-02-19 13:27:47	566	10.\tSCHULTZ, Marco Philip\t00\tDLRG Kusel KiXX\t1:08.51	App\\Models\\Athlete	657	1	5	\N	6851	238	2	7	[]	\N
6894	2022-02-19 13:27:47	2022-02-19 13:27:47	567	11.\tVAN GIESEN, Christopher\t02\tRB Dordrecht\t1:08.67	App\\Models\\Athlete	738	1	5	\N	6867	13	2	7	[]	\N
6895	2022-02-19 13:27:47	2022-02-19 13:27:47	568	12.\tHAUG VANDENHOVE, Jonah\t03\tStarfish SLC\t1:08.91	App\\Models\\Athlete	739	1	5	\N	6891	235	2	7	[]	\N
6896	2022-02-19 13:27:47	2022-02-19 13:27:47	569	13.\tIN 'T VELD, Marijn\t00\tRB Dordrecht\t1:11.27	App\\Models\\Athlete	599	1	5	\N	7127	13	2	7	[]	\N
6897	2022-02-19 13:27:47	2022-02-19 13:27:47	570	14.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t1:11.56	App\\Models\\Athlete	656	1	5	\N	7156	17	2	7	[]	\N
6898	2022-02-19 13:27:47	2022-02-19 13:27:47	571	15.\tSCHWIND, Vinzenz\t02\tDLRG Nieder-Olm/Woerrstadt\t1:12.39	App\\Models\\Athlete	661	1	5	\N	7239	249	2	7	[]	\N
6899	2022-02-19 13:27:47	2022-02-19 13:27:47	572	16.\tVAN DEN AKKER, Tom\t02\tRB Echt\t1:13.08	App\\Models\\Athlete	651	1	5	\N	7308	15	2	7	[]	\N
6900	2022-02-19 13:27:47	2022-02-19 13:27:47	573	17.\tPOETTER, Lukas\t01\tDLRG Herzebrock-Clarholz\t1:13.74	App\\Models\\Athlete	662	1	5	\N	7374	250	2	7	[]	\N
6901	2022-02-19 13:27:47	2022-02-19 13:27:47	574	18.\tVAN HOUTEM, Jaden\t02\tRB Echt\t1:13.77	App\\Models\\Athlete	658	1	5	\N	7377	15	2	7	[]	\N
6902	2022-02-19 13:27:47	2022-02-19 13:27:47	575	19.\tWOLTERMAN, Flynn\t03\tRB Vlissingen\t1:13.86	App\\Models\\Athlete	654	1	5	\N	7386	248	2	7	[]	\N
6903	2022-02-19 13:27:47	2022-02-19 13:27:47	576	20.\tRUSSCHEN, Tom\t02\tRB Dordrecht\t1:15.18	App\\Models\\Athlete	666	1	5	\N	7518	13	2	7	[]	\N
6904	2022-02-19 13:27:47	2022-02-19 13:27:47	577	21.\tKAMPHUIS, Sven\t02\tRB Staphorst\t1:16.74	App\\Models\\Athlete	663	1	5	\N	7674	26	2	7	[]	\N
6905	2022-02-19 13:27:47	2022-02-19 13:27:47	578	22.\tHAUPTVOGEL, Aaron\t01\tDLRG Haltern\t1:19.68	App\\Models\\Athlete	665	1	5	\N	7968	241	2	7	[]	\N
6906	2022-02-19 13:27:47	2022-02-19 13:27:47	579	23.\tBITTMANN, Paul\t03\tDLRG Kusel KiXX\t1:19.75	App\\Models\\Athlete	664	1	5	\N	7975	238	2	7	[]	\N
6907	2022-02-19 13:27:47	2022-02-19 13:27:47	580	24.\tVAN DEN AKKER, Bas\t02\tRB Echt\t1:20.00	App\\Models\\Athlete	652	1	5	\N	8000	15	2	7	[]	\N
6908	2022-02-19 13:27:47	2022-02-19 13:27:47	581	25.\tKAMPHUIS, Roy\t01\tRB Staphorst\t1:22.38	App\\Models\\Athlete	660	1	5	\N	8238	26	2	7	[]	\N
6909	2022-02-19 13:27:47	2022-02-19 13:27:47	582	DSQ\tSOLVANG ENGESETH, Joergen\t03\tStarfish SLC	App\\Models\\Athlete	659	1	5	1	\N	235	2	7	[]	\N
6910	2022-02-19 13:27:47	2022-02-19 13:27:47	584	DSQ\tVERHOEF, Jop\t02\tRB Dordrecht	App\\Models\\Athlete	740	1	5	1	\N	13	2	7	[]	\N
6911	2022-02-19 13:27:47	2022-02-19 13:27:47	587	1.\tKENT, Steve\t88\tBlack Fins Squad\t52.47	App\\Models\\Athlete	667	1	5	\N	5247	251	2	8	[]	\N
6912	2022-02-19 13:27:47	2022-02-19 13:27:47	588	2.\tSEZEN, Anil\t92\tDLRG Schwerte\t54.01	App\\Models\\Athlete	741	1	5	\N	5401	109	2	8	[]	\N
6913	2022-02-19 13:27:47	2022-02-19 13:27:47	589	3.\tBRANG, Tim\t97\tDLRG Schloss Holte-Stukenbrock\t54.29	App\\Models\\Athlete	742	1	5	\N	5429	259	2	8	[]	\N
6914	2022-02-19 13:27:47	2022-02-19 13:27:47	590	4.\tMAGNUSSON, Martin\t95\tLivraddarna Tyloesand\t55.16	App\\Models\\Athlete	743	1	5	\N	5516	257	2	8	[]	\N
6915	2022-02-19 13:27:47	2022-02-19 13:27:47	591	5.\tSTOETZER, Roelof\t97\tRB Gouda\t55.91	App\\Models\\Athlete	548	1	5	\N	5591	17	2	8	[]	\N
6916	2022-02-19 13:27:47	2022-02-19 13:27:47	592	6.\tLEE, Sing-chung\t90\tHong Kong Lifesaving team\t57.19	App\\Models\\Athlete	744	1	5	\N	5719	252	2	8	[]	\N
6917	2022-02-19 13:27:47	2022-02-19 13:27:47	593	7.\tSANNA, Daniele\t89\tItaly\t57.83	App\\Models\\Athlete	745	1	5	\N	5783	1	2	8	[]	\N
6918	2022-02-19 13:27:47	2022-02-19 13:27:47	594	HAZENOOT, Barry\t91\tNL Defensie Lifesaving\t57.83	App\\Models\\Athlete	746	1	5	\N	5783	239	2	8	[]	\N
6919	2022-02-19 13:27:47	2022-02-19 13:27:47	595	9.\tPIRODDI, Andrea Vittorio\t92\tItaly\t58.15	App\\Models\\Athlete	526	1	5	\N	5815	1	2	8	[]	\N
6920	2022-02-19 13:27:47	2022-02-19 13:27:47	596	10.\tSCHWEGMANN, Tom\t94\tDLRG Schwerte\t58.25	App\\Models\\Athlete	677	1	5	\N	5825	109	2	8	[]	\N
6921	2022-02-19 13:27:47	2022-02-19 13:27:47	597	11.\tHILLEBRINK, Jelmar\t95\tRB Dordrecht\t59.10	App\\Models\\Athlete	532	1	5	\N	5910	13	2	8	[]	\N
6922	2022-02-19 13:27:47	2022-02-19 13:27:47	598	12.\tMEERTEN, Jack\t97\tRB Echt\t59.28	App\\Models\\Athlete	135	1	5	\N	5928	15	2	8	[]	\N
6923	2022-02-19 13:27:47	2022-02-19 13:27:47	599	13.\tDRINNAN, Cole\t97\tBlack Fins Squad\t59.59	App\\Models\\Athlete	671	1	5	\N	5959	251	2	8	[]	\N
6924	2022-02-19 13:27:47	2022-02-19 13:27:47	600	14.\tBORN, Paul\t99\tDLRG Nieder-Olm/Woerrstadt\t59.98	App\\Models\\Athlete	455	1	5	\N	5998	249	2	8	[]	\N
6925	2022-02-19 13:27:47	2022-02-19 13:27:47	601	15.\tCLOCCHIATTI, Brian\t98\tGorizia Nuoto Asd\t1:00.16	App\\Models\\Athlete	670	1	5	\N	6016	231	2	8	[]	\N
6926	2022-02-19 13:27:47	2022-02-19 13:27:47	602	16.\tLO, Ting-kin\t96\tHong Kong Lifesaving team\t1:00.99	App\\Models\\Athlete	747	1	5	\N	6099	252	2	8	[]	\N
6927	2022-02-19 13:27:47	2022-02-19 13:27:47	603	17.\tKEMPKES, Stephan\t88\tDLRG LV Niedersachsen\t1:01.45	App\\Models\\Athlete	676	1	5	\N	6145	236	2	8	[]	\N
6928	2022-02-19 13:27:47	2022-02-19 13:27:47	604	18.\tHILDEBRANDT, Leon\t97\tDLRG Goslar\t1:01.62	App\\Models\\Athlete	681	1	5	\N	6162	246	2	8	[]	\N
6929	2022-02-19 13:27:47	2022-02-19 13:27:47	605	19.\tDEBBELER, Jonas\t96\tDLRG Goslar\t1:01.75	App\\Models\\Athlete	679	1	5	\N	6175	246	2	8	[]	\N
6930	2022-02-19 13:27:47	2022-02-19 13:27:47	606	20.\tSTERNER, Jan-Ole\t95\tDLRG Goslar\t1:02.01	App\\Models\\Athlete	678	1	5	\N	6201	246	2	8	[]	\N
6931	2022-02-19 13:27:47	2022-02-19 13:27:47	612	21.\tPEZZOTTI, Fabio\t97\tItaly\t1:03.37	App\\Models\\Athlete	669	1	5	\N	6337	1	2	8	[]	\N
6932	2022-02-19 13:27:47	2022-02-19 13:27:47	613	22.\tKUNK, Daniel\t90\tDLRG LV Niedersachsen\t1:04.39	App\\Models\\Athlete	680	1	5	\N	6439	236	2	8	[]	\N
6933	2022-02-19 13:27:47	2022-02-19 13:27:47	614	23.\tMEERTEN, John\t97\tRB Echt\t1:05.24	App\\Models\\Athlete	154	1	5	\N	6524	15	2	8	[]	\N
6934	2022-02-19 13:27:47	2022-02-19 13:27:47	615	24.\tMEERTEN, Luuk\t99\tRB Echt\t1:05.36	App\\Models\\Athlete	540	1	5	\N	6536	15	2	8	[]	\N
6935	2022-02-19 13:27:47	2022-02-19 13:27:47	616	25.\tVOSS, Lennart\t94\tDLRG Buchholz e.V.\t1:05.62	App\\Models\\Athlete	748	1	5	\N	6562	234	2	8	[]	\N
6936	2022-02-19 13:27:47	2022-02-19 13:27:47	617	26.\tKOEHNE, Cedric\t97\tDLRG Herzebrock-Clarholz\t1:06.13	App\\Models\\Athlete	682	1	5	\N	6613	250	2	8	[]	\N
6937	2022-02-19 13:27:47	2022-02-19 13:27:47	618	27.\tDE REUVER, Tim\t99\tRB Oss\t1:07.38	App\\Models\\Athlete	150	1	5	\N	6738	43	2	8	[]	\N
6938	2022-02-19 13:27:47	2022-02-19 13:27:47	619	28.\tHAUKE, Tim\t92\tDLRG Buchholz e.V.\t1:07.83	App\\Models\\Athlete	749	1	5	\N	6783	234	2	8	[]	\N
6939	2022-02-19 13:27:47	2022-02-19 13:27:47	620	29.\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg\t1:08.32	App\\Models\\Athlete	539	1	5	\N	6832	39	2	8	[]	\N
6940	2022-02-19 13:27:47	2022-02-19 13:27:47	621	30.\tVAN DER KROGT, Nick\t95\tRB Dordrecht\t1:08.82	App\\Models\\Athlete	683	1	5	\N	6882	13	2	8	[]	\N
6941	2022-02-19 13:27:47	2022-02-19 13:27:47	622	31.\tRAUTENBACH, Kurt\t99\tSouth Africa\t1:09.37	App\\Models\\Athlete	673	1	5	\N	6937	232	2	8	[]	\N
6942	2022-02-19 13:27:47	2022-02-19 13:27:47	623	32.\tWILLEMS, Luuk\t97\tRB Echt\t1:09.40	App\\Models\\Athlete	142	1	5	\N	6940	15	2	8	[]	\N
6943	2022-02-19 13:27:47	2022-02-19 13:27:47	624	33.\tALINK, Nick\t95\tNL Defensie Lifesaving\t1:12.75	App\\Models\\Athlete	536	1	5	\N	7275	239	2	8	[]	\N
6944	2022-02-19 13:27:47	2022-02-19 13:27:47	625	34.\tGELLEKOM, Jeroen\t99\tRB Echt\t1:13.14	App\\Models\\Athlete	750	1	5	\N	7314	15	2	8	[]	\N
6945	2022-02-19 13:27:47	2022-02-19 13:27:47	626	35.\tHAUPTVOGEL, Daniel\t99\tDLRG Haltern\t1:16.36	App\\Models\\Athlete	687	1	5	\N	7636	241	2	8	[]	\N
6946	2022-02-19 13:27:47	2022-02-19 13:27:47	627	36.\tBOERMANN, Niklas\t97\tDLRG Haltern\t1:17.49	App\\Models\\Athlete	686	1	5	\N	7749	241	2	8	[]	\N
6947	2022-02-19 13:27:47	2022-02-19 13:27:47	628	37.\tKUHLMANN, Justus\t98\tDLRG Haltern\t1:19.59	App\\Models\\Athlete	684	1	5	\N	7959	241	2	8	[]	\N
6948	2022-02-19 13:27:47	2022-02-19 13:27:47	629	DSQ\tGILARDI, Federico\t91\tItaly	App\\Models\\Athlete	668	1	5	1	\N	1	2	8	[]	\N
6949	2022-02-19 13:27:47	2022-02-19 13:27:47	631	DSQ\tSIEVAL, Lars\t93\tNL Defensie Lifesaving	App\\Models\\Athlete	675	1	5	1	\N	239	2	8	[]	\N
6950	2022-02-19 13:27:47	2022-02-19 13:27:47	633	DSQ\tWONG, Shun-lai\t97\tHong Kong Lifesaving team	App\\Models\\Athlete	751	1	5	1	\N	252	2	8	[]	\N
6951	2022-02-19 13:27:47	2022-02-19 13:27:47	635	DSQ\tWOELBING, Oliver\t99\tDLRG Kelkheim	App\\Models\\Athlete	674	1	5	1	\N	253	2	8	[]	\N
6952	2022-02-19 13:27:47	2022-02-19 13:27:47	637	DSQ\tRUSSCHEN, Sem\t99\tRB Dordrecht	App\\Models\\Athlete	538	1	5	1	\N	13	2	8	[]	\N
6953	2022-02-19 13:27:47	2022-02-19 13:27:47	639	DSQ\tVAN ERK, Ruben\t96\tRB Dordrecht	App\\Models\\Athlete	533	1	5	1	\N	13	2	8	[]	\N
6954	2022-02-19 13:27:47	2022-02-19 13:27:47	641	DSQ\tTUINSTRA, Wouter\t95\tRB Staphorst	App\\Models\\Athlete	685	1	5	1	\N	26	2	8	[]	\N
6955	2022-02-19 13:27:47	2022-02-19 13:27:47	643	DNF\tVAN DER MEIJ, Melvin\t93\tRB Dordrecht	App\\Models\\Athlete	448	1	5	3	\N	13	2	8	[]	\N
6956	2022-02-19 13:27:47	2022-02-19 13:27:47	645	1.\tFREY, Max\t86\tDLRG Buchholz e.V.\t1:03.18	App\\Models\\Athlete	463	1	5	\N	6318	234	2	9	[]	\N
6957	2022-02-19 13:27:47	2022-02-19 13:27:47	646	2.\tGERRIT OEVER, van 't\t87\tNL Defensie Lifesaving\t1:04.80	App\\Models\\Athlete	688	1	5	\N	6480	239	2	9	[]	\N
6958	2022-02-19 13:27:47	2022-02-19 13:27:47	647	3.\tDE GREEF, Rik\t84\tNL Defensie Lifesaving\t1:06.29	App\\Models\\Athlete	689	1	5	\N	6629	239	2	9	[]	\N
6959	2022-02-19 13:27:47	2022-02-19 13:27:47	648	4.\tVAN DER HEIJDEN, Michiel\t86\tRB Staphorst\t1:10.84	App\\Models\\Athlete	752	1	5	\N	7084	26	2	9	[]	\N
6960	2022-02-19 13:27:47	2022-02-19 13:27:47	649	DSQ\tDE KNOOP, Bastiaan\t86\tRB Gouda	App\\Models\\Athlete	166	1	5	1	\N	17	2	9	[]	\N
6961	2022-02-19 13:27:47	2022-02-19 13:27:47	651	DSQ\tVOSKAMP, Ingemar\t87\tNL Defensie Lifesaving	App\\Models\\Athlete	165	1	5	1	\N	239	2	9	[]	\N
6962	2022-02-19 13:27:47	2022-02-19 13:27:47	654	1.\tROEMEN, Sven\t70\tRB Echt\t1:04.09	App\\Models\\Athlete	173	1	5	\N	6409	15	2	11	[]	\N
6963	2022-02-19 13:27:47	2022-02-19 13:27:47	655	2.\tVAN GRIEKEN, Wim\t69\tRB Gouda\t1:08.21	App\\Models\\Athlete	176	1	5	\N	6821	17	2	11	[]	\N
6964	2022-02-19 13:27:47	2022-02-19 13:27:47	656	3.\tVAN DE GOOR, Guus\t77\tRB Echt\t1:09.41	App\\Models\\Athlete	174	1	5	\N	6941	15	2	11	[]	\N
6965	2022-02-19 13:27:47	2022-02-19 13:27:47	657	4.\tUBBINK, Stefan\t78\tRB Zevenaar 'De Breuly'\t1:16.82	App\\Models\\Athlete	753	1	5	\N	7682	240	2	11	[]	\N
6966	2022-02-19 13:27:47	2022-02-19 13:27:47	658	5.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t1:18.27	App\\Models\\Athlete	179	1	5	\N	7827	13	2	11	[]	\N
6967	2022-02-19 13:27:47	2022-02-19 13:27:47	664	1.\tVENOHR, Heiko\t63\tDLRG Gelsenkichen-Mitte\t1:03.31	App\\Models\\Athlete	754	1	5	\N	6331	260	2	10	[]	\N
6968	2022-02-19 13:27:47	2022-02-19 13:27:47	665	2.\tVAN DAALEN, Erik\t65\tRB Dordrecht\t1:06.92	App\\Models\\Athlete	175	1	5	\N	6692	13	2	10	[]	\N
6969	2022-02-19 13:27:47	2022-02-19 13:27:47	666	3.\tPRAET, Piet\t56\tRB Dordrecht\t1:12.38	App\\Models\\Athlete	693	1	5	\N	7238	13	2	10	[]	\N
6970	2022-02-19 13:27:47	2022-02-19 13:27:47	667	4.\tTE HENNEPE, Hans\t68\tRB Gouda\t1:16.28	App\\Models\\Athlete	177	1	5	\N	7628	17	2	10	[]	\N
6971	2022-02-19 13:27:47	2022-02-19 13:27:47	668	5.\tVAN DAM, Robert\t66\tRB Gouda\t1:32.37	App\\Models\\Athlete	557	1	5	\N	9237	17	2	10	[]	\N
6972	2022-02-19 13:27:47	2022-02-19 13:27:47	669	DSQ\tTER HUERNE, Erwin\t64\tDLRG OG Stadtlohn e.V.	App\\Models\\Athlete	755	1	5	1	\N	245	2	10	[]	\N
6973	2022-02-19 13:27:47	2022-02-19 13:27:47	671	DSQ\tBEZEMER, Dennis\t68\tRB Dordrecht	App\\Models\\Athlete	467	1	5	1	\N	13	2	10	[]	\N
6974	2022-02-19 13:27:47	2022-02-19 13:27:47	676	1.\tItaly 1\tItaly\t1:23.71	App\\Models\\RelayTeam	114	1	23	\N	8371	1	2	\N	[]	\N
6975	2022-02-19 13:27:47	2022-02-19 13:27:47	678	2.\tNederland Senioren\tRB Dordrecht\t1:25.09	App\\Models\\RelayTeam	113	1	23	\N	8509	13	2	\N	[]	\N
6976	2022-02-19 13:27:47	2022-02-19 13:27:47	680	3.\tDordrecht Senioren\tRB Dordrecht\t1:31.17	App\\Models\\RelayTeam	116	1	23	\N	9117	13	2	\N	[]	\N
6977	2022-02-19 13:27:47	2022-02-19 13:27:47	682	4.\tSouth Africa 1\tSouth Africa\t1:33.79	App\\Models\\RelayTeam	115	1	23	\N	9379	232	2	\N	[]	\N
6978	2022-02-19 13:27:47	2022-02-19 13:27:47	684	5.\tDLRG Ascheberg-Herbern 1\tDLRG Ascheberg-Herbern\t1:39.41	App\\Models\\RelayTeam	124	1	23	\N	9941	254	2	\N	[]	\N
6979	2022-02-19 13:27:47	2022-02-19 13:27:47	686	6.\tRB Gouda 2\tRB Gouda\t1:40.53	App\\Models\\RelayTeam	121	1	23	\N	10053	17	2	\N	[]	\N
6980	2022-02-19 13:27:47	2022-02-19 13:27:47	688	7.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t1:41.11	App\\Models\\RelayTeam	120	1	23	\N	10111	236	2	\N	[]	\N
6981	2022-02-19 13:27:47	2022-02-19 13:27:47	690	8.\tSouth Africa 2\tSouth Africa\t1:44.42	App\\Models\\RelayTeam	119	1	23	\N	10442	232	2	\N	[]	\N
6982	2022-02-19 13:27:47	2022-02-19 13:27:47	692	9.\tRB Heythuysen 1\tRB Heythuysen\t1:44.74	App\\Models\\RelayTeam	122	1	23	\N	10474	237	2	\N	[]	\N
6983	2022-02-19 13:27:47	2022-02-19 13:27:47	694	10.\tBuchholz 1\tDLRG Buchholz e.V.\t1:46.63	App\\Models\\RelayTeam	117	1	23	\N	10663	234	2	\N	[]	\N
6984	2022-02-19 13:27:47	2022-02-19 13:27:47	696	11.\tTeam Starfish\tStarfish SLC\t1:47.05	App\\Models\\RelayTeam	123	1	23	\N	10705	235	2	\N	[]	\N
6985	2022-02-19 13:27:47	2022-02-19 13:27:47	698	12.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t1:49.22	App\\Models\\RelayTeam	118	1	23	\N	10922	239	2	\N	[]	\N
6986	2022-02-19 13:27:47	2022-02-19 13:27:47	700	13.\tKusel ChiXXX\tDLRG Kusel KiXX\t1:54.97	App\\Models\\RelayTeam	128	1	23	\N	11497	238	2	\N	[]	\N
6987	2022-02-19 13:27:47	2022-02-19 13:27:47	702	14.\tDordrecht Junioren\tRB Dordrecht\t1:55.28	App\\Models\\RelayTeam	125	1	23	\N	11528	13	2	\N	[]	\N
6988	2022-02-19 13:27:47	2022-02-19 13:27:47	704	15.\tRB Gouda 1\tRB Gouda\t1:56.42	App\\Models\\RelayTeam	127	1	23	\N	11642	17	2	\N	[]	\N
6989	2022-02-19 13:27:48	2022-02-19 13:27:48	706	16.\t3T Sporting Club 1\t3T Sporting Club\t2:01.68	App\\Models\\RelayTeam	126	1	23	\N	12168	233	2	\N	[]	\N
6990	2022-02-19 13:27:48	2022-02-19 13:27:48	708	17.\tDLRG Duisburg-Homberg 1\tDLRG Duisburg-Homberg\t2:07.25	App\\Models\\RelayTeam	129	1	23	\N	12725	39	2	\N	[]	\N
6991	2022-02-19 13:27:48	2022-02-19 13:27:48	715	18.\tRB Staphorst 1\tRB Staphorst\t2:11.23	App\\Models\\RelayTeam	130	1	23	\N	13123	26	2	\N	[]	\N
6992	2022-02-19 13:27:48	2022-02-19 13:27:48	717	19.\tDordrecht Masters\tRB Dordrecht\t2:18.07	App\\Models\\RelayTeam	131	1	23	\N	13807	13	2	\N	[]	\N
6993	2022-02-19 13:27:48	2022-02-19 13:27:48	722	1.\tItaly 1\tItaly\t1:08.14	App\\Models\\RelayTeam	132	1	23	\N	6814	1	2	\N	[]	\N
6994	2022-02-19 13:27:48	2022-02-19 13:27:48	724	2.\tGorizia Nuoto Asd 1\tGorizia Nuoto Asd\t1:13.56	App\\Models\\RelayTeam	133	1	23	\N	7356	231	2	\N	[]	\N
6995	2022-02-19 13:27:48	2022-02-19 13:27:48	726	3.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t1:17.80	App\\Models\\RelayTeam	135	1	23	\N	7780	239	2	\N	[]	\N
6996	2022-02-19 13:27:48	2022-02-19 13:27:48	728	4.\tRB Echt 1\tRB Echt\t1:18.93	App\\Models\\RelayTeam	139	1	23	\N	7893	15	2	\N	[]	\N
6997	2022-02-19 13:27:48	2022-02-19 13:27:48	730	5.\tDLRG Goslar 1\tDLRG Goslar\t1:19.13	App\\Models\\RelayTeam	136	1	23	\N	7913	246	2	\N	[]	\N
6998	2022-02-19 13:27:48	2022-02-19 13:27:48	732	6.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t1:21.67	App\\Models\\RelayTeam	137	1	23	\N	8167	236	2	\N	[]	\N
6999	2022-02-19 13:27:48	2022-02-19 13:27:48	734	7.\tSouth Africa 1\tSouth Africa\t1:22.29	App\\Models\\RelayTeam	138	1	23	\N	8229	232	2	\N	[]	\N
7000	2022-02-19 13:27:48	2022-02-19 13:27:48	736	8.\tBuchholz 2\tDLRG Buchholz e.V.\t1:22.96	App\\Models\\RelayTeam	142	1	23	\N	8296	234	2	\N	[]	\N
7001	2022-02-19 13:27:48	2022-02-19 13:27:48	738	9.\tHong Kong Lifesaving team 1\tHong Kong Lifesaving team\t1:23.04	App\\Models\\RelayTeam	140	1	23	\N	8304	252	2	\N	[]	\N
7002	2022-02-19 13:27:48	2022-02-19 13:27:48	740	10.\tDordrecht Senioren\tRB Dordrecht\t1:24.74	App\\Models\\RelayTeam	141	1	23	\N	8474	13	2	\N	[]	\N
7003	2022-02-19 13:27:48	2022-02-19 13:27:48	742	11.\tRB Gouda 1\tRB Gouda\t1:27.22	App\\Models\\RelayTeam	168	1	23	\N	8722	17	2	\N	[]	\N
7004	2022-02-19 13:27:48	2022-02-19 13:27:48	744	12.\tRB Echt 1\tRB Echt\t1:30.40	App\\Models\\RelayTeam	139	1	23	\N	9040	15	2	\N	[]	\N
7005	2022-02-19 13:27:48	2022-02-19 13:27:48	746	13.\tDordrecht Junioren\tRB Dordrecht\t1:34.59	App\\Models\\RelayTeam	143	1	23	\N	9459	13	2	\N	[]	\N
7006	2022-02-19 13:27:48	2022-02-19 13:27:48	748	14.\tDLRG Haltern 1\tDLRG Haltern\t1:42.70	App\\Models\\RelayTeam	145	1	23	\N	10270	241	2	\N	[]	\N
7007	2022-02-19 13:27:48	2022-02-19 13:27:48	750	15.\tRB Staphorst 1\tRB Staphorst\t1:54.91	App\\Models\\RelayTeam	146	1	23	\N	11491	26	2	\N	[]	\N
7008	2022-02-19 13:27:48	2022-02-19 13:27:48	752	16.\tDordrecht Masters\tRB Dordrecht\t1:57.22	App\\Models\\RelayTeam	147	1	23	\N	11722	13	2	\N	[]	\N
7009	2022-02-19 13:27:48	2022-02-19 13:27:48	754	DSQ\tNederland Senioren\tRB Dordrecht	App\\Models\\RelayTeam	134	1	23	1	\N	13	2	\N	[]	\N
7010	2022-02-19 13:27:48	2022-02-19 13:27:48	757	DSQ\tDLRG OG Stadtlohn e.V. 2\tDLRG OG Stadtlohn e.V.	App\\Models\\RelayTeam	172	1	23	1	\N	\N	2	\N	[]	\N
7011	2022-02-19 13:27:48	2022-02-19 13:27:48	767	1.\tBAKKER, Myrthe\t00\tRB Dordrecht\t58.22	App\\Models\\Athlete	423	1	4	\N	5822	13	2	7	[]	\N
7012	2022-02-19 13:27:48	2022-02-19 13:27:48	768	2.\tVAN DEN BERG, Sulinke\t02\tSouth Africa\t58.75	App\\Models\\Athlete	697	1	4	\N	5875	232	2	7	[]	\N
7013	2022-02-19 13:27:48	2022-02-19 13:27:48	769	3.\tACEBO MONCALIA, Eugenia\t00\tNoja-Playa Dorada\t59.44	App\\Models\\Athlete	695	1	4	\N	5944	255	2	7	[]	\N
7014	2022-02-19 13:27:48	2022-02-19 13:27:48	770	4.\tEGUILUZ DE CELIS, Paola\t01\tNoja-Playa Dorada\t1:01.28	App\\Models\\Athlete	694	1	4	\N	6128	255	2	7	[]	\N
7015	2022-02-19 13:27:48	2022-02-19 13:27:48	771	5.\tVAN RENSBURG, Dehanke\t01\tSouth Africa\t1:03.37	App\\Models\\Athlete	613	1	4	\N	6337	232	2	7	[]	\N
7016	2022-02-19 13:27:48	2022-02-19 13:27:48	772	6.\tCHISLETT, Ally\t01\tSouth Africa\t1:03.56	App\\Models\\Athlete	611	1	4	\N	6356	232	2	7	[]	\N
7017	2022-02-19 13:27:48	2022-02-19 13:27:48	773	7.\tKLOMP, Danique\t02\tRB Weert\t1:04.42	App\\Models\\Athlete	19	1	4	\N	6442	12	2	7	[]	\N
7018	2022-02-19 13:27:48	2022-02-19 13:27:48	774	8.\tDREDGE, Deborah\t02\tSouth Africa\t1:05.10	App\\Models\\Athlete	698	1	4	\N	6510	232	2	7	[]	\N
7019	2022-02-19 13:27:48	2022-02-19 13:27:48	775	9.\tSCHUERKMANN, Paula\t03\tDLRG Ascheberg-Herbern\t1:05.81	App\\Models\\Athlete	756	1	4	\N	6581	254	2	7	[]	\N
7020	2022-02-19 13:27:48	2022-02-19 13:27:48	776	10.\tJACOBS, Inge\t00\tRB Heythuysen\t1:08.27	App\\Models\\Athlete	436	1	4	\N	6827	237	2	7	[]	\N
7021	2022-02-19 13:27:48	2022-02-19 13:27:48	777	11.\tPIETERSE, Zanri\t01\tSouth Africa\t1:08.52	App\\Models\\Athlete	614	1	4	\N	6852	232	2	7	[]	\N
7022	2022-02-19 13:27:48	2022-02-19 13:27:48	778	12.\tATRES, Leonie\t00\tRB Gouda\t1:09.18	App\\Models\\Athlete	502	1	4	\N	6918	17	2	7	[]	\N
7023	2022-02-19 13:27:48	2022-02-19 13:27:48	779	13.\tSTELTING, Carolin\t02\tDLRG Buchholz e.V.\t1:10.50	App\\Models\\Athlete	616	1	4	\N	7050	234	2	7	[]	\N
7024	2022-02-19 13:27:48	2022-02-19 13:27:48	780	14.\tVENTER, Chirsna\t00\tSouth Africa\t1:10.75	App\\Models\\Athlete	620	1	4	\N	7075	232	2	7	[]	\N
7025	2022-02-19 13:27:48	2022-02-19 13:27:48	781	15.\tLILLEBO SLETTEN, Ida\t01\tStarfish SLC\t1:10.88	App\\Models\\Athlete	398	1	4	\N	7088	235	2	7	[]	\N
7026	2022-02-19 13:27:48	2022-02-19 13:27:48	782	16.\tDALHUISEN, Renske\t03\tRB Gouda\t1:11.77	App\\Models\\Athlete	30	1	4	\N	7177	17	2	7	[]	\N
7027	2022-02-19 13:27:48	2022-02-19 13:27:48	783	17.\tOESTMO, Helene Marie\t03\tStarfish SLC\t1:12.25	App\\Models\\Athlete	9	1	4	\N	7225	235	2	7	[]	\N
7028	2022-02-19 13:27:48	2022-02-19 13:27:48	784	18.\tDEN BOEF, Abigail\t02\tRB Dordrecht\t1:12.36	App\\Models\\Athlete	25	1	4	\N	7236	13	2	7	[]	\N
7029	2022-02-19 13:27:48	2022-02-19 13:27:48	785	19.\tWOLFS, Sharon\t00\tRB Heythuysen\t1:13.67	App\\Models\\Athlete	430	1	4	\N	7367	237	2	7	[]	\N
7030	2022-02-19 13:27:48	2022-02-19 13:27:48	786	20.\tLUESS, Mia Carina\t01\tDLRG Buchholz e.V.\t1:15.03	App\\Models\\Athlete	622	1	4	\N	7503	234	2	7	[]	\N
7031	2022-02-19 13:27:48	2022-02-19 13:27:48	787	21.\tMURA CITTADINI, Melissa\t03\t3T Sporting Club\t1:15.69	App\\Models\\Athlete	473	1	4	\N	7569	233	2	7	[]	\N
7032	2022-02-19 13:27:48	2022-02-19 13:27:48	788	22.\tDELL'OSPEDALE, Sara\t03\t3T Sporting Club\t1:15.71	App\\Models\\Athlete	10	1	4	\N	7571	233	2	7	[]	\N
7033	2022-02-19 13:27:48	2022-02-19 13:27:48	789	23.\tVAN LOON, Isabel\t02\tRB Gouda\t1:15.77	App\\Models\\Athlete	28	1	4	\N	7577	17	2	7	[]	\N
7034	2022-02-19 13:27:48	2022-02-19 13:27:48	790	24.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg\t1:16.22	App\\Models\\Athlete	108	1	4	\N	7622	39	2	7	[]	\N
7035	2022-02-19 13:27:48	2022-02-19 13:27:48	791	25.\tINGEBERG, Nora Boelling\t02\tStarfish SLC\t1:16.30	App\\Models\\Athlete	700	1	4	\N	7630	235	2	7	[]	\N
7036	2022-02-19 13:27:48	2022-02-19 13:27:48	792	26.\tSTOKBROECKX, Selina\t03\tRB Heythuysen\t1:17.90	App\\Models\\Athlete	405	1	4	\N	7790	237	2	7	[]	\N
7037	2022-02-19 13:27:48	2022-02-19 13:27:48	793	27.\tPISTERS, Nathalie\t01\tRB Heythuysen\t1:18.03	App\\Models\\Athlete	35	1	4	\N	7803	237	2	7	[]	\N
7038	2022-02-19 13:27:48	2022-02-19 13:27:48	794	28.\tBUNTJER, Lisa\t01\tDLRG LV Niedersachsen\t1:18.10	App\\Models\\Athlete	623	1	4	\N	7810	236	2	7	[]	\N
7039	2022-02-19 13:27:48	2022-02-19 13:27:48	795	29.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t1:21.04	App\\Models\\Athlete	403	1	4	\N	8104	13	2	7	[]	\N
7040	2022-02-19 13:27:48	2022-02-19 13:27:48	796	30.\tHOVIND GROEV, Ida\t03\tStarfish SLC\t1:21.22	App\\Models\\Athlete	40	1	4	\N	8122	235	2	7	[]	\N
7041	2022-02-19 13:27:48	2022-02-19 13:27:48	797	31.\tUTERMUELLER, Pia\t01\tDLRG Buchholz e.V.\t1:23.43	App\\Models\\Athlete	619	1	4	\N	8343	234	2	7	[]	\N
7042	2022-02-19 13:27:48	2022-02-19 13:27:48	798	32.\tANTONII, Francesca\t02\t3T Sporting Club\t1:23.51	App\\Models\\Athlete	702	1	4	\N	8351	233	2	7	[]	\N
7043	2022-02-19 13:27:48	2022-02-19 13:27:48	799	33.\tLISSMANN, Lea\t03\tDLRG Kusel KiXX\t1:26.47	App\\Models\\Athlete	64	1	4	\N	8647	238	2	7	[]	\N
7044	2022-02-19 13:27:48	2022-02-19 13:27:48	800	34.\tHEIN, Nikki\t02\tRB Staphorst\t1:29.30	App\\Models\\Athlete	409	1	4	\N	8930	26	2	7	[]	\N
7045	2022-02-19 13:27:48	2022-02-19 13:27:48	801	35.\tGELLEKOM, Lotte\t03\tRB Echt\t1:33.86	App\\Models\\Athlete	705	1	4	\N	9386	15	2	7	[]	\N
7046	2022-02-19 13:27:48	2022-02-19 13:27:48	802	36.\tEGGERDING, Pip\t03\tRB Staphorst\t1:34.71	App\\Models\\Athlete	62	1	4	\N	9471	26	2	7	[]	\N
7047	2022-02-19 13:27:48	2022-02-19 13:27:48	803	37.\tDON, Elise\t03\tRB Dordrecht\t1:37.00	App\\Models\\Athlete	69	1	4	\N	9700	13	2	7	[]	\N
7048	2022-02-19 13:27:48	2022-02-19 13:27:48	804	38.\tDANKELMAN, Juliette\t01\tRB Staphorst\t1:40.88	App\\Models\\Athlete	757	1	4	\N	10088	26	2	7	[]	\N
7049	2022-02-19 13:27:48	2022-02-19 13:27:48	805	39.\tJANSSEN, Fabienne\t03\tRB Heythuysen\t1:43.88	App\\Models\\Athlete	57	1	4	\N	10388	237	2	7	[]	\N
7050	2022-02-19 13:27:48	2022-02-19 13:27:48	806	40.\tBOL, Melissa\t01\tRB Oss\t1:45.97	App\\Models\\Athlete	704	1	4	\N	10597	43	2	7	[]	\N
7051	2022-02-19 13:27:48	2022-02-19 13:27:48	807	41.\tHARTH, Julia\t02\tDLRG Kusel KiXX\t1:58.08	App\\Models\\Athlete	624	1	4	\N	11808	238	2	7	[]	\N
7052	2022-02-19 13:27:48	2022-02-19 13:27:48	809	1.\tVOLPINI, Federica\t93\tItaly\t52.65	App\\Models\\Athlete	487	1	4	\N	5265	1	2	8	[]	\N
7053	2022-02-19 13:27:48	2022-02-19 13:27:48	810	2.\tGARCIA SILVA, Anita\t98\tNoja-Playa Dorada\t53.19	App\\Models\\Athlete	706	1	4	\N	5319	255	2	8	[]	\N
7054	2022-02-19 13:27:48	2022-02-19 13:27:48	811	3.\tHUTTEN, Ela\t93\tRB Dordrecht\t54.75	App\\Models\\Athlete	728	1	4	\N	5475	13	2	8	[]	\N
7055	2022-02-19 13:27:48	2022-02-19 13:27:48	812	4.\tFERRARI, Samantha\t92\tItaly\t55.59	App\\Models\\Athlete	708	1	4	\N	5559	1	2	8	[]	\N
7056	2022-02-19 13:27:48	2022-02-19 13:27:48	813	5.\tPEAT, Natalie\t94\tBlack Fins Squad\t56.02	App\\Models\\Athlete	418	1	4	\N	5602	251	2	8	[]	\N
7057	2022-02-19 13:27:48	2022-02-19 13:27:48	814	6.\tCOSTA PORTILLA, Isabel\t95\tNoja-Playa Dorada\t56.81	App\\Models\\Athlete	710	1	4	\N	5681	255	2	8	[]	\N
7058	2022-02-19 13:27:48	2022-02-19 13:27:48	815	7.\tNILSSON, Josefine\t93\tLivraddarna Tyloesand\t56.96	App\\Models\\Athlete	711	1	4	\N	5696	257	2	8	[]	\N
7059	2022-02-19 13:27:48	2022-02-19 13:27:48	816	8.\tVAN DER HOEK, Charlotte\t99\tRB Dordrecht\t58.22	App\\Models\\Athlete	713	1	4	\N	5822	13	2	8	[]	\N
7060	2022-02-19 13:27:48	2022-02-19 13:27:48	817	9.\tLEANZA, Cristina\t88\tItaly\t58.86	App\\Models\\Athlete	758	1	4	\N	5886	1	2	8	[]	\N
7061	2022-02-19 13:27:48	2022-02-19 13:27:48	823	10.\tCUIJPERS, Isa\t99\tRB Heythuysen\t59.82	App\\Models\\Athlete	494	1	4	\N	5982	237	2	8	[]	\N
7062	2022-02-19 13:27:48	2022-02-19 13:27:48	824	11.\tRAS, Janneke\t95\tRB Dordrecht\t1:00.02	App\\Models\\Athlete	489	1	4	\N	6002	13	2	8	[]	\N
7063	2022-02-19 13:27:48	2022-02-19 13:27:48	825	12.\tSICKING, Kim\t99\tDLRG Ascheberg-Herbern\t1:01.60	App\\Models\\Athlete	714	1	4	\N	6160	254	2	8	[]	\N
7064	2022-02-19 13:27:48	2022-02-19 13:27:48	826	13.\tJACOBS, Marlou\t95\tRB Heythuysen\t1:02.13	App\\Models\\Athlete	498	1	4	\N	6213	237	2	8	[]	\N
7065	2022-02-19 13:27:48	2022-02-19 13:27:48	827	14.\tLOEKSTAD GJERMUNDSEN, Mia Louise\t93\tStarfish SLC\t1:03.52	App\\Models\\Athlete	493	1	4	\N	6352	235	2	8	[]	\N
7066	2022-02-19 13:27:48	2022-02-19 13:27:48	828	15.\tYUE, Wing-sue\t99\tHong Kong Lifesaving team\t1:04.02	App\\Models\\Athlete	719	1	4	\N	6402	252	2	8	[]	\N
7067	2022-02-19 13:27:48	2022-02-19 13:27:48	829	16.\tHEEMELS, Robin\t99\tRB Dordrecht\t1:04.39	App\\Models\\Athlete	727	1	4	\N	6439	13	2	8	[]	\N
7068	2022-02-19 13:27:48	2022-02-19 13:27:48	830	17.\tSCHUERKMANN, Hanna\t99\tDLRG Ascheberg-Herbern\t1:04.49	App\\Models\\Athlete	712	1	4	\N	6449	254	2	8	[]	\N
7069	2022-02-19 13:27:48	2022-02-19 13:27:48	831	18.\tVAN ZYL, Tove\t97\tSouth Africa\t1:06.09	App\\Models\\Athlete	626	1	4	\N	6609	232	2	8	[]	\N
7070	2022-02-19 13:27:48	2022-02-19 13:27:48	832	19.\tHUISINGA, Ellen\t92\tDLRG LV Niedersachsen\t1:06.27	App\\Models\\Athlete	627	1	4	\N	6627	236	2	8	[]	\N
7071	2022-02-19 13:27:48	2022-02-19 13:27:48	833	20.\tCHOW, Hei-man\t96\tHong Kong Lifesaving team\t1:08.50	App\\Models\\Athlete	720	1	4	\N	6850	252	2	8	[]	\N
7072	2022-02-19 13:27:48	2022-02-19 13:27:48	834	21.\tBRENNEISER, Lea Maria\t99\tDLRG Kusel KiXX\t1:11.93	App\\Models\\Athlete	637	1	4	\N	7193	238	2	8	[]	\N
7073	2022-02-19 13:27:48	2022-02-19 13:27:48	835	22.\tBOUTER, Renee\t98\tRB Gouda\t1:13.59	App\\Models\\Athlete	112	1	4	\N	7359	17	2	8	[]	\N
7074	2022-02-19 13:27:48	2022-02-19 13:27:48	836	23.\tMARX, Katharina\t94\tDLRG Haltern\t1:14.22	App\\Models\\Athlete	635	1	4	\N	7422	241	2	8	[]	\N
7075	2022-02-19 13:27:48	2022-02-19 13:27:48	837	24.\tSCHULTZ, Vanessa Anna\t96\tDLRG Kusel KiXX\t1:14.41	App\\Models\\Athlete	633	1	4	\N	7441	238	2	8	[]	\N
7076	2022-02-19 13:27:48	2022-02-19 13:27:48	838	25.\tMCGRORY, Celina\t99\tStarfish SLC\t1:14.55	App\\Models\\Athlete	718	1	4	\N	7455	235	2	8	[]	\N
7077	2022-02-19 13:27:48	2022-02-19 13:27:48	839	26.\tCASPERS, Tamara\t90\tRB Dordrecht\t1:15.55	App\\Models\\Athlete	632	1	4	\N	7555	13	2	8	[]	\N
7078	2022-02-19 13:27:48	2022-02-19 13:27:48	840	27.\tDE VRIES, Denise\t91\tNL Defensie Lifesaving\t1:15.91	App\\Models\\Athlete	98	1	4	\N	7591	239	2	8	[]	\N
7079	2022-02-19 13:27:48	2022-02-19 13:27:48	841	28.\tBOTT, Julia Marie\t99\tDLRG Kusel KiXX\t1:18.58	App\\Models\\Athlete	723	1	4	\N	7858	238	2	8	[]	\N
7080	2022-02-19 13:27:48	2022-02-19 13:27:48	842	29.\tKEURENTJES, Anne\t95\tRB Boxtel\t1:20.17	App\\Models\\Athlete	572	1	4	\N	8017	122	2	8	[]	\N
7081	2022-02-19 13:27:48	2022-02-19 13:27:48	843	30.\tTICHELAAR, Romy\t95\tRB Zevenaar 'De Breuly'\t1:20.54	App\\Models\\Athlete	634	1	4	\N	8054	240	2	8	[]	\N
7082	2022-02-19 13:27:48	2022-02-19 13:27:48	844	31.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:21.78	App\\Models\\Athlete	722	1	4	\N	8178	43	2	8	[]	\N
7083	2022-02-19 13:27:48	2022-02-19 13:27:48	845	32.\tVANHIJFTE, Rody\t94\tNL Defensie Lifesaving\t1:26.48	App\\Models\\Athlete	506	1	4	\N	8648	239	2	8	[]	\N
7084	2022-02-19 13:27:48	2022-02-19 13:27:48	846	33.\tVAN ZADEL, Kelly\t90\tRB Zevenaar 'De Breuly'\t1:27.44	App\\Models\\Athlete	111	1	4	\N	8744	240	2	8	[]	\N
7085	2022-02-19 13:27:48	2022-02-19 13:27:48	847	34.\tSCHULTZ, Francesca Andrea\t94\tDLRG Kusel KiXX\t1:27.58	App\\Models\\Athlete	638	1	4	\N	8758	238	2	8	[]	\N
7086	2022-02-19 13:27:48	2022-02-19 13:27:48	848	35.\tPFLIPS, Lou\t99\tDLRG Haltern\t1:29.89	App\\Models\\Athlete	721	1	4	\N	8989	241	2	8	[]	\N
7087	2022-02-19 13:27:48	2022-02-19 13:27:48	849	36.\tVAN HOEK, Kelly\t98\tRB Oss\t1:32.83	App\\Models\\Athlete	726	1	4	\N	9283	43	2	8	[]	\N
7088	2022-02-19 13:27:48	2022-02-19 13:27:48	850	37.\tWIENHOLDT, Sina\t89\tDLRG Duisburg-Homberg\t1:35.27	App\\Models\\Athlete	122	1	4	\N	9527	39	2	8	[]	\N
7089	2022-02-19 13:27:48	2022-02-19 13:27:48	851	38.\tCOMPAGNER VAN DER HEIJDEN, Louise\t91\tRB Staphorst\t1:41.29	App\\Models\\Athlete	724	1	4	\N	10129	26	2	8	[]	\N
7090	2022-02-19 13:27:48	2022-02-19 13:27:48	852	39.\tBAST, Iris\t99\tRB Oss\t1:49.69	App\\Models\\Athlete	725	1	4	\N	10969	43	2	8	[]	\N
7091	2022-02-19 13:27:48	2022-02-19 13:27:48	854	1.\tVANBUEL-GOFFIN, Nele-Cornelia\t85\tHossegor Sauvetage Cotier (FRA\t1:02.24	App\\Models\\Athlete	729	1	4	\N	6224	258	2	9	[]	\N
7092	2022-02-19 13:27:48	2022-02-19 13:27:48	855	2.\tNASS, Marina\t87\tDLRG Schwerte\t1:03.74	App\\Models\\Athlete	730	1	4	\N	6374	109	2	9	[]	\N
7093	2022-02-19 13:27:48	2022-02-19 13:27:48	856	3.\tLINDER, Anna\t86\tDLRG Ennigerloh e.V.\t1:04.53	App\\Models\\Athlete	512	1	4	\N	6453	244	2	9	[]	\N
7094	2022-02-19 13:27:48	2022-02-19 13:27:48	857	4.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t1:08.66	App\\Models\\Athlete	640	1	4	\N	6866	243	2	9	[]	\N
7095	2022-02-19 13:27:48	2022-02-19 13:27:48	858	5.\tHOHENHORST, Sabrina\t82\tDLRG Ennigerloh e.V.\t1:20.36	App\\Models\\Athlete	732	1	4	\N	8036	244	2	9	[]	\N
7096	2022-02-19 13:27:48	2022-02-19 13:27:48	860	1.\tPISTERS, Miriam\t70\tRB Heythuysen\t1:34.37	App\\Models\\Athlete	518	1	4	\N	9437	237	2	11	[]	\N
7097	2022-02-19 13:27:48	2022-02-19 13:27:48	861	2.\tSIMONS, Marielle\t71\tRB Dordrecht\t1:35.46	App\\Models\\Athlete	440	1	4	\N	9546	13	2	11	[]	\N
7098	2022-02-19 13:27:48	2022-02-19 13:27:48	862	DSQ\tSTEENBEKKERS, Erna\t71\tRB Heythuysen	App\\Models\\Athlete	759	1	4	1	\N	237	2	11	[]	\N
7099	2022-02-19 13:27:48	2022-02-19 13:27:48	865	1.\tDITTSCHAR, Steph\t68\tDLRG Ennigerloh e.V.\t1:16.96	App\\Models\\Athlete	642	1	4	\N	7696	244	2	10	[]	\N
7100	2022-02-19 13:27:48	2022-02-19 13:27:48	866	2.\tHOVER, Mieke\t61\tRB Echt\t1:25.31	App\\Models\\Athlete	519	1	4	\N	8531	15	2	10	[]	\N
7101	2022-02-19 13:27:48	2022-02-19 13:27:48	874	1.\tVAN ZYL, Jp\t00\tSouth Africa\t49.32	App\\Models\\Athlete	735	1	4	\N	4932	232	2	7	[]	\N
7102	2022-02-19 13:27:48	2022-02-19 13:27:48	875	2.\tKLEINHANS, Mark\t01\tSouth Africa\t54.00	App\\Models\\Athlete	644	1	4	\N	5400	232	2	7	[]	\N
7103	2022-02-19 13:27:48	2022-02-19 13:27:48	876	3.\tWILLOWS, Branden\t01\tSouth Africa\t54.65	App\\Models\\Athlete	650	1	4	\N	5465	232	2	7	[]	\N
7104	2022-02-19 13:27:48	2022-02-19 13:27:48	877	4.\tROESEMEIER, Elias\t01\tDLRG LV Niedersachsen\t57.01	App\\Models\\Athlete	649	1	4	\N	5701	236	2	7	[]	\N
7105	2022-02-19 13:27:48	2022-02-19 13:27:48	878	5.\tPERUMAL, Seyuran\t01\tSouth Africa\t57.54	App\\Models\\Athlete	645	1	4	\N	5754	232	2	7	[]	\N
7106	2022-02-19 13:27:48	2022-02-19 13:27:48	879	6.\tHOBUS, Iwan\t01\tRB Heythuysen\t58.41	App\\Models\\Athlete	760	1	4	\N	5841	237	2	7	[]	\N
7107	2022-02-19 13:27:48	2022-02-19 13:27:48	880	7.\tMEYER, Mirco\t01\tDLRG LV Niedersachsen\t1:02.24	App\\Models\\Athlete	736	1	4	\N	6224	236	2	7	[]	\N
7108	2022-02-19 13:27:48	2022-02-19 13:27:48	881	8.\tSLATTERY, Sean\t00\tCork Surf Lifesaving Club\t1:02.41	App\\Models\\Athlete	457	1	4	\N	6241	247	2	7	[]	\N
7109	2022-02-19 13:27:48	2022-02-19 13:27:48	882	9.\tVAN GIESEN, Christopher\t02\tRB Dordrecht\t1:03.63	App\\Models\\Athlete	738	1	4	\N	6363	13	2	7	[]	\N
7110	2022-02-19 13:27:48	2022-02-19 13:27:48	883	10.\tVERHOEF, Jop\t02\tRB Dordrecht\t1:04.57	App\\Models\\Athlete	740	1	4	\N	6457	13	2	7	[]	\N
7111	2022-02-19 13:27:48	2022-02-19 13:27:48	884	11.\tWOLTERMAN, Flynn\t03\tRB Vlissingen\t1:04.69	App\\Models\\Athlete	654	1	4	\N	6469	248	2	7	[]	\N
7112	2022-02-19 13:27:48	2022-02-19 13:27:48	885	12.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t1:05.19	App\\Models\\Athlete	656	1	4	\N	6519	17	2	7	[]	\N
7113	2022-02-19 13:27:48	2022-02-19 13:27:48	886	13.\tKUIPHOF, Robin\t03\tRB Dordrecht\t1:06.33	App\\Models\\Athlete	737	1	4	\N	6633	13	2	7	[]	\N
7114	2022-02-19 13:27:48	2022-02-19 13:27:48	887	14.\tHAUG VANDENHOVE, Jonah\t03\tStarfish SLC\t1:06.58	App\\Models\\Athlete	739	1	4	\N	6658	235	2	7	[]	\N
7115	2022-02-19 13:27:48	2022-02-19 13:27:48	888	15.\tSCHWERTHELM, Jonas\t00\tDLRG Goslar\t1:06.96	App\\Models\\Athlete	648	1	4	\N	6696	246	2	7	[]	\N
7116	2022-02-19 13:27:48	2022-02-19 13:27:48	889	16.\tKIEHNE, Maximilian\t03\tDLRG LV Niedersachsen\t1:09.02	App\\Models\\Athlete	653	1	4	\N	6902	236	2	7	[]	\N
7117	2022-02-19 13:27:48	2022-02-19 13:27:48	890	17.\tSCHWIND, Vinzenz\t02\tDLRG Nieder-Olm/Woerrstadt\t1:09.58	App\\Models\\Athlete	661	1	4	\N	6958	249	2	7	[]	\N
7118	2022-02-19 13:27:48	2022-02-19 13:27:48	891	18.\tTREDER, Mats\t03\tDLRG Haltern\t1:10.00	App\\Models\\Athlete	655	1	4	\N	7000	241	2	7	[]	\N
7119	2022-02-19 13:27:48	2022-02-19 13:27:48	892	19.\tVAN DEN AKKER, Tom\t02\tRB Echt\t1:11.33	App\\Models\\Athlete	651	1	4	\N	7133	15	2	7	[]	\N
7120	2022-02-19 13:27:48	2022-02-19 13:27:48	893	20.\tVAN HOUTEM, Jaden\t02\tRB Echt\t1:13.34	App\\Models\\Athlete	658	1	4	\N	7334	15	2	7	[]	\N
7121	2022-02-19 13:27:48	2022-02-19 13:27:48	894	21.\tSOLVANG ENGESETH, Joergen\t03\tStarfish SLC\t1:15.22	App\\Models\\Athlete	659	1	4	\N	7522	235	2	7	[]	\N
7122	2022-02-19 13:27:48	2022-02-19 13:27:48	895	22.\tHAUPTVOGEL, Aaron\t01\tDLRG Haltern\t1:16.14	App\\Models\\Athlete	665	1	4	\N	7614	241	2	7	[]	\N
7123	2022-02-19 13:27:48	2022-02-19 13:27:48	896	23.\tKAMPHUIS, Roy\t01\tRB Staphorst\t1:20.45	App\\Models\\Athlete	660	1	4	\N	8045	26	2	7	[]	\N
7124	2022-02-19 13:27:48	2022-02-19 13:27:48	897	24.\tBITTMANN, Paul\t03\tDLRG Kusel KiXX\t1:21.37	App\\Models\\Athlete	664	1	4	\N	8137	238	2	7	[]	\N
7125	2022-02-19 13:27:48	2022-02-19 13:27:48	898	25.\tKAMPHUIS, Sven\t02\tRB Staphorst\t1:22.63	App\\Models\\Athlete	663	1	4	\N	8263	26	2	7	[]	\N
7126	2022-02-19 13:27:48	2022-02-19 13:27:48	899	26.\tPOETTER, Lukas\t01\tDLRG Herzebrock-Clarholz\t1:31.59	App\\Models\\Athlete	662	1	4	\N	9159	250	2	7	[]	\N
7127	2022-02-19 13:27:48	2022-02-19 13:27:48	901	1.\tPIRODDI, Andrea Vittorio\t92\tItaly\t46.72	App\\Models\\Athlete	526	1	4	\N	4672	1	2	8	[]	\N
7128	2022-02-19 13:27:48	2022-02-19 13:27:48	902	2.\tPEZZOTTI, Fabio\t97\tItaly\t46.86	App\\Models\\Athlete	669	1	4	\N	4686	1	2	8	[]	\N
7129	2022-02-19 13:27:48	2022-02-19 13:27:48	903	3.\tKENT, Steve\t88\tBlack Fins Squad\t46.98	App\\Models\\Athlete	667	1	4	\N	4698	251	2	8	[]	\N
7130	2022-02-19 13:27:48	2022-02-19 13:27:48	904	4.\tSEZEN, Anil\t92\tDLRG Schwerte\t48.11	App\\Models\\Athlete	741	1	4	\N	4811	109	2	8	[]	\N
7131	2022-02-19 13:27:48	2022-02-19 13:27:48	905	5.\tBRANG, Tim\t97\tDLRG Schloss Holte-Stukenbrock\t48.29	App\\Models\\Athlete	742	1	4	\N	4829	259	2	8	[]	\N
7132	2022-02-19 13:27:48	2022-02-19 13:27:48	906	6.\tLEE, Sing-chung\t90\tHong Kong Lifesaving team\t49.16	App\\Models\\Athlete	744	1	4	\N	4916	252	2	8	[]	\N
7133	2022-02-19 13:27:48	2022-02-19 13:27:48	907	7.\tMAGNUSSON, Martin\t95\tLivraddarna Tyloesand\t49.70	App\\Models\\Athlete	743	1	4	\N	4970	257	2	8	[]	\N
7134	2022-02-19 13:27:48	2022-02-19 13:27:48	908	8.\tVAN ERK, Ruben\t96\tRB Dordrecht\t49.81	App\\Models\\Athlete	533	1	4	\N	4981	13	2	8	[]	\N
7135	2022-02-19 13:27:48	2022-02-19 13:27:48	909	9.\tSTOETZER, Roelof\t97\tRB Gouda\t50.80	App\\Models\\Athlete	548	1	4	\N	5080	17	2	8	[]	\N
7136	2022-02-19 13:27:48	2022-02-19 13:27:48	910	10.\tBORN, Paul\t99\tDLRG Nieder-Olm/Woerrstadt\t50.93	App\\Models\\Athlete	455	1	4	\N	5093	249	2	8	[]	\N
7137	2022-02-19 13:27:48	2022-02-19 13:27:48	911	11.\tMEERTEN, Jack\t97\tRB Echt\t51.31	App\\Models\\Athlete	135	1	4	\N	5131	15	2	8	[]	\N
7138	2022-02-19 13:27:48	2022-02-19 13:27:48	912	12.\tDRINNAN, Cole\t97\tBlack Fins Squad\t51.95	App\\Models\\Athlete	671	1	4	\N	5195	251	2	8	[]	\N
7139	2022-02-19 13:27:48	2022-02-19 13:27:48	913	13.\tHILLEBRINK, Jelmar\t95\tRB Dordrecht\t54.25	App\\Models\\Athlete	532	1	4	\N	5425	13	2	8	[]	\N
7140	2022-02-19 13:27:48	2022-02-19 13:27:48	914	14.\tWONG, Shun-lai\t97\tHong Kong Lifesaving team\t54.46	App\\Models\\Athlete	751	1	4	\N	5446	252	2	8	[]	\N
7141	2022-02-19 13:27:48	2022-02-19 13:27:48	915	15.\tCIOTOLA, Roberto\t94\tGorizia Nuoto Asd\t56.86	App\\Models\\Athlete	761	1	4	\N	5686	231	2	8	[]	\N
7142	2022-02-19 13:27:48	2022-02-19 13:27:48	916	16.\tKEMPKES, Stephan\t88\tDLRG LV Niedersachsen\t57.30	App\\Models\\Athlete	676	1	4	\N	5730	236	2	8	[]	\N
7143	2022-02-19 13:27:48	2022-02-19 13:27:48	917	17.\tDEBBELER, Jonas\t96\tDLRG Goslar\t57.85	App\\Models\\Athlete	679	1	4	\N	5785	246	2	8	[]	\N
7144	2022-02-19 13:27:48	2022-02-19 13:27:48	918	18.\tLO, Ting-kin\t96\tHong Kong Lifesaving team\t58.11	App\\Models\\Athlete	747	1	4	\N	5811	252	2	8	[]	\N
7145	2022-02-19 13:27:48	2022-02-19 13:27:48	919	19.\tHAZENOOT, Barry\t91\tNL Defensie Lifesaving\t58.34	App\\Models\\Athlete	746	1	4	\N	5834	239	2	8	[]	\N
7146	2022-02-19 13:27:48	2022-02-19 13:27:48	920	20.\tGROOT, Robert\t93\tRB Dordrecht\t58.63	App\\Models\\Athlete	762	1	4	\N	5863	13	2	8	[]	\N
7147	2022-02-19 13:27:48	2022-02-19 13:27:48	921	21.\tWILLEMS, Luuk\t97\tRB Echt\t58.93	App\\Models\\Athlete	142	1	4	\N	5893	15	2	8	[]	\N
7148	2022-02-19 13:27:48	2022-02-19 13:27:48	922	22.\tSTERNER, Jan-Ole\t95\tDLRG Goslar\t59.01	App\\Models\\Athlete	678	1	4	\N	5901	246	2	8	[]	\N
7149	2022-02-19 13:27:48	2022-02-19 13:27:48	923	23.\tLAM, Chin-chun\t97\tHong Kong Lifesaving team\t59.12	App\\Models\\Athlete	672	1	4	\N	5912	252	2	8	[]	\N
7150	2022-02-19 13:27:48	2022-02-19 13:27:48	924	24.\tMEERTEN, John\t97\tRB Echt\t59.36	App\\Models\\Athlete	154	1	4	\N	5936	15	2	8	[]	\N
7151	2022-02-19 13:27:48	2022-02-19 13:27:48	930	25.\tGELLEKOM, Jeroen\t99\tRB Echt\t59.66	App\\Models\\Athlete	750	1	4	\N	5966	15	2	8	[]	\N
7152	2022-02-19 13:27:48	2022-02-19 13:27:48	931	26.\tHILDEBRANDT, Leon\t97\tDLRG Goslar\t1:00.28	App\\Models\\Athlete	681	1	4	\N	6028	246	2	8	[]	\N
7153	2022-02-19 13:27:48	2022-02-19 13:27:48	932	27.\tRAUTENBACH, Kurt\t99\tSouth Africa\t1:00.85	App\\Models\\Athlete	673	1	4	\N	6085	232	2	8	[]	\N
7154	2022-02-19 13:27:48	2022-02-19 13:27:48	933	28.\tHAUKE, Tim\t92\tDLRG Buchholz e.V.\t1:02.09	App\\Models\\Athlete	749	1	4	\N	6209	234	2	8	[]	\N
7155	2022-02-19 13:27:48	2022-02-19 13:27:48	934	29.\tALINK, Nick\t95\tNL Defensie Lifesaving\t1:02.27	App\\Models\\Athlete	536	1	4	\N	6227	239	2	8	[]	\N
7156	2022-02-19 13:27:48	2022-02-19 13:27:48	935	30.\tDE REUVER, Tim\t99\tRB Oss\t1:02.59	App\\Models\\Athlete	150	1	4	\N	6259	43	2	8	[]	\N
7157	2022-02-19 13:27:48	2022-02-19 13:27:48	936	31.\tWIENHOLDT, Timm\t91\tDLRG Duisburg-Homberg\t1:02.75	App\\Models\\Athlete	539	1	4	\N	6275	39	2	8	[]	\N
7158	2022-02-19 13:27:48	2022-02-19 13:27:48	937	32.\tVOSS, Lennart\t94\tDLRG Buchholz e.V.\t1:03.01	App\\Models\\Athlete	748	1	4	\N	6301	234	2	8	[]	\N
7159	2022-02-19 13:27:48	2022-02-19 13:27:48	938	33.\tBOERMANN, Niklas\t97\tDLRG Haltern\t1:07.35	App\\Models\\Athlete	686	1	4	\N	6735	241	2	8	[]	\N
7160	2022-02-19 13:27:48	2022-02-19 13:27:48	939	34.\tVAN DER KROGT, Nick\t95\tRB Dordrecht\t1:08.76	App\\Models\\Athlete	683	1	4	\N	6876	13	2	8	[]	\N
7161	2022-02-19 13:27:48	2022-02-19 13:27:48	940	35.\tKUHLMANN, Justus\t98\tDLRG Haltern\t1:11.90	App\\Models\\Athlete	684	1	4	\N	7190	241	2	8	[]	\N
7162	2022-02-19 13:27:48	2022-02-19 13:27:48	941	DSQ\tRUSSCHEN, Sem\t99\tRB Dordrecht	App\\Models\\Athlete	538	1	4	1	\N	13	2	8	[]	\N
7163	2022-02-19 13:27:48	2022-02-19 13:27:48	944	1.\tFREY, Max\t86\tDLRG Buchholz e.V.\t57.22	App\\Models\\Athlete	463	1	4	\N	5722	234	2	9	[]	\N
7164	2022-02-19 13:27:48	2022-02-19 13:27:48	945	2.\tGERRIT OEVER, van 't\t87\tNL Defensie Lifesaving\t57.52	App\\Models\\Athlete	688	1	4	\N	5752	239	2	9	[]	\N
7165	2022-02-19 13:27:48	2022-02-19 13:27:48	946	3.\tVOSKAMP, Ingemar\t87\tNL Defensie Lifesaving\t1:02.40	App\\Models\\Athlete	165	1	4	\N	6240	239	2	9	[]	\N
7166	2022-02-19 13:27:48	2022-02-19 13:27:48	947	4.\tWOLTERS, Rene\t87\tDLRG OG Stadtlohn e.V.\t1:05.68	App\\Models\\Athlete	690	1	4	\N	6568	245	2	9	[]	\N
7167	2022-02-19 13:27:48	2022-02-19 13:27:48	948	5.\tVAN DER HEIJDEN, Michiel\t86\tRB Staphorst\t1:14.16	App\\Models\\Athlete	752	1	4	\N	7416	26	2	9	[]	\N
7168	2022-02-19 13:27:48	2022-02-19 13:27:48	949	6.\tSHINN, Ryan\t80\tRB Amersfoort\t1:17.56	App\\Models\\Athlete	171	1	4	\N	7756	22	2	9	[]	\N
7169	2022-02-19 13:27:48	2022-02-19 13:27:48	951	1.\tVAN GRIEKEN, Wim\t69\tRB Gouda\t1:05.43	App\\Models\\Athlete	176	1	4	\N	6543	17	2	11	[]	\N
7170	2022-02-19 13:27:48	2022-02-19 13:27:48	952	2.\tROEMEN, Sven\t70\tRB Echt\t1:05.78	App\\Models\\Athlete	173	1	4	\N	6578	15	2	11	[]	\N
7171	2022-02-19 13:27:48	2022-02-19 13:27:48	953	3.\tVAN DE GOOR, Guus\t77\tRB Echt\t1:08.35	App\\Models\\Athlete	174	1	4	\N	6835	15	2	11	[]	\N
7172	2022-02-19 13:27:48	2022-02-19 13:27:48	954	4.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t1:21.41	App\\Models\\Athlete	179	1	4	\N	8141	13	2	11	[]	\N
7173	2022-02-19 13:27:48	2022-02-19 13:27:48	956	1.\tVENOHR, Heiko\t63\tDLRG Gelsenkichen-Mitte\t55.62	App\\Models\\Athlete	754	1	4	\N	5562	260	2	10	[]	\N
7174	2022-02-19 13:27:48	2022-02-19 13:27:48	957	2.\tWALFORT, Frank\t68\tDLRG OG Stadtlohn e.V.\t1:09.70	App\\Models\\Athlete	692	1	4	\N	6970	245	2	10	[]	\N
7175	2022-02-19 13:27:48	2022-02-19 13:27:48	958	3.\tTER HUERNE, Erwin\t64\tDLRG OG Stadtlohn e.V.\t1:13.96	App\\Models\\Athlete	755	1	4	\N	7396	245	2	10	[]	\N
7176	2022-02-19 13:27:48	2022-02-19 13:27:48	959	4.\tHAKE, Wolfgang\t64\tDLRG OG Stadtlohn e.V.\t1:15.27	App\\Models\\Athlete	608	1	4	\N	7527	245	2	10	[]	\N
7177	2022-02-19 13:27:48	2022-02-19 13:27:48	960	5.\tTE HENNEPE, Hans\t68\tRB Gouda\t1:16.28	App\\Models\\Athlete	177	1	4	\N	7628	17	2	10	[]	\N
7178	2022-02-19 13:27:48	2022-02-19 13:27:48	961	6.\tPRAET, Piet\t56\tRB Dordrecht\t1:17.88	App\\Models\\Athlete	693	1	4	\N	7788	13	2	10	[]	\N
7179	2022-02-19 13:27:48	2022-02-19 13:27:49	962	7.\tBEZEMER, Dennis\t68\tRB Dordrecht\t1:22.37	App\\Models\\Athlete	467	1	4	\N	8237	13	2	10	[]	\N
7180	2022-02-19 13:27:49	2022-02-19 13:27:49	963	8.\tVAN DAM, Robert\t66\tRB Gouda\t1:35.65	App\\Models\\Athlete	557	1	4	\N	9565	17	2	10	[]	\N
7181	2022-02-19 13:27:49	2022-02-19 13:27:49	1004	1.\tBAKKER, Myrthe\t00\tRB Dordrecht\t35.98	App\\Models\\Athlete	423	1	2	\N	3598	13	2	7	[]	\N
7182	2022-02-19 13:27:49	2022-02-19 13:27:49	1006	2.\tLOCCHI, Alessia\t00\tSergio De Gregorio\t38.68	App\\Models\\Athlete	696	1	2	\N	3868	256	2	7	[]	\N
7183	2022-02-19 13:27:49	2022-02-19 13:27:49	1007	3.\tCHISLETT, Ally\t01\tSouth Africa\t38.70	App\\Models\\Athlete	611	1	2	\N	3870	232	2	7	[]	\N
7184	2022-02-19 13:27:49	2022-02-19 13:27:49	1008	4.\tVAN DEN BERG, Sulinke\t02\tSouth Africa\t39.66	App\\Models\\Athlete	697	1	2	\N	3966	232	2	7	[]	\N
7185	2022-02-19 13:27:49	2022-02-19 13:27:49	1009	5.\tFRANZOT, Emma\t00\tGorizia Nuoto Asd\t39.81	App\\Models\\Athlete	610	1	2	\N	3981	231	2	7	[]	\N
7186	2022-02-19 13:27:49	2022-02-19 13:27:49	1010	6.\tOPPERMAN, Bianca\t02\tSouth Africa\t40.88	App\\Models\\Athlete	612	1	2	\N	4088	232	2	7	[]	\N
7187	2022-02-19 13:27:49	2022-02-19 13:27:49	1011	7.\tVAN RENSBURG, Dehanke\t01\tSouth Africa\t42.78	App\\Models\\Athlete	613	1	2	\N	4278	232	2	7	[]	\N
7188	2022-02-19 13:27:49	2022-02-19 13:27:49	1012	8.\tHOELSCHER, Louisa\t03\tDLRG Ascheberg-Herbern\t42.80	App\\Models\\Athlete	699	1	2	\N	4280	254	2	7	[]	\N
7189	2022-02-19 13:27:49	2022-02-19 13:27:49	1013	9.\tDEN BOEF, Abigail\t02\tRB Dordrecht\t43.02	App\\Models\\Athlete	25	1	2	\N	4302	13	2	7	[]	\N
7190	2022-02-19 13:27:49	2022-02-19 13:27:49	1014	10.\tSMIT, Carli\t02\tSouth Africa\t43.66	App\\Models\\Athlete	617	1	2	\N	4366	232	2	7	[]	\N
7191	2022-02-19 13:27:49	2022-02-19 13:27:49	1015	11.\tBRINK, Celine\t00\tRB Dordrecht\t43.79	App\\Models\\Athlete	94	1	2	\N	4379	13	2	7	[]	\N
7192	2022-02-19 13:27:49	2022-02-19 13:27:49	1016	12.\tDREDGE, Deborah\t02\tSouth Africa\t44.00	App\\Models\\Athlete	698	1	2	\N	4400	232	2	7	[]	\N
7193	2022-02-19 13:27:49	2022-02-19 13:27:49	1017	13.\tWITTENBERG, Lisanne\t00\tDLRG Buchholz e.V.\t44.31	App\\Models\\Athlete	618	1	2	\N	4431	234	2	7	[]	\N
7194	2022-02-19 13:27:49	2022-02-19 13:27:49	1018	14.\tSTELTING, Carolin\t02\tDLRG Buchholz e.V.\t44.86	App\\Models\\Athlete	616	1	2	\N	4486	234	2	7	[]	\N
7195	2022-02-19 13:27:49	2022-02-19 13:27:49	1019	15.\tSCHUERKMANN, Paula\t03\tDLRG Ascheberg-Herbern\t45.20	App\\Models\\Athlete	756	1	2	\N	4520	254	2	7	[]	\N
7196	2022-02-19 13:27:49	2022-02-19 13:27:49	1020	16.\tKLOMP, Danique\t02\tRB Weert\t45.31	App\\Models\\Athlete	19	1	2	\N	4531	12	2	7	[]	\N
7197	2022-02-19 13:27:49	2022-02-19 13:27:49	1021	17.\tATRES, Leonie\t00\tRB Gouda\t45.48	App\\Models\\Athlete	502	1	2	\N	4548	17	2	7	[]	\N
7198	2022-02-19 13:27:49	2022-02-19 13:27:49	1022	18.\tWOLFS, Sharon\t00\tRB Heythuysen\t45.54	App\\Models\\Athlete	430	1	2	\N	4554	237	2	7	[]	\N
7199	2022-02-19 13:27:49	2022-02-19 13:27:49	1023	19.\tJOHNEN, Saskia\t00\tDLRG Duisburg-Homberg\t45.79	App\\Models\\Athlete	108	1	2	\N	4579	39	2	7	[]	\N
7200	2022-02-19 13:27:49	2022-02-19 13:27:49	1024	20.\tLUESS, Mia Carina\t01\tDLRG Buchholz e.V.\t45.86	App\\Models\\Athlete	622	1	2	\N	4586	234	2	7	[]	\N
7201	2022-02-19 13:27:49	2022-02-19 13:27:49	1025	21.\tDALHUISEN, Renske\t03\tRB Gouda\t46.06	App\\Models\\Athlete	30	1	2	\N	4606	17	2	7	[]	\N
7202	2022-02-19 13:27:49	2022-02-19 13:27:49	1026	22.\tPERDIJK, Micky\t02\tRB Gouda\t46.55	App\\Models\\Athlete	703	1	2	\N	4655	17	2	7	[]	\N
7203	2022-02-19 13:27:49	2022-02-19 13:27:49	1027	23.\tOESTMO, Helene Marie\t03\tStarfish SLC\t46.68	App\\Models\\Athlete	9	1	2	\N	4668	235	2	7	[]	\N
7204	2022-02-19 13:27:49	2022-02-19 13:27:49	1028	24.\tWESTENENG, Femke\t03\tRB Gouda\t47.01	App\\Models\\Athlete	763	1	2	\N	4701	17	2	7	[]	\N
7205	2022-02-19 13:27:49	2022-02-19 13:27:49	1029	25.\tGUELI, Beatrice\t03\t3T Sporting Club\t47.47	App\\Models\\Athlete	615	1	2	\N	4747	233	2	7	[]	\N
7206	2022-02-19 13:27:49	2022-02-19 13:27:49	1030	26.\tLILLEBO SLETTEN, Ida\t01\tStarfish SLC\t47.90	App\\Models\\Athlete	398	1	2	\N	4790	235	2	7	[]	\N
7207	2022-02-19 13:27:49	2022-02-19 13:27:49	1031	27.\tBOROWIAK, Kimberley\t02\tDLRG LV Niedersachsen\t48.19	App\\Models\\Athlete	399	1	2	\N	4819	236	2	7	[]	\N
7208	2022-02-19 13:27:49	2022-02-19 13:27:49	1032	28.\tVENTER, Chirsna\t00\tSouth Africa\t48.68	App\\Models\\Athlete	620	1	2	\N	4868	232	2	7	[]	\N
7209	2022-02-19 13:27:49	2022-02-19 13:27:49	1033	29.\tINGEBERG, Nora Boelling\t02\tStarfish SLC\t48.96	App\\Models\\Athlete	700	1	2	\N	4896	235	2	7	[]	\N
7210	2022-02-19 13:27:49	2022-02-19 13:27:49	1034	30.\tDELL'OSPEDALE, Sara\t03\t3T Sporting Club\t49.00	App\\Models\\Athlete	10	1	2	\N	4900	233	2	7	[]	\N
7211	2022-02-19 13:27:49	2022-02-19 13:27:49	1035	31.\tMURA CITTADINI, Melissa\t03\t3T Sporting Club\t49.35	App\\Models\\Athlete	473	1	2	\N	4935	233	2	7	[]	\N
7212	2022-02-19 13:27:49	2022-02-19 13:27:49	1036	32.\tJACOBS, Inge\t00\tRB Heythuysen\t49.65	App\\Models\\Athlete	436	1	2	\N	4965	237	2	7	[]	\N
7213	2022-02-19 13:27:49	2022-02-19 13:27:49	1037	33.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t50.35	App\\Models\\Athlete	403	1	2	\N	5035	13	2	7	[]	\N
7214	2022-02-19 13:27:49	2022-02-19 13:27:49	1038	34.\tPISTERS, Nathalie\t01\tRB Heythuysen\t51.24	App\\Models\\Athlete	35	1	2	\N	5124	237	2	7	[]	\N
7215	2022-02-19 13:27:49	2022-02-19 13:27:49	1039	35.\tVAN LOON, Isabel\t02\tRB Gouda\t51.29	App\\Models\\Athlete	28	1	2	\N	5129	17	2	7	[]	\N
7216	2022-02-19 13:27:49	2022-02-19 13:27:49	1040	36.\tJANSSEN, Isabelle\t00\tRB Dordrecht\t51.69	App\\Models\\Athlete	109	1	2	\N	5169	13	2	7	[]	\N
7217	2022-02-19 13:27:49	2022-02-19 13:27:49	1041	37.\tUTERMUELLER, Pia\t01\tDLRG Buchholz e.V.\t52.06	App\\Models\\Athlete	619	1	2	\N	5206	234	2	7	[]	\N
7218	2022-02-19 13:27:49	2022-02-19 13:27:49	1042	38.\tVAN DER ELSEN, Maud\t03\tRB Nederweert\t52.27	App\\Models\\Athlete	764	1	2	\N	5227	35	2	7	[]	\N
7219	2022-02-19 13:27:49	2022-02-19 13:27:49	1043	39.\tHOVIND GROEV, Ida\t03\tStarfish SLC\t53.42	App\\Models\\Athlete	40	1	2	\N	5342	235	2	7	[]	\N
7220	2022-02-19 13:27:49	2022-02-19 13:27:49	1044	40.\tLISSMANN, Lea\t03\tDLRG Kusel KiXX\t53.47	App\\Models\\Athlete	64	1	2	\N	5347	238	2	7	[]	\N
7221	2022-02-19 13:27:49	2022-02-19 13:27:49	1045	41.\tJANSSEN, Fabienne\t03\tRB Heythuysen\t53.54	App\\Models\\Athlete	57	1	2	\N	5354	237	2	7	[]	\N
7222	2022-02-19 13:27:49	2022-02-19 13:27:49	1046	42.\tBUNTJER, Lisa\t01\tDLRG LV Niedersachsen\t54.31	App\\Models\\Athlete	623	1	2	\N	5431	236	2	7	[]	\N
7223	2022-02-19 13:27:49	2022-02-19 13:27:49	1047	43.\tANTONII, Francesca\t02\t3T Sporting Club\t57.86	App\\Models\\Athlete	702	1	2	\N	5786	233	2	7	[]	\N
7224	2022-02-19 13:27:49	2022-02-19 13:27:49	1048	44.\tHOEHNE, Charlotte\t03\tDLRG Ascheberg-Herbern\t1:00.48	App\\Models\\Athlete	701	1	2	\N	6048	254	2	7	[]	\N
7225	2022-02-19 13:27:49	2022-02-19 13:27:49	1049	45.\tHARTH, Julia\t02\tDLRG Kusel KiXX\t1:03.41	App\\Models\\Athlete	624	1	2	\N	6341	238	2	7	[]	\N
7226	2022-02-19 13:27:49	2022-02-19 13:27:49	1050	46.\tPRIORI, Valentiana\t03\t3T Sporting Club\t1:03.79	App\\Models\\Athlete	765	1	2	\N	6379	233	2	7	[]	\N
7227	2022-02-19 13:27:49	2022-02-19 13:27:49	1051	sick\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	1	2	0	\N	43	2	7	[]	\N
7228	2022-02-19 13:27:49	2022-02-19 13:27:49	1057	1.\tLEANZA, Cristina\t88\tItaly\t35.67	App\\Models\\Athlete	758	1	2	\N	3567	1	2	8	[]	\N
7229	2022-02-19 13:27:49	2022-02-19 13:27:49	1058	2.\tMARZELLA, Alice\t94\tItaly\t36.33	App\\Models\\Athlete	709	1	2	\N	3633	1	2	8	[]	\N
7230	2022-02-19 13:27:49	2022-02-19 13:27:49	1059	3.\tLUEHR, Kirsten\t91\tDLRG Schwerte\t36.92	App\\Models\\Athlete	707	1	2	\N	3692	109	2	8	[]	\N
7231	2022-02-19 13:27:49	2022-02-19 13:27:49	1060	4.\tGARCIA SILVA, Anita\t98\tNoja-Playa Dorada\t37.15	App\\Models\\Athlete	706	1	2	\N	3715	255	2	8	[]	\N
7232	2022-02-19 13:27:49	2022-02-19 13:27:49	1061	5.\tMESCHIARI, Silvia\t92\tItaly\t37.40	App\\Models\\Athlete	625	1	2	\N	3740	1	2	8	[]	\N
7233	2022-02-19 13:27:49	2022-02-19 13:27:49	1062	6.\tSENDEN, Chantal\t93\tRB Dordrecht\t37.81	App\\Models\\Athlete	421	1	2	\N	3781	13	2	8	[]	\N
7234	2022-02-19 13:27:49	2022-02-19 13:27:49	1063	7.\tPENNINGS, Elise\t95\tRB Dordrecht\t37.90	App\\Models\\Athlete	766	1	2	\N	3790	13	2	8	[]	\N
7235	2022-02-19 13:27:49	2022-02-19 13:27:49	1064	8.\tPEAT, Natalie\t94\tBlack Fins Squad\t38.33	App\\Models\\Athlete	418	1	2	\N	3833	251	2	8	[]	\N
7236	2022-02-19 13:27:49	2022-02-19 13:27:49	1065	9.\tHUTTEN, Ela\t93\tRB Dordrecht\t38.54	App\\Models\\Athlete	728	1	2	\N	3854	13	2	8	[]	\N
7237	2022-02-19 13:27:49	2022-02-19 13:27:49	1066	10.\tSICKING, Kim\t99\tDLRG Ascheberg-Herbern\t40.30	App\\Models\\Athlete	714	1	2	\N	4030	254	2	8	[]	\N
7238	2022-02-19 13:27:49	2022-02-19 13:27:49	1067	11.\tVOLPINI, Federica\t93\tItaly\t40.84	App\\Models\\Athlete	487	1	2	\N	4084	1	2	8	[]	\N
7239	2022-02-19 13:27:49	2022-02-19 13:27:49	1068	12.\tVAN DER HOEK, Charlotte\t99\tRB Dordrecht\t41.05	App\\Models\\Athlete	713	1	2	\N	4105	13	2	8	[]	\N
7240	2022-02-19 13:27:49	2022-02-19 13:27:49	1069	13.\tVAN ZYL, Tove\t97\tSouth Africa\t41.06	App\\Models\\Athlete	626	1	2	\N	4106	232	2	8	[]	\N
7241	2022-02-19 13:27:49	2022-02-19 13:27:49	1070	14.\tLOEKSTAD GJERMUNDSEN, Mia Louise\t93\tStarfish SLC\t41.54	App\\Models\\Athlete	493	1	2	\N	4154	235	2	8	[]	\N
7242	2022-02-19 13:27:49	2022-02-19 13:27:49	1071	15.\tRAS, Janneke\t95\tRB Dordrecht\t41.85	App\\Models\\Athlete	489	1	2	\N	4185	13	2	8	[]	\N
7243	2022-02-19 13:27:49	2022-02-19 13:27:49	1072	16.\tBOUTER, Renee\t98\tRB Gouda\t42.08	App\\Models\\Athlete	112	1	2	\N	4208	17	2	8	[]	\N
7244	2022-02-19 13:27:49	2022-02-19 13:27:49	1073	17.\tSCHIPHORST PREUPER, Kitty\t91\tRB Dordrecht\t43.02	App\\Models\\Athlete	715	1	2	\N	4302	13	2	8	[]	\N
7245	2022-02-19 13:27:49	2022-02-19 13:27:49	1074	18.\tCUIJPERS, Isa\t99\tRB Heythuysen\t43.11	App\\Models\\Athlete	494	1	2	\N	4311	237	2	8	[]	\N
7246	2022-02-19 13:27:49	2022-02-19 13:27:49	1075	19.\tMEUFFELS, Fiona\t95\tRB Nederweert\t43.41	App\\Models\\Athlete	89	1	2	\N	4341	35	2	8	[]	\N
7247	2022-02-19 13:27:49	2022-02-19 13:27:49	1076	20.\tCHOW, Hei-man\t96\tHong Kong Lifesaving team\t43.62	App\\Models\\Athlete	720	1	2	\N	4362	252	2	8	[]	\N
7248	2022-02-19 13:27:49	2022-02-19 13:27:49	1077	21.\tJACOBS, Marlou\t95\tRB Heythuysen\t44.22	App\\Models\\Athlete	498	1	2	\N	4422	237	2	8	[]	\N
7249	2022-02-19 13:27:49	2022-02-19 13:27:49	1078	22.\tSCHUERKMANN, Hanna\t99\tDLRG Ascheberg-Herbern\t44.34	App\\Models\\Athlete	712	1	2	\N	4434	254	2	8	[]	\N
7250	2022-02-19 13:27:49	2022-02-19 13:27:49	1079	23.\tHUISINGA, Ellen\t92\tDLRG LV Niedersachsen\t44.68	App\\Models\\Athlete	627	1	2	\N	4468	236	2	8	[]	\N
7251	2022-02-19 13:27:49	2022-02-19 13:27:49	1080	24.\tBRUIJNIKS, Kim\t99\tRB Gouda\t44.76	App\\Models\\Athlete	631	1	2	\N	4476	17	2	8	[]	\N
7252	2022-02-19 13:27:49	2022-02-19 13:27:49	1081	25.\tWEISSPHAL, Katja\t99\tDLRG Ascheberg-Herbern\t44.98	App\\Models\\Athlete	717	1	2	\N	4498	254	2	8	[]	\N
7253	2022-02-19 13:27:49	2022-02-19 13:27:49	1082	26.\tSTEIN, Saskia\t98\tDLRG LV Niedersachsen\t45.57	App\\Models\\Athlete	107	1	2	\N	4557	236	2	8	[]	\N
7254	2022-02-19 13:27:49	2022-02-19 13:27:49	1083	27.\tVAN SOEST, Elianne\t90\tNL Defensie Lifesaving\t45.95	App\\Models\\Athlete	767	1	2	\N	4595	239	2	8	[]	\N
7255	2022-02-19 13:27:49	2022-02-19 13:27:49	1084	28.\tGROOT, Kathy\t97\tRB Dordrecht\t46.01	App\\Models\\Athlete	570	1	2	\N	4601	13	2	8	[]	\N
7256	2022-02-19 13:27:49	2022-02-19 13:27:49	1085	29.\tRESINK, Aniek\t95\tRB Dordrecht\t46.70	App\\Models\\Athlete	91	1	2	\N	4670	13	2	8	[]	\N
7257	2022-02-19 13:27:49	2022-02-19 13:27:49	1086	30.\tLILLEBO SLETTEN, Ane\t97\tStarfish SLC\t47.03	App\\Models\\Athlete	716	1	2	\N	4703	235	2	8	[]	\N
7258	2022-02-19 13:27:49	2022-02-19 13:27:49	1087	31.\tKEURENTJES, Anne\t95\tRB Boxtel\t47.76	App\\Models\\Athlete	572	1	2	\N	4776	122	2	8	[]	\N
7259	2022-02-19 13:27:49	2022-02-19 13:27:49	1088	32.\tMCGRORY, Celina\t99\tStarfish SLC\t48.29	App\\Models\\Athlete	718	1	2	\N	4829	235	2	8	[]	\N
7260	2022-02-19 13:27:49	2022-02-19 13:27:49	1089	33.\tCASPERS, Tamara\t90\tRB Dordrecht\t48.45	App\\Models\\Athlete	632	1	2	\N	4845	13	2	8	[]	\N
7261	2022-02-19 13:27:49	2022-02-19 13:27:49	1090	34.\tTICHELAAR, Romy\t95\tRB Zevenaar 'De Breuly'\t48.52	App\\Models\\Athlete	634	1	2	\N	4852	240	2	8	[]	\N
7262	2022-02-19 13:27:49	2022-02-19 13:27:49	1091	35.\tSCHULTZ, Vanessa Anna\t96\tDLRG Kusel KiXX\t49.23	App\\Models\\Athlete	633	1	2	\N	4923	238	2	8	[]	\N
7263	2022-02-19 13:27:49	2022-02-19 13:27:49	1092	36.\tYTSMA, Nynke\t97\tNL Defensie Lifesaving\t49.69	App\\Models\\Athlete	99	1	2	\N	4969	239	2	8	[]	\N
7264	2022-02-19 13:27:49	2022-02-19 13:27:49	1093	37.\tVANHIJFTE, Rody\t94\tNL Defensie Lifesaving\t50.50	App\\Models\\Athlete	506	1	2	\N	5050	239	2	8	[]	\N
7265	2022-02-19 13:27:49	2022-02-19 13:27:49	1094	38.\tSPEL, Diede\t95\tRB Zwolle\t51.90	App\\Models\\Athlete	639	1	2	\N	5190	242	2	8	[]	\N
7266	2022-02-19 13:27:49	2022-02-19 13:27:49	1095	39.\tBOTT, Julia Marie\t99\tDLRG Kusel KiXX\t51.91	App\\Models\\Athlete	723	1	2	\N	5191	238	2	8	[]	\N
7267	2022-02-19 13:27:49	2022-02-19 13:27:49	1096	40.\tPFLIPS, Lou\t99\tDLRG Haltern\t54.01	App\\Models\\Athlete	721	1	2	\N	5401	241	2	8	[]	\N
7268	2022-02-19 13:27:49	2022-02-19 13:27:49	1097	41.\tSCHULTZ, Francesca Andrea\t94\tDLRG Kusel KiXX\t54.42	App\\Models\\Athlete	638	1	2	\N	5442	238	2	8	[]	\N
7269	2022-02-19 13:27:49	2022-02-19 13:27:49	1098	42.\tKOOISTRA, Kirsten\t93\tRB Amersfoort\t56.50	App\\Models\\Athlete	768	1	2	\N	5650	22	2	8	[]	\N
7270	2022-02-19 13:27:49	2022-02-19 13:27:49	1099	43.\tSCHMIEDNER, Jana\t99\tDLRG Duisburg-Homberg\t56.56	App\\Models\\Athlete	636	1	2	\N	5656	39	2	8	[]	\N
7271	2022-02-19 13:27:49	2022-02-19 13:27:49	1100	44.\tWIENHOLDT, Sina\t89\tDLRG Duisburg-Homberg\t57.72	App\\Models\\Athlete	122	1	2	\N	5772	39	2	8	[]	\N
7272	2022-02-19 13:27:49	2022-02-19 13:27:49	1101	45.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:01.13	App\\Models\\Athlete	722	1	2	\N	6113	43	2	8	[]	\N
7273	2022-02-19 13:27:49	2022-02-19 13:27:49	1102	46.\tBRESSERS, Anouk\t96\tRB Oss\t1:01.26	App\\Models\\Athlete	769	1	2	\N	6126	43	2	8	[]	\N
7274	2022-02-19 13:27:49	2022-02-19 13:27:49	1103	47.\tBAST, Iris\t99\tRB Oss\t1:11.13	App\\Models\\Athlete	725	1	2	\N	7113	43	2	8	[]	\N
7275	2022-02-19 13:27:49	2022-02-19 13:27:49	1104	sick\tABAD SIEPER, Anna Alicia\t95\tDLRG Kusel KiXX	App\\Models\\Athlete	770	1	2	0	\N	238	2	8	[]	\N
7276	2022-02-19 13:27:49	2022-02-19 13:27:49	1110	1.\tVANBUEL-GOFFIN, Nele-Cornelia\t85\tHossegor Sauvetage Cotier (FRA\t39.69	App\\Models\\Athlete	729	1	2	\N	3969	258	2	9	[]	\N
7277	2022-02-19 13:27:49	2022-02-19 13:27:49	1111	2.\tKITTEL, Christine\t85\tDLRG LV Niedersachsen\t39.77	App\\Models\\Athlete	438	1	2	\N	3977	236	2	9	[]	\N
7278	2022-02-19 13:27:49	2022-02-19 13:27:49	1112	3.\tNASS, Marina\t87\tDLRG Schwerte\t40.81	App\\Models\\Athlete	730	1	2	\N	4081	109	2	9	[]	\N
7279	2022-02-19 13:27:49	2022-02-19 13:27:49	1113	4.\tWONG, Hock-wing, Winnie\t87\tHong Kong Lifesaving team\t45.46	App\\Models\\Athlete	731	1	2	\N	4546	252	2	9	[]	\N
7280	2022-02-19 13:27:49	2022-02-19 13:27:49	1114	5.\tVAN BOGGELEN, Wendy\t87\tRB Amersfoort\t49.00	App\\Models\\Athlete	771	1	2	\N	4900	22	2	9	[]	\N
7281	2022-02-19 13:27:49	2022-02-19 13:27:49	1115	6.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t49.76	App\\Models\\Athlete	640	1	2	\N	4976	243	2	9	[]	\N
7282	2022-02-19 13:27:49	2022-02-19 13:27:49	1116	7.\tSTEVENS, Danielle\t88\tRB Oss\t52.27	App\\Models\\Athlete	641	1	2	\N	5227	43	2	9	[]	\N
7283	2022-02-19 13:27:49	2022-02-19 13:27:49	1117	8.\tLINDER, Anna\t86\tDLRG Ennigerloh e.V.\t52.31	App\\Models\\Athlete	512	1	2	\N	5231	244	2	9	[]	\N
7284	2022-02-19 13:27:49	2022-02-19 13:27:49	1118	9.\tHOHENHORST, Sabrina\t82\tDLRG Ennigerloh e.V.\t56.03	App\\Models\\Athlete	732	1	2	\N	5603	244	2	9	[]	\N
7285	2022-02-19 13:27:49	2022-02-19 13:27:49	1119	10.\tHOPMAN VAN SCHAIK, Saskia\t81\tRB Amersfoort\t58.24	App\\Models\\Athlete	772	1	2	\N	5824	22	2	9	[]	\N
7286	2022-02-19 13:27:49	2022-02-19 13:27:49	1121	1.\tVAN LOENHOUT, Marjolein\t76\tRB Dordrecht\t52.25	App\\Models\\Athlete	733	1	2	\N	5225	13	2	11	[]	\N
7287	2022-02-19 13:27:49	2022-02-19 13:27:49	1122	2.\tDURAN, Francoise\t69\tRB Amersfoort\t58.20	App\\Models\\Athlete	773	1	2	\N	5820	22	2	11	[]	\N
7288	2022-02-19 13:27:49	2022-02-19 13:27:49	1123	3.\tPISTERS, Miriam\t70\tRB Heythuysen\t58.89	App\\Models\\Athlete	518	1	2	\N	5889	237	2	11	[]	\N
7289	2022-02-19 13:27:49	2022-02-19 13:27:49	1124	4.\tSIMONS, Marielle\t71\tRB Dordrecht\t1:02.34	App\\Models\\Athlete	440	1	2	\N	6234	13	2	11	[]	\N
7290	2022-02-19 13:27:49	2022-02-19 13:27:49	1125	5.\tSTEENBEKKERS, Erna\t71\tRB Heythuysen\t1:05.69	App\\Models\\Athlete	759	1	2	\N	6569	237	2	11	[]	\N
7291	2022-02-19 13:27:49	2022-02-19 13:27:49	1127	1.\tDITTSCHAR, Steph\t68\tDLRG Ennigerloh e.V.\t52.93	App\\Models\\Athlete	642	1	2	\N	5293	244	2	10	[]	\N
7292	2022-02-19 13:27:49	2022-02-19 13:27:49	1128	2.\tHOVER, Mieke\t61\tRB Echt\t53.03	App\\Models\\Athlete	519	1	2	\N	5303	15	2	10	[]	\N
7293	2022-02-19 13:27:49	2022-02-19 13:27:49	1129	3.\tVAN DER KOOIJ, Astrid\t64\tRB Dordrecht\t1:02.58	App\\Models\\Athlete	520	1	2	\N	6258	13	2	10	[]	\N
7294	2022-02-19 13:27:49	2022-02-19 13:27:49	1130	4.\tCELIE, Wilna\t58\tRB Dordrecht\t1:06.03	App\\Models\\Athlete	734	1	2	\N	6603	13	2	10	[]	\N
7295	2022-02-19 13:27:49	2022-02-19 13:27:49	1135	1.\tVAN ZYL, Jp\t00\tSouth Africa\t33.44	App\\Models\\Athlete	735	1	2	\N	3344	232	2	7	[]	\N
7296	2022-02-19 13:27:49	2022-02-19 13:27:49	1136	2.\tPERUMAL, Seyuran\t01\tSouth Africa\t35.97	App\\Models\\Athlete	645	1	2	\N	3597	232	2	7	[]	\N
7297	2022-02-19 13:27:49	2022-02-19 13:27:49	1137	3.\tKLEINHANS, Mark\t01\tSouth Africa\t36.26	App\\Models\\Athlete	644	1	2	\N	3626	232	2	7	[]	\N
7298	2022-02-19 13:27:49	2022-02-19 13:27:49	1138	4.\tVAN GIESEN, Christopher\t02\tRB Dordrecht\t36.61	App\\Models\\Athlete	738	1	2	\N	3661	13	2	7	[]	\N
7299	2022-02-19 13:27:49	2022-02-19 13:27:49	1139	5.\tROESEMEIER, Elias\t01\tDLRG LV Niedersachsen\t36.86	App\\Models\\Athlete	649	1	2	\N	3686	236	2	7	[]	\N
7300	2022-02-19 13:27:49	2022-02-19 13:27:49	1140	6.\tDU TOIT, Botha\t00\tSouth Africa\t36.98	App\\Models\\Athlete	646	1	2	\N	3698	232	2	7	[]	\N
7301	2022-02-19 13:27:49	2022-02-19 13:27:49	1141	7.\tHOBUS, Iwan\t01\tRB Heythuysen\t37.18	App\\Models\\Athlete	760	1	2	\N	3718	237	2	7	[]	\N
7302	2022-02-19 13:27:49	2022-02-19 13:27:49	1142	8.\tIN 'T VELD, Marijn\t00\tRB Dordrecht\t37.97	App\\Models\\Athlete	599	1	2	\N	3797	13	2	7	[]	\N
7303	2022-02-19 13:27:49	2022-02-19 13:27:49	1143	9.\tMEYER, Mirco\t01\tDLRG LV Niedersachsen\t38.45	App\\Models\\Athlete	736	1	2	\N	3845	236	2	7	[]	\N
7304	2022-02-19 13:27:49	2022-02-19 13:27:49	1144	10.\tBONGERS, Rick\t00\tRB Heythuysen\t38.70	App\\Models\\Athlete	138	1	2	\N	3870	237	2	7	[]	\N
7305	2022-02-19 13:27:49	2022-02-19 13:27:49	1145	11.\tBENSMANN, Luca\t01\tDLRG LV Niedersachsen\t38.90	App\\Models\\Athlete	647	1	2	\N	3890	236	2	7	[]	\N
7306	2022-02-19 13:27:49	2022-02-19 13:27:49	1146	12.\tSLATTERY, Sean\t00\tCork Surf Lifesaving Club\t38.93	App\\Models\\Athlete	457	1	2	\N	3893	247	2	7	[]	\N
7307	2022-02-19 13:27:49	2022-02-19 13:27:49	1147	13.\tKUIPHOF, Robin\t03\tRB Dordrecht\t39.19	App\\Models\\Athlete	737	1	2	\N	3919	13	2	7	[]	\N
7308	2022-02-19 13:27:49	2022-02-19 13:27:49	1148	14.\tSCHWERTHELM, Jonas\t00\tDLRG Goslar\t40.01	App\\Models\\Athlete	648	1	2	\N	4001	246	2	7	[]	\N
7309	2022-02-19 13:27:49	2022-02-19 13:27:49	1149	15.\tKIEHNE, Maximilian\t03\tDLRG LV Niedersachsen\t40.31	App\\Models\\Athlete	653	1	2	\N	4031	236	2	7	[]	\N
7310	2022-02-19 13:27:49	2022-02-19 13:27:49	1150	16.\tTREDER, Mats\t03\tDLRG Haltern\t40.64	App\\Models\\Athlete	655	1	2	\N	4064	241	2	7	[]	\N
7311	2022-02-19 13:27:49	2022-02-19 13:27:49	1151	17.\tHAUG VANDENHOVE, Jonah\t03\tStarfish SLC\t41.50	App\\Models\\Athlete	739	1	2	\N	4150	235	2	7	[]	\N
7312	2022-02-19 13:27:49	2022-02-19 13:27:49	1152	18.\tWOLTERMAN, Flynn\t03\tRB Vlissingen\t42.28	App\\Models\\Athlete	654	1	2	\N	4228	248	2	7	[]	\N
7313	2022-02-19 13:27:49	2022-02-19 13:27:49	1153	19.\tVERHOEF, Jop\t02\tRB Dordrecht\t42.39	App\\Models\\Athlete	740	1	2	\N	4239	13	2	7	[]	\N
7314	2022-02-19 13:27:49	2022-02-19 13:27:49	1154	20.\tSCHWIND, Vinzenz\t02\tDLRG Nieder-Olm/Woerrstadt\t43.29	App\\Models\\Athlete	661	1	2	\N	4329	249	2	7	[]	\N
7315	2022-02-19 13:27:49	2022-02-19 13:27:49	1155	21.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t43.68	App\\Models\\Athlete	656	1	2	\N	4368	17	2	7	[]	\N
7316	2022-02-19 13:27:49	2022-02-19 13:27:49	1156	22.\tVAN HOUTEM, Jaden\t02\tRB Echt\t43.91	App\\Models\\Athlete	658	1	2	\N	4391	15	2	7	[]	\N
7317	2022-02-19 13:27:49	2022-02-19 13:27:49	1157	23.\tSCHULTZ, Marco Philip\t00\tDLRG Kusel KiXX\t44.82	App\\Models\\Athlete	657	1	2	\N	4482	238	2	7	[]	\N
7318	2022-02-19 13:27:49	2022-02-19 13:27:49	1220	1.\tGERRIT OEVER, van 't\t87\tNL Defensie Lifesaving\t34.48	App\\Models\\Athlete	688	1	2	\N	3448	239	2	9	[]	\N
7319	2022-02-19 13:27:49	2022-02-19 13:27:49	1221	2.\tFREY, Max\t86\tDLRG Buchholz e.V.\t35.36	App\\Models\\Athlete	463	1	2	\N	3536	234	2	9	[]	\N
7320	2022-02-19 13:27:49	2022-02-19 13:27:49	1222	3.\tDE KNOOP, Bastiaan\t86\tRB Gouda\t36.24	App\\Models\\Athlete	166	1	2	\N	3624	17	2	9	[]	\N
7321	2022-02-19 13:27:49	2022-02-19 13:27:49	1223	4.\tVOSKAMP, Ingemar\t87\tNL Defensie Lifesaving\t39.62	App\\Models\\Athlete	165	1	2	\N	3962	239	2	9	[]	\N
7322	2022-02-19 13:27:49	2022-02-19 13:27:49	1224	5.\tVAN LUIJTELAAR, Pieter\t83\tRB Boxtel\t41.19	App\\Models\\Athlete	578	1	2	\N	4119	122	2	9	[]	\N
7323	2022-02-19 13:27:49	2022-02-19 13:27:49	1225	6.\tWOLTERS, Rene\t87\tDLRG OG Stadtlohn e.V.\t42.72	App\\Models\\Athlete	690	1	2	\N	4272	245	2	9	[]	\N
7324	2022-02-19 13:27:49	2022-02-19 13:27:49	1226	7.\tSTEENSTRA, Idwer\t85\tRB Amersfoort\t47.88	App\\Models\\Athlete	579	1	2	\N	4788	22	2	9	[]	\N
7325	2022-02-19 13:27:49	2022-02-19 13:27:49	1227	8.\tSHINN, Ryan\t80\tRB Amersfoort\t50.92	App\\Models\\Athlete	171	1	2	\N	5092	22	2	9	[]	\N
7326	2022-02-19 13:27:49	2022-02-19 13:27:49	1228	9.\tHOPMAN, Erik\t82\tRB Amersfoort\t1:03.10	App\\Models\\Athlete	605	1	2	\N	6310	22	2	9	[]	\N
7327	2022-02-19 13:27:49	2022-02-19 13:27:49	1230	1.\tROEMEN, Sven\t70\tRB Echt\t40.81	App\\Models\\Athlete	173	1	2	\N	4081	15	2	11	[]	\N
7328	2022-02-19 13:27:49	2022-02-19 13:27:49	1231	2.\tVAN DE GOOR, Guus\t77\tRB Echt\t45.12	App\\Models\\Athlete	174	1	2	\N	4512	15	2	11	[]	\N
7329	2022-02-19 13:27:49	2022-02-19 13:27:49	1232	3.\tUBBINK, Stefan\t78\tRB Zevenaar 'De Breuly'\t49.49	App\\Models\\Athlete	753	1	2	\N	4949	240	2	11	[]	\N
7330	2022-02-19 13:27:49	2022-02-19 13:27:49	1233	4.\tIN 'T VELD, Marcel\t69\tRB Dordrecht\t52.22	App\\Models\\Athlete	179	1	2	\N	5222	13	2	11	[]	\N
7331	2022-02-19 13:27:49	2022-02-19 13:27:49	1234	sick\tDEN BOEF, Alex\t71\tRB Dordrecht	App\\Models\\Athlete	553	1	2	0	\N	13	2	11	[]	\N
7332	2022-02-19 13:27:49	2022-02-19 13:27:49	1236	1.\tKILDERS, Hermann-Josef\t68\tDLRG Alpen\t35.24	App\\Models\\Athlete	774	1	2	\N	3524	261	2	10	[]	\N
7333	2022-02-19 13:27:49	2022-02-19 13:27:49	1237	2.\tVENOHR, Heiko\t63\tDLRG Gelsenkichen-Mitte\t41.06	App\\Models\\Athlete	754	1	2	\N	4106	260	2	10	[]	\N
7334	2022-02-19 13:27:49	2022-02-19 13:27:49	1238	3.\tBAUER, Josef\t67\tDLRG OG Stadtlohn e.V.\t41.80	App\\Models\\Athlete	691	1	2	\N	4180	245	2	10	[]	\N
7335	2022-02-19 13:27:49	2022-02-19 13:27:49	1239	4.\tWALFORT, Frank\t68\tDLRG OG Stadtlohn e.V.\t42.58	App\\Models\\Athlete	692	1	2	\N	4258	245	2	10	[]	\N
7336	2022-02-19 13:27:49	2022-02-19 13:27:49	1240	5.\tVAN DAALEN, Erik\t65\tRB Dordrecht\t44.08	App\\Models\\Athlete	175	1	2	\N	4408	13	2	10	[]	\N
7337	2022-02-19 13:27:49	2022-02-19 13:27:49	1241	6.\tHAKE, Wolfgang\t64\tDLRG OG Stadtlohn e.V.\t46.71	App\\Models\\Athlete	608	1	2	\N	4671	245	2	10	[]	\N
7338	2022-02-19 13:27:49	2022-02-19 13:27:49	1242	7.\tBEZEMER, Dennis\t68\tRB Dordrecht\t47.28	App\\Models\\Athlete	467	1	2	\N	4728	13	2	10	[]	\N
7339	2022-02-19 13:27:49	2022-02-19 13:27:49	1243	8.\tTER HUERNE, Erwin\t64\tDLRG OG Stadtlohn e.V.\t49.06	App\\Models\\Athlete	755	1	2	\N	4906	245	2	10	[]	\N
7340	2022-02-19 13:27:49	2022-02-19 13:27:49	1244	9.\tPRAET, Piet\t56\tRB Dordrecht\t51.11	App\\Models\\Athlete	693	1	2	\N	5111	13	2	10	[]	\N
7341	2022-02-19 13:27:49	2022-02-19 13:27:49	1245	10.\tLEIJTEN, Jan\t54\tRB Weert\t54.08	App\\Models\\Athlete	468	1	2	\N	5408	12	2	10	[]	\N
7342	2022-02-19 13:27:49	2022-02-19 13:27:49	1246	11.\tVAN DAM, Robert\t66\tRB Gouda\t59.80	App\\Models\\Athlete	557	1	2	\N	5980	17	2	10	[]	\N
7343	2022-02-19 13:27:49	2022-02-19 13:27:49	1247	sick\tVAN KIMMENADE, Huub\t56\tRB Weert	App\\Models\\Athlete	556	1	2	0	\N	12	2	10	[]	\N
7344	2022-02-19 13:27:49	2022-02-19 13:27:49	1248	sick\tDE REUVER, Erik\t67\tRB Oss	App\\Models\\Athlete	775	1	2	0	\N	43	2	10	[]	\N
7345	2022-02-19 13:27:49	2022-02-19 13:27:49	1252	1.\tNederland Senioren\tRB Dordrecht\t1:41.78	App\\Models\\RelayTeam	113	1	27	\N	10178	13	2	\N	[]	\N
7346	2022-02-19 13:27:49	2022-02-19 13:27:49	1254	2.\tItaly 1\tItaly\t1:42.56	App\\Models\\RelayTeam	114	1	27	\N	10256	1	2	\N	[]	\N
7347	2022-02-19 13:27:49	2022-02-19 13:27:49	1256	3.\tSouth Africa 1\tSouth Africa\t1:49.30	App\\Models\\RelayTeam	115	1	27	\N	10930	232	2	\N	[]	\N
7348	2022-02-19 13:27:49	2022-02-19 13:27:49	1258	4.\tDordrecht Senioren\tRB Dordrecht\t1:50.42	App\\Models\\RelayTeam	116	1	27	\N	11042	13	2	\N	[]	\N
7349	2022-02-19 13:27:49	2022-02-19 13:27:49	1260	5.\tSouth Africa 2\tSouth Africa\t1:57.48	App\\Models\\RelayTeam	119	1	27	\N	11748	232	2	\N	[]	\N
7350	2022-02-19 13:27:49	2022-02-19 13:27:49	1262	6.\tRB Heythuysen 1\tRB Heythuysen\t1:57.79	App\\Models\\RelayTeam	122	1	27	\N	11779	237	2	\N	[]	\N
7351	2022-02-19 13:27:49	2022-02-19 13:27:49	1264	7.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t2:00.03	App\\Models\\RelayTeam	120	1	27	\N	12003	236	2	\N	[]	\N
7352	2022-02-19 13:27:49	2022-02-19 13:27:49	1271	8.\tRB Gouda 2\tRB Gouda\t2:01.60	App\\Models\\RelayTeam	121	1	27	\N	12160	17	2	\N	[]	\N
7353	2022-02-19 13:27:49	2022-02-19 13:27:49	1273	9.\tBuchholz 1\tDLRG Buchholz e.V.\t2:03.48	App\\Models\\RelayTeam	117	1	27	\N	12348	234	2	\N	[]	\N
7354	2022-02-19 13:27:49	2022-02-19 13:27:49	1275	10.\tDLRG Ascheberg-Herbern 1\tDLRG Ascheberg-Herbern\t2:03.88	App\\Models\\RelayTeam	124	1	27	\N	12388	254	2	\N	[]	\N
7355	2022-02-19 13:27:49	2022-02-19 13:27:49	1277	11.\t3T Sporting Club 1\t3T Sporting Club\t2:04.26	App\\Models\\RelayTeam	126	1	27	\N	12426	233	2	\N	[]	\N
7356	2022-02-19 13:27:49	2022-02-19 13:27:49	1279	12.\tTeam Starfish\tStarfish SLC\t2:04.59	App\\Models\\RelayTeam	123	1	27	\N	12459	235	2	\N	[]	\N
7357	2022-02-19 13:27:49	2022-02-19 13:27:49	1281	13.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t2:05.00	App\\Models\\RelayTeam	118	1	27	\N	12500	239	2	\N	[]	\N
7358	2022-02-19 13:27:49	2022-02-19 13:27:49	1283	14.\tDordrecht Junioren\tRB Dordrecht\t2:07.83	App\\Models\\RelayTeam	125	1	27	\N	12783	13	2	\N	[]	\N
7359	2022-02-19 13:27:49	2022-02-19 13:27:49	1285	15.\tRB Gouda 1\tRB Gouda\t2:09.69	App\\Models\\RelayTeam	127	1	27	\N	12969	17	2	\N	[]	\N
7360	2022-02-19 13:27:49	2022-02-19 13:27:49	1287	16.\tDLRG Duisburg-Homberg 1\tDLRG Duisburg-Homberg\t2:14.43	App\\Models\\RelayTeam	129	1	27	\N	13443	39	2	\N	[]	\N
7361	2022-02-19 13:27:49	2022-02-19 13:27:49	1289	17.\tKusel ChiXXX\tDLRG Kusel KiXX\t2:18.26	App\\Models\\RelayTeam	128	1	27	\N	13826	238	2	\N	[]	\N
7362	2022-02-19 13:27:49	2022-02-19 13:27:49	1291	18.\tRB Amersfoort 1\tRB Amersfoort\t2:30.36	App\\Models\\RelayTeam	173	1	27	\N	15036	22	2	\N	[]	\N
7363	2022-02-19 13:27:49	2022-02-19 13:27:49	1293	19.\tDordrecht Masters\tRB Dordrecht\t2:39.39	App\\Models\\RelayTeam	131	1	27	\N	15939	13	2	\N	[]	\N
7364	2022-02-19 13:27:49	2022-02-19 13:27:49	1298	1.\tItaly 1\tItaly\t1:32.79	App\\Models\\RelayTeam	132	1	27	\N	9279	1	2	\N	[]	\N
7365	2022-02-19 13:27:50	2022-02-19 13:27:50	1300	2.\tGorizia Nuoto Asd 1\tGorizia Nuoto Asd\t1:35.04	App\\Models\\RelayTeam	133	1	27	\N	9504	231	2	\N	[]	\N
7366	2022-02-19 13:27:50	2022-02-19 13:27:50	1302	3.\tNederland Senioren\tRB Dordrecht\t1:35.27	App\\Models\\RelayTeam	134	1	27	\N	9527	13	2	\N	[]	\N
7367	2022-02-19 13:27:50	2022-02-19 13:27:50	1304	4.\tNL Defensie Lifesaving 1\tNL Defensie Lifesaving\t1:40.02	App\\Models\\RelayTeam	135	1	27	\N	10002	239	2	\N	[]	\N
7368	2022-02-19 13:27:50	2022-02-19 13:27:50	1306	5.\tHong Kong Lifesaving team 1\tHong Kong Lifesaving team\t1:40.76	App\\Models\\RelayTeam	140	1	27	\N	10076	252	2	\N	[]	\N
7369	2022-02-19 13:27:50	2022-02-19 13:27:50	1308	6.\tSouth Africa 1\tSouth Africa\t1:41.22	App\\Models\\RelayTeam	138	1	27	\N	10122	232	2	\N	[]	\N
7370	2022-02-19 13:27:50	2022-02-19 13:27:50	1310	7.\tRB Echt 1\tRB Echt\t1:42.17	App\\Models\\RelayTeam	139	1	27	\N	10217	15	2	\N	[]	\N
7371	2022-02-19 13:27:50	2022-02-19 13:27:50	1312	8.\tDLRG Goslar 1\tDLRG Goslar\t1:42.43	App\\Models\\RelayTeam	136	1	27	\N	10243	246	2	\N	[]	\N
7372	2022-02-19 13:27:50	2022-02-19 13:27:50	1314	9.\tDLRG LV Niedersachsen 1\tDLRG LV Niedersachsen\t1:43.34	App\\Models\\RelayTeam	137	1	27	\N	10334	236	2	\N	[]	\N
7373	2022-02-19 13:27:50	2022-02-19 13:27:50	1321	10.\tDordrecht Senioren\tRB Dordrecht\t1:47.86	App\\Models\\RelayTeam	141	1	27	\N	10786	13	2	\N	[]	\N
7374	2022-02-19 13:27:50	2022-02-19 13:27:50	1323	11.\tRB Gouda 1\tRB Gouda\t1:49.37	App\\Models\\RelayTeam	168	1	27	\N	10937	17	2	\N	[]	\N
7375	2022-02-19 13:27:50	2022-02-19 13:27:50	1325	12.\tBuchholz 2\tDLRG Buchholz e.V.\t1:50.16	App\\Models\\RelayTeam	142	1	27	\N	11016	234	2	\N	[]	\N
7376	2022-02-19 13:27:50	2022-02-19 13:27:50	1327	13.\tDordrecht Junioren\tRB Dordrecht\t1:52.93	App\\Models\\RelayTeam	143	1	27	\N	11293	13	2	\N	[]	\N
7377	2022-02-19 13:27:50	2022-02-19 13:27:50	1329	14.\tDLRG OG Stadtlohn e.V. 1\tDLRG OG Stadtlohn e.V.\t1:56.94	App\\Models\\RelayTeam	144	1	27	\N	11694	245	2	\N	[]	\N
7378	2022-02-19 13:27:50	2022-02-19 13:27:50	1331	15.\tDLRG Haltern 1\tDLRG Haltern\t2:00.44	App\\Models\\RelayTeam	145	1	27	\N	12044	241	2	\N	[]	\N
7379	2022-02-19 13:27:50	2022-02-19 13:27:50	1333	16.\tDordrecht Masters\tRB Dordrecht\t2:09.32	App\\Models\\RelayTeam	147	1	27	\N	12932	13	2	\N	[]	\N
7380	2022-02-19 13:27:50	2022-02-19 13:27:50	1335	sick\tRB Echt 1\tRB Echt	App\\Models\\RelayTeam	139	1	27	0	\N	15	2	\N	[]	\N
7381	2022-02-19 13:27:50	2022-02-19 13:27:50	1340	1.\tBAKKER, Myrthe\t00\tRB Dordrecht\t1:16.73	App\\Models\\Athlete	423	1	3	\N	7673	13	2	7	[]	\N
7382	2022-02-19 13:27:50	2022-02-19 13:27:50	1342	2.\tLOCCHI, Alessia\t00\tSergio De Gregorio\t1:18.01	App\\Models\\Athlete	696	1	3	\N	7801	256	2	7	[]	\N
7383	2022-02-19 13:27:50	2022-02-19 13:27:50	1343	3.\tCHISLETT, Ally\t01\tSouth Africa\t1:18.40	App\\Models\\Athlete	611	1	3	\N	7840	232	2	7	[]	\N
7384	2022-02-19 13:27:50	2022-02-19 13:27:50	1344	4.\tVAN DEN BERG, Sulinke\t02\tSouth Africa\t1:19.64	App\\Models\\Athlete	697	1	3	\N	7964	232	2	7	[]	\N
7385	2022-02-19 13:27:50	2022-02-19 13:27:50	1345	5.\tOPPERMAN, Bianca\t02\tSouth Africa\t1:19.65	App\\Models\\Athlete	612	1	3	\N	7965	232	2	7	[]	\N
7386	2022-02-19 13:27:50	2022-02-19 13:27:50	1346	6.\tFRANZOT, Emma\t00\tGorizia Nuoto Asd\t1:19.80	App\\Models\\Athlete	610	1	3	\N	7980	231	2	7	[]	\N
7387	2022-02-19 13:27:50	2022-02-19 13:27:50	1347	7.\tBRINK, Celine\t00\tRB Dordrecht\t1:28.66	App\\Models\\Athlete	94	1	3	\N	8866	13	2	7	[]	\N
7388	2022-02-19 13:27:50	2022-02-19 13:27:50	1348	8.\tPIETERSE, Zanri\t01\tSouth Africa\t1:29.27	App\\Models\\Athlete	614	1	3	\N	8927	232	2	7	[]	\N
7389	2022-02-19 13:27:50	2022-02-19 13:27:50	1349	9.\tDEN BOEF, Abigail\t02\tRB Dordrecht\t1:29.61	App\\Models\\Athlete	25	1	3	\N	8961	13	2	7	[]	\N
7390	2022-02-19 13:27:50	2022-02-19 13:27:50	1350	10.\tDREDGE, Deborah\t02\tSouth Africa\t1:29.74	App\\Models\\Athlete	698	1	3	\N	8974	232	2	7	[]	\N
7391	2022-02-19 13:27:50	2022-02-19 13:27:50	1351	11.\tWITTENBERG, Lisanne\t00\tDLRG Buchholz e.V.\t1:30.54	App\\Models\\Athlete	618	1	3	\N	9054	234	2	7	[]	\N
7392	2022-02-19 13:27:50	2022-02-19 13:27:50	1352	12.\tSMIT, Carli\t02\tSouth Africa\t1:31.34	App\\Models\\Athlete	617	1	3	\N	9134	232	2	7	[]	\N
7393	2022-02-19 13:27:50	2022-02-19 13:27:50	1353	13.\tWOLFS, Sharon\t00\tRB Heythuysen\t1:32.01	App\\Models\\Athlete	430	1	3	\N	9201	237	2	7	[]	\N
7394	2022-02-19 13:27:50	2022-02-19 13:27:50	1354	14.\tLILLEBO SLETTEN, Ida\t01\tStarfish SLC\t1:33.31	App\\Models\\Athlete	398	1	3	\N	9331	235	2	7	[]	\N
7395	2022-02-19 13:27:50	2022-02-19 13:27:50	1355	15.\tWESTENENG, Femke\t03\tRB Gouda\t1:37.68	App\\Models\\Athlete	763	1	3	\N	9768	17	2	7	[]	\N
7396	2022-02-19 13:27:50	2022-02-19 13:27:50	1356	16.\tJACOBS, Inge\t00\tRB Heythuysen\t1:40.34	App\\Models\\Athlete	436	1	3	\N	10034	237	2	7	[]	\N
7397	2022-02-19 13:27:50	2022-02-19 13:27:50	1357	17.\tBOROWIAK, Kimberley\t02\tDLRG LV Niedersachsen\t1:43.09	App\\Models\\Athlete	399	1	3	\N	10309	236	2	7	[]	\N
7398	2022-02-19 13:27:50	2022-02-19 13:27:50	1358	18.\tINGEBERG, Nora Boelling\t02\tStarfish SLC\t1:53.80	App\\Models\\Athlete	700	1	3	\N	11380	235	2	7	[]	\N
7399	2022-02-19 13:27:50	2022-02-19 13:27:50	1359	DSQ\tHOELSCHER, Louisa\t03\tDLRG Ascheberg-Herbern	App\\Models\\Athlete	699	1	3	1	\N	254	2	7	[]	\N
7400	2022-02-19 13:27:50	2022-02-19 13:27:50	1361	sick\tSTOKBROECKX, Selina\t03\tRB Heythuysen	App\\Models\\Athlete	405	1	3	0	\N	237	2	7	[]	\N
7401	2022-02-19 13:27:50	2022-02-19 13:27:50	1362	sick\tBOL, Melissa\t01\tRB Oss	App\\Models\\Athlete	704	1	3	0	\N	43	2	7	[]	\N
7402	2022-02-19 13:27:50	2022-02-19 13:27:50	1368	1.\tLEANZA, Cristina\t88\tItaly\t1:13.91	App\\Models\\Athlete	758	1	3	\N	7391	1	2	8	[]	\N
7403	2022-02-19 13:27:50	2022-02-19 13:27:50	1369	2.\tMESCHIARI, Silvia\t92\tItaly\t1:15.06	App\\Models\\Athlete	625	1	3	\N	7506	1	2	8	[]	\N
7404	2022-02-19 13:27:50	2022-02-19 13:27:50	1370	3.\tSENDEN, Chantal\t93\tRB Dordrecht\t1:15.78	App\\Models\\Athlete	421	1	3	\N	7578	13	2	8	[]	\N
7405	2022-02-19 13:27:50	2022-02-19 13:27:50	1371	4.\tFERRARI, Samantha\t92\tItaly\t1:15.83	App\\Models\\Athlete	708	1	3	\N	7583	1	2	8	[]	\N
7406	2022-02-19 13:27:50	2022-02-19 13:27:50	1372	5.\tMARZELLA, Alice\t94\tItaly\t1:16.21	App\\Models\\Athlete	709	1	3	\N	7621	1	2	8	[]	\N
7407	2022-02-19 13:27:50	2022-02-19 13:27:50	1373	6.\tLUEHR, Kirsten\t91\tDLRG Schwerte\t1:16.78	App\\Models\\Athlete	707	1	3	\N	7678	109	2	8	[]	\N
7408	2022-02-19 13:27:50	2022-02-19 13:27:50	1374	7.\tPEAT, Natalie\t94\tBlack Fins Squad\t1:16.94	App\\Models\\Athlete	418	1	3	\N	7694	251	2	8	[]	\N
7409	2022-02-19 13:27:50	2022-02-19 13:27:50	1375	8.\tVAN DER HOEK, Charlotte\t99\tRB Dordrecht\t1:23.85	App\\Models\\Athlete	713	1	3	\N	8385	13	2	8	[]	\N
7410	2022-02-19 13:27:50	2022-02-19 13:27:50	1376	9.\tHEEMELS, Robin\t99\tRB Dordrecht\t1:24.62	App\\Models\\Athlete	727	1	3	\N	8462	13	2	8	[]	\N
7411	2022-02-19 13:27:50	2022-02-19 13:27:50	1377	10.\tVAN ZYL, Tove\t97\tSouth Africa\t1:25.71	App\\Models\\Athlete	626	1	3	\N	8571	232	2	8	[]	\N
7412	2022-02-19 13:27:50	2022-02-19 13:27:50	1378	11.\tSICKING, Kim\t99\tDLRG Ascheberg-Herbern\t1:25.89	App\\Models\\Athlete	714	1	3	\N	8589	254	2	8	[]	\N
7413	2022-02-19 13:27:50	2022-02-19 13:27:50	1379	12.\tMEUFFELS, Fiona\t95\tRB Nederweert\t1:26.41	App\\Models\\Athlete	89	1	3	\N	8641	35	2	8	[]	\N
7414	2022-02-19 13:27:50	2022-02-19 13:27:50	1380	13.\tLILLEBO SLETTEN, Ane\t97\tStarfish SLC\t1:31.75	App\\Models\\Athlete	716	1	3	\N	9175	235	2	8	[]	\N
7415	2022-02-19 13:27:50	2022-02-19 13:27:50	1381	14.\tBRUIJNIKS, Kim\t99\tRB Gouda\t1:33.19	App\\Models\\Athlete	631	1	3	\N	9319	17	2	8	[]	\N
7416	2022-02-19 13:27:50	2022-02-19 13:27:50	1382	15.\tSTEIN, Saskia\t98\tDLRG LV Niedersachsen\t1:35.18	App\\Models\\Athlete	107	1	3	\N	9518	236	2	8	[]	\N
7417	2022-02-19 13:27:50	2022-02-19 13:27:50	1383	16.\tVAN DER ELSEN, Janne\t98\tRB Nederweert\t1:38.44	App\\Models\\Athlete	776	1	3	\N	9844	35	2	8	[]	\N
7418	2022-02-19 13:27:50	2022-02-19 13:27:50	1384	17.\tCASPERS, Tamara\t90\tRB Dordrecht\t1:40.37	App\\Models\\Athlete	632	1	3	\N	10037	13	2	8	[]	\N
7419	2022-02-19 13:27:50	2022-02-19 13:27:50	1385	18.\tMCGRORY, Celina\t99\tStarfish SLC\t1:40.38	App\\Models\\Athlete	718	1	3	\N	10038	235	2	8	[]	\N
7420	2022-02-19 13:27:50	2022-02-19 13:27:50	1386	19.\tYTSMA, Nynke\t97\tNL Defensie Lifesaving\t1:40.93	App\\Models\\Athlete	99	1	3	\N	10093	239	2	8	[]	\N
7421	2022-02-19 13:27:50	2022-02-19 13:27:50	1387	20.\tBOTT, Julia Marie\t99\tDLRG Kusel KiXX\t1:43.25	App\\Models\\Athlete	723	1	3	\N	10325	238	2	8	[]	\N
7422	2022-02-19 13:27:50	2022-02-19 13:27:50	1388	21.\tMARX, Katharina\t94\tDLRG Haltern\t1:46.79	App\\Models\\Athlete	635	1	3	\N	10679	241	2	8	[]	\N
7423	2022-02-19 13:27:50	2022-02-19 13:27:50	1389	22.\tBRENNEISER, Lea Maria\t99\tDLRG Kusel KiXX\t1:47.68	App\\Models\\Athlete	637	1	3	\N	10768	238	2	8	[]	\N
7424	2022-02-19 13:27:50	2022-02-19 13:27:50	1390	23.\tVAN DE WETERING, Loes\t99\tRB Oss\t1:49.29	App\\Models\\Athlete	722	1	3	\N	10929	43	2	8	[]	\N
7425	2022-02-19 13:27:50	2022-02-19 13:27:50	1391	24.\tBRESSERS, Anouk\t96\tRB Oss\t1:55.03	App\\Models\\Athlete	769	1	3	\N	11503	43	2	8	[]	\N
7426	2022-02-19 13:27:50	2022-02-19 13:27:50	1392	DSQ\tDE VRIES, Denise\t91\tNL Defensie Lifesaving	App\\Models\\Athlete	98	1	3	1	\N	239	2	8	[]	\N
7427	2022-02-19 13:27:50	2022-02-19 13:27:50	1394	sick\tABAD SIEPER, Anna Alicia\t95\tDLRG Kusel KiXX	App\\Models\\Athlete	770	1	3	0	\N	238	2	8	[]	\N
7428	2022-02-19 13:27:50	2022-02-19 13:27:50	1395	sick\tJACOBS, Marlou\t95\tRB Heythuysen	App\\Models\\Athlete	498	1	3	0	\N	237	2	8	[]	\N
7429	2022-02-19 13:27:50	2022-02-19 13:27:50	1397	1.\tKITTEL, Christine\t85\tDLRG LV Niedersachsen\t1:29.77	App\\Models\\Athlete	438	1	3	\N	8977	236	2	9	[]	\N
7430	2022-02-19 13:27:50	2022-02-19 13:27:50	1398	2.\tSTEVENS, Danielle\t88\tRB Oss\t1:58.66	App\\Models\\Athlete	641	1	3	\N	11866	43	2	9	[]	\N
7431	2022-02-19 13:27:50	2022-02-19 13:27:50	1399	sick\tVANBUEL-GOFFIN, Nele-Cornelia\t85\tHossegor Sauvetage Cotier (FRA	App\\Models\\Athlete	729	1	3	0	\N	258	2	9	[]	\N
7432	2022-02-19 13:27:50	2022-02-19 13:27:50	1401	1.\tSIMONS, Marielle\t71\tRB Dordrecht\t2:08.11	App\\Models\\Athlete	440	1	3	\N	12811	13	2	11	[]	\N
7433	2022-02-19 13:27:50	2022-02-19 13:27:50	1406	1.\tVAN ZYL, Jp\t00\tSouth Africa\t1:10.59	App\\Models\\Athlete	735	1	3	\N	7059	232	2	7	[]	\N
7434	2022-02-19 13:27:50	2022-02-19 13:27:50	1407	2.\tPERUMAL, Seyuran\t01\tSouth Africa\t1:13.73	App\\Models\\Athlete	645	1	3	\N	7373	232	2	7	[]	\N
7435	2022-02-19 13:27:50	2022-02-19 13:27:50	1408	3.\tBENSMANN, Luca\t01\tDLRG LV Niedersachsen\t1:15.04	App\\Models\\Athlete	647	1	3	\N	7504	236	2	7	[]	\N
7436	2022-02-19 13:27:50	2022-02-19 13:27:50	1409	4.\tKLEINHANS, Mark\t01\tSouth Africa\t1:15.71	App\\Models\\Athlete	644	1	3	\N	7571	232	2	7	[]	\N
7437	2022-02-19 13:27:50	2022-02-19 13:27:50	1410	5.\tHOBUS, Iwan\t01\tRB Heythuysen\t1:15.98	App\\Models\\Athlete	760	1	3	\N	7598	237	2	7	[]	\N
7438	2022-02-19 13:27:50	2022-02-19 13:27:50	1411	6.\tDU TOIT, Botha\t00\tSouth Africa\t1:18.55	App\\Models\\Athlete	646	1	3	\N	7855	232	2	7	[]	\N
7439	2022-02-19 13:27:50	2022-02-19 13:27:50	1412	7.\tVAN GIESEN, Christopher\t02\tRB Dordrecht\t1:20.58	App\\Models\\Athlete	738	1	3	\N	8058	13	2	7	[]	\N
7440	2022-02-19 13:27:50	2022-02-19 13:27:50	1413	8.\tKUIPHOF, Robin\t03\tRB Dordrecht\t1:20.64	App\\Models\\Athlete	737	1	3	\N	8064	13	2	7	[]	\N
7441	2022-02-19 13:27:50	2022-02-19 13:27:50	1414	9.\tSLATTERY, Sean\t00\tCork Surf Lifesaving Club\t1:22.13	App\\Models\\Athlete	457	1	3	\N	8213	247	2	7	[]	\N
7442	2022-02-19 13:27:50	2022-02-19 13:27:50	1415	10.\tIN 'T VELD, Marijn\t00\tRB Dordrecht\t1:23.12	App\\Models\\Athlete	599	1	3	\N	8312	13	2	7	[]	\N
7443	2022-02-19 13:27:50	2022-02-19 13:27:50	1474	1.\tLOCCHI, Alessia\t00\tSergio De Gregorio\t2:36.40	App\\Models\\Athlete	696	1	6	\N	15640	256	2	7	[]	\N
7444	2022-02-19 13:27:50	2022-02-19 13:27:50	1475	2.\tEGUILUZ DE CELIS, Paola\t01\tNoja-Playa Dorada\t2:39.87	App\\Models\\Athlete	694	1	6	\N	15987	255	2	7	[]	\N
7445	2022-02-19 13:27:50	2022-02-19 13:27:50	1476	3.\tVAN DEN BERG, Sulinke\t02\tSouth Africa\t2:43.22	App\\Models\\Athlete	697	1	6	\N	16322	232	2	7	[]	\N
7446	2022-02-19 13:27:50	2022-02-19 13:27:50	1477	4.\tOPPERMAN, Bianca\t02\tSouth Africa\t2:43.40	App\\Models\\Athlete	612	1	6	\N	16340	232	2	7	[]	\N
7447	2022-02-19 13:27:50	2022-02-19 13:27:50	1478	5.\tACEBO MONCALIA, Eugenia\t00\tNoja-Playa Dorada\t2:45.07	App\\Models\\Athlete	695	1	6	\N	16507	255	2	7	[]	\N
7448	2022-02-19 13:27:50	2022-02-19 13:27:50	1479	6.\tDREDGE, Deborah\t02\tSouth Africa\t2:49.93	App\\Models\\Athlete	698	1	6	\N	16993	232	2	7	[]	\N
7449	2022-02-19 13:27:50	2022-02-19 13:27:50	1480	7.\tBRINK, Celine\t00\tRB Dordrecht\t2:53.08	App\\Models\\Athlete	94	1	6	\N	17308	13	2	7	[]	\N
7450	2022-02-19 13:27:50	2022-02-19 13:27:50	1481	8.\tPIETERSE, Zanri\t01\tSouth Africa\t2:56.22	App\\Models\\Athlete	614	1	6	\N	17622	232	2	7	[]	\N
7451	2022-02-19 13:27:50	2022-02-19 13:27:50	1482	9.\tSMIT, Carli\t02\tSouth Africa\t2:58.04	App\\Models\\Athlete	617	1	6	\N	17804	232	2	7	[]	\N
7452	2022-02-19 13:27:50	2022-02-19 13:27:50	1483	10.\tVAN RENSBURG, Dehanke\t01\tSouth Africa\t2:58.22	App\\Models\\Athlete	613	1	6	\N	17822	232	2	7	[]	\N
7453	2022-02-19 13:27:50	2022-02-19 13:27:50	1484	11.\tOESTMO, Helene Marie\t03\tStarfish SLC\t3:01.25	App\\Models\\Athlete	9	1	6	\N	18125	235	2	7	[]	\N
7454	2022-02-19 13:27:50	2022-02-19 13:27:50	1485	12.\tKLOMP, Danique\t02\tRB Weert\t3:03.24	App\\Models\\Athlete	19	1	6	\N	18324	12	2	7	[]	\N
7455	2022-02-19 13:27:50	2022-02-19 13:27:50	1486	13.\tATRES, Leonie\t00\tRB Gouda\t3:03.35	App\\Models\\Athlete	502	1	6	\N	18335	17	2	7	[]	\N
7456	2022-02-19 13:27:50	2022-02-19 13:27:50	1487	14.\tDALHUISEN, Renske\t03\tRB Gouda\t3:03.85	App\\Models\\Athlete	30	1	6	\N	18385	17	2	7	[]	\N
7457	2022-02-19 13:27:50	2022-02-19 13:27:50	1488	15.\tWOLFS, Sharon\t00\tRB Heythuysen\t3:04.94	App\\Models\\Athlete	430	1	6	\N	18494	237	2	7	[]	\N
7458	2022-02-19 13:27:50	2022-02-19 13:27:50	1489	16.\tJACOBS, Inge\t00\tRB Heythuysen\t3:06.25	App\\Models\\Athlete	436	1	6	\N	18625	237	2	7	[]	\N
7459	2022-02-19 13:27:50	2022-02-19 13:27:50	1490	17.\tGUELI, Beatrice\t03\t3T Sporting Club\t3:07.96	App\\Models\\Athlete	615	1	6	\N	18796	233	2	7	[]	\N
7460	2022-02-19 13:27:50	2022-02-19 13:27:50	1491	18.\tWITTENBERG, Lisanne\t00\tDLRG Buchholz e.V.\t3:08.78	App\\Models\\Athlete	618	1	6	\N	18878	234	2	7	[]	\N
7461	2022-02-19 13:27:50	2022-02-19 13:27:50	1492	19.\tMURA CITTADINI, Melissa\t03\t3T Sporting Club\t3:09.92	App\\Models\\Athlete	473	1	6	\N	18992	233	2	7	[]	\N
7462	2022-02-19 13:27:50	2022-02-19 13:27:50	1493	20.\tJANSSEN, Isabelle\t00\tRB Dordrecht\t3:10.82	App\\Models\\Athlete	109	1	6	\N	19082	13	2	7	[]	\N
7463	2022-02-19 13:27:50	2022-02-19 13:27:50	1494	21.\tARKESTEIJN, Rosa\t02\tRB Dordrecht\t3:11.33	App\\Models\\Athlete	403	1	6	\N	19133	13	2	7	[]	\N
7464	2022-02-19 13:27:50	2022-02-19 13:27:50	1495	22.\tSTELTING, Carolin\t02\tDLRG Buchholz e.V.\t3:11.58	App\\Models\\Athlete	616	1	6	\N	19158	234	2	7	[]	\N
7465	2022-02-19 13:27:50	2022-02-19 13:27:50	1496	23.\tHOELSCHER, Louisa\t03\tDLRG Ascheberg-Herbern\t3:15.78	App\\Models\\Athlete	699	1	6	\N	19578	254	2	7	[]	\N
7466	2022-02-19 13:27:50	2022-02-19 13:27:50	1497	24.\tVENTER, Chirsna\t00\tSouth Africa\t3:18.13	App\\Models\\Athlete	620	1	6	\N	19813	232	2	7	[]	\N
7467	2022-02-19 13:27:50	2022-02-19 13:27:50	1498	25.\tVAN LOON, Isabel\t02\tRB Gouda\t3:18.78	App\\Models\\Athlete	28	1	6	\N	19878	17	2	7	[]	\N
7468	2022-02-19 13:27:50	2022-02-19 13:27:50	1499	26.\tPISTERS, Nathalie\t01\tRB Heythuysen\t3:18.99	App\\Models\\Athlete	35	1	6	\N	19899	237	2	7	[]	\N
7469	2022-02-19 13:27:50	2022-02-19 13:27:50	1500	27.\tBOROWIAK, Kimberley\t02\tDLRG LV Niedersachsen\t3:19.65	App\\Models\\Athlete	399	1	6	\N	19965	236	2	7	[]	\N
7470	2022-02-19 13:27:50	2022-02-19 13:27:50	1501	28.\tWESTENENG, Femke\t03\tRB Gouda\t3:20.11	App\\Models\\Athlete	763	1	6	\N	20011	17	2	7	[]	\N
7471	2022-02-19 13:27:50	2022-02-19 13:27:50	1502	29.\tSTOKBROECKX, Selina\t03\tRB Heythuysen\t3:21.08	App\\Models\\Athlete	405	1	6	\N	20108	237	2	7	[]	\N
7472	2022-02-19 13:27:50	2022-02-19 13:27:50	1503	30.\tBUNTJER, Lisa\t01\tDLRG LV Niedersachsen\t3:27.74	App\\Models\\Athlete	623	1	6	\N	20774	236	2	7	[]	\N
7473	2022-02-19 13:27:50	2022-02-19 13:27:50	1504	31.\tLISSMANN, Lea\t03\tDLRG Kusel KiXX\t3:32.52	App\\Models\\Athlete	64	1	6	\N	21252	238	2	7	[]	\N
7474	2022-02-19 13:27:50	2022-02-19 13:27:50	1505	32.\tJANSSEN, Fabienne\t03\tRB Heythuysen\t3:49.68	App\\Models\\Athlete	57	1	6	\N	22968	237	2	7	[]	\N
7475	2022-02-19 13:27:50	2022-02-19 13:27:50	1506	33.\tHOVIND GROEV, Ida\t03\tStarfish SLC\t3:58.87	App\\Models\\Athlete	40	1	6	\N	23887	235	2	7	[]	\N
7476	2022-02-19 13:27:50	2022-02-19 13:27:50	1507	34.\tHARTH, Julia\t02\tDLRG Kusel KiXX\t4:27.67	App\\Models\\Athlete	624	1	6	\N	26767	238	2	7	[]	\N
7477	2022-02-19 13:27:50	2022-02-19 13:27:50	1508	DSQ\tFRANZOT, Emma\t00\tGorizia Nuoto Asd	App\\Models\\Athlete	610	1	6	1	\N	231	2	7	[]	\N
7478	2022-02-19 13:27:50	2022-02-19 13:27:50	1510	DSQ\tCHISLETT, Ally\t01\tSouth Africa	App\\Models\\Athlete	611	1	6	1	\N	232	2	7	[]	\N
7479	2022-02-19 13:27:50	2022-02-19 13:27:50	1513	DSQ\tVAN DER ELSEN, Maud\t03\tRB Nederweert	App\\Models\\Athlete	764	1	6	1	\N	35	2	7	[]	\N
7480	2022-02-19 13:27:50	2022-02-19 13:27:50	1515	sick\tSCHUERKMANN, Paula\t03\tDLRG Ascheberg-Herbern	App\\Models\\Athlete	756	1	6	0	\N	254	2	7	[]	\N
7481	2022-02-19 13:27:50	2022-02-19 13:27:50	1516	sick\tVAN BEBBER, Danique\t00\tRB Heythuysen	App\\Models\\Athlete	621	1	6	0	\N	237	2	7	[]	\N
7482	2022-02-19 13:27:50	2022-02-19 13:27:50	1517	sick\tPERDIJK, Micky\t02\tRB Gouda	App\\Models\\Athlete	703	1	6	0	\N	17	2	7	[]	\N
7483	2022-02-19 13:27:50	2022-02-19 13:27:50	1523	1.\tFERRARI, Samantha\t92\tItaly\t2:25.74	App\\Models\\Athlete	708	1	6	\N	14574	1	2	8	[]	\N
7484	2022-02-19 13:27:50	2022-02-19 13:27:50	1524	2.\tMESCHIARI, Silvia\t92\tItaly\t2:27.59	App\\Models\\Athlete	625	1	6	\N	14759	1	2	8	[]	\N
7485	2022-02-19 13:27:50	2022-02-19 13:27:50	1525	3.\tPEAT, Natalie\t94\tBlack Fins Squad\t2:29.59	App\\Models\\Athlete	418	1	6	\N	14959	251	2	8	[]	\N
7486	2022-02-19 13:27:50	2022-02-19 13:27:50	1526	4.\tHUTTEN, Ela\t93\tRB Dordrecht\t2:37.46	App\\Models\\Athlete	728	1	6	\N	15746	13	2	8	[]	\N
7487	2022-02-19 13:27:50	2022-02-19 13:27:50	1527	5.\tHEEMELS, Robin\t99\tRB Dordrecht\t2:40.13	App\\Models\\Athlete	727	1	6	\N	16013	13	2	8	[]	\N
7488	2022-02-19 13:27:50	2022-02-19 13:27:50	1528	6.\tLUEHR, Kirsten\t91\tDLRG Schwerte\t2:42.58	App\\Models\\Athlete	707	1	6	\N	16258	109	2	8	[]	\N
7489	2022-02-19 13:27:50	2022-02-19 13:27:50	1529	7.\tRAS, Janneke\t95\tRB Dordrecht\t2:43.14	App\\Models\\Athlete	489	1	6	\N	16314	13	2	8	[]	\N
7490	2022-02-19 13:27:50	2022-02-19 13:27:50	1530	8.\tMEUFFELS, Fiona\t95\tRB Nederweert\t2:44.15	App\\Models\\Athlete	89	1	6	\N	16415	35	2	8	[]	\N
7491	2022-02-19 13:27:50	2022-02-19 13:27:50	1531	9.\tCOSTA PORTILLA, Isabel\t95\tNoja-Playa Dorada\t2:44.90	App\\Models\\Athlete	710	1	6	\N	16490	255	2	8	[]	\N
7492	2022-02-19 13:27:50	2022-02-19 13:27:50	1532	10.\tVAN DER HOEK, Charlotte\t99\tRB Dordrecht\t2:47.00	App\\Models\\Athlete	713	1	6	\N	16700	13	2	8	[]	\N
7493	2022-02-19 13:27:50	2022-02-19 13:27:50	1533	11.\tSCHIPHORST PREUPER, Kitty\t91\tRB Dordrecht\t2:47.43	App\\Models\\Athlete	715	1	6	\N	16743	13	2	8	[]	\N
7494	2022-02-19 13:27:50	2022-02-19 13:27:50	1534	12.\tLOEKSTAD GJERMUNDSEN, Mia Louise\t93\tStarfish SLC\t2:48.45	App\\Models\\Athlete	493	1	6	\N	16845	235	2	8	[]	\N
7495	2022-02-19 13:27:50	2022-02-19 13:27:50	1535	13.\tNILSSON, Josefine\t93\tLivraddarna Tyloesand\t2:48.67	App\\Models\\Athlete	711	1	6	\N	16867	257	2	8	[]	\N
7496	2022-02-19 13:27:50	2022-02-19 13:27:50	1536	14.\tYUE, Wing-sue\t99\tHong Kong Lifesaving team\t2:53.76	App\\Models\\Athlete	719	1	6	\N	17376	252	2	8	[]	\N
7497	2022-02-19 13:27:50	2022-02-19 13:27:50	1537	15.\tHUISINGA, Ellen\t92\tDLRG LV Niedersachsen\t2:53.92	App\\Models\\Athlete	627	1	6	\N	17392	236	2	8	[]	\N
7498	2022-02-19 13:27:50	2022-02-19 13:27:50	1538	16.\tLILLEBO SLETTEN, Ane\t97\tStarfish SLC\t2:56.36	App\\Models\\Athlete	716	1	6	\N	17636	235	2	8	[]	\N
7499	2022-02-19 13:27:50	2022-02-19 13:27:50	1539	17.\tSICKING, Kim\t99\tDLRG Ascheberg-Herbern\t2:57.39	App\\Models\\Athlete	714	1	6	\N	17739	254	2	8	[]	\N
7500	2022-02-19 13:27:50	2022-02-19 13:27:50	1540	18.\tWEISSPHAL, Katja\t99\tDLRG Ascheberg-Herbern\t3:07.08	App\\Models\\Athlete	717	1	6	\N	18708	254	2	8	[]	\N
7501	2022-02-19 13:27:50	2022-02-19 13:27:50	1541	19.\tBRENNEISER, Lea Maria\t99\tDLRG Kusel KiXX\t3:07.26	App\\Models\\Athlete	637	1	6	\N	18726	238	2	8	[]	\N
7502	2022-02-19 13:27:50	2022-02-19 13:27:50	1542	20.\tBOUTER, Renee\t98\tRB Gouda\t3:07.56	App\\Models\\Athlete	112	1	6	\N	18756	17	2	8	[]	\N
7503	2022-02-19 13:27:50	2022-02-19 13:27:50	1543	21.\tJACOBS, Marlou\t95\tRB Heythuysen\t3:09.04	App\\Models\\Athlete	498	1	6	\N	18904	237	2	8	[]	\N
7504	2022-02-19 13:27:50	2022-02-19 13:27:50	1544	22.\tRESINK, Aniek\t95\tRB Dordrecht\t3:10.08	App\\Models\\Athlete	91	1	6	\N	19008	13	2	8	[]	\N
7505	2022-02-19 13:27:50	2022-02-19 13:27:50	1545	23.\tMCGRORY, Celina\t99\tStarfish SLC\t3:11.10	App\\Models\\Athlete	718	1	6	\N	19110	235	2	8	[]	\N
7506	2022-02-19 13:27:50	2022-02-19 13:27:50	1546	24.\tVAN DER ELSEN, Janne\t98\tRB Nederweert\t3:13.20	App\\Models\\Athlete	776	1	6	\N	19320	35	2	8	[]	\N
7507	2022-02-19 13:27:50	2022-02-19 13:27:50	1547	25.\tSCHULTZ, Vanessa Anna\t96\tDLRG Kusel KiXX\t3:15.28	App\\Models\\Athlete	633	1	6	\N	19528	238	2	8	[]	\N
7508	2022-02-19 13:27:50	2022-02-19 13:27:50	1548	26.\tVAN SOEST, Elianne\t90\tNL Defensie Lifesaving\t3:16.22	App\\Models\\Athlete	767	1	6	\N	19622	239	2	8	[]	\N
7509	2022-02-19 13:27:50	2022-02-19 13:27:50	1549	27.\tGROOT, Kathy\t97\tRB Dordrecht\t3:22.64	App\\Models\\Athlete	570	1	6	\N	20264	13	2	8	[]	\N
7510	2022-02-19 13:27:50	2022-02-19 13:27:50	1550	28.\tBOTT, Julia Marie\t99\tDLRG Kusel KiXX\t3:23.82	App\\Models\\Athlete	723	1	6	\N	20382	238	2	8	[]	\N
7511	2022-02-19 13:27:50	2022-02-19 13:27:50	1551	29.\tPFLIPS, Lou\t99\tDLRG Haltern\t3:29.29	App\\Models\\Athlete	721	1	6	\N	20929	241	2	8	[]	\N
7512	2022-02-19 13:27:50	2022-02-19 13:27:50	1552	30.\tSCHULTZ, Francesca Andrea\t94\tDLRG Kusel KiXX\t3:31.85	App\\Models\\Athlete	638	1	6	\N	21185	238	2	8	[]	\N
7513	2022-02-19 13:27:50	2022-02-19 13:27:50	1553	31.\tVAN DE WETERING, Loes\t99\tRB Oss\t3:33.67	App\\Models\\Athlete	722	1	6	\N	21367	43	2	8	[]	\N
7514	2022-02-19 13:27:50	2022-02-19 13:27:50	1554	32.\tSPEL, Diede\t95\tRB Zwolle\t3:43.96	App\\Models\\Athlete	639	1	6	\N	22396	242	2	8	[]	\N
7515	2022-02-19 13:27:50	2022-02-19 13:27:50	1555	33.\tBRESSERS, Anouk\t96\tRB Oss\t4:53.26	App\\Models\\Athlete	769	1	6	\N	29326	43	2	8	[]	\N
7516	2022-02-19 13:27:50	2022-02-19 13:27:50	1556	DSQ\tKEURENTJES, Anne\t95\tRB Boxtel	App\\Models\\Athlete	572	1	6	1	\N	122	2	8	[]	\N
7517	2022-02-19 13:27:50	2022-02-19 13:27:50	1559	sick\tSTEIN, Saskia\t98\tDLRG LV Niedersachsen	App\\Models\\Athlete	107	1	6	0	\N	236	2	8	[]	\N
7518	2022-02-19 13:27:50	2022-02-19 13:27:50	1560	sick\tBRUIJNIKS, Kim\t99\tRB Gouda	App\\Models\\Athlete	631	1	6	0	\N	17	2	8	[]	\N
7519	2022-02-19 13:27:50	2022-02-19 13:27:50	1562	1.\tVANBUEL-GOFFIN, Nele-Cornelia\t85\tHossegor Sauvetage Cotier (FRA\t2:40.67	App\\Models\\Athlete	729	1	6	\N	16067	258	2	9	[]	\N
7520	2022-02-19 13:27:50	2022-02-19 13:27:50	1563	2.\tKITTEL, Christine\t85\tDLRG LV Niedersachsen\t2:53.84	App\\Models\\Athlete	438	1	6	\N	17384	236	2	9	[]	\N
7521	2022-02-19 13:27:50	2022-02-19 13:27:50	1564	3.\tNASS, Marina\t87\tDLRG Schwerte\t2:56.83	App\\Models\\Athlete	730	1	6	\N	17683	109	2	9	[]	\N
7522	2022-02-19 13:27:50	2022-02-19 13:27:50	1565	4.\tFREUDIGER, Jasmin\t86\tSLRG Innerschwyz\t3:00.44	App\\Models\\Athlete	640	1	6	\N	18044	243	2	9	[]	\N
7523	2022-02-19 13:27:50	2022-02-19 13:27:50	1566	5.\tSTEVENS, Danielle\t88\tRB Oss\t3:26.09	App\\Models\\Athlete	641	1	6	\N	20609	43	2	9	[]	\N
7524	2022-02-19 13:27:50	2022-02-19 13:27:50	1567	6.\tHOPMAN VAN SCHAIK, Saskia\t81\tRB Amersfoort\t3:43.58	App\\Models\\Athlete	772	1	6	\N	22358	22	2	9	[]	\N
7525	2022-02-19 13:27:50	2022-02-19 13:27:50	1568	sick\tWONG, Hock-wing, Winnie\t87\tHong Kong Lifesaving team	App\\Models\\Athlete	731	1	6	0	\N	252	2	9	[]	\N
7526	2022-02-19 13:27:50	2022-02-19 13:27:50	1570	1.\tVAN DER KOOIJ, Astrid\t64\tRB Dordrecht\t4:21.32	App\\Models\\Athlete	520	1	6	\N	26132	13	2	10	[]	\N
7527	2022-02-19 13:27:50	2022-02-19 13:27:50	1571	2.\tCELIE, Wilna\t58\tRB Dordrecht\t4:43.20	App\\Models\\Athlete	734	1	6	\N	28320	13	2	10	[]	\N
7528	2022-02-19 13:27:50	2022-02-19 13:27:50	1579	1.\tVAN ZYL, Jp\t00\tSouth Africa\t2:27.26	App\\Models\\Athlete	735	1	6	\N	14726	232	2	7	[]	\N
7529	2022-02-19 13:27:50	2022-02-19 13:27:50	1580	2.\tHOBUS, Iwan\t01\tRB Heythuysen\t2:30.66	App\\Models\\Athlete	760	1	6	\N	15066	237	2	7	[]	\N
7530	2022-02-19 13:27:50	2022-02-19 13:27:50	1581	3.\tDU TOIT, Botha\t00\tSouth Africa\t2:38.89	App\\Models\\Athlete	646	1	6	\N	15889	232	2	7	[]	\N
7531	2022-02-19 13:27:50	2022-02-19 13:27:50	1582	4.\tWILLOWS, Branden\t01\tSouth Africa\t2:39.10	App\\Models\\Athlete	650	1	6	\N	15910	232	2	7	[]	\N
7570	2022-02-19 13:27:51	2022-02-19 13:27:51	1625	18.\tHAZENOOT, Barry\t91\tNL Defensie Lifesaving\t2:34.65	App\\Models\\Athlete	746	1	6	\N	15465	239	2	8	[]	\N
7532	2022-02-19 13:27:50	2022-02-19 13:27:50	1583	5.\tBENSMANN, Luca\t01\tDLRG LV Niedersachsen\t2:39.95	App\\Models\\Athlete	647	1	6	\N	15995	236	2	7	[]	\N
7533	2022-02-19 13:27:50	2022-02-19 13:27:50	1584	6.\tKLEINHANS, Mark\t01\tSouth Africa\t2:40.82	App\\Models\\Athlete	644	1	6	\N	16082	232	2	7	[]	\N
7534	2022-02-19 13:27:50	2022-02-19 13:27:50	1585	7.\tKUIPHOF, Robin\t03\tRB Dordrecht\t2:41.72	App\\Models\\Athlete	737	1	6	\N	16172	13	2	7	[]	\N
7535	2022-02-19 13:27:50	2022-02-19 13:27:50	1586	8.\tSCHWERTHELM, Jonas\t00\tDLRG Goslar\t2:43.09	App\\Models\\Athlete	648	1	6	\N	16309	246	2	7	[]	\N
7536	2022-02-19 13:27:50	2022-02-19 13:27:50	1587	9.\tROESEMEIER, Elias\t01\tDLRG LV Niedersachsen\t2:43.56	App\\Models\\Athlete	649	1	6	\N	16356	236	2	7	[]	\N
7537	2022-02-19 13:27:50	2022-02-19 13:27:50	1588	10.\tPERUMAL, Seyuran\t01\tSouth Africa\t2:45.60	App\\Models\\Athlete	645	1	6	\N	16560	232	2	7	[]	\N
7538	2022-02-19 13:27:50	2022-02-19 13:27:50	1589	11.\tSLATTERY, Sean\t00\tCork Surf Lifesaving Club\t2:49.91	App\\Models\\Athlete	457	1	6	\N	16991	247	2	7	[]	\N
7539	2022-02-19 13:27:50	2022-02-19 13:27:50	1590	12.\tMEYER, Mirco\t01\tDLRG LV Niedersachsen\t2:56.31	App\\Models\\Athlete	736	1	6	\N	17631	236	2	7	[]	\N
7540	2022-02-19 13:27:50	2022-02-19 13:27:50	1591	13.\tVERHOEF, Jop\t02\tRB Dordrecht\t2:58.18	App\\Models\\Athlete	740	1	6	\N	17818	13	2	7	[]	\N
7541	2022-02-19 13:27:50	2022-02-19 13:27:50	1592	14.\tVAN GRIEKEN, Rob\t03\tRB Gouda\t3:00.05	App\\Models\\Athlete	656	1	6	\N	18005	17	2	7	[]	\N
7542	2022-02-19 13:27:50	2022-02-19 13:27:50	1593	15.\tRUSSCHEN, Tom\t02\tRB Dordrecht\t3:05.84	App\\Models\\Athlete	666	1	6	\N	18584	13	2	7	[]	\N
7543	2022-02-19 13:27:50	2022-02-19 13:27:50	1594	16.\tTREDER, Mats\t03\tDLRG Haltern\t3:11.43	App\\Models\\Athlete	655	1	6	\N	19143	241	2	7	[]	\N
7544	2022-02-19 13:27:50	2022-02-19 13:27:50	1595	17.\tVAN HELVOIRT, Calvin\t01\tRB Rosmalen\t3:14.87	App\\Models\\Athlete	777	1	6	\N	19487	118	2	7	[]	\N
7545	2022-02-19 13:27:50	2022-02-19 13:27:50	1596	18.\tVAN HOUTEM, Jaden\t02\tRB Echt\t3:17.53	App\\Models\\Athlete	658	1	6	\N	19753	15	2	7	[]	\N
7546	2022-02-19 13:27:50	2022-02-19 13:27:50	1597	19.\tBITTMANN, Paul\t03\tDLRG Kusel KiXX\t3:26.32	App\\Models\\Athlete	664	1	6	\N	20632	238	2	7	[]	\N
7547	2022-02-19 13:27:50	2022-02-19 13:27:50	1598	20.\tDE KLERK, Bjorn\t02\tReddingsbriagde Hardinxveld-Gi\t3:36.59	App\\Models\\Athlete	778	1	6	\N	21659	262	2	7	[]	\N
7548	2022-02-19 13:27:50	2022-02-19 13:27:50	1599	DSQ\tHAUG VANDENHOVE, Jonah\t03\tStarfish SLC	App\\Models\\Athlete	739	1	6	1	\N	235	2	7	[]	\N
7549	2022-02-19 13:27:50	2022-02-19 13:27:50	1602	DSQ\tPOETTER, Lukas\t01\tDLRG Herzebrock-Clarholz	App\\Models\\Athlete	662	1	6	1	\N	250	2	7	[]	\N
7550	2022-02-19 13:27:50	2022-02-19 13:27:50	1604	sick\tKREFT, Ben\t01\tDLRG Herzebrock-Clarholz	App\\Models\\Athlete	779	1	6	0	\N	250	2	7	[]	\N
7551	2022-02-19 13:27:50	2022-02-19 13:27:50	1605	sick\tSCHULTZ, Marco Philip\t00\tDLRG Kusel KiXX	App\\Models\\Athlete	657	1	6	0	\N	238	2	7	[]	\N
7552	2022-02-19 13:27:50	2022-02-19 13:27:50	1606	sick\tDE REUVER, Bas\t01\tRB Oss	App\\Models\\Athlete	780	1	6	0	\N	43	2	7	[]	\N
7553	2022-02-19 13:27:50	2022-02-19 13:27:50	1608	1.\tGILARDI, Federico\t91\tItaly\t2:08.88	App\\Models\\Athlete	668	1	6	\N	12888	1	2	8	[]	\N
7554	2022-02-19 13:27:50	2022-02-19 13:27:50	1609	2.\tSANNA, Daniele\t89\tItaly\t2:08.95	App\\Models\\Athlete	745	1	6	\N	12895	1	2	8	[]	\N
7555	2022-02-19 13:27:50	2022-02-19 13:27:50	1610	3.\tKENT, Steve\t88\tBlack Fins Squad\t2:15.41	App\\Models\\Athlete	667	1	6	\N	13541	251	2	8	[]	\N
7556	2022-02-19 13:27:50	2022-02-19 13:27:50	1611	4.\tBRANG, Tim\t97\tDLRG Schloss Holte-Stukenbrock\t2:16.80	App\\Models\\Athlete	742	1	6	\N	13680	259	2	8	[]	\N
7557	2022-02-19 13:27:50	2022-02-19 13:27:50	1612	5.\tCLOCCHIATTI, Brian\t98\tGorizia Nuoto Asd\t2:18.52	App\\Models\\Athlete	670	1	6	\N	13852	231	2	8	[]	\N
7558	2022-02-19 13:27:50	2022-02-19 13:27:50	1613	6.\tTOMINEC, Davide\t95\tGorizia Nuoto Asd\t2:18.59	App\\Models\\Athlete	446	1	6	\N	13859	231	2	8	[]	\N
7559	2022-02-19 13:27:50	2022-02-19 13:27:50	1614	7.\tHILLEBRINK, Jelmar\t95\tRB Dordrecht\t2:19.17	App\\Models\\Athlete	532	1	6	\N	13917	13	2	8	[]	\N
7560	2022-02-19 13:27:51	2022-02-19 13:27:51	1615	8.\tVAN DER MEIJ, Melvin\t93\tRB Dordrecht\t2:22.68	App\\Models\\Athlete	448	1	6	\N	14268	13	2	8	[]	\N
7561	2022-02-19 13:27:51	2022-02-19 13:27:51	1616	9.\tMAGNUSSON, Martin\t95\tLivraddarna Tyloesand\t2:23.33	App\\Models\\Athlete	743	1	6	\N	14333	257	2	8	[]	\N
7562	2022-02-19 13:27:51	2022-02-19 13:27:51	1617	10.\tSTOETZER, Roelof\t97\tRB Gouda\t2:25.43	App\\Models\\Athlete	548	1	6	\N	14543	17	2	8	[]	\N
7563	2022-02-19 13:27:51	2022-02-19 13:27:51	1618	11.\tDRINNAN, Cole\t97\tBlack Fins Squad\t2:27.91	App\\Models\\Athlete	671	1	6	\N	14791	251	2	8	[]	\N
7564	2022-02-19 13:27:51	2022-02-19 13:27:51	1619	12.\tWOELBING, Oliver\t99\tDLRG Kelkheim\t2:29.30	App\\Models\\Athlete	674	1	6	\N	14930	253	2	8	[]	\N
7565	2022-02-19 13:27:51	2022-02-19 13:27:51	1620	13.\tMEERTEN, Jack\t97\tRB Echt\t2:29.74	App\\Models\\Athlete	135	1	6	\N	14974	15	2	8	[]	\N
7566	2022-02-19 13:27:51	2022-02-19 13:27:51	1621	14.\tLEE, Sing-chung\t90\tHong Kong Lifesaving team\t2:30.18	App\\Models\\Athlete	744	1	6	\N	15018	252	2	8	[]	\N
7567	2022-02-19 13:27:51	2022-02-19 13:27:51	1622	15.\tKEMPKES, Stephan\t88\tDLRG LV Niedersachsen\t2:30.86	App\\Models\\Athlete	676	1	6	\N	15086	236	2	8	[]	\N
7568	2022-02-19 13:27:51	2022-02-19 13:27:51	1623	16.\tVAN ERK, Ruben\t96\tRB Dordrecht\t2:32.45	App\\Models\\Athlete	533	1	6	\N	15245	13	2	8	[]	\N
7569	2022-02-19 13:27:51	2022-02-19 13:27:51	1624	17.\tJACOBS, Joeri\t97\tRB Heythuysen\t2:34.60	App\\Models\\Athlete	781	1	6	\N	15460	237	2	8	[]	\N
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.sponsors (id, created_at, updated_at, name, valid_from, valid_until, enabled) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.teams (id, created_at, updated_at, name, slug, country_code, is_national_team) FROM stdin;
1	2022-02-06 13:49:48	2022-02-06 13:49:48	Italy	italy	\N	f
2	2022-02-06 13:49:48	2022-02-06 13:49:48	NewZlnd	newzlnd	\N	f
3	2022-02-06 13:49:48	2022-02-06 13:49:48	Spain	spain	\N	f
4	2022-02-06 13:49:48	2022-02-06 13:49:48	ACC di Salvamento	acc-di-salvamento	\N	f
5	2022-02-06 13:49:48	2022-02-06 13:49:48	Athena SC	athena-sc	\N	f
6	2022-02-06 13:49:48	2022-02-06 13:49:48	Starfish	starfish	\N	f
7	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Nordrhein	dlrg-nordrhein	\N	f
8	2022-02-06 13:49:48	2022-02-06 13:49:48	NojaPlaya	nojaplaya	\N	f
9	2022-02-06 13:49:48	2022-02-06 13:49:48	Chech R	chech-r	\N	f
10	2022-02-06 13:49:48	2022-02-06 13:49:48	St Truiden	st-truiden	\N	f
11	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Niedersachsen	dlrg-niedersachsen	\N	f
12	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Weert	rb-weert	\N	f
13	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Dordrecht	rb-dordrecht	\N	f
14	2022-02-06 13:49:48	2022-02-06 13:49:48	Romenike	romenike	\N	f
15	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Echt	rb-echt	\N	f
16	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG NiederOlm	dlrg-niederolm	\N	f
17	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Gouda	rb-gouda	\N	f
18	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Sachsen	dlrg-sachsen	\N	f
19	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Heytse	rb-heytse	\N	f
20	2022-02-06 13:49:48	2022-02-06 13:49:48	BLYTH	blyth	\N	f
21	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG ALpen	dlrg-alpen	\N	f
22	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Amersfoort	rb-amersfoort	\N	f
23	2022-02-06 13:49:48	2022-02-06 13:49:48	Austria	austria	\N	f
24	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Delft	rb-delft	\N	f
25	2022-02-06 13:49:48	2022-02-06 13:49:48	Kusel KiXXX	kusel-kixxx	\N	f
26	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Staphorst	rb-staphorst	\N	f
27	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Rheurdt-Schaephuysen	dlrg-rheurdt-schaephuysen	\N	f
28	2022-02-06 13:49:48	2022-02-06 13:49:48	Ecole de natation Everoise	ecole-de-natation-everoise	\N	f
29	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Gutersloh	dlrg-gutersloh	\N	f
30	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Bad Wuennenberg	dlrg-bad-wuennenberg	\N	f
31	2022-02-06 13:49:48	2022-02-06 13:49:48	DLRG Ludwigshafen	dlrg-ludwigshafen	\N	f
32	2022-02-06 13:49:48	2022-02-06 13:49:48	Australia	australia	\N	f
33	2022-02-06 13:49:48	2022-02-06 13:49:48	China LST	china-lst	\N	f
34	2022-02-06 13:49:48	2022-02-06 13:49:48	HongKong	hongkong	\N	f
35	2022-02-06 13:49:48	2022-02-06 13:49:48	RB Nederweert	rb-nederweert	\N	f
36	2022-02-06 13:49:49	2022-02-06 13:49:49	Celle	celle	\N	f
37	2022-02-06 13:49:49	2022-02-06 13:49:49	Defensie	defensie	\N	f
38	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Harsewinkel	dlrg-harsewinkel	\N	f
39	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Duisburg-Homberg	dlrg-duisburg-homberg	\N	f
40	2022-02-06 13:49:49	2022-02-06 13:49:49	RB Zevenaar	rb-zevenaar	\N	f
41	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Gelsenkirchen-Buer	dlrg-gelsenkirchen-buer	\N	f
42	2022-02-06 13:49:49	2022-02-06 13:49:49	SLRG Olten	slrg-olten	\N	f
43	2022-02-06 13:49:49	2022-02-06 13:49:49	RB Oss	rb-oss	\N	f
44	2022-02-06 13:49:49	2022-02-06 13:49:49	Nelaur	nelaur	\N	f
45	2022-02-06 13:49:49	2022-02-06 13:49:49	Flanders CLS	flanders-cls	\N	f
46	2022-02-06 13:49:49	2022-02-06 13:49:49	DLRG Langenberg	dlrg-langenberg	\N	f
47	2022-02-06 13:49:49	2022-02-06 13:49:49	St Hubert	st-hubert	\N	f
48	2022-02-06 13:49:49	2022-02-06 13:49:49	Biarritz	biarritz	\N	f
49	2022-02-06 13:49:50	2022-02-06 13:49:50	ASD Rosetana	asd-rosetana	\N	f
50	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Berlin	dlrg-berlin	\N	f
51	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Buchholz	dlrg-buchholz	\N	f
52	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Stadlohn	dlrg-stadlohn	\N	f
53	2022-02-06 13:49:51	2022-02-06 13:49:51	DLRG Niedersachsen 1	dlrg-niedersachsen-1	\N	f
54	2022-02-06 13:49:52	2022-02-06 13:49:52	SLRG Olten 1	slrg-olten-1	\N	f
55	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Heytse 1	rb-heytse-1	\N	f
56	2022-02-06 13:49:52	2022-02-06 13:49:52	NewZlnd 1	newzlnd-1	\N	f
57	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Echt 1	rb-echt-1	\N	f
58	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Weert 1	rb-weert-1	\N	f
59	2022-02-06 13:49:52	2022-02-06 13:49:52	NojaPlaya 1	nojaplaya-1	\N	f
60	2022-02-06 13:49:52	2022-02-06 13:49:52	STRC Dames	strc-dames	\N	f
61	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Staphorst 1	rb-staphorst-1	\N	f
62	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda 1	rb-gouda-1	\N	f
63	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda J	rb-gouda-j	\N	f
64	2022-02-06 13:49:52	2022-02-06 13:49:52	Czech Republic 2	czech-republic-2	\N	f
65	2022-02-06 13:49:52	2022-02-06 13:49:52	Blyth Y	blyth-y	\N	f
66	2022-02-06 13:49:52	2022-02-06 13:49:52	Athena	athena	\N	f
67	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Nordrhein 3	dlrg-nordrhein-3	\N	f
68	2022-02-06 13:49:52	2022-02-06 13:49:52	Dordrecht M	dordrecht-m	\N	f
69	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Zevenaar 1	rb-zevenaar-1	\N	f
70	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Buchholz 1	dlrg-buchholz-1	\N	f
71	2022-02-06 13:49:52	2022-02-06 13:49:52	HongKong 1	hongkong-1	\N	f
72	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Gouda M1	rb-gouda-m1	\N	f
73	2022-02-06 13:49:52	2022-02-06 13:49:52	Cork SL 1	cork-sl-1	\N	f
74	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Delft 2	rb-delft-2	\N	f
75	2022-02-06 13:49:52	2022-02-06 13:49:52	Langenberg 1	langenberg-1	\N	f
76	2022-02-06 13:49:52	2022-02-06 13:49:52	Kusel DIXXX	kusel-dixxx	\N	f
77	2022-02-06 13:49:52	2022-02-06 13:49:52	DLRG Ludwigshafen 1	dlrg-ludwigshafen-1	\N	f
78	2022-02-06 13:49:52	2022-02-06 13:49:52	Duisburg-Homberg Men	duisburg-homberg-men	\N	f
79	2022-02-06 13:49:52	2022-02-06 13:49:52	STRC Heren	strc-heren	\N	f
80	2022-02-06 13:49:52	2022-02-06 13:49:52	India	india	\N	f
81	2022-02-06 13:49:52	2022-02-06 13:49:52	Celle 1	celle-1	\N	f
82	2022-02-06 13:49:52	2022-02-06 13:49:52	RB Oss J	rb-oss-j	\N	f
83	2022-02-06 13:49:53	2022-02-06 13:49:53	BUEHLER, Annika	buehler-annika	\N	f
84	2022-02-06 13:49:53	2022-02-06 13:49:53	VAN DER VORST, Lynn	van-der-vorst-lynn	\N	f
85	2022-02-06 13:49:53	2022-02-06 13:49:53	Bastogne	bastogne	\N	f
86	2022-02-06 13:49:53	2022-02-06 13:49:53	BERTUOLA, Chiara	bertuola-chiara	\N	f
87	2022-02-06 13:49:53	2022-02-06 13:49:53	ASD Gorizia	asd-gorizia	\N	f
88	2022-02-06 13:49:53	2022-02-06 13:49:53	Rctal	rctal	\N	f
89	2022-02-06 13:49:53	2022-02-06 13:49:53	Cork SL	cork-sl	\N	f
90	2022-02-06 13:49:53	2022-02-06 13:49:53	VAN UDEN, Tim	van-uden-tim	\N	f
91	2022-02-06 13:49:53	2022-02-06 13:49:53	DLRG Oder-Spree	dlrg-oder-spree	\N	f
92	2022-02-06 13:49:53	2022-02-06 13:49:53	MCMASTER, Tony	mcmaster-tony	\N	f
93	2022-02-06 13:49:54	2022-02-06 13:49:54	INCERA SALAS, Mercia	incera-salas-mercia	\N	f
94	2022-02-06 13:49:54	2022-02-06 13:49:54	SANCHEZ IBERTI, Emma	sanchez-iberti-emma	\N	f
95	2022-02-06 13:49:54	2022-02-06 13:49:54	REID, Sasha	reid-sasha	\N	f
96	2022-02-06 13:49:54	2022-02-06 13:49:54	ALBRECHT, Lisa	albrecht-lisa	\N	f
97	2022-02-06 13:49:54	2022-02-06 13:49:54	BRADLEY, Milly	bradley-milly	\N	f
98	2022-02-06 13:49:54	2022-02-06 13:49:54	GEBBE, Katharina	gebbe-katharina	\N	f
99	2022-02-06 13:49:54	2022-02-06 13:49:54	SCHOSTOK, Lena	schostok-lena	\N	f
100	2022-02-06 13:49:54	2022-02-06 13:49:54	LISSMANN, Lea	lissmann-lea	\N	f
101	2022-02-06 13:49:54	2022-02-06 13:49:54	VAN DEN HEUVEL, Brecht	van-den-heuvel-brecht	\N	f
102	2022-02-06 13:49:54	2022-02-06 13:49:54	HAUSER, Carmen	hauser-carmen	\N	f
103	2022-02-06 13:49:54	2022-02-06 13:49:54	VAN ES, Anne	van-es-anne	\N	f
104	2022-02-06 13:49:54	2022-02-06 13:49:54	Crawley	crawley	\N	f
105	2022-02-06 13:49:54	2022-02-06 13:49:54	GOMEZ RODRIGUEZ, Lola	gomez-rodriguez-lola	\N	f
106	2022-02-06 13:49:54	2022-02-06 13:49:54	BRADLEY, Libby	bradley-libby	\N	f
107	2022-02-06 13:49:54	2022-02-06 13:49:54	GRAF, Selina	graf-selina	\N	f
108	2022-02-06 13:49:54	2022-02-06 13:49:54	SCHUMACHER, Katrin	schumacher-katrin	\N	f
109	2022-02-06 13:49:55	2022-02-06 13:49:55	DLRG Schwerte	dlrg-schwerte	\N	f
110	2022-02-06 13:49:55	2022-02-06 13:49:55	ATA, Levi	ata-levi	\N	f
111	2022-02-06 13:49:55	2022-02-06 13:49:55	MR LEE, Sing Chung	mr-lee-sing-chung	\N	f
112	2022-02-06 13:49:55	2022-02-06 13:49:55	SLATTERY, Sean	slattery-sean	\N	f
113	2022-02-06 13:49:55	2022-02-06 13:49:55	STOETZER, Roelof	stoetzer-roelof	\N	f
114	2022-02-06 13:49:55	2022-02-06 13:49:55	BOMARSI, Daniele	bomarsi-daniele	\N	f
115	2022-02-06 13:49:55	2022-02-06 13:49:55	VOGEL, Vincent	vogel-vincent	\N	f
116	2022-02-06 13:49:55	2022-02-06 13:49:55	DE RICK, Greef	de-rick-greef	\N	f
117	2022-02-06 13:49:56	2022-02-06 13:49:56	Dordrecht Y	dordrecht-y	\N	f
118	2022-02-06 13:49:57	2022-02-06 13:49:57	RB Rosmalen	rb-rosmalen	\N	f
119	2022-02-06 13:49:57	2022-02-06 13:49:57	MONTENEGRO, Noemi	montenegro-noemi	\N	f
120	2022-02-06 13:49:57	2022-02-06 13:49:57	SEIDEL, Charline	seidel-charline	\N	f
121	2022-02-06 13:49:57	2022-02-06 13:49:57	PORC	porc	\N	f
122	2022-02-06 13:49:57	2022-02-06 13:49:57	RB Boxtel	rb-boxtel	\N	f
123	2022-02-06 13:49:57	2022-02-06 13:49:57	BOUST	boust	\N	f
124	2022-02-06 13:49:57	2022-02-06 13:49:57	MEIERTOBERENS, Noah	meiertoberens-noah	\N	f
125	2022-02-06 13:49:57	2022-02-06 13:49:57	FOCKE, Felix	focke-felix	\N	f
126	2022-02-06 13:49:57	2022-02-06 13:49:57	DEN BOEF, Alex	den-boef-alex	\N	f
127	2022-02-06 13:49:58	2022-02-06 13:49:58	RB DenBosch	rb-denbosch	\N	f
128	2022-02-06 13:49:58	2022-02-06 13:49:58	DLRG NiederOlm 1	dlrg-niederolm-1	\N	f
129	2022-02-06 13:49:59	2022-02-06 13:49:59	SENDEN, Chantal	senden-chantal	\N	f
130	2022-02-06 13:49:59	2022-02-06 13:49:59	LAPU-OS, Lelanie	lapu-os-lelanie	\N	f
131	2022-02-06 13:50:11	2022-02-06 13:50:11	Gorizia Nuoto Asd	gorizia-nuoto-asd	\N	f
132	2022-02-06 13:50:11	2022-02-06 13:50:11	South Africa	south-africa	\N	f
133	2022-02-06 13:50:11	2022-02-06 13:50:11	3T Sporting Club	3t-sporting-club	\N	f
134	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Buchholz e.V.	dlrg-buchholz-ev	\N	f
135	2022-02-06 13:50:11	2022-02-06 13:50:11	Starfish SLC	starfish-slc	\N	f
136	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG LV Niedersachsen	dlrg-lv-niedersachsen	\N	f
137	2022-02-06 13:50:11	2022-02-06 13:50:11	RB Heythuysen	rb-heythuysen	\N	f
138	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Kusel KiXX	dlrg-kusel-kixx	\N	f
139	2022-02-06 13:50:11	2022-02-06 13:50:11	NL Defensie Lifesaving	nl-defensie-lifesaving	\N	f
140	2022-02-06 13:50:11	2022-02-06 13:50:11	RB Zevenaar 'De Breuly'	rb-zevenaar-de-breuly	\N	f
141	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Haltern	dlrg-haltern	\N	f
142	2022-02-06 13:50:11	2022-02-06 13:50:11	RB Zwolle	rb-zwolle	\N	f
143	2022-02-06 13:50:11	2022-02-06 13:50:11	SLRG Innerschwyz	slrg-innerschwyz	\N	f
144	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Ennigerloh e.V.	dlrg-ennigerloh-ev	\N	f
145	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG OG Stadtlohn e.V.	dlrg-og-stadtlohn-ev	\N	f
146	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Goslar	dlrg-goslar	\N	f
147	2022-02-06 13:50:11	2022-02-06 13:50:11	Cork Surf Lifesaving Club	cork-surf-lifesaving-club	\N	f
148	2022-02-06 13:50:11	2022-02-06 13:50:11	RB Vlissingen	rb-vlissingen	\N	f
149	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Nieder-Olm/Woerrstadt	dlrg-nieder-olmwoerrstadt	\N	f
150	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Herzebrock-Clarholz	dlrg-herzebrock-clarholz	\N	f
151	2022-02-06 13:50:11	2022-02-06 13:50:11	Black Fins Squad	black-fins-squad	\N	f
152	2022-02-06 13:50:11	2022-02-06 13:50:11	Hong Kong Lifesaving team	hong-kong-lifesaving-team	\N	f
153	2022-02-06 13:50:11	2022-02-06 13:50:11	DLRG Kelkheim	dlrg-kelkheim	\N	f
154	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Ascheberg-Herbern	dlrg-ascheberg-herbern	\N	f
155	2022-02-06 13:50:12	2022-02-06 13:50:12	NL Defensie Lifesaving 1	nl-defensie-lifesaving-1	\N	f
156	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Ascheberg-Herbern 1	dlrg-ascheberg-herbern-1	\N	f
157	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Ascheberg-Herbern 2	dlrg-ascheberg-herbern-2	\N	f
158	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Duisburg-Homberg 1	dlrg-duisburg-homberg-1	\N	f
159	2022-02-06 13:50:12	2022-02-06 13:50:12	Kusel ChiXXX	kusel-chixxx	\N	f
160	2022-02-06 13:50:12	2022-02-06 13:50:12	Italy 1	italy-1	\N	f
161	2022-02-06 13:50:12	2022-02-06 13:50:12	South Africa 1	south-africa-1	\N	f
162	2022-02-06 13:50:12	2022-02-06 13:50:12	South Africa 2	south-africa-2	\N	f
163	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Masters	dordrecht-masters	\N	f
164	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Heythuysen 1	rb-heythuysen-1	\N	f
165	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Heythuysen 2	rb-heythuysen-2	\N	f
166	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Gouda 3	rb-gouda-3	\N	f
167	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Oss 2	rb-oss-2	\N	f
168	2022-02-06 13:50:12	2022-02-06 13:50:12	Team Starfish junior 2	team-starfish-junior-2	\N	f
169	2022-02-06 13:50:12	2022-02-06 13:50:12	RB Staphorst 2	rb-staphorst-2	\N	f
170	2022-02-06 13:50:12	2022-02-06 13:50:12	DLRG Haltern 1	dlrg-haltern-1	\N	f
171	2022-02-06 13:50:12	2022-02-06 13:50:12	Dordrecht Junioren	dordrecht-junioren	\N	f
172	2022-02-06 13:50:12	2022-02-06 13:50:12	Noja-Playa Dorada	noja-playa-dorada	\N	f
173	2022-02-06 13:50:12	2022-02-06 13:50:12	Sergio De Gregorio	sergio-de-gregorio	\N	f
174	2022-02-06 13:50:12	2022-02-06 13:50:12	STELTING, Carolin	stelting-carolin	\N	f
175	2022-02-06 13:50:12	2022-02-06 13:50:12	GELLEKOM, Lotte	gellekom-lotte	\N	f
176	2022-02-06 13:50:12	2022-02-06 13:50:12	Livraddarna Tyloesand	livraddarna-tyloesand	\N	f
177	2022-02-06 13:50:13	2022-02-06 13:50:13	HEEMELS, Robin	heemels-robin	\N	f
178	2022-02-06 13:50:13	2022-02-06 13:50:13	HUTTEN, Ela	hutten-ela	\N	f
179	2022-02-06 13:50:13	2022-02-06 13:50:13	Hossegor Sauvetage Cotier (FRA	hossegor-sauvetage-cotier-fra	\N	f
180	2022-02-06 13:50:13	2022-02-06 13:50:13	VAN DER KOOIJ, Astrid	van-der-kooij-astrid	\N	f
181	2022-02-06 13:50:13	2022-02-06 13:50:13	SOLVANG ENGESETH, Joergen	solvang-engeseth-joergen	\N	f
182	2022-02-06 13:50:13	2022-02-06 13:50:13	VERHOEF, Jop	verhoef-jop	\N	f
183	2022-02-06 13:50:13	2022-02-06 13:50:13	DLRG Schloss Holte-Stukenbrock	dlrg-schloss-holte-stukenbrock	\N	f
184	2022-02-06 13:50:13	2022-02-06 13:50:13	GILARDI, Federico	gilardi-federico	\N	f
185	2022-02-06 13:50:13	2022-02-06 13:50:13	SIEVAL, Lars	sieval-lars	\N	f
186	2022-02-06 13:50:13	2022-02-06 13:50:13	WONG, Shun-lai	wong-shun-lai	\N	f
187	2022-02-06 13:50:13	2022-02-06 13:50:13	WOELBING, Oliver	woelbing-oliver	\N	f
188	2022-02-06 13:50:13	2022-02-06 13:50:13	RUSSCHEN, Sem	russchen-sem	\N	f
189	2022-02-06 13:50:13	2022-02-06 13:50:13	VAN ERK, Ruben	van-erk-ruben	\N	f
190	2022-02-06 13:50:13	2022-02-06 13:50:13	TUINSTRA, Wouter	tuinstra-wouter	\N	f
191	2022-02-06 13:50:13	2022-02-06 13:50:13	VAN DER MEIJ, Melvin	van-der-meij-melvin	\N	f
192	2022-02-06 13:50:13	2022-02-06 13:50:13	DE KNOOP, Bastiaan	de-knoop-bastiaan	\N	f
193	2022-02-06 13:50:13	2022-02-06 13:50:13	VOSKAMP, Ingemar	voskamp-ingemar	\N	f
194	2022-02-06 13:50:13	2022-02-06 13:50:13	DLRG Gelsenkichen-Mitte	dlrg-gelsenkichen-mitte	\N	f
195	2022-02-06 13:50:13	2022-02-06 13:50:13	TER HUERNE, Erwin	ter-huerne-erwin	\N	f
196	2022-02-06 13:50:13	2022-02-06 13:50:13	BEZEMER, Dennis	bezemer-dennis	\N	f
197	2022-02-06 13:50:13	2022-02-06 13:50:13	Nederland Senioren	nederland-senioren	\N	f
198	2022-02-06 13:50:13	2022-02-06 13:50:13	DLRG OG Stadtlohn e.V. 2	dlrg-og-stadtlohn-ev-2	\N	f
199	2022-02-06 13:50:14	2022-02-06 13:50:14	STEENBEKKERS, Erna	steenbekkers-erna	\N	f
200	2022-02-06 13:50:14	2022-02-06 13:50:14	BOL, Melissa	bol-melissa	\N	f
201	2022-02-06 13:50:15	2022-02-06 13:50:15	ABAD SIEPER, Anna Alicia	abad-sieper-anna-alicia	\N	f
202	2022-02-06 13:50:15	2022-02-06 13:50:15	DLRG Alpen	dlrg-alpen-1	\N	f
203	2022-02-06 13:50:15	2022-02-06 13:50:15	VAN KIMMENADE, Huub	van-kimmenade-huub	\N	f
204	2022-02-06 13:50:15	2022-02-06 13:50:15	DE REUVER, Erik	de-reuver-erik	\N	f
205	2022-02-06 13:50:15	2022-02-06 13:50:15	HOELSCHER, Louisa	hoelscher-louisa	\N	f
206	2022-02-06 13:50:15	2022-02-06 13:50:15	STOKBROECKX, Selina	stokbroeckx-selina	\N	f
207	2022-02-06 13:50:16	2022-02-06 13:50:16	DE VRIES, Denise	de-vries-denise	\N	f
208	2022-02-06 13:50:16	2022-02-06 13:50:16	JACOBS, Marlou	jacobs-marlou	\N	f
209	2022-02-06 13:50:16	2022-02-06 13:50:16	VANBUEL-GOFFIN, Nele-Cornelia	vanbuel-goffin-nele-cornelia	\N	f
210	2022-02-06 13:50:16	2022-02-06 13:50:16	FRANZOT, Emma	franzot-emma	\N	f
211	2022-02-06 13:50:16	2022-02-06 13:50:16	CHISLETT, Ally	chislett-ally	\N	f
212	2022-02-06 13:50:16	2022-02-06 13:50:16	VAN DER ELSEN, Maud	van-der-elsen-maud	\N	f
213	2022-02-06 13:50:16	2022-02-06 13:50:16	SCHUERKMANN, Paula	schuerkmann-paula	\N	f
214	2022-02-06 13:50:16	2022-02-06 13:50:16	VAN BEBBER, Danique	van-bebber-danique	\N	f
215	2022-02-06 13:50:16	2022-02-06 13:50:16	PERDIJK, Micky	perdijk-micky	\N	f
216	2022-02-06 13:50:16	2022-02-06 13:50:16	KEURENTJES, Anne	keurentjes-anne	\N	f
217	2022-02-06 13:50:16	2022-02-06 13:50:16	STEIN, Saskia	stein-saskia	\N	f
218	2022-02-06 13:50:16	2022-02-06 13:50:16	BRUIJNIKS, Kim	bruijniks-kim	\N	f
219	2022-02-06 13:50:16	2022-02-06 13:50:16	WONG, Hock-wing, Winnie	wong-hock-wing-winnie	\N	f
220	2022-02-06 13:50:16	2022-02-06 13:50:16	Reddingsbriagde Hardinxveld-Gi	reddingsbriagde-hardinxveld-gi	\N	f
221	2022-02-06 13:50:16	2022-02-06 13:50:16	HAUG VANDENHOVE, Jonah	haug-vandenhove-jonah	\N	f
222	2022-02-06 13:50:16	2022-02-06 13:50:16	POETTER, Lukas	poetter-lukas	\N	f
223	2022-02-06 13:50:16	2022-02-06 13:50:16	KREFT, Ben	kreft-ben	\N	f
224	2022-02-06 13:50:16	2022-02-06 13:50:16	SCHULTZ, Marco Philip	schultz-marco-philip	\N	f
225	2022-02-06 13:50:16	2022-02-06 13:50:16	DE REUVER, Bas	de-reuver-bas	\N	f
226	2022-02-06 13:50:16	2022-02-06 13:50:16	IPPOLITO, Francesco	ippolito-francesco	\N	f
227	2022-02-06 13:50:16	2022-02-06 13:50:16	GELLEKOM, Jeroen	gellekom-jeroen	\N	f
228	2022-02-06 13:50:16	2022-02-06 13:50:16	GAYASHAN, Aliya Kavindu	gayashan-aliya-kavindu	\N	f
229	2022-02-06 13:50:16	2022-02-06 13:50:16	VAN LUIJTELAAR, Pieter	van-luijtelaar-pieter	\N	f
230	2022-02-06 13:50:16	2022-02-06 13:50:16	BRINK, Jan	brink-jan	\N	f
231	2022-02-19 13:27:45	2022-02-19 13:27:45	Gorizia Nuoto Asd	gorizia-nuoto-asd-1	\N	f
232	2022-02-19 13:27:45	2022-02-19 13:27:45	South Africa	south-africa-3	\N	f
233	2022-02-19 13:27:45	2022-02-19 13:27:45	3T Sporting Club	3t-sporting-club-1	\N	f
234	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Buchholz e.V.	dlrg-buchholz-ev-1	\N	f
235	2022-02-19 13:27:45	2022-02-19 13:27:45	Starfish SLC	starfish-slc-1	\N	f
236	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG LV Niedersachsen	dlrg-lv-niedersachsen-1	\N	f
237	2022-02-19 13:27:45	2022-02-19 13:27:45	RB Heythuysen	rb-heythuysen-3	\N	f
238	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Kusel KiXX	dlrg-kusel-kixx-1	\N	f
239	2022-02-19 13:27:45	2022-02-19 13:27:45	NL Defensie Lifesaving	nl-defensie-lifesaving-2	\N	f
240	2022-02-19 13:27:45	2022-02-19 13:27:45	RB Zevenaar 'De Breuly'	rb-zevenaar-de-breuly-1	\N	f
241	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Haltern	dlrg-haltern-2	\N	f
242	2022-02-19 13:27:45	2022-02-19 13:27:45	RB Zwolle	rb-zwolle-1	\N	f
243	2022-02-19 13:27:45	2022-02-19 13:27:45	SLRG Innerschwyz	slrg-innerschwyz-1	\N	f
244	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Ennigerloh e.V.	dlrg-ennigerloh-ev-1	\N	f
245	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG OG Stadtlohn e.V.	dlrg-og-stadtlohn-ev-1	\N	f
246	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Goslar	dlrg-goslar-1	\N	f
247	2022-02-19 13:27:45	2022-02-19 13:27:45	Cork Surf Lifesaving Club	cork-surf-lifesaving-club-1	\N	f
248	2022-02-19 13:27:45	2022-02-19 13:27:45	RB Vlissingen	rb-vlissingen-1	\N	f
249	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Nieder-Olm/Woerrstadt	dlrg-nieder-olmwoerrstadt-1	\N	f
250	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Herzebrock-Clarholz	dlrg-herzebrock-clarholz-1	\N	f
251	2022-02-19 13:27:45	2022-02-19 13:27:45	Black Fins Squad	black-fins-squad-1	\N	f
252	2022-02-19 13:27:45	2022-02-19 13:27:45	Hong Kong Lifesaving team	hong-kong-lifesaving-team-1	\N	f
253	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Kelkheim	dlrg-kelkheim-1	\N	f
254	2022-02-19 13:27:45	2022-02-19 13:27:45	DLRG Ascheberg-Herbern	dlrg-ascheberg-herbern-3	\N	f
255	2022-02-19 13:27:46	2022-02-19 13:27:46	Noja-Playa Dorada	noja-playa-dorada-1	\N	f
256	2022-02-19 13:27:46	2022-02-19 13:27:46	Sergio De Gregorio	sergio-de-gregorio-1	\N	f
257	2022-02-19 13:27:46	2022-02-19 13:27:46	Livraddarna Tyloesand	livraddarna-tyloesand-1	\N	f
258	2022-02-19 13:27:47	2022-02-19 13:27:47	Hossegor Sauvetage Cotier (FRA	hossegor-sauvetage-cotier-fra-1	\N	f
259	2022-02-19 13:27:47	2022-02-19 13:27:47	DLRG Schloss Holte-Stukenbrock	dlrg-schloss-holte-stukenbrock-1	\N	f
260	2022-02-19 13:27:47	2022-02-19 13:27:47	DLRG Gelsenkichen-Mitte	dlrg-gelsenkichen-mitte-1	\N	f
261	2022-02-19 13:27:49	2022-02-19 13:27:49	DLRG Alpen	dlrg-alpen-2	\N	f
262	2022-02-19 13:27:50	2022-02-19 13:27:50	Reddingsbriagde Hardinxveld-Gi	reddingsbriagde-hardinxveld-gi-1	\N	f
263	2022-02-19 13:27:51	2022-02-19 13:27:51	Dolphin Aquatic Club	dolphin-aquatic-club	\N	f
264	2022-02-19 13:28:52	2022-02-19 13:28:52	NewZlnd	newzlnd-2	\N	f
265	2022-02-19 13:28:52	2022-02-19 13:28:52	Spain	spain-1	\N	f
266	2022-02-19 13:28:52	2022-02-19 13:28:52	ACC di Salvamento	acc-di-salvamento-1	\N	f
267	2022-02-19 13:28:52	2022-02-19 13:28:52	Athena SC	athena-sc-1	\N	f
268	2022-02-19 13:28:52	2022-02-19 13:28:52	Starfish	starfish-1	\N	f
269	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Nordrhein	dlrg-nordrhein-1	\N	f
270	2022-02-19 13:28:52	2022-02-19 13:28:52	NojaPlaya	nojaplaya-2	\N	f
271	2022-02-19 13:28:52	2022-02-19 13:28:52	Chech R	chech-r-1	\N	f
272	2022-02-19 13:28:52	2022-02-19 13:28:52	St Truiden	st-truiden-1	\N	f
273	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Niedersachsen	dlrg-niedersachsen-2	\N	f
274	2022-02-19 13:28:52	2022-02-19 13:28:52	Romenike	romenike-1	\N	f
275	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG NiederOlm	dlrg-niederolm-2	\N	f
276	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Sachsen	dlrg-sachsen-1	\N	f
277	2022-02-19 13:28:52	2022-02-19 13:28:52	RB Heytse	rb-heytse-2	\N	f
278	2022-02-19 13:28:52	2022-02-19 13:28:52	BLYTH	blyth-1	\N	f
279	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG ALpen	dlrg-alpen-3	\N	f
280	2022-02-19 13:28:52	2022-02-19 13:28:52	Austria	austria-1	\N	f
281	2022-02-19 13:28:52	2022-02-19 13:28:52	RB Delft	rb-delft-1	\N	f
282	2022-02-19 13:28:52	2022-02-19 13:28:52	Kusel KiXXX	kusel-kixxx-1	\N	f
283	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Rheurdt-Schaephuysen	dlrg-rheurdt-schaephuysen-1	\N	f
284	2022-02-19 13:28:52	2022-02-19 13:28:52	Ecole de natation Everoise	ecole-de-natation-everoise-1	\N	f
285	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Gutersloh	dlrg-gutersloh-1	\N	f
286	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Bad Wuennenberg	dlrg-bad-wuennenberg-1	\N	f
287	2022-02-19 13:28:52	2022-02-19 13:28:52	DLRG Ludwigshafen	dlrg-ludwigshafen-2	\N	f
288	2022-02-19 13:28:52	2022-02-19 13:28:52	Australia	australia-1	\N	f
289	2022-02-19 13:28:52	2022-02-19 13:28:52	China LST	china-lst-1	\N	f
290	2022-02-19 13:28:52	2022-02-19 13:28:52	HongKong	hongkong-2	\N	f
291	2022-02-19 13:28:53	2022-02-19 13:28:53	Celle	celle-2	\N	f
292	2022-02-19 13:28:53	2022-02-19 13:28:53	Defensie	defensie-1	\N	f
293	2022-02-19 13:28:53	2022-02-19 13:28:53	DLRG Harsewinkel	dlrg-harsewinkel-1	\N	f
294	2022-02-19 13:28:53	2022-02-19 13:28:53	RB Zevenaar	rb-zevenaar-2	\N	f
295	2022-02-19 13:28:53	2022-02-19 13:28:53	DLRG Gelsenkirchen-Buer	dlrg-gelsenkirchen-buer-1	\N	f
296	2022-02-19 13:28:53	2022-02-19 13:28:53	SLRG Olten	slrg-olten-2	\N	f
297	2022-02-19 13:28:53	2022-02-19 13:28:53	Nelaur	nelaur-1	\N	f
298	2022-02-19 13:28:53	2022-02-19 13:28:53	Flanders CLS	flanders-cls-1	\N	f
299	2022-02-19 13:28:53	2022-02-19 13:28:53	DLRG Langenberg	dlrg-langenberg-1	\N	f
300	2022-02-19 13:28:53	2022-02-19 13:28:53	St Hubert	st-hubert-1	\N	f
301	2022-02-19 13:28:53	2022-02-19 13:28:53	Biarritz	biarritz-1	\N	f
302	2022-02-19 13:28:54	2022-02-19 13:28:54	ASD Rosetana	asd-rosetana-1	\N	f
303	2022-02-19 13:28:55	2022-02-19 13:28:55	DLRG Berlin	dlrg-berlin-1	\N	f
304	2022-02-19 13:28:55	2022-02-19 13:28:55	DLRG Buchholz	dlrg-buchholz-2	\N	f
305	2022-02-19 13:28:55	2022-02-19 13:28:55	DLRG Stadlohn	dlrg-stadlohn-1	\N	f
306	2022-02-19 13:28:56	2022-02-19 13:28:56	Cork SL	cork-sl-2	\N	f
307	2022-02-19 13:28:56	2022-02-19 13:28:56	India	india-1	\N	f
308	2022-02-19 13:28:56	2022-02-19 13:28:56	Bastogne	bastogne-1	\N	f
309	2022-02-19 13:28:56	2022-02-19 13:28:56	ASD Gorizia	asd-gorizia-1	\N	f
310	2022-02-19 13:28:57	2022-02-19 13:28:57	Rctal	rctal-1	\N	f
311	2022-02-19 13:28:57	2022-02-19 13:28:57	Cork SL	cork-sl-3	\N	f
312	2022-02-19 13:28:57	2022-02-19 13:28:57	DLRG Oder-Spree	dlrg-oder-spree-1	\N	f
313	2022-02-19 13:28:57	2022-02-19 13:28:57	Crawley	crawley-1	\N	f
314	2022-02-19 13:29:01	2022-02-19 13:29:01	PORC	porc-1	\N	f
315	2022-02-19 13:29:01	2022-02-19 13:29:01	BOUST	boust-1	\N	f
316	2022-02-19 13:29:02	2022-02-19 13:29:02	RB DenBosch	rb-denbosch-1	\N	f
317	2022-03-24 10:49:30	2022-03-24 10:49:30	Italy NT	italy-nt	\N	f
318	2022-03-24 10:49:30	2022-03-24 10:49:30	SAFA 2000	safa-2000	\N	f
319	2022-03-24 10:49:30	2022-03-24 10:49:30	Accademia Di Salvamento	accademia-di-salvamento	\N	f
320	2022-03-24 10:49:30	2022-03-24 10:49:30	Spain NT	spain-nt	\N	f
321	2022-03-24 10:49:30	2022-03-24 10:49:30	France NT	france-nt	\N	f
322	2022-03-24 10:49:30	2022-03-24 10:49:30	Accademia Di Salvamento	accademia-di-salvamento-1	\N	f
323	2022-03-24 10:49:30	2022-03-24 10:49:30	Belgium NT	belgium-nt	\N	f
324	2022-03-24 10:49:30	2022-03-24 10:49:30	Kusel KiXXX	kusel-kixxx-2	\N	f
325	2022-03-24 10:49:30	2022-03-24 10:49:30	In Sport Rane Rosse	in-sport-rane-rosse	\N	f
326	2022-03-24 10:49:30	2022-03-24 10:49:30	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt	\N	f
327	2022-03-24 10:49:30	2022-03-24 10:49:30	Athena Bracciano	athena-bracciano	\N	f
328	2022-03-24 10:49:30	2022-03-24 10:49:30	Slaskie WOPR	slaskie-wopr	\N	f
329	2022-03-24 10:49:30	2022-03-24 10:49:30	Slaskie WOPR	slaskie-wopr-1	\N	f
330	2022-03-24 10:49:30	2022-03-24 10:49:30	DLRG Niedersachsen	dlrg-niedersachsen-3	\N	f
331	2022-03-24 10:49:30	2022-03-24 10:49:30	France NT	france-nt-1	\N	f
332	2022-03-24 10:49:30	2022-03-24 10:49:30	Athena Bracciano	athena-bracciano-1	\N	f
333	2022-03-24 10:49:30	2022-03-24 10:49:30	Athena Salvamento	athena-salvamento	\N	f
334	2022-03-24 10:49:30	2022-03-24 10:49:30	In Sport Rane Rosse	in-sport-rane-rosse-1	\N	f
335	2022-03-24 10:49:31	2022-03-24 10:49:31	Sint-Truidense RC	sint-truidense-rc	\N	f
336	2022-03-24 10:49:31	2022-03-24 10:49:31	ASD Rosetana Nuoto	asd-rosetana-nuoto	\N	f
337	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Niedersachsen	dlrg-niedersachsen-4	\N	f
338	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach	\N	f
339	2022-03-24 10:49:31	2022-03-24 10:49:31	Rctal	rctal-2	\N	f
340	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Niedersachsen	dlrg-niedersachsen-5	\N	f
341	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Bracciano	athena-bracciano-2	\N	f
342	2022-03-24 10:49:31	2022-03-24 10:49:31	Sint-Truidense RC	sint-truidense-rc-1	\N	f
343	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Niedersachsen	dlrg-niedersachsen-6	\N	f
344	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Salvamento	athena-salvamento-1	\N	f
345	2022-03-24 10:49:31	2022-03-24 10:49:31	Accademia Di Salvamento	accademia-di-salvamento-2	\N	f
346	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Salvamento	athena-salvamento-2	\N	f
347	2022-03-24 10:49:31	2022-03-24 10:49:31	Nederland NT	nederland-nt	\N	f
348	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen	\N	f
349	2022-03-24 10:49:31	2022-03-24 10:49:31	Rctal	rctal-3	\N	f
350	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Guetersloh	dlrg-guetersloh	\N	f
351	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Guetersloh	dlrg-guetersloh-1	\N	f
352	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Bracciano	athena-bracciano-3	\N	f
353	2022-03-24 10:49:31	2022-03-24 10:49:31	RB Delft	rb-delft-3	\N	f
354	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Guetersloh	dlrg-guetersloh-2	\N	f
355	2022-03-24 10:49:31	2022-03-24 10:49:31	Italy NT	italy-nt-1	\N	f
356	2022-03-24 10:49:31	2022-03-24 10:49:31	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr	\N	f
357	2022-03-24 10:49:31	2022-03-24 10:49:31	Italy NT	italy-nt-2	\N	f
358	2022-03-24 10:49:31	2022-03-24 10:49:31	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-1	\N	f
359	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Bad Oldesloe	dlrg-bad-oldesloe	\N	f
360	2022-03-24 10:49:31	2022-03-24 10:49:31	ASD Gorizia Nuoto	asd-gorizia-nuoto	\N	f
361	2022-03-24 10:49:31	2022-03-24 10:49:31	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-2	\N	f
362	2022-03-24 10:49:31	2022-03-24 10:49:31	France NT	france-nt-2	\N	f
363	2022-03-24 10:49:31	2022-03-24 10:49:31	Spain NT	spain-nt-1	\N	f
364	2022-03-24 10:49:31	2022-03-24 10:49:31	France NT	france-nt-3	\N	f
365	2022-03-24 10:49:31	2022-03-24 10:49:31	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-1	\N	f
366	2022-03-24 10:49:31	2022-03-24 10:49:31	Belgium NT	belgium-nt-1	\N	f
367	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Bracciano	athena-bracciano-4	\N	f
368	2022-03-24 10:49:31	2022-03-24 10:49:31	Nederland NT	nederland-nt-1	\N	f
369	2022-03-24 10:49:31	2022-03-24 10:49:31	Kusel KiXXX	kusel-kixxx-3	\N	f
370	2022-03-24 10:49:31	2022-03-24 10:49:31	Athena Bracciano	athena-bracciano-5	\N	f
371	2022-03-24 10:49:32	2022-03-24 10:49:32	Athena Bracciano	athena-bracciano-6	\N	f
372	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Niedersachsen	dlrg-niedersachsen-7	\N	f
373	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Luckenwalde	dlrg-luckenwalde	\N	f
374	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Niedersachsen	dlrg-niedersachsen-8	\N	f
375	2022-03-24 10:49:32	2022-03-24 10:49:32	A.S.D. Sportiva Sturla	asd-sportiva-sturla	\N	f
376	2022-03-24 10:49:32	2022-03-24 10:49:32	Spain NT	spain-nt-2	\N	f
377	2022-03-24 10:49:32	2022-03-24 10:49:32	SAFA 2000	safa-2000-1	\N	f
378	2022-03-24 10:49:32	2022-03-24 10:49:32	CKS Szczecin	cks-szczecin	\N	f
379	2022-03-24 10:49:32	2022-03-24 10:49:32	ASD Gorizia Nuoto	asd-gorizia-nuoto-1	\N	f
380	2022-03-24 10:49:32	2022-03-24 10:49:32	CKS Szczecin	cks-szczecin-1	\N	f
381	2022-03-24 10:49:32	2022-03-24 10:49:32	SDS - Specialisti dello Sport	sds-specialisti-dello-sport	\N	f
382	2022-03-24 10:49:32	2022-03-24 10:49:32	ASD Gorizia Nuoto	asd-gorizia-nuoto-2	\N	f
383	2022-03-24 10:49:32	2022-03-24 10:49:32	In Sport Rane Rosse	in-sport-rane-rosse-2	\N	f
384	2022-03-24 10:49:32	2022-03-24 10:49:32	In Sport Rane Rosse	in-sport-rane-rosse-3	\N	f
385	2022-03-24 10:49:32	2022-03-24 10:49:32	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-1	\N	f
386	2022-03-24 10:49:32	2022-03-24 10:49:32	Slaskie WOPR	slaskie-wopr-2	\N	f
387	2022-03-24 10:49:32	2022-03-24 10:49:32	RB Heytse	rb-heytse-3	\N	f
388	2022-03-24 10:49:32	2022-03-24 10:49:32	Belgium NT	belgium-nt-2	\N	f
389	2022-03-24 10:49:32	2022-03-24 10:49:32	RB Heytse	rb-heytse-4	\N	f
390	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-1	\N	f
391	2022-03-24 10:49:32	2022-03-24 10:49:32	Athena Bracciano	athena-bracciano-7	\N	f
392	2022-03-24 10:49:32	2022-03-24 10:49:32	Athena Salvamento	athena-salvamento-3	\N	f
393	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Luckenwalde	dlrg-luckenwalde-1	\N	f
394	2022-03-24 10:49:32	2022-03-24 10:49:32	Athena Bracciano	athena-bracciano-8	\N	f
395	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Niedersachsen	dlrg-niedersachsen-9	\N	f
396	2022-03-24 10:49:32	2022-03-24 10:49:32	DLRG Buchholz United	dlrg-buchholz-united	\N	f
397	2022-03-24 10:49:32	2022-03-24 10:49:32	Athena Bracciano	athena-bracciano-9	\N	f
398	2022-03-24 10:49:32	2022-03-24 10:49:32	Kusel KiXXX	kusel-kixxx-4	\N	f
399	2022-03-24 10:49:33	2022-03-24 10:49:33	RB Waddinxveen	rb-waddinxveen	\N	f
400	2022-03-24 10:49:33	2022-03-24 10:49:33	Beacon Lifesaving Club	beacon-lifesaving-club	\N	f
401	2022-03-24 10:49:33	2022-03-24 10:49:33	DLRG Buchholz United	dlrg-buchholz-united-1	\N	f
402	2022-03-24 10:49:33	2022-03-24 10:49:33	Italy NT	italy-nt-3	\N	f
403	2022-03-24 10:49:33	2022-03-24 10:49:33	DLRG Buchholz United	dlrg-buchholz-united-2	\N	f
404	2022-03-24 10:49:33	2022-03-24 10:49:33	Athena Bracciano	athena-bracciano-10	\N	f
405	2022-03-24 10:49:33	2022-03-24 10:49:33	RB Delft	rb-delft-4	\N	f
406	2022-03-24 10:49:33	2022-03-24 10:49:33	RB Delft	rb-delft-5	\N	f
407	2022-03-24 10:49:33	2022-03-24 10:49:33	RB Delft	rb-delft-6	\N	f
408	2022-03-24 10:49:33	2022-03-24 10:49:33	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-3	\N	f
409	2022-03-24 10:49:33	2022-03-24 10:49:33	Italy NT	italy-nt-4	\N	f
410	2022-03-24 10:49:33	2022-03-24 10:49:33	Italy NT	italy-nt-5	\N	f
411	2022-03-24 10:49:33	2022-03-24 10:49:33	Spain NT	spain-nt-3	\N	f
412	2022-03-24 10:49:33	2022-03-24 10:49:33	France NT	france-nt-4	\N	f
413	2022-03-24 10:49:33	2022-03-24 10:49:33	Belgium NT	belgium-nt-3	\N	f
414	2022-03-24 10:49:33	2022-03-24 10:49:33	Nederland NT	nederland-nt-2	\N	f
415	2022-03-24 10:49:33	2022-03-24 10:49:33	Spain NT	spain-nt-4	\N	f
416	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-2	\N	f
417	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Bracciano	athena-bracciano-11	\N	f
418	2022-03-24 10:49:34	2022-03-24 10:49:34	France NT	france-nt-5	\N	f
419	2022-03-24 10:49:34	2022-03-24 10:49:34	CKS Szczecin	cks-szczecin-2	\N	f
420	2022-03-24 10:49:34	2022-03-24 10:49:34	Slaskie WOPR	slaskie-wopr-3	\N	f
421	2022-03-24 10:49:34	2022-03-24 10:49:34	Accademia Di Salvamento	accademia-di-salvamento-3	\N	f
422	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-2	\N	f
423	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Niedersachsen	dlrg-niedersachsen-10	\N	f
424	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Bracciano	athena-bracciano-12	\N	f
425	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Niedersachsen	dlrg-niedersachsen-11	\N	f
426	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Salvamento	athena-salvamento-4	\N	f
427	2022-03-24 10:49:34	2022-03-24 10:49:34	Athena Salvamento	athena-salvamento-5	\N	f
428	2022-03-24 10:49:34	2022-03-24 10:49:34	DLRG Guetersloh	dlrg-guetersloh-3	\N	f
429	2022-03-24 10:49:35	2022-03-24 10:49:35	Hungarian NT	hungarian-nt	\N	f
430	2022-03-24 10:49:35	2022-03-24 10:49:35	Italy NT	italy-nt-6	\N	f
431	2022-03-24 10:49:35	2022-03-24 10:49:35	Spain NT	spain-nt-5	\N	f
432	2022-03-24 10:49:35	2022-03-24 10:49:35	Italy NT	italy-nt-7	\N	f
433	2022-03-24 10:49:35	2022-03-24 10:49:35	Polen NT	polen-nt	\N	f
434	2022-03-24 10:49:35	2022-03-24 10:49:35	Spain NT	spain-nt-6	\N	f
435	2022-03-24 10:49:35	2022-03-24 10:49:35	France NT	france-nt-6	\N	f
436	2022-03-24 10:49:35	2022-03-24 10:49:35	ASD Gorizia Nuoto	asd-gorizia-nuoto-3	\N	f
437	2022-03-24 10:49:35	2022-03-24 10:49:35	SAFA 2000	safa-2000-2	\N	f
438	2022-03-24 10:49:35	2022-03-24 10:49:35	A.S.D. Sportiva Sturla	asd-sportiva-sturla-1	\N	f
439	2022-03-24 10:49:35	2022-03-24 10:49:35	Athena Bracciano	athena-bracciano-13	\N	f
440	2022-03-24 10:49:35	2022-03-24 10:49:35	DLRG Luckenwalde	dlrg-luckenwalde-2	\N	f
441	2022-03-24 10:49:35	2022-03-24 10:49:35	ASD Rosetana Nuoto	asd-rosetana-nuoto-1	\N	f
442	2022-03-24 10:49:35	2022-03-24 10:49:35	CKS Szczecin	cks-szczecin-3	\N	f
443	2022-03-24 10:49:35	2022-03-24 10:49:35	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-3	\N	f
444	2022-03-24 10:49:36	2022-03-24 10:49:36	France NT	france-nt-7	\N	f
445	2022-03-24 10:49:36	2022-03-24 10:49:36	Accademia Di Salvamento	accademia-di-salvamento-4	\N	f
446	2022-03-24 10:49:36	2022-03-24 10:49:36	MKS Szczecin	mks-szczecin	\N	f
447	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Buchholz United	dlrg-buchholz-united-3	\N	f
448	2022-03-24 10:49:36	2022-03-24 10:49:36	Athena Salvamento	athena-salvamento-6	\N	f
449	2022-03-24 10:49:36	2022-03-24 10:49:36	Slaskie WOPR	slaskie-wopr-4	\N	f
450	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-4	\N	f
451	2022-03-24 10:49:36	2022-03-24 10:49:36	Athena Bracciano	athena-bracciano-14	\N	f
452	2022-03-24 10:49:36	2022-03-24 10:49:36	Accademia Di Salvamento	accademia-di-salvamento-5	\N	f
453	2022-03-24 10:49:36	2022-03-24 10:49:36	DLRG Niedersachsen	dlrg-niedersachsen-12	\N	f
454	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Waddinxveen	rb-waddinxveen-1	\N	f
455	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Delft	rb-delft-7	\N	f
456	2022-03-24 10:49:37	2022-03-24 10:49:37	Belgium NT	belgium-nt-4	\N	f
457	2022-03-24 10:49:37	2022-03-24 10:49:37	Spain NT	spain-nt-7	\N	f
458	2022-03-24 10:49:37	2022-03-24 10:49:37	DLRG Niedersachsen	dlrg-niedersachsen-13	\N	f
459	2022-03-24 10:49:37	2022-03-24 10:49:37	France NT	france-nt-8	\N	f
460	2022-03-24 10:49:37	2022-03-24 10:49:37	DLRG Niedersachsen	dlrg-niedersachsen-14	\N	f
461	2022-03-24 10:49:37	2022-03-24 10:49:37	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-3	\N	f
462	2022-03-24 10:49:37	2022-03-24 10:49:37	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-5	\N	f
463	2022-03-24 10:49:37	2022-03-24 10:49:37	RB Heytse	rb-heytse-5	\N	f
464	2022-03-24 10:49:37	2022-03-24 10:49:37	CKS Szczecin	cks-szczecin-4	\N	f
465	2022-03-24 10:49:37	2022-03-24 10:49:37	Athena Bracciano	athena-bracciano-15	\N	f
466	2022-03-24 10:49:37	2022-03-24 10:49:37	Kusel KiXXX	kusel-kixxx-5	\N	f
467	2022-03-24 10:49:37	2022-03-24 10:49:37	Athena Salvamento	athena-salvamento-7	\N	f
468	2022-03-24 10:49:37	2022-03-24 10:49:37	Italy NT	italy-nt-8	\N	f
469	2022-03-24 10:49:37	2022-03-24 10:49:37	Accademia Di Salvamento	accademia-di-salvamento-6	\N	f
470	2022-03-24 10:49:37	2022-03-24 10:49:37	Accademia Di Salvamento	accademia-di-salvamento-7	\N	f
471	2022-03-24 10:49:37	2022-03-24 10:49:37	Accademia Di Salvamento	accademia-di-salvamento-8	\N	f
472	2022-03-24 10:49:38	2022-03-24 10:49:38	Athena Salvamento	athena-salvamento-8	\N	f
473	2022-03-24 10:49:38	2022-03-24 10:49:38	Athena Bracciano	athena-bracciano-16	\N	f
474	2022-03-24 10:49:38	2022-03-24 10:49:38	Italy NT	italy-nt-9	\N	f
475	2022-03-24 10:49:38	2022-03-24 10:49:38	Spain NT	spain-nt-8	\N	f
476	2022-03-24 10:49:38	2022-03-24 10:49:38	France NT	france-nt-9	\N	f
477	2022-03-24 10:49:38	2022-03-24 10:49:38	Liege Sauvetage Club	liege-sauvetage-club	\N	f
478	2022-03-24 10:49:38	2022-03-24 10:49:38	Nederland NT	nederland-nt-3	\N	f
479	2022-03-24 10:49:38	2022-03-24 10:49:38	Slaskie WOPR	slaskie-wopr-5	\N	f
480	2022-03-24 10:49:38	2022-03-24 10:49:38	Slaskie WOPR	slaskie-wopr-6	\N	f
481	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Guetersloh	dlrg-guetersloh-4	\N	f
482	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-6	\N	f
483	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Guetersloh	dlrg-guetersloh-5	\N	f
484	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-4	\N	f
485	2022-03-24 10:49:38	2022-03-24 10:49:38	France NT	france-nt-10	\N	f
486	2022-03-24 10:49:38	2022-03-24 10:49:38	Italy NT	italy-nt-10	\N	f
487	2022-03-24 10:49:38	2022-03-24 10:49:38	SAFA 2000	safa-2000-3	\N	f
488	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Niedersachsen	dlrg-niedersachsen-15	\N	f
489	2022-03-24 10:49:38	2022-03-24 10:49:38	DLRG Niedersachsen	dlrg-niedersachsen-16	\N	f
490	2022-03-24 10:49:38	2022-03-24 10:49:38	CKS Szczecin	cks-szczecin-5	\N	f
491	2022-03-24 10:49:38	2022-03-24 10:49:38	Accademia Di Salvamento	accademia-di-salvamento-9	\N	f
492	2022-03-24 10:49:38	2022-03-24 10:49:38	Polen NT	polen-nt-1	\N	f
493	2022-03-24 10:49:39	2022-03-24 10:49:39	ASD Rosetana Nuoto	asd-rosetana-nuoto-2	\N	f
494	2022-03-24 10:49:39	2022-03-24 10:49:39	Athena Bracciano	athena-bracciano-17	\N	f
495	2022-03-24 10:49:39	2022-03-24 10:49:39	MKS Szczecin	mks-szczecin-1	\N	f
496	2022-03-24 10:49:39	2022-03-24 10:49:39	Athena Salvamento	athena-salvamento-9	\N	f
497	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-7	\N	f
498	2022-03-24 10:49:39	2022-03-24 10:49:39	Belgium NT	belgium-nt-5	\N	f
499	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft	rb-delft-8	\N	f
500	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Guetersloh	dlrg-guetersloh-6	\N	f
501	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Buchholz United	dlrg-buchholz-united-4	\N	f
502	2022-03-24 10:49:39	2022-03-24 10:49:39	Athena Bracciano	athena-bracciano-18	\N	f
503	2022-03-24 10:49:39	2022-03-24 10:49:39	Spain NT	spain-nt-9	\N	f
504	2022-03-24 10:49:39	2022-03-24 10:49:39	Liege Sauvetage Club	liege-sauvetage-club-1	\N	f
505	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Waddinxveen	rb-waddinxveen-2	\N	f
506	2022-03-24 10:49:39	2022-03-24 10:49:39	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-8	\N	f
507	2022-03-24 10:49:39	2022-03-24 10:49:39	Beacon Lifesaving Club	beacon-lifesaving-club-1	\N	f
508	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft	rb-delft-9	\N	f
509	2022-03-24 10:49:39	2022-03-24 10:49:39	RB Delft	rb-delft-10	\N	f
510	2022-03-24 10:49:40	2022-03-24 10:49:40	RB Delft	rb-delft-11	\N	f
511	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento	accademia-di-salvamento-10	\N	f
512	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento	accademia-di-salvamento-11	\N	f
513	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento	accademia-di-salvamento-12	\N	f
514	2022-03-24 10:49:40	2022-03-24 10:49:40	Accademia Di Salvamento	accademia-di-salvamento-13	\N	f
515	2022-03-24 10:49:40	2022-03-24 10:49:40	ASD Gorizia Nuoto	asd-gorizia-nuoto-4	\N	f
516	2022-03-24 10:49:40	2022-03-24 10:49:40	RB Waddinxveen	rb-waddinxveen-3	\N	f
517	2022-03-24 10:49:40	2022-03-24 10:49:40	Spain NT	spain-nt-10	\N	f
518	2022-03-24 10:49:40	2022-03-24 10:49:40	France NT	france-nt-11	\N	f
519	2022-03-24 10:49:40	2022-03-24 10:49:40	Italy NT	italy-nt-11	\N	f
520	2022-03-24 10:49:40	2022-03-24 10:49:40	Kusel KiXXX	kusel-kixxx-6	\N	f
521	2022-03-24 10:49:40	2022-03-24 10:49:40	Slaskie WOPR	slaskie-wopr-7	\N	f
522	2022-03-24 10:49:40	2022-03-24 10:49:40	Slaskie WOPR	slaskie-wopr-8	\N	f
523	2022-03-24 10:49:40	2022-03-24 10:49:40	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-5	\N	f
524	2022-03-24 10:49:40	2022-03-24 10:49:40	France NT	france-nt-12	\N	f
525	2022-03-24 10:49:40	2022-03-24 10:49:40	Belgium NT	belgium-nt-6	\N	f
526	2022-03-24 10:49:40	2022-03-24 10:49:40	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-2	\N	f
527	2022-03-24 10:49:40	2022-03-24 10:49:40	SAFA 2000	safa-2000-4	\N	f
528	2022-03-24 10:49:41	2022-03-24 10:49:41	In Sport Rane Rosse	in-sport-rane-rosse-4	\N	f
529	2022-03-24 10:49:41	2022-03-24 10:49:41	Accademia Di Salvamento	accademia-di-salvamento-14	\N	f
530	2022-03-24 10:49:41	2022-03-24 10:49:41	Accademia Di Salvamento	accademia-di-salvamento-15	\N	f
531	2022-03-24 10:49:41	2022-03-24 10:49:41	France NT	france-nt-13	\N	f
532	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-6	\N	f
533	2022-03-24 10:49:41	2022-03-24 10:49:41	Liege Sauvetage Club	liege-sauvetage-club-2	\N	f
534	2022-03-24 10:49:41	2022-03-24 10:49:41	Slaskie WOPR	slaskie-wopr-9	\N	f
535	2022-03-24 10:49:41	2022-03-24 10:49:41	In Sport Rane Rosse	in-sport-rane-rosse-5	\N	f
536	2022-03-24 10:49:41	2022-03-24 10:49:41	Athena Salvamento	athena-salvamento-10	\N	f
537	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Niedersachsen	dlrg-niedersachsen-17	\N	f
538	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Niedersachsen	dlrg-niedersachsen-18	\N	f
539	2022-03-24 10:49:41	2022-03-24 10:49:41	Liege Sauvetage Club	liege-sauvetage-club-3	\N	f
540	2022-03-24 10:49:41	2022-03-24 10:49:41	Rctal	rctal-4	\N	f
541	2022-03-24 10:49:41	2022-03-24 10:49:41	Sint-Truidense RC	sint-truidense-rc-2	\N	f
542	2022-03-24 10:49:41	2022-03-24 10:49:41	RB Heytse	rb-heytse-6	\N	f
543	2022-03-24 10:49:41	2022-03-24 10:49:41	CKS Szczecin	cks-szczecin-6	\N	f
544	2022-03-24 10:49:41	2022-03-24 10:49:41	Athena Salvamento	athena-salvamento-11	\N	f
545	2022-03-24 10:49:41	2022-03-24 10:49:41	Sint-Truidense RC	sint-truidense-rc-3	\N	f
546	2022-03-24 10:49:41	2022-03-24 10:49:41	Liege Sauvetage Club	liege-sauvetage-club-4	\N	f
547	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Niedersachsen	dlrg-niedersachsen-19	\N	f
548	2022-03-24 10:49:41	2022-03-24 10:49:41	RB Heytse	rb-heytse-7	\N	f
549	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Guetersloh	dlrg-guetersloh-7	\N	f
550	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-9	\N	f
551	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Niedersachsen	dlrg-niedersachsen-20	\N	f
552	2022-03-24 10:49:41	2022-03-24 10:49:41	Slaskie WOPR	slaskie-wopr-10	\N	f
553	2022-03-24 10:49:41	2022-03-24 10:49:41	RB Heytse	rb-heytse-8	\N	f
554	2022-03-24 10:49:41	2022-03-24 10:49:41	DLRG Niedersachsen	dlrg-niedersachsen-21	\N	f
555	2022-03-24 10:49:42	2022-03-24 10:49:42	Italy NT	italy-nt-12	\N	f
556	2022-03-24 10:49:42	2022-03-24 10:49:42	Italy NT	italy-nt-13	\N	f
557	2022-03-24 10:49:42	2022-03-24 10:49:42	Belgium NT	belgium-nt-7	\N	f
558	2022-03-24 10:49:42	2022-03-24 10:49:42	France NT	france-nt-14	\N	f
559	2022-03-24 10:49:42	2022-03-24 10:49:42	Nederland NT	nederland-nt-4	\N	f
560	2022-03-24 10:49:42	2022-03-24 10:49:42	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-7	\N	f
561	2022-03-24 10:49:42	2022-03-24 10:49:42	Spain NT	spain-nt-11	\N	f
562	2022-03-24 10:49:42	2022-03-24 10:49:42	Spain NT	spain-nt-12	\N	f
563	2022-03-24 10:49:42	2022-03-24 10:49:42	France NT	france-nt-15	\N	f
564	2022-03-24 10:49:42	2022-03-24 10:49:42	CKS Szczecin	cks-szczecin-7	\N	f
565	2022-03-24 10:49:42	2022-03-24 10:49:42	Accademia Di Salvamento	accademia-di-salvamento-16	\N	f
566	2022-03-24 10:49:42	2022-03-24 10:49:42	Accademia Di Salvamento	accademia-di-salvamento-17	\N	f
567	2022-03-24 10:49:42	2022-03-24 10:49:42	Athena Bracciano	athena-bracciano-19	\N	f
568	2022-03-24 10:49:42	2022-03-24 10:49:42	DLRG Niedersachsen	dlrg-niedersachsen-22	\N	f
569	2022-03-24 10:49:42	2022-03-24 10:49:42	DLRG Luckenwalde	dlrg-luckenwalde-3	\N	f
570	2022-03-24 10:49:42	2022-03-24 10:49:42	Nederland NT	nederland-nt-5	\N	f
571	2022-03-24 10:49:42	2022-03-24 10:49:42	DLRG Bad Oldesloe	dlrg-bad-oldesloe-1	\N	f
572	2022-03-24 10:49:42	2022-03-24 10:49:42	DLRG Niedersachsen	dlrg-niedersachsen-23	\N	f
573	2022-03-24 10:49:42	2022-03-24 10:49:42	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-4	\N	f
574	2022-03-24 10:49:42	2022-03-24 10:49:42	Belgium NT	belgium-nt-8	\N	f
575	2022-03-24 10:49:42	2022-03-24 10:49:42	Belgium NT	belgium-nt-9	\N	f
576	2022-03-24 10:49:42	2022-03-24 10:49:42	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-5	\N	f
577	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Niedersachsen	dlrg-niedersachsen-24	\N	f
578	2022-03-24 10:49:43	2022-03-24 10:49:43	Italy NT	italy-nt-14	\N	f
579	2022-03-24 10:49:43	2022-03-24 10:49:43	Italy NT	italy-nt-15	\N	f
580	2022-03-24 10:49:43	2022-03-24 10:49:43	ASD Gorizia Nuoto	asd-gorizia-nuoto-5	\N	f
581	2022-03-24 10:49:43	2022-03-24 10:49:43	Spain NT	spain-nt-13	\N	f
582	2022-03-24 10:49:43	2022-03-24 10:49:43	SAFA 2000	safa-2000-5	\N	f
583	2022-03-24 10:49:43	2022-03-24 10:49:43	Polen NT	polen-nt-2	\N	f
584	2022-03-24 10:49:43	2022-03-24 10:49:43	In Sport Rane Rosse	in-sport-rane-rosse-6	\N	f
585	2022-03-24 10:49:43	2022-03-24 10:49:43	Beacon Lifesaving Club	beacon-lifesaving-club-2	\N	f
586	2022-03-24 10:49:43	2022-03-24 10:49:43	France NT	france-nt-16	\N	f
587	2022-03-24 10:49:43	2022-03-24 10:49:43	SAFA 2000	safa-2000-6	\N	f
588	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-10	\N	f
589	2022-03-24 10:49:43	2022-03-24 10:49:43	A.S.D. Sportiva Sturla	asd-sportiva-sturla-2	\N	f
590	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Lueneburg e.V.	dlrg-lueneburg-ev	\N	f
591	2022-03-24 10:49:43	2022-03-24 10:49:43	Accademia Di Salvamento	accademia-di-salvamento-18	\N	f
592	2022-03-24 10:49:43	2022-03-24 10:49:43	Belgium NT	belgium-nt-10	\N	f
593	2022-03-24 10:49:43	2022-03-24 10:49:43	ASD Rosetana Nuoto	asd-rosetana-nuoto-3	\N	f
594	2022-03-24 10:49:43	2022-03-24 10:49:43	RB Heytse	rb-heytse-9	\N	f
595	2022-03-24 10:49:43	2022-03-24 10:49:43	RB Heytse	rb-heytse-10	\N	f
596	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Luckenwalde	dlrg-luckenwalde-4	\N	f
597	2022-03-24 10:49:43	2022-03-24 10:49:43	ASD Rosetana Nuoto	asd-rosetana-nuoto-4	\N	f
598	2022-03-24 10:49:43	2022-03-24 10:49:43	Rctal	rctal-5	\N	f
599	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Niedersachsen	dlrg-niedersachsen-25	\N	f
600	2022-03-24 10:49:43	2022-03-24 10:49:43	DLRG Niedersachsen	dlrg-niedersachsen-26	\N	f
601	2022-03-24 10:49:43	2022-03-24 10:49:43	RB Waddinxveen	rb-waddinxveen-4	\N	f
602	2022-03-24 10:49:43	2022-03-24 10:49:43	Accademia Di Salvamento	accademia-di-salvamento-19	\N	f
603	2022-03-24 10:49:43	2022-03-24 10:49:43	RB Delft	rb-delft-12	\N	f
604	2022-03-24 10:49:43	2022-03-24 10:49:43	RB Delft	rb-delft-13	\N	f
605	2022-03-24 10:49:44	2022-03-24 10:49:44	RB Delft	rb-delft-14	\N	f
606	2022-03-24 10:49:44	2022-03-24 10:49:44	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club	\N	f
607	2022-03-24 10:49:44	2022-03-24 10:49:44	Italy NT	italy-nt-16	\N	f
608	2022-03-24 10:49:44	2022-03-24 10:49:44	Spain NT	spain-nt-14	\N	f
609	2022-03-24 10:49:44	2022-03-24 10:49:44	Spain NT	spain-nt-15	\N	f
610	2022-03-24 10:49:44	2022-03-24 10:49:44	In Sport Rane Rosse	in-sport-rane-rosse-7	\N	f
611	2022-03-24 10:49:44	2022-03-24 10:49:44	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-8	\N	f
612	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Bracciano	athena-bracciano-20	\N	f
613	2022-03-24 10:49:44	2022-03-24 10:49:44	Spain NT	spain-nt-16	\N	f
614	2022-03-24 10:49:44	2022-03-24 10:49:44	Accademia Di Salvamento	accademia-di-salvamento-20	\N	f
615	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Bracciano	athena-bracciano-21	\N	f
616	2022-03-24 10:49:44	2022-03-24 10:49:44	Accademia Di Salvamento	accademia-di-salvamento-21	\N	f
617	2022-03-24 10:49:44	2022-03-24 10:49:44	Belgium NT	belgium-nt-11	\N	f
618	2022-03-24 10:49:44	2022-03-24 10:49:44	France NT	france-nt-17	\N	f
619	2022-03-24 10:49:44	2022-03-24 10:49:44	Slaskie WOPR	slaskie-wopr-11	\N	f
620	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Bracciano	athena-bracciano-22	\N	f
621	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Salvamento	athena-salvamento-12	\N	f
622	2022-03-24 10:49:44	2022-03-24 10:49:44	Liege Sauvetage Club	liege-sauvetage-club-5	\N	f
623	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Salvamento	athena-salvamento-13	\N	f
624	2022-03-24 10:49:44	2022-03-24 10:49:44	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-9	\N	f
625	2022-03-24 10:49:44	2022-03-24 10:49:44	In Sport Rane Rosse	in-sport-rane-rosse-8	\N	f
626	2022-03-24 10:49:44	2022-03-24 10:49:44	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-3	\N	f
627	2022-03-24 10:49:44	2022-03-24 10:49:44	Liege Sauvetage Club	liege-sauvetage-club-6	\N	f
628	2022-03-24 10:49:44	2022-03-24 10:49:44	Athena Salvamento	athena-salvamento-14	\N	f
629	2022-03-24 10:49:44	2022-03-24 10:49:44	In Sport Rane Rosse	in-sport-rane-rosse-9	\N	f
630	2022-03-24 10:49:44	2022-03-24 10:49:44	Sint-Truidense RC	sint-truidense-rc-4	\N	f
631	2022-03-24 10:49:44	2022-03-24 10:49:44	DLRG Niedersachsen	dlrg-niedersachsen-27	\N	f
632	2022-03-24 10:49:44	2022-03-24 10:49:44	CKS Szczecin	cks-szczecin-8	\N	f
633	2022-03-24 10:49:44	2022-03-24 10:49:44	Nederland NT	nederland-nt-6	\N	f
634	2022-03-24 10:49:44	2022-03-24 10:49:44	France NT	france-nt-18	\N	f
635	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Guetersloh	dlrg-guetersloh-8	\N	f
636	2022-03-24 10:49:45	2022-03-24 10:49:45	Rctal	rctal-6	\N	f
637	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Niedersachsen	dlrg-niedersachsen-28	\N	f
638	2022-03-24 10:49:45	2022-03-24 10:49:45	Slaskie WOPR	slaskie-wopr-12	\N	f
639	2022-03-24 10:49:45	2022-03-24 10:49:45	SAFA 2000	safa-2000-7	\N	f
640	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-11	\N	f
641	2022-03-24 10:49:45	2022-03-24 10:49:45	Rctal	rctal-7	\N	f
642	2022-03-24 10:49:45	2022-03-24 10:49:45	CKS Szczecin	cks-szczecin-9	\N	f
643	2022-03-24 10:49:45	2022-03-24 10:49:45	Accademia Di Salvamento	accademia-di-salvamento-22	\N	f
644	2022-03-24 10:49:45	2022-03-24 10:49:45	In Sport Rane Rosse	in-sport-rane-rosse-10	\N	f
645	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Niedersachsen	dlrg-niedersachsen-29	\N	f
646	2022-03-24 10:49:45	2022-03-24 10:49:45	Kusel KiXXX	kusel-kixxx-7	\N	f
647	2022-03-24 10:49:45	2022-03-24 10:49:45	Athena Salvamento	athena-salvamento-15	\N	f
648	2022-03-24 10:49:45	2022-03-24 10:49:45	RB Delft	rb-delft-15	\N	f
649	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-1	\N	f
650	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Niedersachsen	dlrg-niedersachsen-30	\N	f
651	2022-03-24 10:49:45	2022-03-24 10:49:45	Liege Sauvetage Club	liege-sauvetage-club-7	\N	f
652	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Niedersachsen	dlrg-niedersachsen-31	\N	f
653	2022-03-24 10:49:45	2022-03-24 10:49:45	Rctal	rctal-8	\N	f
654	2022-03-24 10:49:45	2022-03-24 10:49:45	Accademia Di Salvamento	accademia-di-salvamento-23	\N	f
655	2022-03-24 10:49:45	2022-03-24 10:49:45	Athena Bracciano	athena-bracciano-23	\N	f
656	2022-03-24 10:49:45	2022-03-24 10:49:45	Slaskie WOPR	slaskie-wopr-13	\N	f
657	2022-03-24 10:49:45	2022-03-24 10:49:45	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-10	\N	f
658	2022-03-24 10:49:45	2022-03-24 10:49:45	Athena Salvamento	athena-salvamento-16	\N	f
659	2022-03-24 10:49:45	2022-03-24 10:49:45	RB Heytse	rb-heytse-11	\N	f
660	2022-03-24 10:49:45	2022-03-24 10:49:45	Slaskie WOPR	slaskie-wopr-14	\N	f
661	2022-03-24 10:49:46	2022-03-24 10:49:46	Slaskie WOPR	slaskie-wopr-15	\N	f
662	2022-03-24 10:49:46	2022-03-24 10:49:46	RB Heytse	rb-heytse-12	\N	f
663	2022-03-24 10:49:46	2022-03-24 10:49:46	Athena Salvamento	athena-salvamento-17	\N	f
664	2022-03-24 10:49:46	2022-03-24 10:49:46	RB Heytse	rb-heytse-13	\N	f
665	2022-03-24 10:49:46	2022-03-24 10:49:46	In Sport Rane Rosse	in-sport-rane-rosse-11	\N	f
666	2022-03-24 10:49:46	2022-03-24 10:49:46	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-12	\N	f
667	2022-03-24 10:49:46	2022-03-24 10:49:46	In Sport Rane Rosse	in-sport-rane-rosse-12	\N	f
668	2022-03-24 10:49:46	2022-03-24 10:49:46	In Sport Rane Rosse	in-sport-rane-rosse-13	\N	f
669	2022-03-24 10:49:46	2022-03-24 10:49:46	ASD Rosetana Nuoto	asd-rosetana-nuoto-5	\N	f
670	2022-03-24 10:49:46	2022-03-24 10:49:46	DLRG Guetersloh	dlrg-guetersloh-9	\N	f
671	2022-03-24 10:49:46	2022-03-24 10:49:46	DLRG Guetersloh	dlrg-guetersloh-10	\N	f
672	2022-03-24 10:49:46	2022-03-24 10:49:46	France NT	france-nt-19	\N	f
673	2022-03-24 10:49:46	2022-03-24 10:49:46	Athena Bracciano	athena-bracciano-24	\N	f
674	2022-03-24 10:49:46	2022-03-24 10:49:46	Sint-Truidense RC	sint-truidense-rc-5	\N	f
675	2022-03-24 10:49:46	2022-03-24 10:49:46	Italy NT	italy-nt-17	\N	f
676	2022-03-24 10:49:46	2022-03-24 10:49:46	Belgium NT	belgium-nt-12	\N	f
677	2022-03-24 10:49:46	2022-03-24 10:49:46	Italy NT	italy-nt-18	\N	f
678	2022-03-24 10:49:46	2022-03-24 10:49:46	France NT	france-nt-20	\N	f
679	2022-03-24 10:49:46	2022-03-24 10:49:46	Belgium NT	belgium-nt-13	\N	f
680	2022-03-24 10:49:46	2022-03-24 10:49:46	Nederland NT	nederland-nt-7	\N	f
681	2022-03-24 10:49:46	2022-03-24 10:49:46	Spain NT	spain-nt-17	\N	f
682	2022-03-24 10:49:46	2022-03-24 10:49:46	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock	\N	f
683	2022-03-24 10:49:46	2022-03-24 10:49:46	France NT	france-nt-21	\N	f
684	2022-03-24 10:49:46	2022-03-24 10:49:46	In Sport Rane Rosse	in-sport-rane-rosse-14	\N	f
685	2022-03-24 10:49:46	2022-03-24 10:49:46	In Sport Rane Rosse	in-sport-rane-rosse-15	\N	f
686	2022-03-24 10:49:46	2022-03-24 10:49:46	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-13	\N	f
687	2022-03-24 10:49:47	2022-03-24 10:49:47	Nederland NT	nederland-nt-8	\N	f
688	2022-03-24 10:49:47	2022-03-24 10:49:47	Slaskie WOPR	slaskie-wopr-16	\N	f
689	2022-03-24 10:49:47	2022-03-24 10:49:47	CKS Szczecin	cks-szczecin-10	\N	f
690	2022-03-24 10:49:47	2022-03-24 10:49:47	Italy NT	italy-nt-19	\N	f
691	2022-03-24 10:49:47	2022-03-24 10:49:47	Italy NT	italy-nt-20	\N	f
692	2022-03-24 10:49:47	2022-03-24 10:49:47	Nederland NT	nederland-nt-9	\N	f
693	2022-03-24 10:49:47	2022-03-24 10:49:47	Athena Bracciano	athena-bracciano-25	\N	f
694	2022-03-24 10:49:47	2022-03-24 10:49:47	Accademia Di Salvamento	accademia-di-salvamento-24	\N	f
695	2022-03-24 10:49:47	2022-03-24 10:49:47	Accademia Di Salvamento	accademia-di-salvamento-25	\N	f
696	2022-03-24 10:49:47	2022-03-24 10:49:47	Kusel KiXXX	kusel-kixxx-8	\N	f
697	2022-03-24 10:49:47	2022-03-24 10:49:47	Accademia Di Salvamento	accademia-di-salvamento-26	\N	f
698	2022-03-24 10:49:47	2022-03-24 10:49:47	Athena Bracciano	athena-bracciano-26	\N	f
699	2022-03-24 10:49:47	2022-03-24 10:49:47	DLRG Niedersachsen	dlrg-niedersachsen-32	\N	f
700	2022-03-24 10:49:47	2022-03-24 10:49:47	ASD Gorizia Nuoto	asd-gorizia-nuoto-6	\N	f
701	2022-03-24 10:49:47	2022-03-24 10:49:47	Athena Bracciano	athena-bracciano-27	\N	f
702	2022-03-24 10:49:47	2022-03-24 10:49:47	Athena Bracciano	athena-bracciano-28	\N	f
703	2022-03-24 10:49:47	2022-03-24 10:49:47	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-11	\N	f
704	2022-03-24 10:49:47	2022-03-24 10:49:47	France NT	france-nt-22	\N	f
705	2022-03-24 10:49:47	2022-03-24 10:49:47	A.S.D. Sportiva Sturla	asd-sportiva-sturla-3	\N	f
706	2022-03-24 10:49:47	2022-03-24 10:49:47	DLRG Niedersachsen	dlrg-niedersachsen-33	\N	f
707	2022-03-24 10:49:47	2022-03-24 10:49:47	France NT	france-nt-23	\N	f
708	2022-03-24 10:49:48	2022-03-24 10:49:48	A.S.D. Sportiva Sturla	asd-sportiva-sturla-4	\N	f
709	2022-03-24 10:49:48	2022-03-24 10:49:48	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-1	\N	f
710	2022-03-24 10:49:48	2022-03-24 10:49:48	DLRG Niedersachsen	dlrg-niedersachsen-34	\N	f
711	2022-03-24 10:49:48	2022-03-24 10:49:48	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-14	\N	f
712	2022-03-24 10:49:48	2022-03-24 10:49:48	Spain NT	spain-nt-18	\N	f
713	2022-03-24 10:49:48	2022-03-24 10:49:48	France NT	france-nt-24	\N	f
714	2022-03-24 10:49:48	2022-03-24 10:49:48	Polen NT	polen-nt-3	\N	f
715	2022-03-24 10:49:48	2022-03-24 10:49:48	Accademia Di Salvamento	accademia-di-salvamento-27	\N	f
716	2022-03-24 10:49:48	2022-03-24 10:49:48	CKS Szczecin	cks-szczecin-11	\N	f
717	2022-03-24 10:49:48	2022-03-24 10:49:48	CKS Szczecin	cks-szczecin-12	\N	f
718	2022-03-24 10:49:48	2022-03-24 10:49:48	Spain NT	spain-nt-19	\N	f
719	2022-03-24 10:49:48	2022-03-24 10:49:48	Liege Sauvetage Club	liege-sauvetage-club-8	\N	f
720	2022-03-24 10:49:48	2022-03-24 10:49:48	CKS Szczecin	cks-szczecin-13	\N	f
721	2022-03-24 10:49:48	2022-03-24 10:49:48	Accademia Di Salvamento	accademia-di-salvamento-28	\N	f
722	2022-03-24 10:49:48	2022-03-24 10:49:48	DLRG Guetersloh	dlrg-guetersloh-11	\N	f
723	2022-03-24 10:49:48	2022-03-24 10:49:48	In Sport Rane Rosse	in-sport-rane-rosse-16	\N	f
724	2022-03-24 10:49:48	2022-03-24 10:49:48	Polen NT	polen-nt-4	\N	f
725	2022-03-24 10:49:48	2022-03-24 10:49:48	MKS Szczecin	mks-szczecin-2	\N	f
726	2022-03-24 10:49:48	2022-03-24 10:49:48	Athena Bracciano	athena-bracciano-29	\N	f
727	2022-03-24 10:49:48	2022-03-24 10:49:48	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan	\N	f
728	2022-03-24 10:49:48	2022-03-24 10:49:48	Accademia Di Salvamento	accademia-di-salvamento-29	\N	f
729	2022-03-24 10:49:48	2022-03-24 10:49:48	ASD Rosetana Nuoto	asd-rosetana-nuoto-6	\N	f
730	2022-03-24 10:49:48	2022-03-24 10:49:48	A.S.D. Sportiva Sturla	asd-sportiva-sturla-5	\N	f
731	2022-03-24 10:49:48	2022-03-24 10:49:48	Sint-Truidense RC	sint-truidense-rc-6	\N	f
732	2022-03-24 10:49:49	2022-03-24 10:49:49	France NT	france-nt-25	\N	f
733	2022-03-24 10:49:49	2022-03-24 10:49:49	Accademia Di Salvamento	accademia-di-salvamento-30	\N	f
734	2022-03-24 10:49:49	2022-03-24 10:49:49	MKS Szczecin	mks-szczecin-3	\N	f
735	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-12	\N	f
736	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Niedersachsen	dlrg-niedersachsen-35	\N	f
737	2022-03-24 10:49:49	2022-03-24 10:49:49	Liege Sauvetage Club	liege-sauvetage-club-9	\N	f
738	2022-03-24 10:49:49	2022-03-24 10:49:49	Athena Bracciano	athena-bracciano-30	\N	f
739	2022-03-24 10:49:49	2022-03-24 10:49:49	Sint-Truidense RC	sint-truidense-rc-7	\N	f
740	2022-03-24 10:49:49	2022-03-24 10:49:49	France NT	france-nt-26	\N	f
741	2022-03-24 10:49:49	2022-03-24 10:49:49	Kusel KiXXX	kusel-kixxx-9	\N	f
742	2022-03-24 10:49:49	2022-03-24 10:49:49	RB Waddinxveen	rb-waddinxveen-5	\N	f
743	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-15	\N	f
744	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Buchholz United	dlrg-buchholz-united-5	\N	f
745	2022-03-24 10:49:49	2022-03-24 10:49:49	Accademia Di Salvamento	accademia-di-salvamento-31	\N	f
746	2022-03-24 10:49:49	2022-03-24 10:49:49	ASD Rosetana Nuoto	asd-rosetana-nuoto-7	\N	f
747	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Buchholz United	dlrg-buchholz-united-6	\N	f
748	2022-03-24 10:49:49	2022-03-24 10:49:49	In Sport Rane Rosse	in-sport-rane-rosse-17	\N	f
749	2022-03-24 10:49:49	2022-03-24 10:49:49	Italy NT	italy-nt-21	\N	f
750	2022-03-24 10:49:49	2022-03-24 10:49:49	Polen NT	polen-nt-5	\N	f
751	2022-03-24 10:49:49	2022-03-24 10:49:49	DLRG Buchholz United	dlrg-buchholz-united-7	\N	f
752	2022-03-24 10:49:49	2022-03-24 10:49:49	RB Delft	rb-delft-16	\N	f
753	2022-03-24 10:49:49	2022-03-24 10:49:49	Athena Bracciano	athena-bracciano-31	\N	f
754	2022-03-24 10:49:49	2022-03-24 10:49:49	RB Delft	rb-delft-17	\N	f
755	2022-03-24 10:49:50	2022-03-24 10:49:50	RB Delft	rb-delft-18	\N	f
756	2022-03-24 10:49:50	2022-03-24 10:49:50	Liege Sauvetage Club	liege-sauvetage-club-10	\N	f
757	2022-03-24 10:49:50	2022-03-24 10:49:50	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-1	\N	f
758	2022-03-24 10:49:50	2022-03-24 10:49:50	Belgium NT	belgium-nt-14	\N	f
759	2022-03-24 10:49:50	2022-03-24 10:49:50	Spain NT	spain-nt-20	\N	f
760	2022-03-24 10:49:50	2022-03-24 10:49:50	Italy NT	italy-nt-22	\N	f
761	2022-03-24 10:49:50	2022-03-24 10:49:50	France NT	france-nt-27	\N	f
762	2022-03-24 10:49:50	2022-03-24 10:49:50	Italy NT	italy-nt-23	\N	f
763	2022-03-24 10:49:50	2022-03-24 10:49:50	Spain NT	spain-nt-21	\N	f
764	2022-03-24 10:49:50	2022-03-24 10:49:50	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-6	\N	f
765	2022-03-24 10:49:50	2022-03-24 10:49:50	Nederland NT	nederland-nt-10	\N	f
766	2022-03-24 10:49:50	2022-03-24 10:49:50	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-13	\N	f
767	2022-03-24 10:49:50	2022-03-24 10:49:50	Accademia Di Salvamento	accademia-di-salvamento-32	\N	f
768	2022-03-24 10:49:50	2022-03-24 10:49:50	Slaskie WOPR	slaskie-wopr-17	\N	f
769	2022-03-24 10:49:50	2022-03-24 10:49:50	France NT	france-nt-28	\N	f
770	2022-03-24 10:49:50	2022-03-24 10:49:50	CKS Szczecin	cks-szczecin-14	\N	f
771	2022-03-24 10:49:51	2022-03-24 10:49:51	DLRG Niedersachsen	dlrg-niedersachsen-36	\N	f
772	2022-03-24 10:49:51	2022-03-24 10:49:51	Athena Bracciano	athena-bracciano-32	\N	f
773	2022-03-24 10:49:51	2022-03-24 10:49:51	DLRG Niedersachsen	dlrg-niedersachsen-37	\N	f
774	2022-03-24 10:49:51	2022-03-24 10:49:51	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-16	\N	f
775	2022-03-24 10:49:51	2022-03-24 10:49:51	Athena Bracciano	athena-bracciano-33	\N	f
776	2022-03-24 10:49:51	2022-03-24 10:49:51	Athena Salvamento	athena-salvamento-18	\N	f
777	2022-03-24 10:49:51	2022-03-24 10:49:51	Athena Salvamento	athena-salvamento-19	\N	f
778	2022-03-24 10:49:51	2022-03-24 10:49:51	DLRG Guetersloh	dlrg-guetersloh-12	\N	f
779	2022-03-24 10:49:51	2022-03-24 10:49:51	Spain NT	spain-nt-22	\N	f
780	2022-03-24 10:49:51	2022-03-24 10:49:51	Polen NT	polen-nt-6	\N	f
781	2022-03-24 10:49:51	2022-03-24 10:49:51	Italy NT	italy-nt-24	\N	f
782	2022-03-24 10:49:52	2022-03-24 10:49:52	Italy NT	italy-nt-25	\N	f
783	2022-03-24 10:49:52	2022-03-24 10:49:52	Spain NT	spain-nt-23	\N	f
784	2022-03-24 10:49:52	2022-03-24 10:49:52	SAFA 2000	safa-2000-8	\N	f
785	2022-03-24 10:49:52	2022-03-24 10:49:52	France NT	france-nt-29	\N	f
786	2022-03-24 10:49:52	2022-03-24 10:49:52	ASD Gorizia Nuoto	asd-gorizia-nuoto-7	\N	f
787	2022-03-24 10:49:52	2022-03-24 10:49:52	A.S.D. Sportiva Sturla	asd-sportiva-sturla-6	\N	f
788	2022-03-24 10:49:52	2022-03-24 10:49:52	CKS Szczecin	cks-szczecin-15	\N	f
789	2022-03-24 10:49:52	2022-03-24 10:49:52	Athena Bracciano	athena-bracciano-34	\N	f
790	2022-03-24 10:49:52	2022-03-24 10:49:52	DLRG Guetersloh	dlrg-guetersloh-13	\N	f
791	2022-03-24 10:49:52	2022-03-24 10:49:52	Hungarian NT	hungarian-nt-1	\N	f
792	2022-03-24 10:49:52	2022-03-24 10:49:52	Accademia Di Salvamento	accademia-di-salvamento-33	\N	f
793	2022-03-24 10:49:52	2022-03-24 10:49:52	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-17	\N	f
794	2022-03-24 10:49:52	2022-03-24 10:49:52	DLRG Luckenwalde	dlrg-luckenwalde-5	\N	f
795	2022-03-24 10:49:52	2022-03-24 10:49:52	DLRG Buchholz United	dlrg-buchholz-united-8	\N	f
796	2022-03-24 10:49:52	2022-03-24 10:49:52	France NT	france-nt-30	\N	f
797	2022-03-24 10:49:52	2022-03-24 10:49:52	Athena Bracciano	athena-bracciano-35	\N	f
798	2022-03-24 10:49:52	2022-03-24 10:49:52	Slaskie WOPR	slaskie-wopr-18	\N	f
799	2022-03-24 10:49:53	2022-03-24 10:49:53	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-18	\N	f
800	2022-03-24 10:49:53	2022-03-24 10:49:53	Accademia Di Salvamento	accademia-di-salvamento-34	\N	f
801	2022-03-24 10:49:53	2022-03-24 10:49:53	Athena Salvamento	athena-salvamento-20	\N	f
802	2022-03-24 10:49:53	2022-03-24 10:49:53	DLRG Niedersachsen	dlrg-niedersachsen-38	\N	f
803	2022-03-24 10:49:53	2022-03-24 10:49:53	ASD Rosetana Nuoto	asd-rosetana-nuoto-8	\N	f
804	2022-03-24 10:49:53	2022-03-24 10:49:53	MKS Szczecin	mks-szczecin-4	\N	f
805	2022-03-24 10:49:53	2022-03-24 10:49:53	RB Delft	rb-delft-19	\N	f
806	2022-03-24 10:49:53	2022-03-24 10:49:53	Spain NT	spain-nt-24	\N	f
807	2022-03-24 10:49:53	2022-03-24 10:49:53	Accademia Di Salvamento	accademia-di-salvamento-35	\N	f
808	2022-03-24 10:49:53	2022-03-24 10:49:53	SAFA 2000	safa-2000-9	\N	f
809	2022-03-24 10:49:53	2022-03-24 10:49:53	In Sport Rane Rosse	in-sport-rane-rosse-18	\N	f
810	2022-03-24 10:49:53	2022-03-24 10:49:53	Italy NT	italy-nt-26	\N	f
811	2022-03-24 10:49:53	2022-03-24 10:49:53	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-4	\N	f
812	2022-03-24 10:49:53	2022-03-24 10:49:53	Spain NT	spain-nt-25	\N	f
813	2022-03-24 10:49:53	2022-03-24 10:49:53	In Sport Rane Rosse	in-sport-rane-rosse-19	\N	f
814	2022-03-24 10:49:53	2022-03-24 10:49:53	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-14	\N	f
815	2022-03-24 10:49:54	2022-03-24 10:49:54	France NT	france-nt-31	\N	f
816	2022-03-24 10:49:54	2022-03-24 10:49:54	Accademia Di Salvamento	accademia-di-salvamento-36	\N	f
817	2022-03-24 10:49:54	2022-03-24 10:49:54	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-15	\N	f
818	2022-03-24 10:49:54	2022-03-24 10:49:54	Kusel KiXXX	kusel-kixxx-10	\N	f
819	2022-03-24 10:49:54	2022-03-24 10:49:54	Athena Bracciano	athena-bracciano-36	\N	f
820	2022-03-24 10:49:54	2022-03-24 10:49:54	Liege Sauvetage Club	liege-sauvetage-club-11	\N	f
821	2022-03-24 10:49:54	2022-03-24 10:49:54	Slaskie WOPR	slaskie-wopr-19	\N	f
822	2022-03-24 10:49:54	2022-03-24 10:49:54	DLRG Niedersachsen	dlrg-niedersachsen-39	\N	f
823	2022-03-24 10:49:54	2022-03-24 10:49:54	Rctal	rctal-9	\N	f
824	2022-03-24 10:49:54	2022-03-24 10:49:54	Athena Bracciano	athena-bracciano-37	\N	f
825	2022-03-24 10:49:54	2022-03-24 10:49:54	In Sport Rane Rosse	in-sport-rane-rosse-20	\N	f
826	2022-03-24 10:49:54	2022-03-24 10:49:54	France NT	france-nt-32	\N	f
827	2022-03-24 10:49:54	2022-03-24 10:49:54	In Sport Rane Rosse	in-sport-rane-rosse-21	\N	f
828	2022-03-24 10:49:54	2022-03-24 10:49:54	Athena Bracciano	athena-bracciano-38	\N	f
829	2022-03-24 10:49:54	2022-03-24 10:49:54	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-19	\N	f
830	2022-03-24 10:49:54	2022-03-24 10:49:54	DLRG Niedersachsen	dlrg-niedersachsen-40	\N	f
831	2022-03-24 10:49:54	2022-03-24 10:49:54	Sint-Truidense RC	sint-truidense-rc-8	\N	f
832	2022-03-24 10:49:54	2022-03-24 10:49:54	Athena Salvamento	athena-salvamento-21	\N	f
833	2022-03-24 10:49:54	2022-03-24 10:49:54	Accademia Di Salvamento	accademia-di-salvamento-37	\N	f
834	2022-03-24 10:49:54	2022-03-24 10:49:54	In Sport Rane Rosse	in-sport-rane-rosse-22	\N	f
835	2022-03-24 10:49:54	2022-03-24 10:49:54	Athena Salvamento	athena-salvamento-22	\N	f
836	2022-03-24 10:49:54	2022-03-24 10:49:54	Slaskie WOPR	slaskie-wopr-20	\N	f
837	2022-03-24 10:49:55	2022-03-24 10:49:55	Rctal	rctal-10	\N	f
838	2022-03-24 10:49:55	2022-03-24 10:49:55	Rctal	rctal-11	\N	f
839	2022-03-24 10:49:55	2022-03-24 10:49:55	CKS Szczecin	cks-szczecin-16	\N	f
840	2022-03-24 10:49:55	2022-03-24 10:49:55	Sint-Truidense RC	sint-truidense-rc-9	\N	f
841	2022-03-24 10:49:55	2022-03-24 10:49:55	Nederland NT	nederland-nt-11	\N	f
842	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-2	\N	f
843	2022-03-24 10:49:55	2022-03-24 10:49:55	Sint-Truidense RC	sint-truidense-rc-10	\N	f
844	2022-03-24 10:49:55	2022-03-24 10:49:55	Athena Bracciano	athena-bracciano-39	\N	f
845	2022-03-24 10:49:55	2022-03-24 10:49:55	RB Heytse	rb-heytse-14	\N	f
846	2022-03-24 10:49:55	2022-03-24 10:49:55	RB Heytse	rb-heytse-15	\N	f
847	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Guetersloh	dlrg-guetersloh-14	\N	f
848	2022-03-24 10:49:55	2022-03-24 10:49:55	RB Delft	rb-delft-20	\N	f
849	2022-03-24 10:49:55	2022-03-24 10:49:55	Athena Salvamento	athena-salvamento-23	\N	f
850	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Niedersachsen	dlrg-niedersachsen-41	\N	f
851	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Guetersloh	dlrg-guetersloh-15	\N	f
852	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Niedersachsen	dlrg-niedersachsen-42	\N	f
853	2022-03-24 10:49:55	2022-03-24 10:49:55	Liege Sauvetage Club	liege-sauvetage-club-12	\N	f
854	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Niedersachsen	dlrg-niedersachsen-43	\N	f
855	2022-03-24 10:49:55	2022-03-24 10:49:55	RB Heytse	rb-heytse-16	\N	f
856	2022-03-24 10:49:55	2022-03-24 10:49:55	Italy NT	italy-nt-27	\N	f
857	2022-03-24 10:49:55	2022-03-24 10:49:55	DLRG Bad Oldesloe	dlrg-bad-oldesloe-2	\N	f
858	2022-03-24 10:49:55	2022-03-24 10:49:55	Italy NT	italy-nt-28	\N	f
859	2022-03-24 10:49:55	2022-03-24 10:49:55	Belgium NT	belgium-nt-15	\N	f
860	2022-03-24 10:49:56	2022-03-24 10:49:56	Spain NT	spain-nt-26	\N	f
861	2022-03-24 10:49:56	2022-03-24 10:49:56	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-16	\N	f
862	2022-03-24 10:49:56	2022-03-24 10:49:56	Spain NT	spain-nt-27	\N	f
863	2022-03-24 10:49:56	2022-03-24 10:49:56	Belgium NT	belgium-nt-16	\N	f
864	2022-03-24 10:49:56	2022-03-24 10:49:56	Spain NT	spain-nt-28	\N	f
865	2022-03-24 10:49:56	2022-03-24 10:49:56	Belgium NT	belgium-nt-17	\N	f
866	2022-03-24 10:49:56	2022-03-24 10:49:56	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-17	\N	f
867	2022-03-24 10:49:56	2022-03-24 10:49:56	Nederland NT	nederland-nt-12	\N	f
868	2022-03-24 10:49:56	2022-03-24 10:49:56	In Sport Rane Rosse	in-sport-rane-rosse-23	\N	f
869	2022-03-24 10:49:56	2022-03-24 10:49:56	Accademia Di Salvamento	accademia-di-salvamento-38	\N	f
870	2022-03-24 10:49:56	2022-03-24 10:49:56	A.S.D. Sportiva Sturla	asd-sportiva-sturla-7	\N	f
871	2022-03-24 10:49:56	2022-03-24 10:49:56	ASD Gorizia Nuoto	asd-gorizia-nuoto-8	\N	f
872	2022-03-24 10:49:56	2022-03-24 10:49:56	Rctal	rctal-12	\N	f
873	2022-03-24 10:49:56	2022-03-24 10:49:56	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-20	\N	f
874	2022-03-24 10:49:56	2022-03-24 10:49:56	Kusel KiXXX	kusel-kixxx-11	\N	f
875	2022-03-24 10:49:56	2022-03-24 10:49:56	Nederland NT	nederland-nt-13	\N	f
876	2022-03-24 10:49:56	2022-03-24 10:49:56	Athena Bracciano	athena-bracciano-40	\N	f
877	2022-03-24 10:49:56	2022-03-24 10:49:56	Athena Bracciano	athena-bracciano-41	\N	f
878	2022-03-24 10:49:56	2022-03-24 10:49:56	DLRG Niedersachsen	dlrg-niedersachsen-44	\N	f
879	2022-03-24 10:49:56	2022-03-24 10:49:56	Athena Bracciano	athena-bracciano-42	\N	f
880	2022-03-24 10:49:56	2022-03-24 10:49:56	France NT	france-nt-33	\N	f
881	2022-03-24 10:49:56	2022-03-24 10:49:56	France NT	france-nt-34	\N	f
882	2022-03-24 10:49:56	2022-03-24 10:49:56	In Sport Rane Rosse	in-sport-rane-rosse-24	\N	f
883	2022-03-24 10:49:57	2022-03-24 10:49:57	DLRG Niedersachsen	dlrg-niedersachsen-45	\N	f
884	2022-03-24 10:49:57	2022-03-24 10:49:57	Italy NT	italy-nt-29	\N	f
885	2022-03-24 10:49:57	2022-03-24 10:49:57	DLRG Niedersachsen	dlrg-niedersachsen-46	\N	f
886	2022-03-24 10:49:57	2022-03-24 10:49:57	Spain NT	spain-nt-29	\N	f
887	2022-03-24 10:49:57	2022-03-24 10:49:57	SAFA 2000	safa-2000-10	\N	f
888	2022-03-24 10:49:57	2022-03-24 10:49:57	CKS Szczecin	cks-szczecin-17	\N	f
889	2022-03-24 10:49:57	2022-03-24 10:49:57	Accademia Di Salvamento	accademia-di-salvamento-39	\N	f
890	2022-03-24 10:49:57	2022-03-24 10:49:57	ASD Gorizia Nuoto	asd-gorizia-nuoto-9	\N	f
891	2022-03-24 10:49:57	2022-03-24 10:49:57	In Sport Rane Rosse	in-sport-rane-rosse-25	\N	f
892	2022-03-24 10:49:57	2022-03-24 10:49:57	Liege Sauvetage Club	liege-sauvetage-club-13	\N	f
893	2022-03-24 10:49:57	2022-03-24 10:49:57	In Sport Rane Rosse	in-sport-rane-rosse-26	\N	f
894	2022-03-24 10:49:57	2022-03-24 10:49:57	France NT	france-nt-35	\N	f
895	2022-03-24 10:49:57	2022-03-24 10:49:57	ASD Rosetana Nuoto	asd-rosetana-nuoto-9	\N	f
896	2022-03-24 10:49:57	2022-03-24 10:49:57	Athena Bracciano	athena-bracciano-43	\N	f
897	2022-03-24 10:49:57	2022-03-24 10:49:57	A.S.D. Sportiva Sturla	asd-sportiva-sturla-8	\N	f
898	2022-03-24 10:49:57	2022-03-24 10:49:57	CKS Szczecin	cks-szczecin-18	\N	f
899	2022-03-24 10:49:57	2022-03-24 10:49:57	Liege Sauvetage Club	liege-sauvetage-club-14	\N	f
900	2022-03-24 10:49:57	2022-03-24 10:49:57	Slaskie WOPR	slaskie-wopr-21	\N	f
901	2022-03-24 10:49:57	2022-03-24 10:49:57	A.S.D. Sportiva Sturla	asd-sportiva-sturla-9	\N	f
902	2022-03-24 10:49:57	2022-03-24 10:49:57	Athena Bracciano	athena-bracciano-44	\N	f
903	2022-03-24 10:49:57	2022-03-24 10:49:57	Slaskie WOPR	slaskie-wopr-22	\N	f
904	2022-03-24 10:49:57	2022-03-24 10:49:57	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-21	\N	f
905	2022-03-24 10:49:57	2022-03-24 10:49:57	DLRG Niedersachsen	dlrg-niedersachsen-47	\N	f
906	2022-03-24 10:49:57	2022-03-24 10:49:57	DLRG Niedersachsen	dlrg-niedersachsen-48	\N	f
907	2022-03-24 10:49:58	2022-03-24 10:49:58	DLRG Niedersachsen	dlrg-niedersachsen-49	\N	f
908	2022-03-24 10:49:58	2022-03-24 10:49:58	Sint-Truidense RC	sint-truidense-rc-11	\N	f
909	2022-03-24 10:49:58	2022-03-24 10:49:58	Sint-Truidense RC	sint-truidense-rc-12	\N	f
910	2022-03-24 10:49:58	2022-03-24 10:49:58	Athena Salvamento	athena-salvamento-24	\N	f
911	2022-03-24 10:49:58	2022-03-24 10:49:58	Accademia Di Salvamento	accademia-di-salvamento-40	\N	f
912	2022-03-24 10:49:58	2022-03-24 10:49:58	MKS Szczecin	mks-szczecin-5	\N	f
913	2022-03-24 10:49:58	2022-03-24 10:49:58	Accademia Di Salvamento	accademia-di-salvamento-41	\N	f
914	2022-03-24 10:49:58	2022-03-24 10:49:58	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-1	\N	f
915	2022-03-24 10:49:58	2022-03-24 10:49:58	DLRG Niedersachsen	dlrg-niedersachsen-50	\N	f
916	2022-03-24 10:49:58	2022-03-24 10:49:58	DLRG Guetersloh	dlrg-guetersloh-16	\N	f
917	2022-03-24 10:49:58	2022-03-24 10:49:58	Kusel KiXXX	kusel-kixxx-12	\N	f
918	2022-03-24 10:49:58	2022-03-24 10:49:58	RB Waddinxveen	rb-waddinxveen-6	\N	f
919	2022-03-24 10:49:58	2022-03-24 10:49:58	RB Waddinxveen	rb-waddinxveen-7	\N	f
920	2022-03-24 10:51:03	2022-03-24 10:51:03	Italy NT	italy-nt-30	\N	f
921	2022-03-24 10:51:03	2022-03-24 10:51:03	SAFA 2000	safa-2000-11	\N	f
922	2022-03-24 10:51:03	2022-03-24 10:51:03	Accademia Di Salvamento	accademia-di-salvamento-42	\N	f
923	2022-03-24 10:51:03	2022-03-24 10:51:03	Spain NT	spain-nt-30	\N	f
924	2022-03-24 10:51:03	2022-03-24 10:51:03	France NT	france-nt-36	\N	f
925	2022-03-24 10:51:03	2022-03-24 10:51:03	Accademia Di Salvamento	accademia-di-salvamento-43	\N	f
926	2022-03-24 10:51:03	2022-03-24 10:51:03	Belgium NT	belgium-nt-18	\N	f
927	2022-03-24 10:51:03	2022-03-24 10:51:03	Kusel KiXXX	kusel-kixxx-13	\N	f
928	2022-03-24 10:51:03	2022-03-24 10:51:03	In Sport Rane Rosse	in-sport-rane-rosse-27	\N	f
929	2022-03-24 10:51:03	2022-03-24 10:51:03	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-18	\N	f
930	2022-03-24 10:51:03	2022-03-24 10:51:03	Athena Bracciano	athena-bracciano-45	\N	f
931	2022-03-24 10:51:03	2022-03-24 10:51:03	Slaskie WOPR	slaskie-wopr-23	\N	f
932	2022-03-24 10:51:03	2022-03-24 10:51:03	Slaskie WOPR	slaskie-wopr-24	\N	f
933	2022-03-24 10:51:03	2022-03-24 10:51:03	DLRG Niedersachsen	dlrg-niedersachsen-51	\N	f
934	2022-03-24 10:51:03	2022-03-24 10:51:03	France NT	france-nt-37	\N	f
935	2022-03-24 10:51:03	2022-03-24 10:51:03	Athena Bracciano	athena-bracciano-46	\N	f
936	2022-03-24 10:51:03	2022-03-24 10:51:03	Athena Salvamento	athena-salvamento-25	\N	f
937	2022-03-24 10:51:03	2022-03-24 10:51:03	In Sport Rane Rosse	in-sport-rane-rosse-28	\N	f
938	2022-03-24 10:51:03	2022-03-24 10:51:03	Sint-Truidense RC	sint-truidense-rc-13	\N	f
939	2022-03-24 10:51:03	2022-03-24 10:51:03	ASD Rosetana Nuoto	asd-rosetana-nuoto-10	\N	f
940	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Niedersachsen	dlrg-niedersachsen-52	\N	f
941	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-3	\N	f
942	2022-03-24 10:51:04	2022-03-24 10:51:04	Rctal	rctal-13	\N	f
943	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Niedersachsen	dlrg-niedersachsen-53	\N	f
944	2022-03-24 10:51:04	2022-03-24 10:51:04	Athena Bracciano	athena-bracciano-47	\N	f
945	2022-03-24 10:51:04	2022-03-24 10:51:04	Sint-Truidense RC	sint-truidense-rc-14	\N	f
946	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Niedersachsen	dlrg-niedersachsen-54	\N	f
947	2022-03-24 10:51:04	2022-03-24 10:51:04	Athena Salvamento	athena-salvamento-26	\N	f
948	2022-03-24 10:51:04	2022-03-24 10:51:04	Accademia Di Salvamento	accademia-di-salvamento-44	\N	f
949	2022-03-24 10:51:04	2022-03-24 10:51:04	Athena Salvamento	athena-salvamento-27	\N	f
950	2022-03-24 10:51:04	2022-03-24 10:51:04	Nederland NT	nederland-nt-14	\N	f
951	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-22	\N	f
952	2022-03-24 10:51:04	2022-03-24 10:51:04	Rctal	rctal-14	\N	f
953	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Guetersloh	dlrg-guetersloh-17	\N	f
954	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Guetersloh	dlrg-guetersloh-18	\N	f
955	2022-03-24 10:51:04	2022-03-24 10:51:04	Athena Bracciano	athena-bracciano-48	\N	f
956	2022-03-24 10:51:04	2022-03-24 10:51:04	RB Delft	rb-delft-21	\N	f
957	2022-03-24 10:51:04	2022-03-24 10:51:04	DLRG Guetersloh	dlrg-guetersloh-19	\N	f
958	2022-03-24 10:51:04	2022-03-24 10:51:04	Italy NT	italy-nt-31	\N	f
959	2022-03-24 10:51:04	2022-03-24 10:51:04	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-7	\N	f
960	2022-03-24 10:51:04	2022-03-24 10:51:04	Italy NT	italy-nt-32	\N	f
961	2022-03-24 10:51:04	2022-03-24 10:51:04	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-8	\N	f
962	2022-03-24 10:51:05	2022-03-24 10:51:05	DLRG Bad Oldesloe	dlrg-bad-oldesloe-3	\N	f
963	2022-03-24 10:51:05	2022-03-24 10:51:05	ASD Gorizia Nuoto	asd-gorizia-nuoto-10	\N	f
964	2022-03-24 10:51:05	2022-03-24 10:51:05	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-9	\N	f
965	2022-03-24 10:51:05	2022-03-24 10:51:05	France NT	france-nt-38	\N	f
966	2022-03-24 10:51:05	2022-03-24 10:51:05	Spain NT	spain-nt-31	\N	f
967	2022-03-24 10:51:05	2022-03-24 10:51:05	France NT	france-nt-39	\N	f
968	2022-03-24 10:51:05	2022-03-24 10:51:05	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-19	\N	f
969	2022-03-24 10:51:05	2022-03-24 10:51:05	Belgium NT	belgium-nt-19	\N	f
970	2022-03-24 10:51:05	2022-03-24 10:51:05	Athena Bracciano	athena-bracciano-49	\N	f
971	2022-03-24 10:51:05	2022-03-24 10:51:05	Nederland NT	nederland-nt-15	\N	f
972	2022-03-24 10:51:05	2022-03-24 10:51:05	Kusel KiXXX	kusel-kixxx-14	\N	f
973	2022-03-24 10:51:05	2022-03-24 10:51:05	Athena Bracciano	athena-bracciano-50	\N	f
974	2022-03-24 10:51:05	2022-03-24 10:51:05	Athena Bracciano	athena-bracciano-51	\N	f
975	2022-03-24 10:51:05	2022-03-24 10:51:05	DLRG Niedersachsen	dlrg-niedersachsen-55	\N	f
976	2022-03-24 10:51:05	2022-03-24 10:51:05	DLRG Luckenwalde	dlrg-luckenwalde-6	\N	f
977	2022-03-24 10:51:05	2022-03-24 10:51:05	DLRG Niedersachsen	dlrg-niedersachsen-56	\N	f
978	2022-03-24 10:51:05	2022-03-24 10:51:05	A.S.D. Sportiva Sturla	asd-sportiva-sturla-10	\N	f
979	2022-03-24 10:51:05	2022-03-24 10:51:05	Spain NT	spain-nt-32	\N	f
980	2022-03-24 10:51:05	2022-03-24 10:51:05	SAFA 2000	safa-2000-12	\N	f
981	2022-03-24 10:51:06	2022-03-24 10:51:06	CKS Szczecin	cks-szczecin-19	\N	f
982	2022-03-24 10:51:06	2022-03-24 10:51:06	ASD Gorizia Nuoto	asd-gorizia-nuoto-11	\N	f
983	2022-03-24 10:51:06	2022-03-24 10:51:06	CKS Szczecin	cks-szczecin-20	\N	f
984	2022-03-24 10:51:06	2022-03-24 10:51:06	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-5	\N	f
985	2022-03-24 10:51:06	2022-03-24 10:51:06	ASD Gorizia Nuoto	asd-gorizia-nuoto-12	\N	f
986	2022-03-24 10:51:06	2022-03-24 10:51:06	In Sport Rane Rosse	in-sport-rane-rosse-29	\N	f
987	2022-03-24 10:51:06	2022-03-24 10:51:06	In Sport Rane Rosse	in-sport-rane-rosse-30	\N	f
988	2022-03-24 10:51:06	2022-03-24 10:51:06	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-6	\N	f
989	2022-03-24 10:51:06	2022-03-24 10:51:06	Slaskie WOPR	slaskie-wopr-25	\N	f
990	2022-03-24 10:51:06	2022-03-24 10:51:06	RB Heytse	rb-heytse-17	\N	f
991	2022-03-24 10:51:06	2022-03-24 10:51:06	Belgium NT	belgium-nt-20	\N	f
992	2022-03-24 10:51:06	2022-03-24 10:51:06	RB Heytse	rb-heytse-18	\N	f
993	2022-03-24 10:51:06	2022-03-24 10:51:06	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-23	\N	f
994	2022-03-24 10:51:06	2022-03-24 10:51:06	Athena Bracciano	athena-bracciano-52	\N	f
995	2022-03-24 10:51:06	2022-03-24 10:51:06	Athena Salvamento	athena-salvamento-28	\N	f
996	2022-03-24 10:51:06	2022-03-24 10:51:06	DLRG Luckenwalde	dlrg-luckenwalde-7	\N	f
997	2022-03-24 10:51:06	2022-03-24 10:51:06	Athena Bracciano	athena-bracciano-53	\N	f
998	2022-03-24 10:51:06	2022-03-24 10:51:06	DLRG Niedersachsen	dlrg-niedersachsen-57	\N	f
999	2022-03-24 10:51:06	2022-03-24 10:51:06	DLRG Buchholz United	dlrg-buchholz-united-9	\N	f
1000	2022-03-24 10:51:06	2022-03-24 10:51:06	Athena Bracciano	athena-bracciano-54	\N	f
1001	2022-03-24 10:51:06	2022-03-24 10:51:06	Kusel KiXXX	kusel-kixxx-15	\N	f
1002	2022-03-24 10:51:07	2022-03-24 10:51:07	RB Waddinxveen	rb-waddinxveen-8	\N	f
1003	2022-03-24 10:51:07	2022-03-24 10:51:07	Beacon Lifesaving Club	beacon-lifesaving-club-3	\N	f
1004	2022-03-24 10:51:07	2022-03-24 10:51:07	DLRG Buchholz United	dlrg-buchholz-united-10	\N	f
1005	2022-03-24 10:51:07	2022-03-24 10:51:07	Italy NT	italy-nt-33	\N	f
1006	2022-03-24 10:51:07	2022-03-24 10:51:07	DLRG Buchholz United	dlrg-buchholz-united-11	\N	f
1007	2022-03-24 10:51:07	2022-03-24 10:51:07	Athena Bracciano	athena-bracciano-55	\N	f
1008	2022-03-24 10:51:07	2022-03-24 10:51:07	RB Delft	rb-delft-22	\N	f
1009	2022-03-24 10:51:07	2022-03-24 10:51:07	RB Delft	rb-delft-23	\N	f
1010	2022-03-24 10:51:07	2022-03-24 10:51:07	RB Delft	rb-delft-24	\N	f
1011	2022-03-24 10:51:07	2022-03-24 10:51:07	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-10	\N	f
1012	2022-03-24 10:51:07	2022-03-24 10:51:07	Italy NT	italy-nt-34	\N	f
1013	2022-03-24 10:51:07	2022-03-24 10:51:07	Italy NT	italy-nt-35	\N	f
1014	2022-03-24 10:51:07	2022-03-24 10:51:07	Spain NT	spain-nt-33	\N	f
1015	2022-03-24 10:51:07	2022-03-24 10:51:07	France NT	france-nt-40	\N	f
1016	2022-03-24 10:51:07	2022-03-24 10:51:07	Belgium NT	belgium-nt-21	\N	f
1017	2022-03-24 10:51:07	2022-03-24 10:51:07	Nederland NT	nederland-nt-16	\N	f
1018	2022-03-24 10:51:08	2022-03-24 10:51:08	Spain NT	spain-nt-34	\N	f
1019	2022-03-24 10:51:08	2022-03-24 10:51:08	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-20	\N	f
1020	2022-03-24 10:51:08	2022-03-24 10:51:08	Athena Bracciano	athena-bracciano-56	\N	f
1021	2022-03-24 10:51:08	2022-03-24 10:51:08	France NT	france-nt-41	\N	f
1022	2022-03-24 10:51:08	2022-03-24 10:51:08	CKS Szczecin	cks-szczecin-21	\N	f
1023	2022-03-24 10:51:08	2022-03-24 10:51:08	Slaskie WOPR	slaskie-wopr-26	\N	f
1024	2022-03-24 10:51:08	2022-03-24 10:51:08	Accademia Di Salvamento	accademia-di-salvamento-45	\N	f
1025	2022-03-24 10:51:08	2022-03-24 10:51:08	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-24	\N	f
1026	2022-03-24 10:51:08	2022-03-24 10:51:08	DLRG Niedersachsen	dlrg-niedersachsen-58	\N	f
1027	2022-03-24 10:51:08	2022-03-24 10:51:08	Athena Bracciano	athena-bracciano-57	\N	f
1028	2022-03-24 10:51:08	2022-03-24 10:51:08	DLRG Niedersachsen	dlrg-niedersachsen-59	\N	f
1029	2022-03-24 10:51:09	2022-03-24 10:51:09	Athena Salvamento	athena-salvamento-29	\N	f
1030	2022-03-24 10:51:09	2022-03-24 10:51:09	Athena Salvamento	athena-salvamento-30	\N	f
1031	2022-03-24 10:51:09	2022-03-24 10:51:09	DLRG Guetersloh	dlrg-guetersloh-20	\N	f
1032	2022-03-24 10:51:09	2022-03-24 10:51:09	Hungarian NT	hungarian-nt-2	\N	f
1033	2022-03-24 10:51:09	2022-03-24 10:51:09	Italy NT	italy-nt-36	\N	f
1034	2022-03-24 10:51:09	2022-03-24 10:51:09	Spain NT	spain-nt-35	\N	f
1035	2022-03-24 10:51:09	2022-03-24 10:51:09	Italy NT	italy-nt-37	\N	f
1036	2022-03-24 10:51:09	2022-03-24 10:51:09	Polen NT	polen-nt-7	\N	f
1037	2022-03-24 10:51:09	2022-03-24 10:51:09	Spain NT	spain-nt-36	\N	f
1038	2022-03-24 10:51:09	2022-03-24 10:51:09	France NT	france-nt-42	\N	f
1039	2022-03-24 10:51:09	2022-03-24 10:51:09	ASD Gorizia Nuoto	asd-gorizia-nuoto-13	\N	f
1040	2022-03-24 10:51:09	2022-03-24 10:51:09	SAFA 2000	safa-2000-13	\N	f
1041	2022-03-24 10:51:10	2022-03-24 10:51:10	A.S.D. Sportiva Sturla	asd-sportiva-sturla-11	\N	f
1042	2022-03-24 10:51:10	2022-03-24 10:51:10	Athena Bracciano	athena-bracciano-58	\N	f
1043	2022-03-24 10:51:10	2022-03-24 10:51:10	DLRG Luckenwalde	dlrg-luckenwalde-8	\N	f
1044	2022-03-24 10:51:10	2022-03-24 10:51:10	ASD Rosetana Nuoto	asd-rosetana-nuoto-11	\N	f
1045	2022-03-24 10:51:10	2022-03-24 10:51:10	CKS Szczecin	cks-szczecin-22	\N	f
1046	2022-03-24 10:51:10	2022-03-24 10:51:10	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-25	\N	f
1047	2022-03-24 10:51:10	2022-03-24 10:51:10	France NT	france-nt-43	\N	f
1048	2022-03-24 10:51:10	2022-03-24 10:51:10	Accademia Di Salvamento	accademia-di-salvamento-46	\N	f
1049	2022-03-24 10:51:10	2022-03-24 10:51:10	MKS Szczecin	mks-szczecin-6	\N	f
1050	2022-03-24 10:51:10	2022-03-24 10:51:10	DLRG Buchholz United	dlrg-buchholz-united-12	\N	f
1051	2022-03-24 10:51:10	2022-03-24 10:51:10	Athena Salvamento	athena-salvamento-31	\N	f
1052	2022-03-24 10:51:10	2022-03-24 10:51:10	Slaskie WOPR	slaskie-wopr-27	\N	f
1053	2022-03-24 10:51:10	2022-03-24 10:51:10	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-26	\N	f
1054	2022-03-24 10:51:11	2022-03-24 10:51:11	Athena Bracciano	athena-bracciano-59	\N	f
1055	2022-03-24 10:51:11	2022-03-24 10:51:11	Accademia Di Salvamento	accademia-di-salvamento-47	\N	f
1056	2022-03-24 10:51:11	2022-03-24 10:51:11	DLRG Niedersachsen	dlrg-niedersachsen-60	\N	f
1057	2022-03-24 10:51:11	2022-03-24 10:51:11	RB Waddinxveen	rb-waddinxveen-9	\N	f
1058	2022-03-24 10:51:11	2022-03-24 10:51:11	RB Delft	rb-delft-25	\N	f
1059	2022-03-24 10:51:11	2022-03-24 10:51:11	Belgium NT	belgium-nt-22	\N	f
1060	2022-03-24 10:51:11	2022-03-24 10:51:11	Spain NT	spain-nt-37	\N	f
1061	2022-03-24 10:51:11	2022-03-24 10:51:11	DLRG Niedersachsen	dlrg-niedersachsen-61	\N	f
1062	2022-03-24 10:51:11	2022-03-24 10:51:11	France NT	france-nt-44	\N	f
1063	2022-03-24 10:51:11	2022-03-24 10:51:11	DLRG Niedersachsen	dlrg-niedersachsen-62	\N	f
1064	2022-03-24 10:51:11	2022-03-24 10:51:11	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-21	\N	f
1065	2022-03-24 10:51:12	2022-03-24 10:51:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-27	\N	f
1066	2022-03-24 10:51:12	2022-03-24 10:51:12	RB Heytse	rb-heytse-19	\N	f
1067	2022-03-24 10:51:12	2022-03-24 10:51:12	CKS Szczecin	cks-szczecin-23	\N	f
1068	2022-03-24 10:51:12	2022-03-24 10:51:12	Athena Bracciano	athena-bracciano-60	\N	f
1069	2022-03-24 10:51:12	2022-03-24 10:51:12	Kusel KiXXX	kusel-kixxx-16	\N	f
1070	2022-03-24 10:51:12	2022-03-24 10:51:12	Athena Salvamento	athena-salvamento-32	\N	f
1071	2022-03-24 10:51:12	2022-03-24 10:51:12	Italy NT	italy-nt-38	\N	f
1072	2022-03-24 10:51:12	2022-03-24 10:51:12	Accademia Di Salvamento	accademia-di-salvamento-48	\N	f
1073	2022-03-24 10:51:12	2022-03-24 10:51:12	Accademia Di Salvamento	accademia-di-salvamento-49	\N	f
1074	2022-03-24 10:51:12	2022-03-24 10:51:12	Accademia Di Salvamento	accademia-di-salvamento-50	\N	f
1075	2022-03-24 10:51:12	2022-03-24 10:51:12	Athena Salvamento	athena-salvamento-33	\N	f
1076	2022-03-24 10:51:13	2022-03-24 10:51:13	Athena Bracciano	athena-bracciano-61	\N	f
1077	2022-03-24 10:51:13	2022-03-24 10:51:13	Italy NT	italy-nt-39	\N	f
1078	2022-03-24 10:51:13	2022-03-24 10:51:13	Spain NT	spain-nt-38	\N	f
1079	2022-03-24 10:51:13	2022-03-24 10:51:13	France NT	france-nt-45	\N	f
1080	2022-03-24 10:51:13	2022-03-24 10:51:13	Liege Sauvetage Club	liege-sauvetage-club-15	\N	f
1081	2022-03-24 10:51:13	2022-03-24 10:51:13	Nederland NT	nederland-nt-17	\N	f
1082	2022-03-24 10:51:13	2022-03-24 10:51:13	Slaskie WOPR	slaskie-wopr-28	\N	f
1083	2022-03-24 10:51:13	2022-03-24 10:51:13	Slaskie WOPR	slaskie-wopr-29	\N	f
1084	2022-03-24 10:51:13	2022-03-24 10:51:13	DLRG Guetersloh	dlrg-guetersloh-21	\N	f
1085	2022-03-24 10:51:13	2022-03-24 10:51:13	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-28	\N	f
1086	2022-03-24 10:51:13	2022-03-24 10:51:13	DLRG Guetersloh	dlrg-guetersloh-22	\N	f
1087	2022-03-24 10:51:13	2022-03-24 10:51:13	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-22	\N	f
1088	2022-03-24 10:51:13	2022-03-24 10:51:13	France NT	france-nt-46	\N	f
1089	2022-03-24 10:51:13	2022-03-24 10:51:13	Italy NT	italy-nt-40	\N	f
1090	2022-03-24 10:51:13	2022-03-24 10:51:13	SAFA 2000	safa-2000-14	\N	f
1091	2022-03-24 10:51:14	2022-03-24 10:51:14	DLRG Niedersachsen	dlrg-niedersachsen-63	\N	f
1092	2022-03-24 10:51:14	2022-03-24 10:51:14	DLRG Niedersachsen	dlrg-niedersachsen-64	\N	f
1093	2022-03-24 10:51:14	2022-03-24 10:51:14	CKS Szczecin	cks-szczecin-24	\N	f
1094	2022-03-24 10:51:14	2022-03-24 10:51:14	Accademia Di Salvamento	accademia-di-salvamento-51	\N	f
1095	2022-03-24 10:51:14	2022-03-24 10:51:14	Polen NT	polen-nt-8	\N	f
1096	2022-03-24 10:51:14	2022-03-24 10:51:14	ASD Rosetana Nuoto	asd-rosetana-nuoto-12	\N	f
1097	2022-03-24 10:51:14	2022-03-24 10:51:14	Athena Bracciano	athena-bracciano-62	\N	f
1098	2022-03-24 10:51:14	2022-03-24 10:51:14	MKS Szczecin	mks-szczecin-7	\N	f
1099	2022-03-24 10:51:14	2022-03-24 10:51:14	Athena Salvamento	athena-salvamento-34	\N	f
1100	2022-03-24 10:51:14	2022-03-24 10:51:14	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-29	\N	f
1101	2022-03-24 10:51:14	2022-03-24 10:51:14	Belgium NT	belgium-nt-23	\N	f
1102	2022-03-24 10:51:14	2022-03-24 10:51:14	RB Delft	rb-delft-26	\N	f
1103	2022-03-24 10:51:15	2022-03-24 10:51:15	DLRG Guetersloh	dlrg-guetersloh-23	\N	f
1104	2022-03-24 10:51:15	2022-03-24 10:51:15	DLRG Buchholz United	dlrg-buchholz-united-13	\N	f
1105	2022-03-24 10:51:15	2022-03-24 10:51:15	Athena Bracciano	athena-bracciano-63	\N	f
1106	2022-03-24 10:51:15	2022-03-24 10:51:15	Spain NT	spain-nt-39	\N	f
1107	2022-03-24 10:51:15	2022-03-24 10:51:15	Liege Sauvetage Club	liege-sauvetage-club-16	\N	f
1108	2022-03-24 10:51:15	2022-03-24 10:51:15	RB Waddinxveen	rb-waddinxveen-10	\N	f
1109	2022-03-24 10:51:15	2022-03-24 10:51:15	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-30	\N	f
1110	2022-03-24 10:51:15	2022-03-24 10:51:15	Beacon Lifesaving Club	beacon-lifesaving-club-4	\N	f
1111	2022-03-24 10:51:15	2022-03-24 10:51:15	RB Delft	rb-delft-27	\N	f
1112	2022-03-24 10:51:15	2022-03-24 10:51:15	RB Delft	rb-delft-28	\N	f
1113	2022-03-24 10:51:15	2022-03-24 10:51:15	RB Delft	rb-delft-29	\N	f
1114	2022-03-24 10:51:15	2022-03-24 10:51:15	Accademia Di Salvamento	accademia-di-salvamento-52	\N	f
1115	2022-03-24 10:51:15	2022-03-24 10:51:15	Accademia Di Salvamento	accademia-di-salvamento-53	\N	f
1116	2022-03-24 10:51:15	2022-03-24 10:51:15	Accademia Di Salvamento	accademia-di-salvamento-54	\N	f
1117	2022-03-24 10:51:16	2022-03-24 10:51:16	Accademia Di Salvamento	accademia-di-salvamento-55	\N	f
1118	2022-03-24 10:51:16	2022-03-24 10:51:16	ASD Gorizia Nuoto	asd-gorizia-nuoto-14	\N	f
1119	2022-03-24 10:51:16	2022-03-24 10:51:16	RB Waddinxveen	rb-waddinxveen-11	\N	f
1120	2022-03-24 10:51:16	2022-03-24 10:51:16	Spain NT	spain-nt-40	\N	f
1121	2022-03-24 10:51:16	2022-03-24 10:51:16	France NT	france-nt-47	\N	f
1122	2022-03-24 10:51:16	2022-03-24 10:51:16	Italy NT	italy-nt-41	\N	f
1123	2022-03-24 10:51:16	2022-03-24 10:51:16	Kusel KiXXX	kusel-kixxx-17	\N	f
1124	2022-03-24 10:51:16	2022-03-24 10:51:16	Slaskie WOPR	slaskie-wopr-30	\N	f
1125	2022-03-24 10:51:16	2022-03-24 10:51:16	Slaskie WOPR	slaskie-wopr-31	\N	f
1126	2022-03-24 10:51:16	2022-03-24 10:51:16	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-23	\N	f
1127	2022-03-24 10:51:16	2022-03-24 10:51:16	France NT	france-nt-48	\N	f
1128	2022-03-24 10:51:16	2022-03-24 10:51:16	Belgium NT	belgium-nt-24	\N	f
1129	2022-03-24 10:51:16	2022-03-24 10:51:16	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-7	\N	f
1130	2022-03-24 10:51:16	2022-03-24 10:51:16	SAFA 2000	safa-2000-15	\N	f
1131	2022-03-24 10:51:16	2022-03-24 10:51:16	In Sport Rane Rosse	in-sport-rane-rosse-31	\N	f
1132	2022-03-24 10:51:16	2022-03-24 10:51:16	Accademia Di Salvamento	accademia-di-salvamento-56	\N	f
1133	2022-03-24 10:51:16	2022-03-24 10:51:16	Accademia Di Salvamento	accademia-di-salvamento-57	\N	f
1134	2022-03-24 10:51:16	2022-03-24 10:51:16	France NT	france-nt-49	\N	f
1135	2022-03-24 10:51:16	2022-03-24 10:51:16	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-24	\N	f
1136	2022-03-24 10:51:16	2022-03-24 10:51:16	Liege Sauvetage Club	liege-sauvetage-club-17	\N	f
1137	2022-03-24 10:51:16	2022-03-24 10:51:16	Slaskie WOPR	slaskie-wopr-32	\N	f
1138	2022-03-24 10:51:16	2022-03-24 10:51:16	In Sport Rane Rosse	in-sport-rane-rosse-32	\N	f
1139	2022-03-24 10:51:17	2022-03-24 10:51:17	Athena Salvamento	athena-salvamento-35	\N	f
1140	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Niedersachsen	dlrg-niedersachsen-65	\N	f
1141	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Niedersachsen	dlrg-niedersachsen-66	\N	f
1142	2022-03-24 10:51:17	2022-03-24 10:51:17	Liege Sauvetage Club	liege-sauvetage-club-18	\N	f
1143	2022-03-24 10:51:17	2022-03-24 10:51:17	Rctal	rctal-15	\N	f
1144	2022-03-24 10:51:17	2022-03-24 10:51:17	Sint-Truidense RC	sint-truidense-rc-15	\N	f
1145	2022-03-24 10:51:17	2022-03-24 10:51:17	RB Heytse	rb-heytse-20	\N	f
1146	2022-03-24 10:51:17	2022-03-24 10:51:17	CKS Szczecin	cks-szczecin-25	\N	f
1147	2022-03-24 10:51:17	2022-03-24 10:51:17	Athena Salvamento	athena-salvamento-36	\N	f
1148	2022-03-24 10:51:17	2022-03-24 10:51:17	Sint-Truidense RC	sint-truidense-rc-16	\N	f
1149	2022-03-24 10:51:17	2022-03-24 10:51:17	Liege Sauvetage Club	liege-sauvetage-club-19	\N	f
1150	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Niedersachsen	dlrg-niedersachsen-67	\N	f
1151	2022-03-24 10:51:17	2022-03-24 10:51:17	RB Heytse	rb-heytse-21	\N	f
1152	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Guetersloh	dlrg-guetersloh-24	\N	f
1153	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-31	\N	f
1154	2022-03-24 10:51:17	2022-03-24 10:51:17	DLRG Niedersachsen	dlrg-niedersachsen-68	\N	f
1155	2022-03-24 10:51:17	2022-03-24 10:51:17	Slaskie WOPR	slaskie-wopr-33	\N	f
1156	2022-03-24 10:51:17	2022-03-24 10:51:17	RB Heytse	rb-heytse-22	\N	f
1157	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Niedersachsen	dlrg-niedersachsen-69	\N	f
1158	2022-03-24 10:51:18	2022-03-24 10:51:18	Italy NT	italy-nt-42	\N	f
1159	2022-03-24 10:51:18	2022-03-24 10:51:18	Italy NT	italy-nt-43	\N	f
1160	2022-03-24 10:51:18	2022-03-24 10:51:18	Belgium NT	belgium-nt-25	\N	f
1161	2022-03-24 10:51:18	2022-03-24 10:51:18	France NT	france-nt-50	\N	f
1162	2022-03-24 10:51:18	2022-03-24 10:51:18	Nederland NT	nederland-nt-18	\N	f
1163	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-25	\N	f
1164	2022-03-24 10:51:18	2022-03-24 10:51:18	Spain NT	spain-nt-41	\N	f
1165	2022-03-24 10:51:18	2022-03-24 10:51:18	Spain NT	spain-nt-42	\N	f
1166	2022-03-24 10:51:18	2022-03-24 10:51:18	France NT	france-nt-51	\N	f
1167	2022-03-24 10:51:18	2022-03-24 10:51:18	CKS Szczecin	cks-szczecin-26	\N	f
1168	2022-03-24 10:51:18	2022-03-24 10:51:18	Accademia Di Salvamento	accademia-di-salvamento-58	\N	f
1169	2022-03-24 10:51:18	2022-03-24 10:51:18	Accademia Di Salvamento	accademia-di-salvamento-59	\N	f
1170	2022-03-24 10:51:18	2022-03-24 10:51:18	Athena Bracciano	athena-bracciano-64	\N	f
1171	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Niedersachsen	dlrg-niedersachsen-70	\N	f
1172	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Luckenwalde	dlrg-luckenwalde-9	\N	f
1173	2022-03-24 10:51:18	2022-03-24 10:51:18	Nederland NT	nederland-nt-19	\N	f
1174	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Bad Oldesloe	dlrg-bad-oldesloe-4	\N	f
1175	2022-03-24 10:51:18	2022-03-24 10:51:18	DLRG Niedersachsen	dlrg-niedersachsen-71	\N	f
1265	2022-03-24 10:51:23	2022-03-24 10:51:23	RB Heytse	rb-heytse-26	\N	f
1176	2022-03-24 10:51:19	2022-03-24 10:51:19	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-11	\N	f
1177	2022-03-24 10:51:19	2022-03-24 10:51:19	Belgium NT	belgium-nt-26	\N	f
1178	2022-03-24 10:51:19	2022-03-24 10:51:19	Belgium NT	belgium-nt-27	\N	f
1179	2022-03-24 10:51:19	2022-03-24 10:51:19	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-12	\N	f
1180	2022-03-24 10:51:19	2022-03-24 10:51:19	DLRG Niedersachsen	dlrg-niedersachsen-72	\N	f
1181	2022-03-24 10:51:19	2022-03-24 10:51:19	Italy NT	italy-nt-44	\N	f
1182	2022-03-24 10:51:19	2022-03-24 10:51:19	Italy NT	italy-nt-45	\N	f
1183	2022-03-24 10:51:19	2022-03-24 10:51:19	ASD Gorizia Nuoto	asd-gorizia-nuoto-15	\N	f
1184	2022-03-24 10:51:19	2022-03-24 10:51:19	Spain NT	spain-nt-43	\N	f
1185	2022-03-24 10:51:19	2022-03-24 10:51:19	SAFA 2000	safa-2000-16	\N	f
1186	2022-03-24 10:51:19	2022-03-24 10:51:19	Polen NT	polen-nt-9	\N	f
1187	2022-03-24 10:51:19	2022-03-24 10:51:19	In Sport Rane Rosse	in-sport-rane-rosse-33	\N	f
1188	2022-03-24 10:51:19	2022-03-24 10:51:19	Beacon Lifesaving Club	beacon-lifesaving-club-5	\N	f
1189	2022-03-24 10:51:19	2022-03-24 10:51:19	France NT	france-nt-52	\N	f
1190	2022-03-24 10:51:19	2022-03-24 10:51:19	SAFA 2000	safa-2000-17	\N	f
1191	2022-03-24 10:51:19	2022-03-24 10:51:19	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-32	\N	f
1192	2022-03-24 10:51:19	2022-03-24 10:51:19	A.S.D. Sportiva Sturla	asd-sportiva-sturla-12	\N	f
1193	2022-03-24 10:51:19	2022-03-24 10:51:19	DLRG Lueneburg e.V.	dlrg-lueneburg-ev-1	\N	f
1194	2022-03-24 10:51:19	2022-03-24 10:51:19	Accademia Di Salvamento	accademia-di-salvamento-60	\N	f
1195	2022-03-24 10:51:19	2022-03-24 10:51:19	Belgium NT	belgium-nt-28	\N	f
1196	2022-03-24 10:51:19	2022-03-24 10:51:19	ASD Rosetana Nuoto	asd-rosetana-nuoto-13	\N	f
1197	2022-03-24 10:51:19	2022-03-24 10:51:19	RB Heytse	rb-heytse-23	\N	f
1198	2022-03-24 10:51:19	2022-03-24 10:51:19	RB Heytse	rb-heytse-24	\N	f
1199	2022-03-24 10:51:19	2022-03-24 10:51:19	DLRG Luckenwalde	dlrg-luckenwalde-10	\N	f
1200	2022-03-24 10:51:19	2022-03-24 10:51:19	ASD Rosetana Nuoto	asd-rosetana-nuoto-14	\N	f
1201	2022-03-24 10:51:19	2022-03-24 10:51:19	Rctal	rctal-16	\N	f
1202	2022-03-24 10:51:20	2022-03-24 10:51:20	DLRG Niedersachsen	dlrg-niedersachsen-73	\N	f
1203	2022-03-24 10:51:20	2022-03-24 10:51:20	DLRG Niedersachsen	dlrg-niedersachsen-74	\N	f
1204	2022-03-24 10:51:20	2022-03-24 10:51:20	RB Waddinxveen	rb-waddinxveen-12	\N	f
1205	2022-03-24 10:51:20	2022-03-24 10:51:20	Accademia Di Salvamento	accademia-di-salvamento-61	\N	f
1206	2022-03-24 10:51:20	2022-03-24 10:51:20	RB Delft	rb-delft-30	\N	f
1207	2022-03-24 10:51:20	2022-03-24 10:51:20	RB Delft	rb-delft-31	\N	f
1208	2022-03-24 10:51:20	2022-03-24 10:51:20	RB Delft	rb-delft-32	\N	f
1209	2022-03-24 10:51:20	2022-03-24 10:51:20	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-2	\N	f
1210	2022-03-24 10:51:20	2022-03-24 10:51:20	Italy NT	italy-nt-46	\N	f
1211	2022-03-24 10:51:20	2022-03-24 10:51:20	Spain NT	spain-nt-44	\N	f
1212	2022-03-24 10:51:20	2022-03-24 10:51:20	Spain NT	spain-nt-45	\N	f
1213	2022-03-24 10:51:20	2022-03-24 10:51:20	In Sport Rane Rosse	in-sport-rane-rosse-34	\N	f
1214	2022-03-24 10:51:20	2022-03-24 10:51:20	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-26	\N	f
1215	2022-03-24 10:51:20	2022-03-24 10:51:20	Athena Bracciano	athena-bracciano-65	\N	f
1216	2022-03-24 10:51:20	2022-03-24 10:51:20	Spain NT	spain-nt-46	\N	f
1217	2022-03-24 10:51:20	2022-03-24 10:51:20	Accademia Di Salvamento	accademia-di-salvamento-62	\N	f
1218	2022-03-24 10:51:20	2022-03-24 10:51:20	Athena Bracciano	athena-bracciano-66	\N	f
1219	2022-03-24 10:51:21	2022-03-24 10:51:21	Accademia Di Salvamento	accademia-di-salvamento-63	\N	f
1220	2022-03-24 10:51:21	2022-03-24 10:51:21	Belgium NT	belgium-nt-29	\N	f
1221	2022-03-24 10:51:21	2022-03-24 10:51:21	France NT	france-nt-53	\N	f
1222	2022-03-24 10:51:21	2022-03-24 10:51:21	Slaskie WOPR	slaskie-wopr-34	\N	f
1223	2022-03-24 10:51:21	2022-03-24 10:51:21	Athena Bracciano	athena-bracciano-67	\N	f
1224	2022-03-24 10:51:21	2022-03-24 10:51:21	Athena Salvamento	athena-salvamento-37	\N	f
1225	2022-03-24 10:51:21	2022-03-24 10:51:21	Liege Sauvetage Club	liege-sauvetage-club-20	\N	f
1226	2022-03-24 10:51:21	2022-03-24 10:51:21	Athena Salvamento	athena-salvamento-38	\N	f
1227	2022-03-24 10:51:21	2022-03-24 10:51:21	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-27	\N	f
1228	2022-03-24 10:51:21	2022-03-24 10:51:21	In Sport Rane Rosse	in-sport-rane-rosse-35	\N	f
1229	2022-03-24 10:51:21	2022-03-24 10:51:21	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-8	\N	f
1230	2022-03-24 10:51:21	2022-03-24 10:51:21	Liege Sauvetage Club	liege-sauvetage-club-21	\N	f
1231	2022-03-24 10:51:21	2022-03-24 10:51:21	Athena Salvamento	athena-salvamento-39	\N	f
1232	2022-03-24 10:51:21	2022-03-24 10:51:21	In Sport Rane Rosse	in-sport-rane-rosse-36	\N	f
1233	2022-03-24 10:51:21	2022-03-24 10:51:21	Sint-Truidense RC	sint-truidense-rc-17	\N	f
1234	2022-03-24 10:51:21	2022-03-24 10:51:21	DLRG Niedersachsen	dlrg-niedersachsen-75	\N	f
1235	2022-03-24 10:51:21	2022-03-24 10:51:21	CKS Szczecin	cks-szczecin-27	\N	f
1236	2022-03-24 10:51:21	2022-03-24 10:51:21	Nederland NT	nederland-nt-20	\N	f
1237	2022-03-24 10:51:21	2022-03-24 10:51:21	France NT	france-nt-54	\N	f
1238	2022-03-24 10:51:21	2022-03-24 10:51:21	DLRG Guetersloh	dlrg-guetersloh-25	\N	f
1239	2022-03-24 10:51:21	2022-03-24 10:51:21	Rctal	rctal-17	\N	f
1240	2022-03-24 10:51:21	2022-03-24 10:51:21	DLRG Niedersachsen	dlrg-niedersachsen-76	\N	f
1241	2022-03-24 10:51:22	2022-03-24 10:51:22	Slaskie WOPR	slaskie-wopr-35	\N	f
1242	2022-03-24 10:51:22	2022-03-24 10:51:22	SAFA 2000	safa-2000-18	\N	f
1243	2022-03-24 10:51:22	2022-03-24 10:51:22	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-33	\N	f
1244	2022-03-24 10:51:22	2022-03-24 10:51:22	Rctal	rctal-18	\N	f
1245	2022-03-24 10:51:22	2022-03-24 10:51:22	CKS Szczecin	cks-szczecin-28	\N	f
1246	2022-03-24 10:51:22	2022-03-24 10:51:22	Accademia Di Salvamento	accademia-di-salvamento-64	\N	f
1247	2022-03-24 10:51:22	2022-03-24 10:51:22	In Sport Rane Rosse	in-sport-rane-rosse-37	\N	f
1248	2022-03-24 10:51:22	2022-03-24 10:51:22	DLRG Niedersachsen	dlrg-niedersachsen-77	\N	f
1249	2022-03-24 10:51:22	2022-03-24 10:51:22	Kusel KiXXX	kusel-kixxx-18	\N	f
1250	2022-03-24 10:51:22	2022-03-24 10:51:22	Athena Salvamento	athena-salvamento-40	\N	f
1251	2022-03-24 10:51:22	2022-03-24 10:51:22	RB Delft	rb-delft-33	\N	f
1252	2022-03-24 10:51:22	2022-03-24 10:51:22	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-4	\N	f
1253	2022-03-24 10:51:22	2022-03-24 10:51:22	DLRG Niedersachsen	dlrg-niedersachsen-78	\N	f
1254	2022-03-24 10:51:22	2022-03-24 10:51:22	Liege Sauvetage Club	liege-sauvetage-club-22	\N	f
1255	2022-03-24 10:51:22	2022-03-24 10:51:22	DLRG Niedersachsen	dlrg-niedersachsen-79	\N	f
1256	2022-03-24 10:51:22	2022-03-24 10:51:22	Rctal	rctal-19	\N	f
1257	2022-03-24 10:51:22	2022-03-24 10:51:22	Accademia Di Salvamento	accademia-di-salvamento-65	\N	f
1258	2022-03-24 10:51:23	2022-03-24 10:51:23	Athena Bracciano	athena-bracciano-68	\N	f
1259	2022-03-24 10:51:23	2022-03-24 10:51:23	Slaskie WOPR	slaskie-wopr-36	\N	f
1260	2022-03-24 10:51:23	2022-03-24 10:51:23	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-28	\N	f
1261	2022-03-24 10:51:23	2022-03-24 10:51:23	Athena Salvamento	athena-salvamento-41	\N	f
1262	2022-03-24 10:51:23	2022-03-24 10:51:23	RB Heytse	rb-heytse-25	\N	f
1263	2022-03-24 10:51:23	2022-03-24 10:51:23	Slaskie WOPR	slaskie-wopr-37	\N	f
1264	2022-03-24 10:51:23	2022-03-24 10:51:23	Slaskie WOPR	slaskie-wopr-38	\N	f
1266	2022-03-24 10:51:23	2022-03-24 10:51:23	Athena Salvamento	athena-salvamento-42	\N	f
1267	2022-03-24 10:51:23	2022-03-24 10:51:23	RB Heytse	rb-heytse-27	\N	f
1268	2022-03-24 10:51:23	2022-03-24 10:51:23	In Sport Rane Rosse	in-sport-rane-rosse-38	\N	f
1269	2022-03-24 10:51:23	2022-03-24 10:51:23	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-34	\N	f
1270	2022-03-24 10:51:23	2022-03-24 10:51:23	In Sport Rane Rosse	in-sport-rane-rosse-39	\N	f
1271	2022-03-24 10:51:23	2022-03-24 10:51:23	In Sport Rane Rosse	in-sport-rane-rosse-40	\N	f
1272	2022-03-24 10:51:23	2022-03-24 10:51:23	ASD Rosetana Nuoto	asd-rosetana-nuoto-15	\N	f
1273	2022-03-24 10:51:23	2022-03-24 10:51:23	DLRG Guetersloh	dlrg-guetersloh-26	\N	f
1274	2022-03-24 10:51:23	2022-03-24 10:51:23	DLRG Guetersloh	dlrg-guetersloh-27	\N	f
1275	2022-03-24 10:51:23	2022-03-24 10:51:23	France NT	france-nt-55	\N	f
1276	2022-03-24 10:51:24	2022-03-24 10:51:24	Athena Bracciano	athena-bracciano-69	\N	f
1277	2022-03-24 10:51:24	2022-03-24 10:51:24	Sint-Truidense RC	sint-truidense-rc-18	\N	f
1278	2022-03-24 10:51:24	2022-03-24 10:51:24	Italy NT	italy-nt-47	\N	f
1279	2022-03-24 10:51:24	2022-03-24 10:51:24	Belgium NT	belgium-nt-30	\N	f
1280	2022-03-24 10:51:24	2022-03-24 10:51:24	Italy NT	italy-nt-48	\N	f
1281	2022-03-24 10:51:24	2022-03-24 10:51:24	France NT	france-nt-56	\N	f
1282	2022-03-24 10:51:24	2022-03-24 10:51:24	Belgium NT	belgium-nt-31	\N	f
1283	2022-03-24 10:51:24	2022-03-24 10:51:24	Nederland NT	nederland-nt-21	\N	f
1284	2022-03-24 10:51:24	2022-03-24 10:51:24	Spain NT	spain-nt-47	\N	f
1285	2022-03-24 10:51:24	2022-03-24 10:51:24	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-2	\N	f
1286	2022-03-24 10:51:24	2022-03-24 10:51:24	France NT	france-nt-57	\N	f
1287	2022-03-24 10:51:24	2022-03-24 10:51:24	In Sport Rane Rosse	in-sport-rane-rosse-41	\N	f
1288	2022-03-24 10:51:24	2022-03-24 10:51:24	In Sport Rane Rosse	in-sport-rane-rosse-42	\N	f
1289	2022-03-24 10:51:24	2022-03-24 10:51:24	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-35	\N	f
1290	2022-03-24 10:51:24	2022-03-24 10:51:24	Nederland NT	nederland-nt-22	\N	f
1291	2022-03-24 10:51:24	2022-03-24 10:51:24	Slaskie WOPR	slaskie-wopr-39	\N	f
1292	2022-03-24 10:51:24	2022-03-24 10:51:24	CKS Szczecin	cks-szczecin-29	\N	f
1293	2022-03-24 10:51:24	2022-03-24 10:51:24	Italy NT	italy-nt-49	\N	f
1294	2022-03-24 10:51:24	2022-03-24 10:51:24	Italy NT	italy-nt-50	\N	f
1295	2022-03-24 10:51:24	2022-03-24 10:51:24	Nederland NT	nederland-nt-23	\N	f
1296	2022-03-24 10:51:25	2022-03-24 10:51:25	Athena Bracciano	athena-bracciano-70	\N	f
1297	2022-03-24 10:51:25	2022-03-24 10:51:25	Accademia Di Salvamento	accademia-di-salvamento-66	\N	f
1298	2022-03-24 10:51:25	2022-03-24 10:51:25	Accademia Di Salvamento	accademia-di-salvamento-67	\N	f
1299	2022-03-24 10:51:25	2022-03-24 10:51:25	Kusel KiXXX	kusel-kixxx-19	\N	f
1300	2022-03-24 10:51:25	2022-03-24 10:51:25	Accademia Di Salvamento	accademia-di-salvamento-68	\N	f
1301	2022-03-24 10:51:25	2022-03-24 10:51:25	Athena Bracciano	athena-bracciano-71	\N	f
1302	2022-03-24 10:51:25	2022-03-24 10:51:25	DLRG Niedersachsen	dlrg-niedersachsen-80	\N	f
1303	2022-03-24 10:51:25	2022-03-24 10:51:25	ASD Gorizia Nuoto	asd-gorizia-nuoto-16	\N	f
1304	2022-03-24 10:51:25	2022-03-24 10:51:25	Athena Bracciano	athena-bracciano-72	\N	f
1305	2022-03-24 10:51:25	2022-03-24 10:51:25	Athena Bracciano	athena-bracciano-73	\N	f
1306	2022-03-24 10:51:25	2022-03-24 10:51:25	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-29	\N	f
1307	2022-03-24 10:51:25	2022-03-24 10:51:25	France NT	france-nt-58	\N	f
1308	2022-03-24 10:51:25	2022-03-24 10:51:25	A.S.D. Sportiva Sturla	asd-sportiva-sturla-13	\N	f
1309	2022-03-24 10:51:25	2022-03-24 10:51:25	DLRG Niedersachsen	dlrg-niedersachsen-81	\N	f
1310	2022-03-24 10:51:26	2022-03-24 10:51:26	France NT	france-nt-59	\N	f
1311	2022-03-24 10:51:26	2022-03-24 10:51:26	A.S.D. Sportiva Sturla	asd-sportiva-sturla-14	\N	f
1312	2022-03-24 10:51:26	2022-03-24 10:51:26	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-3	\N	f
1313	2022-03-24 10:51:26	2022-03-24 10:51:26	DLRG Niedersachsen	dlrg-niedersachsen-82	\N	f
1314	2022-03-24 10:51:26	2022-03-24 10:51:26	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-36	\N	f
1315	2022-03-24 10:51:26	2022-03-24 10:51:26	Spain NT	spain-nt-48	\N	f
1316	2022-03-24 10:51:26	2022-03-24 10:51:26	France NT	france-nt-60	\N	f
1317	2022-03-24 10:51:26	2022-03-24 10:51:26	Polen NT	polen-nt-10	\N	f
1318	2022-03-24 10:51:26	2022-03-24 10:51:26	Accademia Di Salvamento	accademia-di-salvamento-69	\N	f
1319	2022-03-24 10:51:26	2022-03-24 10:51:26	CKS Szczecin	cks-szczecin-30	\N	f
1320	2022-03-24 10:51:26	2022-03-24 10:51:26	CKS Szczecin	cks-szczecin-31	\N	f
1321	2022-03-24 10:51:26	2022-03-24 10:51:26	Spain NT	spain-nt-49	\N	f
1322	2022-03-24 10:51:26	2022-03-24 10:51:26	Liege Sauvetage Club	liege-sauvetage-club-23	\N	f
1323	2022-03-24 10:51:26	2022-03-24 10:51:26	CKS Szczecin	cks-szczecin-32	\N	f
1324	2022-03-24 10:51:26	2022-03-24 10:51:26	Accademia Di Salvamento	accademia-di-salvamento-70	\N	f
1325	2022-03-24 10:51:27	2022-03-24 10:51:27	DLRG Guetersloh	dlrg-guetersloh-28	\N	f
1326	2022-03-24 10:51:27	2022-03-24 10:51:27	In Sport Rane Rosse	in-sport-rane-rosse-43	\N	f
1327	2022-03-24 10:51:27	2022-03-24 10:51:27	Polen NT	polen-nt-11	\N	f
1328	2022-03-24 10:51:27	2022-03-24 10:51:27	MKS Szczecin	mks-szczecin-8	\N	f
1329	2022-03-24 10:51:27	2022-03-24 10:51:27	Athena Bracciano	athena-bracciano-74	\N	f
1330	2022-03-24 10:51:27	2022-03-24 10:51:27	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-2	\N	f
1331	2022-03-24 10:51:27	2022-03-24 10:51:27	Accademia Di Salvamento	accademia-di-salvamento-71	\N	f
1332	2022-03-24 10:51:27	2022-03-24 10:51:27	ASD Rosetana Nuoto	asd-rosetana-nuoto-16	\N	f
1333	2022-03-24 10:51:27	2022-03-24 10:51:27	A.S.D. Sportiva Sturla	asd-sportiva-sturla-15	\N	f
1334	2022-03-24 10:51:27	2022-03-24 10:51:27	Sint-Truidense RC	sint-truidense-rc-19	\N	f
1335	2022-03-24 10:51:27	2022-03-24 10:51:27	France NT	france-nt-61	\N	f
1336	2022-03-24 10:51:27	2022-03-24 10:51:27	Accademia Di Salvamento	accademia-di-salvamento-72	\N	f
1337	2022-03-24 10:51:27	2022-03-24 10:51:27	MKS Szczecin	mks-szczecin-9	\N	f
1338	2022-03-24 10:51:27	2022-03-24 10:51:27	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-30	\N	f
1339	2022-03-24 10:51:27	2022-03-24 10:51:27	DLRG Niedersachsen	dlrg-niedersachsen-83	\N	f
1340	2022-03-24 10:51:27	2022-03-24 10:51:27	Liege Sauvetage Club	liege-sauvetage-club-24	\N	f
1341	2022-03-24 10:51:27	2022-03-24 10:51:27	Athena Bracciano	athena-bracciano-75	\N	f
1342	2022-03-24 10:51:27	2022-03-24 10:51:27	Sint-Truidense RC	sint-truidense-rc-20	\N	f
1343	2022-03-24 10:51:27	2022-03-24 10:51:27	France NT	france-nt-62	\N	f
1344	2022-03-24 10:51:27	2022-03-24 10:51:27	Kusel KiXXX	kusel-kixxx-20	\N	f
1345	2022-03-24 10:51:27	2022-03-24 10:51:27	RB Waddinxveen	rb-waddinxveen-13	\N	f
1346	2022-03-24 10:51:27	2022-03-24 10:51:27	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-37	\N	f
1347	2022-03-24 10:51:27	2022-03-24 10:51:27	DLRG Buchholz United	dlrg-buchholz-united-14	\N	f
1348	2022-03-24 10:51:28	2022-03-24 10:51:28	Accademia Di Salvamento	accademia-di-salvamento-73	\N	f
1349	2022-03-24 10:51:28	2022-03-24 10:51:28	ASD Rosetana Nuoto	asd-rosetana-nuoto-17	\N	f
1350	2022-03-24 10:51:28	2022-03-24 10:51:28	DLRG Buchholz United	dlrg-buchholz-united-15	\N	f
1351	2022-03-24 10:51:28	2022-03-24 10:51:28	In Sport Rane Rosse	in-sport-rane-rosse-44	\N	f
1352	2022-03-24 10:51:28	2022-03-24 10:51:28	Italy NT	italy-nt-51	\N	f
1353	2022-03-24 10:51:28	2022-03-24 10:51:28	Polen NT	polen-nt-12	\N	f
1354	2022-03-24 10:51:28	2022-03-24 10:51:28	DLRG Buchholz United	dlrg-buchholz-united-16	\N	f
1355	2022-03-24 10:51:28	2022-03-24 10:51:28	RB Delft	rb-delft-34	\N	f
1356	2022-03-24 10:51:28	2022-03-24 10:51:28	Athena Bracciano	athena-bracciano-76	\N	f
1357	2022-03-24 10:51:28	2022-03-24 10:51:28	RB Delft	rb-delft-35	\N	f
1358	2022-03-24 10:51:28	2022-03-24 10:51:28	RB Delft	rb-delft-36	\N	f
1359	2022-03-24 10:51:28	2022-03-24 10:51:28	Liege Sauvetage Club	liege-sauvetage-club-25	\N	f
1360	2022-03-24 10:51:28	2022-03-24 10:51:28	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-3	\N	f
1361	2022-03-24 10:51:28	2022-03-24 10:51:28	Belgium NT	belgium-nt-32	\N	f
1362	2022-03-24 10:51:28	2022-03-24 10:51:28	Spain NT	spain-nt-50	\N	f
1363	2022-03-24 10:51:28	2022-03-24 10:51:28	Italy NT	italy-nt-52	\N	f
1364	2022-03-24 10:51:29	2022-03-24 10:51:29	France NT	france-nt-63	\N	f
1365	2022-03-24 10:51:29	2022-03-24 10:51:29	Italy NT	italy-nt-53	\N	f
1366	2022-03-24 10:51:29	2022-03-24 10:51:29	Spain NT	spain-nt-51	\N	f
1367	2022-03-24 10:51:29	2022-03-24 10:51:29	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-13	\N	f
1368	2022-03-24 10:51:29	2022-03-24 10:51:29	Nederland NT	nederland-nt-24	\N	f
1369	2022-03-24 10:51:29	2022-03-24 10:51:29	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-31	\N	f
1370	2022-03-24 10:51:29	2022-03-24 10:51:29	Accademia Di Salvamento	accademia-di-salvamento-74	\N	f
1371	2022-03-24 10:51:29	2022-03-24 10:51:29	Slaskie WOPR	slaskie-wopr-40	\N	f
1372	2022-03-24 10:51:29	2022-03-24 10:51:29	France NT	france-nt-64	\N	f
1373	2022-03-24 10:51:29	2022-03-24 10:51:29	CKS Szczecin	cks-szczecin-33	\N	f
1374	2022-03-24 10:51:29	2022-03-24 10:51:29	DLRG Niedersachsen	dlrg-niedersachsen-84	\N	f
1375	2022-03-24 10:51:29	2022-03-24 10:51:29	Athena Bracciano	athena-bracciano-77	\N	f
1376	2022-03-24 10:51:30	2022-03-24 10:51:30	DLRG Niedersachsen	dlrg-niedersachsen-85	\N	f
1377	2022-03-24 10:51:30	2022-03-24 10:51:30	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-38	\N	f
1378	2022-03-24 10:51:30	2022-03-24 10:51:30	Athena Bracciano	athena-bracciano-78	\N	f
1379	2022-03-24 10:51:30	2022-03-24 10:51:30	Athena Salvamento	athena-salvamento-43	\N	f
1380	2022-03-24 10:51:30	2022-03-24 10:51:30	Athena Salvamento	athena-salvamento-44	\N	f
1381	2022-03-24 10:51:30	2022-03-24 10:51:30	DLRG Guetersloh	dlrg-guetersloh-29	\N	f
1382	2022-03-24 10:51:30	2022-03-24 10:51:30	Spain NT	spain-nt-52	\N	f
1383	2022-03-24 10:51:30	2022-03-24 10:51:30	Polen NT	polen-nt-13	\N	f
1384	2022-03-24 10:51:30	2022-03-24 10:51:30	Italy NT	italy-nt-54	\N	f
1385	2022-03-24 10:51:30	2022-03-24 10:51:30	Italy NT	italy-nt-55	\N	f
1386	2022-03-24 10:51:30	2022-03-24 10:51:30	Spain NT	spain-nt-53	\N	f
1387	2022-03-24 10:51:31	2022-03-24 10:51:31	SAFA 2000	safa-2000-19	\N	f
1388	2022-03-24 10:51:55	2022-03-24 10:51:55	Italy NT	italy-nt-56	\N	f
1389	2022-03-24 10:51:55	2022-03-24 10:51:55	SAFA 2000	safa-2000-20	\N	f
1390	2022-03-24 10:51:55	2022-03-24 10:51:55	Accademia Di Salvamento	accademia-di-salvamento-75	\N	f
1391	2022-03-24 10:51:55	2022-03-24 10:51:55	Spain NT	spain-nt-54	\N	f
1392	2022-03-24 10:51:55	2022-03-24 10:51:55	France NT	france-nt-65	\N	f
1393	2022-03-24 10:51:55	2022-03-24 10:51:55	Accademia Di Salvamento	accademia-di-salvamento-76	\N	f
1394	2022-03-24 10:51:55	2022-03-24 10:51:55	Belgium NT	belgium-nt-33	\N	f
1395	2022-03-24 10:51:56	2022-03-24 10:51:56	Kusel KiXXX	kusel-kixxx-21	\N	f
1396	2022-03-24 10:51:56	2022-03-24 10:51:56	In Sport Rane Rosse	in-sport-rane-rosse-45	\N	f
1397	2022-03-24 10:51:56	2022-03-24 10:51:56	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-32	\N	f
1398	2022-03-24 10:51:56	2022-03-24 10:51:56	Athena Bracciano	athena-bracciano-79	\N	f
1399	2022-03-24 10:51:56	2022-03-24 10:51:56	Slaskie WOPR	slaskie-wopr-41	\N	f
1400	2022-03-24 10:51:56	2022-03-24 10:51:56	Slaskie WOPR	slaskie-wopr-42	\N	f
1401	2022-03-24 10:51:56	2022-03-24 10:51:56	DLRG Niedersachsen	dlrg-niedersachsen-86	\N	f
1402	2022-03-24 10:51:56	2022-03-24 10:51:56	France NT	france-nt-66	\N	f
1403	2022-03-24 10:51:56	2022-03-24 10:51:56	Athena Bracciano	athena-bracciano-80	\N	f
1404	2022-03-24 10:51:56	2022-03-24 10:51:56	Athena Salvamento	athena-salvamento-45	\N	f
1405	2022-03-24 10:51:56	2022-03-24 10:51:56	In Sport Rane Rosse	in-sport-rane-rosse-46	\N	f
1406	2022-03-24 10:51:56	2022-03-24 10:51:56	Sint-Truidense RC	sint-truidense-rc-21	\N	f
1407	2022-03-24 10:51:56	2022-03-24 10:51:56	ASD Rosetana Nuoto	asd-rosetana-nuoto-18	\N	f
1408	2022-03-24 10:51:56	2022-03-24 10:51:56	DLRG Niedersachsen	dlrg-niedersachsen-87	\N	f
1409	2022-03-24 10:51:56	2022-03-24 10:51:56	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-5	\N	f
1410	2022-03-24 10:51:56	2022-03-24 10:51:56	Rctal	rctal-20	\N	f
1411	2022-03-24 10:51:57	2022-03-24 10:51:57	DLRG Niedersachsen	dlrg-niedersachsen-88	\N	f
1412	2022-03-24 10:51:57	2022-03-24 10:51:57	Athena Bracciano	athena-bracciano-81	\N	f
1413	2022-03-24 10:51:57	2022-03-24 10:51:57	Sint-Truidense RC	sint-truidense-rc-22	\N	f
1414	2022-03-24 10:51:57	2022-03-24 10:51:57	DLRG Niedersachsen	dlrg-niedersachsen-89	\N	f
1415	2022-03-24 10:51:57	2022-03-24 10:51:57	Athena Salvamento	athena-salvamento-46	\N	f
1416	2022-03-24 10:51:57	2022-03-24 10:51:57	Accademia Di Salvamento	accademia-di-salvamento-77	\N	f
1417	2022-03-24 10:51:57	2022-03-24 10:51:57	Athena Salvamento	athena-salvamento-47	\N	f
1418	2022-03-24 10:51:57	2022-03-24 10:51:57	Nederland NT	nederland-nt-25	\N	f
1419	2022-03-24 10:51:57	2022-03-24 10:51:57	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-39	\N	f
1420	2022-03-24 10:51:57	2022-03-24 10:51:57	Rctal	rctal-21	\N	f
1421	2022-03-24 10:51:57	2022-03-24 10:51:57	DLRG Guetersloh	dlrg-guetersloh-30	\N	f
1422	2022-03-24 10:51:57	2022-03-24 10:51:57	DLRG Guetersloh	dlrg-guetersloh-31	\N	f
1423	2022-03-24 10:51:57	2022-03-24 10:51:57	Athena Bracciano	athena-bracciano-82	\N	f
1424	2022-03-24 10:51:57	2022-03-24 10:51:57	RB Delft	rb-delft-37	\N	f
1425	2022-03-24 10:51:58	2022-03-24 10:51:58	DLRG Guetersloh	dlrg-guetersloh-32	\N	f
1426	2022-03-24 10:51:58	2022-03-24 10:51:58	Italy NT	italy-nt-57	\N	f
1427	2022-03-24 10:51:58	2022-03-24 10:51:58	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-14	\N	f
1428	2022-03-24 10:51:58	2022-03-24 10:51:58	Italy NT	italy-nt-58	\N	f
1429	2022-03-24 10:51:58	2022-03-24 10:51:58	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-15	\N	f
1430	2022-03-24 10:51:58	2022-03-24 10:51:58	DLRG Bad Oldesloe	dlrg-bad-oldesloe-5	\N	f
1431	2022-03-24 10:51:58	2022-03-24 10:51:58	ASD Gorizia Nuoto	asd-gorizia-nuoto-17	\N	f
1432	2022-03-24 10:51:58	2022-03-24 10:51:58	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-16	\N	f
1433	2022-03-24 10:51:58	2022-03-24 10:51:58	France NT	france-nt-67	\N	f
1434	2022-03-24 10:51:58	2022-03-24 10:51:58	Spain NT	spain-nt-55	\N	f
1435	2022-03-24 10:51:58	2022-03-24 10:51:58	France NT	france-nt-68	\N	f
1436	2022-03-24 10:51:58	2022-03-24 10:51:58	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-33	\N	f
1437	2022-03-24 10:51:58	2022-03-24 10:51:58	Belgium NT	belgium-nt-34	\N	f
1438	2022-03-24 10:51:58	2022-03-24 10:51:58	Athena Bracciano	athena-bracciano-83	\N	f
1439	2022-03-24 10:51:58	2022-03-24 10:51:58	Nederland NT	nederland-nt-26	\N	f
1440	2022-03-24 10:51:59	2022-03-24 10:51:59	Kusel KiXXX	kusel-kixxx-22	\N	f
1441	2022-03-24 10:51:59	2022-03-24 10:51:59	Athena Bracciano	athena-bracciano-84	\N	f
1442	2022-03-24 10:51:59	2022-03-24 10:51:59	Athena Bracciano	athena-bracciano-85	\N	f
1443	2022-03-24 10:51:59	2022-03-24 10:51:59	DLRG Niedersachsen	dlrg-niedersachsen-90	\N	f
1444	2022-03-24 10:51:59	2022-03-24 10:51:59	DLRG Luckenwalde	dlrg-luckenwalde-11	\N	f
1445	2022-03-24 10:51:59	2022-03-24 10:51:59	DLRG Niedersachsen	dlrg-niedersachsen-91	\N	f
1446	2022-03-24 10:51:59	2022-03-24 10:51:59	A.S.D. Sportiva Sturla	asd-sportiva-sturla-16	\N	f
1447	2022-03-24 10:51:59	2022-03-24 10:51:59	Spain NT	spain-nt-56	\N	f
1448	2022-03-24 10:51:59	2022-03-24 10:51:59	SAFA 2000	safa-2000-21	\N	f
1449	2022-03-24 10:51:59	2022-03-24 10:51:59	CKS Szczecin	cks-szczecin-34	\N	f
1450	2022-03-24 10:51:59	2022-03-24 10:51:59	ASD Gorizia Nuoto	asd-gorizia-nuoto-18	\N	f
1451	2022-03-24 10:51:59	2022-03-24 10:51:59	CKS Szczecin	cks-szczecin-35	\N	f
1452	2022-03-24 10:52:00	2022-03-24 10:52:00	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-9	\N	f
1453	2022-03-24 10:52:00	2022-03-24 10:52:00	ASD Gorizia Nuoto	asd-gorizia-nuoto-19	\N	f
1454	2022-03-24 10:52:00	2022-03-24 10:52:00	In Sport Rane Rosse	in-sport-rane-rosse-47	\N	f
1455	2022-03-24 10:52:00	2022-03-24 10:52:00	In Sport Rane Rosse	in-sport-rane-rosse-48	\N	f
1456	2022-03-24 10:52:00	2022-03-24 10:52:00	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-10	\N	f
1457	2022-03-24 10:52:00	2022-03-24 10:52:00	Slaskie WOPR	slaskie-wopr-43	\N	f
1458	2022-03-24 10:52:00	2022-03-24 10:52:00	RB Heytse	rb-heytse-28	\N	f
1459	2022-03-24 10:52:00	2022-03-24 10:52:00	Belgium NT	belgium-nt-35	\N	f
1460	2022-03-24 10:52:00	2022-03-24 10:52:00	RB Heytse	rb-heytse-29	\N	f
1461	2022-03-24 10:52:00	2022-03-24 10:52:00	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-40	\N	f
1462	2022-03-24 10:52:00	2022-03-24 10:52:00	Athena Bracciano	athena-bracciano-86	\N	f
1463	2022-03-24 10:52:00	2022-03-24 10:52:00	Athena Salvamento	athena-salvamento-48	\N	f
1464	2022-03-24 10:52:00	2022-03-24 10:52:00	DLRG Luckenwalde	dlrg-luckenwalde-12	\N	f
1465	2022-03-24 10:52:00	2022-03-24 10:52:00	Athena Bracciano	athena-bracciano-87	\N	f
1466	2022-03-24 10:52:01	2022-03-24 10:52:01	DLRG Niedersachsen	dlrg-niedersachsen-92	\N	f
1467	2022-03-24 10:52:01	2022-03-24 10:52:01	DLRG Buchholz United	dlrg-buchholz-united-17	\N	f
1468	2022-03-24 10:52:01	2022-03-24 10:52:01	Athena Bracciano	athena-bracciano-88	\N	f
1469	2022-03-24 10:52:01	2022-03-24 10:52:01	Kusel KiXXX	kusel-kixxx-23	\N	f
1470	2022-03-24 10:52:01	2022-03-24 10:52:01	RB Waddinxveen	rb-waddinxveen-14	\N	f
1471	2022-03-24 10:52:01	2022-03-24 10:52:01	Beacon Lifesaving Club	beacon-lifesaving-club-6	\N	f
1472	2022-03-24 10:52:01	2022-03-24 10:52:01	DLRG Buchholz United	dlrg-buchholz-united-18	\N	f
1473	2022-03-24 10:52:01	2022-03-24 10:52:01	Italy NT	italy-nt-59	\N	f
1474	2022-03-24 10:52:01	2022-03-24 10:52:01	DLRG Buchholz United	dlrg-buchholz-united-19	\N	f
1475	2022-03-24 10:52:01	2022-03-24 10:52:01	Athena Bracciano	athena-bracciano-89	\N	f
1476	2022-03-24 10:52:01	2022-03-24 10:52:01	RB Delft	rb-delft-38	\N	f
1477	2022-03-24 10:52:01	2022-03-24 10:52:01	RB Delft	rb-delft-39	\N	f
1478	2022-03-24 10:52:02	2022-03-24 10:52:02	RB Delft	rb-delft-40	\N	f
1479	2022-03-24 10:52:02	2022-03-24 10:52:02	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-17	\N	f
1480	2022-03-24 10:52:02	2022-03-24 10:52:02	Italy NT	italy-nt-60	\N	f
1481	2022-03-24 10:52:02	2022-03-24 10:52:02	Italy NT	italy-nt-61	\N	f
1482	2022-03-24 10:52:02	2022-03-24 10:52:02	Spain NT	spain-nt-57	\N	f
1483	2022-03-24 10:52:02	2022-03-24 10:52:02	France NT	france-nt-69	\N	f
1484	2022-03-24 10:52:02	2022-03-24 10:52:02	Belgium NT	belgium-nt-36	\N	f
1485	2022-03-24 10:52:02	2022-03-24 10:52:02	Nederland NT	nederland-nt-27	\N	f
1486	2022-03-24 10:52:03	2022-03-24 10:52:03	Spain NT	spain-nt-58	\N	f
1487	2022-03-24 10:52:03	2022-03-24 10:52:03	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-34	\N	f
1488	2022-03-24 10:52:03	2022-03-24 10:52:03	Athena Bracciano	athena-bracciano-90	\N	f
1489	2022-03-24 10:52:03	2022-03-24 10:52:03	France NT	france-nt-70	\N	f
1490	2022-03-24 10:52:03	2022-03-24 10:52:03	CKS Szczecin	cks-szczecin-36	\N	f
1491	2022-03-24 10:52:03	2022-03-24 10:52:03	Slaskie WOPR	slaskie-wopr-44	\N	f
1492	2022-03-24 10:52:03	2022-03-24 10:52:03	Accademia Di Salvamento	accademia-di-salvamento-78	\N	f
1493	2022-03-24 10:52:03	2022-03-24 10:52:03	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-41	\N	f
1494	2022-03-24 10:52:03	2022-03-24 10:52:03	DLRG Niedersachsen	dlrg-niedersachsen-93	\N	f
1495	2022-03-24 10:52:03	2022-03-24 10:52:03	Athena Bracciano	athena-bracciano-91	\N	f
1496	2022-03-24 10:52:04	2022-03-24 10:52:04	DLRG Niedersachsen	dlrg-niedersachsen-94	\N	f
1497	2022-03-24 10:52:04	2022-03-24 10:52:04	Athena Salvamento	athena-salvamento-49	\N	f
1498	2022-03-24 10:52:04	2022-03-24 10:52:04	Athena Salvamento	athena-salvamento-50	\N	f
1499	2022-03-24 10:52:04	2022-03-24 10:52:04	DLRG Guetersloh	dlrg-guetersloh-33	\N	f
1500	2022-03-24 10:52:04	2022-03-24 10:52:04	Hungarian NT	hungarian-nt-3	\N	f
1501	2022-03-24 10:52:04	2022-03-24 10:52:04	Italy NT	italy-nt-62	\N	f
1502	2022-03-24 10:52:04	2022-03-24 10:52:04	Spain NT	spain-nt-59	\N	f
1503	2022-03-24 10:52:05	2022-03-24 10:52:05	Italy NT	italy-nt-63	\N	f
1504	2022-03-24 10:52:05	2022-03-24 10:52:05	Polen NT	polen-nt-14	\N	f
1505	2022-03-24 10:52:05	2022-03-24 10:52:05	Spain NT	spain-nt-60	\N	f
1506	2022-03-24 10:52:05	2022-03-24 10:52:05	France NT	france-nt-71	\N	f
1507	2022-03-24 10:52:05	2022-03-24 10:52:05	ASD Gorizia Nuoto	asd-gorizia-nuoto-20	\N	f
1508	2022-03-24 10:52:05	2022-03-24 10:52:05	SAFA 2000	safa-2000-22	\N	f
1509	2022-03-24 10:52:05	2022-03-24 10:52:05	A.S.D. Sportiva Sturla	asd-sportiva-sturla-17	\N	f
1510	2022-03-24 10:52:05	2022-03-24 10:52:05	Athena Bracciano	athena-bracciano-92	\N	f
1511	2022-03-24 10:52:05	2022-03-24 10:52:05	DLRG Luckenwalde	dlrg-luckenwalde-13	\N	f
1512	2022-03-24 10:52:05	2022-03-24 10:52:05	ASD Rosetana Nuoto	asd-rosetana-nuoto-19	\N	f
1513	2022-03-24 10:52:05	2022-03-24 10:52:05	CKS Szczecin	cks-szczecin-37	\N	f
1514	2022-03-24 10:52:05	2022-03-24 10:52:05	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-42	\N	f
1515	2022-03-24 10:52:06	2022-03-24 10:52:06	France NT	france-nt-72	\N	f
1516	2022-03-24 10:52:06	2022-03-24 10:52:06	Accademia Di Salvamento	accademia-di-salvamento-79	\N	f
1517	2022-03-24 10:52:06	2022-03-24 10:52:06	MKS Szczecin	mks-szczecin-10	\N	f
1518	2022-03-24 10:52:06	2022-03-24 10:52:06	DLRG Buchholz United	dlrg-buchholz-united-20	\N	f
1519	2022-03-24 10:52:06	2022-03-24 10:52:06	Athena Salvamento	athena-salvamento-51	\N	f
1520	2022-03-24 10:52:06	2022-03-24 10:52:06	Slaskie WOPR	slaskie-wopr-45	\N	f
1521	2022-03-24 10:52:06	2022-03-24 10:52:06	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-43	\N	f
1522	2022-03-24 10:52:06	2022-03-24 10:52:06	Athena Bracciano	athena-bracciano-93	\N	f
1523	2022-03-24 10:52:07	2022-03-24 10:52:07	Accademia Di Salvamento	accademia-di-salvamento-80	\N	f
1524	2022-03-24 10:52:07	2022-03-24 10:52:07	DLRG Niedersachsen	dlrg-niedersachsen-95	\N	f
1525	2022-03-24 10:52:07	2022-03-24 10:52:07	RB Waddinxveen	rb-waddinxveen-15	\N	f
1526	2022-03-24 10:52:07	2022-03-24 10:52:07	RB Delft	rb-delft-41	\N	f
1527	2022-03-24 10:52:07	2022-03-24 10:52:07	Belgium NT	belgium-nt-37	\N	f
1528	2022-03-24 10:52:07	2022-03-24 10:52:07	Spain NT	spain-nt-61	\N	f
1529	2022-03-24 10:52:07	2022-03-24 10:52:07	DLRG Niedersachsen	dlrg-niedersachsen-96	\N	f
1530	2022-03-24 10:52:07	2022-03-24 10:52:07	France NT	france-nt-73	\N	f
1531	2022-03-24 10:52:08	2022-03-24 10:52:08	DLRG Niedersachsen	dlrg-niedersachsen-97	\N	f
1532	2022-03-24 10:52:08	2022-03-24 10:52:08	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-35	\N	f
1533	2022-03-24 10:52:08	2022-03-24 10:52:08	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-44	\N	f
1534	2022-03-24 10:52:08	2022-03-24 10:52:08	RB Heytse	rb-heytse-30	\N	f
1535	2022-03-24 10:52:08	2022-03-24 10:52:08	CKS Szczecin	cks-szczecin-38	\N	f
1536	2022-03-24 10:52:08	2022-03-24 10:52:08	Athena Bracciano	athena-bracciano-94	\N	f
1537	2022-03-24 10:52:08	2022-03-24 10:52:08	Kusel KiXXX	kusel-kixxx-24	\N	f
1538	2022-03-24 10:52:08	2022-03-24 10:52:08	Athena Salvamento	athena-salvamento-52	\N	f
1539	2022-03-24 10:52:08	2022-03-24 10:52:08	Italy NT	italy-nt-64	\N	f
1540	2022-03-24 10:52:09	2022-03-24 10:52:09	Accademia Di Salvamento	accademia-di-salvamento-81	\N	f
1541	2022-03-24 10:52:09	2022-03-24 10:52:09	Accademia Di Salvamento	accademia-di-salvamento-82	\N	f
1542	2022-03-24 10:52:09	2022-03-24 10:52:09	Accademia Di Salvamento	accademia-di-salvamento-83	\N	f
1543	2022-03-24 10:52:09	2022-03-24 10:52:09	Athena Salvamento	athena-salvamento-53	\N	f
1544	2022-03-24 10:52:09	2022-03-24 10:52:09	Athena Bracciano	athena-bracciano-95	\N	f
1545	2022-03-24 10:52:09	2022-03-24 10:52:09	Italy NT	italy-nt-65	\N	f
1546	2022-03-24 10:52:09	2022-03-24 10:52:09	Spain NT	spain-nt-62	\N	f
1547	2022-03-24 10:52:10	2022-03-24 10:52:10	France NT	france-nt-74	\N	f
1548	2022-03-24 10:52:10	2022-03-24 10:52:10	Liege Sauvetage Club	liege-sauvetage-club-26	\N	f
1549	2022-03-24 10:52:10	2022-03-24 10:52:10	Nederland NT	nederland-nt-28	\N	f
1550	2022-03-24 10:52:10	2022-03-24 10:52:10	Slaskie WOPR	slaskie-wopr-46	\N	f
1551	2022-03-24 10:52:10	2022-03-24 10:52:10	Slaskie WOPR	slaskie-wopr-47	\N	f
1552	2022-03-24 10:52:10	2022-03-24 10:52:10	DLRG Guetersloh	dlrg-guetersloh-34	\N	f
1553	2022-03-24 10:52:10	2022-03-24 10:52:10	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-45	\N	f
1554	2022-03-24 10:52:10	2022-03-24 10:52:10	DLRG Guetersloh	dlrg-guetersloh-35	\N	f
1555	2022-03-24 10:52:10	2022-03-24 10:52:10	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-36	\N	f
1556	2022-03-24 10:52:10	2022-03-24 10:52:10	France NT	france-nt-75	\N	f
1557	2022-03-24 10:52:10	2022-03-24 10:52:10	Italy NT	italy-nt-66	\N	f
1558	2022-03-24 10:52:11	2022-03-24 10:52:11	SAFA 2000	safa-2000-23	\N	f
1559	2022-03-24 10:52:11	2022-03-24 10:52:11	DLRG Niedersachsen	dlrg-niedersachsen-98	\N	f
1560	2022-03-24 10:52:11	2022-03-24 10:52:11	DLRG Niedersachsen	dlrg-niedersachsen-99	\N	f
1561	2022-03-24 10:52:11	2022-03-24 10:52:11	CKS Szczecin	cks-szczecin-39	\N	f
1562	2022-03-24 10:52:11	2022-03-24 10:52:11	Accademia Di Salvamento	accademia-di-salvamento-84	\N	f
1563	2022-03-24 10:52:11	2022-03-24 10:52:11	Polen NT	polen-nt-15	\N	f
1564	2022-03-24 10:52:11	2022-03-24 10:52:11	ASD Rosetana Nuoto	asd-rosetana-nuoto-20	\N	f
1565	2022-03-24 10:52:11	2022-03-24 10:52:11	Athena Bracciano	athena-bracciano-96	\N	f
1566	2022-03-24 10:52:11	2022-03-24 10:52:11	MKS Szczecin	mks-szczecin-11	\N	f
1567	2022-03-24 10:52:12	2022-03-24 10:52:12	Athena Salvamento	athena-salvamento-54	\N	f
1568	2022-03-24 10:52:12	2022-03-24 10:52:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-46	\N	f
1569	2022-03-24 10:52:12	2022-03-24 10:52:12	Belgium NT	belgium-nt-38	\N	f
1570	2022-03-24 10:52:12	2022-03-24 10:52:12	RB Delft	rb-delft-42	\N	f
1571	2022-03-24 10:52:12	2022-03-24 10:52:12	DLRG Guetersloh	dlrg-guetersloh-36	\N	f
1572	2022-03-24 10:52:12	2022-03-24 10:52:12	DLRG Buchholz United	dlrg-buchholz-united-21	\N	f
1573	2022-03-24 10:52:12	2022-03-24 10:52:12	Athena Bracciano	athena-bracciano-97	\N	f
1574	2022-03-24 10:52:12	2022-03-24 10:52:12	Spain NT	spain-nt-63	\N	f
1575	2022-03-24 10:52:12	2022-03-24 10:52:12	Liege Sauvetage Club	liege-sauvetage-club-27	\N	f
1576	2022-03-24 10:52:12	2022-03-24 10:52:12	RB Waddinxveen	rb-waddinxveen-16	\N	f
1577	2022-03-24 10:52:12	2022-03-24 10:52:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-47	\N	f
1578	2022-03-24 10:52:12	2022-03-24 10:52:12	Beacon Lifesaving Club	beacon-lifesaving-club-7	\N	f
1579	2022-03-24 10:52:12	2022-03-24 10:52:12	RB Delft	rb-delft-43	\N	f
1580	2022-03-24 10:52:12	2022-03-24 10:52:12	RB Delft	rb-delft-44	\N	f
1581	2022-03-24 10:52:12	2022-03-24 10:52:12	RB Delft	rb-delft-45	\N	f
1582	2022-03-24 10:52:13	2022-03-24 10:52:13	Accademia Di Salvamento	accademia-di-salvamento-85	\N	f
1583	2022-03-24 10:52:13	2022-03-24 10:52:13	Accademia Di Salvamento	accademia-di-salvamento-86	\N	f
1584	2022-03-24 10:52:13	2022-03-24 10:52:13	Accademia Di Salvamento	accademia-di-salvamento-87	\N	f
1585	2022-03-24 10:52:13	2022-03-24 10:52:13	Accademia Di Salvamento	accademia-di-salvamento-88	\N	f
1586	2022-03-24 10:52:13	2022-03-24 10:52:13	ASD Gorizia Nuoto	asd-gorizia-nuoto-21	\N	f
1587	2022-03-24 10:52:13	2022-03-24 10:52:13	RB Waddinxveen	rb-waddinxveen-17	\N	f
1588	2022-03-24 10:52:13	2022-03-24 10:52:13	Spain NT	spain-nt-64	\N	f
1589	2022-03-24 10:52:13	2022-03-24 10:52:13	France NT	france-nt-76	\N	f
1590	2022-03-24 10:52:14	2022-03-24 10:52:14	Italy NT	italy-nt-67	\N	f
1591	2022-03-24 10:52:14	2022-03-24 10:52:14	Kusel KiXXX	kusel-kixxx-25	\N	f
1592	2022-03-24 10:52:14	2022-03-24 10:52:14	Slaskie WOPR	slaskie-wopr-48	\N	f
1593	2022-03-24 10:52:14	2022-03-24 10:52:14	Slaskie WOPR	slaskie-wopr-49	\N	f
1594	2022-03-24 10:52:14	2022-03-24 10:52:14	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-37	\N	f
1595	2022-03-24 10:52:14	2022-03-24 10:52:14	France NT	france-nt-77	\N	f
1596	2022-03-24 10:52:14	2022-03-24 10:52:14	Belgium NT	belgium-nt-39	\N	f
1597	2022-03-24 10:52:14	2022-03-24 10:52:14	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-11	\N	f
1598	2022-03-24 10:52:14	2022-03-24 10:52:14	SAFA 2000	safa-2000-24	\N	f
1599	2022-03-24 10:52:14	2022-03-24 10:52:14	In Sport Rane Rosse	in-sport-rane-rosse-49	\N	f
1600	2022-03-24 10:52:14	2022-03-24 10:52:14	Accademia Di Salvamento	accademia-di-salvamento-89	\N	f
1601	2022-03-24 10:52:14	2022-03-24 10:52:14	Accademia Di Salvamento	accademia-di-salvamento-90	\N	f
1602	2022-03-24 10:52:15	2022-03-24 10:52:15	France NT	france-nt-78	\N	f
1603	2022-03-24 10:52:15	2022-03-24 10:52:15	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-38	\N	f
1604	2022-03-24 10:52:15	2022-03-24 10:52:15	Liege Sauvetage Club	liege-sauvetage-club-28	\N	f
1605	2022-03-24 10:52:15	2022-03-24 10:52:15	Slaskie WOPR	slaskie-wopr-50	\N	f
1606	2022-03-24 10:52:15	2022-03-24 10:52:15	In Sport Rane Rosse	in-sport-rane-rosse-50	\N	f
1607	2022-03-24 10:52:15	2022-03-24 10:52:15	Athena Salvamento	athena-salvamento-55	\N	f
1608	2022-03-24 10:52:15	2022-03-24 10:52:15	DLRG Niedersachsen	dlrg-niedersachsen-100	\N	f
1609	2022-03-24 10:52:15	2022-03-24 10:52:15	DLRG Niedersachsen	dlrg-niedersachsen-101	\N	f
1610	2022-03-24 10:52:15	2022-03-24 10:52:15	Liege Sauvetage Club	liege-sauvetage-club-29	\N	f
1611	2022-03-24 10:52:15	2022-03-24 10:52:15	Rctal	rctal-22	\N	f
1612	2022-03-24 10:52:15	2022-03-24 10:52:15	Sint-Truidense RC	sint-truidense-rc-23	\N	f
1613	2022-03-24 10:52:15	2022-03-24 10:52:15	RB Heytse	rb-heytse-31	\N	f
1614	2022-03-24 10:52:15	2022-03-24 10:52:15	CKS Szczecin	cks-szczecin-40	\N	f
1615	2022-03-24 10:52:15	2022-03-24 10:52:15	Athena Salvamento	athena-salvamento-56	\N	f
1616	2022-03-24 10:52:15	2022-03-24 10:52:15	Sint-Truidense RC	sint-truidense-rc-24	\N	f
1617	2022-03-24 10:52:16	2022-03-24 10:52:16	Liege Sauvetage Club	liege-sauvetage-club-30	\N	f
1618	2022-03-24 10:52:16	2022-03-24 10:52:16	DLRG Niedersachsen	dlrg-niedersachsen-102	\N	f
1619	2022-03-24 10:52:16	2022-03-24 10:52:16	RB Heytse	rb-heytse-32	\N	f
1620	2022-03-24 10:52:16	2022-03-24 10:52:16	DLRG Guetersloh	dlrg-guetersloh-37	\N	f
1621	2022-03-24 10:52:16	2022-03-24 10:52:16	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-48	\N	f
1622	2022-03-24 10:52:16	2022-03-24 10:52:16	DLRG Niedersachsen	dlrg-niedersachsen-103	\N	f
1623	2022-03-24 10:52:16	2022-03-24 10:52:16	Slaskie WOPR	slaskie-wopr-51	\N	f
1624	2022-03-24 10:52:16	2022-03-24 10:52:16	RB Heytse	rb-heytse-33	\N	f
1625	2022-03-24 10:52:16	2022-03-24 10:52:16	DLRG Niedersachsen	dlrg-niedersachsen-104	\N	f
1626	2022-03-24 10:52:17	2022-03-24 10:52:17	Italy NT	italy-nt-68	\N	f
1627	2022-03-24 10:52:17	2022-03-24 10:52:17	Italy NT	italy-nt-69	\N	f
1628	2022-03-24 10:52:17	2022-03-24 10:52:17	Belgium NT	belgium-nt-40	\N	f
1629	2022-03-24 10:52:17	2022-03-24 10:52:17	France NT	france-nt-79	\N	f
1630	2022-03-24 10:52:17	2022-03-24 10:52:17	Nederland NT	nederland-nt-29	\N	f
1631	2022-03-24 10:52:17	2022-03-24 10:52:17	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-39	\N	f
1632	2022-03-24 10:52:17	2022-03-24 10:52:17	Spain NT	spain-nt-65	\N	f
1633	2022-03-24 10:52:17	2022-03-24 10:52:17	Spain NT	spain-nt-66	\N	f
1634	2022-03-24 10:52:17	2022-03-24 10:52:17	France NT	france-nt-80	\N	f
1635	2022-03-24 10:52:17	2022-03-24 10:52:17	CKS Szczecin	cks-szczecin-41	\N	f
1636	2022-03-24 10:52:17	2022-03-24 10:52:17	Accademia Di Salvamento	accademia-di-salvamento-91	\N	f
1637	2022-03-24 10:52:18	2022-03-24 10:52:18	Accademia Di Salvamento	accademia-di-salvamento-92	\N	f
1638	2022-03-24 10:52:18	2022-03-24 10:52:18	Athena Bracciano	athena-bracciano-98	\N	f
1639	2022-03-24 10:52:18	2022-03-24 10:52:18	DLRG Niedersachsen	dlrg-niedersachsen-105	\N	f
1640	2022-03-24 10:52:18	2022-03-24 10:52:18	DLRG Luckenwalde	dlrg-luckenwalde-14	\N	f
1641	2022-03-24 10:52:18	2022-03-24 10:52:18	Nederland NT	nederland-nt-30	\N	f
1642	2022-03-24 10:52:18	2022-03-24 10:52:18	DLRG Bad Oldesloe	dlrg-bad-oldesloe-6	\N	f
1643	2022-03-24 10:52:18	2022-03-24 10:52:18	DLRG Niedersachsen	dlrg-niedersachsen-106	\N	f
1644	2022-03-24 10:52:18	2022-03-24 10:52:18	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-18	\N	f
1645	2022-03-24 10:52:18	2022-03-24 10:52:18	Belgium NT	belgium-nt-41	\N	f
1646	2022-03-24 10:52:18	2022-03-24 10:52:18	Belgium NT	belgium-nt-42	\N	f
1647	2022-03-24 10:52:18	2022-03-24 10:52:18	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-19	\N	f
1648	2022-03-24 10:52:19	2022-03-24 10:52:19	DLRG Niedersachsen	dlrg-niedersachsen-107	\N	f
1649	2022-03-24 10:52:19	2022-03-24 10:52:19	Italy NT	italy-nt-70	\N	f
1650	2022-03-24 10:52:19	2022-03-24 10:52:19	Italy NT	italy-nt-71	\N	f
1651	2022-03-24 10:52:19	2022-03-24 10:52:19	ASD Gorizia Nuoto	asd-gorizia-nuoto-22	\N	f
1652	2022-03-24 10:52:19	2022-03-24 10:52:19	Spain NT	spain-nt-67	\N	f
1653	2022-03-24 10:52:19	2022-03-24 10:52:19	SAFA 2000	safa-2000-25	\N	f
1654	2022-03-24 10:52:19	2022-03-24 10:52:19	Polen NT	polen-nt-16	\N	f
1655	2022-03-24 10:52:19	2022-03-24 10:52:19	In Sport Rane Rosse	in-sport-rane-rosse-51	\N	f
1656	2022-03-24 10:52:19	2022-03-24 10:52:19	Beacon Lifesaving Club	beacon-lifesaving-club-8	\N	f
1657	2022-03-24 10:52:19	2022-03-24 10:52:19	France NT	france-nt-81	\N	f
1658	2022-03-24 10:52:19	2022-03-24 10:52:19	SAFA 2000	safa-2000-26	\N	f
1659	2022-03-24 10:52:19	2022-03-24 10:52:19	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-49	\N	f
1660	2022-03-24 10:52:20	2022-03-24 10:52:20	A.S.D. Sportiva Sturla	asd-sportiva-sturla-18	\N	f
1661	2022-03-24 10:52:20	2022-03-24 10:52:20	DLRG Lueneburg e.V.	dlrg-lueneburg-ev-2	\N	f
1662	2022-03-24 10:52:20	2022-03-24 10:52:20	Accademia Di Salvamento	accademia-di-salvamento-93	\N	f
1663	2022-03-24 10:52:20	2022-03-24 10:52:20	Belgium NT	belgium-nt-43	\N	f
1664	2022-03-24 10:52:20	2022-03-24 10:52:20	ASD Rosetana Nuoto	asd-rosetana-nuoto-21	\N	f
1665	2022-03-24 10:52:20	2022-03-24 10:52:20	RB Heytse	rb-heytse-34	\N	f
1666	2022-03-24 10:52:20	2022-03-24 10:52:20	RB Heytse	rb-heytse-35	\N	f
1667	2022-03-24 10:52:20	2022-03-24 10:52:20	DLRG Luckenwalde	dlrg-luckenwalde-15	\N	f
1668	2022-03-24 10:52:20	2022-03-24 10:52:20	ASD Rosetana Nuoto	asd-rosetana-nuoto-22	\N	f
1669	2022-03-24 10:52:20	2022-03-24 10:52:20	Rctal	rctal-23	\N	f
1670	2022-03-24 10:52:20	2022-03-24 10:52:20	DLRG Niedersachsen	dlrg-niedersachsen-108	\N	f
1671	2022-03-24 10:52:20	2022-03-24 10:52:20	DLRG Niedersachsen	dlrg-niedersachsen-109	\N	f
1672	2022-03-24 10:52:20	2022-03-24 10:52:20	RB Waddinxveen	rb-waddinxveen-18	\N	f
1673	2022-03-24 10:52:21	2022-03-24 10:52:21	Accademia Di Salvamento	accademia-di-salvamento-94	\N	f
1674	2022-03-24 10:52:21	2022-03-24 10:52:21	RB Delft	rb-delft-46	\N	f
1675	2022-03-24 10:52:21	2022-03-24 10:52:21	RB Delft	rb-delft-47	\N	f
1676	2022-03-24 10:52:21	2022-03-24 10:52:21	RB Delft	rb-delft-48	\N	f
1677	2022-03-24 10:52:21	2022-03-24 10:52:21	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-4	\N	f
1678	2022-03-24 10:52:21	2022-03-24 10:52:21	Italy NT	italy-nt-72	\N	f
1679	2022-03-24 10:52:21	2022-03-24 10:52:21	Spain NT	spain-nt-68	\N	f
1680	2022-03-24 10:52:21	2022-03-24 10:52:21	Spain NT	spain-nt-69	\N	f
1681	2022-03-24 10:52:21	2022-03-24 10:52:21	In Sport Rane Rosse	in-sport-rane-rosse-52	\N	f
1682	2022-03-24 10:52:21	2022-03-24 10:52:21	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-40	\N	f
1683	2022-03-24 10:52:21	2022-03-24 10:52:21	Athena Bracciano	athena-bracciano-99	\N	f
1684	2022-03-24 10:52:22	2022-03-24 10:52:22	Spain NT	spain-nt-70	\N	f
1685	2022-03-24 10:52:22	2022-03-24 10:52:22	Accademia Di Salvamento	accademia-di-salvamento-95	\N	f
1686	2022-03-24 10:52:22	2022-03-24 10:52:22	Athena Bracciano	athena-bracciano-100	\N	f
1687	2022-03-24 10:52:22	2022-03-24 10:52:22	Accademia Di Salvamento	accademia-di-salvamento-96	\N	f
1688	2022-03-24 10:52:22	2022-03-24 10:52:22	Belgium NT	belgium-nt-44	\N	f
1689	2022-03-24 10:52:22	2022-03-24 10:52:22	France NT	france-nt-82	\N	f
1690	2022-03-24 10:52:22	2022-03-24 10:52:22	Slaskie WOPR	slaskie-wopr-52	\N	f
1691	2022-03-24 10:52:22	2022-03-24 10:52:22	Athena Bracciano	athena-bracciano-101	\N	f
1692	2022-03-24 10:52:22	2022-03-24 10:52:22	Athena Salvamento	athena-salvamento-57	\N	f
1693	2022-03-24 10:52:22	2022-03-24 10:52:22	Liege Sauvetage Club	liege-sauvetage-club-31	\N	f
1694	2022-03-24 10:52:22	2022-03-24 10:52:22	Athena Salvamento	athena-salvamento-58	\N	f
1695	2022-03-24 10:52:22	2022-03-24 10:52:22	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-41	\N	f
1696	2022-03-24 10:52:23	2022-03-24 10:52:23	In Sport Rane Rosse	in-sport-rane-rosse-53	\N	f
1697	2022-03-24 10:52:23	2022-03-24 10:52:23	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-12	\N	f
1698	2022-03-24 10:52:23	2022-03-24 10:52:23	Liege Sauvetage Club	liege-sauvetage-club-32	\N	f
1699	2022-03-24 10:52:23	2022-03-24 10:52:23	Athena Salvamento	athena-salvamento-59	\N	f
1700	2022-03-24 10:52:23	2022-03-24 10:52:23	In Sport Rane Rosse	in-sport-rane-rosse-54	\N	f
1701	2022-03-24 10:52:23	2022-03-24 10:52:23	Sint-Truidense RC	sint-truidense-rc-25	\N	f
1702	2022-03-24 10:52:23	2022-03-24 10:52:23	DLRG Niedersachsen	dlrg-niedersachsen-110	\N	f
1703	2022-03-24 10:52:23	2022-03-24 10:52:23	CKS Szczecin	cks-szczecin-42	\N	f
1704	2022-03-24 10:52:23	2022-03-24 10:52:23	Nederland NT	nederland-nt-31	\N	f
1705	2022-03-24 10:52:23	2022-03-24 10:52:23	France NT	france-nt-83	\N	f
1706	2022-03-24 10:52:38	2022-03-24 10:52:38	Italy NT	italy-nt-73	\N	f
1707	2022-03-24 10:52:38	2022-03-24 10:52:38	SAFA 2000	safa-2000-27	\N	f
1708	2022-03-24 10:52:38	2022-03-24 10:52:38	Accademia Di Salvamento	accademia-di-salvamento-97	\N	f
1709	2022-03-24 10:52:38	2022-03-24 10:52:38	Spain NT	spain-nt-71	\N	f
1710	2022-03-24 10:52:38	2022-03-24 10:52:38	France NT	france-nt-84	\N	f
1711	2022-03-24 10:52:38	2022-03-24 10:52:38	Accademia Di Salvamento	accademia-di-salvamento-98	\N	f
1712	2022-03-24 10:52:38	2022-03-24 10:52:38	Belgium NT	belgium-nt-45	\N	f
1713	2022-03-24 10:52:38	2022-03-24 10:52:38	Kusel KiXXX	kusel-kixxx-26	\N	f
1714	2022-03-24 10:52:38	2022-03-24 10:52:38	In Sport Rane Rosse	in-sport-rane-rosse-55	\N	f
1715	2022-03-24 10:52:38	2022-03-24 10:52:38	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-42	\N	f
1716	2022-03-24 10:52:38	2022-03-24 10:52:38	Athena Bracciano	athena-bracciano-102	\N	f
1717	2022-03-24 10:52:39	2022-03-24 10:52:39	Slaskie WOPR	slaskie-wopr-53	\N	f
1718	2022-03-24 10:52:39	2022-03-24 10:52:39	Slaskie WOPR	slaskie-wopr-54	\N	f
1719	2022-03-24 10:52:39	2022-03-24 10:52:39	DLRG Niedersachsen	dlrg-niedersachsen-111	\N	f
1720	2022-03-24 10:52:39	2022-03-24 10:52:39	France NT	france-nt-85	\N	f
1721	2022-03-24 10:52:39	2022-03-24 10:52:39	Athena Bracciano	athena-bracciano-103	\N	f
1722	2022-03-24 10:52:39	2022-03-24 10:52:39	Athena Salvamento	athena-salvamento-60	\N	f
1723	2022-03-24 10:52:39	2022-03-24 10:52:39	In Sport Rane Rosse	in-sport-rane-rosse-56	\N	f
1724	2022-03-24 10:52:39	2022-03-24 10:52:39	Sint-Truidense RC	sint-truidense-rc-26	\N	f
1725	2022-03-24 10:52:39	2022-03-24 10:52:39	ASD Rosetana Nuoto	asd-rosetana-nuoto-23	\N	f
1726	2022-03-24 10:52:39	2022-03-24 10:52:39	DLRG Niedersachsen	dlrg-niedersachsen-112	\N	f
1727	2022-03-24 10:52:39	2022-03-24 10:52:39	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-6	\N	f
1728	2022-03-24 10:52:39	2022-03-24 10:52:39	Rctal	rctal-24	\N	f
1729	2022-03-24 10:52:40	2022-03-24 10:52:40	DLRG Niedersachsen	dlrg-niedersachsen-113	\N	f
1730	2022-03-24 10:52:40	2022-03-24 10:52:40	Athena Bracciano	athena-bracciano-104	\N	f
1731	2022-03-24 10:52:40	2022-03-24 10:52:40	Sint-Truidense RC	sint-truidense-rc-27	\N	f
1732	2022-03-24 10:52:40	2022-03-24 10:52:40	DLRG Niedersachsen	dlrg-niedersachsen-114	\N	f
1733	2022-03-24 10:52:40	2022-03-24 10:52:40	Athena Salvamento	athena-salvamento-61	\N	f
1734	2022-03-24 10:52:40	2022-03-24 10:52:40	Accademia Di Salvamento	accademia-di-salvamento-99	\N	f
1735	2022-03-24 10:52:40	2022-03-24 10:52:40	Athena Salvamento	athena-salvamento-62	\N	f
1736	2022-03-24 10:52:40	2022-03-24 10:52:40	Nederland NT	nederland-nt-32	\N	f
1737	2022-03-24 10:52:40	2022-03-24 10:52:40	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-50	\N	f
1738	2022-03-24 10:52:40	2022-03-24 10:52:40	Rctal	rctal-25	\N	f
1739	2022-03-24 10:52:41	2022-03-24 10:52:41	DLRG Guetersloh	dlrg-guetersloh-38	\N	f
1740	2022-03-24 10:52:41	2022-03-24 10:52:41	DLRG Guetersloh	dlrg-guetersloh-39	\N	f
1741	2022-03-24 10:52:41	2022-03-24 10:52:41	Athena Bracciano	athena-bracciano-105	\N	f
1742	2022-03-24 10:52:41	2022-03-24 10:52:41	RB Delft	rb-delft-49	\N	f
1743	2022-03-24 10:52:41	2022-03-24 10:52:41	DLRG Guetersloh	dlrg-guetersloh-40	\N	f
1744	2022-03-24 10:52:41	2022-03-24 10:52:41	Italy NT	italy-nt-74	\N	f
1745	2022-03-24 10:52:41	2022-03-24 10:52:41	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-20	\N	f
1746	2022-03-24 10:52:41	2022-03-24 10:52:41	Italy NT	italy-nt-75	\N	f
1747	2022-03-24 10:52:41	2022-03-24 10:52:41	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-21	\N	f
1748	2022-03-24 10:52:41	2022-03-24 10:52:41	DLRG Bad Oldesloe	dlrg-bad-oldesloe-7	\N	f
1749	2022-03-24 10:52:41	2022-03-24 10:52:41	ASD Gorizia Nuoto	asd-gorizia-nuoto-23	\N	f
1750	2022-03-24 10:52:41	2022-03-24 10:52:41	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-22	\N	f
1751	2022-03-24 10:52:42	2022-03-24 10:52:42	France NT	france-nt-86	\N	f
1752	2022-03-24 10:52:42	2022-03-24 10:52:42	Spain NT	spain-nt-72	\N	f
1753	2022-03-24 10:52:42	2022-03-24 10:52:42	France NT	france-nt-87	\N	f
1754	2022-03-24 10:52:42	2022-03-24 10:52:42	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-43	\N	f
1755	2022-03-24 10:52:42	2022-03-24 10:52:42	Belgium NT	belgium-nt-46	\N	f
1756	2022-03-24 10:52:42	2022-03-24 10:52:42	Athena Bracciano	athena-bracciano-106	\N	f
1757	2022-03-24 10:52:42	2022-03-24 10:52:42	Nederland NT	nederland-nt-33	\N	f
1758	2022-03-24 10:52:42	2022-03-24 10:52:42	Kusel KiXXX	kusel-kixxx-27	\N	f
1759	2022-03-24 10:52:42	2022-03-24 10:52:42	Athena Bracciano	athena-bracciano-107	\N	f
1760	2022-03-24 10:52:42	2022-03-24 10:52:42	Athena Bracciano	athena-bracciano-108	\N	f
1761	2022-03-24 10:52:43	2022-03-24 10:52:43	DLRG Niedersachsen	dlrg-niedersachsen-115	\N	f
1762	2022-03-24 10:52:43	2022-03-24 10:52:43	DLRG Luckenwalde	dlrg-luckenwalde-16	\N	f
1763	2022-03-24 10:52:43	2022-03-24 10:52:43	DLRG Niedersachsen	dlrg-niedersachsen-116	\N	f
1764	2022-03-24 10:52:43	2022-03-24 10:52:43	A.S.D. Sportiva Sturla	asd-sportiva-sturla-19	\N	f
1765	2022-03-24 10:52:43	2022-03-24 10:52:43	Spain NT	spain-nt-73	\N	f
1766	2022-03-24 10:52:43	2022-03-24 10:52:43	SAFA 2000	safa-2000-28	\N	f
1767	2022-03-24 10:52:43	2022-03-24 10:52:43	CKS Szczecin	cks-szczecin-43	\N	f
1768	2022-03-24 10:52:43	2022-03-24 10:52:43	ASD Gorizia Nuoto	asd-gorizia-nuoto-24	\N	f
1769	2022-03-24 10:52:43	2022-03-24 10:52:43	CKS Szczecin	cks-szczecin-44	\N	f
1770	2022-03-24 10:52:43	2022-03-24 10:52:43	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-13	\N	f
1771	2022-03-24 10:52:44	2022-03-24 10:52:44	ASD Gorizia Nuoto	asd-gorizia-nuoto-25	\N	f
1772	2022-03-24 10:52:44	2022-03-24 10:52:44	In Sport Rane Rosse	in-sport-rane-rosse-57	\N	f
1773	2022-03-24 10:52:44	2022-03-24 10:52:44	In Sport Rane Rosse	in-sport-rane-rosse-58	\N	f
1774	2022-03-24 10:52:44	2022-03-24 10:52:44	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-14	\N	f
1775	2022-03-24 10:52:44	2022-03-24 10:52:44	Slaskie WOPR	slaskie-wopr-55	\N	f
1776	2022-03-24 10:52:44	2022-03-24 10:52:44	RB Heytse	rb-heytse-36	\N	f
1777	2022-03-24 10:52:44	2022-03-24 10:52:44	Belgium NT	belgium-nt-47	\N	f
1778	2022-03-24 10:52:44	2022-03-24 10:52:44	RB Heytse	rb-heytse-37	\N	f
1779	2022-03-24 10:52:44	2022-03-24 10:52:44	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-51	\N	f
1780	2022-03-24 10:52:44	2022-03-24 10:52:44	Athena Bracciano	athena-bracciano-109	\N	f
1781	2022-03-24 10:52:44	2022-03-24 10:52:44	Athena Salvamento	athena-salvamento-63	\N	f
1782	2022-03-24 10:52:44	2022-03-24 10:52:44	DLRG Luckenwalde	dlrg-luckenwalde-17	\N	f
1783	2022-03-24 10:52:45	2022-03-24 10:52:45	Athena Bracciano	athena-bracciano-110	\N	f
1784	2022-03-24 10:52:45	2022-03-24 10:52:45	DLRG Niedersachsen	dlrg-niedersachsen-117	\N	f
1785	2022-03-24 10:52:45	2022-03-24 10:52:45	DLRG Buchholz United	dlrg-buchholz-united-22	\N	f
1786	2022-03-24 10:52:45	2022-03-24 10:52:45	Athena Bracciano	athena-bracciano-111	\N	f
1787	2022-03-24 10:52:45	2022-03-24 10:52:45	Kusel KiXXX	kusel-kixxx-28	\N	f
1788	2022-03-24 10:52:45	2022-03-24 10:52:45	RB Waddinxveen	rb-waddinxveen-19	\N	f
1789	2022-03-24 10:52:45	2022-03-24 10:52:45	Beacon Lifesaving Club	beacon-lifesaving-club-9	\N	f
1790	2022-03-24 10:52:45	2022-03-24 10:52:45	DLRG Buchholz United	dlrg-buchholz-united-23	\N	f
1791	2022-03-24 10:52:45	2022-03-24 10:52:45	Italy NT	italy-nt-76	\N	f
1792	2022-03-24 10:52:45	2022-03-24 10:52:45	DLRG Buchholz United	dlrg-buchholz-united-24	\N	f
1793	2022-03-24 10:52:45	2022-03-24 10:52:45	Athena Bracciano	athena-bracciano-112	\N	f
1794	2022-03-24 10:52:46	2022-03-24 10:52:46	RB Delft	rb-delft-50	\N	f
1795	2022-03-24 10:52:46	2022-03-24 10:52:46	RB Delft	rb-delft-51	\N	f
1796	2022-03-24 10:52:46	2022-03-24 10:52:46	RB Delft	rb-delft-52	\N	f
1797	2022-03-24 10:52:46	2022-03-24 10:52:46	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-23	\N	f
1798	2022-03-24 10:52:46	2022-03-24 10:52:46	Italy NT	italy-nt-77	\N	f
1799	2022-03-24 10:52:46	2022-03-24 10:52:46	Italy NT	italy-nt-78	\N	f
1800	2022-03-24 10:52:46	2022-03-24 10:52:46	Spain NT	spain-nt-74	\N	f
1801	2022-03-24 10:52:46	2022-03-24 10:52:46	France NT	france-nt-88	\N	f
1802	2022-03-24 10:52:46	2022-03-24 10:52:46	Belgium NT	belgium-nt-48	\N	f
1803	2022-03-24 10:52:47	2022-03-24 10:52:47	Nederland NT	nederland-nt-34	\N	f
1804	2022-03-24 10:52:47	2022-03-24 10:52:47	Spain NT	spain-nt-75	\N	f
1805	2022-03-24 10:52:47	2022-03-24 10:52:47	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-44	\N	f
1806	2022-03-24 10:52:47	2022-03-24 10:52:47	Athena Bracciano	athena-bracciano-113	\N	f
1807	2022-03-24 10:52:47	2022-03-24 10:52:47	France NT	france-nt-89	\N	f
1808	2022-03-24 10:52:47	2022-03-24 10:52:47	CKS Szczecin	cks-szczecin-45	\N	f
1809	2022-03-24 10:52:48	2022-03-24 10:52:48	Slaskie WOPR	slaskie-wopr-56	\N	f
1810	2022-03-24 10:52:48	2022-03-24 10:52:48	Accademia Di Salvamento	accademia-di-salvamento-100	\N	f
1811	2022-03-24 10:52:48	2022-03-24 10:52:48	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-52	\N	f
1812	2022-03-24 10:52:48	2022-03-24 10:52:48	DLRG Niedersachsen	dlrg-niedersachsen-118	\N	f
1813	2022-03-24 10:52:48	2022-03-24 10:52:48	Athena Bracciano	athena-bracciano-114	\N	f
1814	2022-03-24 10:52:48	2022-03-24 10:52:48	DLRG Niedersachsen	dlrg-niedersachsen-119	\N	f
1815	2022-03-24 10:52:48	2022-03-24 10:52:48	Athena Salvamento	athena-salvamento-64	\N	f
1816	2022-03-24 10:52:49	2022-03-24 10:52:49	Athena Salvamento	athena-salvamento-65	\N	f
1817	2022-03-24 10:52:49	2022-03-24 10:52:49	DLRG Guetersloh	dlrg-guetersloh-41	\N	f
1818	2022-03-24 10:52:49	2022-03-24 10:52:49	Hungarian NT	hungarian-nt-4	\N	f
1819	2022-03-24 10:52:49	2022-03-24 10:52:49	Italy NT	italy-nt-79	\N	f
1820	2022-03-24 10:52:49	2022-03-24 10:52:49	Spain NT	spain-nt-76	\N	f
1821	2022-03-24 10:52:49	2022-03-24 10:52:49	Italy NT	italy-nt-80	\N	f
1822	2022-03-24 10:52:49	2022-03-24 10:52:49	Polen NT	polen-nt-17	\N	f
1823	2022-03-24 10:52:49	2022-03-24 10:52:49	Spain NT	spain-nt-77	\N	f
1824	2022-03-24 10:52:49	2022-03-24 10:52:49	France NT	france-nt-90	\N	f
1825	2022-03-24 10:52:50	2022-03-24 10:52:50	ASD Gorizia Nuoto	asd-gorizia-nuoto-26	\N	f
1826	2022-03-24 10:52:50	2022-03-24 10:52:50	SAFA 2000	safa-2000-29	\N	f
1827	2022-03-24 10:52:50	2022-03-24 10:52:50	A.S.D. Sportiva Sturla	asd-sportiva-sturla-20	\N	f
1828	2022-03-24 10:52:50	2022-03-24 10:52:50	Athena Bracciano	athena-bracciano-115	\N	f
1829	2022-03-24 10:52:50	2022-03-24 10:52:50	DLRG Luckenwalde	dlrg-luckenwalde-18	\N	f
1830	2022-03-24 10:52:50	2022-03-24 10:52:50	ASD Rosetana Nuoto	asd-rosetana-nuoto-24	\N	f
1831	2022-03-24 10:52:50	2022-03-24 10:52:50	CKS Szczecin	cks-szczecin-46	\N	f
1832	2022-03-24 10:52:50	2022-03-24 10:52:50	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-53	\N	f
1833	2022-03-24 10:52:50	2022-03-24 10:52:50	France NT	france-nt-91	\N	f
1834	2022-03-24 10:52:51	2022-03-24 10:52:51	Accademia Di Salvamento	accademia-di-salvamento-101	\N	f
1835	2022-03-24 10:52:51	2022-03-24 10:52:51	MKS Szczecin	mks-szczecin-12	\N	f
1836	2022-03-24 10:52:51	2022-03-24 10:52:51	DLRG Buchholz United	dlrg-buchholz-united-25	\N	f
1837	2022-03-24 10:52:51	2022-03-24 10:52:51	Athena Salvamento	athena-salvamento-66	\N	f
1838	2022-03-24 10:52:51	2022-03-24 10:52:51	Slaskie WOPR	slaskie-wopr-57	\N	f
1839	2022-03-24 10:52:51	2022-03-24 10:52:51	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-54	\N	f
1840	2022-03-24 10:52:51	2022-03-24 10:52:51	Athena Bracciano	athena-bracciano-116	\N	f
1841	2022-03-24 10:52:51	2022-03-24 10:52:51	Accademia Di Salvamento	accademia-di-salvamento-102	\N	f
1842	2022-03-24 10:52:52	2022-03-24 10:52:52	DLRG Niedersachsen	dlrg-niedersachsen-120	\N	f
1843	2022-03-24 10:52:52	2022-03-24 10:52:52	RB Waddinxveen	rb-waddinxveen-20	\N	f
1844	2022-03-24 10:52:52	2022-03-24 10:52:52	RB Delft	rb-delft-53	\N	f
1845	2022-03-24 10:52:52	2022-03-24 10:52:52	Belgium NT	belgium-nt-49	\N	f
1846	2022-03-24 10:52:52	2022-03-24 10:52:52	Spain NT	spain-nt-78	\N	f
1847	2022-03-24 10:52:52	2022-03-24 10:52:52	DLRG Niedersachsen	dlrg-niedersachsen-121	\N	f
1848	2022-03-24 10:52:52	2022-03-24 10:52:52	France NT	france-nt-92	\N	f
1849	2022-03-24 10:52:52	2022-03-24 10:52:52	DLRG Niedersachsen	dlrg-niedersachsen-122	\N	f
1850	2022-03-24 10:52:53	2022-03-24 10:52:53	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-45	\N	f
1851	2022-03-24 10:52:53	2022-03-24 10:52:53	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-55	\N	f
1852	2022-03-24 10:52:53	2022-03-24 10:52:53	RB Heytse	rb-heytse-38	\N	f
1853	2022-03-24 10:52:53	2022-03-24 10:52:53	CKS Szczecin	cks-szczecin-47	\N	f
1854	2022-03-24 10:52:53	2022-03-24 10:52:53	Athena Bracciano	athena-bracciano-117	\N	f
1855	2022-03-24 10:52:53	2022-03-24 10:52:53	Kusel KiXXX	kusel-kixxx-29	\N	f
1856	2022-03-24 10:52:53	2022-03-24 10:52:53	Athena Salvamento	athena-salvamento-67	\N	f
1857	2022-03-24 10:52:53	2022-03-24 10:52:53	Italy NT	italy-nt-81	\N	f
1858	2022-03-24 10:52:54	2022-03-24 10:52:54	Accademia Di Salvamento	accademia-di-salvamento-103	\N	f
1859	2022-03-24 10:52:54	2022-03-24 10:52:54	Accademia Di Salvamento	accademia-di-salvamento-104	\N	f
1860	2022-03-24 10:52:54	2022-03-24 10:52:54	Accademia Di Salvamento	accademia-di-salvamento-105	\N	f
1861	2022-03-24 10:52:54	2022-03-24 10:52:54	Athena Salvamento	athena-salvamento-68	\N	f
1862	2022-03-24 10:52:54	2022-03-24 10:52:54	Athena Bracciano	athena-bracciano-118	\N	f
1863	2022-03-24 10:52:54	2022-03-24 10:52:54	Italy NT	italy-nt-82	\N	f
1864	2022-03-24 10:52:55	2022-03-24 10:52:55	Spain NT	spain-nt-79	\N	f
1865	2022-03-24 10:52:55	2022-03-24 10:52:55	France NT	france-nt-93	\N	f
1866	2022-03-24 10:52:55	2022-03-24 10:52:55	Liege Sauvetage Club	liege-sauvetage-club-33	\N	f
1867	2022-03-24 10:52:55	2022-03-24 10:52:55	Nederland NT	nederland-nt-35	\N	f
1868	2022-03-24 10:52:55	2022-03-24 10:52:55	Slaskie WOPR	slaskie-wopr-58	\N	f
1869	2022-03-24 10:52:55	2022-03-24 10:52:55	Slaskie WOPR	slaskie-wopr-59	\N	f
1870	2022-03-24 10:52:55	2022-03-24 10:52:55	DLRG Guetersloh	dlrg-guetersloh-42	\N	f
1871	2022-03-24 10:52:55	2022-03-24 10:52:55	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-56	\N	f
1872	2022-03-24 10:52:55	2022-03-24 10:52:55	DLRG Guetersloh	dlrg-guetersloh-43	\N	f
1873	2022-03-24 10:52:55	2022-03-24 10:52:55	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-46	\N	f
1874	2022-03-24 10:52:56	2022-03-24 10:52:56	France NT	france-nt-94	\N	f
1875	2022-03-24 10:52:56	2022-03-24 10:52:56	Italy NT	italy-nt-83	\N	f
1876	2022-03-24 10:52:56	2022-03-24 10:52:56	SAFA 2000	safa-2000-30	\N	f
1877	2022-03-24 10:52:56	2022-03-24 10:52:56	DLRG Niedersachsen	dlrg-niedersachsen-123	\N	f
1878	2022-03-24 10:52:56	2022-03-24 10:52:56	DLRG Niedersachsen	dlrg-niedersachsen-124	\N	f
1879	2022-03-24 10:52:56	2022-03-24 10:52:56	CKS Szczecin	cks-szczecin-48	\N	f
1880	2022-03-24 10:52:56	2022-03-24 10:52:56	Accademia Di Salvamento	accademia-di-salvamento-106	\N	f
1881	2022-03-24 10:52:56	2022-03-24 10:52:56	Polen NT	polen-nt-18	\N	f
1882	2022-03-24 10:52:56	2022-03-24 10:52:56	ASD Rosetana Nuoto	asd-rosetana-nuoto-25	\N	f
1883	2022-03-24 10:52:57	2022-03-24 10:52:57	Athena Bracciano	athena-bracciano-119	\N	f
1884	2022-03-24 10:52:57	2022-03-24 10:52:57	MKS Szczecin	mks-szczecin-13	\N	f
1885	2022-03-24 10:52:57	2022-03-24 10:52:57	Athena Salvamento	athena-salvamento-69	\N	f
1886	2022-03-24 10:52:57	2022-03-24 10:52:57	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-57	\N	f
1887	2022-03-24 10:52:57	2022-03-24 10:52:57	Belgium NT	belgium-nt-50	\N	f
1888	2022-03-24 10:52:57	2022-03-24 10:52:57	RB Delft	rb-delft-54	\N	f
1889	2022-03-24 10:52:57	2022-03-24 10:52:57	DLRG Guetersloh	dlrg-guetersloh-44	\N	f
1890	2022-03-24 10:52:57	2022-03-24 10:52:57	DLRG Buchholz United	dlrg-buchholz-united-26	\N	f
1891	2022-03-24 10:52:57	2022-03-24 10:52:57	Athena Bracciano	athena-bracciano-120	\N	f
1892	2022-03-24 10:52:58	2022-03-24 10:52:58	Spain NT	spain-nt-80	\N	f
1893	2022-03-24 10:52:58	2022-03-24 10:52:58	Liege Sauvetage Club	liege-sauvetage-club-34	\N	f
1894	2022-03-24 10:52:58	2022-03-24 10:52:58	RB Waddinxveen	rb-waddinxveen-21	\N	f
1895	2022-03-24 10:52:58	2022-03-24 10:52:58	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-58	\N	f
1896	2022-03-24 10:52:58	2022-03-24 10:52:58	Beacon Lifesaving Club	beacon-lifesaving-club-10	\N	f
1897	2022-03-24 10:52:58	2022-03-24 10:52:58	RB Delft	rb-delft-55	\N	f
1898	2022-03-24 10:52:58	2022-03-24 10:52:58	RB Delft	rb-delft-56	\N	f
1899	2022-03-24 10:52:58	2022-03-24 10:52:58	RB Delft	rb-delft-57	\N	f
1900	2022-03-24 10:52:58	2022-03-24 10:52:58	Accademia Di Salvamento	accademia-di-salvamento-107	\N	f
1901	2022-03-24 10:52:59	2022-03-24 10:52:59	Accademia Di Salvamento	accademia-di-salvamento-108	\N	f
1902	2022-03-24 10:52:59	2022-03-24 10:52:59	Accademia Di Salvamento	accademia-di-salvamento-109	\N	f
1903	2022-03-24 10:52:59	2022-03-24 10:52:59	Accademia Di Salvamento	accademia-di-salvamento-110	\N	f
1904	2022-03-24 10:52:59	2022-03-24 10:52:59	ASD Gorizia Nuoto	asd-gorizia-nuoto-27	\N	f
1905	2022-03-24 10:52:59	2022-03-24 10:52:59	RB Waddinxveen	rb-waddinxveen-22	\N	f
1906	2022-03-24 10:52:59	2022-03-24 10:52:59	Spain NT	spain-nt-81	\N	f
1907	2022-03-24 10:52:59	2022-03-24 10:52:59	France NT	france-nt-95	\N	f
1908	2022-03-24 10:52:59	2022-03-24 10:52:59	Italy NT	italy-nt-84	\N	f
1909	2022-03-24 10:52:59	2022-03-24 10:52:59	Kusel KiXXX	kusel-kixxx-30	\N	f
1910	2022-03-24 10:52:59	2022-03-24 10:52:59	Slaskie WOPR	slaskie-wopr-60	\N	f
1911	2022-03-24 10:53:00	2022-03-24 10:53:00	Slaskie WOPR	slaskie-wopr-61	\N	f
1912	2022-03-24 10:53:00	2022-03-24 10:53:00	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-47	\N	f
1913	2022-03-24 10:53:00	2022-03-24 10:53:00	France NT	france-nt-96	\N	f
1914	2022-03-24 10:53:00	2022-03-24 10:53:00	Belgium NT	belgium-nt-51	\N	f
1915	2022-03-24 10:53:00	2022-03-24 10:53:00	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-15	\N	f
1916	2022-03-24 10:53:00	2022-03-24 10:53:00	SAFA 2000	safa-2000-31	\N	f
1917	2022-03-24 10:53:00	2022-03-24 10:53:00	In Sport Rane Rosse	in-sport-rane-rosse-59	\N	f
1918	2022-03-24 10:53:00	2022-03-24 10:53:00	Accademia Di Salvamento	accademia-di-salvamento-111	\N	f
1919	2022-03-24 10:53:00	2022-03-24 10:53:00	Accademia Di Salvamento	accademia-di-salvamento-112	\N	f
1920	2022-03-24 10:53:00	2022-03-24 10:53:00	France NT	france-nt-97	\N	f
1921	2022-03-24 10:53:00	2022-03-24 10:53:00	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-48	\N	f
1922	2022-03-24 10:53:00	2022-03-24 10:53:00	Liege Sauvetage Club	liege-sauvetage-club-35	\N	f
1923	2022-03-24 10:53:01	2022-03-24 10:53:01	Slaskie WOPR	slaskie-wopr-62	\N	f
1924	2022-03-24 10:53:01	2022-03-24 10:53:01	In Sport Rane Rosse	in-sport-rane-rosse-60	\N	f
1925	2022-03-24 10:53:01	2022-03-24 10:53:01	Athena Salvamento	athena-salvamento-70	\N	f
1926	2022-03-24 10:53:01	2022-03-24 10:53:01	DLRG Niedersachsen	dlrg-niedersachsen-125	\N	f
1927	2022-03-24 10:53:01	2022-03-24 10:53:01	DLRG Niedersachsen	dlrg-niedersachsen-126	\N	f
1928	2022-03-24 10:53:01	2022-03-24 10:53:01	Liege Sauvetage Club	liege-sauvetage-club-36	\N	f
1929	2022-03-24 10:53:01	2022-03-24 10:53:01	Rctal	rctal-26	\N	f
1930	2022-03-24 10:53:01	2022-03-24 10:53:01	Sint-Truidense RC	sint-truidense-rc-28	\N	f
1931	2022-03-24 10:53:02	2022-03-24 10:53:02	RB Heytse	rb-heytse-39	\N	f
1932	2022-03-24 10:53:02	2022-03-24 10:53:02	CKS Szczecin	cks-szczecin-49	\N	f
1933	2022-03-24 10:53:02	2022-03-24 10:53:02	Athena Salvamento	athena-salvamento-71	\N	f
1934	2022-03-24 10:53:02	2022-03-24 10:53:02	Sint-Truidense RC	sint-truidense-rc-29	\N	f
1935	2022-03-24 10:53:02	2022-03-24 10:53:02	Liege Sauvetage Club	liege-sauvetage-club-37	\N	f
1936	2022-03-24 10:53:02	2022-03-24 10:53:02	DLRG Niedersachsen	dlrg-niedersachsen-127	\N	f
1937	2022-03-24 10:53:02	2022-03-24 10:53:02	RB Heytse	rb-heytse-40	\N	f
1938	2022-03-24 10:53:02	2022-03-24 10:53:02	DLRG Guetersloh	dlrg-guetersloh-45	\N	f
1939	2022-03-24 10:53:02	2022-03-24 10:53:02	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-59	\N	f
1940	2022-03-24 10:53:02	2022-03-24 10:53:02	DLRG Niedersachsen	dlrg-niedersachsen-128	\N	f
1941	2022-03-24 10:53:02	2022-03-24 10:53:02	Slaskie WOPR	slaskie-wopr-63	\N	f
1942	2022-03-24 10:53:03	2022-03-24 10:53:03	RB Heytse	rb-heytse-41	\N	f
1943	2022-03-24 10:53:03	2022-03-24 10:53:03	DLRG Niedersachsen	dlrg-niedersachsen-129	\N	f
1944	2022-03-24 10:53:03	2022-03-24 10:53:03	Italy NT	italy-nt-85	\N	f
1945	2022-03-24 10:53:03	2022-03-24 10:53:03	Italy NT	italy-nt-86	\N	f
1946	2022-03-24 10:53:03	2022-03-24 10:53:03	Belgium NT	belgium-nt-52	\N	f
1947	2022-03-24 10:53:03	2022-03-24 10:53:03	France NT	france-nt-98	\N	f
1948	2022-03-24 10:53:03	2022-03-24 10:53:03	Nederland NT	nederland-nt-36	\N	f
1949	2022-03-24 10:53:03	2022-03-24 10:53:03	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-49	\N	f
1950	2022-03-24 10:53:03	2022-03-24 10:53:03	Spain NT	spain-nt-82	\N	f
1951	2022-03-24 10:53:03	2022-03-24 10:53:03	Spain NT	spain-nt-83	\N	f
1952	2022-03-24 10:53:03	2022-03-24 10:53:03	France NT	france-nt-99	\N	f
1953	2022-03-24 10:53:04	2022-03-24 10:53:04	CKS Szczecin	cks-szczecin-50	\N	f
1954	2022-03-24 10:53:04	2022-03-24 10:53:04	Accademia Di Salvamento	accademia-di-salvamento-113	\N	f
1955	2022-03-24 10:53:04	2022-03-24 10:53:04	Accademia Di Salvamento	accademia-di-salvamento-114	\N	f
1956	2022-03-24 10:53:04	2022-03-24 10:53:04	Athena Bracciano	athena-bracciano-121	\N	f
1957	2022-03-24 10:53:04	2022-03-24 10:53:04	DLRG Niedersachsen	dlrg-niedersachsen-130	\N	f
1958	2022-03-24 10:53:04	2022-03-24 10:53:04	DLRG Luckenwalde	dlrg-luckenwalde-19	\N	f
1959	2022-03-24 10:53:04	2022-03-24 10:53:04	Nederland NT	nederland-nt-37	\N	f
1960	2022-03-24 10:53:04	2022-03-24 10:53:04	DLRG Bad Oldesloe	dlrg-bad-oldesloe-8	\N	f
1961	2022-03-24 10:53:04	2022-03-24 10:53:04	DLRG Niedersachsen	dlrg-niedersachsen-131	\N	f
1962	2022-03-24 10:53:05	2022-03-24 10:53:05	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-24	\N	f
1963	2022-03-24 10:53:05	2022-03-24 10:53:05	Belgium NT	belgium-nt-53	\N	f
1964	2022-03-24 10:53:05	2022-03-24 10:53:05	Belgium NT	belgium-nt-54	\N	f
1965	2022-03-24 10:53:05	2022-03-24 10:53:05	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-25	\N	f
1966	2022-03-24 10:53:05	2022-03-24 10:53:05	DLRG Niedersachsen	dlrg-niedersachsen-132	\N	f
1967	2022-03-24 10:53:05	2022-03-24 10:53:05	Italy NT	italy-nt-87	\N	f
1968	2022-03-24 10:53:05	2022-03-24 10:53:05	Italy NT	italy-nt-88	\N	f
1969	2022-03-24 10:53:05	2022-03-24 10:53:05	ASD Gorizia Nuoto	asd-gorizia-nuoto-28	\N	f
1970	2022-03-24 10:53:05	2022-03-24 10:53:05	Spain NT	spain-nt-84	\N	f
1971	2022-03-24 10:53:05	2022-03-24 10:53:05	SAFA 2000	safa-2000-32	\N	f
1972	2022-03-24 10:53:05	2022-03-24 10:53:05	Polen NT	polen-nt-19	\N	f
1973	2022-03-24 10:53:06	2022-03-24 10:53:06	In Sport Rane Rosse	in-sport-rane-rosse-61	\N	f
1974	2022-03-24 10:53:06	2022-03-24 10:53:06	Beacon Lifesaving Club	beacon-lifesaving-club-11	\N	f
1975	2022-03-24 10:53:06	2022-03-24 10:53:06	France NT	france-nt-100	\N	f
1976	2022-03-24 10:53:34	2022-03-24 10:53:34	Italy NT	italy-nt-89	\N	f
1977	2022-03-24 10:53:34	2022-03-24 10:53:34	SAFA 2000	safa-2000-33	\N	f
1978	2022-03-24 10:53:34	2022-03-24 10:53:34	Accademia Di Salvamento	accademia-di-salvamento-115	\N	f
1979	2022-03-24 10:53:34	2022-03-24 10:53:34	Spain NT	spain-nt-85	\N	f
1980	2022-03-24 10:53:34	2022-03-24 10:53:34	France NT	france-nt-101	\N	f
1981	2022-03-24 10:53:34	2022-03-24 10:53:34	Accademia Di Salvamento	accademia-di-salvamento-116	\N	f
1982	2022-03-24 10:53:34	2022-03-24 10:53:34	Belgium NT	belgium-nt-55	\N	f
1983	2022-03-24 10:53:34	2022-03-24 10:53:34	Kusel KiXXX	kusel-kixxx-31	\N	f
1984	2022-03-24 10:53:34	2022-03-24 10:53:34	In Sport Rane Rosse	in-sport-rane-rosse-62	\N	f
1985	2022-03-24 10:53:34	2022-03-24 10:53:34	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-50	\N	f
1986	2022-03-24 10:53:34	2022-03-24 10:53:34	Athena Bracciano	athena-bracciano-122	\N	f
1987	2022-03-24 10:53:35	2022-03-24 10:53:35	Slaskie WOPR	slaskie-wopr-64	\N	f
1988	2022-03-24 10:53:35	2022-03-24 10:53:35	Slaskie WOPR	slaskie-wopr-65	\N	f
1989	2022-03-24 10:53:35	2022-03-24 10:53:35	DLRG Niedersachsen	dlrg-niedersachsen-133	\N	f
1990	2022-03-24 10:53:35	2022-03-24 10:53:35	France NT	france-nt-102	\N	f
1991	2022-03-24 10:53:35	2022-03-24 10:53:35	Athena Bracciano	athena-bracciano-123	\N	f
1992	2022-03-24 10:53:35	2022-03-24 10:53:35	Athena Salvamento	athena-salvamento-72	\N	f
1993	2022-03-24 10:53:35	2022-03-24 10:53:35	In Sport Rane Rosse	in-sport-rane-rosse-63	\N	f
1994	2022-03-24 10:53:35	2022-03-24 10:53:35	Sint-Truidense RC	sint-truidense-rc-30	\N	f
1995	2022-03-24 10:53:35	2022-03-24 10:53:35	ASD Rosetana Nuoto	asd-rosetana-nuoto-26	\N	f
1996	2022-03-24 10:53:36	2022-03-24 10:53:36	DLRG Niedersachsen	dlrg-niedersachsen-134	\N	f
1997	2022-03-24 10:53:36	2022-03-24 10:53:36	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-7	\N	f
1998	2022-03-24 10:53:36	2022-03-24 10:53:36	Rctal	rctal-27	\N	f
1999	2022-03-24 10:53:36	2022-03-24 10:53:36	DLRG Niedersachsen	dlrg-niedersachsen-135	\N	f
2000	2022-03-24 10:53:36	2022-03-24 10:53:36	Athena Bracciano	athena-bracciano-124	\N	f
2001	2022-03-24 10:53:36	2022-03-24 10:53:36	Sint-Truidense RC	sint-truidense-rc-31	\N	f
2002	2022-03-24 10:53:36	2022-03-24 10:53:36	DLRG Niedersachsen	dlrg-niedersachsen-136	\N	f
2003	2022-03-24 10:53:36	2022-03-24 10:53:36	Athena Salvamento	athena-salvamento-73	\N	f
2004	2022-03-24 10:53:36	2022-03-24 10:53:36	Accademia Di Salvamento	accademia-di-salvamento-117	\N	f
2005	2022-03-24 10:53:37	2022-03-24 10:53:37	Athena Salvamento	athena-salvamento-74	\N	f
2006	2022-03-24 10:53:37	2022-03-24 10:53:37	Nederland NT	nederland-nt-38	\N	f
2007	2022-03-24 10:53:37	2022-03-24 10:53:37	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-60	\N	f
2008	2022-03-24 10:53:37	2022-03-24 10:53:37	Rctal	rctal-28	\N	f
2009	2022-03-24 10:53:37	2022-03-24 10:53:37	DLRG Guetersloh	dlrg-guetersloh-46	\N	f
2010	2022-03-24 10:53:37	2022-03-24 10:53:37	DLRG Guetersloh	dlrg-guetersloh-47	\N	f
2011	2022-03-24 10:53:37	2022-03-24 10:53:37	Athena Bracciano	athena-bracciano-125	\N	f
2012	2022-03-24 10:53:37	2022-03-24 10:53:37	RB Delft	rb-delft-58	\N	f
2013	2022-03-24 10:53:37	2022-03-24 10:53:37	DLRG Guetersloh	dlrg-guetersloh-48	\N	f
2014	2022-03-24 10:53:37	2022-03-24 10:53:37	Italy NT	italy-nt-90	\N	f
2015	2022-03-24 10:53:37	2022-03-24 10:53:37	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-26	\N	f
2016	2022-03-24 10:53:37	2022-03-24 10:53:37	Italy NT	italy-nt-91	\N	f
2017	2022-03-24 10:53:38	2022-03-24 10:53:38	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-27	\N	f
2018	2022-03-24 10:53:38	2022-03-24 10:53:38	DLRG Bad Oldesloe	dlrg-bad-oldesloe-9	\N	f
2019	2022-03-24 10:53:38	2022-03-24 10:53:38	ASD Gorizia Nuoto	asd-gorizia-nuoto-29	\N	f
2020	2022-03-24 10:53:38	2022-03-24 10:53:38	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-28	\N	f
2021	2022-03-24 10:53:38	2022-03-24 10:53:38	France NT	france-nt-103	\N	f
2022	2022-03-24 10:53:38	2022-03-24 10:53:38	Spain NT	spain-nt-86	\N	f
2023	2022-03-24 10:53:38	2022-03-24 10:53:38	France NT	france-nt-104	\N	f
2024	2022-03-24 10:53:38	2022-03-24 10:53:38	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-51	\N	f
2025	2022-03-24 10:53:38	2022-03-24 10:53:38	Belgium NT	belgium-nt-56	\N	f
2026	2022-03-24 10:53:38	2022-03-24 10:53:38	Athena Bracciano	athena-bracciano-126	\N	f
2027	2022-03-24 10:53:38	2022-03-24 10:53:38	Nederland NT	nederland-nt-39	\N	f
2028	2022-03-24 10:53:38	2022-03-24 10:53:38	Kusel KiXXX	kusel-kixxx-32	\N	f
2029	2022-03-24 10:53:39	2022-03-24 10:53:39	Athena Bracciano	athena-bracciano-127	\N	f
2030	2022-03-24 10:53:39	2022-03-24 10:53:39	Athena Bracciano	athena-bracciano-128	\N	f
2031	2022-03-24 10:53:39	2022-03-24 10:53:39	DLRG Niedersachsen	dlrg-niedersachsen-137	\N	f
2032	2022-03-24 10:53:39	2022-03-24 10:53:39	DLRG Luckenwalde	dlrg-luckenwalde-20	\N	f
2033	2022-03-24 10:53:39	2022-03-24 10:53:39	DLRG Niedersachsen	dlrg-niedersachsen-138	\N	f
2034	2022-03-24 10:53:39	2022-03-24 10:53:39	A.S.D. Sportiva Sturla	asd-sportiva-sturla-21	\N	f
2035	2022-03-24 10:53:40	2022-03-24 10:53:40	Spain NT	spain-nt-87	\N	f
2036	2022-03-24 10:53:40	2022-03-24 10:53:40	SAFA 2000	safa-2000-34	\N	f
2037	2022-03-24 10:53:40	2022-03-24 10:53:40	CKS Szczecin	cks-szczecin-51	\N	f
2038	2022-03-24 10:53:40	2022-03-24 10:53:40	ASD Gorizia Nuoto	asd-gorizia-nuoto-30	\N	f
2039	2022-03-24 10:53:40	2022-03-24 10:53:40	CKS Szczecin	cks-szczecin-52	\N	f
2040	2022-03-24 10:53:40	2022-03-24 10:53:40	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-16	\N	f
2041	2022-03-24 10:53:40	2022-03-24 10:53:40	ASD Gorizia Nuoto	asd-gorizia-nuoto-31	\N	f
2042	2022-03-24 10:53:40	2022-03-24 10:53:40	In Sport Rane Rosse	in-sport-rane-rosse-64	\N	f
2043	2022-03-24 10:53:40	2022-03-24 10:53:40	In Sport Rane Rosse	in-sport-rane-rosse-65	\N	f
2044	2022-03-24 10:53:40	2022-03-24 10:53:40	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-17	\N	f
2045	2022-03-24 10:53:40	2022-03-24 10:53:40	Slaskie WOPR	slaskie-wopr-66	\N	f
2046	2022-03-24 10:53:40	2022-03-24 10:53:40	RB Heytse	rb-heytse-42	\N	f
2047	2022-03-24 10:53:41	2022-03-24 10:53:41	Belgium NT	belgium-nt-57	\N	f
2048	2022-03-24 10:53:41	2022-03-24 10:53:41	RB Heytse	rb-heytse-43	\N	f
2049	2022-03-24 10:53:41	2022-03-24 10:53:41	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-61	\N	f
2050	2022-03-24 10:53:41	2022-03-24 10:53:41	Athena Bracciano	athena-bracciano-129	\N	f
2051	2022-03-24 10:53:41	2022-03-24 10:53:41	Athena Salvamento	athena-salvamento-75	\N	f
2052	2022-03-24 10:53:41	2022-03-24 10:53:41	DLRG Luckenwalde	dlrg-luckenwalde-21	\N	f
2053	2022-03-24 10:53:41	2022-03-24 10:53:41	Athena Bracciano	athena-bracciano-130	\N	f
2054	2022-03-24 10:53:42	2022-03-24 10:53:42	DLRG Niedersachsen	dlrg-niedersachsen-139	\N	f
2055	2022-03-24 10:53:42	2022-03-24 10:53:42	DLRG Buchholz United	dlrg-buchholz-united-27	\N	f
2056	2022-03-24 10:53:42	2022-03-24 10:53:42	Athena Bracciano	athena-bracciano-131	\N	f
2057	2022-03-24 10:53:42	2022-03-24 10:53:42	Kusel KiXXX	kusel-kixxx-33	\N	f
2058	2022-03-24 10:53:42	2022-03-24 10:53:42	RB Waddinxveen	rb-waddinxveen-23	\N	f
2059	2022-03-24 10:53:42	2022-03-24 10:53:42	Beacon Lifesaving Club	beacon-lifesaving-club-12	\N	f
2060	2022-03-24 10:53:42	2022-03-24 10:53:42	DLRG Buchholz United	dlrg-buchholz-united-28	\N	f
2061	2022-03-24 10:53:42	2022-03-24 10:53:42	Italy NT	italy-nt-92	\N	f
2062	2022-03-24 10:53:42	2022-03-24 10:53:42	DLRG Buchholz United	dlrg-buchholz-united-29	\N	f
2063	2022-03-24 10:53:42	2022-03-24 10:53:42	Athena Bracciano	athena-bracciano-132	\N	f
2064	2022-03-24 10:53:42	2022-03-24 10:53:42	RB Delft	rb-delft-59	\N	f
2065	2022-03-24 10:53:43	2022-03-24 10:53:43	RB Delft	rb-delft-60	\N	f
2066	2022-03-24 10:53:43	2022-03-24 10:53:43	RB Delft	rb-delft-61	\N	f
2067	2022-03-24 10:53:43	2022-03-24 10:53:43	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-29	\N	f
2068	2022-03-24 10:53:43	2022-03-24 10:53:43	Italy NT	italy-nt-93	\N	f
2069	2022-03-24 10:53:43	2022-03-24 10:53:43	Italy NT	italy-nt-94	\N	f
2070	2022-03-24 10:53:43	2022-03-24 10:53:43	Spain NT	spain-nt-88	\N	f
2071	2022-03-24 10:53:43	2022-03-24 10:53:43	France NT	france-nt-105	\N	f
2072	2022-03-24 10:53:44	2022-03-24 10:53:44	Belgium NT	belgium-nt-58	\N	f
2073	2022-03-24 10:53:44	2022-03-24 10:53:44	Nederland NT	nederland-nt-40	\N	f
2074	2022-03-24 10:53:44	2022-03-24 10:53:44	Spain NT	spain-nt-89	\N	f
2075	2022-03-24 10:53:44	2022-03-24 10:53:44	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-52	\N	f
2076	2022-03-24 10:53:44	2022-03-24 10:53:44	Athena Bracciano	athena-bracciano-133	\N	f
2077	2022-03-24 10:53:44	2022-03-24 10:53:44	France NT	france-nt-106	\N	f
2078	2022-03-24 10:53:44	2022-03-24 10:53:44	CKS Szczecin	cks-szczecin-53	\N	f
2079	2022-03-24 10:53:44	2022-03-24 10:53:44	Slaskie WOPR	slaskie-wopr-67	\N	f
2080	2022-03-24 10:53:44	2022-03-24 10:53:44	Accademia Di Salvamento	accademia-di-salvamento-118	\N	f
2081	2022-03-24 10:53:45	2022-03-24 10:53:45	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-62	\N	f
2082	2022-03-24 10:53:45	2022-03-24 10:53:45	DLRG Niedersachsen	dlrg-niedersachsen-140	\N	f
2083	2022-03-24 10:53:45	2022-03-24 10:53:45	Athena Bracciano	athena-bracciano-134	\N	f
2084	2022-03-24 10:53:45	2022-03-24 10:53:45	DLRG Niedersachsen	dlrg-niedersachsen-141	\N	f
2085	2022-03-24 10:53:45	2022-03-24 10:53:45	Athena Salvamento	athena-salvamento-76	\N	f
2086	2022-03-24 10:53:45	2022-03-24 10:53:45	Athena Salvamento	athena-salvamento-77	\N	f
2087	2022-03-24 10:53:45	2022-03-24 10:53:45	DLRG Guetersloh	dlrg-guetersloh-49	\N	f
2088	2022-03-24 10:53:46	2022-03-24 10:53:46	Hungarian NT	hungarian-nt-5	\N	f
2089	2022-03-24 10:53:46	2022-03-24 10:53:46	Italy NT	italy-nt-95	\N	f
2090	2022-03-24 10:53:46	2022-03-24 10:53:46	Spain NT	spain-nt-90	\N	f
2091	2022-03-24 10:53:46	2022-03-24 10:53:46	Italy NT	italy-nt-96	\N	f
2092	2022-03-24 10:53:46	2022-03-24 10:53:46	Polen NT	polen-nt-20	\N	f
2093	2022-03-24 10:53:46	2022-03-24 10:53:46	Spain NT	spain-nt-91	\N	f
2094	2022-03-24 10:53:46	2022-03-24 10:53:46	France NT	france-nt-107	\N	f
2095	2022-03-24 10:53:47	2022-03-24 10:53:47	ASD Gorizia Nuoto	asd-gorizia-nuoto-32	\N	f
2096	2022-03-24 10:53:47	2022-03-24 10:53:47	SAFA 2000	safa-2000-35	\N	f
2097	2022-03-24 10:53:47	2022-03-24 10:53:47	A.S.D. Sportiva Sturla	asd-sportiva-sturla-22	\N	f
2098	2022-03-24 10:53:47	2022-03-24 10:53:47	Athena Bracciano	athena-bracciano-135	\N	f
2099	2022-03-24 10:53:47	2022-03-24 10:53:47	DLRG Luckenwalde	dlrg-luckenwalde-22	\N	f
2100	2022-03-24 10:53:47	2022-03-24 10:53:47	ASD Rosetana Nuoto	asd-rosetana-nuoto-27	\N	f
2101	2022-03-24 10:53:47	2022-03-24 10:53:47	CKS Szczecin	cks-szczecin-54	\N	f
2102	2022-03-24 10:53:47	2022-03-24 10:53:47	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-63	\N	f
2103	2022-03-24 10:53:47	2022-03-24 10:53:47	France NT	france-nt-108	\N	f
2104	2022-03-24 10:53:48	2022-03-24 10:53:48	Accademia Di Salvamento	accademia-di-salvamento-119	\N	f
2105	2022-03-24 10:53:48	2022-03-24 10:53:48	MKS Szczecin	mks-szczecin-14	\N	f
2106	2022-03-24 10:53:48	2022-03-24 10:53:48	DLRG Buchholz United	dlrg-buchholz-united-30	\N	f
2107	2022-03-24 10:53:48	2022-03-24 10:53:48	Athena Salvamento	athena-salvamento-78	\N	f
2108	2022-03-24 10:53:48	2022-03-24 10:53:48	Slaskie WOPR	slaskie-wopr-68	\N	f
2109	2022-03-24 10:53:48	2022-03-24 10:53:48	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-64	\N	f
2110	2022-03-24 10:53:48	2022-03-24 10:53:48	Athena Bracciano	athena-bracciano-136	\N	f
2111	2022-03-24 10:53:49	2022-03-24 10:53:49	Accademia Di Salvamento	accademia-di-salvamento-120	\N	f
2112	2022-03-24 10:53:49	2022-03-24 10:53:49	DLRG Niedersachsen	dlrg-niedersachsen-142	\N	f
2113	2022-03-24 10:53:49	2022-03-24 10:53:49	RB Waddinxveen	rb-waddinxveen-24	\N	f
2114	2022-03-24 10:53:49	2022-03-24 10:53:49	RB Delft	rb-delft-62	\N	f
2115	2022-03-24 10:53:49	2022-03-24 10:53:49	Belgium NT	belgium-nt-59	\N	f
2116	2022-03-24 10:53:49	2022-03-24 10:53:49	Spain NT	spain-nt-92	\N	f
2117	2022-03-24 10:53:50	2022-03-24 10:53:50	DLRG Niedersachsen	dlrg-niedersachsen-143	\N	f
2118	2022-03-24 10:53:50	2022-03-24 10:53:50	France NT	france-nt-109	\N	f
2119	2022-03-24 10:53:50	2022-03-24 10:53:50	DLRG Niedersachsen	dlrg-niedersachsen-144	\N	f
2120	2022-03-24 10:53:50	2022-03-24 10:53:50	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-53	\N	f
2121	2022-03-24 10:53:50	2022-03-24 10:53:50	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-65	\N	f
2122	2022-03-24 10:53:50	2022-03-24 10:53:50	RB Heytse	rb-heytse-44	\N	f
2123	2022-03-24 10:53:50	2022-03-24 10:53:50	CKS Szczecin	cks-szczecin-55	\N	f
2124	2022-03-24 10:53:50	2022-03-24 10:53:50	Athena Bracciano	athena-bracciano-137	\N	f
2125	2022-03-24 10:53:50	2022-03-24 10:53:50	Kusel KiXXX	kusel-kixxx-34	\N	f
2126	2022-03-24 10:53:51	2022-03-24 10:53:51	Athena Salvamento	athena-salvamento-79	\N	f
2127	2022-03-24 10:53:51	2022-03-24 10:53:51	Italy NT	italy-nt-97	\N	f
2128	2022-03-24 10:53:51	2022-03-24 10:53:51	Accademia Di Salvamento	accademia-di-salvamento-121	\N	f
2129	2022-03-24 10:53:51	2022-03-24 10:53:51	Accademia Di Salvamento	accademia-di-salvamento-122	\N	f
2130	2022-03-24 10:53:51	2022-03-24 10:53:51	Accademia Di Salvamento	accademia-di-salvamento-123	\N	f
2131	2022-03-24 10:53:51	2022-03-24 10:53:51	Athena Salvamento	athena-salvamento-80	\N	f
2132	2022-03-24 10:53:52	2022-03-24 10:53:52	Athena Bracciano	athena-bracciano-138	\N	f
2133	2022-03-24 10:53:52	2022-03-24 10:53:52	Italy NT	italy-nt-98	\N	f
2134	2022-03-24 10:53:52	2022-03-24 10:53:52	Spain NT	spain-nt-93	\N	f
2135	2022-03-24 10:53:52	2022-03-24 10:53:52	France NT	france-nt-110	\N	f
2136	2022-03-24 10:53:52	2022-03-24 10:53:52	Liege Sauvetage Club	liege-sauvetage-club-38	\N	f
2137	2022-03-24 10:53:52	2022-03-24 10:53:52	Nederland NT	nederland-nt-41	\N	f
2138	2022-03-24 10:53:53	2022-03-24 10:53:53	Slaskie WOPR	slaskie-wopr-69	\N	f
2139	2022-03-24 10:53:53	2022-03-24 10:53:53	Slaskie WOPR	slaskie-wopr-70	\N	f
2140	2022-03-24 10:53:53	2022-03-24 10:53:53	DLRG Guetersloh	dlrg-guetersloh-50	\N	f
2141	2022-03-24 10:53:53	2022-03-24 10:53:53	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-66	\N	f
2142	2022-03-24 10:53:53	2022-03-24 10:53:53	DLRG Guetersloh	dlrg-guetersloh-51	\N	f
2143	2022-03-24 10:53:53	2022-03-24 10:53:53	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-54	\N	f
2144	2022-03-24 10:53:53	2022-03-24 10:53:53	France NT	france-nt-111	\N	f
2145	2022-03-24 10:53:53	2022-03-24 10:53:53	Italy NT	italy-nt-99	\N	f
2146	2022-03-24 10:53:53	2022-03-24 10:53:53	SAFA 2000	safa-2000-36	\N	f
2147	2022-03-24 10:53:54	2022-03-24 10:53:54	DLRG Niedersachsen	dlrg-niedersachsen-145	\N	f
2148	2022-03-24 10:53:54	2022-03-24 10:53:54	DLRG Niedersachsen	dlrg-niedersachsen-146	\N	f
2149	2022-03-24 10:53:54	2022-03-24 10:53:54	CKS Szczecin	cks-szczecin-56	\N	f
2150	2022-03-24 10:53:54	2022-03-24 10:53:54	Accademia Di Salvamento	accademia-di-salvamento-124	\N	f
2151	2022-03-24 10:53:54	2022-03-24 10:53:54	Polen NT	polen-nt-21	\N	f
2152	2022-03-24 10:53:54	2022-03-24 10:53:54	ASD Rosetana Nuoto	asd-rosetana-nuoto-28	\N	f
2153	2022-03-24 10:53:55	2022-03-24 10:53:55	Athena Bracciano	athena-bracciano-139	\N	f
2154	2022-03-24 10:53:55	2022-03-24 10:53:55	MKS Szczecin	mks-szczecin-15	\N	f
2155	2022-03-24 10:53:55	2022-03-24 10:53:55	Athena Salvamento	athena-salvamento-81	\N	f
2156	2022-03-24 10:53:55	2022-03-24 10:53:55	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-67	\N	f
2157	2022-03-24 10:53:55	2022-03-24 10:53:55	Belgium NT	belgium-nt-60	\N	f
2158	2022-03-24 10:53:55	2022-03-24 10:53:55	RB Delft	rb-delft-63	\N	f
2159	2022-03-24 10:53:55	2022-03-24 10:53:55	DLRG Guetersloh	dlrg-guetersloh-52	\N	f
2160	2022-03-24 10:53:55	2022-03-24 10:53:55	DLRG Buchholz United	dlrg-buchholz-united-31	\N	f
2161	2022-03-24 10:53:56	2022-03-24 10:53:56	Athena Bracciano	athena-bracciano-140	\N	f
2162	2022-03-24 10:53:56	2022-03-24 10:53:56	Spain NT	spain-nt-94	\N	f
2163	2022-03-24 10:53:56	2022-03-24 10:53:56	Liege Sauvetage Club	liege-sauvetage-club-39	\N	f
2164	2022-03-24 10:53:56	2022-03-24 10:53:56	RB Waddinxveen	rb-waddinxveen-25	\N	f
2165	2022-03-24 10:53:56	2022-03-24 10:53:56	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-68	\N	f
2166	2022-03-24 10:53:56	2022-03-24 10:53:56	Beacon Lifesaving Club	beacon-lifesaving-club-13	\N	f
2167	2022-03-24 10:53:56	2022-03-24 10:53:56	RB Delft	rb-delft-64	\N	f
2168	2022-03-24 10:53:56	2022-03-24 10:53:56	RB Delft	rb-delft-65	\N	f
2169	2022-03-24 10:53:56	2022-03-24 10:53:56	RB Delft	rb-delft-66	\N	f
2170	2022-03-24 10:53:57	2022-03-24 10:53:57	Accademia Di Salvamento	accademia-di-salvamento-125	\N	f
2171	2022-03-24 10:53:57	2022-03-24 10:53:57	Accademia Di Salvamento	accademia-di-salvamento-126	\N	f
2172	2022-03-24 10:53:57	2022-03-24 10:53:57	Accademia Di Salvamento	accademia-di-salvamento-127	\N	f
2173	2022-03-24 10:53:57	2022-03-24 10:53:57	Accademia Di Salvamento	accademia-di-salvamento-128	\N	f
2174	2022-03-24 10:53:57	2022-03-24 10:53:57	ASD Gorizia Nuoto	asd-gorizia-nuoto-33	\N	f
2175	2022-03-24 10:53:57	2022-03-24 10:53:57	RB Waddinxveen	rb-waddinxveen-26	\N	f
2176	2022-03-24 10:53:57	2022-03-24 10:53:57	Spain NT	spain-nt-95	\N	f
2177	2022-03-24 10:53:58	2022-03-24 10:53:58	France NT	france-nt-112	\N	f
2178	2022-03-24 10:53:58	2022-03-24 10:53:58	Italy NT	italy-nt-100	\N	f
2179	2022-03-24 10:53:58	2022-03-24 10:53:58	Kusel KiXXX	kusel-kixxx-35	\N	f
2180	2022-03-24 10:53:58	2022-03-24 10:53:58	Slaskie WOPR	slaskie-wopr-71	\N	f
2181	2022-03-24 10:53:58	2022-03-24 10:53:58	Slaskie WOPR	slaskie-wopr-72	\N	f
2182	2022-03-24 10:53:58	2022-03-24 10:53:58	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-55	\N	f
2183	2022-03-24 10:53:58	2022-03-24 10:53:58	France NT	france-nt-113	\N	f
2184	2022-03-24 10:53:58	2022-03-24 10:53:58	Belgium NT	belgium-nt-61	\N	f
2185	2022-03-24 10:53:58	2022-03-24 10:53:58	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-18	\N	f
2186	2022-03-24 10:53:58	2022-03-24 10:53:58	SAFA 2000	safa-2000-37	\N	f
2187	2022-03-24 10:53:58	2022-03-24 10:53:58	In Sport Rane Rosse	in-sport-rane-rosse-66	\N	f
2188	2022-03-24 10:53:59	2022-03-24 10:53:59	Accademia Di Salvamento	accademia-di-salvamento-129	\N	f
2189	2022-03-24 10:53:59	2022-03-24 10:53:59	Accademia Di Salvamento	accademia-di-salvamento-130	\N	f
2190	2022-03-24 10:53:59	2022-03-24 10:53:59	France NT	france-nt-114	\N	f
2191	2022-03-24 10:53:59	2022-03-24 10:53:59	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-56	\N	f
2192	2022-03-24 10:53:59	2022-03-24 10:53:59	Liege Sauvetage Club	liege-sauvetage-club-40	\N	f
2193	2022-03-24 10:53:59	2022-03-24 10:53:59	Slaskie WOPR	slaskie-wopr-73	\N	f
2194	2022-03-24 10:53:59	2022-03-24 10:53:59	In Sport Rane Rosse	in-sport-rane-rosse-67	\N	f
2195	2022-03-24 10:53:59	2022-03-24 10:53:59	Athena Salvamento	athena-salvamento-82	\N	f
2196	2022-03-24 10:54:00	2022-03-24 10:54:00	DLRG Niedersachsen	dlrg-niedersachsen-147	\N	f
2197	2022-03-24 10:54:00	2022-03-24 10:54:00	DLRG Niedersachsen	dlrg-niedersachsen-148	\N	f
2198	2022-03-24 10:54:00	2022-03-24 10:54:00	Liege Sauvetage Club	liege-sauvetage-club-41	\N	f
2199	2022-03-24 10:54:00	2022-03-24 10:54:00	Rctal	rctal-29	\N	f
2200	2022-03-24 10:54:00	2022-03-24 10:54:00	Sint-Truidense RC	sint-truidense-rc-32	\N	f
2201	2022-03-24 10:54:00	2022-03-24 10:54:00	RB Heytse	rb-heytse-45	\N	f
2202	2022-03-24 10:54:00	2022-03-24 10:54:00	CKS Szczecin	cks-szczecin-57	\N	f
2203	2022-03-24 10:54:00	2022-03-24 10:54:00	Athena Salvamento	athena-salvamento-83	\N	f
2204	2022-03-24 10:54:00	2022-03-24 10:54:00	Sint-Truidense RC	sint-truidense-rc-33	\N	f
2205	2022-03-24 10:54:00	2022-03-24 10:54:00	Liege Sauvetage Club	liege-sauvetage-club-42	\N	f
2206	2022-03-24 10:54:00	2022-03-24 10:54:00	DLRG Niedersachsen	dlrg-niedersachsen-149	\N	f
2207	2022-03-24 10:54:00	2022-03-24 10:54:00	RB Heytse	rb-heytse-46	\N	f
2208	2022-03-24 10:54:01	2022-03-24 10:54:01	DLRG Guetersloh	dlrg-guetersloh-53	\N	f
2209	2022-03-24 10:54:01	2022-03-24 10:54:01	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-69	\N	f
2210	2022-03-24 10:54:01	2022-03-24 10:54:01	DLRG Niedersachsen	dlrg-niedersachsen-150	\N	f
2211	2022-03-24 10:54:01	2022-03-24 10:54:01	Slaskie WOPR	slaskie-wopr-74	\N	f
2212	2022-03-24 10:54:01	2022-03-24 10:54:01	RB Heytse	rb-heytse-47	\N	f
2213	2022-03-24 10:54:02	2022-03-24 10:54:02	DLRG Niedersachsen	dlrg-niedersachsen-151	\N	f
2214	2022-03-24 10:54:02	2022-03-24 10:54:02	Italy NT	italy-nt-101	\N	f
2215	2022-03-24 10:54:02	2022-03-24 10:54:02	Italy NT	italy-nt-102	\N	f
2216	2022-03-24 10:54:02	2022-03-24 10:54:02	Belgium NT	belgium-nt-62	\N	f
2217	2022-03-24 10:54:02	2022-03-24 10:54:02	France NT	france-nt-115	\N	f
2218	2022-03-24 10:54:02	2022-03-24 10:54:02	Nederland NT	nederland-nt-42	\N	f
2219	2022-03-24 10:54:02	2022-03-24 10:54:02	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-57	\N	f
2220	2022-03-24 10:54:03	2022-03-24 10:54:03	Spain NT	spain-nt-96	\N	f
2221	2022-03-24 10:54:03	2022-03-24 10:54:03	Spain NT	spain-nt-97	\N	f
2222	2022-03-24 10:54:03	2022-03-24 10:54:03	France NT	france-nt-116	\N	f
2223	2022-03-24 10:54:03	2022-03-24 10:54:03	CKS Szczecin	cks-szczecin-58	\N	f
2224	2022-03-24 10:54:03	2022-03-24 10:54:03	Accademia Di Salvamento	accademia-di-salvamento-131	\N	f
2225	2022-03-24 10:54:03	2022-03-24 10:54:03	Accademia Di Salvamento	accademia-di-salvamento-132	\N	f
2226	2022-03-24 10:54:03	2022-03-24 10:54:03	Athena Bracciano	athena-bracciano-141	\N	f
2227	2022-03-24 10:54:04	2022-03-24 10:54:04	DLRG Niedersachsen	dlrg-niedersachsen-152	\N	f
2228	2022-03-24 10:54:04	2022-03-24 10:54:04	DLRG Luckenwalde	dlrg-luckenwalde-23	\N	f
2229	2022-03-24 10:54:04	2022-03-24 10:54:04	Nederland NT	nederland-nt-43	\N	f
2230	2022-03-24 10:54:04	2022-03-24 10:54:04	DLRG Bad Oldesloe	dlrg-bad-oldesloe-10	\N	f
2231	2022-03-24 10:54:04	2022-03-24 10:54:04	DLRG Niedersachsen	dlrg-niedersachsen-153	\N	f
2232	2022-03-24 10:54:04	2022-03-24 10:54:04	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-30	\N	f
2233	2022-03-24 10:54:04	2022-03-24 10:54:04	Belgium NT	belgium-nt-63	\N	f
2234	2022-03-24 10:54:04	2022-03-24 10:54:04	Belgium NT	belgium-nt-64	\N	f
2235	2022-03-24 10:54:04	2022-03-24 10:54:04	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-31	\N	f
2236	2022-03-24 10:54:05	2022-03-24 10:54:05	DLRG Niedersachsen	dlrg-niedersachsen-154	\N	f
2237	2022-03-24 10:54:05	2022-03-24 10:54:05	Italy NT	italy-nt-103	\N	f
2238	2022-03-24 10:54:05	2022-03-24 10:54:05	Italy NT	italy-nt-104	\N	f
2239	2022-03-24 10:54:05	2022-03-24 10:54:05	ASD Gorizia Nuoto	asd-gorizia-nuoto-34	\N	f
2240	2022-03-24 10:54:05	2022-03-24 10:54:05	Spain NT	spain-nt-98	\N	f
2241	2022-03-24 10:54:05	2022-03-24 10:54:05	SAFA 2000	safa-2000-38	\N	f
2242	2022-03-24 10:54:05	2022-03-24 10:54:05	Polen NT	polen-nt-22	\N	f
2243	2022-03-24 10:54:05	2022-03-24 10:54:05	In Sport Rane Rosse	in-sport-rane-rosse-68	\N	f
2244	2022-03-24 10:54:05	2022-03-24 10:54:05	Beacon Lifesaving Club	beacon-lifesaving-club-14	\N	f
2245	2022-03-24 10:54:06	2022-03-24 10:54:06	France NT	france-nt-117	\N	f
2246	2022-03-24 10:54:06	2022-03-24 10:54:06	SAFA 2000	safa-2000-39	\N	f
2247	2022-03-24 10:54:06	2022-03-24 10:54:06	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-70	\N	f
2248	2022-03-24 10:54:06	2022-03-24 10:54:06	A.S.D. Sportiva Sturla	asd-sportiva-sturla-23	\N	f
2249	2022-03-24 10:54:06	2022-03-24 10:54:06	DLRG Lueneburg e.V.	dlrg-lueneburg-ev-3	\N	f
2250	2022-03-24 10:54:06	2022-03-24 10:54:06	Accademia Di Salvamento	accademia-di-salvamento-133	\N	f
2251	2022-03-24 10:54:06	2022-03-24 10:54:06	Belgium NT	belgium-nt-65	\N	f
2252	2022-03-24 10:54:06	2022-03-24 10:54:06	ASD Rosetana Nuoto	asd-rosetana-nuoto-29	\N	f
2253	2022-03-24 10:54:06	2022-03-24 10:54:06	RB Heytse	rb-heytse-48	\N	f
2254	2022-03-24 10:54:06	2022-03-24 10:54:06	RB Heytse	rb-heytse-49	\N	f
2255	2022-03-24 10:54:06	2022-03-24 10:54:06	DLRG Luckenwalde	dlrg-luckenwalde-24	\N	f
2256	2022-03-24 10:54:06	2022-03-24 10:54:06	ASD Rosetana Nuoto	asd-rosetana-nuoto-30	\N	f
2257	2022-03-24 10:54:07	2022-03-24 10:54:07	Rctal	rctal-30	\N	f
2258	2022-03-24 10:54:07	2022-03-24 10:54:07	DLRG Niedersachsen	dlrg-niedersachsen-155	\N	f
2259	2022-03-24 10:54:07	2022-03-24 10:54:07	DLRG Niedersachsen	dlrg-niedersachsen-156	\N	f
2260	2022-03-24 10:54:07	2022-03-24 10:54:07	RB Waddinxveen	rb-waddinxveen-27	\N	f
2261	2022-03-24 10:54:07	2022-03-24 10:54:07	Accademia Di Salvamento	accademia-di-salvamento-134	\N	f
2262	2022-03-24 10:54:07	2022-03-24 10:54:07	RB Delft	rb-delft-67	\N	f
2263	2022-03-24 10:54:08	2022-03-24 10:54:08	RB Delft	rb-delft-68	\N	f
2264	2022-03-24 10:54:08	2022-03-24 10:54:08	RB Delft	rb-delft-69	\N	f
2265	2022-03-24 10:54:08	2022-03-24 10:54:08	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-5	\N	f
2266	2022-03-24 10:54:08	2022-03-24 10:54:08	Italy NT	italy-nt-105	\N	f
2267	2022-03-24 10:54:08	2022-03-24 10:54:08	Spain NT	spain-nt-99	\N	f
2268	2022-03-24 10:54:08	2022-03-24 10:54:08	Spain NT	spain-nt-100	\N	f
2269	2022-03-24 10:54:08	2022-03-24 10:54:08	In Sport Rane Rosse	in-sport-rane-rosse-69	\N	f
2270	2022-03-24 10:54:08	2022-03-24 10:54:08	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-58	\N	f
2271	2022-03-24 10:54:09	2022-03-24 10:54:09	Athena Bracciano	athena-bracciano-142	\N	f
2272	2022-03-24 10:54:09	2022-03-24 10:54:09	Spain NT	spain-nt-101	\N	f
2273	2022-03-24 10:54:09	2022-03-24 10:54:09	Accademia Di Salvamento	accademia-di-salvamento-135	\N	f
2274	2022-03-24 10:54:09	2022-03-24 10:54:09	Athena Bracciano	athena-bracciano-143	\N	f
2275	2022-03-24 10:54:09	2022-03-24 10:54:09	Accademia Di Salvamento	accademia-di-salvamento-136	\N	f
2276	2022-03-24 10:54:09	2022-03-24 10:54:09	Belgium NT	belgium-nt-66	\N	f
2277	2022-03-24 10:54:10	2022-03-24 10:54:10	France NT	france-nt-118	\N	f
2278	2022-03-24 10:54:10	2022-03-24 10:54:10	Slaskie WOPR	slaskie-wopr-75	\N	f
2279	2022-03-24 10:54:10	2022-03-24 10:54:10	Athena Bracciano	athena-bracciano-144	\N	f
2280	2022-03-24 10:54:10	2022-03-24 10:54:10	Athena Salvamento	athena-salvamento-84	\N	f
2281	2022-03-24 10:54:10	2022-03-24 10:54:10	Liege Sauvetage Club	liege-sauvetage-club-43	\N	f
2282	2022-03-24 10:54:10	2022-03-24 10:54:10	Athena Salvamento	athena-salvamento-85	\N	f
2283	2022-03-24 10:54:10	2022-03-24 10:54:10	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-59	\N	f
2284	2022-03-24 10:54:10	2022-03-24 10:54:10	In Sport Rane Rosse	in-sport-rane-rosse-70	\N	f
2285	2022-03-24 10:54:10	2022-03-24 10:54:10	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-19	\N	f
2286	2022-03-24 10:54:10	2022-03-24 10:54:10	Liege Sauvetage Club	liege-sauvetage-club-44	\N	f
2287	2022-03-24 10:54:10	2022-03-24 10:54:10	Athena Salvamento	athena-salvamento-86	\N	f
2288	2022-03-24 10:54:11	2022-03-24 10:54:11	In Sport Rane Rosse	in-sport-rane-rosse-71	\N	f
2289	2022-03-24 10:54:11	2022-03-24 10:54:11	Sint-Truidense RC	sint-truidense-rc-34	\N	f
2290	2022-03-24 10:54:11	2022-03-24 10:54:11	DLRG Niedersachsen	dlrg-niedersachsen-157	\N	f
2291	2022-03-24 10:54:11	2022-03-24 10:54:11	CKS Szczecin	cks-szczecin-59	\N	f
2292	2022-03-24 10:54:11	2022-03-24 10:54:11	Nederland NT	nederland-nt-44	\N	f
2293	2022-03-24 10:54:11	2022-03-24 10:54:11	France NT	france-nt-119	\N	f
2294	2022-03-24 10:54:11	2022-03-24 10:54:11	DLRG Guetersloh	dlrg-guetersloh-54	\N	f
2295	2022-03-24 10:54:11	2022-03-24 10:54:11	Rctal	rctal-31	\N	f
2296	2022-03-24 10:54:11	2022-03-24 10:54:11	DLRG Niedersachsen	dlrg-niedersachsen-158	\N	f
2297	2022-03-24 10:54:12	2022-03-24 10:54:12	Slaskie WOPR	slaskie-wopr-76	\N	f
2298	2022-03-24 10:54:12	2022-03-24 10:54:12	SAFA 2000	safa-2000-40	\N	f
2299	2022-03-24 10:54:12	2022-03-24 10:54:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-71	\N	f
2300	2022-03-24 10:54:12	2022-03-24 10:54:12	Rctal	rctal-32	\N	f
2301	2022-03-24 10:54:12	2022-03-24 10:54:12	CKS Szczecin	cks-szczecin-60	\N	f
2302	2022-03-24 10:54:12	2022-03-24 10:54:12	Accademia Di Salvamento	accademia-di-salvamento-137	\N	f
2303	2022-03-24 10:54:12	2022-03-24 10:54:12	In Sport Rane Rosse	in-sport-rane-rosse-72	\N	f
2304	2022-03-24 10:54:12	2022-03-24 10:54:12	DLRG Niedersachsen	dlrg-niedersachsen-159	\N	f
2305	2022-03-24 10:54:12	2022-03-24 10:54:12	Kusel KiXXX	kusel-kixxx-36	\N	f
2306	2022-03-24 10:54:13	2022-03-24 10:54:13	Athena Salvamento	athena-salvamento-87	\N	f
2307	2022-03-24 10:54:13	2022-03-24 10:54:13	RB Delft	rb-delft-70	\N	f
2308	2022-03-24 10:54:13	2022-03-24 10:54:13	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-8	\N	f
2309	2022-03-24 10:54:13	2022-03-24 10:54:13	DLRG Niedersachsen	dlrg-niedersachsen-160	\N	f
2310	2022-03-24 10:54:13	2022-03-24 10:54:13	Liege Sauvetage Club	liege-sauvetage-club-45	\N	f
2311	2022-03-24 10:54:13	2022-03-24 10:54:13	DLRG Niedersachsen	dlrg-niedersachsen-161	\N	f
2312	2022-03-24 10:54:13	2022-03-24 10:54:13	Rctal	rctal-33	\N	f
2313	2022-03-24 10:54:13	2022-03-24 10:54:13	Accademia Di Salvamento	accademia-di-salvamento-138	\N	f
2314	2022-03-24 10:54:14	2022-03-24 10:54:14	Athena Bracciano	athena-bracciano-145	\N	f
2315	2022-03-24 10:54:14	2022-03-24 10:54:14	Slaskie WOPR	slaskie-wopr-77	\N	f
2316	2022-03-24 10:54:14	2022-03-24 10:54:14	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-60	\N	f
2317	2022-03-24 10:54:14	2022-03-24 10:54:14	Athena Salvamento	athena-salvamento-88	\N	f
2318	2022-03-24 10:54:14	2022-03-24 10:54:14	RB Heytse	rb-heytse-50	\N	f
2319	2022-03-24 10:54:14	2022-03-24 10:54:14	Slaskie WOPR	slaskie-wopr-78	\N	f
2320	2022-03-24 10:54:14	2022-03-24 10:54:14	Slaskie WOPR	slaskie-wopr-79	\N	f
2321	2022-03-24 10:54:14	2022-03-24 10:54:14	RB Heytse	rb-heytse-51	\N	f
2322	2022-03-24 10:54:14	2022-03-24 10:54:14	Athena Salvamento	athena-salvamento-89	\N	f
2323	2022-03-24 10:54:15	2022-03-24 10:54:15	RB Heytse	rb-heytse-52	\N	f
2324	2022-03-24 10:54:15	2022-03-24 10:54:15	In Sport Rane Rosse	in-sport-rane-rosse-73	\N	f
2325	2022-03-24 10:54:15	2022-03-24 10:54:15	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-72	\N	f
2326	2022-03-24 10:54:15	2022-03-24 10:54:15	In Sport Rane Rosse	in-sport-rane-rosse-74	\N	f
2327	2022-03-24 10:54:15	2022-03-24 10:54:15	In Sport Rane Rosse	in-sport-rane-rosse-75	\N	f
2328	2022-03-24 10:54:15	2022-03-24 10:54:15	ASD Rosetana Nuoto	asd-rosetana-nuoto-31	\N	f
2329	2022-03-24 10:54:15	2022-03-24 10:54:15	DLRG Guetersloh	dlrg-guetersloh-55	\N	f
2330	2022-03-24 10:54:15	2022-03-24 10:54:15	DLRG Guetersloh	dlrg-guetersloh-56	\N	f
2331	2022-03-24 10:54:15	2022-03-24 10:54:15	France NT	france-nt-120	\N	f
2332	2022-03-24 10:54:15	2022-03-24 10:54:15	Athena Bracciano	athena-bracciano-146	\N	f
2333	2022-03-24 10:54:15	2022-03-24 10:54:15	Sint-Truidense RC	sint-truidense-rc-35	\N	f
2334	2022-03-24 10:54:16	2022-03-24 10:54:16	Italy NT	italy-nt-106	\N	f
2335	2022-03-24 10:54:16	2022-03-24 10:54:16	Belgium NT	belgium-nt-67	\N	f
2336	2022-03-24 10:54:16	2022-03-24 10:54:16	Italy NT	italy-nt-107	\N	f
2337	2022-03-24 10:54:16	2022-03-24 10:54:16	France NT	france-nt-121	\N	f
2338	2022-03-24 10:54:16	2022-03-24 10:54:16	Belgium NT	belgium-nt-68	\N	f
2339	2022-03-24 10:54:16	2022-03-24 10:54:16	Nederland NT	nederland-nt-45	\N	f
2340	2022-03-24 10:54:16	2022-03-24 10:54:16	Spain NT	spain-nt-102	\N	f
2428	2022-03-24 10:54:28	2022-03-24 10:54:28	France NT	france-nt-129	\N	f
2341	2022-03-24 10:54:16	2022-03-24 10:54:16	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-4	\N	f
2342	2022-03-24 10:54:16	2022-03-24 10:54:16	France NT	france-nt-122	\N	f
2343	2022-03-24 10:54:16	2022-03-24 10:54:16	In Sport Rane Rosse	in-sport-rane-rosse-76	\N	f
2344	2022-03-24 10:54:16	2022-03-24 10:54:16	In Sport Rane Rosse	in-sport-rane-rosse-77	\N	f
2345	2022-03-24 10:54:17	2022-03-24 10:54:17	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-73	\N	f
2346	2022-03-24 10:54:17	2022-03-24 10:54:17	Nederland NT	nederland-nt-46	\N	f
2347	2022-03-24 10:54:17	2022-03-24 10:54:17	Slaskie WOPR	slaskie-wopr-80	\N	f
2348	2022-03-24 10:54:17	2022-03-24 10:54:17	CKS Szczecin	cks-szczecin-61	\N	f
2349	2022-03-24 10:54:17	2022-03-24 10:54:17	Italy NT	italy-nt-108	\N	f
2350	2022-03-24 10:54:17	2022-03-24 10:54:17	Italy NT	italy-nt-109	\N	f
2351	2022-03-24 10:54:17	2022-03-24 10:54:17	Nederland NT	nederland-nt-47	\N	f
2352	2022-03-24 10:54:17	2022-03-24 10:54:17	Athena Bracciano	athena-bracciano-147	\N	f
2353	2022-03-24 10:54:18	2022-03-24 10:54:18	Accademia Di Salvamento	accademia-di-salvamento-139	\N	f
2354	2022-03-24 10:54:18	2022-03-24 10:54:18	Accademia Di Salvamento	accademia-di-salvamento-140	\N	f
2355	2022-03-24 10:54:18	2022-03-24 10:54:18	Kusel KiXXX	kusel-kixxx-37	\N	f
2356	2022-03-24 10:54:18	2022-03-24 10:54:18	Accademia Di Salvamento	accademia-di-salvamento-141	\N	f
2357	2022-03-24 10:54:18	2022-03-24 10:54:18	Athena Bracciano	athena-bracciano-148	\N	f
2358	2022-03-24 10:54:19	2022-03-24 10:54:19	DLRG Niedersachsen	dlrg-niedersachsen-162	\N	f
2359	2022-03-24 10:54:19	2022-03-24 10:54:19	ASD Gorizia Nuoto	asd-gorizia-nuoto-35	\N	f
2360	2022-03-24 10:54:19	2022-03-24 10:54:19	Athena Bracciano	athena-bracciano-149	\N	f
2361	2022-03-24 10:54:19	2022-03-24 10:54:19	Athena Bracciano	athena-bracciano-150	\N	f
2362	2022-03-24 10:54:19	2022-03-24 10:54:19	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-61	\N	f
2363	2022-03-24 10:54:19	2022-03-24 10:54:19	France NT	france-nt-123	\N	f
2364	2022-03-24 10:54:19	2022-03-24 10:54:19	A.S.D. Sportiva Sturla	asd-sportiva-sturla-24	\N	f
2365	2022-03-24 10:54:20	2022-03-24 10:54:20	DLRG Niedersachsen	dlrg-niedersachsen-163	\N	f
2366	2022-03-24 10:54:20	2022-03-24 10:54:20	France NT	france-nt-124	\N	f
2367	2022-03-24 10:54:20	2022-03-24 10:54:20	A.S.D. Sportiva Sturla	asd-sportiva-sturla-25	\N	f
2368	2022-03-24 10:54:20	2022-03-24 10:54:20	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-5	\N	f
2369	2022-03-24 10:54:20	2022-03-24 10:54:20	DLRG Niedersachsen	dlrg-niedersachsen-164	\N	f
2370	2022-03-24 10:54:20	2022-03-24 10:54:20	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-74	\N	f
2371	2022-03-24 10:54:20	2022-03-24 10:54:20	Spain NT	spain-nt-103	\N	f
2372	2022-03-24 10:54:21	2022-03-24 10:54:21	France NT	france-nt-125	\N	f
2373	2022-03-24 10:54:21	2022-03-24 10:54:21	Polen NT	polen-nt-23	\N	f
2374	2022-03-24 10:54:21	2022-03-24 10:54:21	Accademia Di Salvamento	accademia-di-salvamento-142	\N	f
2375	2022-03-24 10:54:21	2022-03-24 10:54:21	CKS Szczecin	cks-szczecin-62	\N	f
2376	2022-03-24 10:54:21	2022-03-24 10:54:21	CKS Szczecin	cks-szczecin-63	\N	f
2377	2022-03-24 10:54:21	2022-03-24 10:54:21	Spain NT	spain-nt-104	\N	f
2378	2022-03-24 10:54:21	2022-03-24 10:54:21	Liege Sauvetage Club	liege-sauvetage-club-46	\N	f
2379	2022-03-24 10:54:21	2022-03-24 10:54:21	CKS Szczecin	cks-szczecin-64	\N	f
2380	2022-03-24 10:54:22	2022-03-24 10:54:22	Accademia Di Salvamento	accademia-di-salvamento-143	\N	f
2381	2022-03-24 10:54:22	2022-03-24 10:54:22	DLRG Guetersloh	dlrg-guetersloh-57	\N	f
2382	2022-03-24 10:54:22	2022-03-24 10:54:22	In Sport Rane Rosse	in-sport-rane-rosse-78	\N	f
2383	2022-03-24 10:54:22	2022-03-24 10:54:22	Polen NT	polen-nt-24	\N	f
2384	2022-03-24 10:54:22	2022-03-24 10:54:22	MKS Szczecin	mks-szczecin-16	\N	f
2385	2022-03-24 10:54:22	2022-03-24 10:54:22	Athena Bracciano	athena-bracciano-151	\N	f
2386	2022-03-24 10:54:22	2022-03-24 10:54:22	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-3	\N	f
2387	2022-03-24 10:54:22	2022-03-24 10:54:22	Accademia Di Salvamento	accademia-di-salvamento-144	\N	f
2388	2022-03-24 10:54:22	2022-03-24 10:54:22	ASD Rosetana Nuoto	asd-rosetana-nuoto-32	\N	f
2389	2022-03-24 10:54:22	2022-03-24 10:54:22	A.S.D. Sportiva Sturla	asd-sportiva-sturla-26	\N	f
2390	2022-03-24 10:54:22	2022-03-24 10:54:22	Sint-Truidense RC	sint-truidense-rc-36	\N	f
2391	2022-03-24 10:54:23	2022-03-24 10:54:23	France NT	france-nt-126	\N	f
2392	2022-03-24 10:54:23	2022-03-24 10:54:23	Accademia Di Salvamento	accademia-di-salvamento-145	\N	f
2393	2022-03-24 10:54:23	2022-03-24 10:54:23	MKS Szczecin	mks-szczecin-17	\N	f
2394	2022-03-24 10:54:23	2022-03-24 10:54:23	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-62	\N	f
2395	2022-03-24 10:54:23	2022-03-24 10:54:23	DLRG Niedersachsen	dlrg-niedersachsen-165	\N	f
2396	2022-03-24 10:54:23	2022-03-24 10:54:23	Liege Sauvetage Club	liege-sauvetage-club-47	\N	f
2397	2022-03-24 10:54:23	2022-03-24 10:54:23	Athena Bracciano	athena-bracciano-152	\N	f
2398	2022-03-24 10:54:23	2022-03-24 10:54:23	Sint-Truidense RC	sint-truidense-rc-37	\N	f
2399	2022-03-24 10:54:24	2022-03-24 10:54:24	France NT	france-nt-127	\N	f
2400	2022-03-24 10:54:24	2022-03-24 10:54:24	Kusel KiXXX	kusel-kixxx-38	\N	f
2401	2022-03-24 10:54:24	2022-03-24 10:54:24	RB Waddinxveen	rb-waddinxveen-28	\N	f
2402	2022-03-24 10:54:24	2022-03-24 10:54:24	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-75	\N	f
2403	2022-03-24 10:54:24	2022-03-24 10:54:24	DLRG Buchholz United	dlrg-buchholz-united-32	\N	f
2404	2022-03-24 10:54:24	2022-03-24 10:54:24	Accademia Di Salvamento	accademia-di-salvamento-146	\N	f
2405	2022-03-24 10:54:24	2022-03-24 10:54:24	ASD Rosetana Nuoto	asd-rosetana-nuoto-33	\N	f
2406	2022-03-24 10:54:24	2022-03-24 10:54:24	DLRG Buchholz United	dlrg-buchholz-united-33	\N	f
2407	2022-03-24 10:54:24	2022-03-24 10:54:24	In Sport Rane Rosse	in-sport-rane-rosse-79	\N	f
2408	2022-03-24 10:54:25	2022-03-24 10:54:25	Italy NT	italy-nt-110	\N	f
2409	2022-03-24 10:54:25	2022-03-24 10:54:25	Polen NT	polen-nt-25	\N	f
2410	2022-03-24 10:54:25	2022-03-24 10:54:25	DLRG Buchholz United	dlrg-buchholz-united-34	\N	f
2411	2022-03-24 10:54:25	2022-03-24 10:54:25	RB Delft	rb-delft-71	\N	f
2412	2022-03-24 10:54:25	2022-03-24 10:54:25	Athena Bracciano	athena-bracciano-153	\N	f
2413	2022-03-24 10:54:25	2022-03-24 10:54:25	RB Delft	rb-delft-72	\N	f
2414	2022-03-24 10:54:25	2022-03-24 10:54:25	RB Delft	rb-delft-73	\N	f
2415	2022-03-24 10:54:25	2022-03-24 10:54:25	Liege Sauvetage Club	liege-sauvetage-club-48	\N	f
2416	2022-03-24 10:54:25	2022-03-24 10:54:25	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-6	\N	f
2417	2022-03-24 10:54:26	2022-03-24 10:54:26	Belgium NT	belgium-nt-69	\N	f
2418	2022-03-24 10:54:26	2022-03-24 10:54:26	Spain NT	spain-nt-105	\N	f
2419	2022-03-24 10:54:26	2022-03-24 10:54:26	Italy NT	italy-nt-111	\N	f
2420	2022-03-24 10:54:26	2022-03-24 10:54:26	France NT	france-nt-128	\N	f
2421	2022-03-24 10:54:26	2022-03-24 10:54:26	Italy NT	italy-nt-112	\N	f
2422	2022-03-24 10:54:27	2022-03-24 10:54:27	Spain NT	spain-nt-106	\N	f
2423	2022-03-24 10:54:27	2022-03-24 10:54:27	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-32	\N	f
2424	2022-03-24 10:54:27	2022-03-24 10:54:27	Nederland NT	nederland-nt-48	\N	f
2425	2022-03-24 10:54:27	2022-03-24 10:54:27	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-63	\N	f
2426	2022-03-24 10:54:27	2022-03-24 10:54:27	Accademia Di Salvamento	accademia-di-salvamento-147	\N	f
2427	2022-03-24 10:54:27	2022-03-24 10:54:27	Slaskie WOPR	slaskie-wopr-81	\N	f
2429	2022-03-24 10:54:28	2022-03-24 10:54:28	CKS Szczecin	cks-szczecin-65	\N	f
2430	2022-03-24 10:54:28	2022-03-24 10:54:28	DLRG Niedersachsen	dlrg-niedersachsen-166	\N	f
2431	2022-03-24 10:54:28	2022-03-24 10:54:28	Athena Bracciano	athena-bracciano-154	\N	f
2432	2022-03-24 10:54:28	2022-03-24 10:54:28	DLRG Niedersachsen	dlrg-niedersachsen-167	\N	f
2433	2022-03-24 10:54:28	2022-03-24 10:54:28	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-76	\N	f
2434	2022-03-24 10:54:29	2022-03-24 10:54:29	Athena Bracciano	athena-bracciano-155	\N	f
2435	2022-03-24 10:54:29	2022-03-24 10:54:29	Athena Salvamento	athena-salvamento-90	\N	f
2436	2022-03-24 10:54:29	2022-03-24 10:54:29	Athena Salvamento	athena-salvamento-91	\N	f
2437	2022-03-24 10:54:29	2022-03-24 10:54:29	DLRG Guetersloh	dlrg-guetersloh-58	\N	f
2438	2022-03-24 10:54:29	2022-03-24 10:54:29	Spain NT	spain-nt-107	\N	f
2439	2022-03-24 10:54:30	2022-03-24 10:54:30	Polen NT	polen-nt-26	\N	f
2440	2022-03-24 10:54:30	2022-03-24 10:54:30	Italy NT	italy-nt-113	\N	f
2441	2022-03-24 10:54:30	2022-03-24 10:54:30	Italy NT	italy-nt-114	\N	f
2442	2022-03-24 10:54:30	2022-03-24 10:54:30	Spain NT	spain-nt-108	\N	f
2443	2022-03-24 10:54:30	2022-03-24 10:54:30	SAFA 2000	safa-2000-41	\N	f
2444	2022-03-24 10:54:30	2022-03-24 10:54:30	France NT	france-nt-130	\N	f
2445	2022-03-24 10:54:31	2022-03-24 10:54:31	ASD Gorizia Nuoto	asd-gorizia-nuoto-36	\N	f
2446	2022-03-24 10:54:31	2022-03-24 10:54:31	A.S.D. Sportiva Sturla	asd-sportiva-sturla-27	\N	f
2447	2022-03-24 10:54:31	2022-03-24 10:54:31	CKS Szczecin	cks-szczecin-66	\N	f
2448	2022-03-24 10:54:31	2022-03-24 10:54:31	Athena Bracciano	athena-bracciano-156	\N	f
2449	2022-03-24 10:54:31	2022-03-24 10:54:31	DLRG Guetersloh	dlrg-guetersloh-59	\N	f
2450	2022-03-24 10:54:31	2022-03-24 10:54:31	Hungarian NT	hungarian-nt-6	\N	f
2451	2022-03-24 10:54:31	2022-03-24 10:54:31	Accademia Di Salvamento	accademia-di-salvamento-148	\N	f
2452	2022-03-24 10:54:31	2022-03-24 10:54:31	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-77	\N	f
2453	2022-03-24 10:54:31	2022-03-24 10:54:31	DLRG Luckenwalde	dlrg-luckenwalde-25	\N	f
2454	2022-03-24 10:54:32	2022-03-24 10:54:32	DLRG Buchholz United	dlrg-buchholz-united-35	\N	f
2455	2022-03-24 10:54:32	2022-03-24 10:54:32	France NT	france-nt-131	\N	f
2456	2022-03-24 10:54:32	2022-03-24 10:54:32	Athena Bracciano	athena-bracciano-157	\N	f
2457	2022-03-24 10:54:32	2022-03-24 10:54:32	Slaskie WOPR	slaskie-wopr-82	\N	f
2458	2022-03-24 10:54:32	2022-03-24 10:54:32	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-78	\N	f
2459	2022-03-24 10:54:33	2022-03-24 10:54:33	Accademia Di Salvamento	accademia-di-salvamento-149	\N	f
2460	2022-03-24 10:54:33	2022-03-24 10:54:33	Athena Salvamento	athena-salvamento-92	\N	f
2461	2022-03-24 10:54:33	2022-03-24 10:54:33	DLRG Niedersachsen	dlrg-niedersachsen-168	\N	f
2462	2022-03-24 10:54:33	2022-03-24 10:54:33	ASD Rosetana Nuoto	asd-rosetana-nuoto-34	\N	f
2463	2022-03-24 10:54:33	2022-03-24 10:54:33	MKS Szczecin	mks-szczecin-18	\N	f
2464	2022-03-24 10:54:33	2022-03-24 10:54:33	RB Delft	rb-delft-74	\N	f
2465	2022-03-24 10:54:33	2022-03-24 10:54:33	Spain NT	spain-nt-109	\N	f
2466	2022-03-24 10:54:33	2022-03-24 10:54:33	Accademia Di Salvamento	accademia-di-salvamento-150	\N	f
2467	2022-03-24 10:54:33	2022-03-24 10:54:33	SAFA 2000	safa-2000-42	\N	f
2468	2022-03-24 10:54:34	2022-03-24 10:54:34	In Sport Rane Rosse	in-sport-rane-rosse-80	\N	f
2469	2022-03-24 10:54:34	2022-03-24 10:54:34	Italy NT	italy-nt-115	\N	f
2470	2022-03-24 10:54:34	2022-03-24 10:54:34	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-20	\N	f
2471	2022-03-24 10:54:34	2022-03-24 10:54:34	Spain NT	spain-nt-110	\N	f
2472	2022-03-24 10:54:34	2022-03-24 10:54:34	In Sport Rane Rosse	in-sport-rane-rosse-81	\N	f
2473	2022-03-24 10:54:34	2022-03-24 10:54:34	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-64	\N	f
2474	2022-03-24 10:54:34	2022-03-24 10:54:34	France NT	france-nt-132	\N	f
2475	2022-03-24 10:54:34	2022-03-24 10:54:34	Accademia Di Salvamento	accademia-di-salvamento-151	\N	f
2476	2022-03-24 10:54:34	2022-03-24 10:54:34	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-65	\N	f
2477	2022-03-24 10:54:34	2022-03-24 10:54:34	Kusel KiXXX	kusel-kixxx-39	\N	f
2478	2022-03-24 10:54:35	2022-03-24 10:54:35	Athena Bracciano	athena-bracciano-158	\N	f
2479	2022-03-24 10:54:35	2022-03-24 10:54:35	Liege Sauvetage Club	liege-sauvetage-club-49	\N	f
2480	2022-03-24 10:54:35	2022-03-24 10:54:35	Slaskie WOPR	slaskie-wopr-83	\N	f
2481	2022-03-24 10:54:35	2022-03-24 10:54:35	DLRG Niedersachsen	dlrg-niedersachsen-169	\N	f
2482	2022-03-24 10:54:35	2022-03-24 10:54:35	Rctal	rctal-34	\N	f
2483	2022-03-24 10:54:35	2022-03-24 10:54:35	Athena Bracciano	athena-bracciano-159	\N	f
2484	2022-03-24 10:54:35	2022-03-24 10:54:35	In Sport Rane Rosse	in-sport-rane-rosse-82	\N	f
2485	2022-03-24 10:54:35	2022-03-24 10:54:35	France NT	france-nt-133	\N	f
2486	2022-03-24 10:54:35	2022-03-24 10:54:35	In Sport Rane Rosse	in-sport-rane-rosse-83	\N	f
2487	2022-03-24 10:54:36	2022-03-24 10:54:36	Athena Bracciano	athena-bracciano-160	\N	f
2488	2022-03-24 10:54:36	2022-03-24 10:54:36	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-79	\N	f
2489	2022-03-24 10:54:36	2022-03-24 10:54:36	DLRG Niedersachsen	dlrg-niedersachsen-170	\N	f
2490	2022-03-24 10:54:36	2022-03-24 10:54:36	Sint-Truidense RC	sint-truidense-rc-38	\N	f
2491	2022-03-24 10:54:36	2022-03-24 10:54:36	Athena Salvamento	athena-salvamento-93	\N	f
2492	2022-03-24 10:54:36	2022-03-24 10:54:36	Accademia Di Salvamento	accademia-di-salvamento-152	\N	f
2493	2022-03-24 10:54:36	2022-03-24 10:54:36	In Sport Rane Rosse	in-sport-rane-rosse-84	\N	f
2494	2022-03-24 10:54:37	2022-03-24 10:54:37	Athena Salvamento	athena-salvamento-94	\N	f
2495	2022-03-24 10:54:37	2022-03-24 10:54:37	Slaskie WOPR	slaskie-wopr-84	\N	f
2496	2022-03-24 10:54:37	2022-03-24 10:54:37	Rctal	rctal-35	\N	f
2497	2022-03-24 10:54:37	2022-03-24 10:54:37	Rctal	rctal-36	\N	f
2498	2022-03-24 10:54:37	2022-03-24 10:54:37	CKS Szczecin	cks-szczecin-67	\N	f
2499	2022-03-24 10:54:37	2022-03-24 10:54:37	Sint-Truidense RC	sint-truidense-rc-39	\N	f
2500	2022-03-24 10:54:37	2022-03-24 10:54:37	Nederland NT	nederland-nt-49	\N	f
2501	2022-03-24 10:54:37	2022-03-24 10:54:37	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-9	\N	f
2502	2022-03-24 10:54:37	2022-03-24 10:54:37	Sint-Truidense RC	sint-truidense-rc-40	\N	f
2503	2022-03-24 10:54:37	2022-03-24 10:54:37	Athena Bracciano	athena-bracciano-161	\N	f
2504	2022-03-24 10:54:37	2022-03-24 10:54:37	RB Heytse	rb-heytse-53	\N	f
2505	2022-03-24 10:54:38	2022-03-24 10:54:38	RB Heytse	rb-heytse-54	\N	f
2506	2022-03-24 10:54:38	2022-03-24 10:54:38	DLRG Guetersloh	dlrg-guetersloh-60	\N	f
2507	2022-03-24 10:54:38	2022-03-24 10:54:38	RB Delft	rb-delft-75	\N	f
2508	2022-03-24 10:54:38	2022-03-24 10:54:38	Athena Salvamento	athena-salvamento-95	\N	f
2509	2022-03-24 10:54:38	2022-03-24 10:54:38	DLRG Niedersachsen	dlrg-niedersachsen-171	\N	f
2510	2022-03-24 10:54:38	2022-03-24 10:54:38	DLRG Guetersloh	dlrg-guetersloh-61	\N	f
2511	2022-03-24 10:54:38	2022-03-24 10:54:38	DLRG Niedersachsen	dlrg-niedersachsen-172	\N	f
2512	2022-03-24 10:54:39	2022-03-24 10:54:39	Liege Sauvetage Club	liege-sauvetage-club-50	\N	f
2513	2022-03-24 10:54:39	2022-03-24 10:54:39	DLRG Niedersachsen	dlrg-niedersachsen-173	\N	f
2514	2022-03-24 10:54:39	2022-03-24 10:54:39	RB Heytse	rb-heytse-55	\N	f
2515	2022-03-24 10:54:39	2022-03-24 10:54:39	Italy NT	italy-nt-116	\N	f
2516	2022-03-24 10:54:39	2022-03-24 10:54:39	DLRG Bad Oldesloe	dlrg-bad-oldesloe-11	\N	f
2517	2022-03-24 10:54:39	2022-03-24 10:54:39	Italy NT	italy-nt-117	\N	f
2518	2022-03-24 10:54:39	2022-03-24 10:54:39	Belgium NT	belgium-nt-70	\N	f
2519	2022-03-24 10:54:39	2022-03-24 10:54:39	Spain NT	spain-nt-111	\N	f
2520	2022-03-24 10:54:40	2022-03-24 10:54:40	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-66	\N	f
2521	2022-03-24 10:54:40	2022-03-24 10:54:40	Spain NT	spain-nt-112	\N	f
2522	2022-03-24 10:54:40	2022-03-24 10:54:40	Belgium NT	belgium-nt-71	\N	f
2523	2022-03-24 10:54:40	2022-03-24 10:54:40	Spain NT	spain-nt-113	\N	f
2524	2022-03-24 10:54:40	2022-03-24 10:54:40	Belgium NT	belgium-nt-72	\N	f
2525	2022-03-24 10:54:40	2022-03-24 10:54:40	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-67	\N	f
2526	2022-03-24 10:54:40	2022-03-24 10:54:40	Nederland NT	nederland-nt-50	\N	f
2527	2022-03-24 10:54:40	2022-03-24 10:54:40	In Sport Rane Rosse	in-sport-rane-rosse-85	\N	f
2528	2022-03-24 10:54:40	2022-03-24 10:54:40	Accademia Di Salvamento	accademia-di-salvamento-153	\N	f
2529	2022-03-24 10:54:40	2022-03-24 10:54:40	A.S.D. Sportiva Sturla	asd-sportiva-sturla-28	\N	f
2530	2022-03-24 10:54:40	2022-03-24 10:54:40	ASD Gorizia Nuoto	asd-gorizia-nuoto-37	\N	f
2531	2022-03-24 10:54:41	2022-03-24 10:54:41	Rctal	rctal-37	\N	f
2532	2022-03-24 10:54:41	2022-03-24 10:54:41	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-80	\N	f
2533	2022-03-24 10:54:41	2022-03-24 10:54:41	Kusel KiXXX	kusel-kixxx-40	\N	f
2534	2022-03-24 10:54:41	2022-03-24 10:54:41	Nederland NT	nederland-nt-51	\N	f
2535	2022-03-24 10:54:41	2022-03-24 10:54:41	Athena Bracciano	athena-bracciano-162	\N	f
2536	2022-03-24 10:54:41	2022-03-24 10:54:41	Athena Bracciano	athena-bracciano-163	\N	f
2537	2022-03-24 10:54:41	2022-03-24 10:54:41	DLRG Niedersachsen	dlrg-niedersachsen-174	\N	f
2538	2022-03-24 10:54:42	2022-03-24 10:54:42	Athena Bracciano	athena-bracciano-164	\N	f
2539	2022-03-24 10:54:42	2022-03-24 10:54:42	France NT	france-nt-134	\N	f
2540	2022-03-24 10:54:42	2022-03-24 10:54:42	France NT	france-nt-135	\N	f
2541	2022-03-24 10:54:42	2022-03-24 10:54:42	In Sport Rane Rosse	in-sport-rane-rosse-86	\N	f
2542	2022-03-24 10:54:42	2022-03-24 10:54:42	DLRG Niedersachsen	dlrg-niedersachsen-175	\N	f
2543	2022-03-24 10:54:42	2022-03-24 10:54:42	Italy NT	italy-nt-118	\N	f
2544	2022-03-24 10:54:43	2022-03-24 10:54:43	DLRG Niedersachsen	dlrg-niedersachsen-176	\N	f
2545	2022-03-24 10:54:43	2022-03-24 10:54:43	Spain NT	spain-nt-114	\N	f
2546	2022-03-24 10:54:43	2022-03-24 10:54:43	SAFA 2000	safa-2000-43	\N	f
2547	2022-03-24 10:54:43	2022-03-24 10:54:43	CKS Szczecin	cks-szczecin-68	\N	f
2548	2022-03-24 10:54:43	2022-03-24 10:54:43	Accademia Di Salvamento	accademia-di-salvamento-154	\N	f
2549	2022-03-24 10:54:43	2022-03-24 10:54:43	ASD Gorizia Nuoto	asd-gorizia-nuoto-38	\N	f
2550	2022-03-24 10:54:43	2022-03-24 10:54:43	In Sport Rane Rosse	in-sport-rane-rosse-87	\N	f
2551	2022-03-24 10:54:43	2022-03-24 10:54:43	Liege Sauvetage Club	liege-sauvetage-club-51	\N	f
2552	2022-03-24 10:54:44	2022-03-24 10:54:44	In Sport Rane Rosse	in-sport-rane-rosse-88	\N	f
2553	2022-03-24 10:54:44	2022-03-24 10:54:44	France NT	france-nt-136	\N	f
2554	2022-03-24 10:54:44	2022-03-24 10:54:44	ASD Rosetana Nuoto	asd-rosetana-nuoto-35	\N	f
2555	2022-03-24 10:54:44	2022-03-24 10:54:44	Athena Bracciano	athena-bracciano-165	\N	f
2556	2022-03-24 10:54:44	2022-03-24 10:54:44	A.S.D. Sportiva Sturla	asd-sportiva-sturla-29	\N	f
2557	2022-03-24 10:54:44	2022-03-24 10:54:44	CKS Szczecin	cks-szczecin-69	\N	f
2558	2022-03-24 10:54:44	2022-03-24 10:54:44	Liege Sauvetage Club	liege-sauvetage-club-52	\N	f
2559	2022-03-24 10:54:44	2022-03-24 10:54:44	Slaskie WOPR	slaskie-wopr-85	\N	f
2560	2022-03-24 10:54:45	2022-03-24 10:54:45	A.S.D. Sportiva Sturla	asd-sportiva-sturla-30	\N	f
2561	2022-03-24 10:54:45	2022-03-24 10:54:45	Athena Bracciano	athena-bracciano-166	\N	f
2562	2022-03-24 10:54:45	2022-03-24 10:54:45	Slaskie WOPR	slaskie-wopr-86	\N	f
2563	2022-03-24 10:54:45	2022-03-24 10:54:45	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-81	\N	f
2564	2022-03-24 10:54:45	2022-03-24 10:54:45	DLRG Niedersachsen	dlrg-niedersachsen-177	\N	f
2565	2022-03-24 10:54:45	2022-03-24 10:54:45	DLRG Niedersachsen	dlrg-niedersachsen-178	\N	f
2566	2022-03-24 10:54:45	2022-03-24 10:54:45	DLRG Niedersachsen	dlrg-niedersachsen-179	\N	f
2567	2022-03-24 10:54:46	2022-03-24 10:54:46	Sint-Truidense RC	sint-truidense-rc-41	\N	f
2568	2022-03-24 10:54:46	2022-03-24 10:54:46	Sint-Truidense RC	sint-truidense-rc-42	\N	f
2569	2022-03-24 10:54:46	2022-03-24 10:54:46	Athena Salvamento	athena-salvamento-96	\N	f
2570	2022-03-24 10:54:46	2022-03-24 10:54:46	Accademia Di Salvamento	accademia-di-salvamento-155	\N	f
2571	2022-03-24 10:54:46	2022-03-24 10:54:46	MKS Szczecin	mks-szczecin-19	\N	f
2572	2022-03-24 10:54:46	2022-03-24 10:54:46	Accademia Di Salvamento	accademia-di-salvamento-156	\N	f
2573	2022-03-24 10:54:46	2022-03-24 10:54:46	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-4	\N	f
2574	2022-03-24 10:54:46	2022-03-24 10:54:46	DLRG Niedersachsen	dlrg-niedersachsen-180	\N	f
2575	2022-03-24 10:54:46	2022-03-24 10:54:46	DLRG Guetersloh	dlrg-guetersloh-62	\N	f
2576	2022-03-24 10:54:46	2022-03-24 10:54:46	Kusel KiXXX	kusel-kixxx-41	\N	f
2577	2022-03-24 10:54:46	2022-03-24 10:54:46	RB Waddinxveen	rb-waddinxveen-29	\N	f
2578	2022-03-24 10:54:47	2022-03-24 10:54:47	RB Waddinxveen	rb-waddinxveen-30	\N	f
2579	2022-03-24 10:54:47	2022-03-24 10:54:47	Kusel KiXXX	kusel-kixxx-42	\N	f
2580	2022-03-24 10:54:47	2022-03-24 10:54:47	RB Waddinxveen	rb-waddinxveen-31	\N	f
2581	2022-03-24 10:54:47	2022-03-24 10:54:47	DLRG Niedersachsen	dlrg-niedersachsen-181	\N	f
2582	2022-03-24 10:54:47	2022-03-24 10:54:47	Kusel KiXXX	kusel-kixxx-43	\N	f
2583	2022-03-24 10:54:47	2022-03-24 10:54:47	SAFA 2000	safa-2000-44	\N	f
2584	2022-03-24 10:54:47	2022-03-24 10:54:47	RB Delft	rb-delft-76	\N	f
2585	2022-03-24 10:54:47	2022-03-24 10:54:47	RB Delft	rb-delft-77	\N	f
2586	2022-03-24 10:54:47	2022-03-24 10:54:47	Spain NT	spain-nt-115	\N	f
2587	2022-03-24 10:54:48	2022-03-24 10:54:48	Italy NT	italy-nt-119	\N	f
2588	2022-03-24 10:54:48	2022-03-24 10:54:48	DLRG Buchholz United	dlrg-buchholz-united-36	\N	f
2589	2022-03-24 10:54:48	2022-03-24 10:54:48	RB Delft	rb-delft-78	\N	f
2590	2022-03-24 10:54:48	2022-03-24 10:54:48	RB Delft	rb-delft-79	\N	f
2591	2022-03-24 10:54:48	2022-03-24 10:54:48	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-7	\N	f
2592	2022-03-24 10:54:48	2022-03-24 10:54:48	Italy NT	italy-nt-120	\N	f
2593	2022-03-24 10:54:48	2022-03-24 10:54:48	Italy NT	italy-nt-121	\N	f
2594	2022-03-24 10:54:48	2022-03-24 10:54:48	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-33	\N	f
2595	2022-03-24 10:54:49	2022-03-24 10:54:49	Spain NT	spain-nt-116	\N	f
2596	2022-03-24 10:54:49	2022-03-24 10:54:49	Spain NT	spain-nt-117	\N	f
2597	2022-03-24 10:54:49	2022-03-24 10:54:49	Nederland NT	nederland-nt-52	\N	f
2598	2022-03-24 10:54:49	2022-03-24 10:54:49	Belgium NT	belgium-nt-73	\N	f
2599	2022-03-24 10:54:49	2022-03-24 10:54:49	France NT	france-nt-137	\N	f
2600	2022-03-24 10:54:49	2022-03-24 10:54:49	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-68	\N	f
2601	2022-03-24 10:54:49	2022-03-24 10:54:49	Athena Bracciano	athena-bracciano-167	\N	f
2602	2022-03-24 10:54:50	2022-03-24 10:54:50	Accademia Di Salvamento	accademia-di-salvamento-157	\N	f
2603	2022-03-24 10:54:50	2022-03-24 10:54:50	CKS Szczecin	cks-szczecin-70	\N	f
2604	2022-03-24 10:54:50	2022-03-24 10:54:50	France NT	france-nt-138	\N	f
2605	2022-03-24 10:54:50	2022-03-24 10:54:50	Slaskie WOPR	slaskie-wopr-87	\N	f
2606	2022-03-24 10:54:50	2022-03-24 10:54:50	DLRG Niedersachsen	dlrg-niedersachsen-182	\N	f
2607	2022-03-24 10:54:50	2022-03-24 10:54:50	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-82	\N	f
2608	2022-03-24 10:54:50	2022-03-24 10:54:50	Athena Salvamento	athena-salvamento-97	\N	f
2609	2022-03-24 10:54:51	2022-03-24 10:54:51	DLRG Niedersachsen	dlrg-niedersachsen-183	\N	f
2610	2022-03-24 10:54:51	2022-03-24 10:54:51	Athena Bracciano	athena-bracciano-168	\N	f
2611	2022-03-24 10:54:51	2022-03-24 10:54:51	Athena Salvamento	athena-salvamento-98	\N	f
2612	2022-03-24 10:54:51	2022-03-24 10:54:51	DLRG Guetersloh	dlrg-guetersloh-63	\N	f
2613	2022-03-24 10:54:51	2022-03-24 10:54:51	Hungarian NT	hungarian-nt-7	\N	f
2614	2022-03-24 10:54:52	2022-03-24 10:54:52	Italy NT	italy-nt-122	\N	f
2615	2022-03-24 10:54:52	2022-03-24 10:54:52	Italy NT	italy-nt-123	\N	f
2616	2022-03-24 10:54:52	2022-03-24 10:54:52	SAFA 2000	safa-2000-45	\N	f
2617	2022-03-24 10:54:52	2022-03-24 10:54:52	Polen NT	polen-nt-27	\N	f
2618	2022-03-24 10:54:52	2022-03-24 10:54:52	DLRG Luckenwalde	dlrg-luckenwalde-26	\N	f
2619	2022-03-24 10:54:52	2022-03-24 10:54:52	Spain NT	spain-nt-118	\N	f
2620	2022-03-24 10:54:52	2022-03-24 10:54:52	Spain NT	spain-nt-119	\N	f
2621	2022-03-24 10:54:53	2022-03-24 10:54:53	France NT	france-nt-139	\N	f
2622	2022-03-24 10:54:53	2022-03-24 10:54:53	Athena Bracciano	athena-bracciano-169	\N	f
2623	2022-03-24 10:54:53	2022-03-24 10:54:53	ASD Gorizia Nuoto	asd-gorizia-nuoto-39	\N	f
2624	2022-03-24 10:54:53	2022-03-24 10:54:53	A.S.D. Sportiva Sturla	asd-sportiva-sturla-31	\N	f
2625	2022-03-24 10:54:53	2022-03-24 10:54:53	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-83	\N	f
2626	2022-03-24 10:54:53	2022-03-24 10:54:53	CKS Szczecin	cks-szczecin-71	\N	f
2627	2022-03-24 10:54:54	2022-03-24 10:54:54	France NT	france-nt-140	\N	f
2628	2022-03-24 10:54:54	2022-03-24 10:54:54	ASD Rosetana Nuoto	asd-rosetana-nuoto-36	\N	f
2629	2022-03-24 10:54:54	2022-03-24 10:54:54	DLRG Guetersloh	dlrg-guetersloh-64	\N	f
2630	2022-03-24 10:54:54	2022-03-24 10:54:54	Accademia Di Salvamento	accademia-di-salvamento-158	\N	f
2631	2022-03-24 10:54:54	2022-03-24 10:54:54	DLRG Buchholz United	dlrg-buchholz-united-37	\N	f
2632	2022-03-24 10:54:54	2022-03-24 10:54:54	MKS Szczecin	mks-szczecin-20	\N	f
2633	2022-03-24 10:54:54	2022-03-24 10:54:54	Slaskie WOPR	slaskie-wopr-88	\N	f
2634	2022-03-24 10:54:55	2022-03-24 10:54:55	Accademia Di Salvamento	accademia-di-salvamento-159	\N	f
2635	2022-03-24 10:54:55	2022-03-24 10:54:55	Athena Bracciano	athena-bracciano-170	\N	f
2636	2022-03-24 10:54:55	2022-03-24 10:54:55	DLRG Niedersachsen	dlrg-niedersachsen-184	\N	f
2637	2022-03-24 10:54:56	2022-03-24 10:54:56	RB Waddinxveen	rb-waddinxveen-32	\N	f
2638	2022-03-24 10:54:56	2022-03-24 10:54:56	Athena Salvamento	athena-salvamento-99	\N	f
2639	2022-03-24 10:54:56	2022-03-24 10:54:56	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-84	\N	f
2640	2022-03-24 10:54:56	2022-03-24 10:54:56	RB Delft	rb-delft-80	\N	f
2641	2022-03-24 10:54:56	2022-03-24 10:54:56	SAFA 2000	safa-2000-46	\N	f
2642	2022-03-24 10:54:56	2022-03-24 10:54:56	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-69	\N	f
2643	2022-03-24 10:54:56	2022-03-24 10:54:56	Accademia Di Salvamento	accademia-di-salvamento-160	\N	f
2644	2022-03-24 10:54:56	2022-03-24 10:54:56	Belgium NT	belgium-nt-74	\N	f
2645	2022-03-24 10:54:57	2022-03-24 10:54:57	Italy NT	italy-nt-124	\N	f
2646	2022-03-24 10:54:57	2022-03-24 10:54:57	Accademia Di Salvamento	accademia-di-salvamento-161	\N	f
2647	2022-03-24 10:54:57	2022-03-24 10:54:57	Athena Bracciano	athena-bracciano-171	\N	f
2648	2022-03-24 10:54:57	2022-03-24 10:54:57	DLRG Niedersachsen	dlrg-niedersachsen-185	\N	f
2649	2022-03-24 10:54:57	2022-03-24 10:54:57	Kusel KiXXX	kusel-kixxx-44	\N	f
2650	2022-03-24 10:54:57	2022-03-24 10:54:57	Athena Salvamento	athena-salvamento-100	\N	f
2651	2022-03-24 10:54:57	2022-03-24 10:54:57	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-21	\N	f
2652	2022-03-24 10:54:58	2022-03-24 10:54:58	France NT	france-nt-141	\N	f
2653	2022-03-24 10:54:58	2022-03-24 10:54:58	In Sport Rane Rosse	in-sport-rane-rosse-89	\N	f
2654	2022-03-24 10:54:58	2022-03-24 10:54:58	Liege Sauvetage Club	liege-sauvetage-club-53	\N	f
2655	2022-03-24 10:54:58	2022-03-24 10:54:58	Slaskie WOPR	slaskie-wopr-89	\N	f
2656	2022-03-24 10:54:58	2022-03-24 10:54:58	DLRG Niedersachsen	dlrg-niedersachsen-186	\N	f
2657	2022-03-24 10:54:58	2022-03-24 10:54:58	Slaskie WOPR	slaskie-wopr-90	\N	f
2658	2022-03-24 10:54:58	2022-03-24 10:54:58	In Sport Rane Rosse	in-sport-rane-rosse-90	\N	f
2659	2022-03-24 10:54:59	2022-03-24 10:54:59	DLRG Niedersachsen	dlrg-niedersachsen-187	\N	f
2660	2022-03-24 10:54:59	2022-03-24 10:54:59	Slaskie WOPR	slaskie-wopr-91	\N	f
2661	2022-03-24 10:54:59	2022-03-24 10:54:59	In Sport Rane Rosse	in-sport-rane-rosse-91	\N	f
2662	2022-03-24 10:54:59	2022-03-24 10:54:59	DLRG Niedersachsen	dlrg-niedersachsen-188	\N	f
2663	2022-03-24 10:54:59	2022-03-24 10:54:59	In Sport Rane Rosse	in-sport-rane-rosse-92	\N	f
2664	2022-03-24 10:54:59	2022-03-24 10:54:59	Rctal	rctal-38	\N	f
2665	2022-03-24 10:54:59	2022-03-24 10:54:59	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-70	\N	f
2666	2022-03-24 10:54:59	2022-03-24 10:54:59	Athena Salvamento	athena-salvamento-101	\N	f
2667	2022-03-24 10:55:00	2022-03-24 10:55:00	In Sport Rane Rosse	in-sport-rane-rosse-93	\N	f
2668	2022-03-24 10:55:00	2022-03-24 10:55:00	ASD Rosetana Nuoto	asd-rosetana-nuoto-37	\N	f
2669	2022-03-24 10:55:00	2022-03-24 10:55:00	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-85	\N	f
2670	2022-03-24 10:55:00	2022-03-24 10:55:00	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-86	\N	f
2671	2022-03-24 10:55:00	2022-03-24 10:55:00	Rctal	rctal-39	\N	f
2672	2022-03-24 10:55:00	2022-03-24 10:55:00	RB Heytse	rb-heytse-56	\N	f
2673	2022-03-24 10:55:00	2022-03-24 10:55:00	CKS Szczecin	cks-szczecin-72	\N	f
2674	2022-03-24 10:55:00	2022-03-24 10:55:00	Liege Sauvetage Club	liege-sauvetage-club-54	\N	f
2675	2022-03-24 10:55:00	2022-03-24 10:55:00	DLRG Niedersachsen	dlrg-niedersachsen-189	\N	f
2676	2022-03-24 10:55:00	2022-03-24 10:55:00	RB Heytse	rb-heytse-57	\N	f
2677	2022-03-24 10:55:01	2022-03-24 10:55:01	Sint-Truidense RC	sint-truidense-rc-43	\N	f
2678	2022-03-24 10:55:01	2022-03-24 10:55:01	Accademia Di Salvamento	accademia-di-salvamento-162	\N	f
2679	2022-03-24 10:55:01	2022-03-24 10:55:01	Sint-Truidense RC	sint-truidense-rc-44	\N	f
2680	2022-03-24 10:55:01	2022-03-24 10:55:01	Accademia Di Salvamento	accademia-di-salvamento-163	\N	f
2681	2022-03-24 10:55:01	2022-03-24 10:55:01	Athena Salvamento	athena-salvamento-102	\N	f
2682	2022-03-24 10:55:01	2022-03-24 10:55:01	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-87	\N	f
2683	2022-03-24 10:55:01	2022-03-24 10:55:01	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-10	\N	f
2684	2022-03-24 10:55:01	2022-03-24 10:55:01	Liege Sauvetage Club	liege-sauvetage-club-55	\N	f
2685	2022-03-24 10:55:02	2022-03-24 10:55:02	DLRG Niedersachsen	dlrg-niedersachsen-190	\N	f
2686	2022-03-24 10:55:02	2022-03-24 10:55:02	Sint-Truidense RC	sint-truidense-rc-45	\N	f
2687	2022-03-24 10:55:02	2022-03-24 10:55:02	Rctal	rctal-40	\N	f
2688	2022-03-24 10:55:02	2022-03-24 10:55:02	Athena Salvamento	athena-salvamento-103	\N	f
2689	2022-03-24 10:55:03	2022-03-24 10:55:03	Athena Salvamento	athena-salvamento-104	\N	f
2690	2022-03-24 10:55:03	2022-03-24 10:55:03	Athena Bracciano	athena-bracciano-172	\N	f
2691	2022-03-24 10:55:03	2022-03-24 10:55:03	Athena Salvamento	athena-salvamento-105	\N	f
2692	2022-03-24 10:55:03	2022-03-24 10:55:03	Slaskie WOPR	slaskie-wopr-92	\N	f
2693	2022-03-24 10:55:03	2022-03-24 10:55:03	DLRG Guetersloh	dlrg-guetersloh-65	\N	f
2694	2022-03-24 10:55:04	2022-03-24 10:55:04	RB Delft	rb-delft-81	\N	f
2695	2022-03-24 10:55:04	2022-03-24 10:55:04	DLRG Guetersloh	dlrg-guetersloh-66	\N	f
2696	2022-03-24 10:55:04	2022-03-24 10:55:04	Athena Salvamento	athena-salvamento-106	\N	f
2697	2022-03-24 10:55:04	2022-03-24 10:55:04	DLRG Guetersloh	dlrg-guetersloh-67	\N	f
2698	2022-03-24 10:55:04	2022-03-24 10:55:04	RB Heytse	rb-heytse-58	\N	f
2699	2022-03-24 10:55:04	2022-03-24 10:55:04	Nederland NT	nederland-nt-53	\N	f
2700	2022-03-24 10:55:04	2022-03-24 10:55:04	Italy NT	italy-nt-125	\N	f
2701	2022-03-24 10:55:04	2022-03-24 10:55:04	Belgium NT	belgium-nt-75	\N	f
2702	2022-03-24 10:55:04	2022-03-24 10:55:04	Italy NT	italy-nt-126	\N	f
2703	2022-03-24 10:55:05	2022-03-24 10:55:05	Nederland NT	nederland-nt-54	\N	f
2704	2022-03-24 10:55:05	2022-03-24 10:55:05	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-34	\N	f
2705	2022-03-24 10:55:05	2022-03-24 10:55:05	France NT	france-nt-142	\N	f
2706	2022-03-24 10:55:05	2022-03-24 10:55:05	Spain NT	spain-nt-120	\N	f
2707	2022-03-24 10:55:05	2022-03-24 10:55:05	France NT	france-nt-143	\N	f
2708	2022-03-24 10:55:05	2022-03-24 10:55:05	Nederland NT	nederland-nt-55	\N	f
2709	2022-03-24 10:55:05	2022-03-24 10:55:05	Spain NT	spain-nt-121	\N	f
2710	2022-03-24 10:55:05	2022-03-24 10:55:05	Italy NT	italy-nt-127	\N	f
2711	2022-03-24 10:55:05	2022-03-24 10:55:05	France NT	france-nt-144	\N	f
2712	2022-03-24 10:55:06	2022-03-24 10:55:06	DLRG Bad Oldesloe	dlrg-bad-oldesloe-12	\N	f
2713	2022-03-24 10:55:06	2022-03-24 10:55:06	Belgium NT	belgium-nt-76	\N	f
2714	2022-03-24 10:55:06	2022-03-24 10:55:06	Nederland NT	nederland-nt-56	\N	f
2715	2022-03-24 10:55:06	2022-03-24 10:55:06	CKS Szczecin	cks-szczecin-73	\N	f
2716	2022-03-24 10:55:06	2022-03-24 10:55:06	Belgium NT	belgium-nt-77	\N	f
2717	2022-03-24 10:55:06	2022-03-24 10:55:06	Accademia Di Salvamento	accademia-di-salvamento-164	\N	f
2718	2022-03-24 10:55:06	2022-03-24 10:55:06	Athena Bracciano	athena-bracciano-173	\N	f
2719	2022-03-24 10:55:06	2022-03-24 10:55:06	ASD Gorizia Nuoto	asd-gorizia-nuoto-40	\N	f
2720	2022-03-24 10:55:06	2022-03-24 10:55:06	A.S.D. Sportiva Sturla	asd-sportiva-sturla-32	\N	f
2721	2022-03-24 10:55:06	2022-03-24 10:55:06	Rctal	rctal-41	\N	f
2722	2022-03-24 10:55:07	2022-03-24 10:55:07	CKS Szczecin	cks-szczecin-74	\N	f
2723	2022-03-24 10:55:07	2022-03-24 10:55:07	Kusel KiXXX	kusel-kixxx-45	\N	f
2724	2022-03-24 10:55:07	2022-03-24 10:55:07	Accademia Di Salvamento	accademia-di-salvamento-165	\N	f
2725	2022-03-24 10:55:07	2022-03-24 10:55:07	Nederland NT	nederland-nt-57	\N	f
2726	2022-03-24 10:55:07	2022-03-24 10:55:07	Slaskie WOPR	slaskie-wopr-93	\N	f
2727	2022-03-24 10:55:07	2022-03-24 10:55:07	Athena Bracciano	athena-bracciano-174	\N	f
2728	2022-03-24 10:55:08	2022-03-24 10:55:08	DLRG Niedersachsen	dlrg-niedersachsen-191	\N	f
2729	2022-03-24 10:55:08	2022-03-24 10:55:08	Accademia Di Salvamento	accademia-di-salvamento-166	\N	f
2730	2022-03-24 10:55:08	2022-03-24 10:55:08	DLRG Luckenwalde	dlrg-luckenwalde-27	\N	f
2731	2022-03-24 10:55:08	2022-03-24 10:55:08	Athena Bracciano	athena-bracciano-175	\N	f
2732	2022-03-24 10:55:08	2022-03-24 10:55:08	Athena Bracciano	athena-bracciano-176	\N	f
2733	2022-03-24 10:55:09	2022-03-24 10:55:09	Athena Bracciano	athena-bracciano-177	\N	f
2734	2022-03-24 10:55:09	2022-03-24 10:55:09	DLRG Niedersachsen	dlrg-niedersachsen-192	\N	f
2735	2022-03-24 10:55:09	2022-03-24 10:55:09	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-35	\N	f
2736	2022-03-24 10:55:09	2022-03-24 10:55:09	A.S.D. Sportiva Sturla	asd-sportiva-sturla-33	\N	f
2737	2022-03-24 10:55:09	2022-03-24 10:55:09	Belgium NT	belgium-nt-78	\N	f
2738	2022-03-24 10:55:09	2022-03-24 10:55:09	Italy NT	italy-nt-128	\N	f
2739	2022-03-24 10:55:10	2022-03-24 10:55:10	DLRG Niedersachsen	dlrg-niedersachsen-193	\N	f
2740	2022-03-24 10:55:10	2022-03-24 10:55:10	Italy NT	italy-nt-129	\N	f
2741	2022-03-24 10:55:10	2022-03-24 10:55:10	Italy NT	italy-nt-130	\N	f
2742	2022-03-24 10:55:10	2022-03-24 10:55:10	ASD Gorizia Nuoto	asd-gorizia-nuoto-41	\N	f
2743	2022-03-24 10:55:10	2022-03-24 10:55:10	Spain NT	spain-nt-122	\N	f
2744	2022-03-24 10:55:10	2022-03-24 10:55:10	Polen NT	polen-nt-28	\N	f
2745	2022-03-24 10:55:10	2022-03-24 10:55:10	SAFA 2000	safa-2000-47	\N	f
2746	2022-03-24 10:55:10	2022-03-24 10:55:10	Polen NT	polen-nt-29	\N	f
2747	2022-03-24 10:55:10	2022-03-24 10:55:10	Beacon Lifesaving Club	beacon-lifesaving-club-15	\N	f
2748	2022-03-24 10:55:11	2022-03-24 10:55:11	Spain NT	spain-nt-123	\N	f
2749	2022-03-24 10:55:11	2022-03-24 10:55:11	France NT	france-nt-145	\N	f
2750	2022-03-24 10:55:11	2022-03-24 10:55:11	CKS Szczecin	cks-szczecin-75	\N	f
2751	2022-03-24 10:55:11	2022-03-24 10:55:11	Beacon Lifesaving Club	beacon-lifesaving-club-16	\N	f
2752	2022-03-24 10:55:11	2022-03-24 10:55:11	In Sport Rane Rosse	in-sport-rane-rosse-94	\N	f
2753	2022-03-24 10:55:11	2022-03-24 10:55:11	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-22	\N	f
2754	2022-03-24 10:55:11	2022-03-24 10:55:11	Accademia Di Salvamento	accademia-di-salvamento-167	\N	f
2755	2022-03-24 10:55:11	2022-03-24 10:55:11	In Sport Rane Rosse	in-sport-rane-rosse-95	\N	f
2756	2022-03-24 10:55:11	2022-03-24 10:55:11	CKS Szczecin	cks-szczecin-76	\N	f
2757	2022-03-24 10:55:11	2022-03-24 10:55:11	CKS Szczecin	cks-szczecin-77	\N	f
2758	2022-03-24 10:55:12	2022-03-24 10:55:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-88	\N	f
2759	2022-03-24 10:55:12	2022-03-24 10:55:12	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-5	\N	f
2760	2022-03-24 10:55:12	2022-03-24 10:55:12	A.S.D. Sportiva Sturla	asd-sportiva-sturla-34	\N	f
2761	2022-03-24 10:55:12	2022-03-24 10:55:12	ASD Gorizia Nuoto	asd-gorizia-nuoto-42	\N	f
2762	2022-03-24 10:55:12	2022-03-24 10:55:12	Slaskie WOPR	slaskie-wopr-94	\N	f
2763	2022-03-24 10:55:12	2022-03-24 10:55:12	MKS Szczecin	mks-szczecin-21	\N	f
2764	2022-03-24 10:55:12	2022-03-24 10:55:12	DLRG Niedersachsen	dlrg-niedersachsen-194	\N	f
2765	2022-03-24 10:55:12	2022-03-24 10:55:12	In Sport Rane Rosse	in-sport-rane-rosse-96	\N	f
2766	2022-03-24 10:55:13	2022-03-24 10:55:13	Accademia Di Salvamento	accademia-di-salvamento-168	\N	f
2767	2022-03-24 10:55:13	2022-03-24 10:55:13	DLRG Guetersloh	dlrg-guetersloh-68	\N	f
2768	2022-03-24 10:55:13	2022-03-24 10:55:13	In Sport Rane Rosse	in-sport-rane-rosse-97	\N	f
2769	2022-03-24 10:55:13	2022-03-24 10:55:13	Liege Sauvetage Club	liege-sauvetage-club-56	\N	f
2770	2022-03-24 10:55:13	2022-03-24 10:55:13	Athena Salvamento	athena-salvamento-107	\N	f
2771	2022-03-24 10:55:13	2022-03-24 10:55:13	In Sport Rane Rosse	in-sport-rane-rosse-98	\N	f
2772	2022-03-24 10:55:13	2022-03-24 10:55:13	France NT	france-nt-146	\N	f
2773	2022-03-24 10:55:14	2022-03-24 10:55:14	DLRG Niedersachsen	dlrg-niedersachsen-195	\N	f
2774	2022-03-24 10:55:14	2022-03-24 10:55:14	Slaskie WOPR	slaskie-wopr-95	\N	f
2775	2022-03-24 10:55:14	2022-03-24 10:55:14	France NT	france-nt-147	\N	f
2776	2022-03-24 10:55:14	2022-03-24 10:55:14	Spain NT	spain-nt-124	\N	f
2777	2022-03-24 10:55:14	2022-03-24 10:55:14	DLRG Luckenwalde	dlrg-luckenwalde-28	\N	f
2778	2022-03-24 10:55:14	2022-03-24 10:55:14	France NT	france-nt-148	\N	f
2779	2022-03-24 10:55:14	2022-03-24 10:55:14	SAFA 2000	safa-2000-48	\N	f
2780	2022-03-24 10:55:14	2022-03-24 10:55:14	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-89	\N	f
2781	2022-03-24 10:55:14	2022-03-24 10:55:14	ASD Gorizia Nuoto	asd-gorizia-nuoto-43	\N	f
2782	2022-03-24 10:55:15	2022-03-24 10:55:15	ASD Rosetana Nuoto	asd-rosetana-nuoto-38	\N	f
2783	2022-03-24 10:55:15	2022-03-24 10:55:15	Riis Park	riis-park	\N	f
2784	2022-03-24 10:55:15	2022-03-24 10:55:15	A.S.D. Sportiva Sturla	asd-sportiva-sturla-35	\N	f
2785	2022-03-24 10:55:15	2022-03-24 10:55:15	DLRG Luckenwalde	dlrg-luckenwalde-29	\N	f
2786	2022-03-24 10:55:15	2022-03-24 10:55:15	Belgium NT	belgium-nt-79	\N	f
2787	2022-03-24 10:55:15	2022-03-24 10:55:15	Athena Bracciano	athena-bracciano-178	\N	f
2788	2022-03-24 10:55:15	2022-03-24 10:55:15	A.S.D. Sportiva Sturla	asd-sportiva-sturla-36	\N	f
2789	2022-03-24 10:55:15	2022-03-24 10:55:15	Beacon Lifesaving Club	beacon-lifesaving-club-17	\N	f
2790	2022-03-24 10:55:15	2022-03-24 10:55:15	France NT	france-nt-149	\N	f
2791	2022-03-24 10:55:15	2022-03-24 10:55:15	ASD Rosetana Nuoto	asd-rosetana-nuoto-39	\N	f
2792	2022-03-24 10:55:15	2022-03-24 10:55:15	DLRG Luckenwalde	dlrg-luckenwalde-30	\N	f
2793	2022-03-24 10:55:15	2022-03-24 10:55:15	RB Heytse	rb-heytse-59	\N	f
2794	2022-03-24 10:55:16	2022-03-24 10:55:16	RB Heytse	rb-heytse-60	\N	f
2795	2022-03-24 10:55:16	2022-03-24 10:55:16	Accademia Di Salvamento	accademia-di-salvamento-169	\N	f
2796	2022-03-24 10:55:16	2022-03-24 10:55:16	Athena Salvamento	athena-salvamento-108	\N	f
2797	2022-03-24 10:55:16	2022-03-24 10:55:16	Belgium NT	belgium-nt-80	\N	f
2798	2022-03-24 10:55:16	2022-03-24 10:55:16	Athena Bracciano	athena-bracciano-179	\N	f
2799	2022-03-24 10:55:16	2022-03-24 10:55:16	ASD Rosetana Nuoto	asd-rosetana-nuoto-40	\N	f
2800	2022-03-24 10:55:16	2022-03-24 10:55:16	DLRG Luckenwalde	dlrg-luckenwalde-31	\N	f
2801	2022-03-24 10:55:16	2022-03-24 10:55:16	ASD Gorizia Nuoto	asd-gorizia-nuoto-44	\N	f
2802	2022-03-24 10:55:16	2022-03-24 10:55:16	Rctal	rctal-42	\N	f
2803	2022-03-24 10:55:17	2022-03-24 10:55:17	DLRG Niedersachsen	dlrg-niedersachsen-196	\N	f
2804	2022-03-24 10:55:17	2022-03-24 10:55:17	DLRG Niedersachsen	dlrg-niedersachsen-197	\N	f
2805	2022-03-24 10:55:17	2022-03-24 10:55:17	Athena Salvamento	athena-salvamento-109	\N	f
2806	2022-03-24 10:55:17	2022-03-24 10:55:17	Accademia Di Salvamento	accademia-di-salvamento-170	\N	f
2807	2022-03-24 10:55:18	2022-03-24 10:55:18	Athena Salvamento	athena-salvamento-110	\N	f
2808	2022-03-24 10:55:18	2022-03-24 10:55:18	Athena Bracciano	athena-bracciano-180	\N	f
2809	2022-03-24 10:55:18	2022-03-24 10:55:18	Kusel KiXXX	kusel-kixxx-46	\N	f
2810	2022-03-24 10:55:18	2022-03-24 10:55:18	RB Delft	rb-delft-82	\N	f
2811	2022-03-24 10:55:18	2022-03-24 10:55:18	RB Delft	rb-delft-83	\N	f
2812	2022-03-24 10:55:18	2022-03-24 10:55:18	DLRG Buchholz United	dlrg-buchholz-united-38	\N	f
2813	2022-03-24 10:55:18	2022-03-24 10:55:18	ASD Gorizia Nuoto	asd-gorizia-nuoto-45	\N	f
2814	2022-03-24 10:55:18	2022-03-24 10:55:18	DLRG Buchholz United	dlrg-buchholz-united-39	\N	f
2815	2022-03-24 10:55:19	2022-03-24 10:55:19	Athena Bracciano	athena-bracciano-181	\N	f
2816	2022-03-24 10:55:19	2022-03-24 10:55:19	DLRG Buchholz United	dlrg-buchholz-united-40	\N	f
2817	2022-03-24 10:55:19	2022-03-24 10:55:19	RB Delft	rb-delft-84	\N	f
2818	2022-03-24 10:55:19	2022-03-24 10:55:19	RB Delft	rb-delft-85	\N	f
2819	2022-03-24 10:55:19	2022-03-24 10:55:19	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-8	\N	f
2820	2022-03-24 10:55:19	2022-03-24 10:55:19	In Sport Rane Rosse	in-sport-rane-rosse-99	\N	f
2821	2022-03-24 10:55:20	2022-03-24 10:55:20	Belgium NT	belgium-nt-81	\N	f
2822	2022-03-24 10:55:20	2022-03-24 10:55:20	Spain NT	spain-nt-125	\N	f
2823	2022-03-24 10:55:20	2022-03-24 10:55:20	Italy NT	italy-nt-131	\N	f
2824	2022-03-24 10:55:20	2022-03-24 10:55:20	Athena Salvamento	athena-salvamento-111	\N	f
2825	2022-03-24 10:55:20	2022-03-24 10:55:20	Athena Bracciano	athena-bracciano-182	\N	f
2826	2022-03-24 10:55:21	2022-03-24 10:55:21	Slaskie WOPR	slaskie-wopr-96	\N	f
2827	2022-03-24 10:55:21	2022-03-24 10:55:21	Athena Bracciano	athena-bracciano-183	\N	f
2828	2022-03-24 10:55:21	2022-03-24 10:55:21	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-71	\N	f
2829	2022-03-24 10:55:21	2022-03-24 10:55:21	Spain NT	spain-nt-126	\N	f
2830	2022-03-24 10:55:21	2022-03-24 10:55:21	France NT	france-nt-150	\N	f
2831	2022-03-24 10:55:21	2022-03-24 10:55:21	Spain NT	spain-nt-127	\N	f
2832	2022-03-24 10:55:21	2022-03-24 10:55:21	Nederland NT	nederland-nt-58	\N	f
2833	2022-03-24 10:55:21	2022-03-24 10:55:21	Liege Sauvetage Club	liege-sauvetage-club-57	\N	f
2834	2022-03-24 10:55:22	2022-03-24 10:55:22	Athena Bracciano	athena-bracciano-184	\N	f
2835	2022-03-24 10:55:22	2022-03-24 10:55:22	ASD Rosetana Nuoto	asd-rosetana-nuoto-41	\N	f
2836	2022-03-24 10:55:22	2022-03-24 10:55:22	In Sport Rane Rosse	in-sport-rane-rosse-100	\N	f
2837	2022-03-24 10:55:22	2022-03-24 10:55:22	France NT	france-nt-151	\N	f
2838	2022-03-24 10:55:22	2022-03-24 10:55:22	Liege Sauvetage Club	liege-sauvetage-club-58	\N	f
2839	2022-03-24 10:55:22	2022-03-24 10:55:22	France NT	france-nt-152	\N	f
2840	2022-03-24 10:55:22	2022-03-24 10:55:22	Sint-Truidense RC	sint-truidense-rc-46	\N	f
2841	2022-03-24 10:55:22	2022-03-24 10:55:22	Slaskie WOPR	slaskie-wopr-97	\N	f
2842	2022-03-24 10:55:23	2022-03-24 10:55:23	In Sport Rane Rosse	in-sport-rane-rosse-101	\N	f
2843	2022-03-24 10:55:23	2022-03-24 10:55:23	In Sport Rane Rosse	in-sport-rane-rosse-102	\N	f
2844	2022-03-24 10:55:23	2022-03-24 10:55:23	Athena Salvamento	athena-salvamento-112	\N	f
2845	2022-03-24 10:55:23	2022-03-24 10:55:23	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-23	\N	f
2846	2022-03-24 10:55:23	2022-03-24 10:55:23	In Sport Rane Rosse	in-sport-rane-rosse-103	\N	f
2847	2022-03-24 10:55:23	2022-03-24 10:55:23	Slaskie WOPR	slaskie-wopr-98	\N	f
2848	2022-03-24 10:55:23	2022-03-24 10:55:23	DLRG Guetersloh	dlrg-guetersloh-69	\N	f
2849	2022-03-24 10:55:23	2022-03-24 10:55:23	CKS Szczecin	cks-szczecin-78	\N	f
2850	2022-03-24 10:55:24	2022-03-24 10:55:24	Accademia Di Salvamento	accademia-di-salvamento-171	\N	f
2851	2022-03-24 10:55:24	2022-03-24 10:55:24	Athena Salvamento	athena-salvamento-113	\N	f
2852	2022-03-24 10:55:24	2022-03-24 10:55:24	Athena Salvamento	athena-salvamento-114	\N	f
2853	2022-03-24 10:55:24	2022-03-24 10:55:24	In Sport Rane Rosse	in-sport-rane-rosse-104	\N	f
2854	2022-03-24 10:55:24	2022-03-24 10:55:24	Rctal	rctal-43	\N	f
2855	2022-03-24 10:55:24	2022-03-24 10:55:24	RB Heytse	rb-heytse-61	\N	f
2856	2022-03-24 10:55:24	2022-03-24 10:55:24	Rctal	rctal-44	\N	f
2857	2022-03-24 10:55:24	2022-03-24 10:55:24	Sint-Truidense RC	sint-truidense-rc-47	\N	f
2858	2022-03-24 10:55:24	2022-03-24 10:55:24	Sint-Truidense RC	sint-truidense-rc-48	\N	f
2859	2022-03-24 10:55:25	2022-03-24 10:55:25	CKS Szczecin	cks-szczecin-79	\N	f
2860	2022-03-24 10:55:25	2022-03-24 10:55:25	Athena Bracciano	athena-bracciano-185	\N	f
2861	2022-03-24 10:55:25	2022-03-24 10:55:25	Rctal	rctal-45	\N	f
2862	2022-03-24 10:55:25	2022-03-24 10:55:25	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-11	\N	f
2863	2022-03-24 10:55:25	2022-03-24 10:55:25	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-90	\N	f
2864	2022-03-24 10:55:25	2022-03-24 10:55:25	DLRG Niedersachsen	dlrg-niedersachsen-198	\N	f
2865	2022-03-24 10:55:25	2022-03-24 10:55:25	DLRG Guetersloh	dlrg-guetersloh-70	\N	f
2866	2022-03-24 10:55:26	2022-03-24 10:55:26	DLRG Niedersachsen	dlrg-niedersachsen-199	\N	f
2867	2022-03-24 10:55:26	2022-03-24 10:55:26	Athena Bracciano	athena-bracciano-186	\N	f
2868	2022-03-24 10:55:26	2022-03-24 10:55:26	Athena Salvamento	athena-salvamento-115	\N	f
2869	2022-03-24 10:55:26	2022-03-24 10:55:26	RB Delft	rb-delft-86	\N	f
2870	2022-03-24 10:55:26	2022-03-24 10:55:26	RB Heytse	rb-heytse-62	\N	f
2871	2022-03-24 10:55:26	2022-03-24 10:55:26	Liege Sauvetage Club	liege-sauvetage-club-59	\N	f
2872	2022-03-24 10:55:27	2022-03-24 10:55:27	Slaskie WOPR	slaskie-wopr-99	\N	f
2873	2022-03-24 10:55:27	2022-03-24 10:55:27	DLRG Guetersloh	dlrg-guetersloh-71	\N	f
2874	2022-03-24 10:55:27	2022-03-24 10:55:27	Athena Salvamento	athena-salvamento-116	\N	f
2875	2022-03-24 10:55:27	2022-03-24 10:55:27	DLRG Guetersloh	dlrg-guetersloh-72	\N	f
2876	2022-03-24 10:55:27	2022-03-24 10:55:27	Athena Salvamento	athena-salvamento-117	\N	f
2877	2022-03-24 10:55:27	2022-03-24 10:55:27	RB Heytse	rb-heytse-63	\N	f
2878	2022-03-24 10:55:27	2022-03-24 10:55:27	Italy NT	italy-nt-132	\N	f
2879	2022-03-24 10:55:28	2022-03-24 10:55:28	Italy NT	italy-nt-133	\N	f
2880	2022-03-24 10:55:28	2022-03-24 10:55:28	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-36	\N	f
2881	2022-03-24 10:55:28	2022-03-24 10:55:28	In Sport Rane Rosse	in-sport-rane-rosse-105	\N	f
2882	2022-03-24 10:55:28	2022-03-24 10:55:28	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-91	\N	f
2883	2022-03-24 10:55:28	2022-03-24 10:55:28	Spain NT	spain-nt-128	\N	f
2884	2022-03-24 10:55:28	2022-03-24 10:55:28	In Sport Rane Rosse	in-sport-rane-rosse-106	\N	f
2885	2022-03-24 10:55:28	2022-03-24 10:55:28	France NT	france-nt-153	\N	f
2886	2022-03-24 10:55:28	2022-03-24 10:55:28	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-6	\N	f
2887	2022-03-24 10:55:28	2022-03-24 10:55:28	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-72	\N	f
2888	2022-03-24 10:55:29	2022-03-24 10:55:29	CKS Szczecin	cks-szczecin-80	\N	f
2889	2022-03-24 10:55:29	2022-03-24 10:55:29	Athena Bracciano	athena-bracciano-187	\N	f
2890	2022-03-24 10:55:29	2022-03-24 10:55:29	Belgium NT	belgium-nt-82	\N	f
2891	2022-03-24 10:55:29	2022-03-24 10:55:29	A.S.D. Sportiva Sturla	asd-sportiva-sturla-37	\N	f
2892	2022-03-24 10:55:29	2022-03-24 10:55:29	Slaskie WOPR	slaskie-wopr-100	\N	f
2893	2022-03-24 10:55:29	2022-03-24 10:55:29	Nederland NT	nederland-nt-59	\N	f
2894	2022-03-24 10:55:29	2022-03-24 10:55:29	Rctal	rctal-46	\N	f
2895	2022-03-24 10:55:29	2022-03-24 10:55:29	Athena Bracciano	athena-bracciano-188	\N	f
2896	2022-03-24 10:55:30	2022-03-24 10:55:30	Athena Bracciano	athena-bracciano-189	\N	f
2897	2022-03-24 10:55:30	2022-03-24 10:55:30	Italy NT	italy-nt-134	\N	f
2898	2022-03-24 10:55:30	2022-03-24 10:55:30	Nederland NT	nederland-nt-60	\N	f
2899	2022-03-24 10:55:30	2022-03-24 10:55:30	A.S.D. Sportiva Sturla	asd-sportiva-sturla-38	\N	f
2900	2022-03-24 10:55:30	2022-03-24 10:55:30	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-7	\N	f
2901	2022-03-24 10:55:30	2022-03-24 10:55:30	Belgium NT	belgium-nt-83	\N	f
2902	2022-03-24 10:55:30	2022-03-24 10:55:30	Nederland NT	nederland-nt-61	\N	f
2903	2022-03-24 10:55:30	2022-03-24 10:55:30	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-92	\N	f
2904	2022-03-24 10:55:31	2022-03-24 10:55:31	SAFA 2000	safa-2000-49	\N	f
2905	2022-03-24 10:55:31	2022-03-24 10:55:31	Spain NT	spain-nt-129	\N	f
2906	2022-03-24 10:55:31	2022-03-24 10:55:31	DLRG Guetersloh	dlrg-guetersloh-73	\N	f
2907	2022-03-24 10:55:31	2022-03-24 10:55:31	France NT	france-nt-154	\N	f
2908	2022-03-24 10:55:31	2022-03-24 10:55:31	France NT	france-nt-155	\N	f
2909	2022-03-24 10:55:31	2022-03-24 10:55:31	Spain NT	spain-nt-130	\N	f
2910	2022-03-24 10:55:32	2022-03-24 10:55:32	CKS Szczecin	cks-szczecin-81	\N	f
2911	2022-03-24 10:55:32	2022-03-24 10:55:32	France NT	france-nt-156	\N	f
2912	2022-03-24 10:55:32	2022-03-24 10:55:32	SAFA 2000	safa-2000-50	\N	f
2913	2022-03-24 10:55:32	2022-03-24 10:55:32	Polen NT	polen-nt-30	\N	f
2914	2022-03-24 10:55:32	2022-03-24 10:55:32	Liege Sauvetage Club	liege-sauvetage-club-60	\N	f
2915	2022-03-24 10:55:32	2022-03-24 10:55:32	Accademia Di Salvamento	accademia-di-salvamento-172	\N	f
2916	2022-03-24 10:55:32	2022-03-24 10:55:32	In Sport Rane Rosse	in-sport-rane-rosse-107	\N	f
2917	2022-03-24 10:55:32	2022-03-24 10:55:32	DLRG Guetersloh	dlrg-guetersloh-74	\N	f
2918	2022-03-24 10:55:32	2022-03-24 10:55:32	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-24	\N	f
2919	2022-03-24 10:55:33	2022-03-24 10:55:33	Athena Bracciano	athena-bracciano-190	\N	f
2920	2022-03-24 10:55:33	2022-03-24 10:55:33	In Sport Rane Rosse	in-sport-rane-rosse-108	\N	f
2921	2022-03-24 10:55:33	2022-03-24 10:55:33	CKS Szczecin	cks-szczecin-82	\N	f
2922	2022-03-24 10:55:33	2022-03-24 10:55:33	France NT	france-nt-157	\N	f
2923	2022-03-24 10:55:33	2022-03-24 10:55:33	Accademia Di Salvamento	accademia-di-salvamento-173	\N	f
2924	2022-03-24 10:55:34	2022-03-24 10:55:34	Accademia Di Salvamento	accademia-di-salvamento-174	\N	f
2925	2022-03-24 10:55:34	2022-03-24 10:55:34	ASD Rosetana Nuoto	asd-rosetana-nuoto-42	\N	f
2926	2022-03-24 10:55:34	2022-03-24 10:55:34	Athena Bracciano	athena-bracciano-191	\N	f
2927	2022-03-24 10:55:34	2022-03-24 10:55:34	MKS Szczecin	mks-szczecin-22	\N	f
2928	2022-03-24 10:55:34	2022-03-24 10:55:34	Beacon Lifesaving Club	beacon-lifesaving-club-18	\N	f
2929	2022-03-24 10:55:34	2022-03-24 10:55:34	In Sport Rane Rosse	in-sport-rane-rosse-109	\N	f
2930	2022-03-24 10:55:34	2022-03-24 10:55:34	In Sport Rane Rosse	in-sport-rane-rosse-110	\N	f
2931	2022-03-24 10:55:34	2022-03-24 10:55:34	Sint-Truidense RC	sint-truidense-rc-49	\N	f
2932	2022-03-24 10:55:34	2022-03-24 10:55:34	CKS Szczecin	cks-szczecin-83	\N	f
2933	2022-03-24 10:55:35	2022-03-24 10:55:35	Slaskie WOPR	slaskie-wopr-101	\N	f
2934	2022-03-24 10:55:35	2022-03-24 10:55:35	Liege Sauvetage Club	liege-sauvetage-club-61	\N	f
2935	2022-03-24 10:55:35	2022-03-24 10:55:35	MKS Szczecin	mks-szczecin-23	\N	f
2936	2022-03-24 10:55:35	2022-03-24 10:55:35	Athena Bracciano	athena-bracciano-192	\N	f
2937	2022-03-24 10:55:35	2022-03-24 10:55:35	Sint-Truidense RC	sint-truidense-rc-50	\N	f
2938	2022-03-24 10:55:35	2022-03-24 10:55:35	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-93	\N	f
2939	2022-03-24 10:55:35	2022-03-24 10:55:35	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-6	\N	f
2940	2022-03-24 10:55:35	2022-03-24 10:55:35	Accademia Di Salvamento	accademia-di-salvamento-175	\N	f
2941	2022-03-24 10:55:36	2022-03-24 10:55:36	RB Delft	rb-delft-87	\N	f
2942	2022-03-24 10:55:36	2022-03-24 10:55:36	Athena Bracciano	athena-bracciano-193	\N	f
2943	2022-03-24 10:55:36	2022-03-24 10:55:36	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-73	\N	f
2944	2022-03-24 10:55:36	2022-03-24 10:55:36	Athena Salvamento	athena-salvamento-118	\N	f
2945	2022-03-24 10:55:36	2022-03-24 10:55:36	Slaskie WOPR	slaskie-wopr-102	\N	f
2946	2022-03-24 10:55:36	2022-03-24 10:55:36	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-25	\N	f
2947	2022-03-24 10:55:36	2022-03-24 10:55:36	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-94	\N	f
2948	2022-03-24 10:55:37	2022-03-24 10:55:37	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-95	\N	f
2949	2022-03-24 10:55:37	2022-03-24 10:55:37	DLRG Niedersachsen	dlrg-niedersachsen-200	\N	f
2950	2022-03-24 10:55:37	2022-03-24 10:55:37	Rctal	rctal-47	\N	f
2951	2022-03-24 10:55:37	2022-03-24 10:55:37	Accademia Di Salvamento	accademia-di-salvamento-176	\N	f
2952	2022-03-24 10:55:37	2022-03-24 10:55:37	Athena Salvamento	athena-salvamento-119	\N	f
2953	2022-03-24 10:55:38	2022-03-24 10:55:38	Athena Bracciano	athena-bracciano-194	\N	f
2954	2022-03-24 10:55:38	2022-03-24 10:55:38	DLRG Guetersloh	dlrg-guetersloh-75	\N	f
2955	2022-03-24 10:55:38	2022-03-24 10:55:38	ASD Gorizia Nuoto	asd-gorizia-nuoto-46	\N	f
2956	2022-03-24 10:55:38	2022-03-24 10:55:38	Athena Salvamento	athena-salvamento-120	\N	f
2957	2022-03-24 10:55:38	2022-03-24 10:55:38	DLRG Buchholz United	dlrg-buchholz-united-41	\N	f
2958	2022-03-24 10:55:38	2022-03-24 10:55:38	Beacon Lifesaving Club	beacon-lifesaving-club-19	\N	f
2959	2022-03-24 10:55:38	2022-03-24 10:55:38	Athena Salvamento	athena-salvamento-121	\N	f
2960	2022-03-24 10:55:38	2022-03-24 10:55:38	A.S.D. Sportiva Sturla	asd-sportiva-sturla-39	\N	f
2961	2022-03-24 10:55:39	2022-03-24 10:55:39	DLRG Niedersachsen	dlrg-niedersachsen-201	\N	f
2962	2022-03-24 10:55:39	2022-03-24 10:55:39	Athena Salvamento	athena-salvamento-122	\N	f
2963	2022-03-24 10:55:39	2022-03-24 10:55:39	ASD Rosetana Nuoto	asd-rosetana-nuoto-43	\N	f
2964	2022-03-24 10:55:39	2022-03-24 10:55:39	DLRG Luckenwalde	dlrg-luckenwalde-32	\N	f
2965	2022-03-24 10:55:39	2022-03-24 10:55:39	RB Delft	rb-delft-88	\N	f
2966	2022-03-24 10:55:39	2022-03-24 10:55:39	RB Delft	rb-delft-89	\N	f
2967	2022-03-24 10:55:39	2022-03-24 10:55:39	Polen NT	polen-nt-31	\N	f
2968	2022-03-24 10:55:39	2022-03-24 10:55:39	DLRG Buchholz United	dlrg-buchholz-united-42	\N	f
2969	2022-03-24 10:55:40	2022-03-24 10:55:40	RB Delft	rb-delft-90	\N	f
2970	2022-03-24 10:55:40	2022-03-24 10:55:40	RB Delft	rb-delft-91	\N	f
2971	2022-03-24 10:55:40	2022-03-24 10:55:40	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-9	\N	f
2972	2022-03-24 10:55:40	2022-03-24 10:55:40	Liege Sauvetage Club	liege-sauvetage-club-62	\N	f
2973	2022-03-24 10:55:42	2022-03-24 10:55:42	Italy NT	italy-nt-135	\N	f
2974	2022-03-24 10:55:42	2022-03-24 10:55:42	SAFA 2000	safa-2000-51	\N	f
2975	2022-03-24 10:55:42	2022-03-24 10:55:42	Accademia Di Salvamento	accademia-di-salvamento-177	\N	f
2976	2022-03-24 10:55:42	2022-03-24 10:55:42	Spain NT	spain-nt-131	\N	f
2977	2022-03-24 10:55:42	2022-03-24 10:55:42	France NT	france-nt-158	\N	f
2978	2022-03-24 10:55:43	2022-03-24 10:55:43	Accademia Di Salvamento	accademia-di-salvamento-178	\N	f
2979	2022-03-24 10:55:43	2022-03-24 10:55:43	Belgium NT	belgium-nt-84	\N	f
2980	2022-03-24 10:55:43	2022-03-24 10:55:43	Kusel KiXXX	kusel-kixxx-47	\N	f
2981	2022-03-24 10:55:43	2022-03-24 10:55:43	In Sport Rane Rosse	in-sport-rane-rosse-111	\N	f
2982	2022-03-24 10:55:43	2022-03-24 10:55:43	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-74	\N	f
2983	2022-03-24 10:55:43	2022-03-24 10:55:43	Athena Bracciano	athena-bracciano-195	\N	f
2984	2022-03-24 10:55:43	2022-03-24 10:55:43	Slaskie WOPR	slaskie-wopr-103	\N	f
2985	2022-03-24 10:55:44	2022-03-24 10:55:44	Slaskie WOPR	slaskie-wopr-104	\N	f
2986	2022-03-24 10:55:44	2022-03-24 10:55:44	DLRG Niedersachsen	dlrg-niedersachsen-202	\N	f
2987	2022-03-24 10:55:44	2022-03-24 10:55:44	France NT	france-nt-159	\N	f
2988	2022-03-24 10:55:44	2022-03-24 10:55:44	Athena Bracciano	athena-bracciano-196	\N	f
2989	2022-03-24 10:55:44	2022-03-24 10:55:44	Athena Salvamento	athena-salvamento-123	\N	f
2990	2022-03-24 10:55:45	2022-03-24 10:55:45	In Sport Rane Rosse	in-sport-rane-rosse-112	\N	f
2991	2022-03-24 10:55:45	2022-03-24 10:55:45	Sint-Truidense RC	sint-truidense-rc-51	\N	f
2992	2022-03-24 10:55:45	2022-03-24 10:55:45	ASD Rosetana Nuoto	asd-rosetana-nuoto-44	\N	f
2993	2022-03-24 10:55:45	2022-03-24 10:55:45	DLRG Niedersachsen	dlrg-niedersachsen-203	\N	f
2994	2022-03-24 10:55:45	2022-03-24 10:55:45	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-12	\N	f
2995	2022-03-24 10:55:45	2022-03-24 10:55:45	Rctal	rctal-48	\N	f
2996	2022-03-24 10:55:45	2022-03-24 10:55:45	DLRG Niedersachsen	dlrg-niedersachsen-204	\N	f
2997	2022-03-24 10:55:46	2022-03-24 10:55:46	Athena Bracciano	athena-bracciano-197	\N	f
2998	2022-03-24 10:55:46	2022-03-24 10:55:46	Sint-Truidense RC	sint-truidense-rc-52	\N	f
2999	2022-03-24 10:55:46	2022-03-24 10:55:46	DLRG Niedersachsen	dlrg-niedersachsen-205	\N	f
3000	2022-03-24 10:55:46	2022-03-24 10:55:46	Athena Salvamento	athena-salvamento-124	\N	f
3001	2022-03-24 10:55:46	2022-03-24 10:55:46	Accademia Di Salvamento	accademia-di-salvamento-179	\N	f
3002	2022-03-24 10:55:47	2022-03-24 10:55:47	Athena Salvamento	athena-salvamento-125	\N	f
3003	2022-03-24 10:55:47	2022-03-24 10:55:47	Nederland NT	nederland-nt-62	\N	f
3004	2022-03-24 10:55:47	2022-03-24 10:55:47	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-96	\N	f
3005	2022-03-24 10:55:47	2022-03-24 10:55:47	Rctal	rctal-49	\N	f
3006	2022-03-24 10:55:47	2022-03-24 10:55:47	DLRG Guetersloh	dlrg-guetersloh-76	\N	f
3007	2022-03-24 10:55:47	2022-03-24 10:55:47	DLRG Guetersloh	dlrg-guetersloh-77	\N	f
3008	2022-03-24 10:55:47	2022-03-24 10:55:47	Athena Bracciano	athena-bracciano-198	\N	f
3009	2022-03-24 10:55:47	2022-03-24 10:55:47	RB Delft	rb-delft-92	\N	f
3010	2022-03-24 10:55:48	2022-03-24 10:55:48	DLRG Guetersloh	dlrg-guetersloh-78	\N	f
3011	2022-03-24 10:55:48	2022-03-24 10:55:48	Italy NT	italy-nt-136	\N	f
3012	2022-03-24 10:55:48	2022-03-24 10:55:48	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-37	\N	f
3013	2022-03-24 10:55:48	2022-03-24 10:55:48	Italy NT	italy-nt-137	\N	f
3014	2022-03-24 10:55:48	2022-03-24 10:55:48	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-38	\N	f
3015	2022-03-24 10:55:48	2022-03-24 10:55:48	DLRG Bad Oldesloe	dlrg-bad-oldesloe-13	\N	f
3016	2022-03-24 10:55:48	2022-03-24 10:55:48	ASD Gorizia Nuoto	asd-gorizia-nuoto-47	\N	f
3017	2022-03-24 10:55:48	2022-03-24 10:55:48	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-39	\N	f
3018	2022-03-24 10:55:48	2022-03-24 10:55:48	France NT	france-nt-160	\N	f
3019	2022-03-24 10:55:48	2022-03-24 10:55:48	Spain NT	spain-nt-132	\N	f
3020	2022-03-24 10:55:49	2022-03-24 10:55:49	France NT	france-nt-161	\N	f
3021	2022-03-24 10:55:49	2022-03-24 10:55:49	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-75	\N	f
3022	2022-03-24 10:55:49	2022-03-24 10:55:49	Belgium NT	belgium-nt-85	\N	f
3023	2022-03-24 10:55:49	2022-03-24 10:55:49	Athena Bracciano	athena-bracciano-199	\N	f
3024	2022-03-24 10:55:49	2022-03-24 10:55:49	Nederland NT	nederland-nt-63	\N	f
3025	2022-03-24 10:55:49	2022-03-24 10:55:49	Kusel KiXXX	kusel-kixxx-48	\N	f
3026	2022-03-24 10:55:50	2022-03-24 10:55:50	Athena Bracciano	athena-bracciano-200	\N	f
3027	2022-03-24 10:55:50	2022-03-24 10:55:50	Athena Bracciano	athena-bracciano-201	\N	f
3028	2022-03-24 10:55:50	2022-03-24 10:55:50	DLRG Niedersachsen	dlrg-niedersachsen-206	\N	f
3029	2022-03-24 10:55:50	2022-03-24 10:55:50	DLRG Luckenwalde	dlrg-luckenwalde-33	\N	f
3030	2022-03-24 10:55:51	2022-03-24 10:55:51	DLRG Niedersachsen	dlrg-niedersachsen-207	\N	f
3031	2022-03-24 10:55:51	2022-03-24 10:55:51	A.S.D. Sportiva Sturla	asd-sportiva-sturla-40	\N	f
3032	2022-03-24 10:55:51	2022-03-24 10:55:51	Spain NT	spain-nt-133	\N	f
3033	2022-03-24 10:55:51	2022-03-24 10:55:51	SAFA 2000	safa-2000-52	\N	f
3034	2022-03-24 10:55:51	2022-03-24 10:55:51	CKS Szczecin	cks-szczecin-84	\N	f
3035	2022-03-24 10:55:51	2022-03-24 10:55:51	ASD Gorizia Nuoto	asd-gorizia-nuoto-48	\N	f
3036	2022-03-24 10:55:51	2022-03-24 10:55:51	CKS Szczecin	cks-szczecin-85	\N	f
3037	2022-03-24 10:55:51	2022-03-24 10:55:51	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-26	\N	f
3038	2022-03-24 10:55:51	2022-03-24 10:55:51	ASD Gorizia Nuoto	asd-gorizia-nuoto-49	\N	f
3039	2022-03-24 10:55:52	2022-03-24 10:55:52	In Sport Rane Rosse	in-sport-rane-rosse-113	\N	f
3040	2022-03-24 10:55:52	2022-03-24 10:55:52	In Sport Rane Rosse	in-sport-rane-rosse-114	\N	f
3041	2022-03-24 10:55:52	2022-03-24 10:55:52	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-27	\N	f
3042	2022-03-24 10:55:52	2022-03-24 10:55:52	Slaskie WOPR	slaskie-wopr-105	\N	f
3043	2022-03-24 10:55:52	2022-03-24 10:55:52	RB Heytse	rb-heytse-64	\N	f
3044	2022-03-24 10:55:52	2022-03-24 10:55:52	Belgium NT	belgium-nt-86	\N	f
3045	2022-03-24 10:55:52	2022-03-24 10:55:52	RB Heytse	rb-heytse-65	\N	f
3046	2022-03-24 10:55:52	2022-03-24 10:55:52	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-97	\N	f
3047	2022-03-24 10:55:53	2022-03-24 10:55:53	Athena Bracciano	athena-bracciano-202	\N	f
3048	2022-03-24 10:55:53	2022-03-24 10:55:53	Athena Salvamento	athena-salvamento-126	\N	f
3049	2022-03-24 10:55:53	2022-03-24 10:55:53	DLRG Luckenwalde	dlrg-luckenwalde-34	\N	f
3050	2022-03-24 10:55:53	2022-03-24 10:55:53	Athena Bracciano	athena-bracciano-203	\N	f
3051	2022-03-24 10:55:53	2022-03-24 10:55:53	DLRG Niedersachsen	dlrg-niedersachsen-208	\N	f
3052	2022-03-24 10:55:53	2022-03-24 10:55:53	DLRG Buchholz United	dlrg-buchholz-united-43	\N	f
3053	2022-03-24 10:55:54	2022-03-24 10:55:54	Athena Bracciano	athena-bracciano-204	\N	f
3054	2022-03-24 10:55:54	2022-03-24 10:55:54	Kusel KiXXX	kusel-kixxx-49	\N	f
3055	2022-03-24 10:55:54	2022-03-24 10:55:54	RB Waddinxveen	rb-waddinxveen-33	\N	f
3056	2022-03-24 10:55:54	2022-03-24 10:55:54	Beacon Lifesaving Club	beacon-lifesaving-club-20	\N	f
3057	2022-03-24 10:55:54	2022-03-24 10:55:54	DLRG Buchholz United	dlrg-buchholz-united-44	\N	f
3058	2022-03-24 10:55:54	2022-03-24 10:55:54	Italy NT	italy-nt-138	\N	f
3059	2022-03-24 10:55:54	2022-03-24 10:55:54	DLRG Buchholz United	dlrg-buchholz-united-45	\N	f
3060	2022-03-24 10:55:54	2022-03-24 10:55:54	Athena Bracciano	athena-bracciano-205	\N	f
3061	2022-03-24 10:55:55	2022-03-24 10:55:55	RB Delft	rb-delft-93	\N	f
3062	2022-03-24 10:55:55	2022-03-24 10:55:55	RB Delft	rb-delft-94	\N	f
3063	2022-03-24 10:55:55	2022-03-24 10:55:55	RB Delft	rb-delft-95	\N	f
3064	2022-03-24 10:55:55	2022-03-24 10:55:55	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-40	\N	f
3065	2022-03-24 10:55:55	2022-03-24 10:55:55	Italy NT	italy-nt-139	\N	f
3066	2022-03-24 10:55:55	2022-03-24 10:55:55	Italy NT	italy-nt-140	\N	f
3067	2022-03-24 10:55:56	2022-03-24 10:55:56	Spain NT	spain-nt-134	\N	f
3068	2022-03-24 10:55:56	2022-03-24 10:55:56	France NT	france-nt-162	\N	f
3069	2022-03-24 10:55:56	2022-03-24 10:55:56	Belgium NT	belgium-nt-87	\N	f
3070	2022-03-24 10:55:56	2022-03-24 10:55:56	Nederland NT	nederland-nt-64	\N	f
3071	2022-03-24 10:55:56	2022-03-24 10:55:56	Spain NT	spain-nt-135	\N	f
3072	2022-03-24 10:55:57	2022-03-24 10:55:57	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-76	\N	f
3073	2022-03-24 10:55:57	2022-03-24 10:55:57	Athena Bracciano	athena-bracciano-206	\N	f
3074	2022-03-24 10:55:57	2022-03-24 10:55:57	France NT	france-nt-163	\N	f
3075	2022-03-24 10:55:57	2022-03-24 10:55:57	CKS Szczecin	cks-szczecin-86	\N	f
3076	2022-03-24 10:55:57	2022-03-24 10:55:57	Slaskie WOPR	slaskie-wopr-106	\N	f
3077	2022-03-24 10:55:58	2022-03-24 10:55:58	Accademia Di Salvamento	accademia-di-salvamento-180	\N	f
3078	2022-03-24 10:55:58	2022-03-24 10:55:58	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-98	\N	f
3079	2022-03-24 10:55:58	2022-03-24 10:55:58	DLRG Niedersachsen	dlrg-niedersachsen-209	\N	f
3080	2022-03-24 10:55:58	2022-03-24 10:55:58	Athena Bracciano	athena-bracciano-207	\N	f
3081	2022-03-24 10:55:59	2022-03-24 10:55:59	DLRG Niedersachsen	dlrg-niedersachsen-210	\N	f
3082	2022-03-24 10:55:59	2022-03-24 10:55:59	Athena Salvamento	athena-salvamento-127	\N	f
3083	2022-03-24 10:55:59	2022-03-24 10:55:59	Athena Salvamento	athena-salvamento-128	\N	f
3084	2022-03-24 10:55:59	2022-03-24 10:55:59	DLRG Guetersloh	dlrg-guetersloh-79	\N	f
3085	2022-03-24 10:56:00	2022-03-24 10:56:00	Hungarian NT	hungarian-nt-8	\N	f
3086	2022-03-24 10:56:00	2022-03-24 10:56:00	Italy NT	italy-nt-141	\N	f
3087	2022-03-24 10:56:00	2022-03-24 10:56:00	Spain NT	spain-nt-136	\N	f
3088	2022-03-24 10:56:00	2022-03-24 10:56:00	Italy NT	italy-nt-142	\N	f
3089	2022-03-24 10:56:00	2022-03-24 10:56:00	Polen NT	polen-nt-32	\N	f
3090	2022-03-24 10:56:00	2022-03-24 10:56:00	Spain NT	spain-nt-137	\N	f
3091	2022-03-24 10:56:01	2022-03-24 10:56:01	France NT	france-nt-164	\N	f
3092	2022-03-24 10:56:01	2022-03-24 10:56:01	ASD Gorizia Nuoto	asd-gorizia-nuoto-50	\N	f
3093	2022-03-24 10:56:01	2022-03-24 10:56:01	SAFA 2000	safa-2000-53	\N	f
3094	2022-03-24 10:56:01	2022-03-24 10:56:01	A.S.D. Sportiva Sturla	asd-sportiva-sturla-41	\N	f
3095	2022-03-24 10:56:01	2022-03-24 10:56:01	Athena Bracciano	athena-bracciano-208	\N	f
3096	2022-03-24 10:56:01	2022-03-24 10:56:01	DLRG Luckenwalde	dlrg-luckenwalde-35	\N	f
3097	2022-03-24 10:56:01	2022-03-24 10:56:01	ASD Rosetana Nuoto	asd-rosetana-nuoto-45	\N	f
3098	2022-03-24 10:56:02	2022-03-24 10:56:02	CKS Szczecin	cks-szczecin-87	\N	f
3099	2022-03-24 10:56:02	2022-03-24 10:56:02	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-99	\N	f
3100	2022-03-24 10:56:02	2022-03-24 10:56:02	France NT	france-nt-165	\N	f
3101	2022-03-24 10:56:02	2022-03-24 10:56:02	Accademia Di Salvamento	accademia-di-salvamento-181	\N	f
3102	2022-03-24 10:56:02	2022-03-24 10:56:02	MKS Szczecin	mks-szczecin-24	\N	f
3103	2022-03-24 10:56:03	2022-03-24 10:56:03	DLRG Buchholz United	dlrg-buchholz-united-46	\N	f
3104	2022-03-24 10:56:03	2022-03-24 10:56:03	Athena Salvamento	athena-salvamento-129	\N	f
3105	2022-03-24 10:56:03	2022-03-24 10:56:03	Slaskie WOPR	slaskie-wopr-107	\N	f
3106	2022-03-24 10:56:03	2022-03-24 10:56:03	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-100	\N	f
3107	2022-03-24 10:56:03	2022-03-24 10:56:03	Athena Bracciano	athena-bracciano-209	\N	f
3108	2022-03-24 10:56:03	2022-03-24 10:56:03	Accademia Di Salvamento	accademia-di-salvamento-182	\N	f
3109	2022-03-24 10:56:04	2022-03-24 10:56:04	DLRG Niedersachsen	dlrg-niedersachsen-211	\N	f
3110	2022-03-24 10:56:04	2022-03-24 10:56:04	RB Waddinxveen	rb-waddinxveen-34	\N	f
3111	2022-03-24 10:56:04	2022-03-24 10:56:04	RB Delft	rb-delft-96	\N	f
3112	2022-03-24 10:56:04	2022-03-24 10:56:04	Belgium NT	belgium-nt-88	\N	f
3113	2022-03-24 10:56:04	2022-03-24 10:56:04	Spain NT	spain-nt-138	\N	f
3114	2022-03-24 10:56:04	2022-03-24 10:56:04	DLRG Niedersachsen	dlrg-niedersachsen-212	\N	f
3115	2022-03-24 10:56:05	2022-03-24 10:56:05	France NT	france-nt-166	\N	f
3116	2022-03-24 10:56:05	2022-03-24 10:56:05	DLRG Niedersachsen	dlrg-niedersachsen-213	\N	f
3117	2022-03-24 10:56:05	2022-03-24 10:56:05	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-77	\N	f
3118	2022-03-24 10:56:05	2022-03-24 10:56:05	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-101	\N	f
3119	2022-03-24 10:56:05	2022-03-24 10:56:05	RB Heytse	rb-heytse-66	\N	f
3120	2022-03-24 10:56:05	2022-03-24 10:56:05	CKS Szczecin	cks-szczecin-88	\N	f
3121	2022-03-24 10:56:06	2022-03-24 10:56:06	Athena Bracciano	athena-bracciano-210	\N	f
3122	2022-03-24 10:56:06	2022-03-24 10:56:06	Kusel KiXXX	kusel-kixxx-50	\N	f
3123	2022-03-24 10:56:06	2022-03-24 10:56:06	Athena Salvamento	athena-salvamento-130	\N	f
3124	2022-03-24 10:56:06	2022-03-24 10:56:06	Italy NT	italy-nt-143	\N	f
3125	2022-03-24 10:56:07	2022-03-24 10:56:07	Accademia Di Salvamento	accademia-di-salvamento-183	\N	f
3126	2022-03-24 10:56:07	2022-03-24 10:56:07	Accademia Di Salvamento	accademia-di-salvamento-184	\N	f
3127	2022-03-24 10:56:07	2022-03-24 10:56:07	Accademia Di Salvamento	accademia-di-salvamento-185	\N	f
3128	2022-03-24 10:56:07	2022-03-24 10:56:07	Athena Salvamento	athena-salvamento-131	\N	f
3129	2022-03-24 10:56:08	2022-03-24 10:56:08	Athena Bracciano	athena-bracciano-211	\N	f
3130	2022-03-24 10:56:08	2022-03-24 10:56:08	Italy NT	italy-nt-144	\N	f
3131	2022-03-24 10:56:08	2022-03-24 10:56:08	Spain NT	spain-nt-139	\N	f
3132	2022-03-24 10:56:08	2022-03-24 10:56:08	France NT	france-nt-167	\N	f
3133	2022-03-24 10:56:08	2022-03-24 10:56:08	Liege Sauvetage Club	liege-sauvetage-club-63	\N	f
3134	2022-03-24 10:56:08	2022-03-24 10:56:08	Nederland NT	nederland-nt-65	\N	f
3135	2022-03-24 10:56:09	2022-03-24 10:56:09	Slaskie WOPR	slaskie-wopr-108	\N	f
3136	2022-03-24 10:56:09	2022-03-24 10:56:09	Slaskie WOPR	slaskie-wopr-109	\N	f
3137	2022-03-24 10:56:09	2022-03-24 10:56:09	DLRG Guetersloh	dlrg-guetersloh-80	\N	f
3138	2022-03-24 10:56:09	2022-03-24 10:56:09	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-102	\N	f
3139	2022-03-24 10:56:09	2022-03-24 10:56:09	DLRG Guetersloh	dlrg-guetersloh-81	\N	f
3140	2022-03-24 10:56:09	2022-03-24 10:56:09	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-78	\N	f
3141	2022-03-24 10:56:09	2022-03-24 10:56:09	France NT	france-nt-168	\N	f
3142	2022-03-24 10:56:10	2022-03-24 10:56:10	Italy NT	italy-nt-145	\N	f
3143	2022-03-24 10:56:10	2022-03-24 10:56:10	SAFA 2000	safa-2000-54	\N	f
3144	2022-03-24 10:56:10	2022-03-24 10:56:10	DLRG Niedersachsen	dlrg-niedersachsen-214	\N	f
3145	2022-03-24 10:56:10	2022-03-24 10:56:10	DLRG Niedersachsen	dlrg-niedersachsen-215	\N	f
3146	2022-03-24 10:56:11	2022-03-24 10:56:11	CKS Szczecin	cks-szczecin-89	\N	f
3147	2022-03-24 10:56:11	2022-03-24 10:56:11	Accademia Di Salvamento	accademia-di-salvamento-186	\N	f
3148	2022-03-24 10:56:11	2022-03-24 10:56:11	Polen NT	polen-nt-33	\N	f
3149	2022-03-24 10:56:11	2022-03-24 10:56:11	ASD Rosetana Nuoto	asd-rosetana-nuoto-46	\N	f
3150	2022-03-24 10:56:11	2022-03-24 10:56:11	Athena Bracciano	athena-bracciano-212	\N	f
3151	2022-03-24 10:56:11	2022-03-24 10:56:11	MKS Szczecin	mks-szczecin-25	\N	f
3152	2022-03-24 10:56:11	2022-03-24 10:56:11	Athena Salvamento	athena-salvamento-132	\N	f
3153	2022-03-24 10:56:12	2022-03-24 10:56:12	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-103	\N	f
3154	2022-03-24 10:56:12	2022-03-24 10:56:12	Belgium NT	belgium-nt-89	\N	f
3155	2022-03-24 10:56:12	2022-03-24 10:56:12	RB Delft	rb-delft-97	\N	f
3156	2022-03-24 10:56:12	2022-03-24 10:56:12	DLRG Guetersloh	dlrg-guetersloh-82	\N	f
3157	2022-03-24 10:56:12	2022-03-24 10:56:12	DLRG Buchholz United	dlrg-buchholz-united-47	\N	f
3158	2022-03-24 10:56:12	2022-03-24 10:56:12	Athena Bracciano	athena-bracciano-213	\N	f
3159	2022-03-24 10:56:13	2022-03-24 10:56:13	Spain NT	spain-nt-140	\N	f
3160	2022-03-24 10:56:13	2022-03-24 10:56:13	Liege Sauvetage Club	liege-sauvetage-club-64	\N	f
3161	2022-03-24 10:56:13	2022-03-24 10:56:13	RB Waddinxveen	rb-waddinxveen-35	\N	f
3162	2022-03-24 10:56:13	2022-03-24 10:56:13	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-104	\N	f
3163	2022-03-24 10:56:13	2022-03-24 10:56:13	Beacon Lifesaving Club	beacon-lifesaving-club-21	\N	f
3164	2022-03-24 10:56:13	2022-03-24 10:56:13	RB Delft	rb-delft-98	\N	f
3165	2022-03-24 10:56:13	2022-03-24 10:56:13	RB Delft	rb-delft-99	\N	f
3166	2022-03-24 10:56:13	2022-03-24 10:56:13	RB Delft	rb-delft-100	\N	f
3167	2022-03-24 10:56:14	2022-03-24 10:56:14	Accademia Di Salvamento	accademia-di-salvamento-187	\N	f
3168	2022-03-24 10:56:14	2022-03-24 10:56:14	Accademia Di Salvamento	accademia-di-salvamento-188	\N	f
3169	2022-03-24 10:56:14	2022-03-24 10:56:14	Accademia Di Salvamento	accademia-di-salvamento-189	\N	f
3170	2022-03-24 10:56:14	2022-03-24 10:56:14	Accademia Di Salvamento	accademia-di-salvamento-190	\N	f
3171	2022-03-24 10:56:14	2022-03-24 10:56:14	ASD Gorizia Nuoto	asd-gorizia-nuoto-51	\N	f
3172	2022-03-24 10:56:14	2022-03-24 10:56:14	RB Waddinxveen	rb-waddinxveen-36	\N	f
3173	2022-03-24 10:56:14	2022-03-24 10:56:14	Spain NT	spain-nt-141	\N	f
3174	2022-03-24 10:56:15	2022-03-24 10:56:15	France NT	france-nt-169	\N	f
3175	2022-03-24 10:56:15	2022-03-24 10:56:15	Italy NT	italy-nt-146	\N	f
3176	2022-03-24 10:56:15	2022-03-24 10:56:15	Kusel KiXXX	kusel-kixxx-51	\N	f
3177	2022-03-24 10:56:15	2022-03-24 10:56:15	Slaskie WOPR	slaskie-wopr-110	\N	f
3178	2022-03-24 10:56:15	2022-03-24 10:56:15	Slaskie WOPR	slaskie-wopr-111	\N	f
3179	2022-03-24 10:56:15	2022-03-24 10:56:15	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-79	\N	f
3180	2022-03-24 10:56:15	2022-03-24 10:56:15	France NT	france-nt-170	\N	f
3181	2022-03-24 10:56:15	2022-03-24 10:56:15	Belgium NT	belgium-nt-90	\N	f
3182	2022-03-24 10:56:15	2022-03-24 10:56:15	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-28	\N	f
3183	2022-03-24 10:56:15	2022-03-24 10:56:15	SAFA 2000	safa-2000-55	\N	f
3184	2022-03-24 10:56:16	2022-03-24 10:56:16	In Sport Rane Rosse	in-sport-rane-rosse-115	\N	f
3185	2022-03-24 10:56:16	2022-03-24 10:56:16	Accademia Di Salvamento	accademia-di-salvamento-191	\N	f
3186	2022-03-24 10:56:16	2022-03-24 10:56:16	Accademia Di Salvamento	accademia-di-salvamento-192	\N	f
3187	2022-03-24 10:56:16	2022-03-24 10:56:16	France NT	france-nt-171	\N	f
3188	2022-03-24 10:56:16	2022-03-24 10:56:16	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-80	\N	f
3189	2022-03-24 10:56:16	2022-03-24 10:56:16	Liege Sauvetage Club	liege-sauvetage-club-65	\N	f
3190	2022-03-24 10:56:16	2022-03-24 10:56:16	Slaskie WOPR	slaskie-wopr-112	\N	f
3191	2022-03-24 10:56:17	2022-03-24 10:56:17	In Sport Rane Rosse	in-sport-rane-rosse-116	\N	f
3192	2022-03-24 10:56:17	2022-03-24 10:56:17	Athena Salvamento	athena-salvamento-133	\N	f
3193	2022-03-24 10:56:17	2022-03-24 10:56:17	DLRG Niedersachsen	dlrg-niedersachsen-216	\N	f
3194	2022-03-24 10:56:17	2022-03-24 10:56:17	DLRG Niedersachsen	dlrg-niedersachsen-217	\N	f
3195	2022-03-24 10:56:19	2022-03-24 10:56:19	Beacon Lifesaving Club	beacon-lifesaving-club-22	\N	f
3196	2022-03-24 10:56:19	2022-03-24 10:56:19	DLRG Lueneburg e.V.	dlrg-lueneburg-ev-4	\N	f
3197	2022-03-24 10:56:19	2022-03-24 10:56:19	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-10	\N	f
3198	2022-03-24 10:56:21	2022-03-24 10:56:21	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-8	\N	f
3199	2022-03-24 10:56:22	2022-03-24 10:56:22	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-7	\N	f
3200	2022-03-24 10:56:35	2022-03-24 10:56:35	Riis Park	riis-park-1	\N	f
3201	2022-03-25 17:44:01	2022-03-25 17:44:01	Italy NT	italy-nt-147	\N	f
3202	2022-03-25 17:44:01	2022-03-25 17:44:01	SAFA 2000	safa-2000-56	\N	f
3203	2022-03-25 17:44:01	2022-03-25 17:44:01	Accademia Di Salvamento	accademia-di-salvamento-193	\N	f
3204	2022-03-25 17:44:01	2022-03-25 17:44:01	Spain NT	spain-nt-142	\N	f
3205	2022-03-25 17:44:02	2022-03-25 17:44:02	France NT	france-nt-172	\N	f
3206	2022-03-25 17:44:02	2022-03-25 17:44:02	Belgium NT	belgium-nt-91	\N	f
3207	2022-03-25 17:44:02	2022-03-25 17:44:02	Kusel KiXXX	kusel-kixxx-52	\N	f
3208	2022-03-25 17:44:02	2022-03-25 17:44:02	In Sport Rane Rosse	in-sport-rane-rosse-117	\N	f
3209	2022-03-25 17:44:02	2022-03-25 17:44:02	DLRG Sachsen-Anhalt	dlrg-sachsen-anhalt-81	\N	f
3210	2022-03-25 17:44:03	2022-03-25 17:44:03	Athena Bracciano	athena-bracciano-214	\N	f
3211	2022-03-25 17:44:03	2022-03-25 17:44:03	Slaskie WOPR	slaskie-wopr-113	\N	f
3212	2022-03-25 17:44:03	2022-03-25 17:44:03	DLRG Niedersachsen	dlrg-niedersachsen-218	\N	f
3213	2022-03-25 17:44:03	2022-03-25 17:44:03	Athena Salvamento	athena-salvamento-134	\N	f
3214	2022-03-25 17:44:03	2022-03-25 17:44:03	Sint-Truidense RC	sint-truidense-rc-53	\N	f
3215	2022-03-25 17:44:03	2022-03-25 17:44:03	ASD Rosetana Nuoto	asd-rosetana-nuoto-47	\N	f
3216	2022-03-25 17:44:04	2022-03-25 17:44:04	DLRG Nuernberg-Roth-Schwabach	dlrg-nuernberg-roth-schwabach-13	\N	f
3217	2022-03-25 17:44:04	2022-03-25 17:44:04	Rctal	rctal-50	\N	f
3218	2022-03-25 17:44:04	2022-03-25 17:44:04	Nederland NT	nederland-nt-66	\N	f
3219	2022-03-25 17:44:04	2022-03-25 17:44:04	DLRG Nordrhein-Westfalen	dlrg-nordrhein-westfalen-105	\N	f
3220	2022-03-25 17:44:04	2022-03-25 17:44:04	DLRG Guetersloh	dlrg-guetersloh-83	\N	f
3221	2022-03-25 17:44:04	2022-03-25 17:44:04	RB Delft	rb-delft-101	\N	f
3222	2022-03-25 17:44:04	2022-03-25 17:44:04	Poland Dolnoslaskie Wopr	poland-dolnoslaskie-wopr-41	\N	f
3223	2022-03-25 17:44:05	2022-03-25 17:44:05	DLRG Bad Oldesloe	dlrg-bad-oldesloe-14	\N	f
3224	2022-03-25 17:44:05	2022-03-25 17:44:05	ASD Gorizia Nuoto	asd-gorizia-nuoto-52	\N	f
3225	2022-03-25 17:44:05	2022-03-25 17:44:05	DLRG Luckenwalde	dlrg-luckenwalde-36	\N	f
3226	2022-03-25 17:44:05	2022-03-25 17:44:05	A.S.D. Sportiva Sturla	asd-sportiva-sturla-42	\N	f
3227	2022-03-25 17:44:05	2022-03-25 17:44:05	CKS Szczecin	cks-szczecin-90	\N	f
3228	2022-03-25 17:44:06	2022-03-25 17:44:06	SDS - Specialisti dello Sport	sds-specialisti-dello-sport-29	\N	f
3229	2022-03-25 17:44:06	2022-03-25 17:44:06	RB Heytse	rb-heytse-67	\N	f
3230	2022-03-25 17:44:06	2022-03-25 17:44:06	DLRG Buchholz United	dlrg-buchholz-united-48	\N	f
3231	2022-03-25 17:44:06	2022-03-25 17:44:06	RB Waddinxveen	rb-waddinxveen-37	\N	f
3232	2022-03-25 17:44:06	2022-03-25 17:44:06	Beacon Lifesaving Club	beacon-lifesaving-club-23	\N	f
3233	2022-03-25 17:44:08	2022-03-25 17:44:08	Hungarian NT	hungarian-nt-9	\N	f
3234	2022-03-25 17:44:08	2022-03-25 17:44:08	Polen NT	polen-nt-34	\N	f
3235	2022-03-25 17:44:09	2022-03-25 17:44:09	A.S.D. Sportiva Sturla	asd-sportiva-sturla-43	\N	f
3236	2022-03-25 17:44:09	2022-03-25 17:44:09	MKS Szczecin	mks-szczecin-26	\N	f
3237	2022-03-25 17:44:11	2022-03-25 17:44:11	Liege Sauvetage Club	liege-sauvetage-club-66	\N	f
3238	2022-03-25 17:44:13	2022-03-25 17:44:13	Liege Sauvetage Club	liege-sauvetage-club-67	\N	f
3239	2022-03-25 17:44:13	2022-03-25 17:44:13	Beacon Lifesaving Club	beacon-lifesaving-club-24	\N	f
3240	2022-03-25 17:44:16	2022-03-25 17:44:16	Beacon Lifesaving Club	beacon-lifesaving-club-25	\N	f
3241	2022-03-25 17:44:16	2022-03-25 17:44:16	DLRG Lueneburg e.V.	dlrg-lueneburg-ev-5	\N	f
3242	2022-03-25 17:44:16	2022-03-25 17:44:16	St. John Berchmans Life Saving Club	st-john-berchmans-life-saving-club-11	\N	f
3243	2022-03-25 17:44:19	2022-03-25 17:44:19	DLRG Schlossholte-Stukenbrock	dlrg-schlossholte-stukenbrock-9	\N	f
3244	2022-03-25 17:44:20	2022-03-25 17:44:20	VZW Vrije Zwemmers Wenduine-De Haan	vzw-vrije-zwemmers-wenduine-de-haan-8	\N	f
3245	2022-03-25 17:44:35	2022-03-25 17:44:35	Riis Park	riis-park-2	\N	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Ruben	ruben@lifesavingrankings.com	\N	$2y$10$4ZrnkaxhKhREh5lUJAxvU.Kjxiv6p.0ufO2588Df1jfg9ZjdLTf0K	VpOlR1J1eX9cTDjy6EmZbfIbMFBJN67GA87nV6bAfd5Es6xYjzVbC2KQDqVL	2022-02-06 13:39:05	2022-02-06 13:39:05
2	Wilmar	wilmar@arkadmin.nl	\N	$2y$10$rLMNzt0nCT.Gxr0SEMrOXe4jxHfxIeH32hzSMUJhl4Q.he8B3OfCu	flMRwCAEPTwM0jghwi8Ocav9sdSbWHIo67xKAWrye4Pgg0Mwo39Y4W86sqYt	2022-03-26 05:10:17	2022-03-26 05:10:17
3	Edoardo	edo.macri@gmail.com	\N	$2y$10$4fdim5HDBf1IEPoB8skZROl6Le5/RXsBY1SoPKG5slt6WdtZ4m1vS	ahm7YP9aJAyILb96CkabhXMMCq23xQEy3e6gRTKKrhCffe4BHeR68XqBUTKB	2022-05-04 11:49:42	2022-05-04 11:49:42
4	Edoardo Macri	io@edoardomacri.it	\N	$2y$10$0FmjXGI8j7ZgTpqqxx8RO.K6ZD6iQ51KfVowuo45Ej8DET8h5iCNm	uasLEpRtkYbZeTW48ow35ffpmFMwZ0eofT5QvnpgbnubtmU9lNdXDwhnndEp	2022-05-16 18:26:34	2022-05-16 18:26:34
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: lifesavingrankings
--

COPY public.venues (id, created_at, updated_at, name, slug, city, country_code, type, pool_size) FROM stdin;
1	2022-02-06 13:42:57	2022-02-06 13:50:51	Pieter van den Hoogenband Zwemstadion	pieter-van-den-hoogenband-zwemstadion	Eindhoven	NL	0	50
2	2022-03-24 08:13:42	2022-03-24 08:13:42	Sportboulevard Dordrecht	sportboulevard-dordrecht	Dordrecht	NL	0	50
3	2022-03-24 09:19:51	2022-03-24 09:19:51	Amerena	amerena	Amersfoort	NL	0	50
4	2022-05-16 18:42:24	2022-05-16 18:42:24	Piscina Samuele Daniele	piscina-samuele-daniele	Milan	IT	0	50
\.


--
-- Name: athlete_id_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.athlete_id_types_id_seq', 1, false);


--
-- Name: athlete_ids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.athlete_ids_id_seq', 1, false);


--
-- Name: athletes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.athletes_id_seq', 1189, true);


--
-- Name: competition_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.competition_categories_id_seq', 16, true);


--
-- Name: competition_venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.competition_venue_id_seq', 6, true);


--
-- Name: competitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.competitions_id_seq', 13, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.events_id_seq', 54, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, true);


--
-- Name: job_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.job_statuses_id_seq', 4, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.media_id_seq', 14, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.migrations_id_seq', 29, true);


--
-- Name: parser_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.parser_configs_id_seq', 8, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.permissions_id_seq', 3, true);


--
-- Name: relay_segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.relay_segments_id_seq', 38, true);


--
-- Name: relay_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.relay_teams_id_seq', 276, true);


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.results_id_seq', 21220, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.sponsors_id_seq', 1, false);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.teams_id_seq', 3245, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lifesavingrankings
--

SELECT pg_catalog.setval('public.venues_id_seq', 4, true);


--
-- Name: athlete_id_types athlete_id_types_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athlete_id_types
    ADD CONSTRAINT athlete_id_types_pkey PRIMARY KEY (id);


--
-- Name: athlete_ids athlete_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athlete_ids
    ADD CONSTRAINT athlete_ids_pkey PRIMARY KEY (id);


--
-- Name: athletes athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- Name: competition_categories competition_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_categories
    ADD CONSTRAINT competition_categories_pkey PRIMARY KEY (id);


--
-- Name: competition_venue competition_venue_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_venue
    ADD CONSTRAINT competition_venue_pkey PRIMARY KEY (id);


--
-- Name: competitions competitions_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competitions
    ADD CONSTRAINT competitions_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_statuses job_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.job_statuses
    ADD CONSTRAINT job_statuses_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: media media_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: parser_configs parser_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.parser_configs
    ADD CONSTRAINT parser_configs_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: relay_segments relay_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_segments
    ADD CONSTRAINT relay_segments_pkey PRIMARY KEY (id);


--
-- Name: relay_teams relay_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_teams
    ADD CONSTRAINT relay_teams_pkey PRIMARY KEY (id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sponsors sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: athletes_alias_of_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX athletes_alias_of_index ON public.athletes USING btree (alias_of);


--
-- Name: athletes_slug_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX athletes_slug_index ON public.athletes USING btree (slug);


--
-- Name: competition_categories_competition_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX competition_categories_competition_id_index ON public.competition_categories USING btree (competition_id);


--
-- Name: competition_venue_competition_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX competition_venue_competition_id_index ON public.competition_venue USING btree (competition_id);


--
-- Name: competition_venue_venue_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX competition_venue_venue_id_index ON public.competition_venue USING btree (venue_id);


--
-- Name: competitions_slug_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX competitions_slug_index ON public.competitions USING btree (slug);


--
-- Name: job_statuses_job_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX job_statuses_job_id_index ON public.job_statuses USING btree (job_id);


--
-- Name: job_statuses_queue_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX job_statuses_queue_index ON public.job_statuses USING btree (queue);


--
-- Name: job_statuses_status_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX job_statuses_status_index ON public.job_statuses USING btree (status);


--
-- Name: job_statuses_type_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX job_statuses_type_index ON public.job_statuses USING btree (type);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: media_model_type_model_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX media_model_type_model_id_index ON public.media USING btree (model_type, model_id);


--
-- Name: media_order_column_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX media_order_column_index ON public.media USING btree (order_column);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: parser_configs_media_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX parser_configs_media_id_index ON public.parser_configs USING btree (media_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: relay_segments_event_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX relay_segments_event_id_index ON public.relay_segments USING btree (event_id);


--
-- Name: relay_segments_segment_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX relay_segments_segment_id_index ON public.relay_segments USING btree (segment_id);


--
-- Name: relay_teams_competition_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX relay_teams_competition_id_index ON public.relay_teams USING btree (competition_id);


--
-- Name: results_competition_category_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_competition_category_id_index ON public.results USING btree (competition_category_id);


--
-- Name: results_competition_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_competition_id_index ON public.results USING btree (competition_id);


--
-- Name: results_entrant_type_entrant_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_entrant_type_entrant_id_index ON public.results USING btree (entrant_type, entrant_id);


--
-- Name: results_event_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_event_id_index ON public.results USING btree (event_id);


--
-- Name: results_media_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_media_id_index ON public.results USING btree (media_id);


--
-- Name: results_parent_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_parent_id_index ON public.results USING btree (parent_id);


--
-- Name: results_team_id_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_team_id_index ON public.results USING btree (team_id);


--
-- Name: results_time_index; Type: INDEX; Schema: public; Owner: lifesavingrankings
--

CREATE INDEX results_time_index ON public.results USING btree ("time");


--
-- Name: athletes athletes_alias_of_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_alias_of_foreign FOREIGN KEY (alias_of) REFERENCES public.athletes(id) ON DELETE CASCADE;


--
-- Name: competition_categories competition_categories_competition_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_categories
    ADD CONSTRAINT competition_categories_competition_id_foreign FOREIGN KEY (competition_id) REFERENCES public.competitions(id) ON DELETE CASCADE;


--
-- Name: competition_venue competition_venue_competition_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_venue
    ADD CONSTRAINT competition_venue_competition_id_foreign FOREIGN KEY (competition_id) REFERENCES public.competitions(id) ON DELETE CASCADE;


--
-- Name: competition_venue competition_venue_venue_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.competition_venue
    ADD CONSTRAINT competition_venue_venue_id_foreign FOREIGN KEY (venue_id) REFERENCES public.venues(id) ON DELETE CASCADE;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: parser_configs parser_configs_job_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.parser_configs
    ADD CONSTRAINT parser_configs_job_status_id_foreign FOREIGN KEY (job_status_id) REFERENCES public.job_statuses(id) ON DELETE SET NULL;


--
-- Name: parser_configs parser_configs_media_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.parser_configs
    ADD CONSTRAINT parser_configs_media_id_foreign FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: relay_segments relay_segments_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_segments
    ADD CONSTRAINT relay_segments_event_id_foreign FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: relay_segments relay_segments_segment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_segments
    ADD CONSTRAINT relay_segments_segment_id_foreign FOREIGN KEY (segment_id) REFERENCES public.events(id);


--
-- Name: relay_teams relay_teams_competition_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.relay_teams
    ADD CONSTRAINT relay_teams_competition_id_foreign FOREIGN KEY (competition_id) REFERENCES public.competitions(id) ON DELETE CASCADE;


--
-- Name: results results_competition_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_competition_category_id_foreign FOREIGN KEY (competition_category_id) REFERENCES public.competition_categories(id) ON DELETE SET NULL;


--
-- Name: results results_competition_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_competition_id_foreign FOREIGN KEY (competition_id) REFERENCES public.competitions(id) ON DELETE CASCADE;


--
-- Name: results results_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_event_id_foreign FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;


--
-- Name: results results_media_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_media_id_foreign FOREIGN KEY (media_id) REFERENCES public.media(id);


--
-- Name: results results_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.results(id) ON DELETE CASCADE;


--
-- Name: results results_team_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_team_id_foreign FOREIGN KEY (team_id) REFERENCES public.teams(id) ON DELETE SET NULL;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: lifesavingrankings
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

