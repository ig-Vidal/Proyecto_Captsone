-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               11.8.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for comunidad_vecinal
CREATE DATABASE IF NOT EXISTS `comunidad_vecinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `comunidad_vecinal`;

-- Dumping structure for table comunidad_vecinal.actividad
CREATE TABLE IF NOT EXISTS `actividad` (
  `id_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `requisitos` longtext DEFAULT NULL,
  `categoria` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time(6) DEFAULT NULL,
  `hora_fin` time(6) DEFAULT NULL,
  `cupos` int(10) unsigned NOT NULL CHECK (`cupos` >= 0),
  `estado` varchar(20) NOT NULL,
  `lugar` varchar(200) DEFAULT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `historial` tinyint(1) NOT NULL,
  `id_vecino` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_actividad`),
  KEY `actividad_id_vecino_a5b9f7ad_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `actividad_id_vecino_a5b9f7ad_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.certificado
CREATE TABLE IF NOT EXISTS `certificado` (
  `id_certificado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(40) NOT NULL,
  `motivo` varchar(150) DEFAULT NULL,
  `observaciones` longtext DEFAULT NULL,
  `telefono_contacto` varchar(20) DEFAULT NULL,
  `archivo_respaldo` varchar(100) DEFAULT NULL,
  `fecha_solicitud` datetime(6) NOT NULL,
  `fecha_emision` datetime(6) DEFAULT NULL,
  `fecha_expiracion` datetime(6) DEFAULT NULL,
  `folio` varchar(50) DEFAULT NULL,
  `qr_code` varchar(100) DEFAULT NULL,
  `archivo_pdf` varchar(100) DEFAULT NULL,
  `firma_digital` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `observacion_rechazo` longtext DEFAULT NULL,
  `id_vecino` int(11) NOT NULL,
  PRIMARY KEY (`id_certificado`),
  UNIQUE KEY `folio` (`folio`),
  KEY `certificado_id_vecino_9cc446ed_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `certificado_id_vecino_9cc446ed_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.chatbot_bitacora
CREATE TABLE IF NOT EXISTS `chatbot_bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) DEFAULT NULL,
  `mensaje_usuario` longtext NOT NULL,
  `respuesta_bot` longtext NOT NULL,
  `intent` varchar(100) DEFAULT NULL,
  `fecha` datetime(6) NOT NULL,
  `id_vecino` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_bitacora_id_vecino_43603388_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `chatbot_bitacora_id_vecino_43603388_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.espacio
