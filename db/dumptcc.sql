--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.23
-- Dumped by pg_dump version 9.5.5

-- Started on 2020-10-28 20:05:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE tcc;
--
-- TOC entry 2396 (class 1262 OID 18249)
-- Name: tcc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tcc WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE tcc OWNER TO postgres;

\connect tcc

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 230 (class 1259 OID 21442)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categoria (
    id integer NOT NULL,
    descricao character varying(150)
);


ALTER TABLE categoria OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 21440)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 229
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- TOC entry 233 (class 1259 OID 21452)
-- Name: cidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cidade (
    id integer NOT NULL,
    nome character varying(150),
    id_estado integer NOT NULL
);


ALTER TABLE cidade OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 21450)
-- Name: cidade_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_estado_seq OWNER TO postgres;

--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 232
-- Name: cidade_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_estado_seq OWNED BY cidade.id_estado;


--
-- TOC entry 231 (class 1259 OID 21448)
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cidade_id_seq OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 231
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;


--
-- TOC entry 184 (class 1259 OID 21257)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    id integer NOT NULL,
    nome character varying(150),
    sobrenome character varying(150),
    email character varying(150),
    descricao character varying(150),
    logradouro character varying(150),
    cep character varying(15),
    complemento character varying(50),
    idcidade integer NOT NULL,
    documento character varying(21),
    idusuario integer NOT NULL
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 21251)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_id_seq OWNER TO postgres;

--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- TOC entry 182 (class 1259 OID 21253)
-- Name: cliente_idcidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_idcidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_idcidade_seq OWNER TO postgres;

--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 182
-- Name: cliente_idcidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_idcidade_seq OWNED BY cliente.idcidade;


--
-- TOC entry 183 (class 1259 OID 21255)
-- Name: cliente_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_idusuario_seq OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_idusuario_seq OWNED BY cliente.idusuario;


--
-- TOC entry 228 (class 1259 OID 21432)
-- Name: clientefidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientefidelidade (
    id integer NOT NULL,
    idcliente integer NOT NULL,
    idfidelidade integer NOT NULL
);


ALTER TABLE clientefidelidade OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 21426)
-- Name: clientefidelidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientefidelidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientefidelidade_id_seq OWNER TO postgres;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientefidelidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientefidelidade_id_seq OWNED BY clientefidelidade.id;


--
-- TOC entry 226 (class 1259 OID 21428)
-- Name: clientefidelidade_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientefidelidade_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientefidelidade_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 226
-- Name: clientefidelidade_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientefidelidade_idcliente_seq OWNED BY clientefidelidade.idcliente;


--
-- TOC entry 227 (class 1259 OID 21430)
-- Name: clientefidelidade_idfidelidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientefidelidade_idfidelidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientefidelidade_idfidelidade_seq OWNER TO postgres;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 227
-- Name: clientefidelidade_idfidelidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientefidelidade_idfidelidade_seq OWNED BY clientefidelidade.idfidelidade;


--
-- TOC entry 186 (class 1259 OID 21272)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresa (
    id integer NOT NULL,
    nome character varying(150),
    cnpj character varying(21),
    endereco character varying(150),
    nomefantasia character varying(150),
    email character varying(50),
    contato character varying(50),
    ramo character varying(50)
);


ALTER TABLE empresa OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 21270)
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_id_seq OWNER TO postgres;

--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 185
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_id_seq OWNED BY empresa.id;


--
-- TOC entry 208 (class 1259 OID 21355)
-- Name: empresacliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresacliente (
    idempresa integer NOT NULL,
    id integer NOT NULL,
    idcliente integer NOT NULL
);


ALTER TABLE empresacliente OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 21351)
-- Name: empresacliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresacliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresacliente_id_seq OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 206
-- Name: empresacliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresacliente_id_seq OWNED BY empresacliente.id;


--
-- TOC entry 207 (class 1259 OID 21353)
-- Name: empresacliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresacliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresacliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 207
-- Name: empresacliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresacliente_idcliente_seq OWNED BY empresacliente.idcliente;


--
-- TOC entry 205 (class 1259 OID 21349)
-- Name: empresacliente_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresacliente_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresacliente_idempresa_seq OWNER TO postgres;

