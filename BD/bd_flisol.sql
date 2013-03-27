-- phpMyAdmin SQL Dump
-- version 3.4.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-03-2013 a las 06:13:32
-- Versión del servidor: 5.0.96
-- Versión de PHP: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `flisol13_flisol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE IF NOT EXISTS `asignaciones` (
  `id` int(11) NOT NULL auto_increment,
  `encuesta_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `activo` tinyint(1) default '0',
  `fecha_inicio` date default NULL,
  `fecha_finalizacion` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_encuestas_has_encuestados_encuestas1_idx` (`encuesta_id`),
  KEY `fk_asignaciones_grupos1_idx` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE IF NOT EXISTS `encuestas` (
  `id` int(11) NOT NULL auto_increment,
  `encuesta_titulo` varchar(120) default NULL,
  `descripcion` text,
  `fecha_creacion` varchar(45) default NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_encuestas_usuarios1` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id`, `encuesta_titulo`, `descripcion`, `fecha_creacion`, `usuario_id`) VALUES
(1, 'ENCUESTA DIRIGIDA A UN PÚBLICO CON CONOCIMIENTOS BASICOS', 'Encuesta dirigida a un público con conocimientos básicos de software libre\r\n(Estudiantes, universitarios, egresados, empresarios, profesores, etc.)\r\n', '2013-3-26 12:02:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(11) NOT NULL auto_increment,
  `grupo_nombre` varchar(120) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `grupo_nombre`) VALUES
(1, 'Público en General'),
(2, 'Usuarios avanzados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscriptos`
--

