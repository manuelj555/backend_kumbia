/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 80410
Source Host           : localhost:5432
Source Database       : backend
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 80410
File Encoding         : 65001

Date: 2012-05-27 14:11:34
*/


-- ----------------------------
-- Sequence structure for "public"."auditorias_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."auditorias_id_seq";
CREATE SEQUENCE "public"."auditorias_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."menus_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."menus_id_seq";
CREATE SEQUENCE "public"."menus_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."recursos_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."recursos_id_seq";
CREATE SEQUENCE "public"."recursos_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."roles_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."roles_recursos_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."roles_recursos_id_seq";
CREATE SEQUENCE "public"."roles_recursos_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 30
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."roles_usuarios_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."roles_usuarios_id_seq";
CREATE SEQUENCE "public"."roles_usuarios_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for "public"."usuarios_id_seq"
-- ----------------------------
DROP SEQUENCE "public"."usuarios_id_seq";
CREATE SEQUENCE "public"."usuarios_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for "public"."auditorias"
-- ----------------------------
DROP TABLE "public"."auditorias";
CREATE TABLE "public"."auditorias" (
"id" int4 DEFAULT nextval('auditorias_id_seq'::regclass) NOT NULL,
"usuarios_id" int4 NOT NULL,
"fecha_at" date NOT NULL,
"accion_realizada" text NOT NULL,
"tabla_afectada" varchar(150),
"ip" varchar(30)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of auditorias
-- ----------------------------

-- ----------------------------
-- Table structure for "public"."menus"
-- ----------------------------
DROP TABLE "public"."menus";
CREATE TABLE "public"."menus" (
"id" int4 DEFAULT nextval('menus_id_seq'::regclass) NOT NULL,
"menus_id" int4,
"recursos_id" int4 NOT NULL,
"nombre" varchar(100) NOT NULL,
"url" varchar(100) NOT NULL,
"posicion" int4 DEFAULT 100 NOT NULL,
"clases" varchar(50),
"visible_en" int4 DEFAULT 1 NOT NULL,
"activo" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO "public"."menus" VALUES ('1', '18', '1', 'Usuarios', 'admin/usuarios', '10', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('3', '18', '2', 'Roles', 'admin/roles', '20', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('4', '18', '3', 'Recursos', 'admin/recursos', '30', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('5', '18', '4', 'Menu', 'admin/menu', '100', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('7', '18', '5', 'Privilegios', 'admin/privilegios', '90', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('18', null, '17', 'Administración', 'admin/usuarios/index', '100', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('19', null, '14', 'Mi Perfil', 'admin/usuarios/perfil', '90', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('21', '18', '15', 'Config. Aplicacion', 'admin', '1000', null, '2', '1');
INSERT INTO "public"."menus" VALUES ('22', '18', '18', 'Auditorias', 'admin/auditorias', '900', null, '2', '1');

-- ----------------------------
-- Table structure for "public"."recursos"
-- ----------------------------
DROP TABLE "public"."recursos";
CREATE TABLE "public"."recursos" (
"id" int4 DEFAULT nextval('recursos_id_seq'::regclass) NOT NULL,
"modulo" varchar(50),
"controlador" varchar(50) NOT NULL,
"accion" varchar(50),
"recurso" varchar(200) NOT NULL,
"descripcion" text,
"activo" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of recursos
-- ----------------------------
INSERT INTO "public"."recursos" VALUES ('1', 'admin', 'usuarios', null, 'admin/usuarios/*', 'modulo para la administracion de los usuarios del sistema', '1');
INSERT INTO "public"."recursos" VALUES ('2', 'admin', 'roles', null, 'admin/roles/*', 'modulo para la gestion de los roles de la aplicacion
', '1');
INSERT INTO "public"."recursos" VALUES ('3', 'admin', 'recursos', null, 'admin/recursos/*', 'modulo para la gestion de los recursos de la aplicacion', '1');
INSERT INTO "public"."recursos" VALUES ('4', 'admin', 'menu', null, 'admin/menu/*', 'modulo para la administracion del menu en la app', '1');
INSERT INTO "public"."recursos" VALUES ('5', 'admin', 'privilegios', null, 'admin/privilegios/*', 'modulo para la administracion de los privilegios que tendra cada rol', '1');
INSERT INTO "public"."recursos" VALUES ('11', null, 'index', null, 'index/*', 'modulo inicial del sistema, donde se loguean los usuarios y donde se desloguean', '1');
INSERT INTO "public"."recursos" VALUES ('14', 'admin', 'usuarios', 'perfil', 'admin/usuarios/perfil', 'modulo para la configuracion del perfil del usuario', '1');
INSERT INTO "public"."recursos" VALUES ('15', 'admin', 'index', null, 'admin/index/*', 'modulo para la configuraciÃƒÆ’Ã‚Â³n del sistema', '1');
INSERT INTO "public"."recursos" VALUES ('17', 'admin', 'usuarios', 'index', 'admin/usuarios/index', 'modulo para listar los usuarios del sistema, lo usarÃƒÆ’Ã‚Â¡Ãƒâ€šÃ‚Â¡ el menu administracion', '1');
INSERT INTO "public"."recursos" VALUES ('18', 'admin', 'auditorias', null, 'admin/auditorias/*', 'Modulo para revisar las acciones que los usuarios han realizado en el sistema', '1');
INSERT INTO "public"."recursos" VALUES ('19', null, 'index', 'index', 'index/index', 'recurso que no necesita permisos, es solo de prueba :-)', '1');

-- ----------------------------
-- Table structure for "public"."roles"
-- ----------------------------
DROP TABLE "public"."roles";
CREATE TABLE "public"."roles" (
"id" int4 DEFAULT nextval('roles_id_seq'::regclass) NOT NULL,
"rol" varchar(50) NOT NULL,
"plantilla" varchar(50),
"activo" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES ('1', 'usuario comun', null, '1');
INSERT INTO "public"."roles" VALUES ('2', 'usuario administrador', null, '1');
INSERT INTO "public"."roles" VALUES ('4', 'administrador del sistema', null, '1');

-- ----------------------------
-- Table structure for "public"."roles_recursos"
-- ----------------------------
DROP TABLE "public"."roles_recursos";
CREATE TABLE "public"."roles_recursos" (
"id" int4 DEFAULT nextval('roles_recursos_id_seq'::regclass) NOT NULL,
"roles_id" int4 NOT NULL,
"recursos_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of roles_recursos
-- ----------------------------
INSERT INTO "public"."roles_recursos" VALUES ('1', '1', '1');
INSERT INTO "public"."roles_recursos" VALUES ('2', '1', '2');
INSERT INTO "public"."roles_recursos" VALUES ('3', '1', '3');
INSERT INTO "public"."roles_recursos" VALUES ('4', '1', '4');
INSERT INTO "public"."roles_recursos" VALUES ('5', '1', '5');
INSERT INTO "public"."roles_recursos" VALUES ('6', '1', '11');
INSERT INTO "public"."roles_recursos" VALUES ('7', '1', '14');
INSERT INTO "public"."roles_recursos" VALUES ('8', '1', '15');
INSERT INTO "public"."roles_recursos" VALUES ('9', '1', '17');
INSERT INTO "public"."roles_recursos" VALUES ('10', '1', '18');
INSERT INTO "public"."roles_recursos" VALUES ('11', '2', '1');
INSERT INTO "public"."roles_recursos" VALUES ('12', '2', '2');
INSERT INTO "public"."roles_recursos" VALUES ('13', '2', '3');
INSERT INTO "public"."roles_recursos" VALUES ('14', '2', '4');
INSERT INTO "public"."roles_recursos" VALUES ('15', '2', '5');
INSERT INTO "public"."roles_recursos" VALUES ('16', '2', '11');
INSERT INTO "public"."roles_recursos" VALUES ('17', '2', '14');
INSERT INTO "public"."roles_recursos" VALUES ('18', '2', '15');
INSERT INTO "public"."roles_recursos" VALUES ('19', '2', '17');
INSERT INTO "public"."roles_recursos" VALUES ('20', '2', '18');
INSERT INTO "public"."roles_recursos" VALUES ('21', '4', '1');
INSERT INTO "public"."roles_recursos" VALUES ('22', '4', '2');
INSERT INTO "public"."roles_recursos" VALUES ('23', '4', '3');
INSERT INTO "public"."roles_recursos" VALUES ('24', '4', '4');
INSERT INTO "public"."roles_recursos" VALUES ('25', '4', '5');
INSERT INTO "public"."roles_recursos" VALUES ('26', '4', '11');
INSERT INTO "public"."roles_recursos" VALUES ('27', '4', '14');
INSERT INTO "public"."roles_recursos" VALUES ('28', '4', '15');
INSERT INTO "public"."roles_recursos" VALUES ('29', '4', '17');
INSERT INTO "public"."roles_recursos" VALUES ('30', '4', '18');

-- ----------------------------
-- Table structure for "public"."roles_usuarios"
-- ----------------------------
DROP TABLE "public"."roles_usuarios";
CREATE TABLE "public"."roles_usuarios" (
"id" int4 DEFAULT nextval('roles_usuarios_id_seq'::regclass) NOT NULL,
"roles_id" int4 NOT NULL,
"usuarios_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of roles_usuarios
-- ----------------------------
INSERT INTO "public"."roles_usuarios" VALUES ('1', '1', '2');
INSERT INTO "public"."roles_usuarios" VALUES ('2', '2', '3');
INSERT INTO "public"."roles_usuarios" VALUES ('3', '4', '3');

-- ----------------------------
-- Table structure for "public"."usuarios"
-- ----------------------------
DROP TABLE "public"."usuarios";
CREATE TABLE "public"."usuarios" (
"id" int4 DEFAULT nextval('usuarios_id_seq'::regclass) NOT NULL,
"login" varchar(50) NOT NULL,
"clave" varchar(40) NOT NULL,
"nombres" varchar(100) NOT NULL,
"email" varchar(100) NOT NULL,
"activo" int4 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO "public"."usuarios" VALUES ('2', 'usuario', '/bzxN0zFpwaIw', 'usuario del sistema', 'asd@mail.com', '1');
INSERT INTO "public"."usuarios" VALUES ('3', 'admin', '/bzxN0zFpwaIw', 'usuario administrador del sistema', 'manuel_j555@hotmail.com', '1');

-- ----------------------------
-- Alter Sequences
-- ----------------------------
ALTER SEQUENCE "public"."auditorias_id_seq" OWNED BY "auditorias"."id";
ALTER SEQUENCE "public"."menus_id_seq" OWNED BY "menus"."id" RESTART WITH 23;
ALTER SEQUENCE "public"."recursos_id_seq" OWNED BY "recursos"."id" RESTART WITH 20;
ALTER SEQUENCE "public"."roles_id_seq" OWNED BY "roles"."id" RESTART WITH 5;
ALTER SEQUENCE "public"."roles_recursos_id_seq" OWNED BY "roles_recursos"."id" RESTART WITH 31;
ALTER SEQUENCE "public"."roles_usuarios_id_seq" OWNED BY "roles_usuarios"."id" RESTART WITH 4;
ALTER SEQUENCE "public"."usuarios_id_seq" OWNED BY "usuarios"."id" RESTART WITH 4;

-- ----------------------------
-- Primary Key structure for table "public"."auditorias"
-- ----------------------------
ALTER TABLE "public"."auditorias" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."menus"
-- ----------------------------
ALTER TABLE "public"."menus" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."recursos"
-- ----------------------------
ALTER TABLE "public"."recursos" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."roles"
-- ----------------------------
ALTER TABLE "public"."roles" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."roles_recursos"
-- ----------------------------
ALTER TABLE "public"."roles_recursos" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."roles_usuarios"
-- ----------------------------
ALTER TABLE "public"."roles_usuarios" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table "public"."usuarios"
-- ----------------------------
ALTER TABLE "public"."usuarios" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."auditorias"
-- ----------------------------
ALTER TABLE "public"."auditorias" ADD FOREIGN KEY ("usuarios_id") REFERENCES "public"."usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."menus"
-- ----------------------------
ALTER TABLE "public"."menus" ADD FOREIGN KEY ("menus_id") REFERENCES "public"."menus" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."menus" ADD FOREIGN KEY ("recursos_id") REFERENCES "public"."recursos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."roles_recursos"
-- ----------------------------
ALTER TABLE "public"."roles_recursos" ADD FOREIGN KEY ("recursos_id") REFERENCES "public"."recursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."roles_recursos" ADD FOREIGN KEY ("roles_id") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."roles_usuarios"
-- ----------------------------
ALTER TABLE "public"."roles_usuarios" ADD FOREIGN KEY ("roles_id") REFERENCES "public"."roles" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."roles_usuarios" ADD FOREIGN KEY ("usuarios_id") REFERENCES "public"."usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