--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 205
-- Name: empresacliente_idempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresacliente_idempresa_seq OWNED BY empresacliente.idempresa;


--
-- TOC entry 204 (class 1259 OID 21341)
-- Name: empresafidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresafidelidade (
    id integer NOT NULL,
    idempresa integer NOT NULL,
    idfidelidade integer NOT NULL
);


ALTER TABLE empresafidelidade OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 21335)
-- Name: empresafidelidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresafidelidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresafidelidade_id_seq OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 201
-- Name: empresafidelidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresafidelidade_id_seq OWNED BY empresafidelidade.id;


--
-- TOC entry 202 (class 1259 OID 21337)
-- Name: empresafidelidade_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresafidelidade_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresafidelidade_idempresa_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 202
-- Name: empresafidelidade_idempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresafidelidade_idempresa_seq OWNED BY empresafidelidade.idempresa;


--
-- TOC entry 203 (class 1259 OID 21339)
-- Name: empresafidelidade_idfidelidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresafidelidade_idfidelidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresafidelidade_idfidelidade_seq OWNER TO postgres;

--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 203
-- Name: empresafidelidade_idfidelidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresafidelidade_idfidelidade_seq OWNED BY empresafidelidade.idfidelidade;


--
-- TOC entry 235 (class 1259 OID 21461)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE estado (
    id integer NOT NULL,
    sigla character varying(15),
    nome character varying(150)
);


ALTER TABLE estado OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 21459)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estado_id_seq OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 234
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- TOC entry 192 (class 1259 OID 21297)
-- Name: fidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fidelidade (
    id integer NOT NULL,
    descricao character varying(150),
    qtdativacao integer,
    idtipovalor integer NOT NULL,
    idtipofidelidade integer NOT NULL
);


ALTER TABLE fidelidade OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 21291)
-- Name: fidelidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidade_id_seq OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 189
-- Name: fidelidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidade_id_seq OWNED BY fidelidade.id;


--
-- TOC entry 191 (class 1259 OID 21295)
-- Name: fidelidade_idtipofidelidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidade_idtipofidelidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidade_idtipofidelidade_seq OWNER TO postgres;

--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 191
-- Name: fidelidade_idtipofidelidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidade_idtipofidelidade_seq OWNED BY fidelidade.idtipofidelidade;


--
-- TOC entry 190 (class 1259 OID 21293)
-- Name: fidelidade_idtipovalor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidade_idtipovalor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidade_idtipovalor_seq OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 190
-- Name: fidelidade_idtipovalor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidade_idtipovalor_seq OWNED BY fidelidade.idtipovalor;


--
-- TOC entry 200 (class 1259 OID 21327)
-- Name: fidelidadeproduto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fidelidadeproduto (
    id integer NOT NULL,
    idfidelidade integer NOT NULL,
    idproduto integer NOT NULL
);


ALTER TABLE fidelidadeproduto OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 21321)
-- Name: fidelidadeproduto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidadeproduto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidadeproduto_id_seq OWNER TO postgres;

--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 197
-- Name: fidelidadeproduto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidadeproduto_id_seq OWNED BY fidelidadeproduto.id;


--
-- TOC entry 198 (class 1259 OID 21323)
-- Name: fidelidadeproduto_idfidelidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidadeproduto_idfidelidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidadeproduto_idfidelidade_seq OWNER TO postgres;

--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 198
-- Name: fidelidadeproduto_idfidelidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidadeproduto_idfidelidade_seq OWNED BY fidelidadeproduto.idfidelidade;


--
-- TOC entry 199 (class 1259 OID 21325)
-- Name: fidelidadeproduto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fidelidadeproduto_idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fidelidadeproduto_idproduto_seq OWNER TO postgres;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 199
-- Name: fidelidadeproduto_idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fidelidadeproduto_idproduto_seq OWNED BY fidelidadeproduto.idproduto;


--
-- TOC entry 213 (class 1259 OID 21371)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE funcionario (
    id integer NOT NULL,
    nome character varying(150),
    sobrenome character varying(150),
    email character varying(150),
    descricao character varying(150),
    logradouro character varying(150),
    cep character varying(15),
    complemento character varying(50),
    idcidade integer NOT NULL,
    documento character varying(21),
    idempresa integer NOT NULL,
    idusuario integer NOT NULL
);