CREATE TABLE IF NOT EXISTS `espacio` (
  `id_espacio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_espacio` varchar(100) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `moneda` varchar(3) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  PRIMARY KEY (`id_espacio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.inscripcion_actividad
CREATE TABLE IF NOT EXISTS `inscripcion_actividad` (
  `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_vecino` int(11) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  UNIQUE KEY `inscripcion_actividad_id_actividad_id_vecino_1060752c_uniq` (`id_actividad`,`id_vecino`),
  KEY `inscripcion_actividad_id_vecino_f5d5fbdd_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `inscripcion_activida_id_actividad_97ba6ff8_fk_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  CONSTRAINT `inscripcion_actividad_id_vecino_f5d5fbdd_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `id_noticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria` varchar(20) NOT NULL,
  `contenido` longtext NOT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `id_autor` int(11) NOT NULL,
  PRIMARY KEY (`id_noticia`),
  KEY `noticia_id_autor_2a4a62ce_fk_vecino_id_vecino` (`id_autor`),
  CONSTRAINT `noticia_id_autor_2a4a62ce_fk_vecino_id_vecino` FOREIGN KEY (`id_autor`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `presupuesto_clp` decimal(12,2) NOT NULL,
  `documento_adj` varchar(255) DEFAULT NULL,
  `fecha_postulacion` datetime(6) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `comentarios_directorio` longtext DEFAULT NULL,
  `id_vecino` int(11) NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `proyecto_id_vecino_f1a04d96_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `proyecto_id_vecino_f1a04d96_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.recaudacion
CREATE TABLE IF NOT EXISTS `recaudacion` (
  `id_recaudacion` int(11) NOT NULL AUTO_INCREMENT,
  `monto_objetivo` decimal(12,2) DEFAULT NULL,
  `monto_actual` decimal(12,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_inicio` datetime(6) DEFAULT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `abierta` tinyint(1) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  PRIMARY KEY (`id_recaudacion`),
  KEY `recaudacion_id_proyecto_51f542f3_fk_proyecto_id_proyecto` (`id_proyecto`),
  CONSTRAINT `recaudacion_id_proyecto_51f542f3_fk_proyecto_id_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time(6) NOT NULL,
  `hora_fin` time(6) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `id_espacio` int(11) NOT NULL,
  `id_vecino` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `reserva_id_espacio_7731036d_fk_espacio_id_espacio` (`id_espacio`),
  KEY `reserva_id_vecino_08f93d60_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `reserva_id_espacio_7731036d_fk_espacio_id_espacio` FOREIGN KEY (`id_espacio`) REFERENCES `espacio` (`id_espacio`),
  CONSTRAINT `reserva_id_vecino_08f93d60_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.solicitud
CREATE TABLE IF NOT EXISTS `solicitud` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(120) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `respuesta` longtext DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_actualizacion` datetime(6) NOT NULL,
  `id_vecino` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `solicitud_id_vecino_00fa5c28_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `solicitud_id_vecino_00fa5c28_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.transaccion_webpay
CREATE TABLE IF NOT EXISTS `transaccion_webpay` (
  `id_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `token_ws` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `buy_order` varchar(100) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `estado` varchar(15) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `id_recaudacion` int(11) NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `transaccion_webpay_id_recaudacion_bbc76090_fk_recaudaci` (`id_recaudacion`),
  CONSTRAINT `transaccion_webpay_id_recaudacion_bbc76090_fk_recaudaci` FOREIGN KEY (`id_recaudacion`) REFERENCES `recaudacion` (`id_recaudacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.vecino
CREATE TABLE IF NOT EXISTS `vecino` (
  `id_vecino` int(11) NOT NULL AUTO_INCREMENT,
  `run` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vecino`),
  UNIQUE KEY `run` (`run`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `vecino_id_rol_8b179e59_fk_rol_id_rol` (`id_rol`),
  CONSTRAINT `vecino_id_rol_8b179e59_fk_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `vecino_user_id_12a3c686_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.votacion
CREATE TABLE IF NOT EXISTS `votacion` (
  `id_votacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `fecha_inicio` datetime(6) NOT NULL,
  `fecha_fin` datetime(6) DEFAULT NULL,
  `activa` tinyint(1) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  PRIMARY KEY (`id_votacion`),
  KEY `votacion_id_proyecto_8fb470f8_fk_proyecto_id_proyecto` (`id_proyecto`),
  CONSTRAINT `votacion_id_proyecto_8fb470f8_fk_proyecto_id_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table comunidad_vecinal.voto
CREATE TABLE IF NOT EXISTS `voto` (
  `id_voto` int(11) NOT NULL AUTO_INCREMENT,
  `voto` varchar(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_vecino` int(11) DEFAULT NULL,
  `id_votacion` int(11) NOT NULL,
  PRIMARY KEY (`id_voto`),
  UNIQUE KEY `voto_id_votacion_id_vecino_a066cc9a_uniq` (`id_votacion`,`id_vecino`),
  KEY `voto_id_proyecto_f8ea598d_fk_proyecto_id_proyecto` (`id_proyecto`),
  KEY `voto_id_vecino_7aa06414_fk_vecino_id_vecino` (`id_vecino`),
  CONSTRAINT `voto_id_proyecto_f8ea598d_fk_proyecto_id_proyecto` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`),
  CONSTRAINT `voto_id_vecino_7aa06414_fk_vecino_id_vecino` FOREIGN KEY (`id_vecino`) REFERENCES `vecino` (`id_vecino`),
  CONSTRAINT `voto_id_votacion_5a1afbe5_fk_votacion_id_votacion` FOREIGN KEY (`id_votacion`) REFERENCES `votacion` (`id_votacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