CREATE TABLE IF NOT EXISTS `inscriptos` (
  `id` int(11) NOT NULL auto_increment,
  `dni` varchar(8) default NULL,
  `nombres` varchar(120) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `email` varchar(200) default NULL,
  `telefono` varchar(15) default NULL,
  `organizacion` varchar(225) default NULL,
  `fecha_registro` datetime default NULL,
  `certificado` tinyint(1) default NULL COMMENT '0 -> no quiere certificado\n1 -> con certificado',
  `asistencia` tinyint(1) default NULL COMMENT '0 -> no asistio\n1->asistio al evento',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE IF NOT EXISTS `opciones` (
  `id` int(11) NOT NULL auto_increment,
  `opcion_respuesta` varchar(300) default NULL,
  `pregunta_id` int(11) NOT NULL,
  `votos` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_opciones_preguntas1_idx` (`pregunta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`opcion_respuesta`, `pregunta_id`, `votos`) VALUES
('Si, es software sin limitaciones y no necesariamente gratuito.', 1, NULL),
('Si, es software con limitaciones y siempre gratuito.', 1, NULL),
('Si, es aquel cuya licencia permite usar el software para cualquier propÃ³sito excepto venderlo.', 1, NULL),
('No, conozco su existencia pero no sabrÃ­a definirlo.', 1, NULL),
('No', 1, NULL),
('No, nunca lo he usado.', 2, NULL),
('Si, he probado uno o mÃ¡s programas y aun los sigo usando.', 2, NULL),
('No, probÃ© uno o mÃ¡s programas y los dejÃ© de usar.', 2, NULL),
('No sabe.', 2, NULL),
('Si, porque se desarrolla y actualiza constantemente.', 3, NULL),
('Si, lo he probado y no he tenido problemas con Ã©l.', 3, NULL),
('No, lo he probado pero he tenido problemas con Ã©l.', 3, NULL),
('No, porque cualquier programador puede incluir cÃ³digo daÃ±ino.', 3, NULL),
('No sÃ©, aun no lo he probado.', 3, NULL),
('Totalmente de acuerdo.', 4, NULL),
('Bastante de acuerdo.', 4, NULL),
('De acuerdo.', 4, NULL),
('Poco de acuerdo.', 4, NULL),
('Totalmente en desacuerdo.', 4, NULL),
('No sabe.', 4, NULL),
('Totalmente de acuerdo.', 5, NULL),
('Bastante de acuerdo.', 5, NULL),
('De acuerdo.', 5, NULL),
('Poco de acuerdo.', 5, NULL),
('Totalmente en desacuerdo.', 5, NULL),
('No sabe.', 5, NULL),
('Totalmente de acuerdo.', 6, NULL),
('Bastante de acuerdo.', 6, NULL),
('De acuerdo.', 6, NULL),
('Poco de acuerdo.', 6, NULL),
('Totalmente en desacuerdo.', 6, NULL),
('No sabe.', 6, NULL),
('Totalmente de acuerdo.', 7, NULL),
('Bastante de acuerdo.', 7, NULL),
('De acuerdo.', 7, NULL),
('Poco de acuerdo.', 7, NULL),
('Totalmente en desacuerdo.', 7, NULL),
('No sabe.', 7, NULL),
('Prefiero los programas gratuitos, me da igual que sean libres o no.', 8, NULL),
('Prefiero los programas comerciales porque me dan mÃ¡s confianza.', 8, NULL),
('Prefiero los programas libres por la libertad de uso que te dan.', 8, NULL),
('Con ninguna de las anteriores.', 8, NULL),
('Si, si son compatibles.', 9, NULL),
('No, los programas comerciales me funcionan bien y no deseo cambiarlos.', 9, NULL),
('Si, solo uso software libre.', 9, NULL),
('No, los programas comerciales puedo conseguirlos gratis.', 9, NULL),
('No sabe', 9, NULL),
('Si, porque el uso de software libre reduce las ventas de programas.', 10, NULL),
('No, porque cada usuario utiliza uno u otro software segÃºn sus necesidades.', 10, NULL),
('No, porque el software libre reduce la copia ilegal del comercial.', 10, NULL),
('Si, porque crea una comunidad de usuarios que promociona su uso frente al software comercial.', 10, NULL),
('No, porque la existencia del software libre fomenta la competencia y la mejora del software comercial', 10, NULL),
('No sabe', 10, NULL),
('Si, la oferta actual es inferior a la demanda.', 11, NULL),
('No, la oferta actual es adecuada a la demanda.', 11, NULL),
('No, la oferta actual es superior a la demanda.', 11, NULL),
('No sabe', 11, NULL),
('Si, con bastante frecuencia.', 12, NULL),
('Si, en algunas ocasiones.', 12, NULL),
('No, no encuentro lo que busco.', 12, NULL),
('No, no suelo buscar', 12, NULL),
('No sabe', 12, NULL),
('Si', 13, NULL),
('No', 13, NULL),
('Hombre', 14, NULL),
('Mujer', 14, NULL),
('Menos de 15 aÃ±os', 15, NULL),
('Entre 15 y 24 aÃ±os', 15, NULL),
('Entre 25 y 35 aÃ±os', 15, NULL),
('Entre 36 y 50 aÃ±os', 15, NULL),
('Entre 51 y 65 aÃ±os', 15, NULL),
('MÃ¡s de 65 aÃ±os', 15, NULL),
('Windows', 16, NULL),
('Linux', 16, NULL),
('Mac OS', 16, NULL),
('Otro', 16, NULL),
('Internet Explorer', 17, NULL),
('Firefox', 17, NULL),
('Opera', 17, NULL),
('Safari', 17, NULL),
('Chrome', 17, NULL),
('Otro', 17, NULL),
('Estudiante', 18, NULL),
('Universitario', 18, NULL),
('Docente', 18, NULL),
('Empresario', 18, NULL),
('Otro', 18, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(11) NOT NULL auto_increment,
  `formulacion_pregunta` varchar(250) default NULL,
  `obligatoria` tinyint(1) default NULL,
  `encuesta_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_preguntas_encuestas_idx` (`encuesta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `formulacion_pregunta`, `obligatoria`, `encuesta_id`) VALUES
(1, '¿Sabes qué es el software libre?', 1, 1),
(2, '¿Usas software libre?', 1, 1),
(3, '¿El software libre te da confianza?', 1, 1),
(4, '¿El software libre suele tener menos funcionalidades que el comercial?', 1, 1),
(5, '¿El software libre es igual o más seguro que el resto de software?', 1, 1),
(6, '¿Hay ya suficiente soporte técnico y ayuda para el software libre?', 1, 1),
(7, '¿El software libre se actualiza con más frecuencia que el comercial?', 1, 1),
(8, '¿Con cuál de las siguientes afirmaciones te identificas más?', 1, 1),
(9, '¿Cambiarias programas comerciales (como Office o Photoshop) por alternativas gratuitas y similares?', 1, 1),
(10, '¿Crees que el software libre gratuito perjudica al software comercial?', 1, 1),
(11, '¿Consideras necesaria una mayor oferta formativa en herramientas basadas en software libre?', 1, 1),
(12, '¿Encuentras información y recursos sobre herramientas basadas en software libre en Internet?', 1, 1),
(13, '¿Sabías que todos los programas que utilizas en tu computadora tienen equivalentes en Software Libre?', 1, 1),
(14, '¿Cuál es su sexo?', 1, 1),
(15, '¿Qué edad tienes?', 1, 1),
(16, '¿Qué Sistema Operativo utilizas?', 1, 1),
(17, '¿Cuál es el Navegador que usas?', 1, 1),
(18, '¿Usted es?', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE IF NOT EXISTS `publicaciones` (
  `id` int(11) NOT NULL auto_increment,
  `titulo` varchar(120) NOT NULL,
  `descripcion` text,
  `imagen_portada` varchar(120) default NULL,
  `fecha_registro` datetime default NULL,
  `fecha_edicion` datetime default NULL,
  `etiquetas` varchar(225) default NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_publicaciones_usuarios1` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `titulo`, `descripcion`, `imagen_portada`, `fecha_registro`, `fecha_edicion`, `etiquetas`, `usuario_id`) VALUES
(1, 'SOBRE FLISOL', '<h4>&iquest;Qu&eacute; es el FLISOL?</h4>\r\n\r\n<p>El Festival Latinoamericano de Instalaci&oacute;n de Software Libre (FLISoL) es el evento de difusi&oacute;n de Software Libre m&aacute;s grande en Latinoam&eacute;rica. Se realiza desde el a&ntilde;o 2005 y desde el 2008 se adopt&oacute; su realizaci&oacute;n el 4to S&aacute;bado de abril de cada a&ntilde;o. Su principal objetivo es promover el uso del software libre, dando a conocer al p&uacute;blico en general su filosof&iacute;a, alcances, avances y desarrollo. A tal fin, las diversas comunidades locales de software libre (en cada pa&iacute;s/ciudad/localidad), organizan simult&aacute;neamente eventos en los que se instala, de manera gratuita y totalmente legal, software libre en las computadoras que llevan los asistentes.</p>\r\n\r\n<h4>&iquest;Qui&eacute;nes lo organizan?</h4>\r\n\r\n<p>El evento esta siendo organizado principalmente por la Comunidad de Software Libre BASADRINUX, sin embargo todas las universidades, comunidades de software libre, particulares interesados en el tema, etc., se encuentran cordialmente invitados a organizar y a formar parte del evento.</p>\r\n\r\n<h4>&iquest;A qui&eacute;n est&aacute; dirigido?</h4>\r\n\r\n<p>El evento est&aacute; dirigido a todo tipo de p&uacute;blico: estudiantes, acad&eacute;micos, empresarios, trabajadores, funcionarios p&uacute;blicos, entusiastas y a cualquier persona interesada en el tema de software libre.</p>\r\n\r\n<h4>&iquest;Cu&aacute;nto cuesta?</h4>\r\n\r\n<p>La asistencia y la participaci&oacute;n al evento es totalmente libre y gratuita.</p>\r\n\r\n<h4>&iquest;Qu&eacute; puedo aprender en el evento?</h4>\r\n\r\n<ul>\r\n	<li>Conocer&aacute; que es el software libre.</li>\r\n	<li>Tendr&aacute; la oportunidad de instalar software libre en su computadora personal.</li>\r\n	<li>Conocer&aacute; sobre la filosof&iacute;a, cultura y organizaci&oacute;n alrededor del software libre.</li>\r\n	<li>Conocer&aacute; sobre modelos de negocios de software libre.</li>\r\n	<li>Conocer&aacute; alternativas libres al software privativo tradicional.</li>\r\n</ul>\r\n\r\n<h4>&iquest;Que actividades se llevar&aacute;n a cabo en el evento?</h4>\r\n\r\n<ul>\r\n	<li>Podr&aacute; obtener CD&rsquo;s y DVD&rsquo;s con software libre en los stands dedicados a las Distribuciones GNU/Linux y Software Libre m&aacute;s populares.</li>\r\n	<li>Espacios donde los visitantes podr&aacute;n acercarse con sus computadoras personales a instalar software libre.</li>\r\n	<li>Ponencias sobre temas y proyectos relacionados al software libre.</li>\r\n	<li>Mesa de juegos libres multijugador.</li>\r\n	<li>Rifas de art&iacute;culos promocionales</li>\r\n</ul>\r\n', NULL, '2013-03-26 11:50:29', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(45) default NULL,
  `password` varchar(45) default NULL,
  `email` varchar(120) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `fk_encuestas_has_encuestados_encuestas1` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asignaciones_grupos1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD CONSTRAINT `fk_encuestas_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD CONSTRAINT `fk_opciones_preguntas1` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_preguntas_encuestas` FOREIGN KEY (`encuesta_id`) REFERENCES `encuestas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `fk_publicaciones_usuarios1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