ALTER TABLE funcionario OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 21363)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_id_seq OWNER TO postgres;

--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 209
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_id_seq OWNED BY funcionario.id;


--
-- TOC entry 210 (class 1259 OID 21365)
-- Name: funcionario_idcidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_idcidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_idcidade_seq OWNER TO postgres;

--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 210
-- Name: funcionario_idcidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_idcidade_seq OWNED BY funcionario.idcidade;


--
-- TOC entry 211 (class 1259 OID 21367)
-- Name: funcionario_idempresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_idempresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_idempresa_seq OWNER TO postgres;

--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 211
-- Name: funcionario_idempresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_idempresa_seq OWNED BY funcionario.idempresa;


--
-- TOC entry 212 (class 1259 OID 21369)
-- Name: funcionario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionario_idusuario_seq OWNER TO postgres;

--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 212
-- Name: funcionario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_idusuario_seq OWNED BY funcionario.idusuario;


--
-- TOC entry 218 (class 1259 OID 21398)
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfil (
    id integer NOT NULL,
    nome character varying(150),
    descricao character varying(150)
);


ALTER TABLE perfil OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21396)
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfil_id_seq OWNER TO postgres;

--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 217
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_id_seq OWNED BY perfil.id;


--
-- TOC entry 222 (class 1259 OID 21410)
-- Name: perfilpermissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE perfilpermissao (
    id integer NOT NULL,
    idpermissao integer NOT NULL,
    idperfil integer NOT NULL
);


ALTER TABLE perfilpermissao OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 21404)
-- Name: perfilpermissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfilpermissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfilpermissao_id_seq OWNER TO postgres;

--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 219
-- Name: perfilpermissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfilpermissao_id_seq OWNED BY perfilpermissao.id;


--
-- TOC entry 221 (class 1259 OID 21408)
-- Name: perfilpermissao_idperfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfilpermissao_idperfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfilpermissao_idperfil_seq OWNER TO postgres;

--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 221
-- Name: perfilpermissao_idperfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfilpermissao_idperfil_seq OWNED BY perfilpermissao.idperfil;


--
-- TOC entry 220 (class 1259 OID 21406)
-- Name: perfilpermissao_idpermissao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfilpermissao_idpermissao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE perfilpermissao_idpermissao_seq OWNER TO postgres;

--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 220
-- Name: perfilpermissao_idpermissao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfilpermissao_idpermissao_seq OWNED BY perfilpermissao.idpermissao;


--
-- TOC entry 224 (class 1259 OID 21420)
-- Name: permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE permissao (
    id integer NOT NULL,
    descricao character varying(150)
);


ALTER TABLE permissao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 21418)
-- Name: permissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissao_id_seq OWNER TO postgres;

--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 223
-- Name: permissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissao_id_seq OWNED BY permissao.id;


--
-- TOC entry 188 (class 1259 OID 21285)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    descricao character varying(150),
    nome character varying(150),
    preco double precision,
    idcategoria bigint
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 21283)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 194 (class 1259 OID 21307)
-- Name: tipofidelidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipofidelidade (
    id integer NOT NULL,
    descricao character varying(150)
);


ALTER TABLE tipofidelidade OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 21305)
-- Name: tipofidelidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipofidelidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipofidelidade_id_seq OWNER TO postgres;

--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 193
-- Name: tipofidelidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipofidelidade_id_seq OWNED BY tipofidelidade.id;


--
-- TOC entry 196 (class 1259 OID 21315)
-- Name: tipovalor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipovalor (
    id integer NOT NULL,
    descricao character varying(150)
);


ALTER TABLE tipovalor OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 21313)
-- Name: tipovalor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipovalor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipovalor_id_seq OWNER TO postgres;

--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 195
-- Name: tipovalor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipovalor_id_seq OWNED BY tipovalor.id;


--
-- TOC entry 216 (class 1259 OID 21389)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id integer NOT NULL,
    login character varying(150),
    tipoperfil integer NOT NULL,
    gtoken character varying(150),
    senha character varying(150)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 21385)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO postgres;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 215 (class 1259 OID 21387)
