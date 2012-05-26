--
-- PostgreSQL database dump
--

-- Started on 2012-05-26 14:14:40

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 479 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 153 (class 1259 OID 24957)
-- Dependencies: 3
-- Name: auditorias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auditorias (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    fecha_at date NOT NULL,
    accion_realizada text NOT NULL,
    tabla_afectada character varying(150),
    ip character varying(30)
);


--
-- TOC entry 152 (class 1259 OID 24955)
-- Dependencies: 153 3
-- Name: auditorias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auditorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1860 (class 0 OID 0)
-- Dependencies: 152
-- Name: auditorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auditorias_id_seq OWNED BY auditorias.id;


--
-- TOC entry 1861 (class 0 OID 0)
-- Dependencies: 152
-- Name: auditorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auditorias_id_seq', 1, false);


--
-- TOC entry 151 (class 1259 OID 24946)
-- Dependencies: 1819 1820 1821 3
-- Name: menus; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE menus (
    id integer NOT NULL,
    menus_id integer,
    recursos_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    url character varying(100) NOT NULL,
    posicion integer DEFAULT 100 NOT NULL,
    clases character varying(50),
    visible_en integer DEFAULT 1 NOT NULL,
    activo integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 150 (class 1259 OID 24944)
-- Dependencies: 151 3
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 150
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE menus_id_seq OWNED BY menus.id;


--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 150
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('menus_id_seq', 1, false);


--
-- TOC entry 143 (class 1259 OID 24907)
-- Dependencies: 1813 3
-- Name: recursos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recursos (
    id integer NOT NULL,
    modulo character varying(50),
    controlador character varying(50) NOT NULL,
    accion character varying(50),
    recurso character varying(200) NOT NULL,
    descripcion text,
    activo integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 142 (class 1259 OID 24905)
-- Dependencies: 143 3
-- Name: recursos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1864 (class 0 OID 0)
-- Dependencies: 142
-- Name: recursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recursos_id_seq OWNED BY recursos.id;


--
-- TOC entry 1865 (class 0 OID 0)
-- Dependencies: 142
-- Name: recursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('recursos_id_seq', 1, false);


--
-- TOC entry 141 (class 1259 OID 24896)
-- Dependencies: 1811 3
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    rol character varying(50) NOT NULL,
    plantilla character varying(50),
    activo integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 140 (class 1259 OID 24894)
-- Dependencies: 3 141
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1866 (class 0 OID 0)
-- Dependencies: 140
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 1867 (class 0 OID 0)
-- Dependencies: 140
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- TOC entry 145 (class 1259 OID 24919)
-- Dependencies: 3
-- Name: roles_recursos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_recursos (
    id integer NOT NULL,
    roles_id integer NOT NULL,
    recursos_id integer NOT NULL
);


--
-- TOC entry 144 (class 1259 OID 24917)
-- Dependencies: 3 145
-- Name: roles_recursos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_recursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1868 (class 0 OID 0)
-- Dependencies: 144
-- Name: roles_recursos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_recursos_id_seq OWNED BY roles_recursos.id;


--
-- TOC entry 1869 (class 0 OID 0)
-- Dependencies: 144
-- Name: roles_recursos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_recursos_id_seq', 1, false);


--
-- TOC entry 149 (class 1259 OID 24938)
-- Dependencies: 3
-- Name: roles_usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles_usuarios (
    id integer NOT NULL,
    roles_id integer NOT NULL,
    usuarios_id integer NOT NULL
);


--
-- TOC entry 148 (class 1259 OID 24936)
-- Dependencies: 149 3
-- Name: roles_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1870 (class 0 OID 0)
-- Dependencies: 148
-- Name: roles_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_usuarios_id_seq OWNED BY roles_usuarios.id;


--
-- TOC entry 1871 (class 0 OID 0)
-- Dependencies: 148
-- Name: roles_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_usuarios_id_seq', 1, false);


--
-- TOC entry 147 (class 1259 OID 24927)
-- Dependencies: 1816 3
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    login character varying(50) NOT NULL,
    clave character varying(40) NOT NULL,
    nombres character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    activo integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 146 (class 1259 OID 24925)
-- Dependencies: 147 3
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- TOC entry 1872 (class 0 OID 0)
-- Dependencies: 146
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- TOC entry 1873 (class 0 OID 0)
-- Dependencies: 146
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, false);


--
-- TOC entry 1822 (class 2604 OID 24960)
-- Dependencies: 153 152 153
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auditorias ALTER COLUMN id SET DEFAULT nextval('auditorias_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 24949)
-- Dependencies: 151 150 151
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);


--
-- TOC entry 1812 (class 2604 OID 24910)
-- Dependencies: 143 142 143
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE recursos ALTER COLUMN id SET DEFAULT nextval('recursos_id_seq'::regclass);


--
-- TOC entry 1810 (class 2604 OID 24899)
-- Dependencies: 140 141 141
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 1814 (class 2604 OID 24922)
-- Dependencies: 145 144 145
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE roles_recursos ALTER COLUMN id SET DEFAULT nextval('roles_recursos_id_seq'::regclass);


--
-- TOC entry 1817 (class 2604 OID 24941)
-- Dependencies: 148 149 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE roles_usuarios ALTER COLUMN id SET DEFAULT nextval('roles_usuarios_id_seq'::regclass);


--
-- TOC entry 1815 (class 2604 OID 24930)
-- Dependencies: 147 146 147
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- TOC entry 1854 (class 0 OID 24957)
-- Dependencies: 153
-- Data for Name: auditorias; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 1853 (class 0 OID 24946)
-- Dependencies: 151
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (1, 18, 1, 'Usuarios', 'admin/usuarios', 10, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (3, 18, 2, 'Roles', 'admin/roles', 20, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (4, 18, 3, 'Recursos', 'admin/recursos', 30, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (5, 18, 4, 'Menu', 'admin/menu', 100, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (7, 18, 5, 'Privilegios', 'admin/privilegios', 90, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (18, NULL, 17, 'Administración', 'admin/usuarios/index', 100, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (19, NULL, 14, 'Mi Perfil', 'admin/usuarios/perfil', 90, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (21, 18, 15, 'Config. Aplicacion', 'admin', 1000, NULL, 2, 1);
INSERT INTO menus (id, menus_id, recursos_id, nombre, url, posicion, clases, visible_en, activo) VALUES (22, 18, 18, 'Auditorias', 'admin/auditorias', 900, NULL, 2, 1);


--
-- TOC entry 1849 (class 0 OID 24907)
-- Dependencies: 143
-- Data for Name: recursos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (1, 'admin', 'usuarios', NULL, 'admin/usuarios/*', 'modulo para la administracion de los usuarios del sistema', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (2, 'admin', 'roles', NULL, 'admin/roles/*', 'modulo para la gestion de los roles de la aplicacion
', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (3, 'admin', 'recursos', NULL, 'admin/recursos/*', 'modulo para la gestion de los recursos de la aplicacion', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (4, 'admin', 'menu', NULL, 'admin/menu/*', 'modulo para la administracion del menu en la app', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (5, 'admin', 'privilegios', NULL, 'admin/privilegios/*', 'modulo para la administracion de los privilegios que tendra cada rol', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (11, NULL, 'index', NULL, 'index/*', 'modulo inicial del sistema, donde se loguean los usuarios y donde se desloguean', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (14, 'admin', 'usuarios', 'perfil', 'admin/usuarios/perfil', 'modulo para la configuracion del perfil del usuario', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (15, 'admin', 'index', NULL, 'admin/index/*', 'modulo para la configuración del sistema', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (17, 'admin', 'usuarios', 'index', 'admin/usuarios/index', 'modulo para listar los usuarios del sistema, lo usará¡ el menu administracion', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (18, 'admin', 'auditorias', NULL, 'admin/auditorias/*', 'Modulo para revisar las acciones que los usuarios han realizado en el sistema', 1);
INSERT INTO recursos (id, modulo, controlador, accion, recurso, descripcion, activo) VALUES (19, NULL, 'index', 'index', 'index/index', 'recurso que no necesita permisos, es solo de prueba :-)', 1);


--
-- TOC entry 1848 (class 0 OID 24896)
-- Dependencies: 141
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO roles (id, rol, plantilla, activo) VALUES (1, 'usuario comun', NULL, 1);
INSERT INTO roles (id, rol, plantilla, activo) VALUES (2, 'usuario administrador', NULL, 1);
INSERT INTO roles (id, rol, plantilla, activo) VALUES (4, 'administrador del sistema', NULL, 1);


--
-- TOC entry 1850 (class 0 OID 24919)
-- Dependencies: 145
-- Data for Name: roles_recursos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (636, 1, 1);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (633, 1, 2);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (630, 1, 3);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (624, 1, 4);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (627, 1, 5);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (645, 1, 11);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (642, 1, 14);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (621, 1, 15);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (639, 1, 17);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (618, 1, 18);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (637, 2, 1);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (634, 2, 2);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (631, 2, 3);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (625, 2, 4);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (628, 2, 5);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (646, 2, 11);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (643, 2, 14);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (622, 2, 15);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (640, 2, 17);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (619, 2, 18);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (638, 4, 1);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (635, 4, 2);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (632, 4, 3);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (626, 4, 4);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (629, 4, 5);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (647, 4, 11);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (644, 4, 14);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (623, 4, 15);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (641, 4, 17);
INSERT INTO roles_recursos (id, roles_id, recursos_id) VALUES (620, 4, 18);


--
-- TOC entry 1852 (class 0 OID 24938)
-- Dependencies: 149
-- Data for Name: roles_usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO roles_usuarios (id, roles_id, usuarios_id) VALUES (1, 1, 2);
INSERT INTO roles_usuarios (id, roles_id, usuarios_id) VALUES (2, 2, 3);
INSERT INTO roles_usuarios (id, roles_id, usuarios_id) VALUES (3, 4, 3);


--
-- TOC entry 1851 (class 0 OID 24927)
-- Dependencies: 147
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO usuarios (id, login, clave, nombres, email, activo) VALUES (2, 'usuario', '/bzxN0zFpwaIw', 'usuario del sistema', 'asd@mail.com', 1);
INSERT INTO usuarios (id, login, clave, nombres, email, activo) VALUES (3, 'admin', '/bzxN0zFpwaIw', 'usuario administrador del sistema', 'manuel_j555@hotmail.com', 1);


--
-- TOC entry 1840 (class 2606 OID 24965)
-- Dependencies: 153 153
-- Name: auditorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auditorias
    ADD CONSTRAINT auditorias_pkey PRIMARY KEY (id);


--
-- TOC entry 1838 (class 2606 OID 24954)
-- Dependencies: 151 151
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- TOC entry 1828 (class 2606 OID 24916)
-- Dependencies: 143 143
-- Name: recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recursos
    ADD CONSTRAINT recursos_pkey PRIMARY KEY (id);


--
-- TOC entry 1824 (class 2606 OID 24902)
-- Dependencies: 141 141
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1830 (class 2606 OID 24924)
-- Dependencies: 145 145
-- Name: roles_recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_recursos
    ADD CONSTRAINT roles_recursos_pkey PRIMARY KEY (id);


--
-- TOC entry 1826 (class 2606 OID 24904)
-- Dependencies: 141 141
-- Name: roles_rol_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_rol_key UNIQUE (rol);


--
-- TOC entry 1836 (class 2606 OID 24943)
-- Dependencies: 149 149
-- Name: roles_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles_usuarios
    ADD CONSTRAINT roles_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 1832 (class 2606 OID 24935)
-- Dependencies: 147 147
-- Name: usuarios_login_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_login_key UNIQUE (login);


--
-- TOC entry 1834 (class 2606 OID 24933)
-- Dependencies: 147 147
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 1847 (class 2606 OID 24966)
-- Dependencies: 147 1833 153
-- Name: auditorias_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auditorias
    ADD CONSTRAINT auditorias_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1845 (class 2606 OID 24971)
-- Dependencies: 151 151 1837
-- Name: menus_menus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_menus_id_fkey FOREIGN KEY (menus_id) REFERENCES menus(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1846 (class 2606 OID 24976)
-- Dependencies: 143 151 1827
-- Name: menus_recursos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_recursos_id_fkey FOREIGN KEY (recursos_id) REFERENCES recursos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1842 (class 2606 OID 24986)
-- Dependencies: 143 1827 145
-- Name: roles_recursos_recursos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_recursos
    ADD CONSTRAINT roles_recursos_recursos_id_fkey FOREIGN KEY (recursos_id) REFERENCES recursos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1841 (class 2606 OID 24981)
-- Dependencies: 145 1823 141
-- Name: roles_recursos_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_recursos
    ADD CONSTRAINT roles_recursos_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1843 (class 2606 OID 24991)
-- Dependencies: 141 149 1823
-- Name: roles_usuarios_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_usuarios
    ADD CONSTRAINT roles_usuarios_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1844 (class 2606 OID 24996)
-- Dependencies: 1833 149 147
-- Name: roles_usuarios_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles_usuarios
    ADD CONSTRAINT roles_usuarios_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1859 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-05-26 14:14:40

--
-- PostgreSQL database dump complete
--

