--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: WTT_Asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WTT_Asset" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint,
    id bigint NOT NULL,
    "Name" character varying(255),
    "Code" character varying(255)
);


ALTER TABLE public."WTT_Asset" OWNER TO postgres;

--
-- Name: WTT_Asset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WTT_Asset_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WTT_Asset_id_seq" OWNER TO postgres;

--
-- Name: WTT_Asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WTT_Asset_id_seq" OWNED BY public."WTT_Asset".id;


--
-- Name: WTT_Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WTT_Customer" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint,
    id bigint NOT NULL,
    name character varying(255),
    "Description" text,
    "IsActive" boolean DEFAULT true,
    "assetId" bigint
);


ALTER TABLE public."WTT_Customer" OWNER TO postgres;

--
-- Name: WTT_CustomerAssetsReading; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WTT_CustomerAssetsReading" (
    sort bigint,
    id bigint NOT NULL,
    "ReadingDateTime" timestamp with time zone,
    "AssetId" bigint,
    "Value" bigint
);


ALTER TABLE public."WTT_CustomerAssetsReading" OWNER TO postgres;

--
-- Name: WTT_CustomerAssetsReading_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WTT_CustomerAssetsReading_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WTT_CustomerAssetsReading_id_seq" OWNER TO postgres;

--
-- Name: WTT_CustomerAssetsReading_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WTT_CustomerAssetsReading_id_seq" OWNED BY public."WTT_CustomerAssetsReading".id;


--
-- Name: WTT_Customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WTT_Customer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."WTT_Customer_id_seq" OWNER TO postgres;

--
-- Name: WTT_Customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WTT_Customer_id_seq" OWNED BY public."WTT_Customer".id;


--
-- Name: applicationPlugins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."applicationPlugins" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255),
    version character varying(255),
    enabled boolean,
    installed boolean,
    "builtIn" boolean,
    options json
);


ALTER TABLE public."applicationPlugins" OWNER TO postgres;

--
-- Name: applicationPlugins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."applicationPlugins_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."applicationPlugins_id_seq" OWNER TO postgres;

--
-- Name: applicationPlugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."applicationPlugins_id_seq" OWNED BY public."applicationPlugins".id;


--
-- Name: applicationVersion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."applicationVersion" (
    id bigint NOT NULL,
    value character varying(255)
);


ALTER TABLE public."applicationVersion" OWNER TO postgres;

--
-- Name: applicationVersion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."applicationVersion_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."applicationVersion_id_seq" OWNER TO postgres;

--
-- Name: applicationVersion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."applicationVersion_id_seq" OWNED BY public."applicationVersion".id;


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    filename character varying(255),
    extname character varying(255),
    size integer,
    mimetype character varying(255),
    path character varying(255),
    meta jsonb DEFAULT '{}'::jsonb,
    url character varying(255),
    "createdById" bigint,
    "updatedById" bigint,
    "storageId" bigint
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: COLUMN attachments.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.title IS '用户文件名（不含扩展名）';


--
-- Name: COLUMN attachments.filename; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.filename IS '系统文件名（含扩展名）';


--
-- Name: COLUMN attachments.extname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.extname IS '扩展名（含“.”）';


--
-- Name: COLUMN attachments.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.size IS '文件体积（字节）';


--
-- Name: COLUMN attachments.path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.path IS '相对路径（含“/”前缀）';


--
-- Name: COLUMN attachments.meta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.meta IS '其他文件信息（如图片的宽高）';


--
-- Name: COLUMN attachments.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.attachments.url IS '网络访问地址';


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: auditChanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."auditChanges" (
    id bigint NOT NULL,
    field json,
    before json,
    after json,
    "auditLogId" bigint
);


ALTER TABLE public."auditChanges" OWNER TO postgres;

--
-- Name: auditChanges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."auditChanges_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."auditChanges_id_seq" OWNER TO postgres;

--
-- Name: auditChanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."auditChanges_id_seq" OWNED BY public."auditChanges".id;


--
-- Name: auditLogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."auditLogs" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone,
    type character varying(255),
    "recordId" character varying(255),
    "collectionName" character varying(255),
    "userId" bigint
);


ALTER TABLE public."auditLogs" OWNER TO postgres;

--
-- Name: auditLogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."auditLogs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."auditLogs_id_seq" OWNER TO postgres;

--
-- Name: auditLogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."auditLogs_id_seq" OWNED BY public."auditLogs".id;


--
-- Name: chartsQueries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chartsQueries" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    type character varying(255),
    options json,
    fields json DEFAULT '[]'::json
);


ALTER TABLE public."chartsQueries" OWNER TO postgres;

--
-- Name: chartsQueries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."chartsQueries_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."chartsQueries_id_seq" OWNER TO postgres;

--
-- Name: chartsQueries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."chartsQueries_id_seq" OWNED BY public."chartsQueries".id;


--
-- Name: chinaRegions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chinaRegions" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    "parentCode" character varying(255),
    level integer
);


ALTER TABLE public."chinaRegions" OWNER TO postgres;

--
-- Name: collectionCategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."collectionCategories" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255),
    color character varying(255) DEFAULT 'default'::character varying,
    sort bigint
);


ALTER TABLE public."collectionCategories" OWNER TO postgres;

--
-- Name: collectionCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."collectionCategories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."collectionCategories_id_seq" OWNER TO postgres;

--
-- Name: collectionCategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."collectionCategories_id_seq" OWNED BY public."collectionCategories".id;


--
-- Name: collectionCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."collectionCategory" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "collectionName" character varying(255) NOT NULL,
    "categoryId" bigint NOT NULL
);


ALTER TABLE public."collectionCategory" OWNER TO postgres;

--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    key character varying(255) NOT NULL,
    name character varying(255),
    title character varying(255),
    inherit boolean DEFAULT false,
    hidden boolean DEFAULT false,
    options json DEFAULT '{}'::json,
    sort bigint
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.executions (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    "useTransaction" boolean DEFAULT false,
    context json,
    status integer,
    "workflowId" bigint
);


ALTER TABLE public.executions OWNER TO postgres;

--
-- Name: executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.executions_id_seq OWNER TO postgres;

--
-- Name: executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.executions_id_seq OWNED BY public.executions.id;


--
-- Name: fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fields (
    key character varying(255) NOT NULL,
    name character varying(255),
    type character varying(255),
    interface character varying(255),
    "collectionName" character varying(255),
    "parentKey" character varying(255),
    "reverseKey" character varying(255),
    options json DEFAULT '{}'::json,
    sort bigint
);


ALTER TABLE public.fields OWNER TO postgres;

--
-- Name: flow_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flow_nodes (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    "upstreamId" bigint,
    "branchIndex" integer,
    "downstreamId" bigint,
    type character varying(255),
    config json DEFAULT '{}'::json,
    "workflowId" bigint
);


ALTER TABLE public.flow_nodes OWNER TO postgres;

--
-- Name: flow_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flow_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flow_nodes_id_seq OWNER TO postgres;

--
-- Name: flow_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flow_nodes_id_seq OWNED BY public.flow_nodes.id;


--
-- Name: iframeHtml; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."iframeHtml" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id character varying(255) NOT NULL,
    html text,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public."iframeHtml" OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "executionId" bigint,
    "nodeId" bigint,
    "upstreamId" bigint,
    status integer,
    result json
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    name character varying(255)
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255),
    description character varying(255),
    strategy json,
    "default" boolean DEFAULT false,
    hidden boolean DEFAULT false,
    "allowConfigure" boolean,
    "allowNewMenu" boolean,
    snippets jsonb DEFAULT '["!ui.*", "!pm", "!pm.*"]'::jsonb,
    sort bigint
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: rolesResources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rolesResources" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleName" character varying(255),
    name character varying(255),
    "usingActionsConfig" boolean
);


ALTER TABLE public."rolesResources" OWNER TO postgres;

--
-- Name: rolesResourcesActions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rolesResourcesActions" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "rolesResourceId" bigint,
    name character varying(255),
    fields jsonb DEFAULT '[]'::jsonb,
    "scopeId" bigint
);


ALTER TABLE public."rolesResourcesActions" OWNER TO postgres;

--
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."rolesResourcesActions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rolesResourcesActions_id_seq" OWNER TO postgres;

--
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."rolesResourcesActions_id_seq" OWNED BY public."rolesResourcesActions".id;


--
-- Name: rolesResourcesScopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rolesResourcesScopes" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    name character varying(255),
    "resourceName" character varying(255),
    scope json
);


ALTER TABLE public."rolesResourcesScopes" OWNER TO postgres;

--
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."rolesResourcesScopes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rolesResourcesScopes_id_seq" OWNER TO postgres;

--
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."rolesResourcesScopes_id_seq" OWNED BY public."rolesResourcesScopes".id;


--
-- Name: rolesResources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."rolesResources_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."rolesResources_id_seq" OWNER TO postgres;

--
-- Name: rolesResources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."rolesResources_id_seq" OWNED BY public."rolesResources".id;


--
-- Name: rolesUischemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rolesUischemas" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleName" character varying(255) NOT NULL,
    "uiSchemaXUid" character varying(255) NOT NULL
);


ALTER TABLE public."rolesUischemas" OWNER TO postgres;

--
-- Name: rolesUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."rolesUsers" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "default" boolean,
    "userId" bigint NOT NULL,
    "roleName" character varying(255) NOT NULL
);


ALTER TABLE public."rolesUsers" OWNER TO postgres;

--
-- Name: sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sequences (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    collection character varying(255),
    field character varying(255),
    key integer,
    current bigint,
    "lastGeneratedAt" timestamp with time zone
);


ALTER TABLE public.sequences OWNER TO postgres;

--
-- Name: sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sequences_id_seq OWNER TO postgres;

--
-- Name: sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sequences_id_seq OWNED BY public.sequences.id;


--
-- Name: storages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storages (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    name character varying(255),
    type character varying(255),
    options jsonb DEFAULT '{}'::jsonb,
    rules jsonb DEFAULT '{}'::jsonb,
    path character varying(255) DEFAULT ''::character varying,
    "baseUrl" character varying(255) DEFAULT ''::character varying,
    "default" boolean DEFAULT false
);


ALTER TABLE public.storages OWNER TO postgres;

--
-- Name: COLUMN storages.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages.title IS '存储引擎名称';


--
-- Name: COLUMN storages.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages.type IS '类型标识，如 local/ali-oss 等';


--
-- Name: COLUMN storages.options; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages.options IS '配置项';


--
-- Name: COLUMN storages.rules; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages.rules IS '文件规则';


--
-- Name: COLUMN storages.path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages.path IS '存储相对路径模板';


--
-- Name: COLUMN storages."baseUrl"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages."baseUrl" IS '访问地址前缀';


--
-- Name: COLUMN storages."default"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.storages."default" IS '默认引擎';


--
-- Name: storages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.storages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.storages_id_seq OWNER TO postgres;

--
-- Name: storages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.storages_id_seq OWNED BY public.storages.id;


--
-- Name: systemSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."systemSettings" (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    title character varying(255),
    "showLogoOnly" boolean,
    "allowSignUp" boolean DEFAULT true,
    "smsAuthEnabled" boolean DEFAULT false,
    "logoId" bigint,
    "enabledLanguages" json DEFAULT '[]'::json,
    "appLang" character varying(255),
    options json DEFAULT '{}'::json
);


ALTER TABLE public."systemSettings" OWNER TO postgres;

--
-- Name: systemSettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."systemSettings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."systemSettings_id_seq" OWNER TO postgres;

--
-- Name: systemSettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."systemSettings_id_seq" OWNED BY public."systemSettings".id;


--
-- Name: uiRoutes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."uiRoutes" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    type character varying(255),
    "parentKey" character varying(255),
    "uiSchemaUid" character varying(255),
    options json DEFAULT '{}'::json,
    sort bigint
);


ALTER TABLE public."uiRoutes" OWNER TO postgres;

--
-- Name: uiSchemaServerHooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."uiSchemaServerHooks" (
    id bigint NOT NULL,
    uid character varying(255),
    type character varying(255),
    collection character varying(255),
    field character varying(255),
    method character varying(255),
    params json
);


ALTER TABLE public."uiSchemaServerHooks" OWNER TO postgres;

--
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."uiSchemaServerHooks_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."uiSchemaServerHooks_id_seq" OWNER TO postgres;

--
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."uiSchemaServerHooks_id_seq" OWNED BY public."uiSchemaServerHooks".id;


--
-- Name: uiSchemaTemplates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."uiSchemaTemplates" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255) NOT NULL,
    name character varying(255),
    "componentName" character varying(255),
    "associationName" character varying(255),
    "resourceName" character varying(255),
    uid character varying(255),
    "collectionName" character varying(255)
);


ALTER TABLE public."uiSchemaTemplates" OWNER TO postgres;

--
-- Name: uiSchemaTreePath; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."uiSchemaTreePath" (
    ancestor character varying(255) NOT NULL,
    descendant character varying(255) NOT NULL,
    depth integer,
    async boolean,
    type character varying(255),
    sort integer
);


ALTER TABLE public."uiSchemaTreePath" OWNER TO postgres;

--
-- Name: COLUMN "uiSchemaTreePath".type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."uiSchemaTreePath".type IS 'type of node';


--
-- Name: COLUMN "uiSchemaTreePath".sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."uiSchemaTreePath".sort IS 'sort of node in adjacency';


--
-- Name: uiSchemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."uiSchemas" (
    "x-uid" character varying(255) NOT NULL,
    name character varying(255),
    schema json DEFAULT '{}'::json
);


ALTER TABLE public."uiSchemas" OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id bigint NOT NULL,
    nickname character varying(255),
    email character varying(255),
    phone character varying(255),
    password character varying(255),
    "appLang" character varying(255),
    "resetToken" character varying(255),
    "systemSettings" json DEFAULT '{}'::json,
    sort bigint,
    "createdById" bigint,
    "updatedById" bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_jobs (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id bigint NOT NULL,
    "userId" bigint,
    status integer,
    result jsonb,
    "executionId" bigint,
    "nodeId" bigint,
    "jobId" bigint,
    "workflowId" bigint
);


ALTER TABLE public.users_jobs OWNER TO postgres;

--
-- Name: users_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_jobs_id_seq OWNER TO postgres;

--
-- Name: users_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_jobs_id_seq OWNED BY public.users_jobs.id;


--
-- Name: verifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verifications (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    type character varying(255),
    receiver character varying(255),
    status integer DEFAULT 0,
    "expiresAt" timestamp with time zone,
    content character varying(255),
    "providerId" character varying(255)
);


ALTER TABLE public.verifications OWNER TO postgres;

--
-- Name: verifications_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verifications_providers (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    id character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    options jsonb,
    "default" boolean
);


ALTER TABLE public.verifications_providers OWNER TO postgres;

--
-- Name: workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workflows (
    id bigint NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    key character varying(255),
    title character varying(255),
    enabled boolean DEFAULT false,
    description text,
    type character varying(255),
    config json DEFAULT '{}'::json,
    "useTransaction" boolean,
    executed integer DEFAULT 0,
    "allExecuted" integer DEFAULT 0,
    current boolean DEFAULT false
);


ALTER TABLE public.workflows OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: WTT_Asset id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Asset" ALTER COLUMN id SET DEFAULT nextval('public."WTT_Asset_id_seq"'::regclass);


--
-- Name: WTT_Customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Customer" ALTER COLUMN id SET DEFAULT nextval('public."WTT_Customer_id_seq"'::regclass);


--
-- Name: WTT_CustomerAssetsReading id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_CustomerAssetsReading" ALTER COLUMN id SET DEFAULT nextval('public."WTT_CustomerAssetsReading_id_seq"'::regclass);


--
-- Name: applicationPlugins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."applicationPlugins" ALTER COLUMN id SET DEFAULT nextval('public."applicationPlugins_id_seq"'::regclass);


--
-- Name: applicationVersion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."applicationVersion" ALTER COLUMN id SET DEFAULT nextval('public."applicationVersion_id_seq"'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: auditChanges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."auditChanges" ALTER COLUMN id SET DEFAULT nextval('public."auditChanges_id_seq"'::regclass);


--
-- Name: auditLogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."auditLogs" ALTER COLUMN id SET DEFAULT nextval('public."auditLogs_id_seq"'::regclass);


--
-- Name: chartsQueries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chartsQueries" ALTER COLUMN id SET DEFAULT nextval('public."chartsQueries_id_seq"'::regclass);


--
-- Name: collectionCategories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collectionCategories" ALTER COLUMN id SET DEFAULT nextval('public."collectionCategories_id_seq"'::regclass);


--
-- Name: executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.executions ALTER COLUMN id SET DEFAULT nextval('public.executions_id_seq'::regclass);


--
-- Name: flow_nodes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flow_nodes ALTER COLUMN id SET DEFAULT nextval('public.flow_nodes_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: rolesResources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResources" ALTER COLUMN id SET DEFAULT nextval('public."rolesResources_id_seq"'::regclass);


--
-- Name: rolesResourcesActions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResourcesActions" ALTER COLUMN id SET DEFAULT nextval('public."rolesResourcesActions_id_seq"'::regclass);


--
-- Name: rolesResourcesScopes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResourcesScopes" ALTER COLUMN id SET DEFAULT nextval('public."rolesResourcesScopes_id_seq"'::regclass);


--
-- Name: sequences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequences ALTER COLUMN id SET DEFAULT nextval('public.sequences_id_seq'::regclass);


--
-- Name: storages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storages ALTER COLUMN id SET DEFAULT nextval('public.storages_id_seq'::regclass);


--
-- Name: systemSettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."systemSettings" ALTER COLUMN id SET DEFAULT nextval('public."systemSettings_id_seq"'::regclass);


--
-- Name: uiSchemaServerHooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiSchemaServerHooks" ALTER COLUMN id SET DEFAULT nextval('public."uiSchemaServerHooks_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_jobs ALTER COLUMN id SET DEFAULT nextval('public.users_jobs_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Data for Name: WTT_Asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WTT_Asset" ("createdAt", "updatedAt", sort, "createdById", "updatedById", id, "Name", "Code") FROM stdin;
2023-05-31 14:23:23.857+05:30	2023-05-31 14:34:37.563+05:30	1	1	1	1	Humidity Measurement	AX103
2023-05-31 14:27:40.077+05:30	2023-05-31 14:35:00.961+05:30	2	1	1	2	Electricity measurement 	GPI-567
\.


--
-- Data for Name: WTT_Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WTT_Customer" ("createdAt", "updatedAt", sort, "createdById", "updatedById", id, name, "Description", "IsActive", "assetId") FROM stdin;
2023-05-31 14:36:32.08+05:30	2023-05-31 14:42:55.937+05:30	1	1	1	1	Glan Pharma Industries	Hyderabad	t	1
2023-05-31 14:44:44.906+05:30	2023-05-31 14:44:44.93+05:30	2	1	1	2	XYZ Corporation	Mumbai MH	t	2
2023-05-31 22:49:09.03+05:30	2023-05-31 22:49:09.079+05:30	3	1	1	3	Ranjit	Test	t	1
2023-05-31 23:21:06.36+05:30	2023-05-31 23:21:06.388+05:30	4	1	1	4	Ranjit	test2	t	1
2023-05-31 23:41:00.875+05:30	2023-05-31 23:41:00.875+05:30	5	1	1	5	ranjit w2	w2	t	\N
2023-05-31 23:56:55.523+05:30	2023-05-31 23:56:55.523+05:30	6	1	1	6	ranjit	ranjit	t	\N
2023-05-31 23:57:30.779+05:30	2023-05-31 23:57:30.779+05:30	7	1	1	7	ranjit	ranjit	t	\N
\.


--
-- Data for Name: WTT_CustomerAssetsReading; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WTT_CustomerAssetsReading" (sort, id, "ReadingDateTime", "AssetId", "Value") FROM stdin;
\N	1	2023-05-31 00:05:00+05:30	1	151
\N	2	2023-05-31 00:05:00+05:30	2	302
\N	3	2023-05-31 00:10:00+05:30	1	302
\N	4	2023-05-31 00:10:00+05:30	2	604
\N	5	2023-05-31 00:15:00+05:30	1	453
\N	6	2023-05-31 00:15:00+05:30	2	906
\N	7	2023-05-31 00:20:00+05:30	1	604
\N	8	2023-05-31 00:20:00+05:30	2	1208
\N	9	2023-05-31 00:25:00+05:30	1	755
\N	10	2023-05-31 00:25:00+05:30	2	1510
\N	11	2023-05-31 00:30:00+05:30	1	906
\N	12	2023-05-31 00:30:00+05:30	2	1812
\N	13	2023-05-31 00:35:00+05:30	1	1057
\N	14	2023-05-31 00:35:00+05:30	2	2114
\N	15	2023-05-31 00:40:00+05:30	1	1208
\N	16	2023-05-31 00:40:00+05:30	2	2416
\N	17	2023-05-31 00:45:00+05:30	1	1359
\N	18	2023-05-31 00:45:00+05:30	2	2718
\N	19	2023-05-31 00:50:00+05:30	1	1510
\N	20	2023-05-31 00:50:00+05:30	2	3020
\N	21	2023-05-31 00:55:00+05:30	1	1661
\N	22	2023-05-31 00:55:00+05:30	2	3322
\N	23	2023-05-31 01:00:00+05:30	1	1812
\N	24	2023-05-31 01:00:00+05:30	2	3624
\N	25	2023-05-31 01:05:00+05:30	1	1963
\N	26	2023-05-31 01:05:00+05:30	2	3926
\N	27	2023-05-31 01:10:00+05:30	1	2114
\N	28	2023-05-31 01:10:00+05:30	2	4228
\N	29	2023-05-31 01:15:00+05:30	1	2265
\N	30	2023-05-31 01:15:00+05:30	2	4530
\N	31	2023-05-31 01:20:00+05:30	1	2416
\N	32	2023-05-31 01:20:00+05:30	2	4832
\N	33	2023-05-31 01:25:00+05:30	1	2567
\N	34	2023-05-31 01:25:00+05:30	2	5134
\N	35	2023-05-31 01:30:00+05:30	1	2718
\N	36	2023-05-31 01:30:00+05:30	2	5436
\N	37	2023-05-31 01:35:00+05:30	1	2869
\N	38	2023-05-31 01:35:00+05:30	2	5738
\N	39	2023-05-31 01:40:00+05:30	1	3020
\N	40	2023-05-31 01:40:00+05:30	2	6040
\N	41	2023-05-31 01:45:00+05:30	1	3171
\N	42	2023-05-31 01:45:00+05:30	2	6342
\N	43	2023-05-31 01:50:00+05:30	1	3322
\N	44	2023-05-31 01:50:00+05:30	2	6644
\N	45	2023-05-31 01:55:00+05:30	1	3473
\N	46	2023-05-31 01:55:00+05:30	2	6946
\N	47	2023-05-31 02:00:00+05:30	1	3624
\N	48	2023-05-31 02:00:00+05:30	2	7248
\N	49	2023-05-31 02:05:00+05:30	1	3775
\N	50	2023-05-31 02:05:00+05:30	2	7550
\N	51	2023-05-31 02:10:00+05:30	1	3926
\N	52	2023-05-31 02:10:00+05:30	2	7852
\N	53	2023-05-31 02:15:00+05:30	1	4077
\N	54	2023-05-31 02:15:00+05:30	2	8154
\N	55	2023-05-31 02:20:00+05:30	1	4228
\N	56	2023-05-31 02:20:00+05:30	2	8456
\N	57	2023-05-31 02:25:00+05:30	1	4379
\N	58	2023-05-31 02:25:00+05:30	2	8758
\N	59	2023-05-31 02:30:00+05:30	1	4530
\N	60	2023-05-31 02:30:00+05:30	2	9060
\N	61	2023-05-31 02:35:00+05:30	1	4681
\N	62	2023-05-31 02:35:00+05:30	2	9362
\N	63	2023-05-31 02:40:00+05:30	1	4832
\N	64	2023-05-31 02:40:00+05:30	2	9664
\N	65	2023-05-31 02:45:00+05:30	1	4983
\N	66	2023-05-31 02:45:00+05:30	2	9966
\N	67	2023-05-31 02:50:00+05:30	1	5134
\N	68	2023-05-31 02:50:00+05:30	2	10268
\N	69	2023-05-31 02:55:00+05:30	1	5285
\N	70	2023-05-31 02:55:00+05:30	2	10570
\N	71	2023-05-31 03:00:00+05:30	1	5436
\N	72	2023-05-31 03:00:00+05:30	2	10872
\N	73	2023-05-31 03:05:00+05:30	1	5587
\N	74	2023-05-31 03:05:00+05:30	2	11174
\N	75	2023-05-31 03:10:00+05:30	1	5738
\N	76	2023-05-31 03:10:00+05:30	2	11476
\N	77	2023-05-31 03:15:00+05:30	1	5889
\N	78	2023-05-31 03:15:00+05:30	2	11778
\N	79	2023-05-31 03:20:00+05:30	1	6040
\N	80	2023-05-31 03:20:00+05:30	2	12080
\N	81	2023-05-31 03:25:00+05:30	1	6191
\N	82	2023-05-31 03:25:00+05:30	2	12382
\N	83	2023-05-31 03:30:00+05:30	1	6342
\N	84	2023-05-31 03:30:00+05:30	2	12684
\N	85	2023-05-31 03:35:00+05:30	1	6493
\N	86	2023-05-31 03:35:00+05:30	2	12986
\N	87	2023-05-31 03:40:00+05:30	1	6644
\N	88	2023-05-31 03:40:00+05:30	2	13288
\N	89	2023-05-31 03:45:00+05:30	1	6795
\N	90	2023-05-31 03:45:00+05:30	2	13590
\N	91	2023-05-31 03:50:00+05:30	1	6946
\N	92	2023-05-31 03:50:00+05:30	2	13892
\N	93	2023-05-31 03:55:00+05:30	1	7097
\N	94	2023-05-31 03:55:00+05:30	2	14194
\N	95	2023-05-31 04:00:00+05:30	1	7248
\N	96	2023-05-31 04:00:00+05:30	2	14496
\N	97	2023-05-31 04:05:00+05:30	1	7399
\N	98	2023-05-31 04:05:00+05:30	2	14798
\N	99	2023-05-31 04:10:00+05:30	1	7550
\N	100	2023-05-31 04:10:00+05:30	2	15100
\N	101	2023-05-31 04:15:00+05:30	1	7701
\N	102	2023-05-31 04:15:00+05:30	2	15402
\N	103	2023-05-31 04:20:00+05:30	1	7852
\N	104	2023-05-31 04:20:00+05:30	2	15704
\N	105	2023-05-31 04:25:00+05:30	1	8003
\N	106	2023-05-31 04:25:00+05:30	2	16006
\N	107	2023-05-31 04:30:00+05:30	1	8154
\N	108	2023-05-31 04:30:00+05:30	2	16308
\N	109	2023-05-31 04:35:00+05:30	1	8305
\N	110	2023-05-31 04:35:00+05:30	2	16610
\N	111	2023-05-31 04:40:00+05:30	1	8456
\N	112	2023-05-31 04:40:00+05:30	2	16912
\N	113	2023-05-31 04:45:00+05:30	1	8607
\N	114	2023-05-31 04:45:00+05:30	2	17214
\N	115	2023-05-31 04:50:00+05:30	1	8758
\N	116	2023-05-31 04:50:00+05:30	2	17516
\N	117	2023-05-31 04:55:00+05:30	1	8909
\N	118	2023-05-31 04:55:00+05:30	2	17818
\N	119	2023-05-31 05:00:00+05:30	1	9060
\N	120	2023-05-31 05:00:00+05:30	2	18120
\N	121	2023-05-31 05:05:00+05:30	1	9211
\N	122	2023-05-31 05:05:00+05:30	2	18422
\N	123	2023-05-31 05:10:00+05:30	1	9362
\N	124	2023-05-31 05:10:00+05:30	2	18724
\N	125	2023-05-31 05:15:00+05:30	1	9513
\N	126	2023-05-31 05:15:00+05:30	2	19026
\N	127	2023-05-31 05:20:00+05:30	1	9664
\N	128	2023-05-31 05:20:00+05:30	2	19328
\N	129	2023-05-31 05:25:00+05:30	1	9815
\N	130	2023-05-31 05:25:00+05:30	2	19630
\N	131	2023-05-31 05:30:00+05:30	1	9966
\N	132	2023-05-31 05:30:00+05:30	2	19932
\N	133	2023-05-31 05:35:00+05:30	1	10117
\N	134	2023-05-31 05:35:00+05:30	2	20234
\N	135	2023-05-31 05:40:00+05:30	1	10268
\N	136	2023-05-31 05:40:00+05:30	2	20536
\N	137	2023-05-31 05:45:00+05:30	1	10419
\N	138	2023-05-31 05:45:00+05:30	2	20838
\N	139	2023-05-31 05:50:00+05:30	1	10570
\N	140	2023-05-31 05:50:00+05:30	2	21140
\N	141	2023-05-31 05:55:00+05:30	1	10721
\N	142	2023-05-31 05:55:00+05:30	2	21442
\N	143	2023-05-31 06:00:00+05:30	1	10872
\N	144	2023-05-31 06:00:00+05:30	2	21744
\N	145	2023-05-31 06:05:00+05:30	1	11023
\N	146	2023-05-31 06:05:00+05:30	2	22046
\N	147	2023-05-31 06:10:00+05:30	1	11174
\N	148	2023-05-31 06:10:00+05:30	2	22348
\N	149	2023-05-31 06:15:00+05:30	1	11325
\N	150	2023-05-31 06:15:00+05:30	2	22650
\N	151	2023-05-31 06:20:00+05:30	1	11476
\N	152	2023-05-31 06:20:00+05:30	2	22952
\N	153	2023-05-31 06:25:00+05:30	1	11627
\N	154	2023-05-31 06:25:00+05:30	2	23254
\N	155	2023-05-31 06:30:00+05:30	1	11778
\N	156	2023-05-31 06:30:00+05:30	2	23556
\N	157	2023-05-31 06:35:00+05:30	1	11929
\N	158	2023-05-31 06:35:00+05:30	2	23858
\N	159	2023-05-31 06:40:00+05:30	1	12080
\N	160	2023-05-31 06:40:00+05:30	2	24160
\N	161	2023-05-31 06:45:00+05:30	1	12231
\N	162	2023-05-31 06:45:00+05:30	2	24462
\N	163	2023-05-31 06:50:00+05:30	1	12382
\N	164	2023-05-31 06:50:00+05:30	2	24764
\N	165	2023-05-31 06:55:00+05:30	1	12533
\N	166	2023-05-31 06:55:00+05:30	2	25066
\N	167	2023-05-31 07:00:00+05:30	1	12684
\N	168	2023-05-31 07:00:00+05:30	2	25368
\N	169	2023-05-31 07:05:00+05:30	1	12835
\N	170	2023-05-31 07:05:00+05:30	2	25670
\N	171	2023-05-31 07:10:00+05:30	1	12986
\N	172	2023-05-31 07:10:00+05:30	2	25972
\N	173	2023-05-31 07:15:00+05:30	1	13137
\N	174	2023-05-31 07:15:00+05:30	2	26274
\N	175	2023-05-31 07:20:00+05:30	1	13288
\N	176	2023-05-31 07:20:00+05:30	2	26576
\N	177	2023-05-31 07:25:00+05:30	1	13439
\N	178	2023-05-31 07:25:00+05:30	2	26878
\N	179	2023-05-31 07:30:00+05:30	1	13590
\N	180	2023-05-31 07:30:00+05:30	2	27180
\N	181	2023-05-31 07:35:00+05:30	1	13741
\N	182	2023-05-31 07:35:00+05:30	2	27482
\N	183	2023-05-31 07:40:00+05:30	1	13892
\N	184	2023-05-31 07:40:00+05:30	2	27784
\N	185	2023-05-31 07:45:00+05:30	1	14043
\N	186	2023-05-31 07:45:00+05:30	2	28086
\N	187	2023-05-31 07:50:00+05:30	1	14194
\N	188	2023-05-31 07:50:00+05:30	2	28388
\N	189	2023-05-31 07:55:00+05:30	1	14345
\N	190	2023-05-31 07:55:00+05:30	2	28690
\N	191	2023-05-31 08:00:00+05:30	1	14496
\N	192	2023-05-31 08:00:00+05:30	2	28992
\N	193	2023-05-31 08:05:00+05:30	1	14647
\N	194	2023-05-31 08:05:00+05:30	2	29294
\N	195	2023-05-31 08:10:00+05:30	1	14798
\N	196	2023-05-31 08:10:00+05:30	2	29596
\N	197	2023-05-31 08:15:00+05:30	1	14949
\N	198	2023-05-31 08:15:00+05:30	2	29898
\N	199	2023-05-31 08:20:00+05:30	1	15100
\N	200	2023-05-31 08:20:00+05:30	2	30200
\N	201	2023-05-31 08:25:00+05:30	1	15251
\N	202	2023-05-31 08:25:00+05:30	2	30502
\N	203	2023-05-31 08:30:00+05:30	1	15402
\N	204	2023-05-31 08:30:00+05:30	2	30804
\N	205	2023-05-31 08:35:00+05:30	1	15553
\N	206	2023-05-31 08:35:00+05:30	2	31106
\N	207	2023-05-31 08:40:00+05:30	1	15704
\N	208	2023-05-31 08:40:00+05:30	2	31408
\N	209	2023-05-31 08:45:00+05:30	1	15855
\N	210	2023-05-31 08:45:00+05:30	2	31710
\N	211	2023-05-31 08:50:00+05:30	1	16006
\N	212	2023-05-31 08:50:00+05:30	2	32012
\N	213	2023-05-31 08:55:00+05:30	1	16157
\N	214	2023-05-31 08:55:00+05:30	2	32314
\N	215	2023-05-31 09:00:00+05:30	1	16308
\N	216	2023-05-31 09:00:00+05:30	2	32616
\N	217	2023-05-31 09:05:00+05:30	1	16459
\N	218	2023-05-31 09:05:00+05:30	2	32918
\N	219	2023-05-31 09:10:00+05:30	1	16610
\N	220	2023-05-31 09:10:00+05:30	2	33220
\N	221	2023-05-31 09:15:00+05:30	1	16761
\N	222	2023-05-31 09:15:00+05:30	2	33522
\N	223	2023-05-31 09:20:00+05:30	1	16912
\N	224	2023-05-31 09:20:00+05:30	2	33824
\N	225	2023-05-31 09:25:00+05:30	1	17063
\N	226	2023-05-31 09:25:00+05:30	2	34126
\N	227	2023-05-31 09:30:00+05:30	1	17214
\N	228	2023-05-31 09:30:00+05:30	2	34428
\N	229	2023-05-31 09:35:00+05:30	1	17365
\N	230	2023-05-31 09:35:00+05:30	2	34730
\N	231	2023-05-31 09:40:00+05:30	1	17516
\N	232	2023-05-31 09:40:00+05:30	2	35032
\N	233	2023-05-31 09:45:00+05:30	1	17667
\N	234	2023-05-31 09:45:00+05:30	2	35334
\N	235	2023-05-31 09:50:00+05:30	1	17818
\N	236	2023-05-31 09:50:00+05:30	2	35636
\N	237	2023-05-31 09:55:00+05:30	1	17969
\N	238	2023-05-31 09:55:00+05:30	2	35938
\N	239	2023-05-31 10:00:00+05:30	1	18120
\N	240	2023-05-31 10:00:00+05:30	2	36240
\N	241	2023-05-31 10:05:00+05:30	1	18271
\N	242	2023-05-31 10:05:00+05:30	2	36542
\N	243	2023-05-31 10:10:00+05:30	1	18422
\N	244	2023-05-31 10:10:00+05:30	2	36844
\N	245	2023-05-31 10:15:00+05:30	1	18573
\N	246	2023-05-31 10:15:00+05:30	2	37146
\N	247	2023-05-31 10:20:00+05:30	1	18724
\N	248	2023-05-31 10:20:00+05:30	2	37448
\N	249	2023-05-31 10:25:00+05:30	1	18875
\N	250	2023-05-31 10:25:00+05:30	2	37750
\N	251	2023-05-31 10:30:00+05:30	1	19026
\N	252	2023-05-31 10:30:00+05:30	2	38052
\N	253	2023-05-31 10:35:00+05:30	1	19177
\N	254	2023-05-31 10:35:00+05:30	2	38354
\N	255	2023-05-31 10:40:00+05:30	1	19328
\N	256	2023-05-31 10:40:00+05:30	2	38656
\N	257	2023-05-31 10:45:00+05:30	1	19479
\N	258	2023-05-31 10:45:00+05:30	2	38958
\N	259	2023-05-31 10:50:00+05:30	1	19630
\N	260	2023-05-31 10:50:00+05:30	2	39260
\N	261	2023-05-31 10:55:00+05:30	1	19781
\N	262	2023-05-31 10:55:00+05:30	2	39562
\N	263	2023-05-31 11:00:00+05:30	1	19932
\N	264	2023-05-31 11:00:00+05:30	2	39864
\N	265	2023-05-31 11:05:00+05:30	1	20083
\N	266	2023-05-31 11:05:00+05:30	2	40166
\N	267	2023-05-31 11:10:00+05:30	1	20234
\N	268	2023-05-31 11:10:00+05:30	2	40468
\N	269	2023-05-31 11:15:00+05:30	1	20385
\N	270	2023-05-31 11:15:00+05:30	2	40770
\N	271	2023-05-31 11:20:00+05:30	1	20536
\N	272	2023-05-31 11:20:00+05:30	2	41072
\N	273	2023-05-31 11:25:00+05:30	1	20687
\N	274	2023-05-31 11:25:00+05:30	2	41374
\N	275	2023-05-31 11:30:00+05:30	1	20838
\N	276	2023-05-31 11:30:00+05:30	2	41676
\N	277	2023-05-31 11:35:00+05:30	1	20989
\N	278	2023-05-31 11:35:00+05:30	2	41978
\N	279	2023-05-31 11:40:00+05:30	1	21140
\N	280	2023-05-31 11:40:00+05:30	2	42280
\N	281	2023-05-31 11:45:00+05:30	1	21291
\N	282	2023-05-31 11:45:00+05:30	2	42582
\N	283	2023-05-31 11:50:00+05:30	1	21442
\N	284	2023-05-31 11:50:00+05:30	2	42884
\N	285	2023-05-31 11:55:00+05:30	1	21593
\N	286	2023-05-31 11:55:00+05:30	2	43186
\.


--
-- Data for Name: applicationPlugins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."applicationPlugins" (id, "createdAt", "updatedAt", name, version, enabled, installed, "builtIn", options) FROM stdin;
1	2023-05-31 09:36:07.442+05:30	2023-05-31 09:36:07.442+05:30	error-handler	0.9.4-alpha.2	t	t	t	{}
2	2023-05-31 09:36:08.194+05:30	2023-05-31 09:36:08.194+05:30	collection-manager	0.9.4-alpha.2	t	t	t	{}
3	2023-05-31 09:36:08.735+05:30	2023-05-31 09:36:08.735+05:30	ui-schema-storage	0.9.4-alpha.2	t	t	t	{}
4	2023-05-31 09:36:08.928+05:30	2023-05-31 09:36:08.928+05:30	ui-routes-storage	0.9.4-alpha.2	t	t	t	{}
5	2023-05-31 09:36:12.615+05:30	2023-05-31 09:36:12.615+05:30	file-manager	0.9.4-alpha.2	t	t	t	{}
6	2023-05-31 09:36:12.765+05:30	2023-05-31 09:36:12.765+05:30	system-settings	0.9.4-alpha.2	t	t	t	{}
7	2023-05-31 09:36:13.279+05:30	2023-05-31 09:36:13.279+05:30	sequence-field	0.9.4-alpha.2	t	t	t	{}
8	2023-05-31 09:36:13.534+05:30	2023-05-31 09:36:13.534+05:30	verification	0.9.4-alpha.2	t	t	t	{}
9	2023-05-31 09:36:14.336+05:30	2023-05-31 09:36:14.336+05:30	users	0.9.4-alpha.2	t	t	t	{}
10	2023-05-31 09:36:14.892+05:30	2023-05-31 09:36:14.892+05:30	acl	0.9.4-alpha.2	t	t	t	{}
11	2023-05-31 09:36:15.052+05:30	2023-05-31 09:36:15.052+05:30	china-region	0.9.4-alpha.2	t	t	t	{}
12	2023-05-31 09:36:16.004+05:30	2023-05-31 09:36:16.004+05:30	workflow	0.9.4-alpha.2	t	t	t	{}
13	2023-05-31 09:36:16.223+05:30	2023-05-31 09:36:16.223+05:30	client	0.9.4-alpha.2	t	t	t	{}
14	2023-05-31 09:36:16.92+05:30	2023-05-31 09:36:16.92+05:30	export	0.9.4-alpha.2	t	t	t	{}
15	2023-05-31 09:36:17.357+05:30	2023-05-31 09:36:17.357+05:30	import	0.9.4-alpha.2	t	t	t	{}
16	2023-05-31 09:36:17.525+05:30	2023-05-31 09:36:17.525+05:30	audit-logs	0.9.4-alpha.2	t	t	t	{}
17	2023-05-31 09:36:25.287+05:30	2023-05-31 09:36:25.287+05:30	duplicator	0.9.4-alpha.2	t	t	t	{}
18	2023-05-31 09:36:25.426+05:30	2023-05-31 09:36:25.426+05:30	iframe-block	0.9.4-alpha.2	t	t	t	{}
19	2023-05-31 09:36:25.596+05:30	2023-05-31 09:36:25.596+05:30	formula-field	0.9.4-alpha.2	t	t	t	{}
20	2023-05-31 09:36:25.905+05:30	2023-05-31 09:36:25.905+05:30	charts	0.9.4-alpha.2	t	t	t	{}
21	2023-05-31 09:36:26.04+05:30	2023-05-31 09:36:26.04+05:30	sample-hello	0.9.4-alpha.2	f	f	f	{}
22	2023-05-31 09:36:26.231+05:30	2023-05-31 09:36:26.231+05:30	multi-app-manager	0.9.4-alpha.2	f	f	f	{}
23	2023-05-31 09:36:26.448+05:30	2023-05-31 09:36:26.448+05:30	multi-app-share-collection	0.9.4-alpha.2	f	f	f	{}
24	2023-05-31 09:36:28.41+05:30	2023-05-31 09:36:28.41+05:30	oidc	0.9.4-alpha.2	f	f	f	{}
25	2023-05-31 09:36:30.593+05:30	2023-05-31 09:36:30.593+05:30	saml	0.9.4-alpha.2	f	f	f	{}
26	2023-05-31 09:36:30.94+05:30	2023-05-31 09:36:30.94+05:30	map	0.9.4-alpha.2	f	f	f	{}
27	2023-05-31 09:36:31.13+05:30	2023-05-31 09:36:31.13+05:30	snapshot-field	0.9.4-alpha.2	f	f	f	{}
28	2023-05-31 09:36:31.288+05:30	2023-05-31 09:36:31.288+05:30	graph-collection-manager	0.9.4-alpha.2	f	f	f	{}
\.


--
-- Data for Name: applicationVersion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."applicationVersion" (id, value) FROM stdin;
1	0.9.4-alpha.2
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments (id, "createdAt", "updatedAt", title, filename, extname, size, mimetype, path, meta, url, "createdById", "updatedById", "storageId") FROM stdin;
1	2023-05-31 09:37:00.662+05:30	2023-05-31 09:37:00.662+05:30	nocobase-logo	682e5ad037dd02a0fe4800a3e91c283b.png	.png	\N	image/png	\N	{}	https://nocobase.oss-cn-beijing.aliyuncs.com/682e5ad037dd02a0fe4800a3e91c283b.png	\N	\N	\N
2	2023-05-31 14:16:00.534+05:30	2023-05-31 14:16:00.534+05:30	wtt	bf7c5aa78ead261e10ddfced85935eea.png	.png	5630	image/png		{}	http://localhost:13000/storage/uploads/bf7c5aa78ead261e10ddfced85935eea.png	\N	\N	1
\.


--
-- Data for Name: auditChanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."auditChanges" (id, field, before, after, "auditLogId") FROM stdin;
1   {"name":"email","interface":"email","type":"string","unique":true,"uiSchema":{"type":"string","title":"{{t("Email")}}","x-component":"Input","x-validator":"email","required":true}} \N "admin@nocobase.com" 1
2   {"name":"nickname","interface":"input","type":"string","uiSchema":{"type":"string","title":"{{t("Nickname")}}","x-component":"Input"}} \N "Super Admin" 1
3	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	\N	1
4	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	\N	1
5	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	2
6	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	2
7	{"name":"Name","key":"ri2sr9zbgf6","interface":"input","type":"string","collectionName":"WTT_Asset","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"},"unique":true}	\N	"XYZ Corporation"	3
8	{"name":"Code","key":"bheaix6438o","interface":"input","type":"string","collectionName":"WTT_Asset","sort":7,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Unique Number"},"unique":true}	\N	"AX103"	3
9	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	3
10	{"name":"Name","key":"ri2sr9zbgf6","interface":"input","type":"string","collectionName":"WTT_Asset","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"},"unique":true}	\N	"Glan Pharma Industries"	4
11	{"name":"Code","key":"bheaix6438o","interface":"input","type":"string","collectionName":"WTT_Asset","sort":7,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Unique Number"},"unique":true}	\N	"GPI-567"	4
12	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	4
13	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	4
14	{"name":"Name","key":"ri2sr9zbgf6","interface":"input","type":"string","collectionName":"WTT_Asset","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"},"unique":true}	"XYZ Corporation"	"Humidity Measurement"	5
15	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	5
16	{"name":"Name","key":"ri2sr9zbgf6","interface":"input","type":"string","collectionName":"WTT_Asset","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"},"unique":true}	"Glan Pharma Industries"	"Electricity measurement "	6
17	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	6
18	{"name":"IsActive","key":"9s0bs4h1l6r","type":"boolean","interface":"checkbox","collectionName":"WTT_Customer","sort":8,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"boolean","x-component":"Checkbox","title":"Status"},"defaultValue":true}	\N	true	7
19	{"name":"name","key":"kx9khiyarco","interface":"input","type":"string","collectionName":"WTT_Customer","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"Glan Pharma Industries"	7
20	{"name":"Description","key":"v5p87v9vu7y","interface":"textarea","type":"text","collectionName":"WTT_Customer","sort":7,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"Hyderabad"	7
21	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	7
22	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	7
23	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	8
24	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	9
25	{"name":"name","key":"kx9khiyarco","interface":"input","type":"string","collectionName":"WTT_Customer","sort":6,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"XYZ Corporation"	10
26	{"name":"Description","key":"v5p87v9vu7y","interface":"textarea","type":"text","collectionName":"WTT_Customer","sort":7,"parentKey":null,"reverseKey":null,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"Mumbai MH"	10
27	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	10
28	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	10
29	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	11
30	{"name":"name","key":"kx9khiyarco","type":"string","interface":"input","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":6,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"Ranjit"	12
31	{"name":"Description","key":"v5p87v9vu7y","type":"text","interface":"textarea","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":7,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"Test"	12
32	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	12
33	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	12
34	{"name":"assetId","key":"ukzqzi9i93p","type":"bigInt","interface":"integer","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":1,"isForeignKey":true,"uiSchema":{"type":"number","title":"assetId","x-component":"InputNumber","x-read-pretty":true}}	\N	1	13
35	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	13
36	{"name":"name","key":"kx9khiyarco","type":"string","interface":"input","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":6,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"Ranjit"	14
37	{"name":"Description","key":"v5p87v9vu7y","type":"text","interface":"textarea","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":7,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"test2"	14
38	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	14
39	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	14
40	{"name":"assetId","key":"ukzqzi9i93p","type":"bigInt","interface":"integer","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":1,"isForeignKey":true,"uiSchema":{"type":"number","title":"assetId","x-component":"InputNumber","x-read-pretty":true}}	\N	1	15
41	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	1	1	15
42	{"name":"name","key":"kx9khiyarco","type":"string","interface":"input","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":6,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"ranjit w2"	16
43	{"name":"Description","key":"v5p87v9vu7y","type":"text","interface":"textarea","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":7,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"w2"	16
44	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	16
45	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	16
46	{"name":"name","key":"kx9khiyarco","type":"string","interface":"input","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":6,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"ranjit"	17
47	{"name":"Description","key":"v5p87v9vu7y","type":"text","interface":"textarea","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":7,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"ranjit"	17
48	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	17
49	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	17
50	{"name":"name","key":"kx9khiyarco","type":"string","interface":"input","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":6,"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	\N	"ranjit"	18
51	{"name":"Description","key":"v5p87v9vu7y","type":"text","interface":"textarea","collectionName":"WTT_Customer","parentKey":null,"reverseKey":null,"sort":7,"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	\N	"ranjit"	18
52	{"name":"createdById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	\N	1	18
53	{"name":"updatedById","type":"context","dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	\N	1	18
\.


--
-- Data for Name: auditLogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."auditLogs" (id, "createdAt", type, "recordId", "collectionName", "userId") FROM stdin;
1	2023-05-31 09:37:00.697+05:30	create	1	users	\N
2	2023-05-31 14:23:23.857+05:30	create	1	WTT_Asset	1
3	2023-05-31 14:26:11.511+05:30	update	1	WTT_Asset	1
4	2023-05-31 14:27:40.077+05:30	create	2	WTT_Asset	1
5	2023-05-31 14:34:37.563+05:30	update	1	WTT_Asset	1
6	2023-05-31 14:35:00.961+05:30	update	2	WTT_Asset	1
7	2023-05-31 14:36:32.08+05:30	create	1	WTT_Customer	1
8	2023-05-31 14:36:32.08+05:30	update	1	WTT_Customer	1
9	2023-05-31 14:42:55.937+05:30	update	1	WTT_Customer	1
10	2023-05-31 14:44:44.906+05:30	create	2	WTT_Customer	1
11	2023-05-31 14:44:44.93+05:30	update	2	WTT_Customer	1
12	2023-05-31 22:49:09.03+05:30	create	3	WTT_Customer	1
13	2023-05-31 22:49:09.079+05:30	update	3	WTT_Customer	1
14	2023-05-31 23:21:06.36+05:30	create	4	WTT_Customer	1
15	2023-05-31 23:21:06.388+05:30	update	4	WTT_Customer	1
16	2023-05-31 23:41:00.875+05:30	create	5	WTT_Customer	1
17	2023-05-31 23:56:55.523+05:30	create	6	WTT_Customer	1
18	2023-05-31 23:57:30.779+05:30	create	7	WTT_Customer	1
\.


--
-- Data for Name: chartsQueries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chartsQueries" (id, "createdAt", "updatedAt", title, type, options, fields) FROM stdin;
\.


--
-- Data for Name: chinaRegions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chinaRegions" ("createdAt", "updatedAt", code, name, "parentCode", level) FROM stdin;
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	11	北京市	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	12	天津市	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	13	河北省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	14	山西省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	15	内蒙古自治区	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	21	辽宁省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	22	吉林省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	23	黑龙江省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	31	上海市	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	32	江苏省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	33	浙江省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	34	安徽省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	35	福建省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	36	江西省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	37	山东省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	41	河南省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	42	湖北省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	43	湖南省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	44	广东省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	45	广西壮族自治区	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	46	海南省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	50	重庆市	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	51	四川省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	52	贵州省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	53	云南省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	54	西藏自治区	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	61	陕西省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	62	甘肃省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	63	青海省	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	64	宁夏回族自治区	\N	1
2023-05-31 09:37:01.015+05:30	2023-05-31 09:37:01.015+05:30	65	新疆维吾尔自治区	\N	1
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1101	市辖区	11	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1201	市辖区	12	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1301	石家庄市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1302	唐山市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1303	秦皇岛市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1304	邯郸市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1305	邢台市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1306	保定市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1307	张家口市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1308	承德市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1309	沧州市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1310	廊坊市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1311	衡水市	13	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1401	太原市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1402	大同市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1403	阳泉市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1404	长治市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1405	晋城市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1406	朔州市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1407	晋中市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1408	运城市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1409	忻州市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1410	临汾市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1411	吕梁市	14	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1501	呼和浩特市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1502	包头市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1503	乌海市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1504	赤峰市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1505	通辽市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1506	鄂尔多斯市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1507	呼伦贝尔市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1508	巴彦淖尔市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1509	乌兰察布市	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1522	兴安盟	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1525	锡林郭勒盟	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	1529	阿拉善盟	15	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2101	沈阳市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2102	大连市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2103	鞍山市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2104	抚顺市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2105	本溪市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2106	丹东市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2107	锦州市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2108	营口市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2109	阜新市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2110	辽阳市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2111	盘锦市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2112	铁岭市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2113	朝阳市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2114	葫芦岛市	21	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2201	长春市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2202	吉林市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2203	四平市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2204	辽源市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2205	通化市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2206	白山市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2207	松原市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2208	白城市	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2224	延边朝鲜族自治州	22	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2301	哈尔滨市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2302	齐齐哈尔市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2303	鸡西市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2304	鹤岗市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2305	双鸭山市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2306	大庆市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2307	伊春市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2308	佳木斯市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2309	七台河市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2310	牡丹江市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2311	黑河市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2312	绥化市	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	2327	大兴安岭地区	23	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3101	市辖区	31	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3201	南京市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3202	无锡市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3203	徐州市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3204	常州市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3205	苏州市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3206	南通市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3207	连云港市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3208	淮安市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3209	盐城市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3210	扬州市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3211	镇江市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3212	泰州市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3213	宿迁市	32	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3301	杭州市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3302	宁波市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3303	温州市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3304	嘉兴市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3305	湖州市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3306	绍兴市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3307	金华市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3308	衢州市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3309	舟山市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3310	台州市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3311	丽水市	33	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3401	合肥市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3402	芜湖市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3403	蚌埠市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3404	淮南市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3405	马鞍山市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3406	淮北市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3407	铜陵市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3408	安庆市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3410	黄山市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3411	滁州市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3412	阜阳市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3413	宿州市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3415	六安市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3416	亳州市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3417	池州市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3418	宣城市	34	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3501	福州市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3502	厦门市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3503	莆田市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3504	三明市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3505	泉州市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3506	漳州市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3507	南平市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3508	龙岩市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3509	宁德市	35	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3601	南昌市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3602	景德镇市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3603	萍乡市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3604	九江市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3605	新余市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3606	鹰潭市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3607	赣州市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3608	吉安市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3609	宜春市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3610	抚州市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3611	上饶市	36	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3701	济南市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3702	青岛市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3703	淄博市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3704	枣庄市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3705	东营市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3706	烟台市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3707	潍坊市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3708	济宁市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3709	泰安市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3710	威海市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3711	日照市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3713	临沂市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3714	德州市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3715	聊城市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3716	滨州市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	3717	菏泽市	37	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4101	郑州市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4102	开封市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4103	洛阳市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4104	平顶山市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4105	安阳市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4106	鹤壁市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4107	新乡市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4108	焦作市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4109	濮阳市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4110	许昌市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4111	漯河市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4112	三门峡市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4113	南阳市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4114	商丘市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4115	信阳市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4116	周口市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4117	驻马店市	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4190	省直辖县级行政区划	41	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4201	武汉市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4202	黄石市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4203	十堰市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4205	宜昌市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4206	襄阳市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4207	鄂州市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4208	荆门市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4209	孝感市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4210	荆州市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4211	黄冈市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4212	咸宁市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4213	随州市	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4228	恩施土家族苗族自治州	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4290	省直辖县级行政区划	42	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4301	长沙市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4302	株洲市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4303	湘潭市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4304	衡阳市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4305	邵阳市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4306	岳阳市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4307	常德市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4308	张家界市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4309	益阳市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4310	郴州市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4311	永州市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4312	怀化市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4313	娄底市	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4331	湘西土家族苗族自治州	43	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4401	广州市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4402	韶关市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4403	深圳市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4404	珠海市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4405	汕头市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4406	佛山市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4407	江门市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4408	湛江市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4409	茂名市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4412	肇庆市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4413	惠州市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4414	梅州市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4415	汕尾市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4416	河源市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4417	阳江市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4418	清远市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4419	东莞市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4420	中山市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4451	潮州市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4452	揭阳市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4453	云浮市	44	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4501	南宁市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4502	柳州市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4503	桂林市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4504	梧州市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4505	北海市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4506	防城港市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4507	钦州市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4508	贵港市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4509	玉林市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4510	百色市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4511	贺州市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4512	河池市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4513	来宾市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4514	崇左市	45	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4601	海口市	46	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4602	三亚市	46	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4603	三沙市	46	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4604	儋州市	46	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	4690	省直辖县级行政区划	46	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5001	市辖区	50	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5002	县	50	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5101	成都市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5103	自贡市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5104	攀枝花市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5105	泸州市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5106	德阳市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5107	绵阳市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5108	广元市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5109	遂宁市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5110	内江市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5111	乐山市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5113	南充市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5114	眉山市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5115	宜宾市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5116	广安市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5117	达州市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5118	雅安市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5119	巴中市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5120	资阳市	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5132	阿坝藏族羌族自治州	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5133	甘孜藏族自治州	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5134	凉山彝族自治州	51	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5201	贵阳市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5202	六盘水市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5203	遵义市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5204	安顺市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5205	毕节市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5206	铜仁市	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5223	黔西南布依族苗族自治州	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5226	黔东南苗族侗族自治州	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5227	黔南布依族苗族自治州	52	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5301	昆明市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5303	曲靖市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5304	玉溪市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5305	保山市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5306	昭通市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5307	丽江市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5308	普洱市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5309	临沧市	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5323	楚雄彝族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5325	红河哈尼族彝族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5326	文山壮族苗族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5328	西双版纳傣族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5329	大理白族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5331	德宏傣族景颇族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5333	怒江傈僳族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5334	迪庆藏族自治州	53	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5401	拉萨市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5402	日喀则市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5403	昌都市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5404	林芝市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5405	山南市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5406	那曲市	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	5425	阿里地区	54	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6101	西安市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6102	铜川市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6103	宝鸡市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6104	咸阳市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6105	渭南市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6106	延安市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6107	汉中市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6108	榆林市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6109	安康市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6110	商洛市	61	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6201	兰州市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6202	嘉峪关市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6203	金昌市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6204	白银市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6205	天水市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6206	武威市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6207	张掖市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6208	平凉市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6209	酒泉市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6210	庆阳市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6211	定西市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6212	陇南市	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6229	临夏回族自治州	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6230	甘南藏族自治州	62	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6301	西宁市	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6302	海东市	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6322	海北藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6323	黄南藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6325	海南藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6326	果洛藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6327	玉树藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6328	海西蒙古族藏族自治州	63	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6401	银川市	64	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6402	石嘴山市	64	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6403	吴忠市	64	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6404	固原市	64	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6405	中卫市	64	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6501	乌鲁木齐市	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6502	克拉玛依市	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6504	吐鲁番市	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6505	哈密市	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6523	昌吉回族自治州	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6527	博尔塔拉蒙古自治州	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6528	巴音郭楞蒙古自治州	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6529	阿克苏地区	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6530	克孜勒苏柯尔克孜自治州	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6531	喀什地区	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6532	和田地区	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6540	伊犁哈萨克自治州	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6542	塔城地区	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6543	阿勒泰地区	65	2
2023-05-31 09:37:01.023+05:30	2023-05-31 09:37:01.023+05:30	6590	自治区直辖县级行政区划	65	2
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110101	东城区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110102	西城区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110105	朝阳区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110106	丰台区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110107	石景山区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110108	海淀区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110109	门头沟区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110111	房山区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110112	通州区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110113	顺义区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110114	昌平区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110115	大兴区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110116	怀柔区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110117	平谷区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110118	密云区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	110119	延庆区	1101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120101	和平区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120102	河东区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120103	河西区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120104	南开区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120105	河北区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120106	红桥区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120110	东丽区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120111	西青区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120112	津南区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120113	北辰区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120114	武清区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120115	宝坻区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120116	滨海新区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120117	宁河区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120118	静海区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	120119	蓟州区	1201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130102	长安区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130104	桥西区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130105	新华区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130107	井陉矿区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130108	裕华区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130109	藁城区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130110	鹿泉区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130111	栾城区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130121	井陉县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130123	正定县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130125	行唐县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130126	灵寿县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130127	高邑县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130128	深泽县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130129	赞皇县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130130	无极县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130131	平山县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130132	元氏县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130133	赵县	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130171	石家庄高新技术产业开发区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130172	石家庄循环化工园区	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130181	辛集市	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130183	晋州市	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130184	新乐市	1301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130202	路南区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130203	路北区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130204	古冶区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130205	开平区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130207	丰南区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130208	丰润区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130209	曹妃甸区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130224	滦南县	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130225	乐亭县	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130227	迁西县	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130229	玉田县	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130271	河北唐山芦台经济开发区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130272	唐山市汉沽管理区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130273	唐山高新技术产业开发区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130274	河北唐山海港经济开发区	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130281	遵化市	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130283	迁安市	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130284	滦州市	1302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130302	海港区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130303	山海关区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130304	北戴河区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130306	抚宁区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130321	青龙满族自治县	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130322	昌黎县	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140826	绛县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130324	卢龙县	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130371	秦皇岛市经济技术开发区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130372	北戴河新区	1303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130402	邯山区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130403	丛台区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130404	复兴区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130406	峰峰矿区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130407	肥乡区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130408	永年区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130423	临漳县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130424	成安县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130425	大名县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130426	涉县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130427	磁县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130430	邱县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130431	鸡泽县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130432	广平县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130433	馆陶县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130434	魏县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130435	曲周县	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130471	邯郸经济技术开发区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130473	邯郸冀南新区	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130481	武安市	1304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130502	襄都区	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130503	信都区	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130505	任泽区	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130506	南和区	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130522	临城县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130523	内丘县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130524	柏乡县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130525	隆尧县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130528	宁晋县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130529	巨鹿县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130530	新河县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130531	广宗县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130532	平乡县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130533	威县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130534	清河县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130535	临西县	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130571	河北邢台经济开发区	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130581	南宫市	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130582	沙河市	1305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130602	竞秀区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130606	莲池区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130607	满城区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130608	清苑区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130609	徐水区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130623	涞水县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130624	阜平县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130626	定兴县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130627	唐县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130628	高阳县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130629	容城县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130630	涞源县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130631	望都县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130632	安新县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130633	易县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130634	曲阳县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130635	蠡县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130636	顺平县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130637	博野县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130638	雄县	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130671	保定高新技术产业开发区	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130672	保定白沟新城	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130681	涿州市	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130682	定州市	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130683	安国市	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130684	高碑店市	1306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130702	桥东区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130703	桥西区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130705	宣化区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130706	下花园区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130708	万全区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130709	崇礼区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130722	张北县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130723	康保县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130724	沽源县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130725	尚义县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130726	蔚县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130727	阳原县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130728	怀安县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130730	怀来县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130731	涿鹿县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130732	赤城县	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130771	张家口经济开发区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130772	张家口市察北管理区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130773	张家口市塞北管理区	1307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130802	双桥区	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130803	双滦区	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130804	鹰手营子矿区	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130821	承德县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130822	兴隆县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130824	滦平县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130825	隆化县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130826	丰宁满族自治县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130827	宽城满族自治县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130828	围场满族蒙古族自治县	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130871	承德高新技术产业开发区	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130881	平泉市	1308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130902	新华区	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130903	运河区	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130921	沧县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130922	青县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130923	东光县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130924	海兴县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130925	盐山县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130926	肃宁县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130927	南皮县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130928	吴桥县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130929	献县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130930	孟村回族自治县	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130971	河北沧州经济开发区	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130972	沧州高新技术产业开发区	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130973	沧州渤海新区	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130981	泊头市	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130982	任丘市	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130983	黄骅市	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	130984	河间市	1309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131002	安次区	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131003	广阳区	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131022	固安县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131023	永清县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131024	香河县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131025	大城县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131026	文安县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131028	大厂回族自治县	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131071	廊坊经济技术开发区	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131081	霸州市	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131082	三河市	1310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131102	桃城区	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131103	冀州区	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131121	枣强县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131122	武邑县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131123	武强县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131124	饶阳县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131125	安平县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131126	故城县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131127	景县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131128	阜城县	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131171	河北衡水高新技术产业开发区	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131172	衡水滨湖新区	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	131182	深州市	1311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140105	小店区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140106	迎泽区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140107	杏花岭区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140108	尖草坪区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140109	万柏林区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140110	晋源区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140121	清徐县	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140122	阳曲县	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140123	娄烦县	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140171	山西转型综合改革示范区	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140181	古交市	1401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140212	新荣区	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140213	平城区	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140214	云冈区	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140215	云州区	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140221	阳高县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140222	天镇县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140223	广灵县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140224	灵丘县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140225	浑源县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140226	左云县	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140271	山西大同经济开发区	1402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140302	城区	1403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140303	矿区	1403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140311	郊区	1403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140321	平定县	1403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140322	盂县	1403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140403	潞州区	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140404	上党区	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140405	屯留区	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140406	潞城区	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140423	襄垣县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140425	平顺县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140426	黎城县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140427	壶关县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140428	长子县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140429	武乡县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140430	沁县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140431	沁源县	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140471	山西长治高新技术产业园区	1404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140502	城区	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140521	沁水县	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140522	阳城县	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140524	陵川县	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140525	泽州县	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140581	高平市	1405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140602	朔城区	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140603	平鲁区	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140621	山阴县	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140622	应县	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140623	右玉县	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140671	山西朔州经济开发区	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140681	怀仁市	1406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140702	榆次区	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140703	太谷区	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140721	榆社县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140722	左权县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140723	和顺县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140724	昔阳县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140725	寿阳县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140727	祁县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140728	平遥县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140729	灵石县	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140781	介休市	1407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140802	盐湖区	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140821	临猗县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140822	万荣县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140823	闻喜县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140824	稷山县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140825	新绛县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140827	垣曲县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140828	夏县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140829	平陆县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140830	芮城县	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140881	永济市	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140882	河津市	1408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140902	忻府区	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140921	定襄县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140922	五台县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140923	代县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140924	繁峙县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140925	宁武县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140926	静乐县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140927	神池县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140928	五寨县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140929	岢岚县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140930	河曲县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140931	保德县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140932	偏关县	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140971	五台山风景名胜区	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	140981	原平市	1409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141002	尧都区	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141021	曲沃县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141022	翼城县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141023	襄汾县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141024	洪洞县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141025	古县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141026	安泽县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141027	浮山县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141028	吉县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141029	乡宁县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141030	大宁县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141031	隰县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141032	永和县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141033	蒲县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141034	汾西县	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141081	侯马市	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141082	霍州市	1410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141102	离石区	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141121	文水县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141122	交城县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141123	兴县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141124	临县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141125	柳林县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141126	石楼县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141127	岚县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141128	方山县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141129	中阳县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141130	交口县	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141181	孝义市	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	141182	汾阳市	1411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150102	新城区	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150103	回民区	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150104	玉泉区	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150105	赛罕区	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150121	土默特左旗	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150122	托克托县	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150123	和林格尔县	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150124	清水河县	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150125	武川县	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150172	呼和浩特经济技术开发区	1501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150202	东河区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150203	昆都仑区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150204	青山区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150205	石拐区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150206	白云鄂博矿区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150207	九原区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150221	土默特右旗	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150222	固阳县	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150223	达尔罕茂明安联合旗	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150271	包头稀土高新技术产业开发区	1502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150302	海勃湾区	1503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150303	海南区	1503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150304	乌达区	1503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150402	红山区	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150403	元宝山区	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150404	松山区	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150421	阿鲁科尔沁旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150422	巴林左旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150423	巴林右旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150424	林西县	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150425	克什克腾旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150426	翁牛特旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150428	喀喇沁旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150429	宁城县	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150430	敖汉旗	1504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150502	科尔沁区	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150521	科尔沁左翼中旗	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150522	科尔沁左翼后旗	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150523	开鲁县	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150524	库伦旗	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150525	奈曼旗	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150526	扎鲁特旗	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150571	通辽经济技术开发区	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150581	霍林郭勒市	1505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150602	东胜区	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150603	康巴什区	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150621	达拉特旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150622	准格尔旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150623	鄂托克前旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150624	鄂托克旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150625	杭锦旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150626	乌审旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150627	伊金霍洛旗	1506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150702	海拉尔区	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150703	扎赉诺尔区	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150721	阿荣旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150722	莫力达瓦达斡尔族自治旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150723	鄂伦春自治旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150724	鄂温克族自治旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150725	陈巴尔虎旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150726	新巴尔虎左旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150727	新巴尔虎右旗	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150781	满洲里市	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150782	牙克石市	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150783	扎兰屯市	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150784	额尔古纳市	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150785	根河市	1507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150802	临河区	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150821	五原县	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150822	磴口县	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150823	乌拉特前旗	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150824	乌拉特中旗	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150825	乌拉特后旗	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150826	杭锦后旗	1508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150902	集宁区	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150921	卓资县	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150922	化德县	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150923	商都县	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150924	兴和县	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150925	凉城县	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150926	察哈尔右翼前旗	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150927	察哈尔右翼中旗	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150928	察哈尔右翼后旗	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150929	四子王旗	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	150981	丰镇市	1509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152201	乌兰浩特市	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152202	阿尔山市	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152221	科尔沁右翼前旗	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152222	科尔沁右翼中旗	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152223	扎赉特旗	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152224	突泉县	1522	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152501	二连浩特市	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152502	锡林浩特市	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152522	阿巴嘎旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152523	苏尼特左旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152524	苏尼特右旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152525	东乌珠穆沁旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152526	西乌珠穆沁旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152527	太仆寺旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152528	镶黄旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152529	正镶白旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152530	正蓝旗	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152531	多伦县	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152571	乌拉盖管委会	1525	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152921	阿拉善左旗	1529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152922	阿拉善右旗	1529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152923	额济纳旗	1529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	152971	内蒙古阿拉善高新技术产业开发区	1529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210102	和平区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210103	沈河区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210104	大东区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210105	皇姑区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210106	铁西区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210111	苏家屯区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210112	浑南区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210113	沈北新区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210114	于洪区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210115	辽中区	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210123	康平县	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210124	法库县	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210181	新民市	2101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210202	中山区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210203	西岗区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210204	沙河口区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210211	甘井子区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210212	旅顺口区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210213	金州区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210214	普兰店区	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210224	长海县	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210281	瓦房店市	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210283	庄河市	2102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210302	铁东区	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210303	铁西区	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210304	立山区	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210311	千山区	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210321	台安县	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210323	岫岩满族自治县	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210381	海城市	2103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210402	新抚区	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210403	东洲区	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210404	望花区	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210411	顺城区	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210421	抚顺县	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210422	新宾满族自治县	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210423	清原满族自治县	2104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210502	平山区	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210503	溪湖区	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210504	明山区	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210505	南芬区	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210521	本溪满族自治县	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210522	桓仁满族自治县	2105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210602	元宝区	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210603	振兴区	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210604	振安区	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210624	宽甸满族自治县	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210681	东港市	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210682	凤城市	2106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210702	古塔区	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210703	凌河区	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210711	太和区	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210726	黑山县	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210727	义县	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210781	凌海市	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210782	北镇市	2107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210802	站前区	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210803	西市区	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210804	鲅鱼圈区	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210811	老边区	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210881	盖州市	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210882	大石桥市	2108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210902	海州区	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210903	新邱区	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210904	太平区	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210905	清河门区	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210911	细河区	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210921	阜新蒙古族自治县	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	210922	彰武县	2109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211002	白塔区	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211003	文圣区	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211004	宏伟区	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211005	弓长岭区	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211011	太子河区	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211021	辽阳县	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211081	灯塔市	2110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211102	双台子区	2111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211103	兴隆台区	2111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211104	大洼区	2111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211122	盘山县	2111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211202	银州区	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211204	清河区	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211221	铁岭县	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211223	西丰县	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211224	昌图县	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211281	调兵山市	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211282	开原市	2112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211302	双塔区	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211303	龙城区	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211321	朝阳县	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211322	建平县	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211324	喀喇沁左翼蒙古族自治县	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211381	北票市	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211382	凌源市	2113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211402	连山区	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211403	龙港区	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211404	南票区	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211421	绥中县	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211422	建昌县	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	211481	兴城市	2114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220102	南关区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220103	宽城区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220104	朝阳区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220105	二道区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220106	绿园区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220112	双阳区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220113	九台区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220122	农安县	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220171	长春经济技术开发区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220172	长春净月高新技术产业开发区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220173	长春高新技术产业开发区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220174	长春汽车经济技术开发区	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220182	榆树市	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220183	德惠市	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220184	公主岭市	2201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220202	昌邑区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220203	龙潭区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220204	船营区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220211	丰满区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220221	永吉县	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220271	吉林经济开发区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220272	吉林高新技术产业开发区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220273	吉林中国新加坡食品区	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220281	蛟河市	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220282	桦甸市	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220283	舒兰市	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220284	磐石市	2202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220302	铁西区	2203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220303	铁东区	2203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220322	梨树县	2203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220323	伊通满族自治县	2203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220382	双辽市	2203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220402	龙山区	2204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220403	西安区	2204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220421	东丰县	2204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220422	东辽县	2204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220502	东昌区	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220503	二道江区	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220521	通化县	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220523	辉南县	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220524	柳河县	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220581	梅河口市	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220582	集安市	2205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220602	浑江区	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220605	江源区	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220621	抚松县	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220622	靖宇县	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220623	长白朝鲜族自治县	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220681	临江市	2206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220702	宁江区	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220721	前郭尔罗斯蒙古族自治县	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220722	长岭县	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220723	乾安县	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220771	吉林松原经济开发区	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220781	扶余市	2207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220802	洮北区	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220821	镇赉县	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220822	通榆县	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220871	吉林白城经济开发区	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220881	洮南市	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	220882	大安市	2208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222401	延吉市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222402	图们市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222403	敦化市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222404	珲春市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222405	龙井市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222406	和龙市	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222424	汪清县	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	222426	安图县	2224	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230102	道里区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230103	南岗区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230104	道外区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230108	平房区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230109	松北区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230110	香坊区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230111	呼兰区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230112	阿城区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230113	双城区	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230123	依兰县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230124	方正县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230125	宾县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230126	巴彦县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230127	木兰县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230128	通河县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230129	延寿县	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230183	尚志市	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230184	五常市	2301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230202	龙沙区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230203	建华区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230204	铁锋区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230205	昂昂溪区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230206	富拉尔基区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230207	碾子山区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230208	梅里斯达斡尔族区	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230221	龙江县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230223	依安县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230224	泰来县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230225	甘南县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230227	富裕县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230229	克山县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230230	克东县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230231	拜泉县	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230281	讷河市	2302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230302	鸡冠区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230303	恒山区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230304	滴道区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230305	梨树区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230306	城子河区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230307	麻山区	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230321	鸡东县	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230381	虎林市	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230382	密山市	2303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230402	向阳区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230403	工农区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230404	南山区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230405	兴安区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230406	东山区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230407	兴山区	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230421	萝北县	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230422	绥滨县	2304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230502	尖山区	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230503	岭东区	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230505	四方台区	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230506	宝山区	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230521	集贤县	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230522	友谊县	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230523	宝清县	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230524	饶河县	2305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230602	萨尔图区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230603	龙凤区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230604	让胡路区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230605	红岗区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230606	大同区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230621	肇州县	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230622	肇源县	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230623	林甸县	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230624	杜尔伯特蒙古族自治县	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230671	大庆高新技术产业开发区	2306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230717	伊美区	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230718	乌翠区	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230719	友好区	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230722	嘉荫县	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230723	汤旺县	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230724	丰林县	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230725	大箐山县	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230726	南岔县	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230751	金林区	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230781	铁力市	2307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230803	向阳区	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230804	前进区	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230805	东风区	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230811	郊区	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230822	桦南县	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230826	桦川县	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230828	汤原县	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230881	同江市	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230882	富锦市	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230883	抚远市	2308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230902	新兴区	2309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230903	桃山区	2309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230904	茄子河区	2309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	230921	勃利县	2309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231002	东安区	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231003	阳明区	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231004	爱民区	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231005	西安区	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231025	林口县	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231071	牡丹江经济技术开发区	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231081	绥芬河市	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231083	海林市	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231084	宁安市	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231085	穆棱市	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231086	东宁市	2310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231102	爱辉区	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231123	逊克县	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231124	孙吴县	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231181	北安市	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231182	五大连池市	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231183	嫩江市	2311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231202	北林区	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231221	望奎县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231222	兰西县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231223	青冈县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231224	庆安县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231225	明水县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231226	绥棱县	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231281	安达市	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231282	肇东市	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	231283	海伦市	2312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232701	漠河市	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232721	呼玛县	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232722	塔河县	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232761	加格达奇区	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232762	松岭区	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232763	新林区	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	232764	呼中区	2327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310101	黄浦区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310104	徐汇区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310105	长宁区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310106	静安区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310107	普陀区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310109	虹口区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310110	杨浦区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310112	闵行区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310113	宝山区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310114	嘉定区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310115	浦东新区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310116	金山区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310117	松江区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310118	青浦区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310120	奉贤区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	310151	崇明区	3101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320102	玄武区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320104	秦淮区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320105	建邺区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320106	鼓楼区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320111	浦口区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320113	栖霞区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320114	雨花台区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320115	江宁区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320116	六合区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320117	溧水区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320118	高淳区	3201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320205	锡山区	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320206	惠山区	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320211	滨湖区	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320213	梁溪区	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320214	新吴区	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320281	江阴市	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320282	宜兴市	3202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320302	鼓楼区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320303	云龙区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320305	贾汪区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320311	泉山区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320312	铜山区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320321	丰县	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320322	沛县	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320324	睢宁县	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320371	徐州经济技术开发区	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320381	新沂市	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320382	邳州市	3203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320402	天宁区	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320404	钟楼区	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320411	新北区	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320412	武进区	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320413	金坛区	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320481	溧阳市	3204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320505	虎丘区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320506	吴中区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320507	相城区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320508	姑苏区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320509	吴江区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320571	苏州工业园区	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320581	常熟市	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320582	张家港市	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320583	昆山市	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320585	太仓市	3205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320612	通州区	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320613	崇川区	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320614	海门区	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320623	如东县	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320671	南通经济技术开发区	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320681	启东市	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320682	如皋市	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320685	海安市	3206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320703	连云区	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320706	海州区	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320707	赣榆区	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320722	东海县	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320723	灌云县	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320724	灌南县	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320771	连云港经济技术开发区	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320772	连云港高新技术产业开发区	3207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320803	淮安区	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320804	淮阴区	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320812	清江浦区	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320813	洪泽区	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320826	涟水县	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320830	盱眙县	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320831	金湖县	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320871	淮安经济技术开发区	3208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320902	亭湖区	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320903	盐都区	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320904	大丰区	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320921	响水县	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320922	滨海县	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320923	阜宁县	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320924	射阳县	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320925	建湖县	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320971	盐城经济技术开发区	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	320981	东台市	3209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321002	广陵区	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321003	邗江区	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321012	江都区	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321023	宝应县	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321071	扬州经济技术开发区	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321081	仪征市	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321084	高邮市	3210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321102	京口区	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321111	润州区	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321112	丹徒区	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321171	镇江新区	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321181	丹阳市	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321182	扬中市	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321183	句容市	3211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321202	海陵区	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321203	高港区	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321204	姜堰区	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321271	泰州医药高新技术产业开发区	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321281	兴化市	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321282	靖江市	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321283	泰兴市	3212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321302	宿城区	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321311	宿豫区	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321322	沭阳县	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321323	泗阳县	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321324	泗洪县	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	321371	宿迁经济技术开发区	3213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330102	上城区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330105	拱墅区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330106	西湖区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330108	滨江区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330109	萧山区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330110	余杭区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330111	富阳区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330112	临安区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330113	临平区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330114	钱塘区	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330122	桐庐县	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330127	淳安县	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330182	建德市	3301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330203	海曙区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330205	江北区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330206	北仑区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330211	镇海区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330212	鄞州区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330213	奉化区	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330225	象山县	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330226	宁海县	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330281	余姚市	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330282	慈溪市	3302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330302	鹿城区	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330303	龙湾区	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330304	瓯海区	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330305	洞头区	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330324	永嘉县	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330326	平阳县	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330327	苍南县	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330328	文成县	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330329	泰顺县	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330381	瑞安市	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330382	乐清市	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330383	龙港市	3303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330402	南湖区	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330411	秀洲区	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330421	嘉善县	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330424	海盐县	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330481	海宁市	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330482	平湖市	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330483	桐乡市	3304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330502	吴兴区	3305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330503	南浔区	3305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330521	德清县	3305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330522	长兴县	3305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330523	安吉县	3305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330602	越城区	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330603	柯桥区	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330604	上虞区	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330624	新昌县	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330681	诸暨市	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330683	嵊州市	3306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330702	婺城区	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330703	金东区	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330723	武义县	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330726	浦江县	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330727	磐安县	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330781	兰溪市	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330782	义乌市	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330783	东阳市	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330784	永康市	3307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330802	柯城区	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330803	衢江区	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330822	常山县	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330824	开化县	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330825	龙游县	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330881	江山市	3308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330902	定海区	3309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330903	普陀区	3309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330921	岱山县	3309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	330922	嵊泗县	3309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331002	椒江区	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331003	黄岩区	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331004	路桥区	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331022	三门县	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331023	天台县	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331024	仙居县	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331081	温岭市	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331082	临海市	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331083	玉环市	3310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331102	莲都区	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331121	青田县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331122	缙云县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331123	遂昌县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331124	松阳县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331125	云和县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331126	庆元县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331127	景宁畲族自治县	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	331181	龙泉市	3311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340102	瑶海区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340103	庐阳区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340104	蜀山区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340111	包河区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340121	长丰县	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340122	肥东县	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340123	肥西县	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340124	庐江县	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340171	合肥高新技术产业开发区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340172	合肥经济技术开发区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340173	合肥新站高新技术产业开发区	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340181	巢湖市	3401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340202	镜湖区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340207	鸠江区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340209	弋江区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340210	湾沚区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340212	繁昌区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340223	南陵县	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340271	芜湖经济技术开发区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340272	安徽芜湖三山经济开发区	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340281	无为市	3402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340302	龙子湖区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340303	蚌山区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340304	禹会区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340311	淮上区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340321	怀远县	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340322	五河县	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340323	固镇县	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340371	蚌埠市高新技术开发区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340372	蚌埠市经济开发区	3403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340402	大通区	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340403	田家庵区	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340404	谢家集区	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340405	八公山区	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340406	潘集区	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340421	凤台县	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340422	寿县	3404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340503	花山区	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340504	雨山区	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340506	博望区	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340521	当涂县	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340522	含山县	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340523	和县	3405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340602	杜集区	3406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340603	相山区	3406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340604	烈山区	3406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340621	濉溪县	3406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340705	铜官区	3407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340706	义安区	3407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340711	郊区	3407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340722	枞阳县	3407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340802	迎江区	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340803	大观区	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340811	宜秀区	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340822	怀宁县	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340825	太湖县	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340826	宿松县	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340827	望江县	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340828	岳西县	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340871	安徽安庆经济开发区	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340881	桐城市	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	340882	潜山市	3408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341002	屯溪区	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341003	黄山区	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341004	徽州区	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341021	歙县	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341022	休宁县	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341023	黟县	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341024	祁门县	3410	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341102	琅琊区	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341103	南谯区	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341122	来安县	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341124	全椒县	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341125	定远县	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341126	凤阳县	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341171	中新苏滁高新技术产业开发区	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341172	滁州经济技术开发区	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341181	天长市	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341182	明光市	3411	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341202	颍州区	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341203	颍东区	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341204	颍泉区	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341221	临泉县	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341222	太和县	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341225	阜南县	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341226	颍上县	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341271	阜阳合肥现代产业园区	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341272	阜阳经济技术开发区	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341282	界首市	3412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341302	埇桥区	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341321	砀山县	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341322	萧县	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341323	灵璧县	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341324	泗县	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341371	宿州马鞍山现代产业园区	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341372	宿州经济技术开发区	3413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341502	金安区	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341503	裕安区	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341504	叶集区	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341522	霍邱县	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341523	舒城县	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341524	金寨县	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341525	霍山县	3415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341602	谯城区	3416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341621	涡阳县	3416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341622	蒙城县	3416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341623	利辛县	3416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341702	贵池区	3417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341721	东至县	3417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341722	石台县	3417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341723	青阳县	3417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341802	宣州区	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341821	郎溪县	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341823	泾县	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341824	绩溪县	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341825	旌德县	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341871	宣城市经济开发区	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341881	宁国市	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	341882	广德市	3418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350102	鼓楼区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350103	台江区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350104	仓山区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350105	马尾区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350111	晋安区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350112	长乐区	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350121	闽侯县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350122	连江县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350123	罗源县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350124	闽清县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350125	永泰县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350128	平潭县	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350181	福清市	3501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350203	思明区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350205	海沧区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350206	湖里区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350211	集美区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350212	同安区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350213	翔安区	3502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350302	城厢区	3503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350303	涵江区	3503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350304	荔城区	3503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350305	秀屿区	3503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350322	仙游县	3503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350404	三元区	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350405	沙县区	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350421	明溪县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350423	清流县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350424	宁化县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350425	大田县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350426	尤溪县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350428	将乐县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350429	泰宁县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350430	建宁县	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350481	永安市	3504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350502	鲤城区	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350503	丰泽区	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350504	洛江区	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350505	泉港区	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350521	惠安县	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350524	安溪县	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350525	永春县	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350526	德化县	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350527	金门县	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350581	石狮市	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350582	晋江市	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350583	南安市	3505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350602	芗城区	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350603	龙文区	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350604	龙海区	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350605	长泰区	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350622	云霄县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350623	漳浦县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350624	诏安县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350626	东山县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350627	南靖县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350628	平和县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350629	华安县	3506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350702	延平区	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350703	建阳区	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350721	顺昌县	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350722	浦城县	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350723	光泽县	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350724	松溪县	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350725	政和县	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350781	邵武市	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350782	武夷山市	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350783	建瓯市	3507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350802	新罗区	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350803	永定区	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350821	长汀县	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350823	上杭县	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350824	武平县	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350825	连城县	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350881	漳平市	3508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350902	蕉城区	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350921	霞浦县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350922	古田县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350923	屏南县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350924	寿宁县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350925	周宁县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350926	柘荣县	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350981	福安市	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	350982	福鼎市	3509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360102	东湖区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360103	西湖区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360104	青云谱区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360111	青山湖区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360112	新建区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360113	红谷滩区	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360121	南昌县	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360123	安义县	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360124	进贤县	3601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360202	昌江区	3602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360203	珠山区	3602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360222	浮梁县	3602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360281	乐平市	3602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360302	安源区	3603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360313	湘东区	3603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360321	莲花县	3603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360322	上栗县	3603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360323	芦溪县	3603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360402	濂溪区	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360403	浔阳区	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360404	柴桑区	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360423	武宁县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360424	修水县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360425	永修县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360426	德安县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360428	都昌县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360429	湖口县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360430	彭泽县	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360481	瑞昌市	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360482	共青城市	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360483	庐山市	3604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360502	渝水区	3605	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360521	分宜县	3605	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360602	月湖区	3606	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360603	余江区	3606	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360681	贵溪市	3606	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360702	章贡区	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360703	南康区	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360704	赣县区	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360722	信丰县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360723	大余县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360724	上犹县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360725	崇义县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360726	安远县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360728	定南县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360729	全南县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360730	宁都县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360731	于都县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360732	兴国县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360733	会昌县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360734	寻乌县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360735	石城县	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360781	瑞金市	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360783	龙南市	3607	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360802	吉州区	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360803	青原区	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360821	吉安县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360822	吉水县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360823	峡江县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360824	新干县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360825	永丰县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360826	泰和县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360827	遂川县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360828	万安县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360829	安福县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360830	永新县	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360881	井冈山市	3608	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360902	袁州区	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360921	奉新县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360922	万载县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360923	上高县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360924	宜丰县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360925	靖安县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360926	铜鼓县	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360981	丰城市	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360982	樟树市	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	360983	高安市	3609	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361002	临川区	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361003	东乡区	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361021	南城县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361022	黎川县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361023	南丰县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361024	崇仁县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361025	乐安县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361026	宜黄县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361027	金溪县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361028	资溪县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361030	广昌县	3610	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361102	信州区	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361103	广丰区	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361104	广信区	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361123	玉山县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361124	铅山县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361125	横峰县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361126	弋阳县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361127	余干县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361128	鄱阳县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361129	万年县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361130	婺源县	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	361181	德兴市	3611	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370102	历下区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370103	市中区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370104	槐荫区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370105	天桥区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370112	历城区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370113	长清区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370114	章丘区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370115	济阳区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370116	莱芜区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370117	钢城区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370124	平阴县	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370126	商河县	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370171	济南高新技术产业开发区	3701	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370202	市南区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370203	市北区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370211	黄岛区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370212	崂山区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370213	李沧区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370214	城阳区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370215	即墨区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370271	青岛高新技术产业开发区	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370281	胶州市	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370283	平度市	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370285	莱西市	3702	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370302	淄川区	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370303	张店区	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370304	博山区	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370305	临淄区	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370306	周村区	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370321	桓台县	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370322	高青县	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370323	沂源县	3703	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370402	市中区	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370403	薛城区	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370404	峄城区	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370405	台儿庄区	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370406	山亭区	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370481	滕州市	3704	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370502	东营区	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370503	河口区	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370505	垦利区	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370522	利津县	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370523	广饶县	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370571	东营经济技术开发区	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370572	东营港经济开发区	3705	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370602	芝罘区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370611	福山区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370612	牟平区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370613	莱山区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370614	蓬莱区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370671	烟台高新技术产业开发区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370672	烟台经济技术开发区	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370681	龙口市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370682	莱阳市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370683	莱州市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370685	招远市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370686	栖霞市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370687	海阳市	3706	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370702	潍城区	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370703	寒亭区	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370704	坊子区	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370705	奎文区	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370724	临朐县	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370725	昌乐县	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370772	潍坊滨海经济技术开发区	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370781	青州市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370782	诸城市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370783	寿光市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370784	安丘市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370785	高密市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370786	昌邑市	3707	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370811	任城区	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370812	兖州区	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370826	微山县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370827	鱼台县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370828	金乡县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370829	嘉祥县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370830	汶上县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370831	泗水县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370832	梁山县	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370871	济宁高新技术产业开发区	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370881	曲阜市	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370883	邹城市	3708	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370902	泰山区	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370911	岱岳区	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370921	宁阳县	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370923	东平县	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370982	新泰市	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	370983	肥城市	3709	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371002	环翠区	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371003	文登区	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371071	威海火炬高技术产业开发区	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371072	威海经济技术开发区	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371073	威海临港经济技术开发区	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371082	荣成市	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371083	乳山市	3710	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371102	东港区	3711	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371103	岚山区	3711	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371121	五莲县	3711	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371122	莒县	3711	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371171	日照经济技术开发区	3711	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371302	兰山区	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371311	罗庄区	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371312	河东区	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371321	沂南县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371322	郯城县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371323	沂水县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371324	兰陵县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371325	费县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371326	平邑县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371327	莒南县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371328	蒙阴县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371329	临沭县	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371371	临沂高新技术产业开发区	3713	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371402	德城区	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371403	陵城区	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371422	宁津县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371423	庆云县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371424	临邑县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371425	齐河县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371426	平原县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371427	夏津县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371428	武城县	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371471	德州天衢新区	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371481	乐陵市	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371482	禹城市	3714	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371502	东昌府区	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371503	茌平区	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371521	阳谷县	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371522	莘县	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371524	东阿县	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371525	冠县	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371526	高唐县	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371581	临清市	3715	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371602	滨城区	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371603	沾化区	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371621	惠民县	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371622	阳信县	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371623	无棣县	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371625	博兴县	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371681	邹平市	3716	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371702	牡丹区	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371703	定陶区	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371721	曹县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371722	单县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371723	成武县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371724	巨野县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371725	郓城县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371726	鄄城县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371728	东明县	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371771	菏泽经济技术开发区	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	371772	菏泽高新技术开发区	3717	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410102	中原区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410103	二七区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410104	管城回族区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410105	金水区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410106	上街区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410108	惠济区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410122	中牟县	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410171	郑州经济技术开发区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410172	郑州高新技术产业开发区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410173	郑州航空港经济综合实验区	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410181	巩义市	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410182	荥阳市	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410183	新密市	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410184	新郑市	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410185	登封市	4101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410202	龙亭区	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410203	顺河回族区	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410204	鼓楼区	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410205	禹王台区	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410212	祥符区	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410221	杞县	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410222	通许县	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410223	尉氏县	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410225	兰考县	4102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410302	老城区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410303	西工区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410304	瀍河回族区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410305	涧西区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410307	偃师区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410308	孟津区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410311	洛龙区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410323	新安县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410324	栾川县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410325	嵩县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410326	汝阳县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410327	宜阳县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410328	洛宁县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410329	伊川县	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410371	洛阳高新技术产业开发区	4103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410402	新华区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410403	卫东区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410404	石龙区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410411	湛河区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410421	宝丰县	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410422	叶县	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410423	鲁山县	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410425	郏县	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410471	平顶山高新技术产业开发区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410472	平顶山市城乡一体化示范区	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410481	舞钢市	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410482	汝州市	4104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410502	文峰区	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410503	北关区	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410505	殷都区	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410506	龙安区	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410522	安阳县	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410523	汤阴县	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410526	滑县	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410527	内黄县	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410571	安阳高新技术产业开发区	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410581	林州市	4105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410602	鹤山区	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410603	山城区	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410611	淇滨区	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410621	浚县	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410622	淇县	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410671	鹤壁经济技术开发区	4106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410702	红旗区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410703	卫滨区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410704	凤泉区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410711	牧野区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410721	新乡县	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410724	获嘉县	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410725	原阳县	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410726	延津县	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410727	封丘县	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410771	新乡高新技术产业开发区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410772	新乡经济技术开发区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410773	新乡市平原城乡一体化示范区	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410781	卫辉市	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410782	辉县市	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410783	长垣市	4107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410802	解放区	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410803	中站区	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410804	马村区	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410811	山阳区	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410821	修武县	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410822	博爱县	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410823	武陟县	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410825	温县	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410871	焦作城乡一体化示范区	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410882	沁阳市	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410883	孟州市	4108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410902	华龙区	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410922	清丰县	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410923	南乐县	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410926	范县	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410927	台前县	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410928	濮阳县	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410971	河南濮阳工业园区	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	410972	濮阳经济技术开发区	4109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411002	魏都区	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411003	建安区	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411024	鄢陵县	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411025	襄城县	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411071	许昌经济技术开发区	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411081	禹州市	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411082	长葛市	4110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411102	源汇区	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411103	郾城区	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411104	召陵区	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411121	舞阳县	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411122	临颍县	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411171	漯河经济技术开发区	4111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411202	湖滨区	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411203	陕州区	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411221	渑池县	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411224	卢氏县	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411271	河南三门峡经济开发区	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411281	义马市	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411282	灵宝市	4112	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411302	宛城区	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411303	卧龙区	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411321	南召县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411322	方城县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411323	西峡县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411324	镇平县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411325	内乡县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411326	淅川县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411327	社旗县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411328	唐河县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411329	新野县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411330	桐柏县	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411371	南阳高新技术产业开发区	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411372	南阳市城乡一体化示范区	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411381	邓州市	4113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411402	梁园区	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411403	睢阳区	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411421	民权县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411422	睢县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411423	宁陵县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411424	柘城县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411425	虞城县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411426	夏邑县	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411471	豫东综合物流产业聚集区	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411472	河南商丘经济开发区	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411481	永城市	4114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411502	浉河区	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411503	平桥区	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411521	罗山县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411522	光山县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411523	新县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411524	商城县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411525	固始县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411526	潢川县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411527	淮滨县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411528	息县	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411571	信阳高新技术产业开发区	4115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411602	川汇区	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411603	淮阳区	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411621	扶沟县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411622	西华县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411623	商水县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411624	沈丘县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411625	郸城县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411627	太康县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411628	鹿邑县	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411671	河南周口经济开发区	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411681	项城市	4116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411702	驿城区	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411721	西平县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411722	上蔡县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411723	平舆县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411724	正阳县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411725	确山县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411726	泌阳县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411727	汝南县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411728	遂平县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411729	新蔡县	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	411771	河南驻马店经济开发区	4117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	419001	济源市	4190	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420102	江岸区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420103	江汉区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420104	硚口区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420105	汉阳区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420106	武昌区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420107	青山区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420111	洪山区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420112	东西湖区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420113	汉南区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420114	蔡甸区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420115	江夏区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420116	黄陂区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420117	新洲区	4201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420202	黄石港区	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420203	西塞山区	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420204	下陆区	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420205	铁山区	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420222	阳新县	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420281	大冶市	4202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420302	茅箭区	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420303	张湾区	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420304	郧阳区	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420322	郧西县	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420323	竹山县	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420324	竹溪县	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420325	房县	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420381	丹江口市	4203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420502	西陵区	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420503	伍家岗区	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420504	点军区	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420505	猇亭区	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420506	夷陵区	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420525	远安县	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420526	兴山县	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420527	秭归县	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420528	长阳土家族自治县	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420529	五峰土家族自治县	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420581	宜都市	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420582	当阳市	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420583	枝江市	4205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420602	襄城区	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420606	樊城区	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420607	襄州区	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420624	南漳县	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420625	谷城县	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420626	保康县	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420682	老河口市	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420683	枣阳市	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420684	宜城市	4206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420702	梁子湖区	4207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420703	华容区	4207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420704	鄂城区	4207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420802	东宝区	4208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420804	掇刀区	4208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420822	沙洋县	4208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420881	钟祥市	4208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420882	京山市	4208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420902	孝南区	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420921	孝昌县	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420922	大悟县	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420923	云梦县	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420981	应城市	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420982	安陆市	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	420984	汉川市	4209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421002	沙市区	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421003	荆州区	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421022	公安县	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421024	江陵县	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421071	荆州经济技术开发区	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421081	石首市	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421083	洪湖市	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421087	松滋市	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421088	监利市	4210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421102	黄州区	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421121	团风县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421122	红安县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421123	罗田县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421124	英山县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421125	浠水县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421126	蕲春县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421127	黄梅县	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421171	龙感湖管理区	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421181	麻城市	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421182	武穴市	4211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421202	咸安区	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421221	嘉鱼县	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421222	通城县	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421223	崇阳县	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421224	通山县	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421281	赤壁市	4212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421303	曾都区	4213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421321	随县	4213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	421381	广水市	4213	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422801	恩施市	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422802	利川市	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422822	建始县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422823	巴东县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422825	宣恩县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422826	咸丰县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422827	来凤县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	422828	鹤峰县	4228	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	429004	仙桃市	4290	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	429005	潜江市	4290	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	429006	天门市	4290	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	429021	神农架林区	4290	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430102	芙蓉区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430103	天心区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430104	岳麓区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430105	开福区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430111	雨花区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430112	望城区	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430121	长沙县	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430181	浏阳市	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430182	宁乡市	4301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430202	荷塘区	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430203	芦淞区	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430204	石峰区	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430211	天元区	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430212	渌口区	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430223	攸县	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430224	茶陵县	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430225	炎陵县	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430281	醴陵市	4302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430302	雨湖区	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430304	岳塘区	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430321	湘潭县	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430371	湖南湘潭高新技术产业园区	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430372	湘潭昭山示范区	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430373	湘潭九华示范区	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430381	湘乡市	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430382	韶山市	4303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430405	珠晖区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430406	雁峰区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430407	石鼓区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430408	蒸湘区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430412	南岳区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430421	衡阳县	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430422	衡南县	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430423	衡山县	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430424	衡东县	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430426	祁东县	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430471	衡阳综合保税区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430472	湖南衡阳高新技术产业园区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430473	湖南衡阳松木经济开发区	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430481	耒阳市	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430482	常宁市	4304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430502	双清区	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430503	大祥区	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430511	北塔区	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430522	新邵县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430523	邵阳县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430524	隆回县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430525	洞口县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430527	绥宁县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430528	新宁县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430529	城步苗族自治县	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430581	武冈市	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430582	邵东市	4305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430602	岳阳楼区	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430603	云溪区	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430611	君山区	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430621	岳阳县	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430623	华容县	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430624	湘阴县	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430626	平江县	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430671	岳阳市屈原管理区	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430681	汨罗市	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430682	临湘市	4306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430702	武陵区	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430703	鼎城区	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430721	安乡县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430722	汉寿县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430723	澧县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430724	临澧县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430725	桃源县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430726	石门县	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430771	常德市西洞庭管理区	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430781	津市市	4307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430802	永定区	4308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430811	武陵源区	4308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430821	慈利县	4308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430822	桑植县	4308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430902	资阳区	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430903	赫山区	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430921	南县	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430922	桃江县	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430923	安化县	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430971	益阳市大通湖管理区	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430972	湖南益阳高新技术产业园区	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	430981	沅江市	4309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431002	北湖区	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431003	苏仙区	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431021	桂阳县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431022	宜章县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431023	永兴县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431024	嘉禾县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431025	临武县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431026	汝城县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431027	桂东县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431028	安仁县	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431081	资兴市	4310	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431102	零陵区	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431103	冷水滩区	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431122	东安县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431123	双牌县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431124	道县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431125	江永县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431126	宁远县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431127	蓝山县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431128	新田县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431129	江华瑶族自治县	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431171	永州经济技术开发区	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431173	永州市回龙圩管理区	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431181	祁阳市	4311	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431202	鹤城区	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431221	中方县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431222	沅陵县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431223	辰溪县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431224	溆浦县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431225	会同县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431226	麻阳苗族自治县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431227	新晃侗族自治县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431228	芷江侗族自治县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431229	靖州苗族侗族自治县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431230	通道侗族自治县	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431271	怀化市洪江管理区	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431281	洪江市	4312	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431302	娄星区	4313	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431321	双峰县	4313	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431322	新化县	4313	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431381	冷水江市	4313	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	431382	涟源市	4313	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433101	吉首市	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433122	泸溪县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433123	凤凰县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433124	花垣县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433125	保靖县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433126	古丈县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433127	永顺县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	433130	龙山县	4331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440103	荔湾区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440104	越秀区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440105	海珠区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440106	天河区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440111	白云区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440112	黄埔区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440113	番禺区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440114	花都区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440115	南沙区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440117	从化区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440118	增城区	4401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440203	武江区	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440204	浈江区	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440205	曲江区	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440222	始兴县	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440224	仁化县	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440229	翁源县	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440232	乳源瑶族自治县	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440233	新丰县	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440281	乐昌市	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440282	南雄市	4402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440303	罗湖区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440304	福田区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440305	南山区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440306	宝安区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440307	龙岗区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440308	盐田区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440309	龙华区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440310	坪山区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440311	光明区	4403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440402	香洲区	4404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440403	斗门区	4404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440404	金湾区	4404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440507	龙湖区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440511	金平区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440512	濠江区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440513	潮阳区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440514	潮南区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440515	澄海区	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440523	南澳县	4405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440604	禅城区	4406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440605	南海区	4406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440606	顺德区	4406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440607	三水区	4406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440608	高明区	4406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440703	蓬江区	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440704	江海区	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440705	新会区	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440781	台山市	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440783	开平市	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440784	鹤山市	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440785	恩平市	4407	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440802	赤坎区	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440803	霞山区	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440804	坡头区	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440811	麻章区	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440823	遂溪县	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440825	徐闻县	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440881	廉江市	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440882	雷州市	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440883	吴川市	4408	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440902	茂南区	4409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440904	电白区	4409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440981	高州市	4409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440982	化州市	4409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	440983	信宜市	4409	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441202	端州区	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441203	鼎湖区	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441204	高要区	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441223	广宁县	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441224	怀集县	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441225	封开县	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441226	德庆县	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441284	四会市	4412	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441302	惠城区	4413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441303	惠阳区	4413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441322	博罗县	4413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441323	惠东县	4413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441324	龙门县	4413	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441402	梅江区	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441403	梅县区	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441422	大埔县	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441423	丰顺县	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441424	五华县	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441426	平远县	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441427	蕉岭县	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441481	兴宁市	4414	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441502	城区	4415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441521	海丰县	4415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441523	陆河县	4415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441581	陆丰市	4415	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441602	源城区	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441621	紫金县	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441622	龙川县	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441623	连平县	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441624	和平县	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441625	东源县	4416	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441702	江城区	4417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441704	阳东区	4417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441721	阳西县	4417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441781	阳春市	4417	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441802	清城区	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441803	清新区	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441821	佛冈县	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441823	阳山县	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441825	连山壮族瑶族自治县	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441826	连南瑶族自治县	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441881	英德市	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441882	连州市	4418	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	441900	东莞市	4419	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	442000	中山市	4420	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445102	湘桥区	4451	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445103	潮安区	4451	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445122	饶平县	4451	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445202	榕城区	4452	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445203	揭东区	4452	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445222	揭西县	4452	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445224	惠来县	4452	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445281	普宁市	4452	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445302	云城区	4453	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445303	云安区	4453	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445321	新兴县	4453	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445322	郁南县	4453	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	445381	罗定市	4453	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450102	兴宁区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450103	青秀区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450105	江南区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450107	西乡塘区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450108	良庆区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450109	邕宁区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450110	武鸣区	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450123	隆安县	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450124	马山县	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450125	上林县	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450126	宾阳县	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450181	横州市	4501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450202	城中区	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450203	鱼峰区	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450204	柳南区	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450205	柳北区	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450206	柳江区	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450222	柳城县	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450223	鹿寨县	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450224	融安县	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450225	融水苗族自治县	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450226	三江侗族自治县	4502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450302	秀峰区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450303	叠彩区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450304	象山区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450305	七星区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450311	雁山区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450312	临桂区	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450321	阳朔县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450323	灵川县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450324	全州县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450325	兴安县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450326	永福县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450327	灌阳县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450328	龙胜各族自治县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450329	资源县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450330	平乐县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450332	恭城瑶族自治县	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450381	荔浦市	4503	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450403	万秀区	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450405	长洲区	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450406	龙圩区	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450421	苍梧县	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450422	藤县	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450423	蒙山县	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450481	岑溪市	4504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450502	海城区	4505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450503	银海区	4505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450512	铁山港区	4505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450521	合浦县	4505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450602	港口区	4506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450603	防城区	4506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450621	上思县	4506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450681	东兴市	4506	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450702	钦南区	4507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450703	钦北区	4507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450721	灵山县	4507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450722	浦北县	4507	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450802	港北区	4508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450803	港南区	4508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450804	覃塘区	4508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450821	平南县	4508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450881	桂平市	4508	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450902	玉州区	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450903	福绵区	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450921	容县	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450922	陆川县	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450923	博白县	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450924	兴业县	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	450981	北流市	4509	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451002	右江区	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451003	田阳区	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451022	田东县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451024	德保县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451026	那坡县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451027	凌云县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451028	乐业县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451029	田林县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451030	西林县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451031	隆林各族自治县	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451081	靖西市	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451082	平果市	4510	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451102	八步区	4511	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451103	平桂区	4511	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451121	昭平县	4511	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451122	钟山县	4511	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451123	富川瑶族自治县	4511	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451202	金城江区	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451203	宜州区	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451221	南丹县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451222	天峨县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451223	凤山县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451224	东兰县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451225	罗城仫佬族自治县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451226	环江毛南族自治县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451227	巴马瑶族自治县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451228	都安瑶族自治县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451229	大化瑶族自治县	4512	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451302	兴宾区	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451321	忻城县	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451322	象州县	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451323	武宣县	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451324	金秀瑶族自治县	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451381	合山市	4513	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451402	江州区	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451421	扶绥县	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451422	宁明县	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451423	龙州县	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451424	大新县	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451425	天等县	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	451481	凭祥市	4514	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460105	秀英区	4601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460106	龙华区	4601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460107	琼山区	4601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460108	美兰区	4601	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460202	海棠区	4602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460203	吉阳区	4602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460204	天涯区	4602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460205	崖州区	4602	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460321	西沙群岛	4603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460322	南沙群岛	4603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460323	中沙群岛的岛礁及其海域	4603	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	460400	儋州市	4604	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469001	五指山市	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469002	琼海市	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469005	文昌市	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469006	万宁市	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469007	东方市	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469021	定安县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469022	屯昌县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469023	澄迈县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469024	临高县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469025	白沙黎族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469026	昌江黎族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469027	乐东黎族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469028	陵水黎族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469029	保亭黎族苗族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	469030	琼中黎族苗族自治县	4690	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500101	万州区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500102	涪陵区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500103	渝中区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500104	大渡口区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500105	江北区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500106	沙坪坝区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500107	九龙坡区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500108	南岸区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500109	北碚区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500110	綦江区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500111	大足区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500112	渝北区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500113	巴南区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500114	黔江区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500115	长寿区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500116	江津区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500117	合川区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500118	永川区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500119	南川区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500120	璧山区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500151	铜梁区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500152	潼南区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500153	荣昌区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500154	开州区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500155	梁平区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500156	武隆区	5001	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500229	城口县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500230	丰都县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500231	垫江县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500233	忠县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500235	云阳县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500236	奉节县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500237	巫山县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500238	巫溪县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500240	石柱土家族自治县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500241	秀山土家族苗族自治县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500242	酉阳土家族苗族自治县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	500243	彭水苗族土家族自治县	5002	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510104	锦江区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510105	青羊区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510106	金牛区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510107	武侯区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510108	成华区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510112	龙泉驿区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510113	青白江区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510114	新都区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510115	温江区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510116	双流区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510117	郫都区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510118	新津区	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510121	金堂县	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510129	大邑县	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510131	蒲江县	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510181	都江堰市	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510182	彭州市	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510183	邛崃市	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510184	崇州市	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510185	简阳市	5101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510302	自流井区	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510303	贡井区	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510304	大安区	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510311	沿滩区	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510321	荣县	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510322	富顺县	5103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510402	东区	5104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510403	西区	5104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510411	仁和区	5104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510421	米易县	5104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510422	盐边县	5104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510502	江阳区	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510503	纳溪区	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510504	龙马潭区	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510521	泸县	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510522	合江县	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510524	叙永县	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510525	古蔺县	5105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510603	旌阳区	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510604	罗江区	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510623	中江县	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510681	广汉市	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510682	什邡市	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510683	绵竹市	5106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510703	涪城区	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510704	游仙区	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510705	安州区	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510722	三台县	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510723	盐亭县	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510725	梓潼县	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510726	北川羌族自治县	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510727	平武县	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510781	江油市	5107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510802	利州区	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510811	昭化区	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510812	朝天区	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510821	旺苍县	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510822	青川县	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510823	剑阁县	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510824	苍溪县	5108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510903	船山区	5109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510904	安居区	5109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510921	蓬溪县	5109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510923	大英县	5109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	510981	射洪市	5109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511002	市中区	5110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511011	东兴区	5110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511024	威远县	5110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511025	资中县	5110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511083	隆昌市	5110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511102	市中区	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511111	沙湾区	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511112	五通桥区	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511113	金口河区	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511123	犍为县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511124	井研县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511126	夹江县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511129	沐川县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511132	峨边彝族自治县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511133	马边彝族自治县	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511181	峨眉山市	5111	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511302	顺庆区	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511303	高坪区	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511304	嘉陵区	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511321	南部县	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511322	营山县	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511323	蓬安县	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511324	仪陇县	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511325	西充县	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511381	阆中市	5113	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511402	东坡区	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511403	彭山区	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511421	仁寿县	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511423	洪雅县	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511424	丹棱县	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511425	青神县	5114	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511502	翠屏区	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511503	南溪区	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511504	叙州区	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511523	江安县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511524	长宁县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511525	高县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511526	珙县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511527	筠连县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511528	兴文县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511529	屏山县	5115	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511602	广安区	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511603	前锋区	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511621	岳池县	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511622	武胜县	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511623	邻水县	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511681	华蓥市	5116	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511702	通川区	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511703	达川区	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511722	宣汉县	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511723	开江县	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511724	大竹县	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511725	渠县	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511781	万源市	5117	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511802	雨城区	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511803	名山区	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511822	荥经县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511823	汉源县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511824	石棉县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511825	天全县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511826	芦山县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511827	宝兴县	5118	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511902	巴州区	5119	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511903	恩阳区	5119	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511921	通江县	5119	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511922	南江县	5119	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	511923	平昌县	5119	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	512002	雁江区	5120	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	512021	安岳县	5120	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	512022	乐至县	5120	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513201	马尔康市	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513221	汶川县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513222	理县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513223	茂县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513224	松潘县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513225	九寨沟县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513226	金川县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513227	小金县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513228	黑水县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513230	壤塘县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513231	阿坝县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513232	若尔盖县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513233	红原县	5132	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513301	康定市	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513322	泸定县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513323	丹巴县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513324	九龙县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513325	雅江县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513326	道孚县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513327	炉霍县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513328	甘孜县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513329	新龙县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513330	德格县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513331	白玉县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513332	石渠县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513333	色达县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513334	理塘县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513335	巴塘县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513336	乡城县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513337	稻城县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513338	得荣县	5133	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513401	西昌市	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513402	会理市	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513422	木里藏族自治县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513423	盐源县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513424	德昌县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513426	会东县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513427	宁南县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513428	普格县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513429	布拖县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513430	金阳县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513431	昭觉县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513432	喜德县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513433	冕宁县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513434	越西县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513435	甘洛县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513436	美姑县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	513437	雷波县	5134	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520102	南明区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520103	云岩区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520111	花溪区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520112	乌当区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520113	白云区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520115	观山湖区	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520121	开阳县	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520122	息烽县	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520123	修文县	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520181	清镇市	5201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520201	钟山区	5202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520203	六枝特区	5202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520204	水城区	5202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520281	盘州市	5202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520302	红花岗区	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520303	汇川区	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520304	播州区	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520322	桐梓县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520323	绥阳县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520324	正安县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520325	道真仡佬族苗族自治县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520326	务川仡佬族苗族自治县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520327	凤冈县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520328	湄潭县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520329	余庆县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520330	习水县	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520381	赤水市	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520382	仁怀市	5203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520402	西秀区	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520403	平坝区	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520422	普定县	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520423	镇宁布依族苗族自治县	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520424	关岭布依族苗族自治县	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520425	紫云苗族布依族自治县	5204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520502	七星关区	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520521	大方县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520523	金沙县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520524	织金县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520525	纳雍县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520526	威宁彝族回族苗族自治县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520527	赫章县	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520581	黔西市	5205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520602	碧江区	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520603	万山区	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520621	江口县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520622	玉屏侗族自治县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520623	石阡县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520624	思南县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520625	印江土家族苗族自治县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520626	德江县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520627	沿河土家族自治县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	520628	松桃苗族自治县	5206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522301	兴义市	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522302	兴仁市	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522323	普安县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522324	晴隆县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522325	贞丰县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522326	望谟县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522327	册亨县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522328	安龙县	5223	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522601	凯里市	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522622	黄平县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522623	施秉县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522624	三穗县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522625	镇远县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522626	岑巩县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522627	天柱县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522628	锦屏县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522629	剑河县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522630	台江县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522631	黎平县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522632	榕江县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522633	从江县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522634	雷山县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522635	麻江县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522636	丹寨县	5226	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522701	都匀市	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522702	福泉市	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522722	荔波县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522723	贵定县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522725	瓮安县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522726	独山县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522727	平塘县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522728	罗甸县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522729	长顺县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522730	龙里县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522731	惠水县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	522732	三都水族自治县	5227	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530102	五华区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530103	盘龙区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530111	官渡区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530112	西山区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530113	东川区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530114	呈贡区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530115	晋宁区	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530124	富民县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530125	宜良县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530126	石林彝族自治县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530127	嵩明县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530128	禄劝彝族苗族自治县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530129	寻甸回族彝族自治县	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530181	安宁市	5301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530302	麒麟区	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530303	沾益区	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530304	马龙区	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530322	陆良县	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530323	师宗县	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530324	罗平县	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530325	富源县	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530326	会泽县	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530381	宣威市	5303	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530402	红塔区	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530403	江川区	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530423	通海县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530424	华宁县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530425	易门县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530426	峨山彝族自治县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530427	新平彝族傣族自治县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530428	元江哈尼族彝族傣族自治县	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530481	澄江市	5304	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530502	隆阳区	5305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530521	施甸县	5305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530523	龙陵县	5305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530524	昌宁县	5305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530581	腾冲市	5305	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530602	昭阳区	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530621	鲁甸县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530622	巧家县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530623	盐津县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530624	大关县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530625	永善县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530626	绥江县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530627	镇雄县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530628	彝良县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530629	威信县	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530681	水富市	5306	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530702	古城区	5307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530721	玉龙纳西族自治县	5307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530722	永胜县	5307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530723	华坪县	5307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530724	宁蒗彝族自治县	5307	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530802	思茅区	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530821	宁洱哈尼族彝族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530822	墨江哈尼族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530823	景东彝族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530824	景谷傣族彝族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530825	镇沅彝族哈尼族拉祜族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530826	江城哈尼族彝族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530827	孟连傣族拉祜族佤族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530828	澜沧拉祜族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530829	西盟佤族自治县	5308	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530902	临翔区	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530921	凤庆县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530922	云县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530923	永德县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530924	镇康县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530925	双江拉祜族佤族布朗族傣族自治县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530926	耿马傣族佤族自治县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	530927	沧源佤族自治县	5309	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532301	楚雄市	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532302	禄丰市	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532322	双柏县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532323	牟定县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532324	南华县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532325	姚安县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532326	大姚县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532327	永仁县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532328	元谋县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532329	武定县	5323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532501	个旧市	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532502	开远市	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532503	蒙自市	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532504	弥勒市	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532523	屏边苗族自治县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532524	建水县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532525	石屏县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532527	泸西县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532528	元阳县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532529	红河县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532530	金平苗族瑶族傣族自治县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532531	绿春县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532532	河口瑶族自治县	5325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532601	文山市	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532622	砚山县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532623	西畴县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532624	麻栗坡县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532625	马关县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532626	丘北县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532627	广南县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532628	富宁县	5326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532801	景洪市	5328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532822	勐海县	5328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532823	勐腊县	5328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532901	大理市	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532922	漾濞彝族自治县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532923	祥云县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532924	宾川县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532925	弥渡县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532926	南涧彝族自治县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532927	巍山彝族回族自治县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532928	永平县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532929	云龙县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532930	洱源县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532931	剑川县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	532932	鹤庆县	5329	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533102	瑞丽市	5331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533103	芒市	5331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533122	梁河县	5331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533123	盈江县	5331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533124	陇川县	5331	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533301	泸水市	5333	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533323	福贡县	5333	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533324	贡山独龙族怒族自治县	5333	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533325	兰坪白族普米族自治县	5333	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533401	香格里拉市	5334	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533422	德钦县	5334	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	533423	维西傈僳族自治县	5334	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540102	城关区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540103	堆龙德庆区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540104	达孜区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540121	林周县	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540122	当雄县	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540123	尼木县	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540124	曲水县	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540127	墨竹工卡县	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540171	格尔木藏青工业园区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540172	拉萨经济技术开发区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540173	西藏文化旅游创意园区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540174	达孜工业园区	5401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540202	桑珠孜区	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540221	南木林县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540222	江孜县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540223	定日县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540224	萨迦县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540225	拉孜县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540226	昂仁县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540227	谢通门县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540228	白朗县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540229	仁布县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540230	康马县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540231	定结县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540232	仲巴县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540233	亚东县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540234	吉隆县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540235	聂拉木县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540236	萨嘎县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540237	岗巴县	5402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540302	卡若区	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540321	江达县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540322	贡觉县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540323	类乌齐县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540324	丁青县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540325	察雅县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540326	八宿县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540327	左贡县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540328	芒康县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540329	洛隆县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540330	边坝县	5403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540402	巴宜区	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540421	工布江达县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540422	米林县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540423	墨脱县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540424	波密县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540425	察隅县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540426	朗县	5404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540502	乃东区	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540521	扎囊县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540522	贡嘎县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540523	桑日县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540524	琼结县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540525	曲松县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540526	措美县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540527	洛扎县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540528	加查县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540529	隆子县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540530	错那县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540531	浪卡子县	5405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540602	色尼区	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540621	嘉黎县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540622	比如县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540623	聂荣县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540624	安多县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540625	申扎县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540626	索县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540627	班戈县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540628	巴青县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540629	尼玛县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	540630	双湖县	5406	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542521	普兰县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542522	札达县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542523	噶尔县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542524	日土县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542525	革吉县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542526	改则县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	542527	措勤县	5425	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610102	新城区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610103	碑林区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610104	莲湖区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610111	灞桥区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610112	未央区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610113	雁塔区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610114	阎良区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610115	临潼区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610116	长安区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610117	高陵区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610118	鄠邑区	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610122	蓝田县	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610124	周至县	6101	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610202	王益区	6102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610203	印台区	6102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610204	耀州区	6102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610222	宜君县	6102	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610302	渭滨区	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610303	金台区	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610304	陈仓区	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610305	凤翔区	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610323	岐山县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610324	扶风县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610326	眉县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610327	陇县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610328	千阳县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610329	麟游县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610330	凤县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610331	太白县	6103	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610402	秦都区	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610403	杨陵区	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610404	渭城区	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610422	三原县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610423	泾阳县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610424	乾县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610425	礼泉县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610426	永寿县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610428	长武县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610429	旬邑县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610430	淳化县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610431	武功县	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610481	兴平市	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610482	彬州市	6104	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610502	临渭区	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610503	华州区	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610522	潼关县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610523	大荔县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610524	合阳县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610525	澄城县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610526	蒲城县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610527	白水县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610528	富平县	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610581	韩城市	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610582	华阴市	6105	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610602	宝塔区	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610603	安塞区	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610621	延长县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610622	延川县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610625	志丹县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610626	吴起县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610627	甘泉县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610628	富县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610629	洛川县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610630	宜川县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610631	黄龙县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610632	黄陵县	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610681	子长市	6106	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610702	汉台区	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610703	南郑区	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610722	城固县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610723	洋县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610724	西乡县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610725	勉县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610726	宁强县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610727	略阳县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610728	镇巴县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610729	留坝县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610730	佛坪县	6107	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610802	榆阳区	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610803	横山区	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610822	府谷县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610824	靖边县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610825	定边县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610826	绥德县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610827	米脂县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610828	佳县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610829	吴堡县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610830	清涧县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610831	子洲县	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610881	神木市	6108	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610902	汉滨区	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610921	汉阴县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610922	石泉县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610923	宁陕县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610924	紫阳县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610925	岚皋县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610926	平利县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610927	镇坪县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610929	白河县	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	610981	旬阳市	6109	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611002	商州区	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611021	洛南县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611022	丹凤县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611023	商南县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611024	山阳县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611025	镇安县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	611026	柞水县	6110	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620102	城关区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620103	七里河区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620104	西固区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620105	安宁区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620111	红古区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620121	永登县	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620122	皋兰县	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620123	榆中县	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620171	兰州新区	6201	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620201	嘉峪关市	6202	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620302	金川区	6203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620321	永昌县	6203	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620402	白银区	6204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620403	平川区	6204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620421	靖远县	6204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620422	会宁县	6204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620423	景泰县	6204	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620502	秦州区	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620503	麦积区	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620521	清水县	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620522	秦安县	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620523	甘谷县	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620524	武山县	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620525	张家川回族自治县	6205	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620602	凉州区	6206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620621	民勤县	6206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620622	古浪县	6206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620623	天祝藏族自治县	6206	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620702	甘州区	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620721	肃南裕固族自治县	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620722	民乐县	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620723	临泽县	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620724	高台县	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620725	山丹县	6207	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620802	崆峒区	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620821	泾川县	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620822	灵台县	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620823	崇信县	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620825	庄浪县	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620826	静宁县	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620881	华亭市	6208	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620902	肃州区	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620921	金塔县	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620922	瓜州县	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620923	肃北蒙古族自治县	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620924	阿克塞哈萨克族自治县	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620981	玉门市	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	620982	敦煌市	6209	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621002	西峰区	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621021	庆城县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621022	环县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621023	华池县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621024	合水县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621025	正宁县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621026	宁县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621027	镇原县	6210	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621102	安定区	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621121	通渭县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621122	陇西县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621123	渭源县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621124	临洮县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621125	漳县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621126	岷县	6211	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621202	武都区	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621221	成县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621222	文县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621223	宕昌县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621224	康县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621225	西和县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621226	礼县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621227	徽县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	621228	两当县	6212	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622901	临夏市	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622921	临夏县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622922	康乐县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622923	永靖县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622924	广河县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622925	和政县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622926	东乡族自治县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	622927	积石山保安族东乡族撒拉族自治县	6229	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623001	合作市	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623021	临潭县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623022	卓尼县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623023	舟曲县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623024	迭部县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623025	玛曲县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623026	碌曲县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	623027	夏河县	6230	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630102	城东区	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630103	城中区	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630104	城西区	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630105	城北区	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630106	湟中区	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630121	大通回族土族自治县	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630123	湟源县	6301	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630202	乐都区	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630203	平安区	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630222	民和回族土族自治县	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630223	互助土族自治县	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630224	化隆回族自治县	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	630225	循化撒拉族自治县	6302	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632221	门源回族自治县	6322	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632222	祁连县	6322	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632223	海晏县	6322	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632224	刚察县	6322	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632301	同仁市	6323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632322	尖扎县	6323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632323	泽库县	6323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632324	河南蒙古族自治县	6323	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632521	共和县	6325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632522	同德县	6325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632523	贵德县	6325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632524	兴海县	6325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632525	贵南县	6325	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632621	玛沁县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632622	班玛县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632623	甘德县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632624	达日县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632625	久治县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632626	玛多县	6326	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632701	玉树市	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632722	杂多县	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632723	称多县	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632724	治多县	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632725	囊谦县	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632726	曲麻莱县	6327	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632801	格尔木市	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632802	德令哈市	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632803	茫崖市	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632821	乌兰县	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632822	都兰县	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632823	天峻县	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	632857	大柴旦行政委员会	6328	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640104	兴庆区	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640105	西夏区	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640106	金凤区	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640121	永宁县	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640122	贺兰县	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640181	灵武市	6401	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640202	大武口区	6402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640205	惠农区	6402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640221	平罗县	6402	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640302	利通区	6403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640303	红寺堡区	6403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640323	盐池县	6403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640324	同心县	6403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640381	青铜峡市	6403	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640402	原州区	6404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640422	西吉县	6404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640423	隆德县	6404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640424	泾源县	6404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640425	彭阳县	6404	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640502	沙坡头区	6405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640521	中宁县	6405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	640522	海原县	6405	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650102	天山区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650103	沙依巴克区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650104	新市区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650105	水磨沟区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650106	头屯河区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650107	达坂城区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650109	米东区	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650121	乌鲁木齐县	6501	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650202	独山子区	6502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650203	克拉玛依区	6502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650204	白碱滩区	6502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650205	乌尔禾区	6502	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650402	高昌区	6504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650421	鄯善县	6504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650422	托克逊县	6504	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650502	伊州区	6505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650521	巴里坤哈萨克自治县	6505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	650522	伊吾县	6505	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652301	昌吉市	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652302	阜康市	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652323	呼图壁县	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652324	玛纳斯县	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652325	奇台县	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652327	吉木萨尔县	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652328	木垒哈萨克自治县	6523	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652701	博乐市	6527	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652702	阿拉山口市	6527	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652722	精河县	6527	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652723	温泉县	6527	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652801	库尔勒市	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652822	轮台县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652823	尉犁县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652824	若羌县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652825	且末县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652826	焉耆回族自治县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652827	和静县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652828	和硕县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652829	博湖县	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652871	库尔勒经济技术开发区	6528	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652901	阿克苏市	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652902	库车市	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652922	温宿县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652924	沙雅县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652925	新和县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652926	拜城县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652927	乌什县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652928	阿瓦提县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	652929	柯坪县	6529	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653001	阿图什市	6530	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653022	阿克陶县	6530	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653023	阿合奇县	6530	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653024	乌恰县	6530	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653101	喀什市	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653121	疏附县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653122	疏勒县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653123	英吉沙县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653124	泽普县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653125	莎车县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653126	叶城县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653127	麦盖提县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653128	岳普湖县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653129	伽师县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653130	巴楚县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653131	塔什库尔干塔吉克自治县	6531	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653201	和田市	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653221	和田县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653222	墨玉县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653223	皮山县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653224	洛浦县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653225	策勒县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653226	于田县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	653227	民丰县	6532	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654002	伊宁市	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654003	奎屯市	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654004	霍尔果斯市	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654021	伊宁县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654022	察布查尔锡伯自治县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654023	霍城县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654024	巩留县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654025	新源县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654026	昭苏县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654027	特克斯县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654028	尼勒克县	6540	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654201	塔城市	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654202	乌苏市	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654203	沙湾市	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654221	额敏县	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654224	托里县	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654225	裕民县	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654226	和布克赛尔蒙古自治县	6542	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654301	阿勒泰市	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654321	布尔津县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654322	富蕴县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654323	福海县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654324	哈巴河县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654325	青河县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	654326	吉木乃县	6543	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659001	石河子市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659002	阿拉尔市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659003	图木舒克市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659004	五家渠市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659005	北屯市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659006	铁门关市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659007	双河市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659008	可克达拉市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659009	昆玉市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659010	胡杨河市	6590	3
2023-05-31 09:37:01.061+05:30	2023-05-31 09:37:01.061+05:30	659011	新星市	6590	3
\.


--
-- Data for Name: collectionCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collectionCategories" (id, "createdAt", "updatedAt", name, color, sort) FROM stdin;
\.


--
-- Data for Name: collectionCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collectionCategory" ("createdAt", "updatedAt", "collectionName", "categoryId") FROM stdin;
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (key, name, title, inherit, hidden, options, sort) FROM stdin;
i5ssri6pjgy	users	{{t("Users")}}	f	f	{"namespace":"users.users","duplicator":{"dumpable":"optional","with":"rolesUsers"},"sortable":"sort","model":"UserModel","createdBy":true,"updatedBy":true,"logging":true,"from":"db2cm"}	1
f357mucx3km	roles	{{t("Roles")}}	f	f	{"namespace":"acl.acl","duplicator":{"dumpable":"required","with":"uiSchemas"},"autoGenId":false,"model":"RoleModel","filterTargetKey":"name","sortable":true,"from":"db2cm"}	2
lcdlzq8yrgs	WTT_Customer	Customer	f	f	{"logging":true,"autoGenId":true,"createdBy":true,"updatedBy":true,"createdAt":true,"updatedAt":true,"sortable":true,"template":"general","view":false}	3
yp172m2odbh	WTT_Asset	Asset	f	f	{"logging":true,"autoGenId":true,"createdBy":true,"updatedBy":true,"createdAt":true,"updatedAt":true,"sortable":true,"template":"general","view":false}	4
pnu4zy2depd	WTT_CustomerAssetsReading	Assets Reading	f	f	{"logging":true,"autoGenId":true,"createdBy":false,"updatedBy":false,"createdAt":false,"updatedAt":false,"sortable":true,"template":"general","view":false}	5
\.


--
-- Data for Name: executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.executions (id, "createdAt", "updatedAt", key, "useTransaction", context, status, "workflowId") FROM stdin;
1	2023-05-31 22:49:09.164+05:30	2023-05-31 22:49:09.234+05:30	hp98rvp6bdz	\N	{"data":{"IsActive":true,"id":3,"name":"Ranjit","Description":"Test","updatedAt":"2023-05-31T17:19:09.079Z","createdAt":"2023-05-31T17:19:09.030Z","createdById":1,"updatedById":1,"assetId":1}}	1	1
2	2023-05-31 23:21:06.41+05:30	2023-05-31 23:21:06.484+05:30	hp98rvp6bdz	\N	{"data":{"IsActive":true,"id":4,"name":"Ranjit","Description":"test2","updatedAt":"2023-05-31T17:51:06.388Z","createdAt":"2023-05-31T17:51:06.360Z","createdById":1,"updatedById":1,"assetId":1}}	-1	3
3	2023-05-31 23:41:00.921+05:30	2023-05-31 23:41:01.034+05:30	hp98rvp6bdz	\N	{"data":{"IsActive":true,"id":5,"name":"ranjit w2","Description":"w2","updatedAt":"2023-05-31T18:11:00.875Z","createdAt":"2023-05-31T18:11:00.875Z","createdById":1,"updatedById":1,"assetId":null}}	-1	3
4	2023-05-31 23:41:00.936+05:30	2023-05-31 23:41:01.05+05:30	7g8khyva5c8	\N	{"data":{"IsActive":true,"id":5,"name":"ranjit w2","Description":"w2","updatedAt":"2023-05-31T18:11:00.875Z","createdAt":"2023-05-31T18:11:00.875Z","createdById":1,"updatedById":1,"assetId":null}}	1	2
5	2023-05-31 23:57:30.812+05:30	2023-05-31 23:57:30.879+05:30	8taa02cgits	\N	{"data":{"IsActive":true,"id":7,"name":"ranjit","Description":"ranjit","updatedAt":"2023-05-31T18:27:30.779Z","createdAt":"2023-05-31T18:27:30.779Z","createdById":1,"updatedById":1,"assetId":null}}	1	4
\.


--
-- Data for Name: fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fields (key, name, type, interface, "collectionName", "parentKey", "reverseKey", options, sort) FROM stdin;
bladdravycc	id	bigInt	id	users	\N	\N	{"autoIncrement":true,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t("ID")}}","x-component":"InputNumber","x-read-pretty":true}}	1
yf94bozbhkd	nickname	string	input	users	\N	\N	{"uiSchema":{"type":"string","title":"{{t("Nickname")}}","x-component":"Input"}}	2
93xr1b9fovl	email	string	email	users	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t("Email")}}","x-component":"Input","x-validator":"email","required":true}}	3
pbuve3f2hw7	phone	string	phone	users	\N	\N	{"unique":true,"uiSchema":{"type":"string","title":"{{t("Phone")}}","x-component":"Input","x-validator":"phone","required":true}}	4
xmlhjkz4x9x	password	password	password	users	\N	\N	{"hidden":true,"uiSchema":{"type":"string","title":"{{t("Password")}}","x-component":"Password"}}	5
drzez6n3oti	appLang	string	\N	users	\N	\N	{}	6
vgy4gr7g6n0	resetToken	string	\N	users	\N	\N	{"unique":true,"hidden":true}	7
qdd004xy2s1	systemSettings	json	\N	users	\N	\N	{"defaultValue":{}}	8
cip0bc6nj3a	sort	sort	\N	users	\N	\N	{"hidden":true}	9
hdgmiay2wea	createdById	context	\N	users	\N	\N	{"dataType":"bigInt","dataIndex":"state.currentUser.id","createOnly":true,"visible":true,"index":true}	10
ivce7u1c22m	createdBy	belongsTo	\N	users	\N	\N	{"target":"users","foreignKey":"createdById","targetKey":"id"}	11
e64xssn3vcy	updatedById	context	\N	users	\N	\N	{"dataType":"bigInt","dataIndex":"state.currentUser.id","visible":true,"index":true}	12
pwi5iupzz0e	updatedBy	belongsTo	\N	users	\N	\N	{"target":"users","foreignKey":"updatedById","targetKey":"id"}	13
6fknxhl5f5g	roles	belongsToMany	m2m	users	\N	\N	{"target":"roles","foreignKey":"userId","otherKey":"roleName","onDelete":"CASCADE","sourceKey":"id","targetKey":"name","through":"rolesUsers","uiSchema":{"type":"array","title":"{{t("Roles")}}","x-component":"AssociationField","x-component-props":{"multiple":true,"fieldNames":{"label":"title","value":"name"}}}}	14
pt5hkvuozj1	jobs	belongsToMany	\N
501v2vpnaq5	description	string	\N	roles	\N	\N	{}	3
zy9qn7h179o	strategy	json	\N	roles	\N	\N	{}	4
a15eyf55ts3	default	boolean	\N	roles	\N	\N	{"defaultValue":false}	5
cilx2q07vug	hidden	boolean	\N	roles	\N	\N	{"defaultValue":false}	6
7lx6e8zjmch	allowConfigure	boolean	\N	roles	\N	\N	{}	7
pt59pq2cdop	allowNewMenu	boolean	\N	roles	\N	\N	{}	8
wlkr1htumon	menuUiSchemas	belongsToMany	\N	roles	\N	\N	{"target":"uiSchemas","targetKey":"x-uid","onDelete":"CASCADE","foreignKey":"roleName","sourceKey":"name","otherKey":"uiSchemaXUid","through":"rolesUischemas"}	9
kboj72p0j5j	resources	hasMany	\N	roles	\N	\N	{"target":"rolesResources","sourceKey":"name","targetKey":"name","foreignKey":"roleName"}	10
d02zvdut1sl	snippets	set	\N	roles	\N	\N	{"defaultValue":["!ui.*","!pm","!pm.*"]}	11
5v6mgzitwi6	sort	sort	\N	roles	\N	\N	{"hidden":true}	12
wt8jzmr0mkf	createdAt	date	createdAt	WTT_Customer	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t("Created at")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	2
wqa0eycky0v	createdBy	belongsTo	createdBy	WTT_Customer	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t("Created by")}}","x-component":"RecordPicker","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	3
or29rh8f1m3	updatedAt	date	updatedAt	WTT_Customer	\N	\N	{"field":"updatedAt","uiSchema":{"type":"string","title":"{{t("Last updated at")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	4
vgxibvmcuom	updatedBy	belongsTo	updatedBy	WTT_Customer	\N	\N	{"target":"users","foreignKey":"updatedById","uiSchema":{"type":"object","title":"{{t("Last updated by")}}","x-component":"RecordPicker","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	5
kx9khiyarco	name	string	input	WTT_Customer	\N	\N	{"uiSchema":{"type":"string","x-component":"Input","title":"Name"}}	6
v5p87v9vu7y	Description	text	textarea	WTT_Customer	\N	\N	{"uiSchema":{"type":"string","x-component":"Input.TextArea","title":"Details"}}	7
9s0bs4h1l6r	IsActive	boolean	checkbox	WTT_Customer	\N	\N	{"uiSchema":{"type":"boolean","x-component":"Checkbox","title":"Status"},"defaultValue":true}	8
1nynmvdcwzx	id	bigInt	id	WTT_Asset	\N	\N	{"autoIncrement":true,"primaryKey":true,"allowNull":false,"uiSchema":{"type":"number","title":"{{t("ID")}}","x-component":"InputNumber","x-read-pretty":true}}	1
j8c7mxh7no8	createdAt	date	createdAt	WTT_Asset	\N	\N	{"field":"createdAt","uiSchema":{"type":"datetime","title":"{{t("Created at")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}	2
u5qisn76ojg	createdBy	belongsTo	createdBy	WTT_Asset	\N	\N	{"target":"users","foreignKey":"createdById","uiSchema":{"type":"object","title":"{{t("Created by")}}","x-component":"RecordPicker","x-component-props":{"fieldNames":{"value":"id","label":"nickname"}},"x-read-pretty":true},"targetKey":"id"}	3
coe2s1xmhbw	updatedAt	date	updatedAt	WTT_Asset	\N	\N	{"field":"updatedAt","uiSchema":{"type":"string","title":"{{t("Last updated at")}}","x-component":"DatePicker","x-component-props":{},"x-read-pretty":true}}
\.


--
-- Data for Name: flow_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flow_nodes (id, "createdAt", "updatedAt", title, "upstreamId", "branchIndex", "downstreamId", type, config, "workflowId") FROM stdin;
1	2023-05-31 22:39:17.048+05:30	2023-05-31 22:48:33.558+05:30	HTTP request	\N	\N	\N	request	{"method":"POST","headers":[],"params":[],"url":"http://localhost:3000/test","data":{"Status":3}}	1
5	2023-05-31 23:20:29.59+05:30	2023-05-31 23:20:42.976+05:30	HTTP request	\N	\N	\N	request	{"method":"POST","headers":[],"params":[],"url":"http://localhost:3000/test","data":null}	3
2	2023-05-31 22:52:21.317+05:30	2023-05-31 23:40:32.331+05:30	HTTP request	\N	\N	\N	request	{"method":"POST","headers":[],"params":[],"data":{"data":"{$context.data}"},"url":"http://localhost:3000/test"}	2
10	2023-05-31 23:55:06.962+05:30	2023-05-31 23:56:16.74+05:30	HTTP request	\N	\N	\N	request	{"method":"POST","headers":[],"params":[],"url":"http://localhost:3000/test","data":"{{context.data}}"}	4
\.


--
-- Data for Name: iframeHtml; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."iframeHtml" ("createdAt", "updatedAt", id, html, "createdById", "updatedById") FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, "createdAt", "updatedAt", "executionId", "nodeId", "upstreamId", status, result) FROM stdin;
1	2023-05-31 22:49:09.193+05:30	2023-05-31 22:49:09.231+05:30	1	1	\N	1	"Success"
2	2023-05-31 23:21:06.436+05:30	2023-05-31 23:21:06.478+05:30	2	5	\N	-1	{"message":"Request failed with status code 400","name":"AxiosError","config":{"transitional":{"silentJSONParsing":true,"forcedJSONParsing":true,"clarifyTimeoutError":false},"transformRequest":[null],"transformResponse":[null],"timeout":5000,"xsrfCookieName":"XSRF-TOKEN","xsrfHeaderName":"X-XSRF-TOKEN","maxContentLength":-1,"maxBodyLength":-1,"env":{},"headers":{"Accept":"application/json, text/plain, */*","Content-Type":"application/json","User-Agent":"axios/0.27.2","Content-Length":4},"url":"http://localhost:3000/test","method":"post","params":{},"data":"null"},"code":"ERR_BAD_REQUEST","status":400}
3	2023-05-31 23:41:00.963+05:30	2023-05-31 23:41:01.027+05:30	3	5	\N	-1	{"message":"Request failed with status code 400","name":"AxiosError","config":{"transitional":{"silentJSONParsing":true,"forcedJSONParsing":true,"clarifyTimeoutError":false},"transformRequest":[null],"transformResponse":[null],"timeout":5000,"xsrfCookieName":"XSRF-TOKEN","xsrfHeaderName":"X-XSRF-TOKEN","maxContentLength":-1,"maxBodyLength":-1,"env":{},"headers":{"Accept":"application/json, text/plain, */*","Content-Type":"application/json","User-Agent":"axios/0.27.2","Content-Length":4},"url":"http://localhost:3000/test","method":"post","params":{},"data":"null"},"code":"ERR_BAD_REQUEST","status":400}
4	2023-05-31 23:41:00.99+05:30	2023-05-31 23:41:01.043+05:30	4	2	\N	1	"Success"
5	2023-05-31 23:57:30.833+05:30	2023-05-31 23:57:30.874+05:30	5	10	\N	1	"Success"
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (name) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles ("createdAt", "updatedAt", name, title, description, strategy, "default", hidden, "allowConfigure", "allowNewMenu", snippets, sort) FROM stdin;
2023-05-31 09:37:00.67+05:30	2023-05-31 09:37:00.67+05:30	root	{{t("Root")}}	\N	\N	f	t	\N	\N	["pm", "pm.*", "ui.*"]	1
2023-05-31 09:37:00.677+05:30	2023-05-31 09:37:00.677+05:30	admin	{{t("Admin")}}	\N	{"actions":["create","view","update","destroy"]}	f	f	t	t	["pm", "pm.*", "ui.*"]	2
2023-05-31 09:37:00.681+05:30	2023-05-31 09:37:00.681+05:30	member	{{t("Member")}}	\N	{"actions":["view","update:own","destroy:own","create"]}	t	f	\N	t	["!pm", "!pm.*", "!ui.*"]	3
\.


--
-- Data for Name: rolesResources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rolesResources" (id, "createdAt", "updatedAt", "roleName", name, "usingActionsConfig") FROM stdin;
\.


--
-- Data for Name: rolesResourcesActions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rolesResourcesActions" (id, "createdAt", "updatedAt", "rolesResourceId", name, fields, "scopeId") FROM stdin;
\.


--
-- Data for Name: rolesResourcesScopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rolesResourcesScopes" (id, "createdAt", "updatedAt", key, name, "resourceName", scope) FROM stdin;
1	2023-05-31 09:37:00.69+05:30	2023-05-31 09:37:00.69+05:30	all	{{t("All records")}}	\N	{}
2	2023-05-31 09:37:00.693+05:30	2023-05-31 09:37:00.693+05:30	own	{{t("Own records")}}	\N	{"createdById":"{{ ctx.state.currentUser.id }}"}
\.


--
-- Data for Name: rolesUischemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rolesUischemas" ("createdAt", "updatedAt", "roleName", "uiSchemaXUid") FROM stdin;
2023-05-31 14:22:05.732+05:30	2023-05-31 14:22:05.732+05:30	admin	ncpilr3vsko
2023-05-31 14:22:05.742+05:30	2023-05-31 14:22:05.742+05:30	member	ncpilr3vsko
2023-05-31 14:28:54.724+05:30	2023-05-31 14:28:54.724+05:30	admin	3n3jllqwbjg
2023-05-31 14:28:54.728+05:30	2023-05-31 14:28:54.728+05:30	member	3n3jllqwbjg
2023-05-31 14:31:14.597+05:30	2023-05-31 14:31:14.597+05:30	admin	wpw2zdgvred
2023-05-31 14:31:14.6+05:30	2023-05-31 14:31:14.6+05:30	member	wpw2zdgvred
2023-05-31 15:01:29.554+05:30	2023-05-31 15:01:29.554+05:30	admin	bdo3e9silbn
2023-05-31 15:01:29.557+05:30	2023-05-31 15:01:29.557+05:30	member	bdo3e9silbn
\.


--
-- Data for Name: rolesUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."rolesUsers" ("createdAt", "updatedAt", "default", "userId", "roleName") FROM stdin;
2023-05-31 09:37:00.785+05:30	2023-05-31 09:37:00.785+05:30	\N	1	member
2023-05-31 09:37:00.9+05:30	2023-05-31 09:37:00.9+05:30	\N	1	admin
2023-05-31 09:37:00.9+05:30	2023-05-31 09:37:00.906+05:30	t	1	root
\.


--
-- Data for Name: sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sequences (id, "createdAt", "updatedAt", collection, field, key, current, "lastGeneratedAt") FROM stdin;
\.


--
-- Data for Name: storages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storages (id, "createdAt", "updatedAt", title, name, type, options, rules, path, "baseUrl", "default") FROM stdin;
1	2023-05-31 09:37:00.651+05:30	2023-05-31 09:37:00.651+05:30	本地存储	local	local	{"documentRoot": "storage/uploads"}	{}		http://localhost:13000/storage/uploads	t
\.


--
-- Data for Name: systemSettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."systemSettings" (id, "createdAt", "updatedAt", title, "showLogoOnly", "allowSignUp", "smsAuthEnabled", "logoId", "enabledLanguages", "appLang", options) FROM stdin;
1	2023-05-31 09:37:00.659+05:30	2023-05-31 14:16:05.323+05:30	WalkingTree Technology	\N	t	f	2	["en-US"]	en-US	{}
\.


--
-- Data for Name: uiRoutes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."uiRoutes" ("createdAt", "updatedAt", key, type, "parentKey", "uiSchemaUid", options, sort) FROM stdin;
2023-05-31 09:37:00.601+05:30	2023-05-31 09:37:00.601+05:30	r_zd3w7j0e1tv	redirect	\N	\N	{"from":"/","to":"/admin","exact":true}	1
2023-05-31 09:37:00.615+05:30	2023-05-31 09:37:00.615+05:30	r_4de45s6t8vw	route	r_rtshoznxxzi	\N	{"path":"/admin/:name(.+)?","component":"RouteSchemaComponent"}	1
2023-05-31 09:37:00.609+05:30	2023-05-31 09:37:00.635+05:30	r_rtshoznxxzi	route	\N	we4al08cgrl	{"path":"/admin/:name(.+)?","component":"AdminLayout","title":"NocoBase Admin"}	2
2023-05-31 09:37:00.639+05:30	2023-05-31 09:37:00.639+05:30	r_57etghzte1j	route	\N	\N	{"component":"AuthLayout"}	3
2023-05-31 09:37:00.642+05:30	2023-05-31 09:37:00.642+05:30	r_fbz6pjqzljt	route	r_57etghzte1j	\N	{"path":"/signin","component":"SigninPage"}	1
2023-05-31 09:37:00.645+05:30	2023-05-31 09:37:00.645+05:30	r_ah2w6hgwibd	route	r_57etghzte1j	\N	{"path":"/signup","component":"SignupPage"}	2
\.


--
-- Data for Name: uiSchemaServerHooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."uiSchemaServerHooks" (id, uid, type, collection, field, method, params) FROM stdin;
\.


--
-- Data for Name: uiSchemaTemplates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."uiSchemaTemplates" ("createdAt", "updatedAt", key, name, "componentName", "associationName", "resourceName", uid, "collectionName") FROM stdin;
\.


--
-- Data for Name: uiSchemaTreePath; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."uiSchemaTreePath" (ancestor, descendant, depth, async, type, sort) FROM stdin;
we4al08cgrl	we4al08cgrl	0	f	\N	\N
bvb25kzrb9u	bvb25kzrb9u	0	t	properties	\N
ncpilr3vsko	bvb25kzrb9u	1	\N	\N	1
328zsdxa1d2	328zsdxa1d2	0	f	properties	\N
bvb25kzrb9u	328zsdxa1d2	1	\N	\N	1
ncpilr3vsko	328zsdxa1d2	2	\N	\N	1
we4al08cgrl	328zsdxa1d2	3	\N	\N	\N
we4al08cgrl	bvb25kzrb9u	2	\N	\N	\N
ncpilr3vsko	ncpilr3vsko	0	f	properties	\N
we4al08cgrl	ncpilr3vsko	1	\N	\N	1
dkwjpd81q5f	dkwjpd81q5f	0	f	properties	\N
c2f9t3q258l	dkwjpd81q5f	1	\N	\N	1
9m9g4daljpc	9m9g4daljpc	0	f	properties	\N
dkwjpd81q5f	9m9g4daljpc	1	\N	\N	1
c2f9t3q258l	9m9g4daljpc	2	\N	\N	1
i4bhkgolh3x	i4bhkgolh3x	0	f	properties	\N
9m9g4daljpc	i4bhkgolh3x	1	\N	\N	1
dkwjpd81q5f	i4bhkgolh3x	2	\N	\N	1
c2f9t3q258l	i4bhkgolh3x	3	\N	\N	1
38urc2isvyr	38urc2isvyr	0	f	properties	\N
9m9g4daljpc	38urc2isvyr	1	\N	\N	2
dkwjpd81q5f	38urc2isvyr	2	\N	\N	2
c2f9t3q258l	38urc2isvyr	3	\N	\N	2
1dsb6ktfpw0	1dsb6ktfpw0	0	f	properties	\N
9a5cnn8va7i	1dsb6ktfpw0	1	\N	\N	1
9yf4qjq6xtn	9yf4qjq6xtn	0	f	properties	\N
1dsb6ktfpw0	9yf4qjq6xtn	1	\N	\N	1
p2csprfyzks	p2csprfyzks	0	f	properties	\N
7e38fr8xa7m	p2csprfyzks	1	\N	\N	1
9a5cnn8va7i	9yf4qjq6xtn	2	\N	\N	1
5rlnnzhzvlu	5rlnnzhzvlu	0	f	properties	\N
9yf4qjq6xtn	5rlnnzhzvlu	1	\N	\N	1
1dsb6ktfpw0	5rlnnzhzvlu	2	\N	\N	1
328zsdxa1d2	38urc2isvyr	4	\N	\N	\N
9a5cnn8va7i	5rlnnzhzvlu	3	\N	\N	1
328zsdxa1d2	9m9g4daljpc	3	\N	\N	\N
328zsdxa1d2	dkwjpd81q5f	2	\N	\N	\N
328zsdxa1d2	i4bhkgolh3x	4	\N	\N	\N
p86ow4sckcj	p86ow4sckcj	0	f	properties	\N
bvb25kzrb9u	38urc2isvyr	5	\N	\N	\N
5rlnnzhzvlu	p86ow4sckcj	1	\N	\N	1
bvb25kzrb9u	9m9g4daljpc	4	\N	\N	\N
bvb25kzrb9u	c2f9t3q258l	2	\N	\N	\N
bvb25kzrb9u	dkwjpd81q5f	3	\N	\N	\N
bvb25kzrb9u	i4bhkgolh3x	5	\N	\N	\N
9yf4qjq6xtn	p86ow4sckcj	2	\N	\N	1
ncpilr3vsko	38urc2isvyr	6	\N	\N	\N
1dsb6ktfpw0	p86ow4sckcj	3	\N	\N	1
ncpilr3vsko	9m9g4daljpc	5	\N	\N	\N
ncpilr3vsko	c2f9t3q258l	3	\N	\N	\N
ncpilr3vsko	dkwjpd81q5f	4	\N	\N	\N
ncpilr3vsko	i4bhkgolh3x	6	\N	\N	\N
9a5cnn8va7i	p86ow4sckcj	4	\N	\N	1
we4al08cgrl	38urc2isvyr	7	\N	\N	\N
yfhnohad6lf	yfhnohad6lf	0	f	properties	\N
we4al08cgrl	9m9g4daljpc	6	\N	\N	\N
we4al08cgrl	c2f9t3q258l	4	\N	\N	\N
we4al08cgrl	dkwjpd81q5f	5	\N	\N	\N
we4al08cgrl	i4bhkgolh3x	7	\N	\N	\N
5rlnnzhzvlu	yfhnohad6lf	1	\N	\N	2
c2f9t3q258l	c2f9t3q258l	0	f	properties	\N
328zsdxa1d2	c2f9t3q258l	1	\N	\N	1
9yf4qjq6xtn	yfhnohad6lf	2	\N	\N	2
1dsb6ktfpw0	yfhnohad6lf	3	\N	\N	2
9a5cnn8va7i	yfhnohad6lf	4	\N	\N	2
9wsmhrm9np0	1dsb6ktfpw0	2	\N	\N	\N
jw2um47b1kq	1dsb6ktfpw0	3	\N	\N	\N
s2j1mca129k	1dsb6ktfpw0	4	\N	\N	\N
are93oh007m	1dsb6ktfpw0	5	\N	\N	\N
setmbtb7hr8	1dsb6ktfpw0	6	\N	\N	\N
5wtyj13hh7k	1dsb6ktfpw0	7	\N	\N	\N
v160lx9x03s	1dsb6ktfpw0	8	\N	\N	\N
r34c545vn0o	1dsb6ktfpw0	9	\N	\N	\N
s7ppiu6idan	1dsb6ktfpw0	10	\N	\N	\N
9gg7w4ctvy1	1dsb6ktfpw0	11	\N	\N	\N
4ea0eg22s6f	1dsb6ktfpw0	12	\N	\N	\N
5i6s9h3z12w	1dsb6ktfpw0	13	\N	\N	\N
3o0nafjc9zn	1dsb6ktfpw0	14	\N	\N	\N
wpw2zdgvred	1dsb6ktfpw0	15	\N	\N	\N
we4al08cgrl	1dsb6ktfpw0	16	\N	\N	\N
9wsmhrm9np0	5rlnnzhzvlu	4	\N	\N	\N
zgc2xzzxxy4	zgc2xzzxxy4	0	f	properties	\N
k06t1z467wm	zgc2xzzxxy4	1	\N	\N	1
38urc2isvyr	zgc2xzzxxy4	2	\N	\N	\N
9m9g4daljpc	k06t1z467wm	2	\N	\N	\N
9m9g4daljpc	zgc2xzzxxy4	3	\N	\N	\N
dkwjpd81q5f	k06t1z467wm	3	\N	\N	\N
dkwjpd81q5f	zgc2xzzxxy4	4	\N	\N	\N
c2f9t3q258l	k06t1z467wm	4	\N	\N	\N
c2f9t3q258l	zgc2xzzxxy4	5	\N	\N	\N
328zsdxa1d2	k06t1z467wm	5	\N	\N	\N
328zsdxa1d2	zgc2xzzxxy4	6	\N	\N	\N
bvb25kzrb9u	k06t1z467wm	6	\N	\N	\N
bvb25kzrb9u	zgc2xzzxxy4	7	\N	\N	\N
ncpilr3vsko	k06t1z467wm	7	\N	\N	\N
ncpilr3vsko	zgc2xzzxxy4	8	\N	\N	\N
we4al08cgrl	k06t1z467wm	8	\N	\N	\N
we4al08cgrl	zgc2xzzxxy4	9	\N	\N	\N
k06t1z467wm	k06t1z467wm	0	f	properties	\N
38urc2isvyr	k06t1z467wm	1	\N	\N	3
tiywwu25gv0	tiywwu25gv0	0	f	properties	\N
wgeyei55ubb	tiywwu25gv0	1	\N	\N	1
38urc2isvyr	tiywwu25gv0	2	\N	\N	\N
9m9g4daljpc	tiywwu25gv0	3	\N	\N	\N
9m9g4daljpc	wgeyei55ubb	2	\N	\N	\N
dkwjpd81q5f	tiywwu25gv0	4	\N	\N	\N
dkwjpd81q5f	wgeyei55ubb	3	\N	\N	\N
c2f9t3q258l	tiywwu25gv0	5	\N	\N	\N
c2f9t3q258l	wgeyei55ubb	4	\N	\N	\N
328zsdxa1d2	tiywwu25gv0	6	\N	\N	\N
328zsdxa1d2	wgeyei55ubb	5	\N	\N	\N
bvb25kzrb9u	tiywwu25gv0	7	\N	\N	\N
bvb25kzrb9u	wgeyei55ubb	6	\N	\N	\N
ncpilr3vsko	tiywwu25gv0	8	\N	\N	\N
ncpilr3vsko	wgeyei55ubb	7	\N	\N	\N
we4al08cgrl	tiywwu25gv0	9	\N	\N	\N
we4al08cgrl	wgeyei55ubb	8	\N	\N	\N
wgeyei55ubb	wgeyei55ubb	0	f	properties	\N
38urc2isvyr	wgeyei55ubb	1	\N	\N	4
b4lmg71bhyc	b4lmg71bhyc	0	f	properties	\N
tui7o1pxfhy	b4lmg71bhyc	1	\N	\N	1
38urc2isvyr	b4lmg71bhyc	2	\N	\N	\N
9dvx7nfzbpm	9dvx7nfzbpm	0	f	properties	\N
9m9g4daljpc	b4lmg71bhyc	3	\N	\N	\N
9m9g4daljpc	tui7o1pxfhy	2	\N	\N	\N
dkwjpd81q5f	b4lmg71bhyc	4	\N	\N	\N
dkwjpd81q5f	tui7o1pxfhy	3	\N	\N	\N
c2f9t3q258l	b4lmg71bhyc	5	\N	\N	\N
c2f9t3q258l	tui7o1pxfhy	4	\N	\N	\N
328zsdxa1d2	b4lmg71bhyc	6	\N	\N	\N
328zsdxa1d2	tui7o1pxfhy	5	\N	\N	\N
bvb25kzrb9u	b4lmg71bhyc	7	\N	\N	\N
bvb25kzrb9u	tui7o1pxfhy	6	\N	\N	\N
ncpilr3vsko	b4lmg71bhyc	8	\N	\N	\N
ncpilr3vsko	tui7o1pxfhy	7	\N	\N	\N
we4al08cgrl	b4lmg71bhyc	9	\N	\N	\N
we4al08cgrl	tui7o1pxfhy	8	\N	\N	\N
tui7o1pxfhy	tui7o1pxfhy	0	f	properties	\N
jw2um47b1kq	5rlnnzhzvlu	5	\N	\N	\N
7wh75zbfj6p	7wh75zbfj6p	0	f	properties	\N
xi5fumxgwfz	7wh75zbfj6p	1	\N	\N	1
djk1zx72szz	djk1zx72szz	0	f	properties	\N
7wh75zbfj6p	djk1zx72szz	1	\N	\N	1
xi5fumxgwfz	djk1zx72szz	2	\N	\N	1
g5aqieft0p8	g5aqieft0p8	0	f	properties	\N
djk1zx72szz	g5aqieft0p8	1	\N	\N	1
7wh75zbfj6p	g5aqieft0p8	2	\N	\N	1
xi5fumxgwfz	g5aqieft0p8	3	\N	\N	1
ez550wadmjq	ez550wadmjq	0	f	properties	\N
g5aqieft0p8	ez550wadmjq	1	\N	\N	1
djk1zx72szz	ez550wadmjq	2	\N	\N	1
7wh75zbfj6p	ez550wadmjq	3	\N	\N	1
xi5fumxgwfz	ez550wadmjq	4	\N	\N	1
i4bhkgolh3x	7wh75zbfj6p	2	\N	\N	\N
i4bhkgolh3x	djk1zx72szz	3	\N	\N	\N
i4bhkgolh3x	ez550wadmjq	5	\N	\N	\N
i4bhkgolh3x	g5aqieft0p8	4	\N	\N	\N
9m9g4daljpc	7wh75zbfj6p	3	\N	\N	\N
9m9g4daljpc	djk1zx72szz	4	\N	\N	\N
9m9g4daljpc	ez550wadmjq	6	\N	\N	\N
9m9g4daljpc	g5aqieft0p8	5	\N	\N	\N
9m9g4daljpc	xi5fumxgwfz	2	\N	\N	\N
dkwjpd81q5f	7wh75zbfj6p	4	\N	\N	\N
dkwjpd81q5f	djk1zx72szz	5	\N	\N	\N
dkwjpd81q5f	ez550wadmjq	7	\N	\N	\N
dkwjpd81q5f	g5aqieft0p8	6	\N	\N	\N
dkwjpd81q5f	xi5fumxgwfz	3	\N	\N	\N
c2f9t3q258l	7wh75zbfj6p	5	\N	\N	\N
c2f9t3q258l	djk1zx72szz	6	\N	\N	\N
c2f9t3q258l	ez550wadmjq	8	\N	\N	\N
c2f9t3q258l	g5aqieft0p8	7	\N	\N	\N
c2f9t3q258l	xi5fumxgwfz	4	\N	\N	\N
328zsdxa1d2	7wh75zbfj6p	6	\N	\N	\N
328zsdxa1d2	djk1zx72szz	7	\N	\N	\N
328zsdxa1d2	ez550wadmjq	9	\N	\N	\N
328zsdxa1d2	g5aqieft0p8	8	\N	\N	\N
328zsdxa1d2	xi5fumxgwfz	5	\N	\N	\N
bvb25kzrb9u	7wh75zbfj6p	7	\N	\N	\N
bvb25kzrb9u	djk1zx72szz	8	\N	\N	\N
bvb25kzrb9u	ez550wadmjq	10	\N	\N	\N
bvb25kzrb9u	g5aqieft0p8	9	\N	\N	\N
bvb25kzrb9u	xi5fumxgwfz	6	\N	\N	\N
ncpilr3vsko	7wh75zbfj6p	8	\N	\N	\N
ncpilr3vsko	djk1zx72szz	9	\N	\N	\N
ncpilr3vsko	ez550wadmjq	11	\N	\N	\N
ncpilr3vsko	g5aqieft0p8	10	\N	\N	\N
ncpilr3vsko	xi5fumxgwfz	7	\N	\N	\N
we4al08cgrl	7wh75zbfj6p	9	\N	\N	\N
we4al08cgrl	djk1zx72szz	10	\N	\N	\N
we4al08cgrl	ez550wadmjq	12	\N	\N	\N
we4al08cgrl	g5aqieft0p8	11	\N	\N	\N
we4al08cgrl	xi5fumxgwfz	8	\N	\N	\N
xi5fumxgwfz	xi5fumxgwfz	0	f	properties	\N
i4bhkgolh3x	xi5fumxgwfz	1	\N	\N	1
m9d24ij8x5y	m9d24ij8x5y	0	f	properties	\N
9m9g4daljpc	m9d24ij8x5y	2	\N	\N	\N
dkwjpd81q5f	m9d24ij8x5y	3	\N	\N	\N
c2f9t3q258l	m9d24ij8x5y	4	\N	\N	\N
328zsdxa1d2	m9d24ij8x5y	5	\N	\N	\N
bvb25kzrb9u	m9d24ij8x5y	6	\N	\N	\N
ncpilr3vsko	m9d24ij8x5y	7	\N	\N	\N
we4al08cgrl	m9d24ij8x5y	8	\N	\N	\N
i4bhkgolh3x	m9d24ij8x5y	1	\N	\N	2
g4rjmkihbsy	9dvx7nfzbpm	1	\N	\N	1
42fx62lf4zb	42fx62lf4zb	0	f	properties	\N
9dvx7nfzbpm	42fx62lf4zb	1	\N	\N	1
g4rjmkihbsy	42fx62lf4zb	2	\N	\N	1
vpq51hym4rk	vpq51hym4rk	0	f	properties	\N
42fx62lf4zb	vpq51hym4rk	1	\N	\N	1
9dvx7nfzbpm	vpq51hym4rk	2	\N	\N	1
g4rjmkihbsy	vpq51hym4rk	3	\N	\N	1
vjtnnuqg8ei	vjtnnuqg8ei	0	f	properties	\N
vpq51hym4rk	vjtnnuqg8ei	1	\N	\N	1
42fx62lf4zb	vjtnnuqg8ei	2	\N	\N	1
9dvx7nfzbpm	vjtnnuqg8ei	3	\N	\N	1
g4rjmkihbsy	vjtnnuqg8ei	4	\N	\N	1
tmqirlbk0fu	tmqirlbk0fu	0	f	properties	\N
vpq51hym4rk	tmqirlbk0fu	1	\N	\N	2
42fx62lf4zb	tmqirlbk0fu	2	\N	\N	2
9dvx7nfzbpm	tmqirlbk0fu	3	\N	\N	2
g4rjmkihbsy	tmqirlbk0fu	4	\N	\N	2
s2j1mca129k	5rlnnzhzvlu	6	\N	\N	\N
g5aqieft0p8	g4rjmkihbsy	2	\N	\N	\N
djk1zx72szz	g4rjmkihbsy	3	\N	\N	\N
7wh75zbfj6p	g4rjmkihbsy	4	\N	\N	\N
xi5fumxgwfz	g4rjmkihbsy	5	\N	\N	\N
i4bhkgolh3x	g4rjmkihbsy	6	\N	\N	\N
9m9g4daljpc	g4rjmkihbsy	7	\N	\N	\N
dkwjpd81q5f	g4rjmkihbsy	8	\N	\N	\N
c2f9t3q258l	g4rjmkihbsy	9	\N	\N	\N
328zsdxa1d2	g4rjmkihbsy	10	\N	\N	\N
bvb25kzrb9u	g4rjmkihbsy	11	\N	\N	\N
ncpilr3vsko	g4rjmkihbsy	12	\N	\N	\N
we4al08cgrl	g4rjmkihbsy	13	\N	\N	\N
ez550wadmjq	9dvx7nfzbpm	2	\N	\N	\N
g5aqieft0p8	9dvx7nfzbpm	3	\N	\N	\N
djk1zx72szz	9dvx7nfzbpm	4	\N	\N	\N
7wh75zbfj6p	9dvx7nfzbpm	5	\N	\N	\N
xi5fumxgwfz	9dvx7nfzbpm	6	\N	\N	\N
i4bhkgolh3x	9dvx7nfzbpm	7	\N	\N	\N
9m9g4daljpc	9dvx7nfzbpm	8	\N	\N	\N
dkwjpd81q5f	9dvx7nfzbpm	9	\N	\N	\N
c2f9t3q258l	9dvx7nfzbpm	10	\N	\N	\N
328zsdxa1d2	9dvx7nfzbpm	11	\N	\N	\N
bvb25kzrb9u	9dvx7nfzbpm	12	\N	\N	\N
ncpilr3vsko	9dvx7nfzbpm	13	\N	\N	\N
we4al08cgrl	9dvx7nfzbpm	14	\N	\N	\N
ez550wadmjq	42fx62lf4zb	3	\N	\N	\N
g5aqieft0p8	42fx62lf4zb	4	\N	\N	\N
djk1zx72szz	42fx62lf4zb	5	\N	\N	\N
7wh75zbfj6p	42fx62lf4zb	6	\N	\N	\N
xi5fumxgwfz	42fx62lf4zb	7	\N	\N	\N
i4bhkgolh3x	42fx62lf4zb	8	\N	\N	\N
9m9g4daljpc	42fx62lf4zb	9	\N	\N	\N
dkwjpd81q5f	42fx62lf4zb	10	\N	\N	\N
c2f9t3q258l	42fx62lf4zb	11	\N	\N	\N
328zsdxa1d2	42fx62lf4zb	12	\N	\N	\N
bvb25kzrb9u	42fx62lf4zb	13	\N	\N	\N
ncpilr3vsko	42fx62lf4zb	14	\N	\N	\N
we4al08cgrl	42fx62lf4zb	15	\N	\N	\N
ez550wadmjq	vpq51hym4rk	4	\N	\N	\N
g5aqieft0p8	vpq51hym4rk	5	\N	\N	\N
djk1zx72szz	vpq51hym4rk	6	\N	\N	\N
7wh75zbfj6p	vpq51hym4rk	7	\N	\N	\N
xi5fumxgwfz	vpq51hym4rk	8	\N	\N	\N
i4bhkgolh3x	vpq51hym4rk	9	\N	\N	\N
9m9g4daljpc	vpq51hym4rk	10	\N	\N	\N
dkwjpd81q5f	vpq51hym4rk	11	\N	\N	\N
c2f9t3q258l	vpq51hym4rk	12	\N	\N	\N
328zsdxa1d2	vpq51hym4rk	13	\N	\N	\N
bvb25kzrb9u	vpq51hym4rk	14	\N	\N	\N
ncpilr3vsko	vpq51hym4rk	15	\N	\N	\N
we4al08cgrl	vpq51hym4rk	16	\N	\N	\N
ez550wadmjq	vjtnnuqg8ei	5	\N	\N	\N
g5aqieft0p8	vjtnnuqg8ei	6	\N	\N	\N
djk1zx72szz	vjtnnuqg8ei	7	\N	\N	\N
7wh75zbfj6p	vjtnnuqg8ei	8	\N	\N	\N
xi5fumxgwfz	vjtnnuqg8ei	9	\N	\N	\N
i4bhkgolh3x	vjtnnuqg8ei	10	\N	\N	\N
9m9g4daljpc	vjtnnuqg8ei	11	\N	\N	\N
dkwjpd81q5f	vjtnnuqg8ei	12	\N	\N	\N
c2f9t3q258l	vjtnnuqg8ei	13	\N	\N	\N
328zsdxa1d2	vjtnnuqg8ei	14	\N	\N	\N
bvb25kzrb9u	vjtnnuqg8ei	15	\N	\N	\N
ncpilr3vsko	vjtnnuqg8ei	16	\N	\N	\N
we4al08cgrl	vjtnnuqg8ei	17	\N	\N	\N
ez550wadmjq	tmqirlbk0fu	5	\N	\N	\N
g5aqieft0p8	tmqirlbk0fu	6	\N	\N	\N
djk1zx72szz	tmqirlbk0fu	7	\N	\N	\N
7wh75zbfj6p	tmqirlbk0fu	8	\N	\N	\N
xi5fumxgwfz	tmqirlbk0fu	9	\N	\N	\N
i4bhkgolh3x	tmqirlbk0fu	10	\N	\N	\N
9m9g4daljpc	tmqirlbk0fu	11	\N	\N	\N
dkwjpd81q5f	tmqirlbk0fu	12	\N	\N	\N
c2f9t3q258l	tmqirlbk0fu	13	\N	\N	\N
328zsdxa1d2	tmqirlbk0fu	14	\N	\N	\N
bvb25kzrb9u	tmqirlbk0fu	15	\N	\N	\N
ncpilr3vsko	tmqirlbk0fu	16	\N	\N	\N
we4al08cgrl	tmqirlbk0fu	17	\N	\N	\N
g4rjmkihbsy	g4rjmkihbsy	0	f	properties	\N
ez550wadmjq	g4rjmkihbsy	1	\N	\N	1
5lita8v0feg	5lita8v0feg	0	f	properties	\N
l5wrqiy342c	5lita8v0feg	1	\N	\N	1
mpyqf9vtozc	mpyqf9vtozc	0	f	properties	\N
5lita8v0feg	mpyqf9vtozc	1	\N	\N	1
l5wrqiy342c	mpyqf9vtozc	2	\N	\N	1
vjtnnuqg8ei	5lita8v0feg	2	\N	\N	\N
vjtnnuqg8ei	mpyqf9vtozc	3	\N	\N	\N
vpq51hym4rk	l5wrqiy342c	2	\N	\N	\N
vpq51hym4rk	5lita8v0feg	3	\N	\N	\N
vpq51hym4rk	mpyqf9vtozc	4	\N	\N	\N
42fx62lf4zb	l5wrqiy342c	3	\N	\N	\N
42fx62lf4zb	5lita8v0feg	4	\N	\N	\N
42fx62lf4zb	mpyqf9vtozc	5	\N	\N	\N
9dvx7nfzbpm	l5wrqiy342c	4	\N	\N	\N
9dvx7nfzbpm	5lita8v0feg	5	\N	\N	\N
9dvx7nfzbpm	mpyqf9vtozc	6	\N	\N	\N
g4rjmkihbsy	l5wrqiy342c	5	\N	\N	\N
g4rjmkihbsy	5lita8v0feg	6	\N	\N	\N
g4rjmkihbsy	mpyqf9vtozc	7	\N	\N	\N
ez550wadmjq	l5wrqiy342c	6	\N	\N	\N
ez550wadmjq	5lita8v0feg	7	\N	\N	\N
ez550wadmjq	mpyqf9vtozc	8	\N	\N	\N
g5aqieft0p8	l5wrqiy342c	7	\N	\N	\N
g5aqieft0p8	5lita8v0feg	8	\N	\N	\N
g5aqieft0p8	mpyqf9vtozc	9	\N	\N	\N
djk1zx72szz	l5wrqiy342c	8	\N	\N	\N
djk1zx72szz	5lita8v0feg	9	\N	\N	\N
djk1zx72szz	mpyqf9vtozc	10	\N	\N	\N
7wh75zbfj6p	l5wrqiy342c	9	\N	\N	\N
7wh75zbfj6p	5lita8v0feg	10	\N	\N	\N
7wh75zbfj6p	mpyqf9vtozc	11	\N	\N	\N
xi5fumxgwfz	l5wrqiy342c	10	\N	\N	\N
bgkjcva42cs	bgkjcva42cs	0	f	properties	\N
9m9g4daljpc	bgkjcva42cs	2	\N	\N	\N
dkwjpd81q5f	bgkjcva42cs	3	\N	\N	\N
c2f9t3q258l	bgkjcva42cs	4	\N	\N	\N
328zsdxa1d2	bgkjcva42cs	5	\N	\N	\N
bvb25kzrb9u	bgkjcva42cs	6	\N	\N	\N
ncpilr3vsko	bgkjcva42cs	7	\N	\N	\N
we4al08cgrl	bgkjcva42cs	8	\N	\N	\N
i4bhkgolh3x	bgkjcva42cs	1	\N	\N	3
xi5fumxgwfz	5lita8v0feg	11	\N	\N	\N
xi5fumxgwfz	mpyqf9vtozc	12	\N	\N	\N
i4bhkgolh3x	l5wrqiy342c	11	\N	\N	\N
i4bhkgolh3x	5lita8v0feg	12	\N	\N	\N
i4bhkgolh3x	mpyqf9vtozc	13	\N	\N	\N
9m9g4daljpc	l5wrqiy342c	12	\N	\N	\N
9m9g4daljpc	5lita8v0feg	13	\N	\N	\N
9m9g4daljpc	mpyqf9vtozc	14	\N	\N	\N
dkwjpd81q5f	l5wrqiy342c	13	\N	\N	\N
dkwjpd81q5f	5lita8v0feg	14	\N	\N	\N
dkwjpd81q5f	mpyqf9vtozc	15	\N	\N	\N
c2f9t3q258l	l5wrqiy342c	14	\N	\N	\N
c2f9t3q258l	5lita8v0feg	15	\N	\N	\N
c2f9t3q258l	mpyqf9vtozc	16	\N	\N	\N
328zsdxa1d2	l5wrqiy342c	15	\N	\N	\N
328zsdxa1d2	5lita8v0feg	16	\N	\N	\N
328zsdxa1d2	mpyqf9vtozc	17	\N	\N	\N
bvb25kzrb9u	l5wrqiy342c	16	\N	\N	\N
bvb25kzrb9u	5lita8v0feg	17	\N	\N	\N
bvb25kzrb9u	mpyqf9vtozc	18	\N	\N	\N
ncpilr3vsko	l5wrqiy342c	17	\N	\N	\N
ncpilr3vsko	5lita8v0feg	18	\N	\N	\N
ncpilr3vsko	mpyqf9vtozc	19	\N	\N	\N
we4al08cgrl	l5wrqiy342c	18	\N	\N	\N
we4al08cgrl	5lita8v0feg	19	\N	\N	\N
we4al08cgrl	mpyqf9vtozc	20	\N	\N	\N
l5wrqiy342c	l5wrqiy342c	0	f	properties	\N
vjtnnuqg8ei	l5wrqiy342c	1	\N	\N	1
are93oh007m	5rlnnzhzvlu	7	\N	\N	\N
9df1glidbni	9df1glidbni	0	f	properties	\N
t232pwljbe6	9df1glidbni	1	\N	\N	1
zw2429v3jsv	zw2429v3jsv	0	f	properties	\N
9df1glidbni	zw2429v3jsv	1	\N	\N	1
t232pwljbe6	zw2429v3jsv	2	\N	\N	1
setmbtb7hr8	5rlnnzhzvlu	8	\N	\N	\N
vjtnnuqg8ei	9df1glidbni	2	\N	\N	\N
vjtnnuqg8ei	zw2429v3jsv	3	\N	\N	\N
vpq51hym4rk	t232pwljbe6	2	\N	\N	\N
vpq51hym4rk	9df1glidbni	3	\N	\N	\N
vpq51hym4rk	zw2429v3jsv	4	\N	\N	\N
42fx62lf4zb	t232pwljbe6	3	\N	\N	\N
42fx62lf4zb	9df1glidbni	4	\N	\N	\N
42fx62lf4zb	zw2429v3jsv	5	\N	\N	\N
9dvx7nfzbpm	t232pwljbe6	4	\N	\N	\N
9dvx7nfzbpm	9df1glidbni	5	\N	\N	\N
9dvx7nfzbpm	zw2429v3jsv	6	\N	\N	\N
g4rjmkihbsy	t232pwljbe6	5	\N	\N	\N
g4rjmkihbsy	9df1glidbni	6	\N	\N	\N
g4rjmkihbsy	zw2429v3jsv	7	\N	\N	\N
ez550wadmjq	t232pwljbe6	6	\N	\N	\N
ez550wadmjq	9df1glidbni	7	\N	\N	\N
ez550wadmjq	zw2429v3jsv	8	\N	\N	\N
g5aqieft0p8	t232pwljbe6	7	\N	\N	\N
g5aqieft0p8	9df1glidbni	8	\N	\N	\N
g5aqieft0p8	zw2429v3jsv	9	\N	\N	\N
djk1zx72szz	t232pwljbe6	8	\N	\N	\N
djk1zx72szz	9df1glidbni	9	\N	\N	\N
djk1zx72szz	zw2429v3jsv	10	\N	\N	\N
7wh75zbfj6p	t232pwljbe6	9	\N	\N	\N
7wh75zbfj6p	9df1glidbni	10	\N	\N	\N
7wh75zbfj6p	zw2429v3jsv	11	\N	\N	\N
xi5fumxgwfz	t232pwljbe6	10	\N	\N	\N
xi5fumxgwfz	9df1glidbni	11	\N	\N	\N
xi5fumxgwfz	zw2429v3jsv	12	\N	\N	\N
i4bhkgolh3x	t232pwljbe6	11	\N	\N	\N
i4bhkgolh3x	9df1glidbni	12	\N	\N	\N
i4bhkgolh3x	zw2429v3jsv	13	\N	\N	\N
9m9g4daljpc	t232pwljbe6	12	\N	\N	\N
9m9g4daljpc	9df1glidbni	13	\N	\N	\N
9m9g4daljpc	zw2429v3jsv	14	\N	\N	\N
dkwjpd81q5f	t232pwljbe6	13	\N	\N	\N
dkwjpd81q5f	9df1glidbni	14	\N	\N	\N
dkwjpd81q5f	zw2429v3jsv	15	\N	\N	\N
c2f9t3q258l	t232pwljbe6	14	\N	\N	\N
c2f9t3q258l	9df1glidbni	15	\N	\N	\N
c2f9t3q258l	zw2429v3jsv	16	\N	\N	\N
328zsdxa1d2	t232pwljbe6	15	\N	\N	\N
328zsdxa1d2	9df1glidbni	16	\N	\N	\N
328zsdxa1d2	zw2429v3jsv	17	\N	\N	\N
bvb25kzrb9u	t232pwljbe6	16	\N	\N	\N
bvb25kzrb9u	9df1glidbni	17	\N	\N	\N
bvb25kzrb9u	zw2429v3jsv	18	\N	\N	\N
ncpilr3vsko	t232pwljbe6	17	\N	\N	\N
ncpilr3vsko	9df1glidbni	18	\N	\N	\N
ncpilr3vsko	zw2429v3jsv	19	\N	\N	\N
we4al08cgrl	t232pwljbe6	18	\N	\N	\N
we4al08cgrl	9df1glidbni	19	\N	\N	\N
we4al08cgrl	zw2429v3jsv	20	\N	\N	\N
t232pwljbe6	t232pwljbe6	0	f	properties	\N
vjtnnuqg8ei	t232pwljbe6	1	\N	\N	2
wwztcvsjpr1	wwztcvsjpr1	0	f	properties	\N
vpq51hym4rk	wwztcvsjpr1	2	\N	\N	\N
42fx62lf4zb	wwztcvsjpr1	3	\N	\N	\N
9dvx7nfzbpm	wwztcvsjpr1	4	\N	\N	\N
g4rjmkihbsy	wwztcvsjpr1	5	\N	\N	\N
ez550wadmjq	wwztcvsjpr1	6	\N	\N	\N
g5aqieft0p8	wwztcvsjpr1	7	\N	\N	\N
djk1zx72szz	wwztcvsjpr1	8	\N	\N	\N
7wh75zbfj6p	wwztcvsjpr1	9	\N	\N	\N
xi5fumxgwfz	wwztcvsjpr1	10	\N	\N	\N
i4bhkgolh3x	wwztcvsjpr1	11	\N	\N	\N
9m9g4daljpc	wwztcvsjpr1	12	\N	\N	\N
dkwjpd81q5f	wwztcvsjpr1	13	\N	\N	\N
c2f9t3q258l	wwztcvsjpr1	14	\N	\N	\N
328zsdxa1d2	wwztcvsjpr1	15	\N	\N	\N
bvb25kzrb9u	wwztcvsjpr1	16	\N	\N	\N
ncpilr3vsko	wwztcvsjpr1	17	\N	\N	\N
we4al08cgrl	wwztcvsjpr1	18	\N	\N	\N
tmqirlbk0fu	wwztcvsjpr1	1	\N	\N	1
i9qj49fo70j	i9qj49fo70j	0	f	properties	\N
4qb8nr54kex	i9qj49fo70j	1	\N	\N	1
rh3ea27v4vx	rh3ea27v4vx	0	f	properties	\N
i9qj49fo70j	rh3ea27v4vx	1	\N	\N	1
4qb8nr54kex	rh3ea27v4vx	2	\N	\N	1
z1gmpts94df	z1gmpts94df	0	f	properties	\N
rh3ea27v4vx	z1gmpts94df	1	\N	\N	1
i9qj49fo70j	z1gmpts94df	2	\N	\N	1
4qb8nr54kex	z1gmpts94df	3	\N	\N	1
owu9hfdyp8n	owu9hfdyp8n	0	f	properties	\N
z1gmpts94df	owu9hfdyp8n	1	\N	\N	1
rh3ea27v4vx	owu9hfdyp8n	2	\N	\N	1
i9qj49fo70j	owu9hfdyp8n	3	\N	\N	1
4qb8nr54kex	owu9hfdyp8n	4	\N	\N	1
7e38fr8xa7m	4qb8nr54kex	2	\N	\N	\N
5wtyj13hh7k	5rlnnzhzvlu	9	\N	\N	\N
v160lx9x03s	5rlnnzhzvlu	10	\N	\N	\N
r34c545vn0o	5rlnnzhzvlu	11	\N	\N	\N
s7ppiu6idan	5rlnnzhzvlu	12	\N	\N	\N
9gg7w4ctvy1	5rlnnzhzvlu	13	\N	\N	\N
4ea0eg22s6f	5rlnnzhzvlu	14	\N	\N	\N
5i6s9h3z12w	5rlnnzhzvlu	15	\N	\N	\N
3o0nafjc9zn	5rlnnzhzvlu	16	\N	\N	\N
p2csprfyzks	i9qj49fo70j	2	\N	\N	\N
7e38fr8xa7m	i9qj49fo70j	3	\N	\N	\N
wpw2zdgvred	5rlnnzhzvlu	17	\N	\N	\N
we4al08cgrl	5rlnnzhzvlu	18	\N	\N	\N
gdl7xj6l7qi	gdl7xj6l7qi	0	f	properties	\N
jw2um47b1kq	9a5cnn8va7i	2	\N	\N	\N
s2j1mca129k	9a5cnn8va7i	3	\N	\N	\N
are93oh007m	9a5cnn8va7i	4	\N	\N	\N
setmbtb7hr8	9a5cnn8va7i	5	\N	\N	\N
5wtyj13hh7k	9a5cnn8va7i	6	\N	\N	\N
p2csprfyzks	rh3ea27v4vx	3	\N	\N	\N
7e38fr8xa7m	rh3ea27v4vx	4	\N	\N	\N
v160lx9x03s	9a5cnn8va7i	7	\N	\N	\N
r34c545vn0o	9a5cnn8va7i	8	\N	\N	\N
s7ppiu6idan	9a5cnn8va7i	9	\N	\N	\N
9gg7w4ctvy1	9a5cnn8va7i	10	\N	\N	\N
4ea0eg22s6f	9a5cnn8va7i	11	\N	\N	\N
5i6s9h3z12w	9a5cnn8va7i	12	\N	\N	\N
3o0nafjc9zn	9a5cnn8va7i	13	\N	\N	\N
wpw2zdgvred	9a5cnn8va7i	14	\N	\N	\N
p2csprfyzks	z1gmpts94df	4	\N	\N	\N
7e38fr8xa7m	z1gmpts94df	5	\N	\N	\N
we4al08cgrl	9a5cnn8va7i	15	\N	\N	\N
9wsmhrm9np0	9yf4qjq6xtn	3	\N	\N	\N
jw2um47b1kq	9yf4qjq6xtn	4	\N	\N	\N
s2j1mca129k	9yf4qjq6xtn	5	\N	\N	\N
are93oh007m	9yf4qjq6xtn	6	\N	\N	\N
setmbtb7hr8	9yf4qjq6xtn	7	\N	\N	\N
5wtyj13hh7k	9yf4qjq6xtn	8	\N	\N	\N
v160lx9x03s	9yf4qjq6xtn	9	\N	\N	\N
p2csprfyzks	owu9hfdyp8n	5	\N	\N	\N
7e38fr8xa7m	owu9hfdyp8n	6	\N	\N	\N
r34c545vn0o	9yf4qjq6xtn	10	\N	\N	\N
s7ppiu6idan	9yf4qjq6xtn	11	\N	\N	\N
9gg7w4ctvy1	9yf4qjq6xtn	12	\N	\N	\N
4ea0eg22s6f	9yf4qjq6xtn	13	\N	\N	\N
5i6s9h3z12w	9yf4qjq6xtn	14	\N	\N	\N
3o0nafjc9zn	9yf4qjq6xtn	15	\N	\N	\N
wpw2zdgvred	9yf4qjq6xtn	16	\N	\N	\N
we4al08cgrl	9yf4qjq6xtn	17	\N	\N	\N
4qb8nr54kex	4qb8nr54kex	0	f	properties	\N
p2csprfyzks	4qb8nr54kex	1	\N	\N	1
hngqmqnskt7	hngqmqnskt7	0	f	properties	\N
wvdoqitff11	hngqmqnskt7	1	\N	\N	1
xv209rfbm74	xv209rfbm74	0	f	properties	\N
hngqmqnskt7	xv209rfbm74	1	\N	\N	1
wvdoqitff11	xv209rfbm74	2	\N	\N	1
ezwhs7icicp	ezwhs7icicp	0	f	properties	\N
xv209rfbm74	ezwhs7icicp	1	\N	\N	1
hngqmqnskt7	ezwhs7icicp	2	\N	\N	1
wvdoqitff11	ezwhs7icicp	3	\N	\N	1
r4q447oud7k	r4q447oud7k	0	f	properties	\N
ezwhs7icicp	r4q447oud7k	1	\N	\N	1
xv209rfbm74	r4q447oud7k	2	\N	\N	1
wvdoqitff11	wvdoqitff11	0	f	properties	\N
9wsmhrm9np0	p86ow4sckcj	5	\N	\N	\N
jw2um47b1kq	p86ow4sckcj	6	\N	\N	\N
s2j1mca129k	p86ow4sckcj	7	\N	\N	\N
are93oh007m	p86ow4sckcj	8	\N	\N	\N
hngqmqnskt7	r4q447oud7k	3	\N	\N	1
wvdoqitff11	r4q447oud7k	4	\N	\N	1
p2csprfyzks	ezwhs7icicp	4	\N	\N	\N
7e38fr8xa7m	ezwhs7icicp	5	\N	\N	\N
setmbtb7hr8	p86ow4sckcj	9	\N	\N	\N
5wtyj13hh7k	p86ow4sckcj	10	\N	\N	\N
v160lx9x03s	p86ow4sckcj	11	\N	\N	\N
r34c545vn0o	p86ow4sckcj	12	\N	\N	\N
s7ppiu6idan	p86ow4sckcj	13	\N	\N	\N
9gg7w4ctvy1	p86ow4sckcj	14	\N	\N	\N
4ea0eg22s6f	p86ow4sckcj	15	\N	\N	\N
5i6s9h3z12w	p86ow4sckcj	16	\N	\N	\N
p2csprfyzks	hngqmqnskt7	2	\N	\N	\N
7e38fr8xa7m	hngqmqnskt7	3	\N	\N	\N
3o0nafjc9zn	p86ow4sckcj	17	\N	\N	\N
wpw2zdgvred	p86ow4sckcj	18	\N	\N	\N
we4al08cgrl	p86ow4sckcj	19	\N	\N	\N
9wsmhrm9np0	yfhnohad6lf	5	\N	\N	\N
jw2um47b1kq	yfhnohad6lf	6	\N	\N	\N
s2j1mca129k	yfhnohad6lf	7	\N	\N	\N
are93oh007m	yfhnohad6lf	8	\N	\N	\N
setmbtb7hr8	yfhnohad6lf	9	\N	\N	\N
p2csprfyzks	r4q447oud7k	5	\N	\N	\N
7e38fr8xa7m	r4q447oud7k	6	\N	\N	\N
5wtyj13hh7k	yfhnohad6lf	10	\N	\N	\N
v160lx9x03s	yfhnohad6lf	11	\N	\N	\N
r34c545vn0o	yfhnohad6lf	12	\N	\N	\N
htkypy9jlt5	htkypy9jlt5	0	f	properties	\N
d0t11ss0foi	htkypy9jlt5	1	\N	\N	2
nnw8hb8g14c	h26r06rfuxj	9	\N	\N	\N
wzegw15krxc	h26r06rfuxj	10	\N	\N	\N
xt1t69pgjvf	h26r06rfuxj	11	\N	\N	\N
7e38fr8xa7m	wvdoqitff11	2	\N	\N	\N
a540x2nf55u	h26r06rfuxj	12	\N	\N	\N
s7ppiu6idan	h26r06rfuxj	13	\N	\N	\N
9gg7w4ctvy1	h26r06rfuxj	14	\N	\N	\N
4ea0eg22s6f	h26r06rfuxj	15	\N	\N	\N
5i6s9h3z12w	h26r06rfuxj	16	\N	\N	\N
3o0nafjc9zn	h26r06rfuxj	17	\N	\N	\N
wpw2zdgvred	h26r06rfuxj	18	\N	\N	\N
we4al08cgrl	h26r06rfuxj	19	\N	\N	\N
p2csprfyzks	xv209rfbm74	3	\N	\N	\N
7e38fr8xa7m	xv209rfbm74	4	\N	\N	\N
7p14adw4n9n	ryvctxlr3ev	2	\N	\N	\N
hxbstnj3c38	ryvctxlr3ev	3	\N	\N	\N
owhsxq5010d	ryvctxlr3ev	4	\N	\N	\N
bx5jcj5t34u	ryvctxlr3ev	5	\N	\N	\N
026mxjz1xlz	ryvctxlr3ev	6	\N	\N	\N
ldb7xlegtqv	ryvctxlr3ev	7	\N	\N	\N
nnw8hb8g14c	ryvctxlr3ev	8	\N	\N	\N
p2csprfyzks	wvdoqitff11	1	\N	\N	2
wzegw15krxc	ryvctxlr3ev	9	\N	\N	\N
4j76jf82r5a	4j76jf82r5a	0	f	properties	\N
xt1t69pgjvf	ryvctxlr3ev	10	\N	\N	\N
a540x2nf55u	ryvctxlr3ev	11	\N	\N	\N
s7ppiu6idan	ryvctxlr3ev	12	\N	\N	\N
9gg7w4ctvy1	ryvctxlr3ev	13	\N	\N	\N
4ea0eg22s6f	ryvctxlr3ev	14	\N	\N	\N
5i6s9h3z12w	ryvctxlr3ev	15	\N	\N	\N
3o0nafjc9zn	ryvctxlr3ev	16	\N	\N	\N
wpw2zdgvred	ryvctxlr3ev	17	\N	\N	\N
we4al08cgrl	ryvctxlr3ev	18	\N	\N	\N
d0t11ss0foi	ryvctxlr3ev	1	\N	\N	1
r4q447oud7k	4j76jf82r5a	1	\N	\N	1
azb0rag4ld3	azb0rag4ld3	0	f	properties	\N
4j76jf82r5a	azb0rag4ld3	1	\N	\N	1
1ynmaa4okbi	1ynmaa4okbi	0	f	properties	\N
azb0rag4ld3	1ynmaa4okbi	1	\N	\N	1
4j76jf82r5a	1ynmaa4okbi	2	\N	\N	1
pm01lbmd6qj	pm01lbmd6qj	0	f	properties	\N
1ynmaa4okbi	pm01lbmd6qj	1	\N	\N	1
azb0rag4ld3	pm01lbmd6qj	2	\N	\N	1
4j76jf82r5a	pm01lbmd6qj	3	\N	\N	1
xjaoqfqvp89	xjaoqfqvp89	0	f	properties	\N
pm01lbmd6qj	xjaoqfqvp89	1	\N	\N	1
1ynmaa4okbi	xjaoqfqvp89	2	\N	\N	1
azb0rag4ld3	xjaoqfqvp89	3	\N	\N	1
4j76jf82r5a	xjaoqfqvp89	4	\N	\N	1
dzyugs0mknh	dzyugs0mknh	0	f	properties	\N
pm01lbmd6qj	dzyugs0mknh	1	\N	\N	2
1ynmaa4okbi	dzyugs0mknh	2	\N	\N	2
azb0rag4ld3	dzyugs0mknh	3	\N	\N	2
4j76jf82r5a	dzyugs0mknh	4	\N	\N	2
r4q447oud7k	1ynmaa4okbi	3	\N	\N	\N
ezwhs7icicp	1ynmaa4okbi	4	\N	\N	\N
xv209rfbm74	1ynmaa4okbi	5	\N	\N	\N
hngqmqnskt7	1ynmaa4okbi	6	\N	\N	\N
wvdoqitff11	1ynmaa4okbi	7	\N	\N	\N
p2csprfyzks	1ynmaa4okbi	8	\N	\N	\N
7e38fr8xa7m	1ynmaa4okbi	9	\N	\N	\N
lyq8fn8u51y	lyq8fn8u51y	0	f	properties	\N
htkypy9jlt5	lyq8fn8u51y	1	\N	\N	1
gtp7svlp0mv	gtp7svlp0mv	0	f	properties	\N
lyq8fn8u51y	gtp7svlp0mv	1	\N	\N	1
htkypy9jlt5	gtp7svlp0mv	2	\N	\N	1
d0t11ss0foi	gtp7svlp0mv	3	\N	\N	\N
7p14adw4n9n	gtp7svlp0mv	4	\N	\N	\N
ezwhs7icicp	4j76jf82r5a	2	\N	\N	\N
xv209rfbm74	4j76jf82r5a	3	\N	\N	\N
hngqmqnskt7	4j76jf82r5a	4	\N	\N	\N
wvdoqitff11	4j76jf82r5a	5	\N	\N	\N
p2csprfyzks	4j76jf82r5a	6	\N	\N	\N
7e38fr8xa7m	4j76jf82r5a	7	\N	\N	\N
hxbstnj3c38	gtp7svlp0mv	5	\N	\N	\N
owhsxq5010d	gtp7svlp0mv	6	\N	\N	\N
bx5jcj5t34u	gtp7svlp0mv	7	\N	\N	\N
026mxjz1xlz	gtp7svlp0mv	8	\N	\N	\N
ldb7xlegtqv	gtp7svlp0mv	9	\N	\N	\N
nnw8hb8g14c	gtp7svlp0mv	10	\N	\N	\N
wzegw15krxc	gtp7svlp0mv	11	\N	\N	\N
xt1t69pgjvf	gtp7svlp0mv	12	\N	\N	\N
r4q447oud7k	azb0rag4ld3	2	\N	\N	\N
ezwhs7icicp	azb0rag4ld3	3	\N	\N	\N
xv209rfbm74	azb0rag4ld3	4	\N	\N	\N
hngqmqnskt7	azb0rag4ld3	5	\N	\N	\N
wvdoqitff11	azb0rag4ld3	6	\N	\N	\N
p2csprfyzks	azb0rag4ld3	7	\N	\N	\N
7e38fr8xa7m	azb0rag4ld3	8	\N	\N	\N
a540x2nf55u	gtp7svlp0mv	13	\N	\N	\N
s7ppiu6idan	gtp7svlp0mv	14	\N	\N	\N
9gg7w4ctvy1	gtp7svlp0mv	15	\N	\N	\N
4ea0eg22s6f	gtp7svlp0mv	16	\N	\N	\N
5i6s9h3z12w	gtp7svlp0mv	17	\N	\N	\N
3o0nafjc9zn	gtp7svlp0mv	18	\N	\N	\N
wpw2zdgvred	gtp7svlp0mv	19	\N	\N	\N
we4al08cgrl	gtp7svlp0mv	20	\N	\N	\N
r4q447oud7k	dzyugs0mknh	5	\N	\N	\N
ezwhs7icicp	dzyugs0mknh	6	\N	\N	\N
xv209rfbm74	dzyugs0mknh	7	\N	\N	\N
hngqmqnskt7	dzyugs0mknh	8	\N	\N	\N
7p14adw4n9n	htkypy9jlt5	2	\N	\N	\N
s7ppiu6idan	yfhnohad6lf	13	\N	\N	\N
9gg7w4ctvy1	yfhnohad6lf	14	\N	\N	\N
4ea0eg22s6f	yfhnohad6lf	15	\N	\N	\N
wvdoqitff11	dzyugs0mknh	9	\N	\N	\N
p2csprfyzks	dzyugs0mknh	10	\N	\N	\N
7e38fr8xa7m	dzyugs0mknh	11	\N	\N	\N
3o0nafjc9zn	3o0nafjc9zn	0	t	properties	\N
wpw2zdgvred	3o0nafjc9zn	1	\N	\N	1
5i6s9h3z12w	5i6s9h3z12w	0	f	properties	\N
3o0nafjc9zn	5i6s9h3z12w	1	\N	\N	1
wpw2zdgvred	5i6s9h3z12w	2	\N	\N	1
we4al08cgrl	3o0nafjc9zn	2	\N	\N	\N
we4al08cgrl	5i6s9h3z12w	3	\N	\N	\N
r4q447oud7k	pm01lbmd6qj	4	\N	\N	\N
ezwhs7icicp	pm01lbmd6qj	5	\N	\N	\N
xv209rfbm74	pm01lbmd6qj	6	\N	\N	\N
hngqmqnskt7	pm01lbmd6qj	7	\N	\N	\N
wvdoqitff11	pm01lbmd6qj	8	\N	\N	\N
p2csprfyzks	pm01lbmd6qj	9	\N	\N	\N
7e38fr8xa7m	pm01lbmd6qj	10	\N	\N	\N
wpw2zdgvred	wpw2zdgvred	0	f	properties	\N
we4al08cgrl	wpw2zdgvred	1	\N	\N	2
5i6s9h3z12w	yfhnohad6lf	16	\N	\N	\N
9gg7w4ctvy1	9gg7w4ctvy1	0	f	properties	\N
4ea0eg22s6f	9gg7w4ctvy1	1	\N	\N	1
s7ppiu6idan	s7ppiu6idan	0	f	properties	\N
9gg7w4ctvy1	s7ppiu6idan	1	\N	\N	1
r4q447oud7k	xjaoqfqvp89	5	\N	\N	\N
ezwhs7icicp	xjaoqfqvp89	6	\N	\N	\N
xv209rfbm74	xjaoqfqvp89	7	\N	\N	\N
hngqmqnskt7	xjaoqfqvp89	8	\N	\N	\N
wvdoqitff11	xjaoqfqvp89	9	\N	\N	\N
p2csprfyzks	xjaoqfqvp89	10	\N	\N	\N
7e38fr8xa7m	xjaoqfqvp89	11	\N	\N	\N
4ea0eg22s6f	s7ppiu6idan	2	\N	\N	1
a540x2nf55u	a540x2nf55u	0	f	properties	\N
s7ppiu6idan	a540x2nf55u	1	\N	\N	1
9gg7w4ctvy1	a540x2nf55u	2	\N	\N	1
4ea0eg22s6f	a540x2nf55u	3	\N	\N	1
r34c545vn0o	r34c545vn0o	0	f	properties	\N
s7ppiu6idan	r34c545vn0o	1	\N	\N	2
9gg7w4ctvy1	r34c545vn0o	2	\N	\N	2
db70kx0u9xg	db70kx0u9xg	0	f	properties	\N
o5mdu88rbat	db70kx0u9xg	1	\N	\N	1
3xghso5i7de	3xghso5i7de	0	f	properties	\N
db70kx0u9xg	3xghso5i7de	1	\N	\N	1
o5mdu88rbat	3xghso5i7de	2	\N	\N	1
xjaoqfqvp89	3xghso5i7de	3	\N	\N	\N
xjaoqfqvp89	db70kx0u9xg	2	\N	\N	\N
pm01lbmd6qj	3xghso5i7de	4	\N	\N	\N
pm01lbmd6qj	db70kx0u9xg	3	\N	\N	\N
pm01lbmd6qj	o5mdu88rbat	2	\N	\N	\N
1ynmaa4okbi	3xghso5i7de	5	\N	\N	\N
1ynmaa4okbi	db70kx0u9xg	4	\N	\N	\N
1ynmaa4okbi	o5mdu88rbat	3	\N	\N	\N
azb0rag4ld3	3xghso5i7de	6	\N	\N	\N
azb0rag4ld3	db70kx0u9xg	5	\N	\N	\N
azb0rag4ld3	o5mdu88rbat	4	\N	\N	\N
4j76jf82r5a	3xghso5i7de	7	\N	\N	\N
4j76jf82r5a	db70kx0u9xg	6	\N	\N	\N
4j76jf82r5a	o5mdu88rbat	5	\N	\N	\N
r4q447oud7k	3xghso5i7de	8	\N	\N	\N
r4q447oud7k	db70kx0u9xg	7	\N	\N	\N
r4q447oud7k	o5mdu88rbat	6	\N	\N	\N
ezwhs7icicp	3xghso5i7de	9	\N	\N	\N
ezwhs7icicp	db70kx0u9xg	8	\N	\N	\N
ezwhs7icicp	o5mdu88rbat	7	\N	\N	\N
xv209rfbm74	3xghso5i7de	10	\N	\N	\N
xv209rfbm74	db70kx0u9xg	9	\N	\N	\N
xv209rfbm74	o5mdu88rbat	8	\N	\N	\N
hngqmqnskt7	3xghso5i7de	11	\N	\N	\N
hngqmqnskt7	db70kx0u9xg	10	\N	\N	\N
hngqmqnskt7	o5mdu88rbat	9	\N	\N	\N
wvdoqitff11	3xghso5i7de	12	\N	\N	\N
wvdoqitff11	db70kx0u9xg	11	\N	\N	\N
wvdoqitff11	o5mdu88rbat	10	\N	\N	\N
p2csprfyzks	3xghso5i7de	13	\N	\N	\N
p2csprfyzks	db70kx0u9xg	12	\N	\N	\N
p2csprfyzks	o5mdu88rbat	11	\N	\N	\N
7e38fr8xa7m	3xghso5i7de	14	\N	\N	\N
7e38fr8xa7m	db70kx0u9xg	13	\N	\N	\N
7e38fr8xa7m	o5mdu88rbat	12	\N	\N	\N
4ea0eg22s6f	r34c545vn0o	3	\N	\N	2
3o0nafjc9zn	yfhnohad6lf	17	\N	\N	\N
wpw2zdgvred	yfhnohad6lf	18	\N	\N	\N
we4al08cgrl	yfhnohad6lf	19	\N	\N	\N
9a5cnn8va7i	9a5cnn8va7i	0	f	properties	\N
5wtyj13hh7k	5wtyj13hh7k	0	f	properties	\N
v160lx9x03s	5wtyj13hh7k	1	\N	\N	1
9wsmhrm9np0	9a5cnn8va7i	1	\N	\N	1
62dv0mb7ltw	gdl7xj6l7qi	1	\N	\N	1
nz5ub7gvta2	nz5ub7gvta2	0	f	properties	\N
47saxh0jk89	nz5ub7gvta2	1	\N	\N	1
le399fvh3f7	le399fvh3f7	0	f	properties	\N
nz5ub7gvta2	le399fvh3f7	1	\N	\N	1
5i6s9h3z12w	9gg7w4ctvy1	2	\N	\N	\N
5i6s9h3z12w	a540x2nf55u	4	\N	\N	\N
5i6s9h3z12w	r34c545vn0o	4	\N	\N	\N
5i6s9h3z12w	s7ppiu6idan	3	\N	\N	\N
47saxh0jk89	le399fvh3f7	2	\N	\N	1
3o0nafjc9zn	4ea0eg22s6f	2	\N	\N	\N
l9p9ulc5ojf	62dv0mb7ltw	5	\N	\N	\N
3o0nafjc9zn	9gg7w4ctvy1	3	\N	\N	\N
3o0nafjc9zn	a540x2nf55u	5	\N	\N	\N
3o0nafjc9zn	r34c545vn0o	5	\N	\N	\N
o5mdu88rbat	o5mdu88rbat	0	f	properties	\N
xjaoqfqvp89	o5mdu88rbat	1	\N	\N	1
3o0nafjc9zn	s7ppiu6idan	4	\N	\N	\N
i2q3e18hrq7	i2q3e18hrq7	0	f	properties	\N
opghijwqudd	i2q3e18hrq7	1	\N	\N	1
9qjt9w43tfo	9qjt9w43tfo	0	f	properties	\N
i2q3e18hrq7	9qjt9w43tfo	1	\N	\N	1
opghijwqudd	9qjt9w43tfo	2	\N	\N	1
xjaoqfqvp89	9qjt9w43tfo	3	\N	\N	\N
xjaoqfqvp89	i2q3e18hrq7	2	\N	\N	\N
pm01lbmd6qj	9qjt9w43tfo	4	\N	\N	\N
pm01lbmd6qj	i2q3e18hrq7	3	\N	\N	\N
pm01lbmd6qj	opghijwqudd	2	\N	\N	\N
1ynmaa4okbi	9qjt9w43tfo	5	\N	\N	\N
1ynmaa4okbi	i2q3e18hrq7	4	\N	\N	\N
1ynmaa4okbi	opghijwqudd	3	\N	\N	\N
azb0rag4ld3	9qjt9w43tfo	6	\N	\N	\N
azb0rag4ld3	i2q3e18hrq7	5	\N	\N	\N
azb0rag4ld3	opghijwqudd	4	\N	\N	\N
4j76jf82r5a	9qjt9w43tfo	7	\N	\N	\N
4j76jf82r5a	i2q3e18hrq7	6	\N	\N	\N
4j76jf82r5a	opghijwqudd	5	\N	\N	\N
r4q447oud7k	9qjt9w43tfo	8	\N	\N	\N
r4q447oud7k	i2q3e18hrq7	7	\N	\N	\N
r4q447oud7k	opghijwqudd	6	\N	\N	\N
ezwhs7icicp	9qjt9w43tfo	9	\N	\N	\N
ezwhs7icicp	i2q3e18hrq7	8	\N	\N	\N
ezwhs7icicp	opghijwqudd	7	\N	\N	\N
xv209rfbm74	9qjt9w43tfo	10	\N	\N	\N
wpw2zdgvred	4ea0eg22s6f	3	\N	\N	\N
v160lx9x03s	v160lx9x03s	0	f	properties	\N
xv209rfbm74	i2q3e18hrq7	9	\N	\N	\N
xv209rfbm74	opghijwqudd	8	\N	\N	\N
hngqmqnskt7	9qjt9w43tfo	11	\N	\N	\N
hngqmqnskt7	i2q3e18hrq7	10	\N	\N	\N
hngqmqnskt7	opghijwqudd	9	\N	\N	\N
wvdoqitff11	9qjt9w43tfo	12	\N	\N	\N
wvdoqitff11	i2q3e18hrq7	11	\N	\N	\N
wvdoqitff11	opghijwqudd	10	\N	\N	\N
p2csprfyzks	9qjt9w43tfo	13	\N	\N	\N
p2csprfyzks	i2q3e18hrq7	12	\N	\N	\N
p2csprfyzks	opghijwqudd	11	\N	\N	\N
7e38fr8xa7m	9qjt9w43tfo	14	\N	\N	\N
7e38fr8xa7m	i2q3e18hrq7	13	\N	\N	\N
7e38fr8xa7m	opghijwqudd	12	\N	\N	\N
5rlnnzhzvlu	47saxh0jk89	2	\N	\N	\N
wpw2zdgvred	9gg7w4ctvy1	4	\N	\N	\N
wpw2zdgvred	a540x2nf55u	6	\N	\N	\N
wpw2zdgvred	r34c545vn0o	6	\N	\N	\N
wpw2zdgvred	s7ppiu6idan	5	\N	\N	\N
9yf4qjq6xtn	47saxh0jk89	3	\N	\N	\N
we4al08cgrl	4ea0eg22s6f	4	\N	\N	\N
1dsb6ktfpw0	47saxh0jk89	4	\N	\N	\N
we4al08cgrl	9gg7w4ctvy1	5	\N	\N	\N
we4al08cgrl	a540x2nf55u	7	\N	\N	\N
we4al08cgrl	r34c545vn0o	7	\N	\N	\N
we4al08cgrl	s7ppiu6idan	6	\N	\N	\N
9a5cnn8va7i	47saxh0jk89	5	\N	\N	\N
4ea0eg22s6f	4ea0eg22s6f	0	f	properties	\N
5i6s9h3z12w	4ea0eg22s6f	1	\N	\N	1
b28wgjmjdko	b28wgjmjdko	0	f	properties	\N
esr4bnh1yq4	b28wgjmjdko	1	\N	\N	1
r34c545vn0o	b28wgjmjdko	2	\N	\N	\N
s7ppiu6idan	b28wgjmjdko	3	\N	\N	\N
s7ppiu6idan	esr4bnh1yq4	2	\N	\N	\N
9gg7w4ctvy1	b28wgjmjdko	4	\N	\N	\N
9gg7w4ctvy1	esr4bnh1yq4	3	\N	\N	\N
opghijwqudd	opghijwqudd	0	f	properties	\N
xjaoqfqvp89	opghijwqudd	1	\N	\N	2
awzku0rmhqf	awzku0rmhqf	0	f	properties	\N
pm01lbmd6qj	awzku0rmhqf	2	\N	\N	\N
1ynmaa4okbi	awzku0rmhqf	3	\N	\N	\N
azb0rag4ld3	awzku0rmhqf	4	\N	\N	\N
4j76jf82r5a	awzku0rmhqf	5	\N	\N	\N
r4q447oud7k	awzku0rmhqf	6	\N	\N	\N
ezwhs7icicp	awzku0rmhqf	7	\N	\N	\N
xv209rfbm74	awzku0rmhqf	8	\N	\N	\N
hngqmqnskt7	awzku0rmhqf	9	\N	\N	\N
wvdoqitff11	awzku0rmhqf	10	\N	\N	\N
p2csprfyzks	awzku0rmhqf	11	\N	\N	\N
7e38fr8xa7m	awzku0rmhqf	12	\N	\N	\N
4ea0eg22s6f	b28wgjmjdko	5	\N	\N	\N
4ea0eg22s6f	esr4bnh1yq4	4	\N	\N	\N
5i6s9h3z12w	b28wgjmjdko	6	\N	\N	\N
5i6s9h3z12w	esr4bnh1yq4	5	\N	\N	\N
3o0nafjc9zn	b28wgjmjdko	7	\N	\N	\N
3o0nafjc9zn	esr4bnh1yq4	6	\N	\N	\N
wpw2zdgvred	b28wgjmjdko	8	\N	\N	\N
wpw2zdgvred	esr4bnh1yq4	7	\N	\N	\N
dzyugs0mknh	awzku0rmhqf	1	\N	\N	1
8g2rp9ye3m4	8g2rp9ye3m4	0	f	properties	\N
k6bw6nt922r	8g2rp9ye3m4	1	\N	\N	1
28s9demo7cg	28s9demo7cg	0	f	properties	\N
8g2rp9ye3m4	28s9demo7cg	1	\N	\N	1
k6bw6nt922r	28s9demo7cg	2	\N	\N	1
xf7n1l4jksl	xf7n1l4jksl	0	f	properties	\N
28s9demo7cg	xf7n1l4jksl	1	\N	\N	1
8g2rp9ye3m4	xf7n1l4jksl	2	\N	\N	1
k6bw6nt922r	xf7n1l4jksl	3	\N	\N	1
3dwbb3xc7q8	3dwbb3xc7q8	0	f	properties	\N
xf7n1l4jksl	3dwbb3xc7q8	1	\N	\N	1
28s9demo7cg	3dwbb3xc7q8	2	\N	\N	1
8g2rp9ye3m4	3dwbb3xc7q8	3	\N	\N	1
k6bw6nt922r	3dwbb3xc7q8	4	\N	\N	1
epxu1zrlga3	epxu1zrlga3	0	f	properties	\N
xf7n1l4jksl	epxu1zrlga3	1	\N	\N	2
28s9demo7cg	epxu1zrlga3	2	\N	\N	2
8g2rp9ye3m4	epxu1zrlga3	3	\N	\N	2
k6bw6nt922r	epxu1zrlga3	4	\N	\N	2
owu9hfdyp8n	28s9demo7cg	3	\N	\N	\N
z1gmpts94df	28s9demo7cg	4	\N	\N	\N
rh3ea27v4vx	28s9demo7cg	5	\N	\N	\N
i9qj49fo70j	28s9demo7cg	6	\N	\N	\N
4qb8nr54kex	28s9demo7cg	7	\N	\N	\N
p2csprfyzks	28s9demo7cg	8	\N	\N	\N
7e38fr8xa7m	28s9demo7cg	9	\N	\N	\N
we4al08cgrl	b28wgjmjdko	9	\N	\N	\N
we4al08cgrl	esr4bnh1yq4	8	\N	\N	\N
esr4bnh1yq4	esr4bnh1yq4	0	f	properties	\N
r34c545vn0o	esr4bnh1yq4	1	\N	\N	2
o7mmcfangbx	o7mmcfangbx	0	f	properties	\N
iym4gn7wdt2	o7mmcfangbx	1	\N	\N	1
owu9hfdyp8n	3dwbb3xc7q8	5	\N	\N	\N
z1gmpts94df	3dwbb3xc7q8	6	\N	\N	\N
rh3ea27v4vx	3dwbb3xc7q8	7	\N	\N	\N
i9qj49fo70j	3dwbb3xc7q8	8	\N	\N	\N
4qb8nr54kex	3dwbb3xc7q8	9	\N	\N	\N
p2csprfyzks	3dwbb3xc7q8	10	\N	\N	\N
7e38fr8xa7m	3dwbb3xc7q8	11	\N	\N	\N
r34c545vn0o	o7mmcfangbx	2	\N	\N	\N
s7ppiu6idan	iym4gn7wdt2	2	\N	\N	\N
s7ppiu6idan	o7mmcfangbx	3	\N	\N	\N
9gg7w4ctvy1	iym4gn7wdt2	3	\N	\N	\N
9gg7w4ctvy1	o7mmcfangbx	4	\N	\N	\N
4ea0eg22s6f	iym4gn7wdt2	4	\N	\N	\N
4ea0eg22s6f	o7mmcfangbx	5	\N	\N	\N
5i6s9h3z12w	iym4gn7wdt2	5	\N	\N	\N
owu9hfdyp8n	8g2rp9ye3m4	2	\N	\N	\N
z1gmpts94df	8g2rp9ye3m4	3	\N	\N	\N
rh3ea27v4vx	8g2rp9ye3m4	4	\N	\N	\N
i9qj49fo70j	8g2rp9ye3m4	5	\N	\N	\N
4qb8nr54kex	8g2rp9ye3m4	6	\N	\N	\N
p2csprfyzks	8g2rp9ye3m4	7	\N	\N	\N
7e38fr8xa7m	8g2rp9ye3m4	8	\N	\N	\N
5i6s9h3z12w	o7mmcfangbx	6	\N	\N	\N
3o0nafjc9zn	iym4gn7wdt2	6	\N	\N	\N
3o0nafjc9zn	o7mmcfangbx	7	\N	\N	\N
wpw2zdgvred	iym4gn7wdt2	7	\N	\N	\N
wpw2zdgvred	o7mmcfangbx	8	\N	\N	\N
we4al08cgrl	iym4gn7wdt2	8	\N	\N	\N
we4al08cgrl	o7mmcfangbx	9	\N	\N	\N
iym4gn7wdt2	iym4gn7wdt2	0	f	properties	\N
owu9hfdyp8n	epxu1zrlga3	5	\N	\N	\N
z1gmpts94df	epxu1zrlga3	6	\N	\N	\N
rh3ea27v4vx	epxu1zrlga3	7	\N	\N	\N
i9qj49fo70j	epxu1zrlga3	8	\N	\N	\N
4qb8nr54kex	epxu1zrlga3	9	\N	\N	\N
p2csprfyzks	epxu1zrlga3	10	\N	\N	\N
7e38fr8xa7m	epxu1zrlga3	11	\N	\N	\N
k6bw6nt922r	k6bw6nt922r	0	f	properties	\N
r34c545vn0o	iym4gn7wdt2	1	\N	\N	3
ooax88j3yzb	ooax88j3yzb	0	f	properties	\N
9wsmhrm9np0	47saxh0jk89	6	\N	\N	\N
jw2um47b1kq	47saxh0jk89	7	\N	\N	\N
uyzkt653clg	uyzkt653clg	0	f	properties	\N
ooax88j3yzb	uyzkt653clg	1	\N	\N	1
l9p9ulc5ojf	gdl7xj6l7qi	6	\N	\N	\N
r34c545vn0o	uyzkt653clg	2	\N	\N	\N
s7ppiu6idan	ooax88j3yzb	2	\N	\N	\N
s7ppiu6idan	uyzkt653clg	3	\N	\N	\N
9gg7w4ctvy1	ooax88j3yzb	3	\N	\N	\N
9gg7w4ctvy1	uyzkt653clg	4	\N	\N	\N
z1gmpts94df	k6bw6nt922r	2	\N	\N	\N
rh3ea27v4vx	k6bw6nt922r	3	\N	\N	\N
i9qj49fo70j	k6bw6nt922r	4	\N	\N	\N
4qb8nr54kex	k6bw6nt922r	5	\N	\N	\N
p2csprfyzks	k6bw6nt922r	6	\N	\N	\N
7e38fr8xa7m	k6bw6nt922r	7	\N	\N	\N
4ea0eg22s6f	ooax88j3yzb	4	\N	\N	\N
4ea0eg22s6f	uyzkt653clg	5	\N	\N	\N
5i6s9h3z12w	ooax88j3yzb	5	\N	\N	\N
5i6s9h3z12w	uyzkt653clg	6	\N	\N	\N
3o0nafjc9zn	ooax88j3yzb	6	\N	\N	\N
3o0nafjc9zn	uyzkt653clg	7	\N	\N	\N
wpw2zdgvred	ooax88j3yzb	7	\N	\N	\N
wpw2zdgvred	uyzkt653clg	8	\N	\N	\N
owu9hfdyp8n	xf7n1l4jksl	4	\N	\N	\N
z1gmpts94df	xf7n1l4jksl	5	\N	\N	\N
rh3ea27v4vx	xf7n1l4jksl	6	\N	\N	\N
i9qj49fo70j	xf7n1l4jksl	7	\N	\N	\N
4qb8nr54kex	xf7n1l4jksl	8	\N	\N	\N
p2csprfyzks	xf7n1l4jksl	9	\N	\N	\N
7e38fr8xa7m	xf7n1l4jksl	10	\N	\N	\N
we4al08cgrl	ooax88j3yzb	8	\N	\N	\N
we4al08cgrl	uyzkt653clg	9	\N	\N	\N
6l2w82vknwa	6l2w82vknwa	0	f	properties	\N
gh97bqcvw4r	6l2w82vknwa	1	\N	\N	1
r34c545vn0o	6l2w82vknwa	2	\N	\N	\N
owu9hfdyp8n	k6bw6nt922r	1	\N	\N	1
ltgjpq6zk6e	ltgjpq6zk6e	0	f	properties	\N
dc3a24ug4ro	ltgjpq6zk6e	1	\N	\N	1
z4jurrahhqw	z4jurrahhqw	0	f	properties	\N
ltgjpq6zk6e	z4jurrahhqw	1	\N	\N	1
dc3a24ug4ro	z4jurrahhqw	2	\N	\N	1
epxu1zrlga3	ltgjpq6zk6e	2	\N	\N	\N
epxu1zrlga3	z4jurrahhqw	3	\N	\N	\N
xf7n1l4jksl	dc3a24ug4ro	2	\N	\N	\N
xf7n1l4jksl	ltgjpq6zk6e	3	\N	\N	\N
xf7n1l4jksl	z4jurrahhqw	4	\N	\N	\N
28s9demo7cg	dc3a24ug4ro	3	\N	\N	\N
28s9demo7cg	ltgjpq6zk6e	4	\N	\N	\N
28s9demo7cg	z4jurrahhqw	5	\N	\N	\N
8g2rp9ye3m4	dc3a24ug4ro	4	\N	\N	\N
8g2rp9ye3m4	ltgjpq6zk6e	5	\N	\N	\N
8g2rp9ye3m4	z4jurrahhqw	6	\N	\N	\N
k6bw6nt922r	dc3a24ug4ro	5	\N	\N	\N
k6bw6nt922r	ltgjpq6zk6e	6	\N	\N	\N
k6bw6nt922r	z4jurrahhqw	7	\N	\N	\N
owu9hfdyp8n	dc3a24ug4ro	6	\N	\N	\N
owu9hfdyp8n	ltgjpq6zk6e	7	\N	\N	\N
owu9hfdyp8n	z4jurrahhqw	8	\N	\N	\N
z1gmpts94df	dc3a24ug4ro	7	\N	\N	\N
z1gmpts94df	ltgjpq6zk6e	8	\N	\N	\N
z1gmpts94df	z4jurrahhqw	9	\N	\N	\N
rh3ea27v4vx	dc3a24ug4ro	8	\N	\N	\N
rh3ea27v4vx	ltgjpq6zk6e	9	\N	\N	\N
rh3ea27v4vx	z4jurrahhqw	10	\N	\N	\N
i9qj49fo70j	dc3a24ug4ro	9	\N	\N	\N
i9qj49fo70j	ltgjpq6zk6e	10	\N	\N	\N
i9qj49fo70j	z4jurrahhqw	11	\N	\N	\N
4qb8nr54kex	dc3a24ug4ro	10	\N	\N	\N
4qb8nr54kex	ltgjpq6zk6e	11	\N	\N	\N
4qb8nr54kex	z4jurrahhqw	12	\N	\N	\N
p2csprfyzks	dc3a24ug4ro	11	\N	\N	\N
p2csprfyzks	ltgjpq6zk6e	12	\N	\N	\N
p2csprfyzks	z4jurrahhqw	13	\N	\N	\N
7e38fr8xa7m	dc3a24ug4ro	12	\N	\N	\N
7e38fr8xa7m	ltgjpq6zk6e	13	\N	\N	\N
7e38fr8xa7m	z4jurrahhqw	14	\N	\N	\N
s7ppiu6idan	6l2w82vknwa	3	\N	\N	\N
s7ppiu6idan	gh97bqcvw4r	2	\N	\N	\N
9gg7w4ctvy1	6l2w82vknwa	4	\N	\N	\N
9gg7w4ctvy1	gh97bqcvw4r	3	\N	\N	\N
4ea0eg22s6f	6l2w82vknwa	5	\N	\N	\N
4ea0eg22s6f	gh97bqcvw4r	4	\N	\N	\N
5i6s9h3z12w	6l2w82vknwa	6	\N	\N	\N
5i6s9h3z12w	gh97bqcvw4r	5	\N	\N	\N
3o0nafjc9zn	6l2w82vknwa	7	\N	\N	\N
3o0nafjc9zn	gh97bqcvw4r	6	\N	\N	\N
wpw2zdgvred	6l2w82vknwa	8	\N	\N	\N
wpw2zdgvred	gh97bqcvw4r	7	\N	\N	\N
we4al08cgrl	6l2w82vknwa	9	\N	\N	\N
we4al08cgrl	gh97bqcvw4r	8	\N	\N	\N
gh97bqcvw4r	gh97bqcvw4r	0	f	properties	\N
kuxb9m62gau	kuxb9m62gau	0	f	properties	\N
28fjk12kdqn	kuxb9m62gau	1	\N	\N	1
xnnjkcrpivt	xnnjkcrpivt	0	f	properties	\N
kuxb9m62gau	xnnjkcrpivt	1	\N	\N	1
28fjk12kdqn	xnnjkcrpivt	2	\N	\N	1
pujioj8krv0	pujioj8krv0	0	f	properties	\N
xnnjkcrpivt	pujioj8krv0	1	\N	\N	1
dc3a24ug4ro	dc3a24ug4ro	0	f	properties	\N
epxu1zrlga3	dc3a24ug4ro	1	\N	\N	1
zpfkanx7xeh	zpfkanx7xeh	0	f	properties	\N
3h47wtgjzlg	zpfkanx7xeh	1	\N	\N	1
9tlwx5sdtsv	9tlwx5sdtsv	0	f	properties	\N
zpfkanx7xeh	9tlwx5sdtsv	1	\N	\N	1
3h47wtgjzlg	9tlwx5sdtsv	2	\N	\N	1
epxu1zrlga3	zpfkanx7xeh	2	\N	\N	\N
epxu1zrlga3	9tlwx5sdtsv	3	\N	\N	\N
xf7n1l4jksl	3h47wtgjzlg	2	\N	\N	\N
xf7n1l4jksl	zpfkanx7xeh	3	\N	\N	\N
xf7n1l4jksl	9tlwx5sdtsv	4	\N	\N	\N
28s9demo7cg	3h47wtgjzlg	3	\N	\N	\N
28s9demo7cg	zpfkanx7xeh	4	\N	\N	\N
28s9demo7cg	9tlwx5sdtsv	5	\N	\N	\N
8g2rp9ye3m4	3h47wtgjzlg	4	\N	\N	\N
8g2rp9ye3m4	zpfkanx7xeh	5	\N	\N	\N
8g2rp9ye3m4	9tlwx5sdtsv	6	\N	\N	\N
k6bw6nt922r	3h47wtgjzlg	5	\N	\N	\N
k6bw6nt922r	zpfkanx7xeh	6	\N	\N	\N
k6bw6nt922r	9tlwx5sdtsv	7	\N	\N	\N
owu9hfdyp8n	3h47wtgjzlg	6	\N	\N	\N
owu9hfdyp8n	zpfkanx7xeh	7	\N	\N	\N
owu9hfdyp8n	9tlwx5sdtsv	8	\N	\N	\N
z1gmpts94df	3h47wtgjzlg	7	\N	\N	\N
z1gmpts94df	zpfkanx7xeh	8	\N	\N	\N
z1gmpts94df	9tlwx5sdtsv	9	\N	\N	\N
rh3ea27v4vx	3h47wtgjzlg	8	\N	\N	\N
3h47wtgjzlg	3h47wtgjzlg	0	f	properties	\N
epxu1zrlga3	3h47wtgjzlg	1	\N	\N	2
kuxb9m62gau	pujioj8krv0	2	\N	\N	1
28fjk12kdqn	pujioj8krv0	3	\N	\N	1
74wiu3prkat	74wiu3prkat	0	f	properties	\N
28fjk12kdqn	28fjk12kdqn	0	f	properties	\N
s2j1mca129k	47saxh0jk89	8	\N	\N	\N
rh3ea27v4vx	zpfkanx7xeh	9	\N	\N	\N
rh3ea27v4vx	9tlwx5sdtsv	10	\N	\N	\N
i9qj49fo70j	3h47wtgjzlg	9	\N	\N	\N
i9qj49fo70j	zpfkanx7xeh	10	\N	\N	\N
i9qj49fo70j	9tlwx5sdtsv	11	\N	\N	\N
4qb8nr54kex	3h47wtgjzlg	10	\N	\N	\N
4qb8nr54kex	zpfkanx7xeh	11	\N	\N	\N
4qb8nr54kex	9tlwx5sdtsv	12	\N	\N	\N
p2csprfyzks	3h47wtgjzlg	11	\N	\N	\N
p2csprfyzks	zpfkanx7xeh	12	\N	\N	\N
p2csprfyzks	9tlwx5sdtsv	13	\N	\N	\N
7e38fr8xa7m	3h47wtgjzlg	12	\N	\N	\N
7e38fr8xa7m	zpfkanx7xeh	13	\N	\N	\N
7e38fr8xa7m	9tlwx5sdtsv	14	\N	\N	\N
pujioj8krv0	74wiu3prkat	1	\N	\N	1
xnnjkcrpivt	74wiu3prkat	2	\N	\N	1
kuxb9m62gau	74wiu3prkat	3	\N	\N	1
28fjk12kdqn	74wiu3prkat	4	\N	\N	1
5wtyj13hh7k	74wiu3prkat	5	\N	\N	\N
5wtyj13hh7k	kuxb9m62gau	2	\N	\N	\N
5wtyj13hh7k	pujioj8krv0	4	\N	\N	\N
5wtyj13hh7k	xnnjkcrpivt	3	\N	\N	\N
v160lx9x03s	28fjk12kdqn	2	\N	\N	\N
v160lx9x03s	74wiu3prkat	6	\N	\N	\N
v160lx9x03s	kuxb9m62gau	3	\N	\N	\N
v160lx9x03s	pujioj8krv0	5	\N	\N	\N
v160lx9x03s	xnnjkcrpivt	4	\N	\N	\N
are93oh007m	47saxh0jk89	9	\N	\N	\N
setmbtb7hr8	47saxh0jk89	10	\N	\N	\N
5wtyj13hh7k	47saxh0jk89	11	\N	\N	\N
v160lx9x03s	47saxh0jk89	12	\N	\N	\N
r34c545vn0o	47saxh0jk89	13	\N	\N	\N
s7ppiu6idan	47saxh0jk89	14	\N	\N	\N
9gg7w4ctvy1	47saxh0jk89	15	\N	\N	\N
4ea0eg22s6f	47saxh0jk89	16	\N	\N	\N
5i6s9h3z12w	47saxh0jk89	17	\N	\N	\N
3o0nafjc9zn	47saxh0jk89	18	\N	\N	\N
wpw2zdgvred	47saxh0jk89	19	\N	\N	\N
we4al08cgrl	47saxh0jk89	20	\N	\N	\N
p86ow4sckcj	le399fvh3f7	3	\N	\N	\N
5rlnnzhzvlu	le399fvh3f7	4	\N	\N	\N
xf7n1l4jksl	awxbyrawxmp	2	\N	\N	\N
28s9demo7cg	awxbyrawxmp	3	\N	\N	\N
8g2rp9ye3m4	awxbyrawxmp	4	\N	\N	\N
k6bw6nt922r	awxbyrawxmp	5	\N	\N	\N
owu9hfdyp8n	awxbyrawxmp	6	\N	\N	\N
z1gmpts94df	awxbyrawxmp	7	\N	\N	\N
rh3ea27v4vx	awxbyrawxmp	8	\N	\N	\N
i9qj49fo70j	awxbyrawxmp	9	\N	\N	\N
4qb8nr54kex	awxbyrawxmp	10	\N	\N	\N
p2csprfyzks	awxbyrawxmp	11	\N	\N	\N
7e38fr8xa7m	awxbyrawxmp	12	\N	\N	\N
9yf4qjq6xtn	le399fvh3f7	5	\N	\N	\N
1dsb6ktfpw0	le399fvh3f7	6	\N	\N	\N
9a5cnn8va7i	le399fvh3f7	7	\N	\N	\N
9wsmhrm9np0	le399fvh3f7	8	\N	\N	\N
jw2um47b1kq	le399fvh3f7	9	\N	\N	\N
s2j1mca129k	le399fvh3f7	10	\N	\N	\N
are93oh007m	le399fvh3f7	11	\N	\N	\N
setmbtb7hr8	le399fvh3f7	12	\N	\N	\N
5wtyj13hh7k	le399fvh3f7	13	\N	\N	\N
v160lx9x03s	le399fvh3f7	14	\N	\N	\N
r34c545vn0o	le399fvh3f7	15	\N	\N	\N
s7ppiu6idan	le399fvh3f7	16	\N	\N	\N
9gg7w4ctvy1	le399fvh3f7	17	\N	\N	\N
4ea0eg22s6f	le399fvh3f7	18	\N	\N	\N
5i6s9h3z12w	le399fvh3f7	19	\N	\N	\N
3o0nafjc9zn	le399fvh3f7	20	\N	\N	\N
wpw2zdgvred	le399fvh3f7	21	\N	\N	\N
we4al08cgrl	le399fvh3f7	22	\N	\N	\N
p86ow4sckcj	nz5ub7gvta2	2	\N	\N	\N
5rlnnzhzvlu	nz5ub7gvta2	3	\N	\N	\N
9yf4qjq6xtn	nz5ub7gvta2	4	\N	\N	\N
1dsb6ktfpw0	nz5ub7gvta2	5	\N	\N	\N
9a5cnn8va7i	nz5ub7gvta2	6	\N	\N	\N
9wsmhrm9np0	nz5ub7gvta2	7	\N	\N	\N
jw2um47b1kq	nz5ub7gvta2	8	\N	\N	\N
s2j1mca129k	nz5ub7gvta2	9	\N	\N	\N
5wtyj13hh7k	28fjk12kdqn	1	\N	\N	1
are93oh007m	nz5ub7gvta2	10	\N	\N	\N
are93oh007m	are93oh007m	0	f	properties	\N
setmbtb7hr8	are93oh007m	1	\N	\N	1
s2j1mca129k	s2j1mca129k	0	f	properties	\N
are93oh007m	s2j1mca129k	1	\N	\N	1
setmbtb7hr8	s2j1mca129k	2	\N	\N	1
jw2um47b1kq	jw2um47b1kq	0	f	properties	\N
s2j1mca129k	jw2um47b1kq	1	\N	\N	1
are93oh007m	jw2um47b1kq	2	\N	\N	1
setmbtb7hr8	jw2um47b1kq	3	\N	\N	1
9wsmhrm9np0	9wsmhrm9np0	0	f	properties	\N
jw2um47b1kq	9wsmhrm9np0	1	\N	\N	1
s2j1mca129k	9wsmhrm9np0	2	\N	\N	1
are93oh007m	9wsmhrm9np0	3	\N	\N	1
setmbtb7hr8	9wsmhrm9np0	4	\N	\N	1
5wtyj13hh7k	9wsmhrm9np0	5	\N	\N	\N
5wtyj13hh7k	are93oh007m	2	\N	\N	\N
5wtyj13hh7k	jw2um47b1kq	4	\N	\N	\N
5wtyj13hh7k	s2j1mca129k	3	\N	\N	\N
setmbtb7hr8	nz5ub7gvta2	11	\N	\N	\N
v160lx9x03s	9wsmhrm9np0	6	\N	\N	\N
awxbyrawxmp	awxbyrawxmp	0	f	properties	\N
epxu1zrlga3	awxbyrawxmp	1	\N	\N	3
zn7elpmsysr	zn7elpmsysr	0	f	properties	\N
muy0v6uh3hn	zn7elpmsysr	1	\N	\N	1
d9xmgv8c1nm	d9xmgv8c1nm	0	f	properties	\N
zn7elpmsysr	d9xmgv8c1nm	1	\N	\N	1
muy0v6uh3hn	d9xmgv8c1nm	2	\N	\N	1
epxu1zrlga3	d9xmgv8c1nm	3	\N	\N	\N
xf7n1l4jksl	d9xmgv8c1nm	4	\N	\N	\N
28s9demo7cg	d9xmgv8c1nm	5	\N	\N	\N
8g2rp9ye3m4	d9xmgv8c1nm	6	\N	\N	\N
k6bw6nt922r	d9xmgv8c1nm	7	\N	\N	\N
owu9hfdyp8n	d9xmgv8c1nm	8	\N	\N	\N
z1gmpts94df	d9xmgv8c1nm	9	\N	\N	\N
rh3ea27v4vx	d9xmgv8c1nm	10	\N	\N	\N
i9qj49fo70j	d9xmgv8c1nm	11	\N	\N	\N
4qb8nr54kex	d9xmgv8c1nm	12	\N	\N	\N
p2csprfyzks	d9xmgv8c1nm	13	\N	\N	\N
7e38fr8xa7m	d9xmgv8c1nm	14	\N	\N	\N
v160lx9x03s	are93oh007m	3	\N	\N	\N
v160lx9x03s	jw2um47b1kq	5	\N	\N	\N
v160lx9x03s	s2j1mca129k	4	\N	\N	\N
v160lx9x03s	setmbtb7hr8	2	\N	\N	\N
5wtyj13hh7k	nz5ub7gvta2	12	\N	\N	\N
v160lx9x03s	nz5ub7gvta2	13	\N	\N	\N
r34c545vn0o	nz5ub7gvta2	14	\N	\N	\N
s7ppiu6idan	nz5ub7gvta2	15	\N	\N	\N
xf7n1l4jksl	muy0v6uh3hn	2	\N	\N	\N
28s9demo7cg	muy0v6uh3hn	3	\N	\N	\N
muy0v6uh3hn	muy0v6uh3hn	0	f	properties	\N
epxu1zrlga3	muy0v6uh3hn	1	\N	\N	4
wflzjg2fsvz	wflzjg2fsvz	0	f	properties	\N
9gg7w4ctvy1	nz5ub7gvta2	16	\N	\N	\N
4ea0eg22s6f	nz5ub7gvta2	17	\N	\N	\N
8g2rp9ye3m4	muy0v6uh3hn	4	\N	\N	\N
k6bw6nt922r	muy0v6uh3hn	5	\N	\N	\N
owu9hfdyp8n	muy0v6uh3hn	6	\N	\N	\N
z1gmpts94df	muy0v6uh3hn	7	\N	\N	\N
rh3ea27v4vx	muy0v6uh3hn	8	\N	\N	\N
i9qj49fo70j	muy0v6uh3hn	9	\N	\N	\N
4qb8nr54kex	muy0v6uh3hn	10	\N	\N	\N
p2csprfyzks	muy0v6uh3hn	11	\N	\N	\N
7e38fr8xa7m	muy0v6uh3hn	12	\N	\N	\N
5i6s9h3z12w	nz5ub7gvta2	18	\N	\N	\N
3o0nafjc9zn	nz5ub7gvta2	19	\N	\N	\N
wpw2zdgvred	nz5ub7gvta2	20	\N	\N	\N
we4al08cgrl	nz5ub7gvta2	21	\N	\N	\N
47saxh0jk89	47saxh0jk89	0	f	properties	\N
p86ow4sckcj	47saxh0jk89	1	\N	\N	1
he8e1fqolx7	gdl7xj6l7qi	2	\N	\N	\N
dgkluqyw1bm	dgkluqyw1bm	0	f	properties	\N
epxu1zrlga3	zn7elpmsysr	2	\N	\N	\N
xf7n1l4jksl	zn7elpmsysr	3	\N	\N	\N
28s9demo7cg	zn7elpmsysr	4	\N	\N	\N
8g2rp9ye3m4	zn7elpmsysr	5	\N	\N	\N
k6bw6nt922r	zn7elpmsysr	6	\N	\N	\N
owu9hfdyp8n	zn7elpmsysr	7	\N	\N	\N
z1gmpts94df	zn7elpmsysr	8	\N	\N	\N
rh3ea27v4vx	zn7elpmsysr	9	\N	\N	\N
i9qj49fo70j	zn7elpmsysr	10	\N	\N	\N
4qb8nr54kex	zn7elpmsysr	11	\N	\N	\N
p2csprfyzks	zn7elpmsysr	12	\N	\N	\N
7e38fr8xa7m	zn7elpmsysr	13	\N	\N	\N
nhtmsili9i3	dgkluqyw1bm	1	\N	\N	1
7ve724fwlc3	7ve724fwlc3	0	f	properties	\N
dgkluqyw1bm	7ve724fwlc3	1	\N	\N	1
nhtmsili9i3	7ve724fwlc3	2	\N	\N	1
p86ow4sckcj	7ve724fwlc3	3	\N	\N	\N
5rlnnzhzvlu	7ve724fwlc3	4	\N	\N	\N
9yf4qjq6xtn	7ve724fwlc3	5	\N	\N	\N
1dsb6ktfpw0	7ve724fwlc3	6	\N	\N	\N
9a5cnn8va7i	7ve724fwlc3	7	\N	\N	\N
9wsmhrm9np0	7ve724fwlc3	8	\N	\N	\N
jw2um47b1kq	7ve724fwlc3	9	\N	\N	\N
s2j1mca129k	7ve724fwlc3	10	\N	\N	\N
are93oh007m	7ve724fwlc3	11	\N	\N	\N
v0r4hvxvb4v	v0r4hvxvb4v	0	f	properties	\N
ps934my2yup	v0r4hvxvb4v	1	\N	\N	1
setmbtb7hr8	7ve724fwlc3	12	\N	\N	\N
5wtyj13hh7k	7ve724fwlc3	13	\N	\N	\N
itlawwwc24z	itlawwwc24z	0	f	properties	\N
v0r4hvxvb4v	itlawwwc24z	1	\N	\N	1
ps934my2yup	itlawwwc24z	2	\N	\N	1
v160lx9x03s	7ve724fwlc3	14	\N	\N	\N
r34c545vn0o	7ve724fwlc3	15	\N	\N	\N
b75wrghi14w	b75wrghi14w	0	f	properties	\N
itlawwwc24z	b75wrghi14w	1	\N	\N	1
v0r4hvxvb4v	b75wrghi14w	2	\N	\N	1
ps934my2yup	b75wrghi14w	3	\N	\N	1
s7ppiu6idan	7ve724fwlc3	16	\N	\N	\N
9gg7w4ctvy1	7ve724fwlc3	17	\N	\N	\N
fbjhmky7951	fbjhmky7951	0	f	properties	\N
b75wrghi14w	fbjhmky7951	1	\N	\N	1
itlawwwc24z	fbjhmky7951	2	\N	\N	1
v0r4hvxvb4v	fbjhmky7951	3	\N	\N	1
ps934my2yup	fbjhmky7951	4	\N	\N	1
4ea0eg22s6f	7ve724fwlc3	18	\N	\N	\N
5i6s9h3z12w	7ve724fwlc3	19	\N	\N	\N
3o0nafjc9zn	7ve724fwlc3	20	\N	\N	\N
xf7n1l4jksl	7wcriuxmrla	2	\N	\N	\N
28s9demo7cg	7wcriuxmrla	3	\N	\N	\N
8g2rp9ye3m4	7wcriuxmrla	4	\N	\N	\N
k6bw6nt922r	7wcriuxmrla	5	\N	\N	\N
owu9hfdyp8n	7wcriuxmrla	6	\N	\N	\N
z1gmpts94df	7wcriuxmrla	7	\N	\N	\N
rh3ea27v4vx	7wcriuxmrla	8	\N	\N	\N
i9qj49fo70j	7wcriuxmrla	9	\N	\N	\N
4qb8nr54kex	7wcriuxmrla	10	\N	\N	\N
p2csprfyzks	7wcriuxmrla	11	\N	\N	\N
7e38fr8xa7m	7wcriuxmrla	12	\N	\N	\N
wpw2zdgvred	7ve724fwlc3	21	\N	\N	\N
we4al08cgrl	7ve724fwlc3	22	\N	\N	\N
p86ow4sckcj	dgkluqyw1bm	2	\N	\N	\N
5rlnnzhzvlu	dgkluqyw1bm	3	\N	\N	\N
setmbtb7hr8	setmbtb7hr8	0	f	properties	\N
5wtyj13hh7k	setmbtb7hr8	1	\N	\N	2
r34c545vn0o	28fjk12kdqn	3	\N	\N	\N
r34c545vn0o	5wtyj13hh7k	2	\N	\N	\N
r34c545vn0o	74wiu3prkat	7	\N	\N	\N
r34c545vn0o	9wsmhrm9np0	7	\N	\N	\N
r34c545vn0o	are93oh007m	4	\N	\N	\N
r34c545vn0o	jw2um47b1kq	6	\N	\N	\N
r34c545vn0o	kuxb9m62gau	4	\N	\N	\N
r34c545vn0o	pujioj8krv0	6	\N	\N	\N
r34c545vn0o	s2j1mca129k	5	\N	\N	\N
r34c545vn0o	setmbtb7hr8	3	\N	\N	\N
r34c545vn0o	xnnjkcrpivt	5	\N	\N	\N
s7ppiu6idan	28fjk12kdqn	4	\N	\N	\N
s7ppiu6idan	5wtyj13hh7k	3	\N	\N	\N
s7ppiu6idan	74wiu3prkat	8	\N	\N	\N
s7ppiu6idan	9wsmhrm9np0	8	\N	\N	\N
s7ppiu6idan	are93oh007m	5	\N	\N	\N
s7ppiu6idan	jw2um47b1kq	7	\N	\N	\N
s7ppiu6idan	kuxb9m62gau	5	\N	\N	\N
s7ppiu6idan	pujioj8krv0	7	\N	\N	\N
s7ppiu6idan	s2j1mca129k	6	\N	\N	\N
s7ppiu6idan	setmbtb7hr8	4	\N	\N	\N
s7ppiu6idan	v160lx9x03s	2	\N	\N	\N
s7ppiu6idan	xnnjkcrpivt	6	\N	\N	\N
9gg7w4ctvy1	28fjk12kdqn	5	\N	\N	\N
9gg7w4ctvy1	5wtyj13hh7k	4	\N	\N	\N
9gg7w4ctvy1	74wiu3prkat	9	\N	\N	\N
9gg7w4ctvy1	9wsmhrm9np0	9	\N	\N	\N
9gg7w4ctvy1	are93oh007m	6	\N	\N	\N
9gg7w4ctvy1	jw2um47b1kq	8	\N	\N	\N
9gg7w4ctvy1	kuxb9m62gau	6	\N	\N	\N
9gg7w4ctvy1	pujioj8krv0	8	\N	\N	\N
9gg7w4ctvy1	s2j1mca129k	7	\N	\N	\N
9gg7w4ctvy1	setmbtb7hr8	5	\N	\N	\N
9gg7w4ctvy1	v160lx9x03s	3	\N	\N	\N
9gg7w4ctvy1	xnnjkcrpivt	7	\N	\N	\N
4ea0eg22s6f	28fjk12kdqn	6	\N	\N	\N
4ea0eg22s6f	5wtyj13hh7k	5	\N	\N	\N
4ea0eg22s6f	74wiu3prkat	10	\N	\N	\N
4ea0eg22s6f	9wsmhrm9np0	10	\N	\N	\N
4ea0eg22s6f	are93oh007m	7	\N	\N	\N
4ea0eg22s6f	jw2um47b1kq	9	\N	\N	\N
4ea0eg22s6f	kuxb9m62gau	7	\N	\N	\N
4ea0eg22s6f	pujioj8krv0	9	\N	\N	\N
4ea0eg22s6f	s2j1mca129k	8	\N	\N	\N
4ea0eg22s6f	setmbtb7hr8	6	\N	\N	\N
4ea0eg22s6f	v160lx9x03s	4	\N	\N	\N
4ea0eg22s6f	xnnjkcrpivt	8	\N	\N	\N
5i6s9h3z12w	28fjk12kdqn	7	\N	\N	\N
5i6s9h3z12w	5wtyj13hh7k	6	\N	\N	\N
5i6s9h3z12w	74wiu3prkat	11	\N	\N	\N
5i6s9h3z12w	9wsmhrm9np0	11	\N	\N	\N
ps934my2yup	ps934my2yup	0	f	properties	\N
5i6s9h3z12w	are93oh007m	8	\N	\N	\N
5i6s9h3z12w	jw2um47b1kq	10	\N	\N	\N
5i6s9h3z12w	kuxb9m62gau	8	\N	\N	\N
5i6s9h3z12w	pujioj8krv0	10	\N	\N	\N
5i6s9h3z12w	s2j1mca129k	9	\N	\N	\N
5i6s9h3z12w	setmbtb7hr8	7	\N	\N	\N
5i6s9h3z12w	v160lx9x03s	5	\N	\N	\N
5i6s9h3z12w	xnnjkcrpivt	9	\N	\N	\N
3o0nafjc9zn	28fjk12kdqn	8	\N	\N	\N
3o0nafjc9zn	5wtyj13hh7k	7	\N	\N	\N
3o0nafjc9zn	74wiu3prkat	12	\N	\N	\N
3o0nafjc9zn	9wsmhrm9np0	12	\N	\N	\N
3o0nafjc9zn	are93oh007m	9	\N	\N	\N
3o0nafjc9zn	jw2um47b1kq	11	\N	\N	\N
3o0nafjc9zn	kuxb9m62gau	9	\N	\N	\N
3o0nafjc9zn	pujioj8krv0	11	\N	\N	\N
3o0nafjc9zn	s2j1mca129k	10	\N	\N	\N
3o0nafjc9zn	setmbtb7hr8	8	\N	\N	\N
3o0nafjc9zn	v160lx9x03s	6	\N	\N	\N
3o0nafjc9zn	xnnjkcrpivt	10	\N	\N	\N
wpw2zdgvred	28fjk12kdqn	9	\N	\N	\N
wpw2zdgvred	5wtyj13hh7k	8	\N	\N	\N
wpw2zdgvred	74wiu3prkat	13	\N	\N	\N
wpw2zdgvred	9wsmhrm9np0	13	\N	\N	\N
wpw2zdgvred	are93oh007m	10	\N	\N	\N
wpw2zdgvred	jw2um47b1kq	12	\N	\N	\N
wpw2zdgvred	kuxb9m62gau	10	\N	\N	\N
wpw2zdgvred	pujioj8krv0	12	\N	\N	\N
wpw2zdgvred	s2j1mca129k	11	\N	\N	\N
wpw2zdgvred	setmbtb7hr8	9	\N	\N	\N
wpw2zdgvred	v160lx9x03s	7	\N	\N	\N
wpw2zdgvred	xnnjkcrpivt	11	\N	\N	\N
we4al08cgrl	28fjk12kdqn	10	\N	\N	\N
we4al08cgrl	5wtyj13hh7k	9	\N	\N	\N
we4al08cgrl	74wiu3prkat	14	\N	\N	\N
we4al08cgrl	9wsmhrm9np0	14	\N	\N	\N
we4al08cgrl	are93oh007m	11	\N	\N	\N
we4al08cgrl	jw2um47b1kq	13	\N	\N	\N
we4al08cgrl	kuxb9m62gau	11	\N	\N	\N
we4al08cgrl	pujioj8krv0	13	\N	\N	\N
we4al08cgrl	s2j1mca129k	12	\N	\N	\N
we4al08cgrl	setmbtb7hr8	10	\N	\N	\N
we4al08cgrl	v160lx9x03s	8	\N	\N	\N
we4al08cgrl	xnnjkcrpivt	12	\N	\N	\N
xaqtxcn6wk1	62dv0mb7ltw	2	\N	\N	\N
hxbstnj3c38	htkypy9jlt5	3	\N	\N	\N
owhsxq5010d	htkypy9jlt5	4	\N	\N	\N
bx5jcj5t34u	htkypy9jlt5	5	\N	\N	\N
026mxjz1xlz	htkypy9jlt5	6	\N	\N	\N
ldb7xlegtqv	htkypy9jlt5	7	\N	\N	\N
nnw8hb8g14c	htkypy9jlt5	8	\N	\N	\N
wzegw15krxc	htkypy9jlt5	9	\N	\N	\N
xt1t69pgjvf	htkypy9jlt5	10	\N	\N	\N
a540x2nf55u	htkypy9jlt5	11	\N	\N	\N
s7ppiu6idan	htkypy9jlt5	12	\N	\N	\N
9gg7w4ctvy1	htkypy9jlt5	13	\N	\N	\N
4ea0eg22s6f	htkypy9jlt5	14	\N	\N	\N
5i6s9h3z12w	htkypy9jlt5	15	\N	\N	\N
3o0nafjc9zn	htkypy9jlt5	16	\N	\N	\N
wpw2zdgvred	htkypy9jlt5	17	\N	\N	\N
we4al08cgrl	htkypy9jlt5	18	\N	\N	\N
d0t11ss0foi	lyq8fn8u51y	2	\N	\N	\N
7p14adw4n9n	lyq8fn8u51y	3	\N	\N	\N
hxbstnj3c38	lyq8fn8u51y	4	\N	\N	\N
owhsxq5010d	lyq8fn8u51y	5	\N	\N	\N
bx5jcj5t34u	lyq8fn8u51y	6	\N	\N	\N
026mxjz1xlz	lyq8fn8u51y	7	\N	\N	\N
ldb7xlegtqv	lyq8fn8u51y	8	\N	\N	\N
nnw8hb8g14c	lyq8fn8u51y	9	\N	\N	\N
wzegw15krxc	lyq8fn8u51y	10	\N	\N	\N
7wcriuxmrla	7wcriuxmrla	0	f	properties	\N
epxu1zrlga3	7wcriuxmrla	1	\N	\N	5
xt1t69pgjvf	lyq8fn8u51y	11	\N	\N	\N
dfsaiiu616q	wflzjg2fsvz	1	\N	\N	1
epxu1zrlga3	dfsaiiu616q	2	\N	\N	\N
xf7n1l4jksl	dfsaiiu616q	3	\N	\N	\N
28s9demo7cg	dfsaiiu616q	4	\N	\N	\N
8g2rp9ye3m4	dfsaiiu616q	5	\N	\N	\N
k6bw6nt922r	dfsaiiu616q	6	\N	\N	\N
owu9hfdyp8n	dfsaiiu616q	7	\N	\N	\N
z1gmpts94df	dfsaiiu616q	8	\N	\N	\N
rh3ea27v4vx	dfsaiiu616q	9	\N	\N	\N
i9qj49fo70j	dfsaiiu616q	10	\N	\N	\N
4qb8nr54kex	dfsaiiu616q	11	\N	\N	\N
p2csprfyzks	dfsaiiu616q	12	\N	\N	\N
7e38fr8xa7m	dfsaiiu616q	13	\N	\N	\N
a540x2nf55u	lyq8fn8u51y	12	\N	\N	\N
s7ppiu6idan	lyq8fn8u51y	13	\N	\N	\N
9gg7w4ctvy1	lyq8fn8u51y	14	\N	\N	\N
4ea0eg22s6f	lyq8fn8u51y	15	\N	\N	\N
5i6s9h3z12w	lyq8fn8u51y	16	\N	\N	\N
3o0nafjc9zn	lyq8fn8u51y	17	\N	\N	\N
wpw2zdgvred	lyq8fn8u51y	18	\N	\N	\N
we4al08cgrl	lyq8fn8u51y	19	\N	\N	\N
3h47wtgjzlg	wflzjg2fsvz	2	\N	\N	\N
epxu1zrlga3	wflzjg2fsvz	3	\N	\N	\N
xf7n1l4jksl	wflzjg2fsvz	4	\N	\N	\N
28s9demo7cg	wflzjg2fsvz	5	\N	\N	\N
8g2rp9ye3m4	wflzjg2fsvz	6	\N	\N	\N
k6bw6nt922r	wflzjg2fsvz	7	\N	\N	\N
owu9hfdyp8n	wflzjg2fsvz	8	\N	\N	\N
z1gmpts94df	wflzjg2fsvz	9	\N	\N	\N
rh3ea27v4vx	wflzjg2fsvz	10	\N	\N	\N
i9qj49fo70j	wflzjg2fsvz	11	\N	\N	\N
4qb8nr54kex	wflzjg2fsvz	12	\N	\N	\N
p2csprfyzks	wflzjg2fsvz	13	\N	\N	\N
7e38fr8xa7m	wflzjg2fsvz	14	\N	\N	\N
9yf4qjq6xtn	dgkluqyw1bm	4	\N	\N	\N
1dsb6ktfpw0	dgkluqyw1bm	5	\N	\N	\N
9a5cnn8va7i	dgkluqyw1bm	6	\N	\N	\N
9wsmhrm9np0	dgkluqyw1bm	7	\N	\N	\N
jw2um47b1kq	dgkluqyw1bm	8	\N	\N	\N
s2j1mca129k	dgkluqyw1bm	9	\N	\N	\N
are93oh007m	dgkluqyw1bm	10	\N	\N	\N
setmbtb7hr8	dgkluqyw1bm	11	\N	\N	\N
dfsaiiu616q	dfsaiiu616q	0	f	properties	\N
3h47wtgjzlg	dfsaiiu616q	1	\N	\N	2
5wtyj13hh7k	dgkluqyw1bm	12	\N	\N	\N
tuq7k5ttf23	b75wrghi14w	4	\N	\N	\N
tuq7k5ttf23	fbjhmky7951	5	\N	\N	\N
tuq7k5ttf23	itlawwwc24z	3	\N	\N	\N
tuq7k5ttf23	v0r4hvxvb4v	2	\N	\N	\N
tuq7k5ttf23	ps934my2yup	1	\N	\N	1
muy0v6uh3hn	b75wrghi14w	5	\N	\N	\N
muy0v6uh3hn	fbjhmky7951	6	\N	\N	\N
muy0v6uh3hn	itlawwwc24z	4	\N	\N	\N
muy0v6uh3hn	ps934my2yup	2	\N	\N	\N
v160lx9x03s	dgkluqyw1bm	13	\N	\N	\N
muy0v6uh3hn	v0r4hvxvb4v	3	\N	\N	\N
epxu1zrlga3	b75wrghi14w	6	\N	\N	\N
epxu1zrlga3	fbjhmky7951	7	\N	\N	\N
epxu1zrlga3	itlawwwc24z	5	\N	\N	\N
epxu1zrlga3	ps934my2yup	3	\N	\N	\N
epxu1zrlga3	tuq7k5ttf23	2	\N	\N	\N
r34c545vn0o	dgkluqyw1bm	14	\N	\N	\N
epxu1zrlga3	v0r4hvxvb4v	4	\N	\N	\N
xf7n1l4jksl	b75wrghi14w	7	\N	\N	\N
xf7n1l4jksl	fbjhmky7951	8	\N	\N	\N
xf7n1l4jksl	itlawwwc24z	6	\N	\N	\N
xf7n1l4jksl	ps934my2yup	4	\N	\N	\N
xf7n1l4jksl	tuq7k5ttf23	3	\N	\N	\N
xf7n1l4jksl	v0r4hvxvb4v	5	\N	\N	\N
28s9demo7cg	b75wrghi14w	8	\N	\N	\N
28s9demo7cg	fbjhmky7951	9	\N	\N	\N
28s9demo7cg	itlawwwc24z	7	\N	\N	\N
28s9demo7cg	ps934my2yup	5	\N	\N	\N
28s9demo7cg	tuq7k5ttf23	4	\N	\N	\N
28s9demo7cg	v0r4hvxvb4v	6	\N	\N	\N
8g2rp9ye3m4	b75wrghi14w	9	\N	\N	\N
8g2rp9ye3m4	fbjhmky7951	10	\N	\N	\N
8g2rp9ye3m4	itlawwwc24z	8	\N	\N	\N
8g2rp9ye3m4	ps934my2yup	6	\N	\N	\N
8g2rp9ye3m4	tuq7k5ttf23	5	\N	\N	\N
8g2rp9ye3m4	v0r4hvxvb4v	7	\N	\N	\N
k6bw6nt922r	b75wrghi14w	10	\N	\N	\N
k6bw6nt922r	fbjhmky7951	11	\N	\N	\N
k6bw6nt922r	itlawwwc24z	9	\N	\N	\N
k6bw6nt922r	ps934my2yup	7	\N	\N	\N
k6bw6nt922r	tuq7k5ttf23	6	\N	\N	\N
k6bw6nt922r	v0r4hvxvb4v	8	\N	\N	\N
owu9hfdyp8n	b75wrghi14w	11	\N	\N	\N
owu9hfdyp8n	fbjhmky7951	12	\N	\N	\N
owu9hfdyp8n	itlawwwc24z	10	\N	\N	\N
owu9hfdyp8n	ps934my2yup	8	\N	\N	\N
owu9hfdyp8n	tuq7k5ttf23	7	\N	\N	\N
owu9hfdyp8n	v0r4hvxvb4v	9	\N	\N	\N
z1gmpts94df	b75wrghi14w	12	\N	\N	\N
z1gmpts94df	fbjhmky7951	13	\N	\N	\N
z1gmpts94df	itlawwwc24z	11	\N	\N	\N
z1gmpts94df	ps934my2yup	9	\N	\N	\N
z1gmpts94df	tuq7k5ttf23	8	\N	\N	\N
z1gmpts94df	v0r4hvxvb4v	10	\N	\N	\N
rh3ea27v4vx	b75wrghi14w	13	\N	\N	\N
rh3ea27v4vx	fbjhmky7951	14	\N	\N	\N
rh3ea27v4vx	itlawwwc24z	12	\N	\N	\N
rh3ea27v4vx	ps934my2yup	10	\N	\N	\N
rh3ea27v4vx	tuq7k5ttf23	9	\N	\N	\N
rh3ea27v4vx	v0r4hvxvb4v	11	\N	\N	\N
i9qj49fo70j	b75wrghi14w	14	\N	\N	\N
i9qj49fo70j	fbjhmky7951	15	\N	\N	\N
i9qj49fo70j	itlawwwc24z	13	\N	\N	\N
i9qj49fo70j	ps934my2yup	11	\N	\N	\N
i9qj49fo70j	tuq7k5ttf23	10	\N	\N	\N
i9qj49fo70j	v0r4hvxvb4v	12	\N	\N	\N
4qb8nr54kex	b75wrghi14w	15	\N	\N	\N
4qb8nr54kex	fbjhmky7951	16	\N	\N	\N
4qb8nr54kex	itlawwwc24z	14	\N	\N	\N
4qb8nr54kex	ps934my2yup	12	\N	\N	\N
4qb8nr54kex	tuq7k5ttf23	11	\N	\N	\N
4qb8nr54kex	v0r4hvxvb4v	13	\N	\N	\N
p2csprfyzks	b75wrghi14w	16	\N	\N	\N
p2csprfyzks	fbjhmky7951	17	\N	\N	\N
p2csprfyzks	itlawwwc24z	15	\N	\N	\N
p2csprfyzks	ps934my2yup	13	\N	\N	\N
p2csprfyzks	tuq7k5ttf23	12	\N	\N	\N
p2csprfyzks	v0r4hvxvb4v	14	\N	\N	\N
7e38fr8xa7m	b75wrghi14w	17	\N	\N	\N
7e38fr8xa7m	fbjhmky7951	18	\N	\N	\N
7e38fr8xa7m	itlawwwc24z	16	\N	\N	\N
7e38fr8xa7m	ps934my2yup	14	\N	\N	\N
7e38fr8xa7m	tuq7k5ttf23	13	\N	\N	\N
7e38fr8xa7m	v0r4hvxvb4v	15	\N	\N	\N
wzegw15krxc	wzegw15krxc	0	f	properties	\N
xt1t69pgjvf	wzegw15krxc	1	\N	\N	1
nnw8hb8g14c	nnw8hb8g14c	0	f	properties	\N
wzegw15krxc	nnw8hb8g14c	1	\N	\N	1
xt1t69pgjvf	nnw8hb8g14c	2	\N	\N	1
ldb7xlegtqv	ldb7xlegtqv	0	f	properties	\N
nnw8hb8g14c	ldb7xlegtqv	1	\N	\N	1
wzegw15krxc	ldb7xlegtqv	2	\N	\N	1
xt1t69pgjvf	ldb7xlegtqv	3	\N	\N	1
026mxjz1xlz	026mxjz1xlz	0	f	properties	\N
ldb7xlegtqv	026mxjz1xlz	1	\N	\N	1
nnw8hb8g14c	026mxjz1xlz	2	\N	\N	1
wzegw15krxc	026mxjz1xlz	3	\N	\N	1
xt1t69pgjvf	026mxjz1xlz	4	\N	\N	1
a540x2nf55u	026mxjz1xlz	5	\N	\N	\N
a540x2nf55u	ldb7xlegtqv	4	\N	\N	\N
a540x2nf55u	nnw8hb8g14c	3	\N	\N	\N
a540x2nf55u	wzegw15krxc	2	\N	\N	\N
s7ppiu6idan	026mxjz1xlz	6	\N	\N	\N
s7ppiu6idan	ldb7xlegtqv	5	\N	\N	\N
s7ppiu6idan	nnw8hb8g14c	4	\N	\N	\N
s7ppiu6idan	wzegw15krxc	3	\N	\N	\N
s7ppiu6idan	xt1t69pgjvf	2	\N	\N	\N
9gg7w4ctvy1	026mxjz1xlz	7	\N	\N	\N
9gg7w4ctvy1	ldb7xlegtqv	6	\N	\N	\N
9gg7w4ctvy1	nnw8hb8g14c	5	\N	\N	\N
9gg7w4ctvy1	wzegw15krxc	4	\N	\N	\N
9gg7w4ctvy1	xt1t69pgjvf	3	\N	\N	\N
4ea0eg22s6f	026mxjz1xlz	8	\N	\N	\N
4ea0eg22s6f	ldb7xlegtqv	7	\N	\N	\N
4ea0eg22s6f	nnw8hb8g14c	6	\N	\N	\N
4ea0eg22s6f	wzegw15krxc	5	\N	\N	\N
4ea0eg22s6f	xt1t69pgjvf	4	\N	\N	\N
5i6s9h3z12w	026mxjz1xlz	9	\N	\N	\N
5i6s9h3z12w	ldb7xlegtqv	8	\N	\N	\N
5i6s9h3z12w	nnw8hb8g14c	7	\N	\N	\N
5i6s9h3z12w	wzegw15krxc	6	\N	\N	\N
5i6s9h3z12w	xt1t69pgjvf	5	\N	\N	\N
3o0nafjc9zn	026mxjz1xlz	10	\N	\N	\N
3o0nafjc9zn	ldb7xlegtqv	9	\N	\N	\N
3o0nafjc9zn	nnw8hb8g14c	8	\N	\N	\N
3o0nafjc9zn	wzegw15krxc	7	\N	\N	\N
3o0nafjc9zn	xt1t69pgjvf	6	\N	\N	\N
wpw2zdgvred	026mxjz1xlz	11	\N	\N	\N
wpw2zdgvred	ldb7xlegtqv	10	\N	\N	\N
wpw2zdgvred	nnw8hb8g14c	9	\N	\N	\N
tuq7k5ttf23	tuq7k5ttf23	0	f	properties	\N
muy0v6uh3hn	tuq7k5ttf23	1	\N	\N	2
wpw2zdgvred	wzegw15krxc	8	\N	\N	\N
wpw2zdgvred	xt1t69pgjvf	7	\N	\N	\N
we4al08cgrl	026mxjz1xlz	12	\N	\N	\N
we4al08cgrl	ldb7xlegtqv	11	\N	\N	\N
we4al08cgrl	nnw8hb8g14c	10	\N	\N	\N
we4al08cgrl	wzegw15krxc	9	\N	\N	\N
we4al08cgrl	xt1t69pgjvf	8	\N	\N	\N
xt1t69pgjvf	xt1t69pgjvf	0	f	properties	\N
a540x2nf55u	xt1t69pgjvf	1	\N	\N	1
stylirnf7y5	stylirnf7y5	0	f	properties	\N
s7ppiu6idan	stylirnf7y5	2	\N	\N	\N
9gg7w4ctvy1	stylirnf7y5	3	\N	\N	\N
4ea0eg22s6f	stylirnf7y5	4	\N	\N	\N
5i6s9h3z12w	stylirnf7y5	5	\N	\N	\N
3o0nafjc9zn	stylirnf7y5	6	\N	\N	\N
wpw2zdgvred	stylirnf7y5	7	\N	\N	\N
we4al08cgrl	stylirnf7y5	8	\N	\N	\N
a540x2nf55u	stylirnf7y5	1	\N	\N	2
s7ppiu6idan	dgkluqyw1bm	15	\N	\N	\N
itfb8yuoxjy	itfb8yuoxjy	0	f	properties	\N
s7ppiu6idan	itfb8yuoxjy	2	\N	\N	\N
9gg7w4ctvy1	itfb8yuoxjy	3	\N	\N	\N
4ea0eg22s6f	itfb8yuoxjy	4	\N	\N	\N
5i6s9h3z12w	itfb8yuoxjy	5	\N	\N	\N
3o0nafjc9zn	itfb8yuoxjy	6	\N	\N	\N
wpw2zdgvred	itfb8yuoxjy	7	\N	\N	\N
we4al08cgrl	itfb8yuoxjy	8	\N	\N	\N
a540x2nf55u	itfb8yuoxjy	1	\N	\N	3
9gg7w4ctvy1	dgkluqyw1bm	16	\N	\N	\N
4ea0eg22s6f	dgkluqyw1bm	17	\N	\N	\N
5i6s9h3z12w	dgkluqyw1bm	18	\N	\N	\N
3o0nafjc9zn	dgkluqyw1bm	19	\N	\N	\N
wpw2zdgvred	dgkluqyw1bm	20	\N	\N	\N
we4al08cgrl	dgkluqyw1bm	21	\N	\N	\N
5rlnnzhzvlu	nhtmsili9i3	2	\N	\N	\N
9yf4qjq6xtn	nhtmsili9i3	3	\N	\N	\N
1dsb6ktfpw0	nhtmsili9i3	4	\N	\N	\N
9a5cnn8va7i	nhtmsili9i3	5	\N	\N	\N
9wsmhrm9np0	nhtmsili9i3	6	\N	\N	\N
jw2um47b1kq	nhtmsili9i3	7	\N	\N	\N
s2j1mca129k	nhtmsili9i3	8	\N	\N	\N
are93oh007m	nhtmsili9i3	9	\N	\N	\N
setmbtb7hr8	nhtmsili9i3	10	\N	\N	\N
5wtyj13hh7k	nhtmsili9i3	11	\N	\N	\N
v160lx9x03s	nhtmsili9i3	12	\N	\N	\N
r34c545vn0o	nhtmsili9i3	13	\N	\N	\N
s7ppiu6idan	nhtmsili9i3	14	\N	\N	\N
9gg7w4ctvy1	nhtmsili9i3	15	\N	\N	\N
4ea0eg22s6f	nhtmsili9i3	16	\N	\N	\N
5i6s9h3z12w	nhtmsili9i3	17	\N	\N	\N
3o0nafjc9zn	nhtmsili9i3	18	\N	\N	\N
wpw2zdgvred	nhtmsili9i3	19	\N	\N	\N
we4al08cgrl	nhtmsili9i3	20	\N	\N	\N
dijzb61rbsv	7lb2pemgi8c	2	\N	\N	\N
ie3s6t8ry35	7lb2pemgi8c	3	\N	\N	\N
mg6e604h4ue	7lb2pemgi8c	4	\N	\N	\N
863sbhkbfon	7lb2pemgi8c	5	\N	\N	\N
mxsi688ucom	7lb2pemgi8c	6	\N	\N	\N
qi3rrli2wdj	7lb2pemgi8c	7	\N	\N	\N
74wiu3prkat	7lb2pemgi8c	8	\N	\N	\N
pujioj8krv0	7lb2pemgi8c	9	\N	\N	\N
xnnjkcrpivt	7lb2pemgi8c	10	\N	\N	\N
kuxb9m62gau	7lb2pemgi8c	11	\N	\N	\N
28fjk12kdqn	7lb2pemgi8c	12	\N	\N	\N
5wtyj13hh7k	7lb2pemgi8c	13	\N	\N	\N
v160lx9x03s	7lb2pemgi8c	14	\N	\N	\N
r34c545vn0o	7lb2pemgi8c	15	\N	\N	\N
s7ppiu6idan	7lb2pemgi8c	16	\N	\N	\N
9gg7w4ctvy1	7lb2pemgi8c	17	\N	\N	\N
4ea0eg22s6f	7lb2pemgi8c	18	\N	\N	\N
5i6s9h3z12w	7lb2pemgi8c	19	\N	\N	\N
3o0nafjc9zn	7lb2pemgi8c	20	\N	\N	\N
wpw2zdgvred	7lb2pemgi8c	21	\N	\N	\N
we4al08cgrl	7lb2pemgi8c	22	\N	\N	\N
nhtmsili9i3	nhtmsili9i3	0	f	properties	\N
p86ow4sckcj	nhtmsili9i3	1	\N	\N	2
qi3rrli2wdj	qi3rrli2wdj	0	f	properties	\N
6mbbgvh4rtz	6mbbgvh4rtz	0	f	properties	\N
7p14adw4n9n	6mbbgvh4rtz	2	\N	\N	\N
hxbstnj3c38	6mbbgvh4rtz	3	\N	\N	\N
owhsxq5010d	6mbbgvh4rtz	4	\N	\N	\N
bx5jcj5t34u	6mbbgvh4rtz	5	\N	\N	\N
026mxjz1xlz	6mbbgvh4rtz	6	\N	\N	\N
ldb7xlegtqv	6mbbgvh4rtz	7	\N	\N	\N
nnw8hb8g14c	6mbbgvh4rtz	8	\N	\N	\N
wzegw15krxc	6mbbgvh4rtz	9	\N	\N	\N
xt1t69pgjvf	6mbbgvh4rtz	10	\N	\N	\N
a540x2nf55u	6mbbgvh4rtz	11	\N	\N	\N
s7ppiu6idan	6mbbgvh4rtz	12	\N	\N	\N
9gg7w4ctvy1	6mbbgvh4rtz	13	\N	\N	\N
4ea0eg22s6f	6mbbgvh4rtz	14	\N	\N	\N
5i6s9h3z12w	6mbbgvh4rtz	15	\N	\N	\N
3o0nafjc9zn	6mbbgvh4rtz	16	\N	\N	\N
wpw2zdgvred	6mbbgvh4rtz	17	\N	\N	\N
we4al08cgrl	6mbbgvh4rtz	18	\N	\N	\N
l0eupz9wlk3	6mbbgvh4rtz	1	\N	\N	1
mxsi688ucom	mxsi688ucom	0	f	properties	\N
qi3rrli2wdj	mxsi688ucom	1	\N	\N	1
863sbhkbfon	863sbhkbfon	0	f	properties	\N
mxsi688ucom	863sbhkbfon	1	\N	\N	1
qi3rrli2wdj	863sbhkbfon	2	\N	\N	1
mg6e604h4ue	mg6e604h4ue	0	f	properties	\N
863sbhkbfon	mg6e604h4ue	1	\N	\N	1
mxsi688ucom	mg6e604h4ue	2	\N	\N	1
qi3rrli2wdj	mg6e604h4ue	3	\N	\N	1
7q0gtw5htyw	7q0gtw5htyw	0	f	properties	\N
mg6e604h4ue	7q0gtw5htyw	1	\N	\N	1
863sbhkbfon	7q0gtw5htyw	2	\N	\N	1
mxsi688ucom	7q0gtw5htyw	3	\N	\N	1
qi3rrli2wdj	7q0gtw5htyw	4	\N	\N	1
ie3s6t8ry35	ie3s6t8ry35	0	f	properties	\N
mg6e604h4ue	ie3s6t8ry35	1	\N	\N	2
863sbhkbfon	ie3s6t8ry35	2	\N	\N	2
mxsi688ucom	ie3s6t8ry35	3	\N	\N	2
qi3rrli2wdj	ie3s6t8ry35	4	\N	\N	2
74wiu3prkat	7q0gtw5htyw	5	\N	\N	\N
pujioj8krv0	7q0gtw5htyw	6	\N	\N	\N
xnnjkcrpivt	7q0gtw5htyw	7	\N	\N	\N
kuxb9m62gau	7q0gtw5htyw	8	\N	\N	\N
28fjk12kdqn	7q0gtw5htyw	9	\N	\N	\N
5wtyj13hh7k	7q0gtw5htyw	10	\N	\N	\N
v160lx9x03s	7q0gtw5htyw	11	\N	\N	\N
r34c545vn0o	7q0gtw5htyw	12	\N	\N	\N
s7ppiu6idan	7q0gtw5htyw	13	\N	\N	\N
9gg7w4ctvy1	7q0gtw5htyw	14	\N	\N	\N
4ea0eg22s6f	7q0gtw5htyw	15	\N	\N	\N
5i6s9h3z12w	7q0gtw5htyw	16	\N	\N	\N
3o0nafjc9zn	7q0gtw5htyw	17	\N	\N	\N
wpw2zdgvred	7q0gtw5htyw	18	\N	\N	\N
we4al08cgrl	7q0gtw5htyw	19	\N	\N	\N
74wiu3prkat	863sbhkbfon	3	\N	\N	\N
pujioj8krv0	863sbhkbfon	4	\N	\N	\N
xnnjkcrpivt	863sbhkbfon	5	\N	\N	\N
kuxb9m62gau	863sbhkbfon	6	\N	\N	\N
28fjk12kdqn	863sbhkbfon	7	\N	\N	\N
5wtyj13hh7k	863sbhkbfon	8	\N	\N	\N
v160lx9x03s	863sbhkbfon	9	\N	\N	\N
r34c545vn0o	863sbhkbfon	10	\N	\N	\N
s7ppiu6idan	863sbhkbfon	11	\N	\N	\N
9gg7w4ctvy1	863sbhkbfon	12	\N	\N	\N
4ea0eg22s6f	863sbhkbfon	13	\N	\N	\N
5i6s9h3z12w	863sbhkbfon	14	\N	\N	\N
3o0nafjc9zn	863sbhkbfon	15	\N	\N	\N
wpw2zdgvred	863sbhkbfon	16	\N	\N	\N
we4al08cgrl	863sbhkbfon	17	\N	\N	\N
74wiu3prkat	ie3s6t8ry35	5	\N	\N	\N
pujioj8krv0	ie3s6t8ry35	6	\N	\N	\N
uq9pwmj23ll	uq9pwmj23ll	0	f	properties	\N
5kdewgfri3r	uq9pwmj23ll	1	\N	\N	1
qktzdcfxe49	qktzdcfxe49	0	f	properties	\N
uq9pwmj23ll	qktzdcfxe49	1	\N	\N	1
5kdewgfri3r	5kdewgfri3r	0	f	properties	\N
3aszhl5bhwj	3aszhl5bhwj	0	f	properties	\N
s7ppiu6idan	3aszhl5bhwj	2	\N	\N	\N
9gg7w4ctvy1	3aszhl5bhwj	3	\N	\N	\N
4ea0eg22s6f	3aszhl5bhwj	4	\N	\N	\N
5i6s9h3z12w	3aszhl5bhwj	5	\N	\N	\N
3o0nafjc9zn	3aszhl5bhwj	6	\N	\N	\N
wpw2zdgvred	3aszhl5bhwj	7	\N	\N	\N
we4al08cgrl	3aszhl5bhwj	8	\N	\N	\N
a540x2nf55u	3aszhl5bhwj	1	\N	\N	4
5kdewgfri3r	qktzdcfxe49	2	\N	\N	1
owhsxq5010d	owhsxq5010d	0	f	properties	\N
bx5jcj5t34u	owhsxq5010d	1	\N	\N	1
hxbstnj3c38	hxbstnj3c38	0	f	properties	\N
owhsxq5010d	hxbstnj3c38	1	\N	\N	1
bx5jcj5t34u	hxbstnj3c38	2	\N	\N	1
7p14adw4n9n	7p14adw4n9n	0	f	properties	\N
hxbstnj3c38	7p14adw4n9n	1	\N	\N	1
owhsxq5010d	7p14adw4n9n	2	\N	\N	1
bx5jcj5t34u	7p14adw4n9n	3	\N	\N	1
d0t11ss0foi	d0t11ss0foi	0	f	properties	\N
7p14adw4n9n	d0t11ss0foi	1	\N	\N	1
hxbstnj3c38	d0t11ss0foi	2	\N	\N	1
owhsxq5010d	d0t11ss0foi	3	\N	\N	1
bx5jcj5t34u	d0t11ss0foi	4	\N	\N	1
l0eupz9wlk3	l0eupz9wlk3	0	f	properties	\N
7p14adw4n9n	l0eupz9wlk3	1	\N	\N	2
hxbstnj3c38	l0eupz9wlk3	2	\N	\N	2
owhsxq5010d	l0eupz9wlk3	3	\N	\N	2
bx5jcj5t34u	l0eupz9wlk3	4	\N	\N	2
026mxjz1xlz	7p14adw4n9n	4	\N	\N	\N
ldb7xlegtqv	7p14adw4n9n	5	\N	\N	\N
nnw8hb8g14c	7p14adw4n9n	6	\N	\N	\N
wzegw15krxc	7p14adw4n9n	7	\N	\N	\N
38urc2isvyr	tui7o1pxfhy	1	\N	\N	6
xt1t69pgjvf	7p14adw4n9n	8	\N	\N	\N
38urc2isvyr	p2csprfyzks	2	\N	\N	\N
9m9g4daljpc	p2csprfyzks	3	\N	\N	\N
dkwjpd81q5f	p2csprfyzks	4	\N	\N	\N
c2f9t3q258l	p2csprfyzks	5	\N	\N	\N
328zsdxa1d2	p2csprfyzks	6	\N	\N	\N
bvb25kzrb9u	p2csprfyzks	7	\N	\N	\N
ncpilr3vsko	p2csprfyzks	8	\N	\N	\N
we4al08cgrl	p2csprfyzks	9	\N	\N	\N
38urc2isvyr	4qb8nr54kex	3	\N	\N	\N
9m9g4daljpc	4qb8nr54kex	4	\N	\N	\N
dkwjpd81q5f	4qb8nr54kex	5	\N	\N	\N
c2f9t3q258l	4qb8nr54kex	6	\N	\N	\N
328zsdxa1d2	4qb8nr54kex	7	\N	\N	\N
bvb25kzrb9u	4qb8nr54kex	8	\N	\N	\N
ncpilr3vsko	4qb8nr54kex	9	\N	\N	\N
we4al08cgrl	4qb8nr54kex	10	\N	\N	\N
38urc2isvyr	i9qj49fo70j	4	\N	\N	\N
9m9g4daljpc	i9qj49fo70j	5	\N	\N	\N
dkwjpd81q5f	i9qj49fo70j	6	\N	\N	\N
c2f9t3q258l	i9qj49fo70j	7	\N	\N	\N
328zsdxa1d2	i9qj49fo70j	8	\N	\N	\N
bvb25kzrb9u	i9qj49fo70j	9	\N	\N	\N
ncpilr3vsko	i9qj49fo70j	10	\N	\N	\N
we4al08cgrl	i9qj49fo70j	11	\N	\N	\N
38urc2isvyr	rh3ea27v4vx	5	\N	\N	\N
9m9g4daljpc	rh3ea27v4vx	6	\N	\N	\N
dkwjpd81q5f	rh3ea27v4vx	7	\N	\N	\N
c2f9t3q258l	rh3ea27v4vx	8	\N	\N	\N
328zsdxa1d2	rh3ea27v4vx	9	\N	\N	\N
bvb25kzrb9u	rh3ea27v4vx	10	\N	\N	\N
ncpilr3vsko	rh3ea27v4vx	11	\N	\N	\N
we4al08cgrl	rh3ea27v4vx	12	\N	\N	\N
38urc2isvyr	z1gmpts94df	6	\N	\N	\N
9m9g4daljpc	z1gmpts94df	7	\N	\N	\N
dkwjpd81q5f	z1gmpts94df	8	\N	\N	\N
c2f9t3q258l	z1gmpts94df	9	\N	\N	\N
328zsdxa1d2	z1gmpts94df	10	\N	\N	\N
bvb25kzrb9u	z1gmpts94df	11	\N	\N	\N
ncpilr3vsko	z1gmpts94df	12	\N	\N	\N
we4al08cgrl	z1gmpts94df	13	\N	\N	\N
38urc2isvyr	owu9hfdyp8n	7	\N	\N	\N
9m9g4daljpc	owu9hfdyp8n	8	\N	\N	\N
dkwjpd81q5f	owu9hfdyp8n	9	\N	\N	\N
c2f9t3q258l	owu9hfdyp8n	10	\N	\N	\N
328zsdxa1d2	owu9hfdyp8n	11	\N	\N	\N
bvb25kzrb9u	owu9hfdyp8n	12	\N	\N	\N
ncpilr3vsko	owu9hfdyp8n	13	\N	\N	\N
we4al08cgrl	owu9hfdyp8n	14	\N	\N	\N
38urc2isvyr	ezwhs7icicp	6	\N	\N	\N
9m9g4daljpc	ezwhs7icicp	7	\N	\N	\N
dkwjpd81q5f	ezwhs7icicp	8	\N	\N	\N
c2f9t3q258l	ezwhs7icicp	9	\N	\N	\N
328zsdxa1d2	ezwhs7icicp	10	\N	\N	\N
bvb25kzrb9u	ezwhs7icicp	11	\N	\N	\N
ncpilr3vsko	ezwhs7icicp	12	\N	\N	\N
we4al08cgrl	ezwhs7icicp	13	\N	\N	\N
38urc2isvyr	hngqmqnskt7	4	\N	\N	\N
9m9g4daljpc	hngqmqnskt7	5	\N	\N	\N
dkwjpd81q5f	hngqmqnskt7	6	\N	\N	\N
c2f9t3q258l	hngqmqnskt7	7	\N	\N	\N
328zsdxa1d2	hngqmqnskt7	8	\N	\N	\N
bvb25kzrb9u	hngqmqnskt7	9	\N	\N	\N
ncpilr3vsko	hngqmqnskt7	10	\N	\N	\N
we4al08cgrl	hngqmqnskt7	11	\N	\N	\N
38urc2isvyr	r4q447oud7k	7	\N	\N	\N
9m9g4daljpc	r4q447oud7k	8	\N	\N	\N
dkwjpd81q5f	r4q447oud7k	9	\N	\N	\N
c2f9t3q258l	r4q447oud7k	10	\N	\N	\N
328zsdxa1d2	r4q447oud7k	11	\N	\N	\N
bvb25kzrb9u	r4q447oud7k	12	\N	\N	\N
ncpilr3vsko	r4q447oud7k	13	\N	\N	\N
we4al08cgrl	r4q447oud7k	14	\N	\N	\N
38urc2isvyr	wvdoqitff11	3	\N	\N	\N
9m9g4daljpc	wvdoqitff11	4	\N	\N	\N
dkwjpd81q5f	wvdoqitff11	5	\N	\N	\N
c2f9t3q258l	wvdoqitff11	6	\N	\N	\N
328zsdxa1d2	wvdoqitff11	7	\N	\N	\N
bvb25kzrb9u	wvdoqitff11	8	\N	\N	\N
ncpilr3vsko	wvdoqitff11	9	\N	\N	\N
we4al08cgrl	wvdoqitff11	10	\N	\N	\N
38urc2isvyr	xv209rfbm74	5	\N	\N	\N
9m9g4daljpc	xv209rfbm74	6	\N	\N	\N
dkwjpd81q5f	xv209rfbm74	7	\N	\N	\N
c2f9t3q258l	xv209rfbm74	8	\N	\N	\N
328zsdxa1d2	xv209rfbm74	9	\N	\N	\N
bvb25kzrb9u	xv209rfbm74	10	\N	\N	\N
ncpilr3vsko	xv209rfbm74	11	\N	\N	\N
we4al08cgrl	xv209rfbm74	12	\N	\N	\N
38urc2isvyr	1ynmaa4okbi	10	\N	\N	\N
9m9g4daljpc	1ynmaa4okbi	11	\N	\N	\N
dkwjpd81q5f	1ynmaa4okbi	12	\N	\N	\N
c2f9t3q258l	1ynmaa4okbi	13	\N	\N	\N
328zsdxa1d2	1ynmaa4okbi	14	\N	\N	\N
bvb25kzrb9u	1ynmaa4okbi	15	\N	\N	\N
ncpilr3vsko	1ynmaa4okbi	16	\N	\N	\N
we4al08cgrl	1ynmaa4okbi	17	\N	\N	\N
38urc2isvyr	4j76jf82r5a	8	\N	\N	\N
9m9g4daljpc	4j76jf82r5a	9	\N	\N	\N
dkwjpd81q5f	4j76jf82r5a	10	\N	\N	\N
a540x2nf55u	7p14adw4n9n	9	\N	\N	\N
c2f9t3q258l	4j76jf82r5a	11	\N	\N	\N
328zsdxa1d2	4j76jf82r5a	12	\N	\N	\N
bvb25kzrb9u	4j76jf82r5a	13	\N	\N	\N
ncpilr3vsko	4j76jf82r5a	14	\N	\N	\N
we4al08cgrl	4j76jf82r5a	15	\N	\N	\N
38urc2isvyr	azb0rag4ld3	9	\N	\N	\N
9m9g4daljpc	azb0rag4ld3	10	\N	\N	\N
dkwjpd81q5f	azb0rag4ld3	11	\N	\N	\N
c2f9t3q258l	azb0rag4ld3	12	\N	\N	\N
328zsdxa1d2	azb0rag4ld3	13	\N	\N	\N
bvb25kzrb9u	azb0rag4ld3	14	\N	\N	\N
ncpilr3vsko	azb0rag4ld3	15	\N	\N	\N
we4al08cgrl	azb0rag4ld3	16	\N	\N	\N
38urc2isvyr	dzyugs0mknh	12	\N	\N	\N
9m9g4daljpc	dzyugs0mknh	13	\N	\N	\N
dkwjpd81q5f	dzyugs0mknh	14	\N	\N	\N
c2f9t3q258l	dzyugs0mknh	15	\N	\N	\N
328zsdxa1d2	dzyugs0mknh	16	\N	\N	\N
bvb25kzrb9u	dzyugs0mknh	17	\N	\N	\N
ncpilr3vsko	dzyugs0mknh	18	\N	\N	\N
we4al08cgrl	dzyugs0mknh	19	\N	\N	\N
38urc2isvyr	pm01lbmd6qj	11	\N	\N	\N
9m9g4daljpc	pm01lbmd6qj	12	\N	\N	\N
dkwjpd81q5f	pm01lbmd6qj	13	\N	\N	\N
c2f9t3q258l	pm01lbmd6qj	14	\N	\N	\N
328zsdxa1d2	pm01lbmd6qj	15	\N	\N	\N
bvb25kzrb9u	pm01lbmd6qj	16	\N	\N	\N
ncpilr3vsko	pm01lbmd6qj	17	\N	\N	\N
we4al08cgrl	pm01lbmd6qj	18	\N	\N	\N
38urc2isvyr	xjaoqfqvp89	12	\N	\N	\N
9m9g4daljpc	xjaoqfqvp89	13	\N	\N	\N
dkwjpd81q5f	xjaoqfqvp89	14	\N	\N	\N
c2f9t3q258l	xjaoqfqvp89	15	\N	\N	\N
328zsdxa1d2	xjaoqfqvp89	16	\N	\N	\N
bvb25kzrb9u	xjaoqfqvp89	17	\N	\N	\N
ncpilr3vsko	xjaoqfqvp89	18	\N	\N	\N
we4al08cgrl	xjaoqfqvp89	19	\N	\N	\N
38urc2isvyr	3xghso5i7de	15	\N	\N	\N
9m9g4daljpc	3xghso5i7de	16	\N	\N	\N
dkwjpd81q5f	3xghso5i7de	17	\N	\N	\N
c2f9t3q258l	3xghso5i7de	18	\N	\N	\N
328zsdxa1d2	3xghso5i7de	19	\N	\N	\N
bvb25kzrb9u	3xghso5i7de	20	\N	\N	\N
ncpilr3vsko	3xghso5i7de	21	\N	\N	\N
we4al08cgrl	3xghso5i7de	22	\N	\N	\N
38urc2isvyr	db70kx0u9xg	14	\N	\N	\N
9m9g4daljpc	db70kx0u9xg	15	\N	\N	\N
dkwjpd81q5f	db70kx0u9xg	16	\N	\N	\N
c2f9t3q258l	db70kx0u9xg	17	\N	\N	\N
328zsdxa1d2	db70kx0u9xg	18	\N	\N	\N
bvb25kzrb9u	db70kx0u9xg	19	\N	\N	\N
ncpilr3vsko	db70kx0u9xg	20	\N	\N	\N
we4al08cgrl	db70kx0u9xg	21	\N	\N	\N
38urc2isvyr	o5mdu88rbat	13	\N	\N	\N
9m9g4daljpc	o5mdu88rbat	14	\N	\N	\N
dkwjpd81q5f	o5mdu88rbat	15	\N	\N	\N
c2f9t3q258l	o5mdu88rbat	16	\N	\N	\N
328zsdxa1d2	o5mdu88rbat	17	\N	\N	\N
bvb25kzrb9u	o5mdu88rbat	18	\N	\N	\N
ncpilr3vsko	o5mdu88rbat	19	\N	\N	\N
we4al08cgrl	o5mdu88rbat	20	\N	\N	\N
38urc2isvyr	9qjt9w43tfo	15	\N	\N	\N
9m9g4daljpc	9qjt9w43tfo	16	\N	\N	\N
dkwjpd81q5f	9qjt9w43tfo	17	\N	\N	\N
c2f9t3q258l	9qjt9w43tfo	18	\N	\N	\N
328zsdxa1d2	9qjt9w43tfo	19	\N	\N	\N
bvb25kzrb9u	9qjt9w43tfo	20	\N	\N	\N
ncpilr3vsko	9qjt9w43tfo	21	\N	\N	\N
we4al08cgrl	9qjt9w43tfo	22	\N	\N	\N
38urc2isvyr	i2q3e18hrq7	14	\N	\N	\N
9m9g4daljpc	i2q3e18hrq7	15	\N	\N	\N
dkwjpd81q5f	i2q3e18hrq7	16	\N	\N	\N
c2f9t3q258l	i2q3e18hrq7	17	\N	\N	\N
328zsdxa1d2	i2q3e18hrq7	18	\N	\N	\N
bvb25kzrb9u	i2q3e18hrq7	19	\N	\N	\N
ncpilr3vsko	i2q3e18hrq7	20	\N	\N	\N
we4al08cgrl	i2q3e18hrq7	21	\N	\N	\N
38urc2isvyr	opghijwqudd	13	\N	\N	\N
9m9g4daljpc	opghijwqudd	14	\N	\N	\N
dkwjpd81q5f	opghijwqudd	15	\N	\N	\N
c2f9t3q258l	opghijwqudd	16	\N	\N	\N
328zsdxa1d2	opghijwqudd	17	\N	\N	\N
bvb25kzrb9u	opghijwqudd	18	\N	\N	\N
ncpilr3vsko	opghijwqudd	19	\N	\N	\N
we4al08cgrl	opghijwqudd	20	\N	\N	\N
38urc2isvyr	awzku0rmhqf	13	\N	\N	\N
9m9g4daljpc	awzku0rmhqf	14	\N	\N	\N
dkwjpd81q5f	awzku0rmhqf	15	\N	\N	\N
c2f9t3q258l	awzku0rmhqf	16	\N	\N	\N
328zsdxa1d2	awzku0rmhqf	17	\N	\N	\N
bvb25kzrb9u	awzku0rmhqf	18	\N	\N	\N
ncpilr3vsko	awzku0rmhqf	19	\N	\N	\N
we4al08cgrl	awzku0rmhqf	20	\N	\N	\N
38urc2isvyr	28s9demo7cg	10	\N	\N	\N
9m9g4daljpc	28s9demo7cg	11	\N	\N	\N
dkwjpd81q5f	28s9demo7cg	12	\N	\N	\N
c2f9t3q258l	28s9demo7cg	13	\N	\N	\N
328zsdxa1d2	28s9demo7cg	14	\N	\N	\N
bvb25kzrb9u	28s9demo7cg	15	\N	\N	\N
ncpilr3vsko	28s9demo7cg	16	\N	\N	\N
we4al08cgrl	28s9demo7cg	17	\N	\N	\N
38urc2isvyr	3dwbb3xc7q8	12	\N	\N	\N
9m9g4daljpc	3dwbb3xc7q8	13	\N	\N	\N
dkwjpd81q5f	3dwbb3xc7q8	14	\N	\N	\N
c2f9t3q258l	3dwbb3xc7q8	15	\N	\N	\N
328zsdxa1d2	3dwbb3xc7q8	16	\N	\N	\N
bvb25kzrb9u	3dwbb3xc7q8	17	\N	\N	\N
ncpilr3vsko	3dwbb3xc7q8	18	\N	\N	\N
we4al08cgrl	3dwbb3xc7q8	19	\N	\N	\N
38urc2isvyr	8g2rp9ye3m4	9	\N	\N	\N
9m9g4daljpc	8g2rp9ye3m4	10	\N	\N	\N
dkwjpd81q5f	8g2rp9ye3m4	11	\N	\N	\N
c2f9t3q258l	8g2rp9ye3m4	12	\N	\N	\N
328zsdxa1d2	8g2rp9ye3m4	13	\N	\N	\N
bvb25kzrb9u	8g2rp9ye3m4	14	\N	\N	\N
ncpilr3vsko	8g2rp9ye3m4	15	\N	\N	\N
we4al08cgrl	8g2rp9ye3m4	16	\N	\N	\N
38urc2isvyr	epxu1zrlga3	12	\N	\N	\N
9m9g4daljpc	epxu1zrlga3	13	\N	\N	\N
dkwjpd81q5f	epxu1zrlga3	14	\N	\N	\N
c2f9t3q258l	epxu1zrlga3	15	\N	\N	\N
328zsdxa1d2	epxu1zrlga3	16	\N	\N	\N
bvb25kzrb9u	epxu1zrlga3	17	\N	\N	\N
ncpilr3vsko	epxu1zrlga3	18	\N	\N	\N
we4al08cgrl	epxu1zrlga3	19	\N	\N	\N
38urc2isvyr	k6bw6nt922r	8	\N	\N	\N
9m9g4daljpc	k6bw6nt922r	9	\N	\N	\N
dkwjpd81q5f	k6bw6nt922r	10	\N	\N	\N
c2f9t3q258l	k6bw6nt922r	11	\N	\N	\N
328zsdxa1d2	k6bw6nt922r	12	\N	\N	\N
bvb25kzrb9u	k6bw6nt922r	13	\N	\N	\N
ncpilr3vsko	k6bw6nt922r	14	\N	\N	\N
we4al08cgrl	k6bw6nt922r	15	\N	\N	\N
38urc2isvyr	xf7n1l4jksl	11	\N	\N	\N
9m9g4daljpc	xf7n1l4jksl	12	\N	\N	\N
dkwjpd81q5f	xf7n1l4jksl	13	\N	\N	\N
c2f9t3q258l	xf7n1l4jksl	14	\N	\N	\N
328zsdxa1d2	xf7n1l4jksl	15	\N	\N	\N
bvb25kzrb9u	xf7n1l4jksl	16	\N	\N	\N
ncpilr3vsko	xf7n1l4jksl	17	\N	\N	\N
we4al08cgrl	xf7n1l4jksl	18	\N	\N	\N
38urc2isvyr	dc3a24ug4ro	13	\N	\N	\N
9m9g4daljpc	dc3a24ug4ro	14	\N	\N	\N
dkwjpd81q5f	dc3a24ug4ro	15	\N	\N	\N
c2f9t3q258l	dc3a24ug4ro	16	\N	\N	\N
328zsdxa1d2	dc3a24ug4ro	17	\N	\N	\N
bvb25kzrb9u	dc3a24ug4ro	18	\N	\N	\N
ncpilr3vsko	dc3a24ug4ro	19	\N	\N	\N
we4al08cgrl	dc3a24ug4ro	20	\N	\N	\N
38urc2isvyr	ltgjpq6zk6e	14	\N	\N	\N
9m9g4daljpc	ltgjpq6zk6e	15	\N	\N	\N
dkwjpd81q5f	ltgjpq6zk6e	16	\N	\N	\N
c2f9t3q258l	ltgjpq6zk6e	17	\N	\N	\N
328zsdxa1d2	ltgjpq6zk6e	18	\N	\N	\N
bvb25kzrb9u	ltgjpq6zk6e	19	\N	\N	\N
ncpilr3vsko	ltgjpq6zk6e	20	\N	\N	\N
we4al08cgrl	ltgjpq6zk6e	21	\N	\N	\N
38urc2isvyr	z4jurrahhqw	15	\N	\N	\N
9m9g4daljpc	z4jurrahhqw	16	\N	\N	\N
dkwjpd81q5f	z4jurrahhqw	17	\N	\N	\N
c2f9t3q258l	z4jurrahhqw	18	\N	\N	\N
328zsdxa1d2	z4jurrahhqw	19	\N	\N	\N
bvb25kzrb9u	z4jurrahhqw	20	\N	\N	\N
ncpilr3vsko	z4jurrahhqw	21	\N	\N	\N
we4al08cgrl	z4jurrahhqw	22	\N	\N	\N
38urc2isvyr	3h47wtgjzlg	13	\N	\N	\N
9m9g4daljpc	3h47wtgjzlg	14	\N	\N	\N
dkwjpd81q5f	3h47wtgjzlg	15	\N	\N	\N
c2f9t3q258l	3h47wtgjzlg	16	\N	\N	\N
328zsdxa1d2	3h47wtgjzlg	17	\N	\N	\N
bvb25kzrb9u	3h47wtgjzlg	18	\N	\N	\N
ncpilr3vsko	3h47wtgjzlg	19	\N	\N	\N
we4al08cgrl	3h47wtgjzlg	20	\N	\N	\N
38urc2isvyr	zpfkanx7xeh	14	\N	\N	\N
9m9g4daljpc	zpfkanx7xeh	15	\N	\N	\N
dkwjpd81q5f	zpfkanx7xeh	16	\N	\N	\N
c2f9t3q258l	zpfkanx7xeh	17	\N	\N	\N
328zsdxa1d2	zpfkanx7xeh	18	\N	\N	\N
bvb25kzrb9u	zpfkanx7xeh	19	\N	\N	\N
ncpilr3vsko	zpfkanx7xeh	20	\N	\N	\N
we4al08cgrl	zpfkanx7xeh	21	\N	\N	\N
38urc2isvyr	9tlwx5sdtsv	15	\N	\N	\N
9m9g4daljpc	9tlwx5sdtsv	16	\N	\N	\N
dkwjpd81q5f	9tlwx5sdtsv	17	\N	\N	\N
c2f9t3q258l	9tlwx5sdtsv	18	\N	\N	\N
328zsdxa1d2	9tlwx5sdtsv	19	\N	\N	\N
bvb25kzrb9u	9tlwx5sdtsv	20	\N	\N	\N
ncpilr3vsko	9tlwx5sdtsv	21	\N	\N	\N
we4al08cgrl	9tlwx5sdtsv	22	\N	\N	\N
38urc2isvyr	awxbyrawxmp	13	\N	\N	\N
9m9g4daljpc	awxbyrawxmp	14	\N	\N	\N
dkwjpd81q5f	awxbyrawxmp	15	\N	\N	\N
c2f9t3q258l	awxbyrawxmp	16	\N	\N	\N
328zsdxa1d2	awxbyrawxmp	17	\N	\N	\N
bvb25kzrb9u	awxbyrawxmp	18	\N	\N	\N
ncpilr3vsko	awxbyrawxmp	19	\N	\N	\N
we4al08cgrl	awxbyrawxmp	20	\N	\N	\N
38urc2isvyr	d9xmgv8c1nm	15	\N	\N	\N
9m9g4daljpc	d9xmgv8c1nm	16	\N	\N	\N
dkwjpd81q5f	d9xmgv8c1nm	17	\N	\N	\N
c2f9t3q258l	d9xmgv8c1nm	18	\N	\N	\N
328zsdxa1d2	d9xmgv8c1nm	19	\N	\N	\N
bvb25kzrb9u	d9xmgv8c1nm	20	\N	\N	\N
ncpilr3vsko	d9xmgv8c1nm	21	\N	\N	\N
we4al08cgrl	d9xmgv8c1nm	22	\N	\N	\N
38urc2isvyr	muy0v6uh3hn	13	\N	\N	\N
9m9g4daljpc	muy0v6uh3hn	14	\N	\N	\N
dkwjpd81q5f	muy0v6uh3hn	15	\N	\N	\N
c2f9t3q258l	muy0v6uh3hn	16	\N	\N	\N
328zsdxa1d2	muy0v6uh3hn	17	\N	\N	\N
bvb25kzrb9u	muy0v6uh3hn	18	\N	\N	\N
ncpilr3vsko	muy0v6uh3hn	19	\N	\N	\N
we4al08cgrl	muy0v6uh3hn	20	\N	\N	\N
38urc2isvyr	zn7elpmsysr	14	\N	\N	\N
9m9g4daljpc	zn7elpmsysr	15	\N	\N	\N
dkwjpd81q5f	zn7elpmsysr	16	\N	\N	\N
c2f9t3q258l	zn7elpmsysr	17	\N	\N	\N
328zsdxa1d2	zn7elpmsysr	18	\N	\N	\N
bvb25kzrb9u	zn7elpmsysr	19	\N	\N	\N
ncpilr3vsko	zn7elpmsysr	20	\N	\N	\N
we4al08cgrl	zn7elpmsysr	21	\N	\N	\N
38urc2isvyr	7wcriuxmrla	13	\N	\N	\N
9m9g4daljpc	7wcriuxmrla	14	\N	\N	\N
dkwjpd81q5f	7wcriuxmrla	15	\N	\N	\N
c2f9t3q258l	7wcriuxmrla	16	\N	\N	\N
328zsdxa1d2	7wcriuxmrla	17	\N	\N	\N
bvb25kzrb9u	7wcriuxmrla	18	\N	\N	\N
ncpilr3vsko	7wcriuxmrla	19	\N	\N	\N
we4al08cgrl	7wcriuxmrla	20	\N	\N	\N
38urc2isvyr	dfsaiiu616q	14	\N	\N	\N
9m9g4daljpc	dfsaiiu616q	15	\N	\N	\N
dkwjpd81q5f	dfsaiiu616q	16	\N	\N	\N
c2f9t3q258l	dfsaiiu616q	17	\N	\N	\N
328zsdxa1d2	dfsaiiu616q	18	\N	\N	\N
bvb25kzrb9u	dfsaiiu616q	19	\N	\N	\N
ncpilr3vsko	dfsaiiu616q	20	\N	\N	\N
we4al08cgrl	dfsaiiu616q	21	\N	\N	\N
38urc2isvyr	wflzjg2fsvz	15	\N	\N	\N
9m9g4daljpc	wflzjg2fsvz	16	\N	\N	\N
dkwjpd81q5f	wflzjg2fsvz	17	\N	\N	\N
c2f9t3q258l	wflzjg2fsvz	18	\N	\N	\N
328zsdxa1d2	wflzjg2fsvz	19	\N	\N	\N
bvb25kzrb9u	wflzjg2fsvz	20	\N	\N	\N
ncpilr3vsko	wflzjg2fsvz	21	\N	\N	\N
we4al08cgrl	wflzjg2fsvz	22	\N	\N	\N
38urc2isvyr	b75wrghi14w	18	\N	\N	\N
9m9g4daljpc	b75wrghi14w	19	\N	\N	\N
dkwjpd81q5f	b75wrghi14w	20	\N	\N	\N
c2f9t3q258l	b75wrghi14w	21	\N	\N	\N
328zsdxa1d2	b75wrghi14w	22	\N	\N	\N
bvb25kzrb9u	b75wrghi14w	23	\N	\N	\N
ncpilr3vsko	b75wrghi14w	24	\N	\N	\N
we4al08cgrl	b75wrghi14w	25	\N	\N	\N
38urc2isvyr	fbjhmky7951	19	\N	\N	\N
9m9g4daljpc	fbjhmky7951	20	\N	\N	\N
dkwjpd81q5f	fbjhmky7951	21	\N	\N	\N
c2f9t3q258l	fbjhmky7951	22	\N	\N	\N
328zsdxa1d2	fbjhmky7951	23	\N	\N	\N
bvb25kzrb9u	fbjhmky7951	24	\N	\N	\N
ncpilr3vsko	fbjhmky7951	25	\N	\N	\N
we4al08cgrl	fbjhmky7951	26	\N	\N	\N
38urc2isvyr	itlawwwc24z	17	\N	\N	\N
9m9g4daljpc	itlawwwc24z	18	\N	\N	\N
dkwjpd81q5f	itlawwwc24z	19	\N	\N	\N
c2f9t3q258l	itlawwwc24z	20	\N	\N	\N
328zsdxa1d2	itlawwwc24z	21	\N	\N	\N
bvb25kzrb9u	itlawwwc24z	22	\N	\N	\N
ncpilr3vsko	itlawwwc24z	23	\N	\N	\N
we4al08cgrl	itlawwwc24z	24	\N	\N	\N
38urc2isvyr	ps934my2yup	15	\N	\N	\N
9m9g4daljpc	ps934my2yup	16	\N	\N	\N
dkwjpd81q5f	ps934my2yup	17	\N	\N	\N
c2f9t3q258l	ps934my2yup	18	\N	\N	\N
328zsdxa1d2	ps934my2yup	19	\N	\N	\N
bvb25kzrb9u	ps934my2yup	20	\N	\N	\N
ncpilr3vsko	ps934my2yup	21	\N	\N	\N
we4al08cgrl	ps934my2yup	22	\N	\N	\N
38urc2isvyr	tuq7k5ttf23	14	\N	\N	\N
9m9g4daljpc	tuq7k5ttf23	15	\N	\N	\N
dkwjpd81q5f	tuq7k5ttf23	16	\N	\N	\N
c2f9t3q258l	tuq7k5ttf23	17	\N	\N	\N
328zsdxa1d2	tuq7k5ttf23	18	\N	\N	\N
bvb25kzrb9u	tuq7k5ttf23	19	\N	\N	\N
ncpilr3vsko	tuq7k5ttf23	20	\N	\N	\N
we4al08cgrl	tuq7k5ttf23	21	\N	\N	\N
38urc2isvyr	v0r4hvxvb4v	16	\N	\N	\N
9m9g4daljpc	v0r4hvxvb4v	17	\N	\N	\N
dkwjpd81q5f	v0r4hvxvb4v	18	\N	\N	\N
c2f9t3q258l	v0r4hvxvb4v	19	\N	\N	\N
328zsdxa1d2	v0r4hvxvb4v	20	\N	\N	\N
bvb25kzrb9u	v0r4hvxvb4v	21	\N	\N	\N
ncpilr3vsko	v0r4hvxvb4v	22	\N	\N	\N
we4al08cgrl	v0r4hvxvb4v	23	\N	\N	\N
9m9g4daljpc	7e38fr8xa7m	2	\N	\N	\N
dkwjpd81q5f	7e38fr8xa7m	3	\N	\N	\N
c2f9t3q258l	7e38fr8xa7m	4	\N	\N	\N
328zsdxa1d2	7e38fr8xa7m	5	\N	\N	\N
bvb25kzrb9u	7e38fr8xa7m	6	\N	\N	\N
ncpilr3vsko	7e38fr8xa7m	7	\N	\N	\N
we4al08cgrl	7e38fr8xa7m	8	\N	\N	\N
7e38fr8xa7m	7e38fr8xa7m	0	f	properties	\N
38urc2isvyr	7e38fr8xa7m	1	\N	\N	7
s7ppiu6idan	7p14adw4n9n	10	\N	\N	\N
9gg7w4ctvy1	7p14adw4n9n	11	\N	\N	\N
4ea0eg22s6f	7p14adw4n9n	12	\N	\N	\N
5i6s9h3z12w	7p14adw4n9n	13	\N	\N	\N
3o0nafjc9zn	7p14adw4n9n	14	\N	\N	\N
wpw2zdgvred	7p14adw4n9n	15	\N	\N	\N
we4al08cgrl	7p14adw4n9n	16	\N	\N	\N
ldb7xlegtqv	bx5jcj5t34u	2	\N	\N	\N
nnw8hb8g14c	bx5jcj5t34u	3	\N	\N	\N
wzegw15krxc	bx5jcj5t34u	4	\N	\N	\N
xt1t69pgjvf	bx5jcj5t34u	5	\N	\N	\N
a540x2nf55u	bx5jcj5t34u	6	\N	\N	\N
s7ppiu6idan	bx5jcj5t34u	7	\N	\N	\N
9gg7w4ctvy1	bx5jcj5t34u	8	\N	\N	\N
4ea0eg22s6f	bx5jcj5t34u	9	\N	\N	\N
5i6s9h3z12w	bx5jcj5t34u	10	\N	\N	\N
3o0nafjc9zn	bx5jcj5t34u	11	\N	\N	\N
wpw2zdgvred	bx5jcj5t34u	12	\N	\N	\N
we4al08cgrl	bx5jcj5t34u	13	\N	\N	\N
026mxjz1xlz	d0t11ss0foi	5	\N	\N	\N
ldb7xlegtqv	d0t11ss0foi	6	\N	\N	\N
nnw8hb8g14c	d0t11ss0foi	7	\N	\N	\N
wzegw15krxc	d0t11ss0foi	8	\N	\N	\N
xt1t69pgjvf	d0t11ss0foi	9	\N	\N	\N
a540x2nf55u	d0t11ss0foi	10	\N	\N	\N
s7ppiu6idan	d0t11ss0foi	11	\N	\N	\N
9gg7w4ctvy1	d0t11ss0foi	12	\N	\N	\N
4ea0eg22s6f	d0t11ss0foi	13	\N	\N	\N
5i6s9h3z12w	d0t11ss0foi	14	\N	\N	\N
3o0nafjc9zn	d0t11ss0foi	15	\N	\N	\N
wpw2zdgvred	d0t11ss0foi	16	\N	\N	\N
we4al08cgrl	d0t11ss0foi	17	\N	\N	\N
026mxjz1xlz	hxbstnj3c38	3	\N	\N	\N
ldb7xlegtqv	hxbstnj3c38	4	\N	\N	\N
nnw8hb8g14c	hxbstnj3c38	5	\N	\N	\N
wzegw15krxc	hxbstnj3c38	6	\N	\N	\N
xt1t69pgjvf	hxbstnj3c38	7	\N	\N	\N
a540x2nf55u	hxbstnj3c38	8	\N	\N	\N
s7ppiu6idan	hxbstnj3c38	9	\N	\N	\N
9gg7w4ctvy1	hxbstnj3c38	10	\N	\N	\N
4ea0eg22s6f	hxbstnj3c38	11	\N	\N	\N
5i6s9h3z12w	hxbstnj3c38	12	\N	\N	\N
3o0nafjc9zn	hxbstnj3c38	13	\N	\N	\N
wpw2zdgvred	hxbstnj3c38	14	\N	\N	\N
we4al08cgrl	hxbstnj3c38	15	\N	\N	\N
026mxjz1xlz	l0eupz9wlk3	5	\N	\N	\N
ldb7xlegtqv	l0eupz9wlk3	6	\N	\N	\N
nnw8hb8g14c	l0eupz9wlk3	7	\N	\N	\N
wzegw15krxc	l0eupz9wlk3	8	\N	\N	\N
xt1t69pgjvf	l0eupz9wlk3	9	\N	\N	\N
a540x2nf55u	l0eupz9wlk3	10	\N	\N	\N
s7ppiu6idan	l0eupz9wlk3	11	\N	\N	\N
9gg7w4ctvy1	l0eupz9wlk3	12	\N	\N	\N
4ea0eg22s6f	l0eupz9wlk3	13	\N	\N	\N
5i6s9h3z12w	l0eupz9wlk3	14	\N	\N	\N
3o0nafjc9zn	l0eupz9wlk3	15	\N	\N	\N
wpw2zdgvred	l0eupz9wlk3	16	\N	\N	\N
we4al08cgrl	l0eupz9wlk3	17	\N	\N	\N
026mxjz1xlz	owhsxq5010d	2	\N	\N	\N
ldb7xlegtqv	owhsxq5010d	3	\N	\N	\N
nnw8hb8g14c	owhsxq5010d	4	\N	\N	\N
wzegw15krxc	owhsxq5010d	5	\N	\N	\N
xt1t69pgjvf	owhsxq5010d	6	\N	\N	\N
a540x2nf55u	owhsxq5010d	7	\N	\N	\N
s7ppiu6idan	owhsxq5010d	8	\N	\N	\N
9gg7w4ctvy1	owhsxq5010d	9	\N	\N	\N
4ea0eg22s6f	owhsxq5010d	10	\N	\N	\N
5i6s9h3z12w	owhsxq5010d	11	\N	\N	\N
3o0nafjc9zn	owhsxq5010d	12	\N	\N	\N
wpw2zdgvred	owhsxq5010d	13	\N	\N	\N
we4al08cgrl	owhsxq5010d	14	\N	\N	\N
bx5jcj5t34u	bx5jcj5t34u	0	f	properties	\N
026mxjz1xlz	bx5jcj5t34u	1	\N	\N	1
h26r06rfuxj	h26r06rfuxj	0	f	properties	\N
ryvctxlr3ev	h26r06rfuxj	1	\N	\N	1
8i1mc2nfur8	8i1mc2nfur8	0	f	properties	\N
h26r06rfuxj	8i1mc2nfur8	1	\N	\N	1
ryvctxlr3ev	8i1mc2nfur8	2	\N	\N	1
d0t11ss0foi	8i1mc2nfur8	3	\N	\N	\N
7p14adw4n9n	8i1mc2nfur8	4	\N	\N	\N
hxbstnj3c38	8i1mc2nfur8	5	\N	\N	\N
owhsxq5010d	8i1mc2nfur8	6	\N	\N	\N
bx5jcj5t34u	8i1mc2nfur8	7	\N	\N	\N
026mxjz1xlz	8i1mc2nfur8	8	\N	\N	\N
ldb7xlegtqv	8i1mc2nfur8	9	\N	\N	\N
nnw8hb8g14c	8i1mc2nfur8	10	\N	\N	\N
wzegw15krxc	8i1mc2nfur8	11	\N	\N	\N
xt1t69pgjvf	8i1mc2nfur8	12	\N	\N	\N
a540x2nf55u	8i1mc2nfur8	13	\N	\N	\N
s7ppiu6idan	8i1mc2nfur8	14	\N	\N	\N
9gg7w4ctvy1	8i1mc2nfur8	15	\N	\N	\N
4ea0eg22s6f	8i1mc2nfur8	16	\N	\N	\N
5i6s9h3z12w	8i1mc2nfur8	17	\N	\N	\N
3o0nafjc9zn	8i1mc2nfur8	18	\N	\N	\N
wpw2zdgvred	8i1mc2nfur8	19	\N	\N	\N
we4al08cgrl	8i1mc2nfur8	20	\N	\N	\N
d0t11ss0foi	h26r06rfuxj	2	\N	\N	\N
7p14adw4n9n	h26r06rfuxj	3	\N	\N	\N
hxbstnj3c38	h26r06rfuxj	4	\N	\N	\N
owhsxq5010d	h26r06rfuxj	5	\N	\N	\N
bx5jcj5t34u	h26r06rfuxj	6	\N	\N	\N
026mxjz1xlz	h26r06rfuxj	7	\N	\N	\N
ldb7xlegtqv	h26r06rfuxj	8	\N	\N	\N
ryvctxlr3ev	ryvctxlr3ev	0	f	properties	\N
xaqtxcn6wk1	gdl7xj6l7qi	3	\N	\N	\N
xnnjkcrpivt	ie3s6t8ry35	7	\N	\N	\N
kuxb9m62gau	ie3s6t8ry35	8	\N	\N	\N
28fjk12kdqn	ie3s6t8ry35	9	\N	\N	\N
5wtyj13hh7k	ie3s6t8ry35	10	\N	\N	\N
v160lx9x03s	ie3s6t8ry35	11	\N	\N	\N
r34c545vn0o	ie3s6t8ry35	12	\N	\N	\N
s7ppiu6idan	ie3s6t8ry35	13	\N	\N	\N
9gg7w4ctvy1	ie3s6t8ry35	14	\N	\N	\N
4ea0eg22s6f	ie3s6t8ry35	15	\N	\N	\N
5i6s9h3z12w	ie3s6t8ry35	16	\N	\N	\N
3o0nafjc9zn	ie3s6t8ry35	17	\N	\N	\N
wpw2zdgvred	ie3s6t8ry35	18	\N	\N	\N
we4al08cgrl	ie3s6t8ry35	19	\N	\N	\N
74wiu3prkat	mg6e604h4ue	4	\N	\N	\N
pujioj8krv0	mg6e604h4ue	5	\N	\N	\N
xnnjkcrpivt	mg6e604h4ue	6	\N	\N	\N
kuxb9m62gau	mg6e604h4ue	7	\N	\N	\N
28fjk12kdqn	mg6e604h4ue	8	\N	\N	\N
5wtyj13hh7k	mg6e604h4ue	9	\N	\N	\N
v160lx9x03s	mg6e604h4ue	10	\N	\N	\N
r34c545vn0o	mg6e604h4ue	11	\N	\N	\N
s7ppiu6idan	mg6e604h4ue	12	\N	\N	\N
9gg7w4ctvy1	mg6e604h4ue	13	\N	\N	\N
4ea0eg22s6f	mg6e604h4ue	14	\N	\N	\N
5i6s9h3z12w	mg6e604h4ue	15	\N	\N	\N
3o0nafjc9zn	mg6e604h4ue	16	\N	\N	\N
wpw2zdgvred	mg6e604h4ue	17	\N	\N	\N
we4al08cgrl	mg6e604h4ue	18	\N	\N	\N
74wiu3prkat	mxsi688ucom	2	\N	\N	\N
pujioj8krv0	mxsi688ucom	3	\N	\N	\N
xnnjkcrpivt	mxsi688ucom	4	\N	\N	\N
kuxb9m62gau	mxsi688ucom	5	\N	\N	\N
28fjk12kdqn	mxsi688ucom	6	\N	\N	\N
5wtyj13hh7k	mxsi688ucom	7	\N	\N	\N
v160lx9x03s	mxsi688ucom	8	\N	\N	\N
r34c545vn0o	mxsi688ucom	9	\N	\N	\N
s7ppiu6idan	mxsi688ucom	10	\N	\N	\N
9gg7w4ctvy1	mxsi688ucom	11	\N	\N	\N
4ea0eg22s6f	mxsi688ucom	12	\N	\N	\N
5i6s9h3z12w	mxsi688ucom	13	\N	\N	\N
3o0nafjc9zn	mxsi688ucom	14	\N	\N	\N
wpw2zdgvred	mxsi688ucom	15	\N	\N	\N
we4al08cgrl	mxsi688ucom	16	\N	\N	\N
pujioj8krv0	qi3rrli2wdj	2	\N	\N	\N
xnnjkcrpivt	qi3rrli2wdj	3	\N	\N	\N
kuxb9m62gau	qi3rrli2wdj	4	\N	\N	\N
28fjk12kdqn	qi3rrli2wdj	5	\N	\N	\N
5wtyj13hh7k	qi3rrli2wdj	6	\N	\N	\N
v160lx9x03s	qi3rrli2wdj	7	\N	\N	\N
r34c545vn0o	qi3rrli2wdj	8	\N	\N	\N
s7ppiu6idan	qi3rrli2wdj	9	\N	\N	\N
9gg7w4ctvy1	qi3rrli2wdj	10	\N	\N	\N
4ea0eg22s6f	qi3rrli2wdj	11	\N	\N	\N
5i6s9h3z12w	qi3rrli2wdj	12	\N	\N	\N
3o0nafjc9zn	qi3rrli2wdj	13	\N	\N	\N
wpw2zdgvred	qi3rrli2wdj	14	\N	\N	\N
we4al08cgrl	qi3rrli2wdj	15	\N	\N	\N
74wiu3prkat	qi3rrli2wdj	1	\N	\N	1
c6uhdtd1451	c6uhdtd1451	0	f	properties	\N
8rrvude4dga	c6uhdtd1451	1	\N	\N	1
vqa6y5o31rh	vqa6y5o31rh	0	f	properties	\N
c6uhdtd1451	vqa6y5o31rh	1	\N	\N	1
8rrvude4dga	vqa6y5o31rh	2	\N	\N	1
mg6e604h4ue	8rrvude4dga	2	\N	\N	\N
863sbhkbfon	8rrvude4dga	3	\N	\N	\N
mxsi688ucom	8rrvude4dga	4	\N	\N	\N
qi3rrli2wdj	8rrvude4dga	5	\N	\N	\N
74wiu3prkat	8rrvude4dga	6	\N	\N	\N
pujioj8krv0	8rrvude4dga	7	\N	\N	\N
xnnjkcrpivt	8rrvude4dga	8	\N	\N	\N
kuxb9m62gau	8rrvude4dga	9	\N	\N	\N
28fjk12kdqn	8rrvude4dga	10	\N	\N	\N
5wtyj13hh7k	8rrvude4dga	11	\N	\N	\N
v160lx9x03s	8rrvude4dga	12	\N	\N	\N
r34c545vn0o	8rrvude4dga	13	\N	\N	\N
s7ppiu6idan	8rrvude4dga	14	\N	\N	\N
9gg7w4ctvy1	8rrvude4dga	15	\N	\N	\N
4ea0eg22s6f	8rrvude4dga	16	\N	\N	\N
5i6s9h3z12w	8rrvude4dga	17	\N	\N	\N
3o0nafjc9zn	8rrvude4dga	18	\N	\N	\N
wpw2zdgvred	8rrvude4dga	19	\N	\N	\N
we4al08cgrl	8rrvude4dga	20	\N	\N	\N
ie3s6t8ry35	c6uhdtd1451	2	\N	\N	\N
mg6e604h4ue	c6uhdtd1451	3	\N	\N	\N
863sbhkbfon	c6uhdtd1451	4	\N	\N	\N
mxsi688ucom	c6uhdtd1451	5	\N	\N	\N
qi3rrli2wdj	c6uhdtd1451	6	\N	\N	\N
74wiu3prkat	c6uhdtd1451	7	\N	\N	\N
pujioj8krv0	c6uhdtd1451	8	\N	\N	\N
xnnjkcrpivt	c6uhdtd1451	9	\N	\N	\N
kuxb9m62gau	c6uhdtd1451	10	\N	\N	\N
28fjk12kdqn	c6uhdtd1451	11	\N	\N	\N
5wtyj13hh7k	c6uhdtd1451	12	\N	\N	\N
v160lx9x03s	c6uhdtd1451	13	\N	\N	\N
r34c545vn0o	c6uhdtd1451	14	\N	\N	\N
s7ppiu6idan	c6uhdtd1451	15	\N	\N	\N
9gg7w4ctvy1	c6uhdtd1451	16	\N	\N	\N
4ea0eg22s6f	c6uhdtd1451	17	\N	\N	\N
5i6s9h3z12w	c6uhdtd1451	18	\N	\N	\N
3o0nafjc9zn	c6uhdtd1451	19	\N	\N	\N
wpw2zdgvred	c6uhdtd1451	20	\N	\N	\N
we4al08cgrl	c6uhdtd1451	21	\N	\N	\N
ie3s6t8ry35	vqa6y5o31rh	3	\N	\N	\N
mg6e604h4ue	vqa6y5o31rh	4	\N	\N	\N
863sbhkbfon	vqa6y5o31rh	5	\N	\N	\N
mxsi688ucom	vqa6y5o31rh	6	\N	\N	\N
qi3rrli2wdj	vqa6y5o31rh	7	\N	\N	\N
74wiu3prkat	vqa6y5o31rh	8	\N	\N	\N
pujioj8krv0	vqa6y5o31rh	9	\N	\N	\N
xnnjkcrpivt	vqa6y5o31rh	10	\N	\N	\N
kuxb9m62gau	vqa6y5o31rh	11	\N	\N	\N
28fjk12kdqn	vqa6y5o31rh	12	\N	\N	\N
5wtyj13hh7k	vqa6y5o31rh	13	\N	\N	\N
v160lx9x03s	vqa6y5o31rh	14	\N	\N	\N
r34c545vn0o	vqa6y5o31rh	15	\N	\N	\N
s7ppiu6idan	vqa6y5o31rh	16	\N	\N	\N
9gg7w4ctvy1	vqa6y5o31rh	17	\N	\N	\N
4ea0eg22s6f	vqa6y5o31rh	18	\N	\N	\N
5i6s9h3z12w	vqa6y5o31rh	19	\N	\N	\N
3o0nafjc9zn	vqa6y5o31rh	20	\N	\N	\N
wpw2zdgvred	vqa6y5o31rh	21	\N	\N	\N
we4al08cgrl	vqa6y5o31rh	22	\N	\N	\N
8rrvude4dga	8rrvude4dga	0	f	properties	\N
ie3s6t8ry35	8rrvude4dga	1	\N	\N	1
7lb2pemgi8c	7lb2pemgi8c	0	f	properties	\N
wvi0zwg5loa	wvi0zwg5loa	0	f	properties	\N
dijzb61rbsv	wvi0zwg5loa	1	\N	\N	1
5rlnnzhzvlu	5kdewgfri3r	2	\N	\N	\N
9yf4qjq6xtn	5kdewgfri3r	3	\N	\N	\N
1dsb6ktfpw0	5kdewgfri3r	4	\N	\N	\N
9a5cnn8va7i	5kdewgfri3r	5	\N	\N	\N
9wsmhrm9np0	5kdewgfri3r	6	\N	\N	\N
jw2um47b1kq	5kdewgfri3r	7	\N	\N	\N
s2j1mca129k	5kdewgfri3r	8	\N	\N	\N
are93oh007m	5kdewgfri3r	9	\N	\N	\N
setmbtb7hr8	5kdewgfri3r	10	\N	\N	\N
5wtyj13hh7k	5kdewgfri3r	11	\N	\N	\N
v160lx9x03s	5kdewgfri3r	12	\N	\N	\N
r34c545vn0o	5kdewgfri3r	13	\N	\N	\N
s7ppiu6idan	5kdewgfri3r	14	\N	\N	\N
9gg7w4ctvy1	5kdewgfri3r	15	\N	\N	\N
4ea0eg22s6f	5kdewgfri3r	16	\N	\N	\N
5i6s9h3z12w	5kdewgfri3r	17	\N	\N	\N
3o0nafjc9zn	5kdewgfri3r	18	\N	\N	\N
wpw2zdgvred	5kdewgfri3r	19	\N	\N	\N
we4al08cgrl	5kdewgfri3r	20	\N	\N	\N
p86ow4sckcj	qktzdcfxe49	3	\N	\N	\N
5rlnnzhzvlu	qktzdcfxe49	4	\N	\N	\N
9yf4qjq6xtn	qktzdcfxe49	5	\N	\N	\N
1dsb6ktfpw0	qktzdcfxe49	6	\N	\N	\N
9a5cnn8va7i	qktzdcfxe49	7	\N	\N	\N
mg6e604h4ue	dijzb61rbsv	2	\N	\N	\N
863sbhkbfon	dijzb61rbsv	3	\N	\N	\N
mxsi688ucom	dijzb61rbsv	4	\N	\N	\N
qi3rrli2wdj	dijzb61rbsv	5	\N	\N	\N
74wiu3prkat	dijzb61rbsv	6	\N	\N	\N
pujioj8krv0	dijzb61rbsv	7	\N	\N	\N
xnnjkcrpivt	dijzb61rbsv	8	\N	\N	\N
kuxb9m62gau	dijzb61rbsv	9	\N	\N	\N
28fjk12kdqn	dijzb61rbsv	10	\N	\N	\N
5wtyj13hh7k	dijzb61rbsv	11	\N	\N	\N
v160lx9x03s	dijzb61rbsv	12	\N	\N	\N
r34c545vn0o	dijzb61rbsv	13	\N	\N	\N
s7ppiu6idan	dijzb61rbsv	14	\N	\N	\N
9gg7w4ctvy1	dijzb61rbsv	15	\N	\N	\N
4ea0eg22s6f	dijzb61rbsv	16	\N	\N	\N
5i6s9h3z12w	dijzb61rbsv	17	\N	\N	\N
3o0nafjc9zn	dijzb61rbsv	18	\N	\N	\N
wpw2zdgvred	dijzb61rbsv	19	\N	\N	\N
we4al08cgrl	dijzb61rbsv	20	\N	\N	\N
ie3s6t8ry35	wvi0zwg5loa	2	\N	\N	\N
mg6e604h4ue	wvi0zwg5loa	3	\N	\N	\N
863sbhkbfon	wvi0zwg5loa	4	\N	\N	\N
mxsi688ucom	wvi0zwg5loa	5	\N	\N	\N
qi3rrli2wdj	wvi0zwg5loa	6	\N	\N	\N
74wiu3prkat	wvi0zwg5loa	7	\N	\N	\N
pujioj8krv0	wvi0zwg5loa	8	\N	\N	\N
xnnjkcrpivt	wvi0zwg5loa	9	\N	\N	\N
kuxb9m62gau	wvi0zwg5loa	10	\N	\N	\N
28fjk12kdqn	wvi0zwg5loa	11	\N	\N	\N
5wtyj13hh7k	wvi0zwg5loa	12	\N	\N	\N
v160lx9x03s	wvi0zwg5loa	13	\N	\N	\N
r34c545vn0o	wvi0zwg5loa	14	\N	\N	\N
s7ppiu6idan	wvi0zwg5loa	15	\N	\N	\N
9gg7w4ctvy1	wvi0zwg5loa	16	\N	\N	\N
4ea0eg22s6f	wvi0zwg5loa	17	\N	\N	\N
5i6s9h3z12w	wvi0zwg5loa	18	\N	\N	\N
3o0nafjc9zn	wvi0zwg5loa	19	\N	\N	\N
wpw2zdgvred	wvi0zwg5loa	20	\N	\N	\N
we4al08cgrl	wvi0zwg5loa	21	\N	\N	\N
dijzb61rbsv	dijzb61rbsv	0	f	properties	\N
9wsmhrm9np0	qktzdcfxe49	8	\N	\N	\N
jw2um47b1kq	qktzdcfxe49	9	\N	\N	\N
s2j1mca129k	qktzdcfxe49	10	\N	\N	\N
are93oh007m	qktzdcfxe49	11	\N	\N	\N
setmbtb7hr8	qktzdcfxe49	12	\N	\N	\N
5wtyj13hh7k	qktzdcfxe49	13	\N	\N	\N
20am0xmikgi	20am0xmikgi	0	f	properties	\N
ba5cmxt9wae	20am0xmikgi	1	\N	\N	1
v160lx9x03s	qktzdcfxe49	14	\N	\N	\N
r34c545vn0o	qktzdcfxe49	15	\N	\N	\N
1yerxui1rh5	1yerxui1rh5	0	f	properties	\N
20am0xmikgi	1yerxui1rh5	1	\N	\N	1
ba5cmxt9wae	1yerxui1rh5	2	\N	\N	1
s7ppiu6idan	qktzdcfxe49	16	\N	\N	\N
9gg7w4ctvy1	qktzdcfxe49	17	\N	\N	\N
9t5vw9np9jc	9t5vw9np9jc	0	f	properties	\N
1yerxui1rh5	9t5vw9np9jc	1	\N	\N	1
20am0xmikgi	9t5vw9np9jc	2	\N	\N	1
ba5cmxt9wae	9t5vw9np9jc	3	\N	\N	1
4ea0eg22s6f	qktzdcfxe49	18	\N	\N	\N
5i6s9h3z12w	qktzdcfxe49	19	\N	\N	\N
p50niwjxz32	p50niwjxz32	0	f	properties	\N
9t5vw9np9jc	p50niwjxz32	1	\N	\N	1
1yerxui1rh5	p50niwjxz32	2	\N	\N	1
20am0xmikgi	p50niwjxz32	3	\N	\N	1
ba5cmxt9wae	p50niwjxz32	4	\N	\N	1
3o0nafjc9zn	qktzdcfxe49	20	\N	\N	\N
wpw2zdgvred	qktzdcfxe49	21	\N	\N	\N
we4al08cgrl	qktzdcfxe49	22	\N	\N	\N
p86ow4sckcj	uq9pwmj23ll	2	\N	\N	\N
5rlnnzhzvlu	uq9pwmj23ll	3	\N	\N	\N
9yf4qjq6xtn	uq9pwmj23ll	4	\N	\N	\N
1dsb6ktfpw0	uq9pwmj23ll	5	\N	\N	\N
9a5cnn8va7i	uq9pwmj23ll	6	\N	\N	\N
9wsmhrm9np0	uq9pwmj23ll	7	\N	\N	\N
jw2um47b1kq	uq9pwmj23ll	8	\N	\N	\N
s2j1mca129k	uq9pwmj23ll	9	\N	\N	\N
are93oh007m	uq9pwmj23ll	10	\N	\N	\N
setmbtb7hr8	uq9pwmj23ll	11	\N	\N	\N
5wtyj13hh7k	uq9pwmj23ll	12	\N	\N	\N
v160lx9x03s	uq9pwmj23ll	13	\N	\N	\N
r34c545vn0o	uq9pwmj23ll	14	\N	\N	\N
s7ppiu6idan	uq9pwmj23ll	15	\N	\N	\N
9gg7w4ctvy1	uq9pwmj23ll	16	\N	\N	\N
4ea0eg22s6f	uq9pwmj23ll	17	\N	\N	\N
5i6s9h3z12w	uq9pwmj23ll	18	\N	\N	\N
3o0nafjc9zn	uq9pwmj23ll	19	\N	\N	\N
wpw2zdgvred	uq9pwmj23ll	20	\N	\N	\N
we4al08cgrl	uq9pwmj23ll	21	\N	\N	\N
rqurmehuffv	rqurmehuffv	0	f	properties	\N
5rlnnzhzvlu	rqurmehuffv	2	\N	\N	\N
9yf4qjq6xtn	rqurmehuffv	3	\N	\N	\N
1dsb6ktfpw0	rqurmehuffv	4	\N	\N	\N
9a5cnn8va7i	rqurmehuffv	5	\N	\N	\N
9wsmhrm9np0	rqurmehuffv	6	\N	\N	\N
jw2um47b1kq	rqurmehuffv	7	\N	\N	\N
s2j1mca129k	rqurmehuffv	8	\N	\N	\N
are93oh007m	rqurmehuffv	9	\N	\N	\N
setmbtb7hr8	rqurmehuffv	10	\N	\N	\N
5wtyj13hh7k	rqurmehuffv	11	\N	\N	\N
v160lx9x03s	rqurmehuffv	12	\N	\N	\N
r34c545vn0o	rqurmehuffv	13	\N	\N	\N
s7ppiu6idan	rqurmehuffv	14	\N	\N	\N
9gg7w4ctvy1	rqurmehuffv	15	\N	\N	\N
4ea0eg22s6f	rqurmehuffv	16	\N	\N	\N
5i6s9h3z12w	rqurmehuffv	17	\N	\N	\N
3o0nafjc9zn	rqurmehuffv	18	\N	\N	\N
wpw2zdgvred	rqurmehuffv	19	\N	\N	\N
we4al08cgrl	rqurmehuffv	20	\N	\N	\N
yfhnohad6lf	rqurmehuffv	1	\N	\N	1
p86ow4sckcj	5kdewgfri3r	1	\N	\N	4
p86ow4sckcj	xrtpdglsdom	1	\N	\N	3
eao99d5nu76	g0ijjznmv2z	3	\N	\N	1
7v9fsmf19yo	7v9fsmf19yo	0	f	properties	\N
g0ijjznmv2z	7v9fsmf19yo	1	\N	\N	1
kyjc1neko0n	7v9fsmf19yo	2	\N	\N	1
ba5cmxt9wae	ba5cmxt9wae	0	f	properties	\N
tfvwjma6h1h	7v9fsmf19yo	3	\N	\N	1
2zzl0fhh8ai	2zzl0fhh8ai	0	f	properties	\N
tyq1a9qwq1x	2zzl0fhh8ai	1	\N	\N	1
q17mcp7s7kv	62dv0mb7ltw	3	\N	\N	\N
q17mcp7s7kv	gdl7xj6l7qi	4	\N	\N	\N
vcxopxcextx	vcxopxcextx	0	f	properties	\N
d0t11ss0foi	vcxopxcextx	1	\N	\N	3
r34c545vn0o	2zzl0fhh8ai	2	\N	\N	\N
s7ppiu6idan	tyq1a9qwq1x	2	\N	\N	\N
s7ppiu6idan	2zzl0fhh8ai	3	\N	\N	\N
9gg7w4ctvy1	tyq1a9qwq1x	3	\N	\N	\N
9gg7w4ctvy1	2zzl0fhh8ai	4	\N	\N	\N
4ea0eg22s6f	tyq1a9qwq1x	4	\N	\N	\N
4ea0eg22s6f	2zzl0fhh8ai	5	\N	\N	\N
5i6s9h3z12w	tyq1a9qwq1x	5	\N	\N	\N
wvi0zwg5loa	7lb2pemgi8c	1	\N	\N	2
5i6s9h3z12w	2zzl0fhh8ai	6	\N	\N	\N
3o0nafjc9zn	tyq1a9qwq1x	6	\N	\N	\N
3o0nafjc9zn	2zzl0fhh8ai	7	\N	\N	\N
wpw2zdgvred	tyq1a9qwq1x	7	\N	\N	\N
wpw2zdgvred	2zzl0fhh8ai	8	\N	\N	\N
we4al08cgrl	tyq1a9qwq1x	8	\N	\N	\N
we4al08cgrl	2zzl0fhh8ai	9	\N	\N	\N
tyq1a9qwq1x	tyq1a9qwq1x	0	f	properties	\N
r34c545vn0o	ooax88j3yzb	1	\N	\N	5
r34c545vn0o	gh97bqcvw4r	1	\N	\N	6
r34c545vn0o	v160lx9x03s	1	\N	\N	7
r34c545vn0o	tyq1a9qwq1x	1	\N	\N	4
o8aeix1gpua	o8aeix1gpua	0	f	properties	\N
vcxopxcextx	o8aeix1gpua	1	\N	\N	1
42ylqxd43f6	42ylqxd43f6	0	f	properties	\N
o8aeix1gpua	42ylqxd43f6	1	\N	\N	1
vcxopxcextx	42ylqxd43f6	2	\N	\N	1
d0t11ss0foi	o8aeix1gpua	2	\N	\N	\N
d0t11ss0foi	42ylqxd43f6	3	\N	\N	\N
7p14adw4n9n	vcxopxcextx	2	\N	\N	\N
7p14adw4n9n	o8aeix1gpua	3	\N	\N	\N
7p14adw4n9n	42ylqxd43f6	4	\N	\N	\N
hxbstnj3c38	vcxopxcextx	3	\N	\N	\N
hxbstnj3c38	o8aeix1gpua	4	\N	\N	\N
hxbstnj3c38	42ylqxd43f6	5	\N	\N	\N
owhsxq5010d	vcxopxcextx	4	\N	\N	\N
owhsxq5010d	o8aeix1gpua	5	\N	\N	\N
owhsxq5010d	42ylqxd43f6	6	\N	\N	\N
bx5jcj5t34u	vcxopxcextx	5	\N	\N	\N
bx5jcj5t34u	o8aeix1gpua	6	\N	\N	\N
bx5jcj5t34u	42ylqxd43f6	7	\N	\N	\N
026mxjz1xlz	vcxopxcextx	6	\N	\N	\N
026mxjz1xlz	o8aeix1gpua	7	\N	\N	\N
026mxjz1xlz	42ylqxd43f6	8	\N	\N	\N
ldb7xlegtqv	vcxopxcextx	7	\N	\N	\N
ldb7xlegtqv	o8aeix1gpua	8	\N	\N	\N
ldb7xlegtqv	42ylqxd43f6	9	\N	\N	\N
nnw8hb8g14c	vcxopxcextx	8	\N	\N	\N
nnw8hb8g14c	o8aeix1gpua	9	\N	\N	\N
nnw8hb8g14c	42ylqxd43f6	10	\N	\N	\N
wzegw15krxc	vcxopxcextx	9	\N	\N	\N
wzegw15krxc	o8aeix1gpua	10	\N	\N	\N
wzegw15krxc	42ylqxd43f6	11	\N	\N	\N
xt1t69pgjvf	vcxopxcextx	10	\N	\N	\N
xt1t69pgjvf	o8aeix1gpua	11	\N	\N	\N
xt1t69pgjvf	42ylqxd43f6	12	\N	\N	\N
a540x2nf55u	vcxopxcextx	11	\N	\N	\N
a540x2nf55u	o8aeix1gpua	12	\N	\N	\N
a540x2nf55u	42ylqxd43f6	13	\N	\N	\N
s7ppiu6idan	vcxopxcextx	12	\N	\N	\N
s7ppiu6idan	o8aeix1gpua	13	\N	\N	\N
s7ppiu6idan	42ylqxd43f6	14	\N	\N	\N
9gg7w4ctvy1	vcxopxcextx	13	\N	\N	\N
9gg7w4ctvy1	o8aeix1gpua	14	\N	\N	\N
9gg7w4ctvy1	42ylqxd43f6	15	\N	\N	\N
4ea0eg22s6f	vcxopxcextx	14	\N	\N	\N
4ea0eg22s6f	o8aeix1gpua	15	\N	\N	\N
4ea0eg22s6f	42ylqxd43f6	16	\N	\N	\N
zvb21cyat9z	zvb21cyat9z	0	f	properties	\N
gnpa1gngede	zvb21cyat9z	1	\N	\N	1
5i6s9h3z12w	vcxopxcextx	15	\N	\N	\N
5i6s9h3z12w	o8aeix1gpua	16	\N	\N	\N
5i6s9h3z12w	42ylqxd43f6	17	\N	\N	\N
mg6e604h4ue	gnpa1gngede	2	\N	\N	\N
863sbhkbfon	gnpa1gngede	3	\N	\N	\N
mxsi688ucom	gnpa1gngede	4	\N	\N	\N
qi3rrli2wdj	gnpa1gngede	5	\N	\N	\N
74wiu3prkat	gnpa1gngede	6	\N	\N	\N
pujioj8krv0	gnpa1gngede	7	\N	\N	\N
xnnjkcrpivt	gnpa1gngede	8	\N	\N	\N
kuxb9m62gau	gnpa1gngede	9	\N	\N	\N
28fjk12kdqn	gnpa1gngede	10	\N	\N	\N
5wtyj13hh7k	gnpa1gngede	11	\N	\N	\N
v160lx9x03s	gnpa1gngede	12	\N	\N	\N
r34c545vn0o	gnpa1gngede	13	\N	\N	\N
s7ppiu6idan	gnpa1gngede	14	\N	\N	\N
9gg7w4ctvy1	gnpa1gngede	15	\N	\N	\N
4ea0eg22s6f	gnpa1gngede	16	\N	\N	\N
5i6s9h3z12w	gnpa1gngede	17	\N	\N	\N
3o0nafjc9zn	gnpa1gngede	18	\N	\N	\N
wpw2zdgvred	gnpa1gngede	19	\N	\N	\N
we4al08cgrl	gnpa1gngede	20	\N	\N	\N
3o0nafjc9zn	vcxopxcextx	16	\N	\N	\N
3o0nafjc9zn	o8aeix1gpua	17	\N	\N	\N
3o0nafjc9zn	42ylqxd43f6	18	\N	\N	\N
wpw2zdgvred	vcxopxcextx	17	\N	\N	\N
wpw2zdgvred	o8aeix1gpua	18	\N	\N	\N
wpw2zdgvred	42ylqxd43f6	19	\N	\N	\N
we4al08cgrl	vcxopxcextx	18	\N	\N	\N
we4al08cgrl	o8aeix1gpua	19	\N	\N	\N
we4al08cgrl	42ylqxd43f6	20	\N	\N	\N
cuz2wh0zmcz	cuz2wh0zmcz	0	f	properties	\N
64zkp91nr6d	cuz2wh0zmcz	1	\N	\N	1
alhdggfwn2b	alhdggfwn2b	0	f	properties	\N
cuz2wh0zmcz	alhdggfwn2b	1	\N	\N	1
64zkp91nr6d	alhdggfwn2b	2	\N	\N	1
ie3s6t8ry35	cuz2wh0zmcz	2	\N	\N	\N
ie3s6t8ry35	alhdggfwn2b	3	\N	\N	\N
gnpa1gngede	gnpa1gngede	0	f	properties	\N
xxa8dxeqzv7	xxa8dxeqzv7	0	f	properties	\N
mg6e604h4ue	64zkp91nr6d	2	\N	\N	\N
mg6e604h4ue	cuz2wh0zmcz	3	\N	\N	\N
mg6e604h4ue	alhdggfwn2b	4	\N	\N	\N
863sbhkbfon	64zkp91nr6d	3	\N	\N	\N
863sbhkbfon	cuz2wh0zmcz	4	\N	\N	\N
863sbhkbfon	alhdggfwn2b	5	\N	\N	\N
mxsi688ucom	64zkp91nr6d	4	\N	\N	\N
mxsi688ucom	cuz2wh0zmcz	5	\N	\N	\N
mxsi688ucom	alhdggfwn2b	6	\N	\N	\N
qi3rrli2wdj	64zkp91nr6d	5	\N	\N	\N
qi3rrli2wdj	cuz2wh0zmcz	6	\N	\N	\N
qi3rrli2wdj	alhdggfwn2b	7	\N	\N	\N
74wiu3prkat	64zkp91nr6d	6	\N	\N	\N
74wiu3prkat	cuz2wh0zmcz	7	\N	\N	\N
74wiu3prkat	alhdggfwn2b	8	\N	\N	\N
pujioj8krv0	64zkp91nr6d	7	\N	\N	\N
64zkp91nr6d	64zkp91nr6d	0	f	properties	\N
ie3s6t8ry35	64zkp91nr6d	1	\N	\N	10
lywb8khu67q	62dv0mb7ltw	4	\N	\N	\N
scx04nesokm	scx04nesokm	0	f	properties	\N
ie3s6t8ry35	zvb21cyat9z	2	\N	\N	\N
mg6e604h4ue	zvb21cyat9z	3	\N	\N	\N
863sbhkbfon	zvb21cyat9z	4	\N	\N	\N
mxsi688ucom	zvb21cyat9z	5	\N	\N	\N
qi3rrli2wdj	zvb21cyat9z	6	\N	\N	\N
74wiu3prkat	zvb21cyat9z	7	\N	\N	\N
pujioj8krv0	zvb21cyat9z	8	\N	\N	\N
xnnjkcrpivt	zvb21cyat9z	9	\N	\N	\N
kuxb9m62gau	zvb21cyat9z	10	\N	\N	\N
28fjk12kdqn	zvb21cyat9z	11	\N	\N	\N
5wtyj13hh7k	zvb21cyat9z	12	\N	\N	\N
v160lx9x03s	zvb21cyat9z	13	\N	\N	\N
r34c545vn0o	zvb21cyat9z	14	\N	\N	\N
s7ppiu6idan	zvb21cyat9z	15	\N	\N	\N
9gg7w4ctvy1	zvb21cyat9z	16	\N	\N	\N
4ea0eg22s6f	zvb21cyat9z	17	\N	\N	\N
5i6s9h3z12w	zvb21cyat9z	18	\N	\N	\N
3o0nafjc9zn	zvb21cyat9z	19	\N	\N	\N
wpw2zdgvred	zvb21cyat9z	20	\N	\N	\N
we4al08cgrl	zvb21cyat9z	21	\N	\N	\N
dqmaiq8dtfr	scx04nesokm	1	\N	\N	1
pojuh68mbys	pojuh68mbys	0	f	properties	\N
sbs86uyv02m	pojuh68mbys	1	\N	\N	1
lywb8khu67q	gdl7xj6l7qi	5	\N	\N	\N
ie3s6t8ry35	pojuh68mbys	2	\N	\N	\N
mg6e604h4ue	pojuh68mbys	3	\N	\N	\N
863sbhkbfon	pojuh68mbys	4	\N	\N	\N
mxsi688ucom	pojuh68mbys	5	\N	\N	\N
qi3rrli2wdj	pojuh68mbys	6	\N	\N	\N
74wiu3prkat	pojuh68mbys	7	\N	\N	\N
pujioj8krv0	pojuh68mbys	8	\N	\N	\N
xnnjkcrpivt	pojuh68mbys	9	\N	\N	\N
kuxb9m62gau	pojuh68mbys	10	\N	\N	\N
28fjk12kdqn	pojuh68mbys	11	\N	\N	\N
5wtyj13hh7k	pojuh68mbys	12	\N	\N	\N
v160lx9x03s	pojuh68mbys	13	\N	\N	\N
r34c545vn0o	pojuh68mbys	14	\N	\N	\N
s7ppiu6idan	pojuh68mbys	15	\N	\N	\N
9gg7w4ctvy1	pojuh68mbys	16	\N	\N	\N
4ea0eg22s6f	pojuh68mbys	17	\N	\N	\N
5i6s9h3z12w	pojuh68mbys	18	\N	\N	\N
3o0nafjc9zn	pojuh68mbys	19	\N	\N	\N
wpw2zdgvred	pojuh68mbys	20	\N	\N	\N
we4al08cgrl	pojuh68mbys	21	\N	\N	\N
s2f6dhfqp5d	62dv0mb7ltw	6	\N	\N	\N
mg6e604h4ue	sbs86uyv02m	2	\N	\N	\N
863sbhkbfon	sbs86uyv02m	3	\N	\N	\N
mxsi688ucom	sbs86uyv02m	4	\N	\N	\N
qi3rrli2wdj	sbs86uyv02m	5	\N	\N	\N
74wiu3prkat	sbs86uyv02m	6	\N	\N	\N
pujioj8krv0	sbs86uyv02m	7	\N	\N	\N
xnnjkcrpivt	sbs86uyv02m	8	\N	\N	\N
kuxb9m62gau	sbs86uyv02m	9	\N	\N	\N
28fjk12kdqn	sbs86uyv02m	10	\N	\N	\N
5wtyj13hh7k	sbs86uyv02m	11	\N	\N	\N
v160lx9x03s	sbs86uyv02m	12	\N	\N	\N
r34c545vn0o	sbs86uyv02m	13	\N	\N	\N
s7ppiu6idan	sbs86uyv02m	14	\N	\N	\N
9gg7w4ctvy1	sbs86uyv02m	15	\N	\N	\N
4ea0eg22s6f	sbs86uyv02m	16	\N	\N	\N
5i6s9h3z12w	sbs86uyv02m	17	\N	\N	\N
3o0nafjc9zn	sbs86uyv02m	18	\N	\N	\N
wpw2zdgvred	sbs86uyv02m	19	\N	\N	\N
we4al08cgrl	sbs86uyv02m	20	\N	\N	\N
s2f6dhfqp5d	gdl7xj6l7qi	7	\N	\N	\N
p86ow4sckcj	scx04nesokm	2	\N	\N	\N
bdo3e9silbn	62dv0mb7ltw	7	\N	\N	\N
5rlnnzhzvlu	dqmaiq8dtfr	2	\N	\N	\N
5rlnnzhzvlu	scx04nesokm	3	\N	\N	\N
bdo3e9silbn	gdl7xj6l7qi	8	\N	\N	\N
9yf4qjq6xtn	dqmaiq8dtfr	3	\N	\N	\N
9yf4qjq6xtn	scx04nesokm	4	\N	\N	\N
we4al08cgrl	62dv0mb7ltw	8	\N	\N	\N
1dsb6ktfpw0	dqmaiq8dtfr	4	\N	\N	\N
1dsb6ktfpw0	scx04nesokm	5	\N	\N	\N
we4al08cgrl	gdl7xj6l7qi	9	\N	\N	\N
9a5cnn8va7i	dqmaiq8dtfr	5	\N	\N	\N
9a5cnn8va7i	scx04nesokm	6	\N	\N	\N
62dv0mb7ltw	62dv0mb7ltw	0	f	properties	\N
9wsmhrm9np0	dqmaiq8dtfr	6	\N	\N	\N
9wsmhrm9np0	scx04nesokm	7	\N	\N	\N
he8e1fqolx7	62dv0mb7ltw	1	\N	\N	2
jw2um47b1kq	dqmaiq8dtfr	7	\N	\N	\N
jw2um47b1kq	scx04nesokm	8	\N	\N	\N
sbs86uyv02m	sbs86uyv02m	0	f	properties	\N
zt6v1st24cb	zt6v1st24cb	0	f	properties	\N
trzfhhwusfa	trzfhhwusfa	0	f	properties	\N
dszszrlyq29	trzfhhwusfa	1	\N	\N	1
s2j1mca129k	dqmaiq8dtfr	8	\N	\N	\N
s2j1mca129k	scx04nesokm	9	\N	\N	\N
mg6e604h4ue	dszszrlyq29	2	\N	\N	\N
863sbhkbfon	dszszrlyq29	3	\N	\N	\N
mxsi688ucom	dszszrlyq29	4	\N	\N	\N
qi3rrli2wdj	dszszrlyq29	5	\N	\N	\N
74wiu3prkat	dszszrlyq29	6	\N	\N	\N
pujioj8krv0	dszszrlyq29	7	\N	\N	\N
xnnjkcrpivt	dszszrlyq29	8	\N	\N	\N
kuxb9m62gau	dszszrlyq29	9	\N	\N	\N
28fjk12kdqn	dszszrlyq29	10	\N	\N	\N
5wtyj13hh7k	dszszrlyq29	11	\N	\N	\N
v160lx9x03s	dszszrlyq29	12	\N	\N	\N
r34c545vn0o	dszszrlyq29	13	\N	\N	\N
s7ppiu6idan	dszszrlyq29	14	\N	\N	\N
9gg7w4ctvy1	dszszrlyq29	15	\N	\N	\N
4ea0eg22s6f	dszszrlyq29	16	\N	\N	\N
5i6s9h3z12w	dszszrlyq29	17	\N	\N	\N
3o0nafjc9zn	dszszrlyq29	18	\N	\N	\N
wpw2zdgvred	dszszrlyq29	19	\N	\N	\N
we4al08cgrl	dszszrlyq29	20	\N	\N	\N
ie3s6t8ry35	trzfhhwusfa	2	\N	\N	\N
mg6e604h4ue	trzfhhwusfa	3	\N	\N	\N
863sbhkbfon	trzfhhwusfa	4	\N	\N	\N
mxsi688ucom	trzfhhwusfa	5	\N	\N	\N
qi3rrli2wdj	trzfhhwusfa	6	\N	\N	\N
74wiu3prkat	trzfhhwusfa	7	\N	\N	\N
pujioj8krv0	trzfhhwusfa	8	\N	\N	\N
xnnjkcrpivt	trzfhhwusfa	9	\N	\N	\N
kuxb9m62gau	trzfhhwusfa	10	\N	\N	\N
28fjk12kdqn	trzfhhwusfa	11	\N	\N	\N
5wtyj13hh7k	trzfhhwusfa	12	\N	\N	\N
v160lx9x03s	trzfhhwusfa	13	\N	\N	\N
r34c545vn0o	trzfhhwusfa	14	\N	\N	\N
s7ppiu6idan	trzfhhwusfa	15	\N	\N	\N
9gg7w4ctvy1	trzfhhwusfa	16	\N	\N	\N
4ea0eg22s6f	trzfhhwusfa	17	\N	\N	\N
5i6s9h3z12w	trzfhhwusfa	18	\N	\N	\N
3o0nafjc9zn	trzfhhwusfa	19	\N	\N	\N
dszszrlyq29	dszszrlyq29	0	f	properties	\N
are93oh007m	dqmaiq8dtfr	9	\N	\N	\N
are93oh007m	scx04nesokm	10	\N	\N	\N
4povngczp9v	4povngczp9v	0	f	properties	\N
wpw2zdgvred	trzfhhwusfa	20	\N	\N	\N
we4al08cgrl	trzfhhwusfa	21	\N	\N	\N
p9pxqbpwxlo	p9pxqbpwxlo	0	f	properties	\N
setmbtb7hr8	dqmaiq8dtfr	10	\N	\N	\N
setmbtb7hr8	scx04nesokm	11	\N	\N	\N
spf0vrfmlni	p9pxqbpwxlo	1	\N	\N	1
5wtyj13hh7k	dqmaiq8dtfr	11	\N	\N	\N
5wtyj13hh7k	scx04nesokm	12	\N	\N	\N
l9p9ulc5ojf	spf0vrfmlni	5	\N	\N	\N
v160lx9x03s	dqmaiq8dtfr	12	\N	\N	\N
v160lx9x03s	scx04nesokm	13	\N	\N	\N
l9p9ulc5ojf	p9pxqbpwxlo	6	\N	\N	\N
r34c545vn0o	dqmaiq8dtfr	13	\N	\N	\N
r34c545vn0o	scx04nesokm	14	\N	\N	\N
s7ppiu6idan	dqmaiq8dtfr	14	\N	\N	\N
s7ppiu6idan	scx04nesokm	15	\N	\N	\N
he8e1fqolx7	p9pxqbpwxlo	2	\N	\N	\N
9gg7w4ctvy1	dqmaiq8dtfr	15	\N	\N	\N
9gg7w4ctvy1	scx04nesokm	16	\N	\N	\N
xaqtxcn6wk1	spf0vrfmlni	2	\N	\N	\N
4ea0eg22s6f	dqmaiq8dtfr	16	\N	\N	\N
7p77wn6tzqg	7p77wn6tzqg	0	f	properties	\N
rk5bvbdmdgv	7p77wn6tzqg	1	\N	\N	1
rk5bvbdmdgv	xxa8dxeqzv7	2	\N	\N	\N
od7ng3zbx7o	od7ng3zbx7o	0	f	properties	\N
7p77wn6tzqg	xxa8dxeqzv7	1	\N	\N	1
ie3s6t8ry35	7p77wn6tzqg	2	\N	\N	\N
mg6e604h4ue	7p77wn6tzqg	3	\N	\N	\N
863sbhkbfon	7p77wn6tzqg	4	\N	\N	\N
mxsi688ucom	7p77wn6tzqg	5	\N	\N	\N
qi3rrli2wdj	7p77wn6tzqg	6	\N	\N	\N
74wiu3prkat	7p77wn6tzqg	7	\N	\N	\N
pujioj8krv0	7p77wn6tzqg	8	\N	\N	\N
xnnjkcrpivt	7p77wn6tzqg	9	\N	\N	\N
kuxb9m62gau	7p77wn6tzqg	10	\N	\N	\N
28fjk12kdqn	7p77wn6tzqg	11	\N	\N	\N
5wtyj13hh7k	7p77wn6tzqg	12	\N	\N	\N
v160lx9x03s	7p77wn6tzqg	13	\N	\N	\N
r34c545vn0o	7p77wn6tzqg	14	\N	\N	\N
s7ppiu6idan	7p77wn6tzqg	15	\N	\N	\N
9gg7w4ctvy1	7p77wn6tzqg	16	\N	\N	\N
4ea0eg22s6f	7p77wn6tzqg	17	\N	\N	\N
5i6s9h3z12w	7p77wn6tzqg	18	\N	\N	\N
3o0nafjc9zn	7p77wn6tzqg	19	\N	\N	\N
wpw2zdgvred	7p77wn6tzqg	20	\N	\N	\N
we4al08cgrl	7p77wn6tzqg	21	\N	\N	\N
mg6e604h4ue	rk5bvbdmdgv	2	\N	\N	\N
863sbhkbfon	rk5bvbdmdgv	3	\N	\N	\N
mxsi688ucom	rk5bvbdmdgv	4	\N	\N	\N
qi3rrli2wdj	rk5bvbdmdgv	5	\N	\N	\N
74wiu3prkat	rk5bvbdmdgv	6	\N	\N	\N
pujioj8krv0	rk5bvbdmdgv	7	\N	\N	\N
xnnjkcrpivt	rk5bvbdmdgv	8	\N	\N	\N
kuxb9m62gau	rk5bvbdmdgv	9	\N	\N	\N
28fjk12kdqn	rk5bvbdmdgv	10	\N	\N	\N
5wtyj13hh7k	rk5bvbdmdgv	11	\N	\N	\N
v160lx9x03s	rk5bvbdmdgv	12	\N	\N	\N
r34c545vn0o	rk5bvbdmdgv	13	\N	\N	\N
s7ppiu6idan	rk5bvbdmdgv	14	\N	\N	\N
9gg7w4ctvy1	rk5bvbdmdgv	15	\N	\N	\N
4ea0eg22s6f	rk5bvbdmdgv	16	\N	\N	\N
5i6s9h3z12w	rk5bvbdmdgv	17	\N	\N	\N
3o0nafjc9zn	rk5bvbdmdgv	18	\N	\N	\N
wpw2zdgvred	rk5bvbdmdgv	19	\N	\N	\N
we4al08cgrl	rk5bvbdmdgv	20	\N	\N	\N
ie3s6t8ry35	xxa8dxeqzv7	3	\N	\N	\N
mg6e604h4ue	xxa8dxeqzv7	4	\N	\N	\N
863sbhkbfon	xxa8dxeqzv7	5	\N	\N	\N
mxsi688ucom	xxa8dxeqzv7	6	\N	\N	\N
qi3rrli2wdj	xxa8dxeqzv7	7	\N	\N	\N
74wiu3prkat	xxa8dxeqzv7	8	\N	\N	\N
pujioj8krv0	xxa8dxeqzv7	9	\N	\N	\N
xnnjkcrpivt	xxa8dxeqzv7	10	\N	\N	\N
kuxb9m62gau	xxa8dxeqzv7	11	\N	\N	\N
28fjk12kdqn	xxa8dxeqzv7	12	\N	\N	\N
5wtyj13hh7k	xxa8dxeqzv7	13	\N	\N	\N
v160lx9x03s	xxa8dxeqzv7	14	\N	\N	\N
r34c545vn0o	xxa8dxeqzv7	15	\N	\N	\N
s7ppiu6idan	xxa8dxeqzv7	16	\N	\N	\N
9gg7w4ctvy1	xxa8dxeqzv7	17	\N	\N	\N
4ea0eg22s6f	xxa8dxeqzv7	18	\N	\N	\N
5i6s9h3z12w	xxa8dxeqzv7	19	\N	\N	\N
3o0nafjc9zn	xxa8dxeqzv7	20	\N	\N	\N
wpw2zdgvred	xxa8dxeqzv7	21	\N	\N	\N
we4al08cgrl	xxa8dxeqzv7	22	\N	\N	\N
rk5bvbdmdgv	rk5bvbdmdgv	0	f	properties	\N
4ea0eg22s6f	scx04nesokm	17	\N	\N	\N
xaqtxcn6wk1	p9pxqbpwxlo	3	\N	\N	\N
ie3s6t8ry35	rk5bvbdmdgv	1	\N	\N	2
e4j8oj73f2w	e4j8oj73f2w	0	f	properties	\N
od7ng3zbx7o	e4j8oj73f2w	1	\N	\N	1
od7ng3zbx7o	zt6v1st24cb	2	\N	\N	\N
5i6s9h3z12w	dqmaiq8dtfr	17	\N	\N	\N
e4j8oj73f2w	zt6v1st24cb	1	\N	\N	1
ie3s6t8ry35	e4j8oj73f2w	2	\N	\N	\N
mg6e604h4ue	e4j8oj73f2w	3	\N	\N	\N
863sbhkbfon	e4j8oj73f2w	4	\N	\N	\N
mxsi688ucom	e4j8oj73f2w	5	\N	\N	\N
qi3rrli2wdj	e4j8oj73f2w	6	\N	\N	\N
74wiu3prkat	e4j8oj73f2w	7	\N	\N	\N
pujioj8krv0	e4j8oj73f2w	8	\N	\N	\N
xnnjkcrpivt	e4j8oj73f2w	9	\N	\N	\N
kuxb9m62gau	e4j8oj73f2w	10	\N	\N	\N
28fjk12kdqn	e4j8oj73f2w	11	\N	\N	\N
5wtyj13hh7k	e4j8oj73f2w	12	\N	\N	\N
v160lx9x03s	e4j8oj73f2w	13	\N	\N	\N
r34c545vn0o	e4j8oj73f2w	14	\N	\N	\N
s7ppiu6idan	e4j8oj73f2w	15	\N	\N	\N
9gg7w4ctvy1	e4j8oj73f2w	16	\N	\N	\N
4ea0eg22s6f	e4j8oj73f2w	17	\N	\N	\N
5i6s9h3z12w	e4j8oj73f2w	18	\N	\N	\N
3o0nafjc9zn	e4j8oj73f2w	19	\N	\N	\N
wpw2zdgvred	e4j8oj73f2w	20	\N	\N	\N
we4al08cgrl	e4j8oj73f2w	21	\N	\N	\N
mg6e604h4ue	od7ng3zbx7o	2	\N	\N	\N
863sbhkbfon	od7ng3zbx7o	3	\N	\N	\N
mxsi688ucom	od7ng3zbx7o	4	\N	\N	\N
qi3rrli2wdj	od7ng3zbx7o	5	\N	\N	\N
74wiu3prkat	od7ng3zbx7o	6	\N	\N	\N
pujioj8krv0	od7ng3zbx7o	7	\N	\N	\N
xnnjkcrpivt	od7ng3zbx7o	8	\N	\N	\N
kuxb9m62gau	od7ng3zbx7o	9	\N	\N	\N
28fjk12kdqn	od7ng3zbx7o	10	\N	\N	\N
5wtyj13hh7k	od7ng3zbx7o	11	\N	\N	\N
v160lx9x03s	od7ng3zbx7o	12	\N	\N	\N
r34c545vn0o	od7ng3zbx7o	13	\N	\N	\N
s7ppiu6idan	od7ng3zbx7o	14	\N	\N	\N
9gg7w4ctvy1	od7ng3zbx7o	15	\N	\N	\N
5i6s9h3z12w	scx04nesokm	18	\N	\N	\N
q17mcp7s7kv	spf0vrfmlni	3	\N	\N	\N
ie3s6t8ry35	od7ng3zbx7o	1	\N	\N	3
3o0nafjc9zn	dqmaiq8dtfr	18	\N	\N	\N
3o0nafjc9zn	scx04nesokm	19	\N	\N	\N
q17mcp7s7kv	p9pxqbpwxlo	4	\N	\N	\N
4ea0eg22s6f	od7ng3zbx7o	16	\N	\N	\N
5i6s9h3z12w	od7ng3zbx7o	17	\N	\N	\N
3o0nafjc9zn	od7ng3zbx7o	18	\N	\N	\N
wpw2zdgvred	od7ng3zbx7o	19	\N	\N	\N
we4al08cgrl	od7ng3zbx7o	20	\N	\N	\N
ie3s6t8ry35	zt6v1st24cb	3	\N	\N	\N
mg6e604h4ue	zt6v1st24cb	4	\N	\N	\N
863sbhkbfon	zt6v1st24cb	5	\N	\N	\N
mxsi688ucom	zt6v1st24cb	6	\N	\N	\N
qi3rrli2wdj	zt6v1st24cb	7	\N	\N	\N
74wiu3prkat	zt6v1st24cb	8	\N	\N	\N
pujioj8krv0	zt6v1st24cb	9	\N	\N	\N
xnnjkcrpivt	zt6v1st24cb	10	\N	\N	\N
kuxb9m62gau	zt6v1st24cb	11	\N	\N	\N
28fjk12kdqn	zt6v1st24cb	12	\N	\N	\N
5wtyj13hh7k	zt6v1st24cb	13	\N	\N	\N
v160lx9x03s	zt6v1st24cb	14	\N	\N	\N
r34c545vn0o	zt6v1st24cb	15	\N	\N	\N
s7ppiu6idan	zt6v1st24cb	16	\N	\N	\N
9gg7w4ctvy1	zt6v1st24cb	17	\N	\N	\N
4ea0eg22s6f	zt6v1st24cb	18	\N	\N	\N
5i6s9h3z12w	zt6v1st24cb	19	\N	\N	\N
3o0nafjc9zn	zt6v1st24cb	20	\N	\N	\N
wpw2zdgvred	zt6v1st24cb	21	\N	\N	\N
we4al08cgrl	zt6v1st24cb	22	\N	\N	\N
wpw2zdgvred	dqmaiq8dtfr	19	\N	\N	\N
wpw2zdgvred	scx04nesokm	20	\N	\N	\N
lywb8khu67q	spf0vrfmlni	4	\N	\N	\N
we4al08cgrl	dqmaiq8dtfr	20	\N	\N	\N
we4al08cgrl	scx04nesokm	21	\N	\N	\N
lywb8khu67q	p9pxqbpwxlo	5	\N	\N	\N
dqmaiq8dtfr	dqmaiq8dtfr	0	f	properties	\N
p86ow4sckcj	dqmaiq8dtfr	1	\N	\N	5
pujioj8krv0	cuz2wh0zmcz	8	\N	\N	\N
pujioj8krv0	alhdggfwn2b	9	\N	\N	\N
xnnjkcrpivt	64zkp91nr6d	8	\N	\N	\N
xnnjkcrpivt	cuz2wh0zmcz	9	\N	\N	\N
xnnjkcrpivt	alhdggfwn2b	10	\N	\N	\N
kuxb9m62gau	64zkp91nr6d	9	\N	\N	\N
kuxb9m62gau	cuz2wh0zmcz	10	\N	\N	\N
kuxb9m62gau	alhdggfwn2b	11	\N	\N	\N
28fjk12kdqn	64zkp91nr6d	10	\N	\N	\N
28fjk12kdqn	cuz2wh0zmcz	11	\N	\N	\N
28fjk12kdqn	alhdggfwn2b	12	\N	\N	\N
5wtyj13hh7k	64zkp91nr6d	11	\N	\N	\N
5wtyj13hh7k	cuz2wh0zmcz	12	\N	\N	\N
5wtyj13hh7k	alhdggfwn2b	13	\N	\N	\N
v160lx9x03s	64zkp91nr6d	12	\N	\N	\N
v160lx9x03s	cuz2wh0zmcz	13	\N	\N	\N
v160lx9x03s	alhdggfwn2b	14	\N	\N	\N
r34c545vn0o	64zkp91nr6d	13	\N	\N	\N
r34c545vn0o	cuz2wh0zmcz	14	\N	\N	\N
r34c545vn0o	alhdggfwn2b	15	\N	\N	\N
s7ppiu6idan	64zkp91nr6d	14	\N	\N	\N
s7ppiu6idan	cuz2wh0zmcz	15	\N	\N	\N
s7ppiu6idan	alhdggfwn2b	16	\N	\N	\N
9gg7w4ctvy1	64zkp91nr6d	15	\N	\N	\N
9gg7w4ctvy1	cuz2wh0zmcz	16	\N	\N	\N
9gg7w4ctvy1	alhdggfwn2b	17	\N	\N	\N
4ea0eg22s6f	64zkp91nr6d	16	\N	\N	\N
4ea0eg22s6f	cuz2wh0zmcz	17	\N	\N	\N
4ea0eg22s6f	alhdggfwn2b	18	\N	\N	\N
5i6s9h3z12w	64zkp91nr6d	17	\N	\N	\N
5i6s9h3z12w	cuz2wh0zmcz	18	\N	\N	\N
5i6s9h3z12w	alhdggfwn2b	19	\N	\N	\N
3o0nafjc9zn	64zkp91nr6d	18	\N	\N	\N
3o0nafjc9zn	cuz2wh0zmcz	19	\N	\N	\N
3o0nafjc9zn	alhdggfwn2b	20	\N	\N	\N
wpw2zdgvred	64zkp91nr6d	19	\N	\N	\N
wpw2zdgvred	cuz2wh0zmcz	20	\N	\N	\N
wpw2zdgvred	alhdggfwn2b	21	\N	\N	\N
we4al08cgrl	64zkp91nr6d	20	\N	\N	\N
we4al08cgrl	cuz2wh0zmcz	21	\N	\N	\N
we4al08cgrl	alhdggfwn2b	22	\N	\N	\N
yopjwa6ar9p	yopjwa6ar9p	0	f	properties	\N
4zcpgpedxcf	yopjwa6ar9p	1	\N	\N	1
mohx8b2r1wc	mohx8b2r1wc	0	f	properties	\N
yopjwa6ar9p	mohx8b2r1wc	1	\N	\N	1
4zcpgpedxcf	mohx8b2r1wc	2	\N	\N	1
tjb47m7iend	tjb47m7iend	0	f	properties	\N
mohx8b2r1wc	tjb47m7iend	1	\N	\N	1
yopjwa6ar9p	tjb47m7iend	2	\N	\N	1
4zcpgpedxcf	tjb47m7iend	3	\N	\N	1
2zzl0fhh8ai	yopjwa6ar9p	2	\N	\N	\N
2zzl0fhh8ai	mohx8b2r1wc	3	\N	\N	\N
2zzl0fhh8ai	tjb47m7iend	4	\N	\N	\N
tyq1a9qwq1x	4zcpgpedxcf	2	\N	\N	\N
tyq1a9qwq1x	yopjwa6ar9p	3	\N	\N	\N
tyq1a9qwq1x	mohx8b2r1wc	4	\N	\N	\N
tyq1a9qwq1x	tjb47m7iend	5	\N	\N	\N
r34c545vn0o	4zcpgpedxcf	3	\N	\N	\N
r34c545vn0o	yopjwa6ar9p	4	\N	\N	\N
r34c545vn0o	mohx8b2r1wc	5	\N	\N	\N
r34c545vn0o	tjb47m7iend	6	\N	\N	\N
s7ppiu6idan	4zcpgpedxcf	4	\N	\N	\N
s7ppiu6idan	yopjwa6ar9p	5	\N	\N	\N
s7ppiu6idan	mohx8b2r1wc	6	\N	\N	\N
s7ppiu6idan	tjb47m7iend	7	\N	\N	\N
9gg7w4ctvy1	4zcpgpedxcf	5	\N	\N	\N
9gg7w4ctvy1	yopjwa6ar9p	6	\N	\N	\N
9gg7w4ctvy1	mohx8b2r1wc	7	\N	\N	\N
9gg7w4ctvy1	tjb47m7iend	8	\N	\N	\N
4ea0eg22s6f	4zcpgpedxcf	6	\N	\N	\N
4ea0eg22s6f	yopjwa6ar9p	7	\N	\N	\N
4ea0eg22s6f	mohx8b2r1wc	8	\N	\N	\N
4ea0eg22s6f	tjb47m7iend	9	\N	\N	\N
5i6s9h3z12w	4zcpgpedxcf	7	\N	\N	\N
5i6s9h3z12w	yopjwa6ar9p	8	\N	\N	\N
5i6s9h3z12w	mohx8b2r1wc	9	\N	\N	\N
5i6s9h3z12w	tjb47m7iend	10	\N	\N	\N
3o0nafjc9zn	4zcpgpedxcf	8	\N	\N	\N
3o0nafjc9zn	yopjwa6ar9p	9	\N	\N	\N
3o0nafjc9zn	mohx8b2r1wc	10	\N	\N	\N
3o0nafjc9zn	tjb47m7iend	11	\N	\N	\N
wpw2zdgvred	4zcpgpedxcf	9	\N	\N	\N
wpw2zdgvred	yopjwa6ar9p	10	\N	\N	\N
wpw2zdgvred	mohx8b2r1wc	11	\N	\N	\N
wpw2zdgvred	tjb47m7iend	12	\N	\N	\N
we4al08cgrl	4zcpgpedxcf	10	\N	\N	\N
we4al08cgrl	yopjwa6ar9p	11	\N	\N	\N
we4al08cgrl	mohx8b2r1wc	12	\N	\N	\N
we4al08cgrl	tjb47m7iend	13	\N	\N	\N
4zcpgpedxcf	4zcpgpedxcf	0	f	properties	\N
eao99d5nu76	eao99d5nu76	0	f	properties	\N
2zzl0fhh8ai	4zcpgpedxcf	1	\N	\N	1
tfvwjma6h1h	tfvwjma6h1h	0	f	properties	\N
eao99d5nu76	tfvwjma6h1h	1	\N	\N	1
kyjc1neko0n	kyjc1neko0n	0	f	properties	\N
tfvwjma6h1h	kyjc1neko0n	1	\N	\N	1
eao99d5nu76	kyjc1neko0n	2	\N	\N	1
g0ijjznmv2z	g0ijjznmv2z	0	f	properties	\N
kyjc1neko0n	g0ijjznmv2z	1	\N	\N	1
tfvwjma6h1h	g0ijjznmv2z	2	\N	\N	1
s2f6dhfqp5d	spf0vrfmlni	6	\N	\N	\N
sl74z8l1a76	sl74z8l1a76	0	f	properties	\N
qxy2edqzpbm	sl74z8l1a76	1	\N	\N	1
vshk9mbxzy8	vshk9mbxzy8	0	f	properties	\N
qxy2edqzpbm	vshk9mbxzy8	2	\N	\N	\N
mqj4po1e7bk	mqj4po1e7bk	0	f	properties	\N
sl74z8l1a76	vshk9mbxzy8	1	\N	\N	1
mg6e604h4ue	qxy2edqzpbm	2	\N	\N	\N
863sbhkbfon	qxy2edqzpbm	3	\N	\N	\N
mxsi688ucom	qxy2edqzpbm	4	\N	\N	\N
qi3rrli2wdj	qxy2edqzpbm	5	\N	\N	\N
74wiu3prkat	qxy2edqzpbm	6	\N	\N	\N
pujioj8krv0	qxy2edqzpbm	7	\N	\N	\N
xnnjkcrpivt	qxy2edqzpbm	8	\N	\N	\N
kuxb9m62gau	qxy2edqzpbm	9	\N	\N	\N
28fjk12kdqn	qxy2edqzpbm	10	\N	\N	\N
5wtyj13hh7k	qxy2edqzpbm	11	\N	\N	\N
v160lx9x03s	qxy2edqzpbm	12	\N	\N	\N
r34c545vn0o	qxy2edqzpbm	13	\N	\N	\N
s7ppiu6idan	qxy2edqzpbm	14	\N	\N	\N
9gg7w4ctvy1	qxy2edqzpbm	15	\N	\N	\N
4ea0eg22s6f	qxy2edqzpbm	16	\N	\N	\N
5i6s9h3z12w	qxy2edqzpbm	17	\N	\N	\N
3o0nafjc9zn	qxy2edqzpbm	18	\N	\N	\N
wpw2zdgvred	qxy2edqzpbm	19	\N	\N	\N
we4al08cgrl	qxy2edqzpbm	20	\N	\N	\N
ie3s6t8ry35	sl74z8l1a76	2	\N	\N	\N
mg6e604h4ue	sl74z8l1a76	3	\N	\N	\N
863sbhkbfon	sl74z8l1a76	4	\N	\N	\N
mxsi688ucom	sl74z8l1a76	5	\N	\N	\N
qi3rrli2wdj	sl74z8l1a76	6	\N	\N	\N
74wiu3prkat	sl74z8l1a76	7	\N	\N	\N
pujioj8krv0	sl74z8l1a76	8	\N	\N	\N
xnnjkcrpivt	sl74z8l1a76	9	\N	\N	\N
kuxb9m62gau	sl74z8l1a76	10	\N	\N	\N
28fjk12kdqn	sl74z8l1a76	11	\N	\N	\N
5wtyj13hh7k	sl74z8l1a76	12	\N	\N	\N
v160lx9x03s	sl74z8l1a76	13	\N	\N	\N
r34c545vn0o	sl74z8l1a76	14	\N	\N	\N
s7ppiu6idan	sl74z8l1a76	15	\N	\N	\N
9gg7w4ctvy1	sl74z8l1a76	16	\N	\N	\N
4ea0eg22s6f	sl74z8l1a76	17	\N	\N	\N
5i6s9h3z12w	sl74z8l1a76	18	\N	\N	\N
3o0nafjc9zn	sl74z8l1a76	19	\N	\N	\N
wpw2zdgvred	sl74z8l1a76	20	\N	\N	\N
we4al08cgrl	sl74z8l1a76	21	\N	\N	\N
ie3s6t8ry35	vshk9mbxzy8	3	\N	\N	\N
mg6e604h4ue	vshk9mbxzy8	4	\N	\N	\N
863sbhkbfon	vshk9mbxzy8	5	\N	\N	\N
mxsi688ucom	vshk9mbxzy8	6	\N	\N	\N
qi3rrli2wdj	vshk9mbxzy8	7	\N	\N	\N
74wiu3prkat	vshk9mbxzy8	8	\N	\N	\N
pujioj8krv0	vshk9mbxzy8	9	\N	\N	\N
xnnjkcrpivt	vshk9mbxzy8	10	\N	\N	\N
kuxb9m62gau	vshk9mbxzy8	11	\N	\N	\N
28fjk12kdqn	vshk9mbxzy8	12	\N	\N	\N
5wtyj13hh7k	vshk9mbxzy8	13	\N	\N	\N
v160lx9x03s	vshk9mbxzy8	14	\N	\N	\N
r34c545vn0o	vshk9mbxzy8	15	\N	\N	\N
s7ppiu6idan	vshk9mbxzy8	16	\N	\N	\N
9gg7w4ctvy1	vshk9mbxzy8	17	\N	\N	\N
4ea0eg22s6f	vshk9mbxzy8	18	\N	\N	\N
5i6s9h3z12w	vshk9mbxzy8	19	\N	\N	\N
3o0nafjc9zn	vshk9mbxzy8	20	\N	\N	\N
wpw2zdgvred	vshk9mbxzy8	21	\N	\N	\N
we4al08cgrl	vshk9mbxzy8	22	\N	\N	\N
qxy2edqzpbm	qxy2edqzpbm	0	f	properties	\N
ie3s6t8ry35	gnpa1gngede	1	\N	\N	7
ie3s6t8ry35	dszszrlyq29	1	\N	\N	9
ie3s6t8ry35	dijzb61rbsv	1	\N	\N	5
ie3s6t8ry35	sbs86uyv02m	1	\N	\N	8
ie3s6t8ry35	qxy2edqzpbm	1	\N	\N	4
mqj4po1e7bk	20am0xmikgi	2	\N	\N	\N
mqj4po1e7bk	1yerxui1rh5	3	\N	\N	\N
mqj4po1e7bk	9t5vw9np9jc	4	\N	\N	\N
mqj4po1e7bk	p50niwjxz32	5	\N	\N	\N
s2f6dhfqp5d	p9pxqbpwxlo	7	\N	\N	\N
mqj4po1e7bk	ba5cmxt9wae	1	\N	\N	1
mg6e604h4ue	1yerxui1rh5	6	\N	\N	\N
863sbhkbfon	1yerxui1rh5	7	\N	\N	\N
mxsi688ucom	1yerxui1rh5	8	\N	\N	\N
qi3rrli2wdj	1yerxui1rh5	9	\N	\N	\N
74wiu3prkat	1yerxui1rh5	10	\N	\N	\N
pujioj8krv0	1yerxui1rh5	11	\N	\N	\N
xnnjkcrpivt	1yerxui1rh5	12	\N	\N	\N
kuxb9m62gau	1yerxui1rh5	13	\N	\N	\N
28fjk12kdqn	1yerxui1rh5	14	\N	\N	\N
5wtyj13hh7k	1yerxui1rh5	15	\N	\N	\N
v160lx9x03s	1yerxui1rh5	16	\N	\N	\N
r34c545vn0o	1yerxui1rh5	17	\N	\N	\N
s7ppiu6idan	1yerxui1rh5	18	\N	\N	\N
9gg7w4ctvy1	1yerxui1rh5	19	\N	\N	\N
4ea0eg22s6f	1yerxui1rh5	20	\N	\N	\N
5i6s9h3z12w	1yerxui1rh5	21	\N	\N	\N
3o0nafjc9zn	1yerxui1rh5	22	\N	\N	\N
wpw2zdgvred	1yerxui1rh5	23	\N	\N	\N
we4al08cgrl	1yerxui1rh5	24	\N	\N	\N
dijzb61rbsv	1yerxui1rh5	4	\N	\N	\N
ie3s6t8ry35	1yerxui1rh5	5	\N	\N	\N
mg6e604h4ue	20am0xmikgi	5	\N	\N	\N
863sbhkbfon	20am0xmikgi	6	\N	\N	\N
mxsi688ucom	20am0xmikgi	7	\N	\N	\N
qi3rrli2wdj	20am0xmikgi	8	\N	\N	\N
74wiu3prkat	20am0xmikgi	9	\N	\N	\N
pujioj8krv0	20am0xmikgi	10	\N	\N	\N
xnnjkcrpivt	20am0xmikgi	11	\N	\N	\N
kuxb9m62gau	20am0xmikgi	12	\N	\N	\N
28fjk12kdqn	20am0xmikgi	13	\N	\N	\N
5wtyj13hh7k	20am0xmikgi	14	\N	\N	\N
v160lx9x03s	20am0xmikgi	15	\N	\N	\N
r34c545vn0o	20am0xmikgi	16	\N	\N	\N
s7ppiu6idan	20am0xmikgi	17	\N	\N	\N
9gg7w4ctvy1	20am0xmikgi	18	\N	\N	\N
4ea0eg22s6f	20am0xmikgi	19	\N	\N	\N
5i6s9h3z12w	20am0xmikgi	20	\N	\N	\N
3o0nafjc9zn	20am0xmikgi	21	\N	\N	\N
wpw2zdgvred	20am0xmikgi	22	\N	\N	\N
we4al08cgrl	20am0xmikgi	23	\N	\N	\N
dijzb61rbsv	20am0xmikgi	3	\N	\N	\N
ie3s6t8ry35	20am0xmikgi	4	\N	\N	\N
mg6e604h4ue	9t5vw9np9jc	7	\N	\N	\N
863sbhkbfon	9t5vw9np9jc	8	\N	\N	\N
mxsi688ucom	9t5vw9np9jc	9	\N	\N	\N
qi3rrli2wdj	9t5vw9np9jc	10	\N	\N	\N
74wiu3prkat	9t5vw9np9jc	11	\N	\N	\N
pujioj8krv0	9t5vw9np9jc	12	\N	\N	\N
xnnjkcrpivt	9t5vw9np9jc	13	\N	\N	\N
kuxb9m62gau	9t5vw9np9jc	14	\N	\N	\N
28fjk12kdqn	9t5vw9np9jc	15	\N	\N	\N
5wtyj13hh7k	9t5vw9np9jc	16	\N	\N	\N
v160lx9x03s	9t5vw9np9jc	17	\N	\N	\N
r34c545vn0o	9t5vw9np9jc	18	\N	\N	\N
iqcf5jgj5u6	iqcf5jgj5u6	0	f	properties	\N
xrtpdglsdom	iqcf5jgj5u6	1	\N	\N	1
bdo3e9silbn	spf0vrfmlni	7	\N	\N	\N
xrtpdglsdom	4povngczp9v	2	\N	\N	\N
s7ppiu6idan	9t5vw9np9jc	19	\N	\N	\N
9gg7w4ctvy1	9t5vw9np9jc	20	\N	\N	\N
4ea0eg22s6f	9t5vw9np9jc	21	\N	\N	\N
5i6s9h3z12w	9t5vw9np9jc	22	\N	\N	\N
3o0nafjc9zn	9t5vw9np9jc	23	\N	\N	\N
wpw2zdgvred	9t5vw9np9jc	24	\N	\N	\N
we4al08cgrl	9t5vw9np9jc	25	\N	\N	\N
dijzb61rbsv	9t5vw9np9jc	5	\N	\N	\N
ie3s6t8ry35	9t5vw9np9jc	6	\N	\N	\N
mg6e604h4ue	ba5cmxt9wae	4	\N	\N	\N
863sbhkbfon	ba5cmxt9wae	5	\N	\N	\N
mxsi688ucom	ba5cmxt9wae	6	\N	\N	\N
qi3rrli2wdj	ba5cmxt9wae	7	\N	\N	\N
74wiu3prkat	ba5cmxt9wae	8	\N	\N	\N
pujioj8krv0	ba5cmxt9wae	9	\N	\N	\N
xnnjkcrpivt	ba5cmxt9wae	10	\N	\N	\N
kuxb9m62gau	ba5cmxt9wae	11	\N	\N	\N
28fjk12kdqn	ba5cmxt9wae	12	\N	\N	\N
5wtyj13hh7k	ba5cmxt9wae	13	\N	\N	\N
v160lx9x03s	ba5cmxt9wae	14	\N	\N	\N
r34c545vn0o	ba5cmxt9wae	15	\N	\N	\N
s7ppiu6idan	ba5cmxt9wae	16	\N	\N	\N
9gg7w4ctvy1	ba5cmxt9wae	17	\N	\N	\N
4ea0eg22s6f	ba5cmxt9wae	18	\N	\N	\N
5i6s9h3z12w	ba5cmxt9wae	19	\N	\N	\N
3o0nafjc9zn	ba5cmxt9wae	20	\N	\N	\N
wpw2zdgvred	ba5cmxt9wae	21	\N	\N	\N
we4al08cgrl	ba5cmxt9wae	22	\N	\N	\N
dijzb61rbsv	ba5cmxt9wae	2	\N	\N	\N
ie3s6t8ry35	ba5cmxt9wae	3	\N	\N	\N
mg6e604h4ue	mqj4po1e7bk	3	\N	\N	\N
863sbhkbfon	mqj4po1e7bk	4	\N	\N	\N
mxsi688ucom	mqj4po1e7bk	5	\N	\N	\N
qi3rrli2wdj	mqj4po1e7bk	6	\N	\N	\N
74wiu3prkat	mqj4po1e7bk	7	\N	\N	\N
pujioj8krv0	mqj4po1e7bk	8	\N	\N	\N
xnnjkcrpivt	mqj4po1e7bk	9	\N	\N	\N
kuxb9m62gau	mqj4po1e7bk	10	\N	\N	\N
28fjk12kdqn	mqj4po1e7bk	11	\N	\N	\N
5wtyj13hh7k	mqj4po1e7bk	12	\N	\N	\N
v160lx9x03s	mqj4po1e7bk	13	\N	\N	\N
r34c545vn0o	mqj4po1e7bk	14	\N	\N	\N
s7ppiu6idan	mqj4po1e7bk	15	\N	\N	\N
9gg7w4ctvy1	mqj4po1e7bk	16	\N	\N	\N
4ea0eg22s6f	mqj4po1e7bk	17	\N	\N	\N
5i6s9h3z12w	mqj4po1e7bk	18	\N	\N	\N
3o0nafjc9zn	mqj4po1e7bk	19	\N	\N	\N
wpw2zdgvred	mqj4po1e7bk	20	\N	\N	\N
we4al08cgrl	mqj4po1e7bk	21	\N	\N	\N
ie3s6t8ry35	mqj4po1e7bk	2	\N	\N	\N
mg6e604h4ue	p50niwjxz32	8	\N	\N	\N
863sbhkbfon	p50niwjxz32	9	\N	\N	\N
mxsi688ucom	p50niwjxz32	10	\N	\N	\N
qi3rrli2wdj	p50niwjxz32	11	\N	\N	\N
74wiu3prkat	p50niwjxz32	12	\N	\N	\N
pujioj8krv0	p50niwjxz32	13	\N	\N	\N
xnnjkcrpivt	p50niwjxz32	14	\N	\N	\N
kuxb9m62gau	p50niwjxz32	15	\N	\N	\N
28fjk12kdqn	p50niwjxz32	16	\N	\N	\N
5wtyj13hh7k	p50niwjxz32	17	\N	\N	\N
v160lx9x03s	p50niwjxz32	18	\N	\N	\N
r34c545vn0o	p50niwjxz32	19	\N	\N	\N
s7ppiu6idan	p50niwjxz32	20	\N	\N	\N
9gg7w4ctvy1	p50niwjxz32	21	\N	\N	\N
4ea0eg22s6f	p50niwjxz32	22	\N	\N	\N
5i6s9h3z12w	p50niwjxz32	23	\N	\N	\N
3o0nafjc9zn	p50niwjxz32	24	\N	\N	\N
wpw2zdgvred	p50niwjxz32	25	\N	\N	\N
we4al08cgrl	p50niwjxz32	26	\N	\N	\N
dijzb61rbsv	p50niwjxz32	6	\N	\N	\N
ie3s6t8ry35	p50niwjxz32	7	\N	\N	\N
dijzb61rbsv	mqj4po1e7bk	1	\N	\N	2
iqcf5jgj5u6	4povngczp9v	1	\N	\N	1
bdo3e9silbn	p9pxqbpwxlo	8	\N	\N	\N
p86ow4sckcj	iqcf5jgj5u6	2	\N	\N	\N
p86ow4sckcj	4povngczp9v	3	\N	\N	\N
5rlnnzhzvlu	xrtpdglsdom	2	\N	\N	\N
5rlnnzhzvlu	iqcf5jgj5u6	3	\N	\N	\N
5rlnnzhzvlu	4povngczp9v	4	\N	\N	\N
9yf4qjq6xtn	xrtpdglsdom	3	\N	\N	\N
9yf4qjq6xtn	iqcf5jgj5u6	4	\N	\N	\N
9yf4qjq6xtn	4povngczp9v	5	\N	\N	\N
1dsb6ktfpw0	xrtpdglsdom	4	\N	\N	\N
1dsb6ktfpw0	iqcf5jgj5u6	5	\N	\N	\N
1dsb6ktfpw0	4povngczp9v	6	\N	\N	\N
9a5cnn8va7i	xrtpdglsdom	5	\N	\N	\N
9a5cnn8va7i	iqcf5jgj5u6	6	\N	\N	\N
9a5cnn8va7i	4povngczp9v	7	\N	\N	\N
9wsmhrm9np0	xrtpdglsdom	6	\N	\N	\N
9wsmhrm9np0	iqcf5jgj5u6	7	\N	\N	\N
9wsmhrm9np0	4povngczp9v	8	\N	\N	\N
jw2um47b1kq	xrtpdglsdom	7	\N	\N	\N
jw2um47b1kq	iqcf5jgj5u6	8	\N	\N	\N
jw2um47b1kq	4povngczp9v	9	\N	\N	\N
s2j1mca129k	xrtpdglsdom	8	\N	\N	\N
s2j1mca129k	iqcf5jgj5u6	9	\N	\N	\N
s2j1mca129k	4povngczp9v	10	\N	\N	\N
are93oh007m	xrtpdglsdom	9	\N	\N	\N
are93oh007m	iqcf5jgj5u6	10	\N	\N	\N
are93oh007m	4povngczp9v	11	\N	\N	\N
setmbtb7hr8	xrtpdglsdom	10	\N	\N	\N
setmbtb7hr8	iqcf5jgj5u6	11	\N	\N	\N
setmbtb7hr8	4povngczp9v	12	\N	\N	\N
5wtyj13hh7k	xrtpdglsdom	11	\N	\N	\N
5wtyj13hh7k	iqcf5jgj5u6	12	\N	\N	\N
5wtyj13hh7k	4povngczp9v	13	\N	\N	\N
v160lx9x03s	xrtpdglsdom	12	\N	\N	\N
v160lx9x03s	iqcf5jgj5u6	13	\N	\N	\N
v160lx9x03s	4povngczp9v	14	\N	\N	\N
r34c545vn0o	xrtpdglsdom	13	\N	\N	\N
r34c545vn0o	iqcf5jgj5u6	14	\N	\N	\N
r34c545vn0o	4povngczp9v	15	\N	\N	\N
s7ppiu6idan	xrtpdglsdom	14	\N	\N	\N
s7ppiu6idan	iqcf5jgj5u6	15	\N	\N	\N
s7ppiu6idan	4povngczp9v	16	\N	\N	\N
9gg7w4ctvy1	xrtpdglsdom	15	\N	\N	\N
9gg7w4ctvy1	iqcf5jgj5u6	16	\N	\N	\N
9gg7w4ctvy1	4povngczp9v	17	\N	\N	\N
4ea0eg22s6f	xrtpdglsdom	16	\N	\N	\N
4ea0eg22s6f	iqcf5jgj5u6	17	\N	\N	\N
4ea0eg22s6f	4povngczp9v	18	\N	\N	\N
5i6s9h3z12w	xrtpdglsdom	17	\N	\N	\N
5i6s9h3z12w	iqcf5jgj5u6	18	\N	\N	\N
5i6s9h3z12w	4povngczp9v	19	\N	\N	\N
3o0nafjc9zn	xrtpdglsdom	18	\N	\N	\N
3o0nafjc9zn	iqcf5jgj5u6	19	\N	\N	\N
3o0nafjc9zn	4povngczp9v	20	\N	\N	\N
wpw2zdgvred	xrtpdglsdom	19	\N	\N	\N
wpw2zdgvred	iqcf5jgj5u6	20	\N	\N	\N
wpw2zdgvred	4povngczp9v	21	\N	\N	\N
we4al08cgrl	xrtpdglsdom	20	\N	\N	\N
we4al08cgrl	iqcf5jgj5u6	21	\N	\N	\N
we4al08cgrl	4povngczp9v	22	\N	\N	\N
xrtpdglsdom	xrtpdglsdom	0	f	properties	\N
we4al08cgrl	spf0vrfmlni	8	\N	\N	\N
eao99d5nu76	7v9fsmf19yo	4	\N	\N	1
lzlnihuzy9k	lzlnihuzy9k	0	f	properties	\N
g0ijjznmv2z	lzlnihuzy9k	1	\N	\N	2
kyjc1neko0n	lzlnihuzy9k	2	\N	\N	2
tfvwjma6h1h	lzlnihuzy9k	3	\N	\N	2
eao99d5nu76	lzlnihuzy9k	4	\N	\N	2
tjb47m7iend	g0ijjznmv2z	4	\N	\N	\N
tjb47m7iend	tfvwjma6h1h	2	\N	\N	\N
tjb47m7iend	kyjc1neko0n	3	\N	\N	\N
tjb47m7iend	7v9fsmf19yo	5	\N	\N	\N
tjb47m7iend	lzlnihuzy9k	5	\N	\N	\N
mohx8b2r1wc	g0ijjznmv2z	5	\N	\N	\N
mohx8b2r1wc	eao99d5nu76	2	\N	\N	\N
mohx8b2r1wc	tfvwjma6h1h	3	\N	\N	\N
mohx8b2r1wc	kyjc1neko0n	4	\N	\N	\N
mohx8b2r1wc	7v9fsmf19yo	6	\N	\N	\N
mohx8b2r1wc	lzlnihuzy9k	6	\N	\N	\N
yopjwa6ar9p	g0ijjznmv2z	6	\N	\N	\N
yopjwa6ar9p	eao99d5nu76	3	\N	\N	\N
yopjwa6ar9p	tfvwjma6h1h	4	\N	\N	\N
yopjwa6ar9p	kyjc1neko0n	5	\N	\N	\N
yopjwa6ar9p	7v9fsmf19yo	7	\N	\N	\N
yopjwa6ar9p	lzlnihuzy9k	7	\N	\N	\N
4zcpgpedxcf	g0ijjznmv2z	7	\N	\N	\N
4zcpgpedxcf	eao99d5nu76	4	\N	\N	\N
4zcpgpedxcf	tfvwjma6h1h	5	\N	\N	\N
4zcpgpedxcf	kyjc1neko0n	6	\N	\N	\N
4zcpgpedxcf	7v9fsmf19yo	8	\N	\N	\N
4zcpgpedxcf	lzlnihuzy9k	8	\N	\N	\N
2zzl0fhh8ai	g0ijjznmv2z	8	\N	\N	\N
2zzl0fhh8ai	eao99d5nu76	5	\N	\N	\N
2zzl0fhh8ai	tfvwjma6h1h	6	\N	\N	\N
2zzl0fhh8ai	kyjc1neko0n	7	\N	\N	\N
2zzl0fhh8ai	7v9fsmf19yo	9	\N	\N	\N
2zzl0fhh8ai	lzlnihuzy9k	9	\N	\N	\N
tyq1a9qwq1x	g0ijjznmv2z	9	\N	\N	\N
tyq1a9qwq1x	eao99d5nu76	6	\N	\N	\N
tyq1a9qwq1x	tfvwjma6h1h	7	\N	\N	\N
tyq1a9qwq1x	kyjc1neko0n	8	\N	\N	\N
tyq1a9qwq1x	7v9fsmf19yo	10	\N	\N	\N
tyq1a9qwq1x	lzlnihuzy9k	10	\N	\N	\N
r34c545vn0o	g0ijjznmv2z	10	\N	\N	\N
r34c545vn0o	eao99d5nu76	7	\N	\N	\N
r34c545vn0o	tfvwjma6h1h	8	\N	\N	\N
r34c545vn0o	kyjc1neko0n	9	\N	\N	\N
r34c545vn0o	7v9fsmf19yo	11	\N	\N	\N
r34c545vn0o	lzlnihuzy9k	11	\N	\N	\N
s7ppiu6idan	g0ijjznmv2z	11	\N	\N	\N
s7ppiu6idan	eao99d5nu76	8	\N	\N	\N
s7ppiu6idan	tfvwjma6h1h	9	\N	\N	\N
s7ppiu6idan	kyjc1neko0n	10	\N	\N	\N
s7ppiu6idan	7v9fsmf19yo	12	\N	\N	\N
s7ppiu6idan	lzlnihuzy9k	12	\N	\N	\N
9gg7w4ctvy1	g0ijjznmv2z	12	\N	\N	\N
9gg7w4ctvy1	eao99d5nu76	9	\N	\N	\N
9gg7w4ctvy1	tfvwjma6h1h	10	\N	\N	\N
9gg7w4ctvy1	kyjc1neko0n	11	\N	\N	\N
9gg7w4ctvy1	7v9fsmf19yo	13	\N	\N	\N
9gg7w4ctvy1	lzlnihuzy9k	13	\N	\N	\N
4ea0eg22s6f	g0ijjznmv2z	13	\N	\N	\N
4ea0eg22s6f	eao99d5nu76	10	\N	\N	\N
4ea0eg22s6f	tfvwjma6h1h	11	\N	\N	\N
4ea0eg22s6f	kyjc1neko0n	12	\N	\N	\N
4ea0eg22s6f	7v9fsmf19yo	14	\N	\N	\N
4ea0eg22s6f	lzlnihuzy9k	14	\N	\N	\N
5i6s9h3z12w	g0ijjznmv2z	14	\N	\N	\N
5i6s9h3z12w	eao99d5nu76	11	\N	\N	\N
5i6s9h3z12w	tfvwjma6h1h	12	\N	\N	\N
5i6s9h3z12w	kyjc1neko0n	13	\N	\N	\N
5i6s9h3z12w	7v9fsmf19yo	15	\N	\N	\N
5i6s9h3z12w	lzlnihuzy9k	15	\N	\N	\N
3o0nafjc9zn	g0ijjznmv2z	15	\N	\N	\N
3o0nafjc9zn	eao99d5nu76	12	\N	\N	\N
3o0nafjc9zn	tfvwjma6h1h	13	\N	\N	\N
3o0nafjc9zn	kyjc1neko0n	14	\N	\N	\N
3o0nafjc9zn	7v9fsmf19yo	16	\N	\N	\N
3o0nafjc9zn	lzlnihuzy9k	16	\N	\N	\N
wpw2zdgvred	g0ijjznmv2z	16	\N	\N	\N
wpw2zdgvred	eao99d5nu76	13	\N	\N	\N
wpw2zdgvred	tfvwjma6h1h	14	\N	\N	\N
wpw2zdgvred	kyjc1neko0n	15	\N	\N	\N
wpw2zdgvred	7v9fsmf19yo	17	\N	\N	\N
wpw2zdgvred	lzlnihuzy9k	17	\N	\N	\N
we4al08cgrl	g0ijjznmv2z	17	\N	\N	\N
we4al08cgrl	eao99d5nu76	14	\N	\N	\N
we4al08cgrl	tfvwjma6h1h	15	\N	\N	\N
we4al08cgrl	kyjc1neko0n	16	\N	\N	\N
we4al08cgrl	7v9fsmf19yo	18	\N	\N	\N
we4al08cgrl	lzlnihuzy9k	18	\N	\N	\N
tjb47m7iend	eao99d5nu76	1	\N	\N	1
l3sgh9mhjf1	l3sgh9mhjf1	0	f	properties	\N
3rlf14565qx	l3sgh9mhjf1	1	\N	\N	1
v4ra6p9ksat	v4ra6p9ksat	0	f	properties	\N
l3sgh9mhjf1	v4ra6p9ksat	1	\N	\N	1
3rlf14565qx	v4ra6p9ksat	2	\N	\N	1
we4al08cgrl	p9pxqbpwxlo	9	\N	\N	\N
lzlnihuzy9k	l3sgh9mhjf1	2	\N	\N	\N
lzlnihuzy9k	v4ra6p9ksat	3	\N	\N	\N
g0ijjznmv2z	3rlf14565qx	2	\N	\N	\N
g0ijjznmv2z	l3sgh9mhjf1	3	\N	\N	\N
g0ijjznmv2z	v4ra6p9ksat	4	\N	\N	\N
kyjc1neko0n	3rlf14565qx	3	\N	\N	\N
kyjc1neko0n	l3sgh9mhjf1	4	\N	\N	\N
kyjc1neko0n	v4ra6p9ksat	5	\N	\N	\N
tfvwjma6h1h	3rlf14565qx	4	\N	\N	\N
tfvwjma6h1h	l3sgh9mhjf1	5	\N	\N	\N
tfvwjma6h1h	v4ra6p9ksat	6	\N	\N	\N
eao99d5nu76	3rlf14565qx	5	\N	\N	\N
eao99d5nu76	l3sgh9mhjf1	6	\N	\N	\N
eao99d5nu76	v4ra6p9ksat	7	\N	\N	\N
tjb47m7iend	3rlf14565qx	6	\N	\N	\N
tjb47m7iend	l3sgh9mhjf1	7	\N	\N	\N
tjb47m7iend	v4ra6p9ksat	8	\N	\N	\N
mohx8b2r1wc	3rlf14565qx	7	\N	\N	\N
mohx8b2r1wc	l3sgh9mhjf1	8	\N	\N	\N
mohx8b2r1wc	v4ra6p9ksat	9	\N	\N	\N
yopjwa6ar9p	3rlf14565qx	8	\N	\N	\N
yopjwa6ar9p	l3sgh9mhjf1	9	\N	\N	\N
yopjwa6ar9p	v4ra6p9ksat	10	\N	\N	\N
4zcpgpedxcf	3rlf14565qx	9	\N	\N	\N
4zcpgpedxcf	l3sgh9mhjf1	10	\N	\N	\N
4zcpgpedxcf	v4ra6p9ksat	11	\N	\N	\N
2zzl0fhh8ai	3rlf14565qx	10	\N	\N	\N
2zzl0fhh8ai	l3sgh9mhjf1	11	\N	\N	\N
2zzl0fhh8ai	v4ra6p9ksat	12	\N	\N	\N
tyq1a9qwq1x	3rlf14565qx	11	\N	\N	\N
tyq1a9qwq1x	l3sgh9mhjf1	12	\N	\N	\N
tyq1a9qwq1x	v4ra6p9ksat	13	\N	\N	\N
r34c545vn0o	3rlf14565qx	12	\N	\N	\N
r34c545vn0o	l3sgh9mhjf1	13	\N	\N	\N
r34c545vn0o	v4ra6p9ksat	14	\N	\N	\N
s7ppiu6idan	3rlf14565qx	13	\N	\N	\N
s7ppiu6idan	l3sgh9mhjf1	14	\N	\N	\N
3rlf14565qx	3rlf14565qx	0	f	properties	\N
spf0vrfmlni	spf0vrfmlni	0	f	properties	\N
s7ppiu6idan	v4ra6p9ksat	15	\N	\N	\N
9gg7w4ctvy1	3rlf14565qx	14	\N	\N	\N
9gg7w4ctvy1	l3sgh9mhjf1	15	\N	\N	\N
9gg7w4ctvy1	v4ra6p9ksat	16	\N	\N	\N
4ea0eg22s6f	3rlf14565qx	15	\N	\N	\N
4ea0eg22s6f	l3sgh9mhjf1	16	\N	\N	\N
4ea0eg22s6f	v4ra6p9ksat	17	\N	\N	\N
5i6s9h3z12w	3rlf14565qx	16	\N	\N	\N
5i6s9h3z12w	l3sgh9mhjf1	17	\N	\N	\N
5i6s9h3z12w	v4ra6p9ksat	18	\N	\N	\N
3o0nafjc9zn	3rlf14565qx	17	\N	\N	\N
3o0nafjc9zn	l3sgh9mhjf1	18	\N	\N	\N
3o0nafjc9zn	v4ra6p9ksat	19	\N	\N	\N
wpw2zdgvred	3rlf14565qx	18	\N	\N	\N
wpw2zdgvred	l3sgh9mhjf1	19	\N	\N	\N
wpw2zdgvred	v4ra6p9ksat	20	\N	\N	\N
we4al08cgrl	3rlf14565qx	19	\N	\N	\N
we4al08cgrl	l3sgh9mhjf1	20	\N	\N	\N
we4al08cgrl	v4ra6p9ksat	21	\N	\N	\N
lzlnihuzy9k	3rlf14565qx	1	\N	\N	1
pa81dc5mz2s	pa81dc5mz2s	0	f	properties	\N
lhj3gzgx3e7	pa81dc5mz2s	1	\N	\N	1
o0qit001igh	o0qit001igh	0	f	properties	\N
pa81dc5mz2s	o0qit001igh	1	\N	\N	1
lhj3gzgx3e7	o0qit001igh	2	\N	\N	1
lzlnihuzy9k	pa81dc5mz2s	2	\N	\N	\N
lzlnihuzy9k	o0qit001igh	3	\N	\N	\N
g0ijjznmv2z	lhj3gzgx3e7	2	\N	\N	\N
g0ijjznmv2z	pa81dc5mz2s	3	\N	\N	\N
g0ijjznmv2z	o0qit001igh	4	\N	\N	\N
kyjc1neko0n	lhj3gzgx3e7	3	\N	\N	\N
kyjc1neko0n	pa81dc5mz2s	4	\N	\N	\N
kyjc1neko0n	o0qit001igh	5	\N	\N	\N
tfvwjma6h1h	lhj3gzgx3e7	4	\N	\N	\N
tfvwjma6h1h	pa81dc5mz2s	5	\N	\N	\N
tfvwjma6h1h	o0qit001igh	6	\N	\N	\N
eao99d5nu76	lhj3gzgx3e7	5	\N	\N	\N
eao99d5nu76	pa81dc5mz2s	6	\N	\N	\N
eao99d5nu76	o0qit001igh	7	\N	\N	\N
tjb47m7iend	lhj3gzgx3e7	6	\N	\N	\N
tjb47m7iend	pa81dc5mz2s	7	\N	\N	\N
tjb47m7iend	o0qit001igh	8	\N	\N	\N
mohx8b2r1wc	lhj3gzgx3e7	7	\N	\N	\N
mohx8b2r1wc	pa81dc5mz2s	8	\N	\N	\N
mohx8b2r1wc	o0qit001igh	9	\N	\N	\N
yopjwa6ar9p	lhj3gzgx3e7	8	\N	\N	\N
yopjwa6ar9p	pa81dc5mz2s	9	\N	\N	\N
yopjwa6ar9p	o0qit001igh	10	\N	\N	\N
4zcpgpedxcf	lhj3gzgx3e7	9	\N	\N	\N
4zcpgpedxcf	pa81dc5mz2s	10	\N	\N	\N
4zcpgpedxcf	o0qit001igh	11	\N	\N	\N
2zzl0fhh8ai	lhj3gzgx3e7	10	\N	\N	\N
2zzl0fhh8ai	pa81dc5mz2s	11	\N	\N	\N
2zzl0fhh8ai	o0qit001igh	12	\N	\N	\N
tyq1a9qwq1x	lhj3gzgx3e7	11	\N	\N	\N
tyq1a9qwq1x	pa81dc5mz2s	12	\N	\N	\N
tyq1a9qwq1x	o0qit001igh	13	\N	\N	\N
r34c545vn0o	lhj3gzgx3e7	12	\N	\N	\N
r34c545vn0o	pa81dc5mz2s	13	\N	\N	\N
r34c545vn0o	o0qit001igh	14	\N	\N	\N
s7ppiu6idan	lhj3gzgx3e7	13	\N	\N	\N
s7ppiu6idan	pa81dc5mz2s	14	\N	\N	\N
s7ppiu6idan	o0qit001igh	15	\N	\N	\N
9gg7w4ctvy1	lhj3gzgx3e7	14	\N	\N	\N
9gg7w4ctvy1	pa81dc5mz2s	15	\N	\N	\N
9gg7w4ctvy1	o0qit001igh	16	\N	\N	\N
4ea0eg22s6f	lhj3gzgx3e7	15	\N	\N	\N
4ea0eg22s6f	pa81dc5mz2s	16	\N	\N	\N
4ea0eg22s6f	o0qit001igh	17	\N	\N	\N
5i6s9h3z12w	lhj3gzgx3e7	16	\N	\N	\N
5i6s9h3z12w	pa81dc5mz2s	17	\N	\N	\N
5i6s9h3z12w	o0qit001igh	18	\N	\N	\N
3o0nafjc9zn	lhj3gzgx3e7	17	\N	\N	\N
3o0nafjc9zn	pa81dc5mz2s	18	\N	\N	\N
3o0nafjc9zn	o0qit001igh	19	\N	\N	\N
wpw2zdgvred	lhj3gzgx3e7	18	\N	\N	\N
wpw2zdgvred	pa81dc5mz2s	19	\N	\N	\N
wpw2zdgvred	o0qit001igh	20	\N	\N	\N
we4al08cgrl	lhj3gzgx3e7	19	\N	\N	\N
we4al08cgrl	pa81dc5mz2s	20	\N	\N	\N
we4al08cgrl	o0qit001igh	21	\N	\N	\N
lhj3gzgx3e7	lhj3gzgx3e7	0	f	properties	\N
lzlnihuzy9k	lhj3gzgx3e7	1	\N	\N	2
he8e1fqolx7	spf0vrfmlni	1	\N	\N	3
zxaigthddoe	zxaigthddoe	0	f	properties	\N
rfvfyswbpdl	zxaigthddoe	1	\N	\N	1
l9p9ulc5ojf	rfvfyswbpdl	5	\N	\N	\N
l9p9ulc5ojf	zxaigthddoe	6	\N	\N	\N
he8e1fqolx7	zxaigthddoe	2	\N	\N	\N
xaqtxcn6wk1	rfvfyswbpdl	2	\N	\N	\N
xaqtxcn6wk1	zxaigthddoe	3	\N	\N	\N
q17mcp7s7kv	rfvfyswbpdl	3	\N	\N	\N
q17mcp7s7kv	zxaigthddoe	4	\N	\N	\N
lywb8khu67q	rfvfyswbpdl	4	\N	\N	\N
lywb8khu67q	zxaigthddoe	5	\N	\N	\N
s2f6dhfqp5d	rfvfyswbpdl	6	\N	\N	\N
s2f6dhfqp5d	zxaigthddoe	7	\N	\N	\N
bdo3e9silbn	rfvfyswbpdl	7	\N	\N	\N
bdo3e9silbn	zxaigthddoe	8	\N	\N	\N
we4al08cgrl	rfvfyswbpdl	8	\N	\N	\N
we4al08cgrl	zxaigthddoe	9	\N	\N	\N
rfvfyswbpdl	rfvfyswbpdl	0	f	properties	\N
he8e1fqolx7	rfvfyswbpdl	1	\N	\N	4
rvvc2y1qa7f	rvvc2y1qa7f	0	f	properties	\N
wk5o4jx0jm1	wk5o4jx0jm1	0	f	properties	\N
l9p9ulc5ojf	wk5o4jx0jm1	5	\N	\N	\N
xaqtxcn6wk1	wk5o4jx0jm1	2	\N	\N	\N
q17mcp7s7kv	wk5o4jx0jm1	3	\N	\N	\N
lywb8khu67q	wk5o4jx0jm1	4	\N	\N	\N
s2f6dhfqp5d	wk5o4jx0jm1	6	\N	\N	\N
bdo3e9silbn	wk5o4jx0jm1	7	\N	\N	\N
we4al08cgrl	wk5o4jx0jm1	8	\N	\N	\N
s858ethc2gi	wk5o4jx0jm1	1	\N	\N	1
5he1bj710pw	5he1bj710pw	0	f	properties	\N
ynor7lp0rqw	ynor7lp0rqw	0	f	properties	\N
vombuyq1x8n	ynor7lp0rqw	1	\N	\N	1
nvdtz9owsku	nvdtz9owsku	0	f	properties	\N
ynor7lp0rqw	nvdtz9owsku	1	\N	\N	1
vombuyq1x8n	nvdtz9owsku	2	\N	\N	1
lzlnihuzy9k	ynor7lp0rqw	2	\N	\N	\N
lzlnihuzy9k	nvdtz9owsku	3	\N	\N	\N
g0ijjznmv2z	vombuyq1x8n	2	\N	\N	\N
g0ijjznmv2z	ynor7lp0rqw	3	\N	\N	\N
g0ijjznmv2z	nvdtz9owsku	4	\N	\N	\N
kyjc1neko0n	vombuyq1x8n	3	\N	\N	\N
kyjc1neko0n	ynor7lp0rqw	4	\N	\N	\N
kyjc1neko0n	nvdtz9owsku	5	\N	\N	\N
tfvwjma6h1h	vombuyq1x8n	4	\N	\N	\N
tfvwjma6h1h	ynor7lp0rqw	5	\N	\N	\N
tfvwjma6h1h	nvdtz9owsku	6	\N	\N	\N
eao99d5nu76	vombuyq1x8n	5	\N	\N	\N
eao99d5nu76	ynor7lp0rqw	6	\N	\N	\N
eao99d5nu76	nvdtz9owsku	7	\N	\N	\N
tjb47m7iend	vombuyq1x8n	6	\N	\N	\N
tjb47m7iend	ynor7lp0rqw	7	\N	\N	\N
tjb47m7iend	nvdtz9owsku	8	\N	\N	\N
mohx8b2r1wc	vombuyq1x8n	7	\N	\N	\N
mohx8b2r1wc	ynor7lp0rqw	8	\N	\N	\N
mohx8b2r1wc	nvdtz9owsku	9	\N	\N	\N
yopjwa6ar9p	vombuyq1x8n	8	\N	\N	\N
yopjwa6ar9p	ynor7lp0rqw	9	\N	\N	\N
yopjwa6ar9p	nvdtz9owsku	10	\N	\N	\N
4zcpgpedxcf	vombuyq1x8n	9	\N	\N	\N
4zcpgpedxcf	ynor7lp0rqw	10	\N	\N	\N
4zcpgpedxcf	nvdtz9owsku	11	\N	\N	\N
2zzl0fhh8ai	vombuyq1x8n	10	\N	\N	\N
2zzl0fhh8ai	ynor7lp0rqw	11	\N	\N	\N
2zzl0fhh8ai	nvdtz9owsku	12	\N	\N	\N
tyq1a9qwq1x	vombuyq1x8n	11	\N	\N	\N
tyq1a9qwq1x	ynor7lp0rqw	12	\N	\N	\N
tyq1a9qwq1x	nvdtz9owsku	13	\N	\N	\N
r34c545vn0o	vombuyq1x8n	12	\N	\N	\N
r34c545vn0o	ynor7lp0rqw	13	\N	\N	\N
r34c545vn0o	nvdtz9owsku	14	\N	\N	\N
s7ppiu6idan	vombuyq1x8n	13	\N	\N	\N
s7ppiu6idan	ynor7lp0rqw	14	\N	\N	\N
s7ppiu6idan	nvdtz9owsku	15	\N	\N	\N
9gg7w4ctvy1	vombuyq1x8n	14	\N	\N	\N
9gg7w4ctvy1	ynor7lp0rqw	15	\N	\N	\N
9gg7w4ctvy1	nvdtz9owsku	16	\N	\N	\N
4ea0eg22s6f	vombuyq1x8n	15	\N	\N	\N
4ea0eg22s6f	ynor7lp0rqw	16	\N	\N	\N
4ea0eg22s6f	nvdtz9owsku	17	\N	\N	\N
5i6s9h3z12w	vombuyq1x8n	16	\N	\N	\N
5i6s9h3z12w	ynor7lp0rqw	17	\N	\N	\N
5i6s9h3z12w	nvdtz9owsku	18	\N	\N	\N
3o0nafjc9zn	vombuyq1x8n	17	\N	\N	\N
3o0nafjc9zn	ynor7lp0rqw	18	\N	\N	\N
3o0nafjc9zn	nvdtz9owsku	19	\N	\N	\N
wpw2zdgvred	vombuyq1x8n	18	\N	\N	\N
wpw2zdgvred	ynor7lp0rqw	19	\N	\N	\N
wpw2zdgvred	nvdtz9owsku	20	\N	\N	\N
we4al08cgrl	vombuyq1x8n	19	\N	\N	\N
we4al08cgrl	ynor7lp0rqw	20	\N	\N	\N
we4al08cgrl	nvdtz9owsku	21	\N	\N	\N
vombuyq1x8n	vombuyq1x8n	0	f	properties	\N
lzlnihuzy9k	vombuyq1x8n	1	\N	\N	4
l9p9ulc5ojf	5he1bj710pw	5	\N	\N	\N
xaqtxcn6wk1	5he1bj710pw	2	\N	\N	\N
q17mcp7s7kv	5he1bj710pw	3	\N	\N	\N
p7hqvt7241v	p7hqvt7241v	0	f	properties	\N
bp6j0exsgsz	p7hqvt7241v	1	\N	\N	1
lywb8khu67q	5he1bj710pw	4	\N	\N	\N
s2f6dhfqp5d	5he1bj710pw	6	\N	\N	\N
t11rqpzyyzj	t11rqpzyyzj	0	f	properties	\N
p7hqvt7241v	t11rqpzyyzj	1	\N	\N	1
bp6j0exsgsz	t11rqpzyyzj	2	\N	\N	1
bdo3e9silbn	5he1bj710pw	7	\N	\N	\N
we4al08cgrl	5he1bj710pw	8	\N	\N	\N
41gklgkpbp3	41gklgkpbp3	0	f	properties	\N
t11rqpzyyzj	41gklgkpbp3	1	\N	\N	1
p7hqvt7241v	41gklgkpbp3	2	\N	\N	1
bp6j0exsgsz	41gklgkpbp3	3	\N	\N	1
s858ethc2gi	5he1bj710pw	1	\N	\N	2
kward4tb5dp	kward4tb5dp	0	f	properties	\N
41gklgkpbp3	kward4tb5dp	1	\N	\N	1
t11rqpzyyzj	kward4tb5dp	2	\N	\N	1
p7hqvt7241v	kward4tb5dp	3	\N	\N	1
bp6j0exsgsz	kward4tb5dp	4	\N	\N	1
q2viz2upay6	q2viz2upay6	0	f	properties	\N
l9p9ulc5ojf	q2viz2upay6	5	\N	\N	\N
xaqtxcn6wk1	q2viz2upay6	2	\N	\N	\N
q17mcp7s7kv	q2viz2upay6	3	\N	\N	\N
lywb8khu67q	q2viz2upay6	4	\N	\N	\N
s2f6dhfqp5d	q2viz2upay6	6	\N	\N	\N
bdo3e9silbn	q2viz2upay6	7	\N	\N	\N
g0ijjznmv2z	fkywrij28u6	2	\N	\N	\N
we4al08cgrl	q2viz2upay6	8	\N	\N	\N
s858ethc2gi	q2viz2upay6	1	\N	\N	3
kyjc1neko0n	fkywrij28u6	3	\N	\N	\N
tfvwjma6h1h	fkywrij28u6	4	\N	\N	\N
fkywrij28u6	fkywrij28u6	0	f	properties	\N
lzlnihuzy9k	fkywrij28u6	1	\N	\N	5
bp6j0exsgsz	bp6j0exsgsz	0	f	properties	\N
eao99d5nu76	fkywrij28u6	5	\N	\N	\N
tjb47m7iend	fkywrij28u6	6	\N	\N	\N
mohx8b2r1wc	fkywrij28u6	7	\N	\N	\N
yopjwa6ar9p	fkywrij28u6	8	\N	\N	\N
4zcpgpedxcf	fkywrij28u6	9	\N	\N	\N
2zzl0fhh8ai	fkywrij28u6	10	\N	\N	\N
tyq1a9qwq1x	fkywrij28u6	11	\N	\N	\N
r34c545vn0o	fkywrij28u6	12	\N	\N	\N
s7ppiu6idan	fkywrij28u6	13	\N	\N	\N
9gg7w4ctvy1	fkywrij28u6	14	\N	\N	\N
4ea0eg22s6f	fkywrij28u6	15	\N	\N	\N
5i6s9h3z12w	fkywrij28u6	16	\N	\N	\N
3o0nafjc9zn	fkywrij28u6	17	\N	\N	\N
wpw2zdgvred	fkywrij28u6	18	\N	\N	\N
we4al08cgrl	fkywrij28u6	19	\N	\N	\N
jtr6vzxdbwk	rvvc2y1qa7f	1	\N	\N	1
lhj3gzgx3e7	rvvc2y1qa7f	2	\N	\N	\N
lzlnihuzy9k	jtr6vzxdbwk	2	\N	\N	\N
lzlnihuzy9k	rvvc2y1qa7f	3	\N	\N	\N
g0ijjznmv2z	jtr6vzxdbwk	3	\N	\N	\N
g0ijjznmv2z	rvvc2y1qa7f	4	\N	\N	\N
kyjc1neko0n	jtr6vzxdbwk	4	\N	\N	\N
kyjc1neko0n	rvvc2y1qa7f	5	\N	\N	\N
tfvwjma6h1h	jtr6vzxdbwk	5	\N	\N	\N
tfvwjma6h1h	rvvc2y1qa7f	6	\N	\N	\N
eao99d5nu76	jtr6vzxdbwk	6	\N	\N	\N
eao99d5nu76	rvvc2y1qa7f	7	\N	\N	\N
tjb47m7iend	jtr6vzxdbwk	7	\N	\N	\N
tjb47m7iend	rvvc2y1qa7f	8	\N	\N	\N
mohx8b2r1wc	jtr6vzxdbwk	8	\N	\N	\N
mohx8b2r1wc	rvvc2y1qa7f	9	\N	\N	\N
yopjwa6ar9p	jtr6vzxdbwk	9	\N	\N	\N
yopjwa6ar9p	rvvc2y1qa7f	10	\N	\N	\N
4zcpgpedxcf	jtr6vzxdbwk	10	\N	\N	\N
4zcpgpedxcf	rvvc2y1qa7f	11	\N	\N	\N
2zzl0fhh8ai	jtr6vzxdbwk	11	\N	\N	\N
2zzl0fhh8ai	rvvc2y1qa7f	12	\N	\N	\N
tyq1a9qwq1x	jtr6vzxdbwk	12	\N	\N	\N
tyq1a9qwq1x	rvvc2y1qa7f	13	\N	\N	\N
r34c545vn0o	jtr6vzxdbwk	13	\N	\N	\N
r34c545vn0o	rvvc2y1qa7f	14	\N	\N	\N
s7ppiu6idan	jtr6vzxdbwk	14	\N	\N	\N
s7ppiu6idan	rvvc2y1qa7f	15	\N	\N	\N
9gg7w4ctvy1	jtr6vzxdbwk	15	\N	\N	\N
9gg7w4ctvy1	rvvc2y1qa7f	16	\N	\N	\N
4ea0eg22s6f	jtr6vzxdbwk	16	\N	\N	\N
4ea0eg22s6f	rvvc2y1qa7f	17	\N	\N	\N
5i6s9h3z12w	jtr6vzxdbwk	17	\N	\N	\N
5i6s9h3z12w	rvvc2y1qa7f	18	\N	\N	\N
3o0nafjc9zn	jtr6vzxdbwk	18	\N	\N	\N
3o0nafjc9zn	rvvc2y1qa7f	19	\N	\N	\N
wpw2zdgvred	jtr6vzxdbwk	19	\N	\N	\N
wpw2zdgvred	rvvc2y1qa7f	20	\N	\N	\N
we4al08cgrl	jtr6vzxdbwk	20	\N	\N	\N
we4al08cgrl	rvvc2y1qa7f	21	\N	\N	\N
jtr6vzxdbwk	jtr6vzxdbwk	0	f	properties	\N
lhj3gzgx3e7	jtr6vzxdbwk	1	\N	\N	2
8jpypq68dn5	p7hqvt7241v	2	\N	\N	\N
8jpypq68dn5	t11rqpzyyzj	3	\N	\N	\N
8jpypq68dn5	41gklgkpbp3	4	\N	\N	\N
8jpypq68dn5	kward4tb5dp	5	\N	\N	\N
8jpypq68dn5	bp6j0exsgsz	1	\N	\N	1
vombuyq1x8n	bp6j0exsgsz	2	\N	\N	\N
vombuyq1x8n	p7hqvt7241v	3	\N	\N	\N
vombuyq1x8n	t11rqpzyyzj	4	\N	\N	\N
vombuyq1x8n	41gklgkpbp3	5	\N	\N	\N
vombuyq1x8n	kward4tb5dp	6	\N	\N	\N
lzlnihuzy9k	8jpypq68dn5	2	\N	\N	\N
lzlnihuzy9k	bp6j0exsgsz	3	\N	\N	\N
lzlnihuzy9k	p7hqvt7241v	4	\N	\N	\N
lzlnihuzy9k	t11rqpzyyzj	5	\N	\N	\N
lzlnihuzy9k	41gklgkpbp3	6	\N	\N	\N
lzlnihuzy9k	kward4tb5dp	7	\N	\N	\N
g0ijjznmv2z	8jpypq68dn5	3	\N	\N	\N
g0ijjznmv2z	bp6j0exsgsz	4	\N	\N	\N
g0ijjznmv2z	p7hqvt7241v	5	\N	\N	\N
g0ijjznmv2z	t11rqpzyyzj	6	\N	\N	\N
g0ijjznmv2z	41gklgkpbp3	7	\N	\N	\N
g0ijjznmv2z	kward4tb5dp	8	\N	\N	\N
kyjc1neko0n	8jpypq68dn5	4	\N	\N	\N
kyjc1neko0n	bp6j0exsgsz	5	\N	\N	\N
kyjc1neko0n	p7hqvt7241v	6	\N	\N	\N
kyjc1neko0n	t11rqpzyyzj	7	\N	\N	\N
kyjc1neko0n	41gklgkpbp3	8	\N	\N	\N
kyjc1neko0n	kward4tb5dp	9	\N	\N	\N
tfvwjma6h1h	8jpypq68dn5	5	\N	\N	\N
tfvwjma6h1h	bp6j0exsgsz	6	\N	\N	\N
tfvwjma6h1h	p7hqvt7241v	7	\N	\N	\N
tfvwjma6h1h	t11rqpzyyzj	8	\N	\N	\N
tfvwjma6h1h	41gklgkpbp3	9	\N	\N	\N
tfvwjma6h1h	kward4tb5dp	10	\N	\N	\N
eao99d5nu76	8jpypq68dn5	6	\N	\N	\N
eao99d5nu76	bp6j0exsgsz	7	\N	\N	\N
eao99d5nu76	p7hqvt7241v	8	\N	\N	\N
eao99d5nu76	t11rqpzyyzj	9	\N	\N	\N
eao99d5nu76	41gklgkpbp3	10	\N	\N	\N
eao99d5nu76	kward4tb5dp	11	\N	\N	\N
tjb47m7iend	8jpypq68dn5	7	\N	\N	\N
tjb47m7iend	bp6j0exsgsz	8	\N	\N	\N
tjb47m7iend	p7hqvt7241v	9	\N	\N	\N
tjb47m7iend	t11rqpzyyzj	10	\N	\N	\N
tjb47m7iend	41gklgkpbp3	11	\N	\N	\N
tjb47m7iend	kward4tb5dp	12	\N	\N	\N
mohx8b2r1wc	8jpypq68dn5	8	\N	\N	\N
mohx8b2r1wc	bp6j0exsgsz	9	\N	\N	\N
mohx8b2r1wc	p7hqvt7241v	10	\N	\N	\N
mohx8b2r1wc	t11rqpzyyzj	11	\N	\N	\N
mohx8b2r1wc	41gklgkpbp3	12	\N	\N	\N
mohx8b2r1wc	kward4tb5dp	13	\N	\N	\N
yopjwa6ar9p	8jpypq68dn5	9	\N	\N	\N
yopjwa6ar9p	bp6j0exsgsz	10	\N	\N	\N
yopjwa6ar9p	p7hqvt7241v	11	\N	\N	\N
yopjwa6ar9p	t11rqpzyyzj	12	\N	\N	\N
yopjwa6ar9p	41gklgkpbp3	13	\N	\N	\N
yopjwa6ar9p	kward4tb5dp	14	\N	\N	\N
4zcpgpedxcf	8jpypq68dn5	10	\N	\N	\N
4zcpgpedxcf	bp6j0exsgsz	11	\N	\N	\N
4zcpgpedxcf	p7hqvt7241v	12	\N	\N	\N
4zcpgpedxcf	t11rqpzyyzj	13	\N	\N	\N
4zcpgpedxcf	41gklgkpbp3	14	\N	\N	\N
4zcpgpedxcf	kward4tb5dp	15	\N	\N	\N
2zzl0fhh8ai	8jpypq68dn5	11	\N	\N	\N
2zzl0fhh8ai	bp6j0exsgsz	12	\N	\N	\N
2zzl0fhh8ai	p7hqvt7241v	13	\N	\N	\N
2zzl0fhh8ai	t11rqpzyyzj	14	\N	\N	\N
2zzl0fhh8ai	41gklgkpbp3	15	\N	\N	\N
2zzl0fhh8ai	kward4tb5dp	16	\N	\N	\N
tyq1a9qwq1x	8jpypq68dn5	12	\N	\N	\N
tyq1a9qwq1x	bp6j0exsgsz	13	\N	\N	\N
tyq1a9qwq1x	p7hqvt7241v	14	\N	\N	\N
tyq1a9qwq1x	t11rqpzyyzj	15	\N	\N	\N
tyq1a9qwq1x	41gklgkpbp3	16	\N	\N	\N
tyq1a9qwq1x	kward4tb5dp	17	\N	\N	\N
r34c545vn0o	8jpypq68dn5	13	\N	\N	\N
r34c545vn0o	bp6j0exsgsz	14	\N	\N	\N
r34c545vn0o	p7hqvt7241v	15	\N	\N	\N
r34c545vn0o	t11rqpzyyzj	16	\N	\N	\N
r34c545vn0o	41gklgkpbp3	17	\N	\N	\N
r34c545vn0o	kward4tb5dp	18	\N	\N	\N
s7ppiu6idan	8jpypq68dn5	14	\N	\N	\N
s7ppiu6idan	bp6j0exsgsz	15	\N	\N	\N
s7ppiu6idan	p7hqvt7241v	16	\N	\N	\N
s7ppiu6idan	t11rqpzyyzj	17	\N	\N	\N
s7ppiu6idan	41gklgkpbp3	18	\N	\N	\N
s7ppiu6idan	kward4tb5dp	19	\N	\N	\N
9gg7w4ctvy1	8jpypq68dn5	15	\N	\N	\N
9gg7w4ctvy1	bp6j0exsgsz	16	\N	\N	\N
9gg7w4ctvy1	p7hqvt7241v	17	\N	\N	\N
9gg7w4ctvy1	t11rqpzyyzj	18	\N	\N	\N
9gg7w4ctvy1	41gklgkpbp3	19	\N	\N	\N
9gg7w4ctvy1	kward4tb5dp	20	\N	\N	\N
4ea0eg22s6f	8jpypq68dn5	16	\N	\N	\N
4ea0eg22s6f	bp6j0exsgsz	17	\N	\N	\N
4ea0eg22s6f	p7hqvt7241v	18	\N	\N	\N
4ea0eg22s6f	t11rqpzyyzj	19	\N	\N	\N
4ea0eg22s6f	41gklgkpbp3	20	\N	\N	\N
4ea0eg22s6f	kward4tb5dp	21	\N	\N	\N
5i6s9h3z12w	8jpypq68dn5	17	\N	\N	\N
5i6s9h3z12w	bp6j0exsgsz	18	\N	\N	\N
5i6s9h3z12w	p7hqvt7241v	19	\N	\N	\N
5i6s9h3z12w	t11rqpzyyzj	20	\N	\N	\N
5i6s9h3z12w	41gklgkpbp3	21	\N	\N	\N
5i6s9h3z12w	kward4tb5dp	22	\N	\N	\N
3o0nafjc9zn	8jpypq68dn5	18	\N	\N	\N
3o0nafjc9zn	bp6j0exsgsz	19	\N	\N	\N
3o0nafjc9zn	p7hqvt7241v	20	\N	\N	\N
3o0nafjc9zn	t11rqpzyyzj	21	\N	\N	\N
3o0nafjc9zn	41gklgkpbp3	22	\N	\N	\N
3o0nafjc9zn	kward4tb5dp	23	\N	\N	\N
wpw2zdgvred	8jpypq68dn5	19	\N	\N	\N
wpw2zdgvred	bp6j0exsgsz	20	\N	\N	\N
wpw2zdgvred	p7hqvt7241v	21	\N	\N	\N
wpw2zdgvred	t11rqpzyyzj	22	\N	\N	\N
wpw2zdgvred	41gklgkpbp3	23	\N	\N	\N
wpw2zdgvred	kward4tb5dp	24	\N	\N	\N
we4al08cgrl	8jpypq68dn5	20	\N	\N	\N
we4al08cgrl	bp6j0exsgsz	21	\N	\N	\N
we4al08cgrl	p7hqvt7241v	22	\N	\N	\N
we4al08cgrl	t11rqpzyyzj	23	\N	\N	\N
we4al08cgrl	41gklgkpbp3	24	\N	\N	\N
we4al08cgrl	kward4tb5dp	25	\N	\N	\N
8jpypq68dn5	8jpypq68dn5	0	f	properties	\N
vombuyq1x8n	8jpypq68dn5	1	\N	\N	2
s2f6dhfqp5d	s2f6dhfqp5d	0	t	properties	\N
bdo3e9silbn	s2f6dhfqp5d	1	\N	\N	1
l9p9ulc5ojf	l9p9ulc5ojf	0	f	properties	\N
s2f6dhfqp5d	l9p9ulc5ojf	1	\N	\N	1
bdo3e9silbn	l9p9ulc5ojf	2	\N	\N	1
we4al08cgrl	s2f6dhfqp5d	2	\N	\N	\N
we4al08cgrl	l9p9ulc5ojf	3	\N	\N	\N
bdo3e9silbn	bdo3e9silbn	0	f	properties	\N
we4al08cgrl	bdo3e9silbn	1	\N	\N	3
l9p9ulc5ojf	q17mcp7s7kv	2	\N	\N	\N
l9p9ulc5ojf	xaqtxcn6wk1	3	\N	\N	\N
l9p9ulc5ojf	s858ethc2gi	4	\N	\N	\N
l9p9ulc5ojf	he8e1fqolx7	4	\N	\N	\N
q17mcp7s7kv	q17mcp7s7kv	0	f	properties	\N
lywb8khu67q	q17mcp7s7kv	1	\N	\N	1
xaqtxcn6wk1	xaqtxcn6wk1	0	f	properties	\N
q17mcp7s7kv	xaqtxcn6wk1	1	\N	\N	1
lywb8khu67q	xaqtxcn6wk1	2	\N	\N	1
s858ethc2gi	s858ethc2gi	0	f	properties	\N
xaqtxcn6wk1	s858ethc2gi	1	\N	\N	1
q17mcp7s7kv	s858ethc2gi	2	\N	\N	1
lywb8khu67q	s858ethc2gi	3	\N	\N	1
he8e1fqolx7	he8e1fqolx7	0	f	properties	\N
xaqtxcn6wk1	he8e1fqolx7	1	\N	\N	2
q17mcp7s7kv	he8e1fqolx7	2	\N	\N	2
lywb8khu67q	he8e1fqolx7	3	\N	\N	2
s2f6dhfqp5d	lywb8khu67q	2	\N	\N	\N
s2f6dhfqp5d	q17mcp7s7kv	3	\N	\N	\N
s2f6dhfqp5d	xaqtxcn6wk1	4	\N	\N	\N
s2f6dhfqp5d	s858ethc2gi	5	\N	\N	\N
s2f6dhfqp5d	he8e1fqolx7	5	\N	\N	\N
bdo3e9silbn	lywb8khu67q	3	\N	\N	\N
bdo3e9silbn	q17mcp7s7kv	4	\N	\N	\N
bdo3e9silbn	xaqtxcn6wk1	5	\N	\N	\N
bdo3e9silbn	s858ethc2gi	6	\N	\N	\N
bdo3e9silbn	he8e1fqolx7	6	\N	\N	\N
we4al08cgrl	lywb8khu67q	4	\N	\N	\N
we4al08cgrl	q17mcp7s7kv	5	\N	\N	\N
we4al08cgrl	xaqtxcn6wk1	6	\N	\N	\N
we4al08cgrl	s858ethc2gi	7	\N	\N	\N
we4al08cgrl	he8e1fqolx7	7	\N	\N	\N
lywb8khu67q	lywb8khu67q	0	f	properties	\N
l9p9ulc5ojf	lywb8khu67q	1	\N	\N	1
\.


--
-- Data for Name: uiSchemas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."uiSchemas" ("x-uid", name, schema) FROM stdin;
we4al08cgrl	wsu3cbbhjvm	{"type":"void","x-component":"Menu","x-designer":"Menu.Designer","x-initializer":"MenuItemInitializers","x-component-props":{"mode":"mix","theme":"dark","onSelect":"{{ onSelect }}","sideMenuRefScopeKey":"sideMenuRef"},"properties":{}}
bvb25kzrb9u	page	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Page"}
328zsdxa1d2	m6pzxauh3on	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"BlockInitializers"}
c2f9t3q258l	pv9m1mtj6di	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
dkwjpd81q5f	mcop8wrqf2x	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
9m9g4daljpc	5m1mc3cjcrh	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableBlockProvider","x-acl-action":"WTT_Asset:list","x-decorator-props":{"collection":"WTT_Asset","resource":"WTT_Asset","action":"list","params":{"pageSize":20},"rowKey":"id","showIndex":true,"dragSort":false,"disableTemplate":false},"x-designer":"TableBlockDesigner","x-component":"CardItem","x-filter-targets":[]}
i4bhkgolh3x	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"TableActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":"var(--nb-spacing)"}}}
38urc2isvyr	nmrwnh8vizs	{"_isJSONSchemaObject":true,"version":"2.0","type":"array","x-initializer":"TableColumnInitializers","x-component":"TableV2","x-component-props":{"rowKey":"id","rowSelection":{"type":"checkbox"},"useProps":"{{ useTableBlockProps }}"}}
7e38fr8xa7m	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Actions") }}","x-action-column":"actions","x-decorator":"TableV2.Column.ActionBar","x-component":"TableV2.Column","x-designer":"TableV2.ActionColumnDesigner","x-initializer":"TableActionColumnInitializers"}
p2csprfyzks	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"DndContext","x-component":"Space","x-component-props":{"split":"|"}}
k06t1z467wm	8yrbogk1uqg	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
zgc2xzzxxy4	Name	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Asset.Name","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true}}
wgeyei55ubb	hf40go3srwi	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
tiywwu25gv0	Code	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Asset.Code","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true}}
b4lmg71bhyc	createdAt	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Asset.createdAt","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{}}
xi5fumxgwfz	1w85k7m8y82	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-action":"create","title":"{{t('Add new')}}","x-designer":"Action.Designer","x-component":"Action","x-decorator":"ACLActionProvider","x-component-props":{"openMode":"drawer","type":"primary","component":"CreateRecordAction"},"x-align":"right","x-acl-action-props":{"skipScopeCheck":true}}
7wh75zbfj6p	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Add record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
djk1zx72szz	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializersForCreateFormBlock"}
g5aqieft0p8	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Add new")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
ez550wadmjq	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"CreateFormBlockInitializers"}
m9d24ij8x5y	1regl538gzy	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Refresh") }}","x-action":"refresh","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"icon":"ReloadOutlined","useProps":"{{ useRefreshActionProps }}"},"x-align":"right","type":"void"}
tui7o1pxfhy	44x6fkpdi74	{"x-uid":"tui7o1pxfhy","name":"44x6fkpdi74","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column","title":"Created At"}
awzku0rmhqf	nfhtuo0naoo	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Submit") }}","x-action":"submit","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"type":"primary","htmlType":"submit","useProps":"{{ useUpdateActionProps }}"},"x-action-settings":{},"type":"void"}
k6bw6nt922r	5qaso0pu86i	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
8g2rp9ye3m4	70oeswa2dlx	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
28s9demo7cg	ilyn36fg59k	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action":"WTT_Asset:get","x-decorator":"FormBlockProvider","x-decorator-props":{"resource":"WTT_Asset","collection":"WTT_Asset","readPretty":true,"action":"get","useParams":"{{ useParamsFromRecord }}","useSourceId":"{{ useSourceIdFromParentRecord }}"},"x-designer":"FormV2.ReadPrettyDesigner","x-component":"CardItem"}
xf7n1l4jksl	8ffkys3zttw	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-read-pretty":true,"x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
3dwbb3xc7q8	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"ReadPrettyFormActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":24}}}
epxu1zrlga3	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"ReadPrettyFormItemInitializers"}
dc3a24ug4ro	4147y9spgsf	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
bgkjcva42cs	pr0jt4whbp2	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Export") }}","x-action":"export","x-action-settings":{"exportSettings":[{"dataIndex":["id"]},{"dataIndex":["createdAt"]},{"dataIndex":["updatedAt"]},{"dataIndex":["Name"]},{"dataIndex":["Code"]}]},"x-designer":"ExportDesigner","x-decorator":"ACLActionProvider","x-component":"Action","x-component-props":{"icon":"clouddownloadoutlined","useProps":"{{ useExportAction }}"},"x-align":"right","x-acl-action-props":{"skipScopeCheck":true}}
g4rjmkihbsy	h39xiz9ylko	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
9dvx7nfzbpm	o33oc3dhcoa	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
42fx62lf4zb	4t1s9zuj192	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action-props":{"skipScopeCheck":true},"x-acl-action":"WTT_Asset:create","x-decorator":"FormBlockProvider","x-decorator-props":{"resource":"WTT_Asset","collection":"WTT_Asset"},"x-designer":"FormV2.Designer","x-component":"CardItem"}
vpq51hym4rk	3bm3b5tq7se	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
vjtnnuqg8ei	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"FormItemInitializers"}
tmqirlbk0fu	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"CreateFormActionInitializers","x-component":"ActionBar","x-component-props":{"layout":"one-column","style":{"marginTop":24}}}
l5wrqiy342c	0dvrg9mi01z	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
5lita8v0feg	yhcpkdp9kth	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
mpyqf9vtozc	Name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Name","x-component-props":{}}
t232pwljbe6	oiqobo7ra9a	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
9df1glidbni	1lrbdm8za4t	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
zw2429v3jsv	Code	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Code","x-component-props":{}}
wwztcvsjpr1	0njtj7ehmqg	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Submit") }}","x-action":"submit","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"type":"primary","htmlType":"submit","useProps":"{{ useCreateActionProps }}"},"x-action-settings":{},"type":"void"}
4qb8nr54kex	61ztdkmsmyp	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View") }}","x-action":"view","x-designer":"Action.Designer","x-component":"Action.Link","x-component-props":{"openMode":"drawer"},"x-decorator":"ACLActionProvider","x-designer-props":{"linkageAction":true}}
i9qj49fo70j	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
rh3ea27v4vx	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
z1gmpts94df	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
owu9hfdyp8n	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
wvdoqitff11	frhgbqums2r	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Edit") }}","x-action":"update","x-designer":"Action.Designer","x-component":"Action.Link","x-component-props":{"openMode":"drawer","icon":"EditOutlined"},"x-decorator":"ACLActionProvider","x-designer-props":{"linkageAction":true}}
hngqmqnskt7	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Edit record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
xv209rfbm74	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
ezwhs7icicp	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Edit")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
r4q447oud7k	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
4j76jf82r5a	kgo3hj9lnsy	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
azb0rag4ld3	tup9ylzj9gq	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
1ynmaa4okbi	vfk8zuj5l77	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action-props":{"skipScopeCheck":false},"x-acl-action":"WTT_Asset:update","x-decorator":"FormBlockProvider","x-decorator-props":{"useSourceId":"{{ useSourceIdFromParentRecord }}","useParams":"{{ useParamsFromRecord }}","action":"get","resource":"WTT_Asset","collection":"WTT_Asset"},"x-designer":"FormV2.Designer","x-component":"CardItem"}
pm01lbmd6qj	2pz6uqhmyt6	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
xjaoqfqvp89	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"FormItemInitializers"}
dzyugs0mknh	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"UpdateFormActionInitializers","x-component":"ActionBar","x-component-props":{"layout":"one-column","style":{"marginTop":24}}}
o5mdu88rbat	8jjhuub7ypv	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
db70kx0u9xg	uxs1972snri	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
3xghso5i7de	Name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Name","x-component-props":{}}
opghijwqudd	1mwh0gjy13d	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
i2q3e18hrq7	md9lyxbtbvq	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
9qjt9w43tfo	Code	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Code","x-component-props":{}}
ltgjpq6zk6e	wzko6asumni	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
z4jurrahhqw	id	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.id","x-component-props":{},"x-read-pretty":true}
3h47wtgjzlg	hxn8y7emchn	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
9tlwx5sdtsv	Name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Name","x-component-props":{}}
awxbyrawxmp	omq37mbzaqo	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
wflzjg2fsvz	Code	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Code","x-component-props":{}}
muy0v6uh3hn	1brt2aivsxu	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
d9xmgv8c1nm	createdAt	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.createdAt","x-component-props":{},"x-read-pretty":true}
7wcriuxmrla	u0eq7q1ht9o	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
ps934my2yup	createdBy	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.createdBy","x-component-props":{},"x-read-pretty":true}
v0r4hvxvb4v	viewer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"RecordPicker.Viewer","x-component-props":{"className":"nb-action-popup"}}
itlawwwc24z	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
b75wrghi14w	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
fbjhmky7951	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
zpfkanx7xeh	6d7gx0spikb	{"x-uid":"zpfkanx7xeh","name":"6d7gx0spikb","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-component-props":{"width":50}}
dfsaiiu616q	col_y0gvzszbars	{"x-uid":"dfsaiiu616q","name":"col_y0gvzszbars","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-index":1,"x-component-props":{"width":50}}
zn7elpmsysr	mcvdk3i0tz4	{"x-uid":"zn7elpmsysr","name":"mcvdk3i0tz4","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-component-props":{"width":50}}
tuq7k5ttf23	col_qyzqzrk37n5	{"x-uid":"tuq7k5ttf23","name":"col_qyzqzrk37n5","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-index":1,"x-component-props":{"width":50}}
ncpilr3vsko	f11aowyseuy	{"x-uid":"ncpilr3vsko","name":"f11aowyseuy","_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"Assets","x-component":"Menu.Item","x-decorator":"ACLMenuItemProvider","x-component-props":{"icon":"gitlaboutlined"},"x-server-hooks":[{"type":"onSelfCreate","method":"bindMenuToRole"}]}
esr4bnh1yq4	vn4454dphj0	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
wpw2zdgvred	d0zjrm1hwf6	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"Customers","x-component":"Menu.Item","x-decorator":"ACLMenuItemProvider","x-component-props":{"icon":"usergroupdeleteoutlined"},"x-server-hooks":[{"type":"onSelfCreate","method":"bindMenuToRole"}]}
3o0nafjc9zn	page	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Page"}
5i6s9h3z12w	tn0czp8d5z6	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"BlockInitializers"}
4ea0eg22s6f	71pwbfoaoop	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
9gg7w4ctvy1	1sqgbh47fiq	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
s7ppiu6idan	tc2kh3nw53d	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableBlockProvider","x-acl-action":"WTT_Customer:list","x-decorator-props":{"collection":"WTT_Customer","resource":"WTT_Customer","action":"list","params":{"pageSize":20},"rowKey":"id","showIndex":true,"dragSort":false,"disableTemplate":false},"x-designer":"TableBlockDesigner","x-component":"CardItem","x-filter-targets":[]}
a540x2nf55u	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"TableActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":"var(--nb-spacing)"}}}
r34c545vn0o	fo32b7k205b	{"_isJSONSchemaObject":true,"version":"2.0","type":"array","x-initializer":"TableColumnInitializers","x-component":"TableV2","x-component-props":{"rowKey":"id","rowSelection":{"type":"checkbox"},"useProps":"{{ useTableBlockProps }}"}}
v160lx9x03s	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Actions") }}","x-action-column":"actions","x-decorator":"TableV2.Column.ActionBar","x-component":"TableV2.Column","x-designer":"TableV2.ActionColumnDesigner","x-initializer":"TableActionColumnInitializers"}
5wtyj13hh7k	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"DndContext","x-component":"Space","x-component-props":{"split":"|"}}
b28wgjmjdko	name	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Customer.name","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true}}
iym4gn7wdt2	a994o00v4ua	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
o7mmcfangbx	Description	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Customer.Description","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true}}
ooax88j3yzb	c1somw0g1y3	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
uyzkt653clg	IsActive	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Customer.IsActive","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true}}
gh97bqcvw4r	2j0nfwasece	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
6l2w82vknwa	createdAt	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Customer.createdAt","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{}}
28fjk12kdqn	cjnoe8ayyxo	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View") }}","x-action":"view","x-designer":"Action.Designer","x-component":"Action.Link","x-component-props":{"openMode":"drawer"},"x-decorator":"ACLActionProvider","x-designer-props":{"linkageAction":true}}
kuxb9m62gau	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
xnnjkcrpivt	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
pujioj8krv0	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
74wiu3prkat	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
setmbtb7hr8	1dg6i93c9ve	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Edit") }}","x-action":"update","x-designer":"Action.Designer","x-component":"Action.Link","x-component-props":{"openMode":"drawer","icon":"EditOutlined"},"x-decorator":"ACLActionProvider","x-designer-props":{"linkageAction":true}}
are93oh007m	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Edit record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
s2j1mca129k	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
jw2um47b1kq	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Edit")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
9wsmhrm9np0	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
xt1t69pgjvf	hayo3dunbwm	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-action":"create","title":"{{t('Add new')}}","x-designer":"Action.Designer","x-component":"Action","x-decorator":"ACLActionProvider","x-component-props":{"openMode":"drawer","type":"primary","component":"CreateRecordAction"},"x-align":"right","x-acl-action-props":{"skipScopeCheck":true}}
wzegw15krxc	drawer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Add record") }}","x-component":"Action.Container","x-component-props":{"className":"nb-action-popup"}}
nnw8hb8g14c	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializersForCreateFormBlock"}
ldb7xlegtqv	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Add new")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
026mxjz1xlz	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"CreateFormBlockInitializers"}
stylirnf7y5	m3oi8mpdg0w	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Refresh") }}","x-action":"refresh","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"icon":"ReloadOutlined","useProps":"{{ useRefreshActionProps }}"},"x-align":"right","type":"void"}
itfb8yuoxjy	v9ma5fy2f82	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Export") }}","x-action":"export","x-action-settings":{"exportSettings":[{"dataIndex":["id"]},{"dataIndex":["createdAt"]},{"dataIndex":["updatedAt"]},{"dataIndex":["name"]},{"dataIndex":["Description"]},{"dataIndex":["IsActive"]}]},"x-designer":"ExportDesigner","x-decorator":"ACLActionProvider","x-component":"Action","x-component-props":{"icon":"clouddownloadoutlined","useProps":"{{ useExportAction }}"},"x-align":"right","x-acl-action-props":{"skipScopeCheck":true}}
3aszhl5bhwj	zyvvaadltff	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Filter") }}","x-action":"filter","x-designer":"Filter.Action.Designer","x-component":"Filter.Action","x-component-props":{"icon":"FilterOutlined","useProps":"{{ useFilterActionProps }}"},"x-align":"left"}
bx5jcj5t34u	6fyvykukdfd	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
owhsxq5010d	wbj0n5teh0k	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
hxbstnj3c38	o8t1uwxwp3e	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action-props":{"skipScopeCheck":true},"x-acl-action":"WTT_Customer:create","x-decorator":"FormBlockProvider","x-decorator-props":{"resource":"WTT_Customer","collection":"WTT_Customer"},"x-designer":"FormV2.Designer","x-component":"CardItem"}
7p14adw4n9n	91shjqcabmi	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
d0t11ss0foi	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"FormItemInitializers"}
l0eupz9wlk3	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"CreateFormActionInitializers","x-component":"ActionBar","x-component-props":{"layout":"one-column","style":{"marginTop":24}}}
ryvctxlr3ev	7hgk626rq7t	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
h26r06rfuxj	gm5o59kzvv1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
8i1mc2nfur8	name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.name","x-component-props":{}}
htkypy9jlt5	yiemuew2rbd	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
lyq8fn8u51y	vvso1vn7hfd	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
gtp7svlp0mv	Description	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.Description","x-component-props":{}}
6mbbgvh4rtz	enq0tqnwu8f	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Submit") }}","x-action":"submit","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"type":"primary","htmlType":"submit","useProps":"{{ useCreateActionProps }}"},"x-action-settings":{},"type":"void"}
qi3rrli2wdj	0v8tednbvxq	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
mxsi688ucom	b7l1zhvpand	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
863sbhkbfon	7ocif6tzcn0	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action":"WTT_Customer:get","x-decorator":"FormBlockProvider","x-decorator-props":{"resource":"WTT_Customer","collection":"WTT_Customer","readPretty":true,"action":"get","useParams":"{{ useParamsFromRecord }}","useSourceId":"{{ useSourceIdFromParentRecord }}"},"x-designer":"FormV2.ReadPrettyDesigner","x-component":"CardItem"}
mg6e604h4ue	a302918jzit	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-read-pretty":true,"x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
7q0gtw5htyw	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"ReadPrettyFormActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":24}}}
ie3s6t8ry35	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"ReadPrettyFormItemInitializers"}
8rrvude4dga	9vzyxk7pv6g	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
c6uhdtd1451	0sqxu129opw	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
vqa6y5o31rh	id	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.id","x-component-props":{},"x-read-pretty":true}
dijzb61rbsv	6fd8fpzi28z	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
7lb2pemgi8c	createdAt	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.createdAt","x-component-props":{},"x-read-pretty":true}
ba5cmxt9wae	createdBy	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.createdBy","x-component-props":{},"x-read-pretty":true}
20am0xmikgi	viewer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"RecordPicker.Viewer","x-component-props":{"className":"nb-action-popup"}}
1yerxui1rh5	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
9t5vw9np9jc	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
p50niwjxz32	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
gnpa1gngede	7dt9fd203sp	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
zvb21cyat9z	4kv8xj33cy1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
xxa8dxeqzv7	name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.name","x-component-props":{}}
sbs86uyv02m	5ig9t4pvfqe	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
pojuh68mbys	gtxwipygcm5	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
zt6v1st24cb	Description	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.Description","x-component-props":{}}
dszszrlyq29	9s90b5j94sv	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
trzfhhwusfa	zhi6225637r	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
vshk9mbxzy8	IsActive	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.IsActive","x-component-props":{}}
rk5bvbdmdgv	row_uisrvihb4aa	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row","x-index":1}
7p77wn6tzqg	85x1x3d72o0	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
od7ng3zbx7o	row_httwz7gghp3	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row","x-index":2}
e4j8oj73f2w	90ss66bblzn	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
qxy2edqzpbm	row_g7f5pr6pe4w	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row","x-index":3}
sl74z8l1a76	58liden8cns	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
wvi0zwg5loa	rhqige44d3b	{"x-uid":"wvi0zwg5loa","name":"rhqige44d3b","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-component-props":{"width":50}}
mqj4po1e7bk	col_9y6v240k8pq	{"x-uid":"mqj4po1e7bk","name":"col_9y6v240k8pq","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-index":1,"x-component-props":{"width":50}}
9a5cnn8va7i	z8t64qp2wng	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
1dsb6ktfpw0	a8rq1e4xzlr	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
9yf4qjq6xtn	cczxe63cpt9	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action-props":{"skipScopeCheck":false},"x-acl-action":"WTT_Customer:update","x-decorator":"FormBlockProvider","x-decorator-props":{"useSourceId":"{{ useSourceIdFromParentRecord }}","useParams":"{{ useParamsFromRecord }}","action":"get","resource":"WTT_Customer","collection":"WTT_Customer"},"x-designer":"FormV2.Designer","x-component":"CardItem"}
5rlnnzhzvlu	3bkyuzjebrz	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
p86ow4sckcj	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"FormItemInitializers"}
yfhnohad6lf	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"UpdateFormActionInitializers","x-component":"ActionBar","x-component-props":{"layout":"one-column","style":{"marginTop":24}}}
47saxh0jk89	jzh9jm68sur	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
nz5ub7gvta2	q2w0l6nceqc	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
le399fvh3f7	name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.name","x-component-props":{}}
nhtmsili9i3	rh9ug1hp4qh	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
dgkluqyw1bm	capzn9eht9t	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
7ve724fwlc3	Description	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.Description","x-component-props":{}}
5kdewgfri3r	se48q497t4a	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
uq9pwmj23ll	3szpsqlz53m	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
qktzdcfxe49	IsActive	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.IsActive","x-component-props":{}}
rqurmehuffv	5ibwn5qat4a	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Submit") }}","x-action":"submit","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"type":"primary","htmlType":"submit","useProps":"{{ useUpdateActionProps }}"},"x-action-settings":{},"type":"void"}
tyq1a9qwq1x	dfd6onvcpz8	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
vcxopxcextx	8bmgqrx4bv4	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
o8aeix1gpua	0m7519x1p5i	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
eao99d5nu76	sa2ol5qkvvr	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
42ylqxd43f6	WTT_Asset_ID	{"x-uid":"42ylqxd43f6","name":"WTT_Asset_ID","_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.WTT_Asset_ID","x-component-props":{"fieldNames":{"label":"Code","value":"id"}}}
dqmaiq8dtfr	wv89z2oyeoz	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
scx04nesokm	3633oplcni7	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
4povngczp9v	WTT_Asset_ID	{"x-uid":"4povngczp9v","name":"WTT_Asset_ID","_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.WTT_Asset_ID","x-component-props":{"fieldNames":{"label":"Code","value":"id"}}}
xrtpdglsdom	row_y8i6m6tok70	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row","x-index":2}
iqcf5jgj5u6	qj44rbno6ke	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
2zzl0fhh8ai	WTT_Asset_ID	{"x-uid":"2zzl0fhh8ai","name":"WTT_Asset_ID","_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_Customer.WTT_Asset_ID","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{"ellipsis":true,"size":"small","fieldNames":{"label":"Code","value":"id"}}}
64zkp91nr6d	vq9ezya3oex	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
cuz2wh0zmcz	pednqhhmmz3	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
alhdggfwn2b	WTT_Asset_ID	{"x-uid":"alhdggfwn2b","name":"WTT_Asset_ID","_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Customer.WTT_Asset_ID","x-component-props":{"fieldNames":{"label":"Code","value":"id"}}}
4zcpgpedxcf	lf0tveio89u	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"AssociationField.Viewer","x-component-props":{"className":"nb-action-popup"},"x-index":0}
yopjwa6ar9p	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
mohx8b2r1wc	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
tjb47m7iend	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
tfvwjma6h1h	na7hr2j4k1a	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
kyjc1neko0n	v21xay71lrv	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-acl-action":"WTT_Customer.WTT_Asset_ID:get","x-decorator":"FormBlockProvider","x-decorator-props":{"resource":"WTT_Customer.WTT_Asset_ID","collection":"WTT_Asset","association":"WTT_Customer.WTT_Asset_ID","readPretty":true,"action":"get","useParams":"{{ useParamsFromRecord }}","useSourceId":"{{ useSourceIdFromParentRecord }}"},"x-designer":"FormV2.ReadPrettyDesigner","x-component":"CardItem"}
g0ijjznmv2z	416wqys2c0d	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"FormV2","x-read-pretty":true,"x-component-props":{"useProps":"{{ useFormBlockProps }}"}}
7v9fsmf19yo	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"ReadPrettyFormActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":24}}}
lzlnihuzy9k	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"ReadPrettyFormItemInitializers"}
3rlf14565qx	0tv0bng6k4z	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
l3sgh9mhjf1	khxd1pwxfkv	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
v4ra6p9ksat	id	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.id","x-component-props":{},"x-read-pretty":true}
lhj3gzgx3e7	3yjakukx5vj	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
o0qit001igh	Name	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Name","x-component-props":{}}
rvvc2y1qa7f	Code	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.Code","x-component-props":{}}
vombuyq1x8n	m09pw9y2ud0	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
nvdtz9owsku	createdAt	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.createdAt","x-component-props":{},"x-read-pretty":true}
fkywrij28u6	qensx6dp9mg	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
bp6j0exsgsz	createdBy	{"_isJSONSchemaObject":true,"version":"2.0","type":"string","x-designer":"FormItem.Designer","x-component":"CollectionField","x-decorator":"FormItem","x-collection-field":"WTT_Asset.createdBy","x-component-props":{},"x-read-pretty":true}
p7hqvt7241v	viewer	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("View record") }}","x-component":"RecordPicker.Viewer","x-component-props":{"className":"nb-action-popup"}}
t11rqpzyyzj	tabs	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Tabs","x-component-props":{},"x-initializer":"TabPaneInitializers"}
41gklgkpbp3	tab1	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{t("Details")}}","x-component":"Tabs.TabPane","x-designer":"Tabs.Designer","x-component-props":{}}
kward4tb5dp	grid	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"RecordBlockInitializers"}
pa81dc5mz2s	g4nfjnwb1t5	{"x-uid":"pa81dc5mz2s","name":"g4nfjnwb1t5","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-component-props":{"width":50}}
jtr6vzxdbwk	col_hqmqsw23x4b	{"x-uid":"jtr6vzxdbwk","name":"col_hqmqsw23x4b","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-index":1,"x-component-props":{"width":50}}
ynor7lp0rqw	xo7c9bpb98g	{"x-uid":"ynor7lp0rqw","name":"xo7c9bpb98g","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-component-props":{"width":50}}
8jpypq68dn5	col_xyhkrbpvtni	{"x-uid":"8jpypq68dn5","name":"col_xyhkrbpvtni","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col","x-index":1,"x-component-props":{"width":50}}
bdo3e9silbn	gwop7t1vcsm	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"Customer Asset Readings","x-component":"Menu.Item","x-decorator":"ACLMenuItemProvider","x-component-props":{"icon":"tableoutlined"},"x-server-hooks":[{"type":"onSelfCreate","method":"bindMenuToRole"}]}
s2f6dhfqp5d	page	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Page"}
l9p9ulc5ojf	qdv08mxlsp6	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid","x-initializer":"BlockInitializers"}
lywb8khu67q	t73mnzfwrc9	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Row"}
q17mcp7s7kv	3vuashzfz2l	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-component":"Grid.Col"}
xaqtxcn6wk1	eanbuannc95	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableBlockProvider","x-acl-action":"WTT_CustomerAssetsReading:list","x-decorator-props":{"collection":"WTT_CustomerAssetsReading","resource":"WTT_CustomerAssetsReading","action":"list","params":{"pageSize":20},"rowKey":"id","showIndex":true,"dragSort":false,"disableTemplate":false},"x-designer":"TableBlockDesigner","x-component":"CardItem","x-filter-targets":[]}
s858ethc2gi	actions	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-initializer":"TableActionInitializers","x-component":"ActionBar","x-component-props":{"style":{"marginBottom":"var(--nb-spacing)"}}}
he8e1fqolx7	x6e0htl37uo	{"_isJSONSchemaObject":true,"version":"2.0","type":"array","x-initializer":"TableColumnInitializers","x-component":"TableV2","x-component-props":{"rowKey":"id","rowSelection":{"type":"checkbox"},"useProps":"{{ useTableBlockProps }}"}}
62dv0mb7ltw	7tu528izt8q	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
gdl7xj6l7qi	ReadingDateTime	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_CustomerAssetsReading.ReadingDateTime","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{}}
p9pxqbpwxlo	AssetId	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_CustomerAssetsReading.AssetId","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{}}
rfvfyswbpdl	lggw86ogaab	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column"}
zxaigthddoe	Value	{"_isJSONSchemaObject":true,"version":"2.0","x-collection-field":"WTT_CustomerAssetsReading.Value","x-component":"CollectionField","x-read-pretty":true,"x-component-props":{}}
wk5o4jx0jm1	rzqds01rn13	{"_isJSONSchemaObject":true,"version":"2.0","title":"{{ t("Refresh") }}","x-action":"refresh","x-component":"Action","x-designer":"Action.Designer","x-component-props":{"icon":"ReloadOutlined","useProps":"{{ useRefreshActionProps }}"},"x-align":"right","type":"void"}
5he1bj710pw	6epjzhpm7w8	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Export") }}","x-action":"export","x-action-settings":{"exportSettings":[{"dataIndex":["id"]},{"dataIndex":["ReadingDateTime"]},{"dataIndex":["AssetId"]},{"dataIndex":["Value"]}]},"x-designer":"ExportDesigner","x-decorator":"ACLActionProvider","x-component":"Action","x-component-props":{"icon":"clouddownloadoutlined","useProps":"{{ useExportAction }}"},"x-align":"right","x-acl-action-props":{"skipScopeCheck":true}}
q2viz2upay6	ol5u43rqau5	{"_isJSONSchemaObject":true,"version":"2.0","type":"void","title":"{{ t("Filter") }}","x-action":"filter","x-designer":"Filter.Action.Designer","x-component":"Filter.Action","x-component-props":{"icon":"FilterOutlined","useProps":"{{ useFilterActionProps }}"},"x-align":"left"}
spf0vrfmlni	l96x0ja56xr	{"x-uid":"spf0vrfmlni","name":"l96x0ja56xr","_isJSONSchemaObject":true,"version":"2.0","type":"void","x-decorator":"TableV2.Column.Decorator","x-designer":"TableV2.Column.Designer","x-component":"TableV2.Column","title":"Asset Id"}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("createdAt", "updatedAt", id, nickname, email, phone, password, "appLang", "resetToken", "systemSettings", sort, "createdById", "updatedById") FROM stdin;
2023-05-31 09:37:00.697+05:30	2023-05-31 09:37:00.697+05:30	1	Super Admin	ranjit.n.battewad@walkingtree.tech	\N	8fd9bf0479b4e0cf35003fbdc18dedf4ed16dd6494fed12816da77f88ee698b3	\N	\N	{}	1	\N	\N
\.


--
-- Data for Name: users_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_jobs ("createdAt", "updatedAt", id, "userId", status, result, "executionId", "nodeId", "jobId", "workflowId") FROM stdin;
\.


--
-- Data for Name: verifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verifications ("createdAt", "updatedAt", id, type, receiver, status, "expiresAt", content, "providerId") FROM stdin;
\.


--
-- Data for Name: verifications_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.verifications_providers ("createdAt", "updatedAt", id, title, type, options, "default") FROM stdin;
\.


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workflows (id, "createdAt", "updatedAt", key, title, enabled, description, type, config, "useTransaction", executed, "allExecuted", current) FROM stdin;
1	2023-05-31 22:37:58.977+05:30	2023-05-31 23:41:00.932+05:30	hp98rvp6bdz	Test	f	\N	collection	{"appends":[],"collection":"WTT_Customer","changed":[],"condition":{"$or":[{"name":{"$includes":"Ranjit"}}]},"mode":1}	\N	1	3	\N
3	2023-05-31 23:20:29.583+05:30	2023-05-31 23:55:17.317+05:30	hp98rvp6bdz	Test	f	\N	collection	{"appends":[],"collection":"WTT_Customer","changed":[],"condition":{"$or":[{"name":{"$includes":"Ranjit"}}]},"mode":1}	\N	2	3	t
2	2023-05-31 22:51:09.416+05:30	2023-05-31 23:55:25.443+05:30	7g8khyva5c8	test2	f	\N	collection	{"appends":[],"collection":"WTT_Customer","changed":[],"condition":{"$or":[{"name":{"$notEmpty":true}}]},"mode":1}	\N	1	1	t
4	2023-05-31 23:55:06.959+05:30	2023-05-31 23:57:30.82+05:30	8taa02cgits	Test copy	t	\N	collection	{"appends":[],"collection":"WTT_Customer","condition":{"$or":[{"name":{"$notEmpty":true}}]},"mode":1}	\N	1	1	t
\.


--
-- Name: WTT_Asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WTT_Asset_id_seq"', 2, true);


--
-- Name: WTT_CustomerAssetsReading_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WTT_CustomerAssetsReading_id_seq"', 286, true);


--
-- Name: WTT_Customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WTT_Customer_id_seq"', 7, true);


--
-- Name: applicationPlugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."applicationPlugins_id_seq"', 28, true);


--
-- Name: applicationVersion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."applicationVersion_id_seq"', 1, true);


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 2, true);


--
-- Name: auditChanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."auditChanges_id_seq"', 53, true);


--
-- Name: auditLogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."auditLogs_id_seq"', 18, true);


--
-- Name: chartsQueries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."chartsQueries_id_seq"', 1, false);


--
-- Name: collectionCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."collectionCategories_id_seq"', 1, false);


--
-- Name: executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.executions_id_seq', 5, true);


--
-- Name: flow_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flow_nodes_id_seq', 10, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 5, true);


--
-- Name: rolesResourcesActions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."rolesResourcesActions_id_seq"', 1, false);


--
-- Name: rolesResourcesScopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."rolesResourcesScopes_id_seq"', 2, true);


--
-- Name: rolesResources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."rolesResources_id_seq"', 1, false);


--
-- Name: sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sequences_id_seq', 1, false);


--
-- Name: storages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.storages_id_seq', 1, true);


--
-- Name: systemSettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."systemSettings_id_seq"', 1, true);


--
-- Name: uiSchemaServerHooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."uiSchemaServerHooks_id_seq"', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: users_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_jobs_id_seq', 1, false);


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workflows_id_seq', 4, true);


--
-- Name: WTT_Asset WTT_Asset_Code_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Asset"
    ADD CONSTRAINT "WTT_Asset_Code_uk" UNIQUE ("Code");


--
-- Name: WTT_Asset WTT_Asset_Name_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Asset"
    ADD CONSTRAINT "WTT_Asset_Name_uk" UNIQUE ("Name");


--
-- Name: WTT_Asset WTT_Asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Asset"
    ADD CONSTRAINT "WTT_Asset_pkey" PRIMARY KEY (id);


--
-- Name: WTT_CustomerAssetsReading WTT_CustomerAssetsReading_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_CustomerAssetsReading"
    ADD CONSTRAINT "WTT_CustomerAssetsReading_pkey" PRIMARY KEY (id);


--
-- Name: WTT_Customer WTT_Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WTT_Customer"
    ADD CONSTRAINT "WTT_Customer_pkey" PRIMARY KEY (id);


--
-- Name: applicationPlugins applicationPlugins_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."applicationPlugins"
    ADD CONSTRAINT "applicationPlugins_name_key" UNIQUE (name);


--
-- Name: applicationPlugins applicationPlugins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."applicationPlugins"
    ADD CONSTRAINT "applicationPlugins_pkey" PRIMARY KEY (id);


--
-- Name: applicationVersion applicationVersion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."applicationVersion"
    ADD CONSTRAINT "applicationVersion_pkey" PRIMARY KEY (id);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auditChanges auditChanges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."auditChanges"
    ADD CONSTRAINT "auditChanges_pkey" PRIMARY KEY (id);


--
-- Name: auditLogs auditLogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."auditLogs"
    ADD CONSTRAINT "auditLogs_pkey" PRIMARY KEY (id);


--
-- Name: chartsQueries chartsQueries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chartsQueries"
    ADD CONSTRAINT "chartsQueries_pkey" PRIMARY KEY (id);


--
-- Name: chinaRegions chinaRegions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chinaRegions"
    ADD CONSTRAINT "chinaRegions_pkey" PRIMARY KEY (code);


--
-- Name: collectionCategories collectionCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collectionCategories"
    ADD CONSTRAINT "collectionCategories_pkey" PRIMARY KEY (id);


--
-- Name: collectionCategory collectionCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collectionCategory"
    ADD CONSTRAINT "collectionCategory_pkey" PRIMARY KEY ("collectionName", "categoryId");


--
-- Name: collections collections_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_name_key UNIQUE (name);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (key);


--
-- Name: executions executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.executions
    ADD CONSTRAINT executions_pkey PRIMARY KEY (id);


--
-- Name: fields fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (key);


--
-- Name: flow_nodes flow_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flow_nodes
    ADD CONSTRAINT flow_nodes_pkey PRIMARY KEY (id);


--
-- Name: iframeHtml iframeHtml_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."iframeHtml"
    ADD CONSTRAINT "iframeHtml_pkey" PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: rolesResourcesActions rolesResourcesActions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResourcesActions"
    ADD CONSTRAINT "rolesResourcesActions_pkey" PRIMARY KEY (id);


--
-- Name: rolesResourcesScopes rolesResourcesScopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResourcesScopes"
    ADD CONSTRAINT "rolesResourcesScopes_pkey" PRIMARY KEY (id);


--
-- Name: rolesResources rolesResources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesResources"
    ADD CONSTRAINT "rolesResources_pkey" PRIMARY KEY (id);


--
-- Name: rolesUischemas rolesUischemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesUischemas"
    ADD CONSTRAINT "rolesUischemas_pkey" PRIMARY KEY ("roleName", "uiSchemaXUid");


--
-- Name: rolesUsers rolesUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."rolesUsers"
    ADD CONSTRAINT "rolesUsers_pkey" PRIMARY KEY ("userId", "roleName");


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (name);


--
-- Name: roles roles_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_title_key UNIQUE (title);


--
-- Name: sequences sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (id);


--
-- Name: storages storages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_name_key UNIQUE (name);


--
-- Name: storages storages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storages
    ADD CONSTRAINT storages_pkey PRIMARY KEY (id);


--
-- Name: systemSettings systemSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."systemSettings"
    ADD CONSTRAINT "systemSettings_pkey" PRIMARY KEY (id);


--
-- Name: uiRoutes uiRoutes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiRoutes"
    ADD CONSTRAINT "uiRoutes_pkey" PRIMARY KEY (key);


--
-- Name: uiSchemaServerHooks uiSchemaServerHooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiSchemaServerHooks"
    ADD CONSTRAINT "uiSchemaServerHooks_pkey" PRIMARY KEY (id);


--
-- Name: uiSchemaTemplates uiSchemaTemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiSchemaTemplates"
    ADD CONSTRAINT "uiSchemaTemplates_pkey" PRIMARY KEY (key);


--
-- Name: uiSchemaTreePath uiSchemaTreePath_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiSchemaTreePath"
    ADD CONSTRAINT "uiSchemaTreePath_pkey" PRIMARY KEY (ancestor, descendant);


--
-- Name: uiSchemas uiSchemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."uiSchemas"
    ADD CONSTRAINT "uiSchemas_pkey" PRIMARY KEY ("x-uid");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_jobs users_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_jobs
    ADD CONSTRAINT users_jobs_pkey PRIMARY KEY (id);


--
-- Name: users_jobs users_jobs_userId_jobId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_jobs
    ADD CONSTRAINT "users_jobs_userId_jobId_key" UNIQUE ("userId", "jobId");


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_resetToken_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_resetToken_key" UNIQUE ("resetToken");


--
-- Name: verifications verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


--
-- Name: verifications_providers verifications_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications_providers
    ADD CONSTRAINT verifications_providers_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: attachments_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_created_by_id ON public.attachments USING btree ("createdById");


--
-- Name: attachments_storage_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_storage_id ON public.attachments USING btree ("storageId");


--
-- Name: attachments_updated_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX attachments_updated_by_id ON public.attachments USING btree ("updatedById");


--
-- Name: audit_changes_audit_log_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_changes_audit_log_id ON public."auditChanges" USING btree ("auditLogId");


--
-- Name: audit_logs_collection_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_logs_collection_name ON public."auditLogs" USING btree ("collectionName");


--
-- Name: audit_logs_record_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_logs_record_id ON public."auditLogs" USING btree ("recordId");


--
-- Name: audit_logs_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_logs_user_id ON public."auditLogs" USING btree ("userId");


--
-- Name: china_regions_parent_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX china_regions_parent_code ON public."chinaRegions" USING btree ("parentCode");


--
-- Name: collection_category_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX collection_category_category_id ON public."collectionCategory" USING btree ("categoryId");


--
-- Name: executions_workflow_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX executions_workflow_id ON public.executions USING btree ("workflowId");


--
-- Name: fields_collection_name_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fields_collection_name_name ON public.fields USING btree ("collectionName", name);


--
-- Name: fields_parent_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fields_parent_key ON public.fields USING btree ("parentKey");


--
-- Name: fields_reverse_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fields_reverse_key ON public.fields USING btree ("reverseKey");


--
-- Name: flow_nodes_downstream_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flow_nodes_downstream_id ON public.flow_nodes USING btree ("downstreamId");


--
-- Name: flow_nodes_upstream_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flow_nodes_upstream_id ON public.flow_nodes USING btree ("upstreamId");


--
-- Name: flow_nodes_workflow_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flow_nodes_workflow_id ON public.flow_nodes USING btree ("workflowId");


--
-- Name: iframe_html_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iframe_html_created_by_id ON public."iframeHtml" USING btree ("createdById");


--
-- Name: iframe_html_updated_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX iframe_html_updated_by_id ON public."iframeHtml" USING btree ("updatedById");


--
-- Name: jobs_execution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_execution_id ON public.jobs USING btree ("executionId");


--
-- Name: jobs_node_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_node_id ON public.jobs USING btree ("nodeId");


--
-- Name: jobs_upstream_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_upstream_id ON public.jobs USING btree ("upstreamId");


--
-- Name: roles_resources_actions_roles_resource_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_resources_actions_roles_resource_id ON public."rolesResourcesActions" USING btree ("rolesResourceId");


--
-- Name: roles_resources_actions_scope_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_resources_actions_scope_id ON public."rolesResourcesActions" USING btree ("scopeId");


--
-- Name: roles_resources_role_name_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_resources_role_name_name ON public."rolesResources" USING btree ("roleName", name);


--
-- Name: roles_uischemas_ui_schema_x_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_uischemas_ui_schema_x_uid ON public."rolesUischemas" USING btree ("uiSchemaXUid");


--
-- Name: roles_users_role_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX roles_users_role_name ON public."rolesUsers" USING btree ("roleName");


--
-- Name: system_settings_logo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX system_settings_logo_id ON public."systemSettings" USING btree ("logoId");


--
-- Name: ui_routes_parent_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_routes_parent_key ON public."uiRoutes" USING btree ("parentKey");


--
-- Name: ui_routes_ui_schema_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_routes_ui_schema_uid ON public."uiRoutes" USING btree ("uiSchemaUid");


--
-- Name: ui_schema_server_hooks_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_schema_server_hooks_uid ON public."uiSchemaServerHooks" USING btree (uid);


--
-- Name: ui_schema_templates_collection_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_schema_templates_collection_name ON public."uiSchemaTemplates" USING btree ("collectionName");


--
-- Name: ui_schema_templates_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_schema_templates_uid ON public."uiSchemaTemplates" USING btree (uid);


--
-- Name: ui_schema_tree_path_descendant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ui_schema_tree_path_descendant ON public."uiSchemaTreePath" USING btree (descendant);


--
-- Name: users_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_created_by_id ON public.users USING btree ("createdById");


--
-- Name: users_jobs_execution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_jobs_execution_id ON public.users_jobs USING btree ("executionId");


--
-- Name: users_jobs_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_jobs_job_id ON public.users_jobs USING btree ("jobId");


--
-- Name: users_jobs_node_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_jobs_node_id ON public.users_jobs USING btree ("nodeId");


--
-- Name: users_jobs_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_jobs_user_id ON public.users_jobs USING btree ("userId");


--
-- Name: users_jobs_workflow_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_jobs_workflow_id ON public.users_jobs USING btree ("workflowId");


--
-- Name: users_updated_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_updated_by_id ON public.users USING btree ("updatedById");


--
-- Name: verifications_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX verifications_provider_id ON public.verifications USING btree ("providerId");


--
-- Name: w_t_t__asset_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX w_t_t__asset_created_by_id ON public."WTT_Asset" USING btree ("createdById");


--
-- Name: w_t_t__asset_updated_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX w_t_t__asset_updated_by_id ON public."WTT_Asset" USING btree ("updatedById");


--
-- Name: w_t_t__customer_asset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX w_t_t__customer_asset_id ON public."WTT_Customer" USING btree ("assetId");


--
-- Name: w_t_t__customer_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX w_t_t__customer_created_by_id ON public."WTT_Customer" USING btree ("createdById");


--
-- Name: w_t_t__customer_updated_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX w_t_t__customer_updated_by_id ON public."WTT_Customer" USING btree ("updatedById");


--
-- Name: workflows_key_current; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX workflows_key_current ON public.workflows USING btree (key, current);


--
-- PostgreSQL database dump complete
--