-- Name: usuario_tipoperfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_tipoperfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_tipoperfil_seq OWNER TO postgres;

--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_tipoperfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_tipoperfil_seq OWNED BY usuario.tipoperfil;


--
-- TOC entry 2157 (class 2604 OID 21445)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- TOC entry 2158 (class 2604 OID 21455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 21456)
-- Name: id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade ALTER COLUMN id_estado SET DEFAULT nextval('cidade_id_estado_seq'::regclass);


--
-- TOC entry 2124 (class 2604 OID 21260)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- TOC entry 2125 (class 2604 OID 21261)
-- Name: idcidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idcidade SET DEFAULT nextval('cliente_idcidade_seq'::regclass);


--
-- TOC entry 2126 (class 2604 OID 21262)
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idusuario SET DEFAULT nextval('cliente_idusuario_seq'::regclass);


--
-- TOC entry 2154 (class 2604 OID 21435)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade ALTER COLUMN id SET DEFAULT nextval('clientefidelidade_id_seq'::regclass);


--
-- TOC entry 2155 (class 2604 OID 21436)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade ALTER COLUMN idcliente SET DEFAULT nextval('clientefidelidade_idcliente_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 21437)
-- Name: idfidelidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade ALTER COLUMN idfidelidade SET DEFAULT nextval('clientefidelidade_idfidelidade_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 21275)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN id SET DEFAULT nextval('empresa_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 21358)
-- Name: idempresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente ALTER COLUMN idempresa SET DEFAULT nextval('empresacliente_idempresa_seq'::regclass);


--
-- TOC entry 2141 (class 2604 OID 21359)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente ALTER COLUMN id SET DEFAULT nextval('empresacliente_id_seq'::regclass);


--
-- TOC entry 2142 (class 2604 OID 21360)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente ALTER COLUMN idcliente SET DEFAULT nextval('empresacliente_idcliente_seq'::regclass);


--
-- TOC entry 2137 (class 2604 OID 21344)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade ALTER COLUMN id SET DEFAULT nextval('empresafidelidade_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 21345)
-- Name: idempresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade ALTER COLUMN idempresa SET DEFAULT nextval('empresafidelidade_idempresa_seq'::regclass);


--
-- TOC entry 2139 (class 2604 OID 21346)
-- Name: idfidelidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade ALTER COLUMN idfidelidade SET DEFAULT nextval('empresafidelidade_idfidelidade_seq'::regclass);


--
-- TOC entry 2160 (class 2604 OID 21464)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 21300)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade ALTER COLUMN id SET DEFAULT nextval('fidelidade_id_seq'::regclass);


--
-- TOC entry 2130 (class 2604 OID 21301)
-- Name: idtipovalor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade ALTER COLUMN idtipovalor SET DEFAULT nextval('fidelidade_idtipovalor_seq'::regclass);


--
-- TOC entry 2131 (class 2604 OID 21302)
-- Name: idtipofidelidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade ALTER COLUMN idtipofidelidade SET DEFAULT nextval('fidelidade_idtipofidelidade_seq'::regclass);


--
-- TOC entry 2134 (class 2604 OID 21330)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto ALTER COLUMN id SET DEFAULT nextval('fidelidadeproduto_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 21331)
-- Name: idfidelidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto ALTER COLUMN idfidelidade SET DEFAULT nextval('fidelidadeproduto_idfidelidade_seq'::regclass);


--
-- TOC entry 2136 (class 2604 OID 21332)
-- Name: idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto ALTER COLUMN idproduto SET DEFAULT nextval('fidelidadeproduto_idproduto_seq'::regclass);


--
-- TOC entry 2143 (class 2604 OID 21374)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN id SET DEFAULT nextval('funcionario_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 21375)
-- Name: idcidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN idcidade SET DEFAULT nextval('funcionario_idcidade_seq'::regclass);


--
-- TOC entry 2145 (class 2604 OID 21376)
-- Name: idempresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN idempresa SET DEFAULT nextval('funcionario_idempresa_seq'::regclass);


--
-- TOC entry 2146 (class 2604 OID 21377)
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN idusuario SET DEFAULT nextval('funcionario_idusuario_seq'::regclass);


--
-- TOC entry 2149 (class 2604 OID 21401)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil ALTER COLUMN id SET DEFAULT nextval('perfil_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 21413)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao ALTER COLUMN id SET DEFAULT nextval('perfilpermissao_id_seq'::regclass);


--
-- TOC entry 2151 (class 2604 OID 21414)
-- Name: idpermissao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao ALTER COLUMN idpermissao SET DEFAULT nextval('perfilpermissao_idpermissao_seq'::regclass);


--
-- TOC entry 2152 (class 2604 OID 21415)
-- Name: idperfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao ALTER COLUMN idperfil SET DEFAULT nextval('perfilpermissao_idperfil_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 21423)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissao ALTER COLUMN id SET DEFAULT nextval('permissao_id_seq'::regclass);


--
-- TOC entry 2128 (class 2604 OID 21288)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 21310)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipofidelidade ALTER COLUMN id SET DEFAULT nextval('tipofidelidade_id_seq'::regclass);


--
-- TOC entry 2133 (class 2604 OID 21318)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipovalor ALTER COLUMN id SET DEFAULT nextval('tipovalor_id_seq'::regclass);


--
-- TOC entry 2147 (class 2604 OID 21392)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2148 (class 2604 OID 21393)
-- Name: tipoperfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN tipoperfil SET DEFAULT nextval('usuario_tipoperfil_seq'::regclass);


--
-- TOC entry 2386 (class 0 OID 21442)
-- Dependencies: 230
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categoria (id, descricao) VALUES (1, 'doce');
INSERT INTO categoria (id, descricao) VALUES (2, 'brinquedo');
INSERT INTO categoria (id, descricao) VALUES (3, 'fast-food');
INSERT INTO categoria (id, descricao) VALUES (4, 'corte');
INSERT INTO categoria (id, descricao) VALUES (5, 'lavagem');
INSERT INTO categoria (id, descricao) VALUES (6, 'roupa');
INSERT INTO categoria (id, descricao) VALUES (7, 'salgado');
INSERT INTO categoria (id, descricao) VALUES (8, 'sorvete');
INSERT INTO categoria (id, descricao) VALUES (9, 'hamburguer');
INSERT INTO categoria (id, descricao) VALUES (10, 'burrito');


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 229
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 10, true);


--
-- TOC entry 2389 (class 0 OID 21452)
-- Dependencies: 233
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 232
-- Name: cidade_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_estado_seq', 1, false);


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 231
-- Name: cidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cidade_id_seq', 1, false);


--
-- TOC entry 2340 (class 0 OID 21257)
-- Dependencies: 184
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_id_seq', 1, false);


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 182
-- Name: cliente_idcidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_idcidade_seq', 1, false);


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 183
-- Name: cliente_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_idusuario_seq', 1, false);


--
-- TOC entry 2384 (class 0 OID 21432)
-- Dependencies: 228
-- Data for Name: clientefidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 225
-- Name: clientefidelidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientefidelidade_id_seq', 1, false);


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 226
-- Name: clientefidelidade_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientefidelidade_idcliente_seq', 1, false);


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 227
-- Name: clientefidelidade_idfidelidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientefidelidade_idfidelidade_seq', 1, false);


--
-- TOC entry 2342 (class 0 OID 21272)
-- Dependencies: 186
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 185
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_id_seq', 1, false);


--
-- TOC entry 2364 (class 0 OID 21355)
-- Dependencies: 208
-- Data for Name: empresacliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 206
-- Name: empresacliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresacliente_id_seq', 1, false);


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 207
-- Name: empresacliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresacliente_idcliente_seq', 1, false);


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 205
-- Name: empresacliente_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresacliente_idempresa_seq', 1, false);


--
-- TOC entry 2360 (class 0 OID 21341)
-- Dependencies: 204
-- Data for Name: empresafidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 201
-- Name: empresafidelidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresafidelidade_id_seq', 1, false);


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 202
-- Name: empresafidelidade_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresafidelidade_idempresa_seq', 1, false);


--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 203
-- Name: empresafidelidade_idfidelidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresafidelidade_idfidelidade_seq', 1, false);


--
-- TOC entry 2391 (class 0 OID 21461)
-- Dependencies: 235
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 234
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 1, false);


--
-- TOC entry 2348 (class 0 OID 21297)
-- Dependencies: 192
-- Data for Name: fidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 189
-- Name: fidelidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidade_id_seq', 1, false);


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 191
-- Name: fidelidade_idtipofidelidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidade_idtipofidelidade_seq', 1, false);


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 190
-- Name: fidelidade_idtipovalor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidade_idtipovalor_seq', 1, false);


--
-- TOC entry 2356 (class 0 OID 21327)
-- Dependencies: 200
-- Data for Name: fidelidadeproduto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 197
-- Name: fidelidadeproduto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidadeproduto_id_seq', 1, false);


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 198
-- Name: fidelidadeproduto_idfidelidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidadeproduto_idfidelidade_seq', 1, false);


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 199
-- Name: fidelidadeproduto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fidelidadeproduto_idproduto_seq', 1, false);


--
-- TOC entry 2369 (class 0 OID 21371)
-- Dependencies: 213
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 209
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_id_seq', 1, false);


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 210
-- Name: funcionario_idcidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_idcidade_seq', 1, false);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 211
-- Name: funcionario_idempresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_idempresa_seq', 1, false);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 212
-- Name: funcionario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_idusuario_seq', 1, false);


--
-- TOC entry 2374 (class 0 OID 21398)
-- Dependencies: 218
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfil (id, nome, descricao) VALUES (1, 'GERENTE GERAL', 'GERENCIAMENTO GERAL');
INSERT INTO perfil (id, nome, descricao) VALUES (2, 'SUB GERENTE GERAL', 'ABAIXO DA GERENCIA GERAL');
INSERT INTO perfil (id, nome, descricao) VALUES (3, 'ATENDENTE', 'ATENDENTE FISICO');
INSERT INTO perfil (id, nome, descricao) VALUES (4, 'AUXILIAR TECNICO', 'ASPIRANTE A ATENDENTE');
INSERT INTO perfil (id, nome, descricao) VALUES (5, 'COZINHEIRO', 'CHEF DE COZINHA');
INSERT INTO perfil (id, nome, descricao) VALUES (6, 'AUXILIAR DE COZINHA', 'ASPIRANTE A COZINHEIRO');
INSERT INTO perfil (id, nome, descricao) VALUES (7, 'PANFLETEIRO', 'MARKETEIRO INICIAL');
INSERT INTO perfil (id, nome, descricao) VALUES (8, 'AUXILIAR DE PANFLETO', 'ASPIRANTE A PANFLETEIRO');
INSERT INTO perfil (id, nome, descricao) VALUES (9, 'CABELEIREIRO', 'CORTADOR DE CABELO');
INSERT INTO perfil (id, nome, descricao) VALUES (10, 'BARBEIRO', 'CORTADOR DE BARBA');
INSERT INTO perfil (id, nome, descricao) VALUES (11, 'SECRETARIA', 'SECRETARIA RECEPCIONISTA');
INSERT INTO perfil (id, nome, descricao) VALUES (12, 'SECRETARIA PLUS', 'SECRETARIA DO MES');


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 217
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_id_seq', 12, true);


--
-- TOC entry 2378 (class 0 OID 21410)
-- Dependencies: 222
-- Data for Name: perfilpermissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (1, 1, 1);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (2, 1, 2);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (3, 2, 3);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (4, 2, 4);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (5, 3, 5);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (6, 3, 6);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (7, 4, 7);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (8, 4, 8);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (9, 5, 9);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (10, 5, 10);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (11, 6, 11);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (12, 6, 12);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (13, 3, 1);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (14, 3, 2);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (15, 4, 3);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (16, 4, 4);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (17, 5, 5);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (18, 5, 6);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (19, 6, 7);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (20, 6, 8);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (21, 1, 9);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (22, 1, 10);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (23, 2, 11);
INSERT INTO perfilpermissao (id, idpermissao, idperfil) VALUES (24, 2, 12);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 219
-- Name: perfilpermissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfilpermissao_id_seq', 24, true);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 221
-- Name: perfilpermissao_idperfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfilpermissao_idperfil_seq', 1, false);


--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 220
-- Name: perfilpermissao_idpermissao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfilpermissao_idpermissao_seq', 1, false);


--
-- TOC entry 2380 (class 0 OID 21420)
-- Dependencies: 224
-- Data for Name: permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permissao (id, descricao) VALUES (1, 'ISADMIN');
INSERT INTO permissao (id, descricao) VALUES (2, 'READ_EMPLOYEE');
INSERT INTO permissao (id, descricao) VALUES (3, 'WRITE_EMPLOYEE');
INSERT INTO permissao (id, descricao) VALUES (4, 'READ_GRAPHS');
INSERT INTO permissao (id, descricao) VALUES (5, 'WRITE_FIDELITIES');
INSERT INTO permissao (id, descricao) VALUES (6, 'READ_FIDELITIES');


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 223
-- Name: permissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissao_id_seq', 6, true);


--
-- TOC entry 2344 (class 0 OID 21285)
-- Dependencies: 188
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 1, false);


--
-- TOC entry 2350 (class 0 OID 21307)
-- Dependencies: 194
-- Data for Name: tipofidelidade; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 193
-- Name: tipofidelidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipofidelidade_id_seq', 1, false);


--
-- TOC entry 2352 (class 0 OID 21315)
-- Dependencies: 196
-- Data for Name: tipovalor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 195
-- Name: tipovalor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipovalor_id_seq', 1, false);


--
-- TOC entry 2372 (class 0 OID 21389)
-- Dependencies: 216
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1, false);


--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_tipoperfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_tipoperfil_seq', 1, false);


--
-- TOC entry 2198 (class 2606 OID 21447)
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 21458)
-- Name: cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 21269)
-- Name: cliente_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_documento_key UNIQUE (documento);


--
-- TOC entry 2164 (class 2606 OID 21267)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 21439)
-- Name: clientefidelidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade
    ADD CONSTRAINT clientefidelidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 21282)
-- Name: empresa_cnpj_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_cnpj_email_key UNIQUE (cnpj, email);


--
-- TOC entry 2168 (class 2606 OID 21280)
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 2182 (class 2606 OID 21362)
-- Name: empresacliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente
    ADD CONSTRAINT empresacliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 21348)
-- Name: empresafidelidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade
    ADD CONSTRAINT empresafidelidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 21466)
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 21304)
-- Name: fidelidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade
    ADD CONSTRAINT fidelidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2178 (class 2606 OID 21334)
-- Name: fidelidadeproduto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto
    ADD CONSTRAINT fidelidadeproduto_pkey PRIMARY KEY (id);


--
-- TOC entry 2184 (class 2606 OID 21384)
-- Name: funcionario_id_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_id_documento_key UNIQUE (id, documento);


--
-- TOC entry 2186 (class 2606 OID 21382)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 21403)
-- Name: perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 21417)
-- Name: perfilpermissao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao
    ADD CONSTRAINT perfilpermissao_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 21425)
-- Name: permissao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissao
    ADD CONSTRAINT permissao_pkey PRIMARY KEY (id);


--
-- TOC entry 2170 (class 2606 OID 21290)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2174 (class 2606 OID 21312)
-- Name: tipofidelidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipofidelidade
    ADD CONSTRAINT tipofidelidade_pkey PRIMARY KEY (id);


--
-- TOC entry 2176 (class 2606 OID 21320)
-- Name: tipovalor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipovalor
    ADD CONSTRAINT tipovalor_pkey PRIMARY KEY (id);


--
-- TOC entry 2188 (class 2606 OID 21395)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2222 (class 2606 OID 21562)
-- Name: fk_cidade_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cidade
    ADD CONSTRAINT fk_cidade_2 FOREIGN KEY (id_estado) REFERENCES estado(id);


--
-- TOC entry 2203 (class 2606 OID 21467)
-- Name: fk_cliente_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_cliente_3 FOREIGN KEY (idusuario) REFERENCES usuario(id);


--
-- TOC entry 2204 (class 2606 OID 21472)
-- Name: fk_cliente_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT fk_cliente_4 FOREIGN KEY (idcidade) REFERENCES cidade(id);


--
-- TOC entry 2220 (class 2606 OID 21552)
-- Name: fk_clientefidelidade_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade
    ADD CONSTRAINT fk_clientefidelidade_2 FOREIGN KEY (idcliente) REFERENCES cliente(id);


--
-- TOC entry 2221 (class 2606 OID 21557)
-- Name: fk_clientefidelidade_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientefidelidade
    ADD CONSTRAINT fk_clientefidelidade_3 FOREIGN KEY (idfidelidade) REFERENCES fidelidade(id);


--
-- TOC entry 2212 (class 2606 OID 21512)
-- Name: fk_empresacliente_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente
    ADD CONSTRAINT fk_empresacliente_1 FOREIGN KEY (idempresa) REFERENCES empresa(id);


--
-- TOC entry 2213 (class 2606 OID 21517)
-- Name: fk_empresacliente_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresacliente
    ADD CONSTRAINT fk_empresacliente_3 FOREIGN KEY (idcliente) REFERENCES cliente(id);


--
-- TOC entry 2210 (class 2606 OID 21502)
-- Name: fk_empresafidelidade_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade
    ADD CONSTRAINT fk_empresafidelidade_2 FOREIGN KEY (idempresa) REFERENCES empresa(id);


--
-- TOC entry 2211 (class 2606 OID 21507)
-- Name: fk_empresafidelidade_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresafidelidade
    ADD CONSTRAINT fk_empresafidelidade_3 FOREIGN KEY (idfidelidade) REFERENCES fidelidade(id);


--
-- TOC entry 2206 (class 2606 OID 21482)
-- Name: fk_fidelidade_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade
    ADD CONSTRAINT fk_fidelidade_2 FOREIGN KEY (idtipovalor) REFERENCES tipovalor(id);


--
-- TOC entry 2207 (class 2606 OID 21487)
-- Name: fk_fidelidade_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidade
    ADD CONSTRAINT fk_fidelidade_3 FOREIGN KEY (idtipofidelidade) REFERENCES tipofidelidade(id);


--
-- TOC entry 2208 (class 2606 OID 21492)
-- Name: fk_fidelidadeproduto_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto
    ADD CONSTRAINT fk_fidelidadeproduto_2 FOREIGN KEY (idproduto) REFERENCES produto(id);


--
-- TOC entry 2209 (class 2606 OID 21497)
-- Name: fk_fidelidadeproduto_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fidelidadeproduto
    ADD CONSTRAINT fk_fidelidadeproduto_3 FOREIGN KEY (idfidelidade) REFERENCES fidelidade(id);


--
-- TOC entry 2214 (class 2606 OID 21522)
-- Name: fk_funcionario_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario_3 FOREIGN KEY (idempresa) REFERENCES empresa(id);


--
-- TOC entry 2215 (class 2606 OID 21527)
-- Name: fk_funcionario_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario_4 FOREIGN KEY (idusuario) REFERENCES usuario(id);


--
-- TOC entry 2216 (class 2606 OID 21532)
-- Name: fk_funcionario_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT fk_funcionario_5 FOREIGN KEY (idcidade) REFERENCES cidade(id);


--
-- TOC entry 2218 (class 2606 OID 21542)
-- Name: fk_perfilpermissao_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao
    ADD CONSTRAINT fk_perfilpermissao_2 FOREIGN KEY (idpermissao) REFERENCES permissao(id);


--
-- TOC entry 2219 (class 2606 OID 21547)
-- Name: fk_perfilpermissao_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfilpermissao
    ADD CONSTRAINT fk_perfilpermissao_3 FOREIGN KEY (idperfil) REFERENCES perfil(id);


--
-- TOC entry 2205 (class 2606 OID 21477)
-- Name: fk_produto_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT fk_produto_2 FOREIGN KEY (idcategoria) REFERENCES categoria(id);


--
-- TOC entry 2217 (class 2606 OID 21537)
-- Name: fk_usuario_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_usuario_2 FOREIGN KEY (tipoperfil) REFERENCES perfil(id);


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-10-28 20:05:21

--
-- PostgreSQL database dump complete
--

