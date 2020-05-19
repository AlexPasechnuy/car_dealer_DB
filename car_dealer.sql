-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 19 2020 г., 21:02
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `car_dealer`
--

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_report` (IN `rep_ord_id` INT, IN `myVIN` BIGINT, IN `myInfo` TEXT, IN `my_employee_username` VARCHAR(15))  BEGIN
INSERT INTO repair_report(vin, repair_date, employee_username, repair_info)
VALUES(myVIN, NOW(), my_employee_username, myInfo);

DELETE FROM repair_order
WHERE repair_order_id = rep_ord_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sell_car` (IN `sell_ord_id` INT)  BEGIN

UPDATE car
SET sold = 1
WHERE vin IN (SELECT vin from sell_order WHERE sell_order_id = sell_ord_id);

DELETE FROM sell_order
WHERE sell_order_id = sell_ord_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_equip` (IN `car_id` INT, IN `eq_id` INT)  BEGIN
UPDATE car SET climat_type = (SELECT climat_type FROM equip_template WHERE equip_id  = eq_id),
equip_id = eq_id,
climat_type = (SELECT climat_type FROM equip_template WHERE equip_id  = eq_id),
start_stop = (SELECT start_stop FROM equip_template WHERE equip_id  = eq_id),
bluetooth = (SELECT bluetooth FROM equip_template WHERE equip_id  = eq_id),
gps = (SELECT gps FROM equip_template WHERE equip_id  = eq_id),
lights_type = (SELECT lights_type FROM equip_template WHERE equip_id  = eq_id),
steer_wheel_heat = (SELECT steer_wheel_heat FROM equip_template WHERE equip_id  = eq_id),
seats_heat = (SELECT seats_heat FROM equip_template WHERE equip_id  = eq_id),
abs = (SELECT abs FROM equip_template WHERE equip_id  = eq_id),
esp = (SELECT esp FROM equip_template WHERE equip_id  = eq_id)
WHERE VIN = car_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `vin` bigint(11) NOT NULL,
  `del_lot_id` int(11) NOT NULL,
  `equip_id` int(11) DEFAULT NULL,
  `car_model_id` int(11) NOT NULL,
  `engine_vol` decimal(10,0) DEFAULT NULL,
  `engine_power` int(11) NOT NULL,
  `mixed_fuel_consumption` decimal(10,0) DEFAULT NULL,
  `transmission_type` enum('mechanic','automatic') NOT NULL,
  `climat_type` enum('conditioner','climat_control') DEFAULT NULL,
  `start_stop` bit(1) NOT NULL DEFAULT b'0',
  `bluetooth` bit(1) NOT NULL DEFAULT b'0',
  `gps` bit(1) NOT NULL DEFAULT b'0',
  `lights_type` enum('halogen','xenon','LED') NOT NULL DEFAULT 'halogen',
  `steer_wheel_heat` bit(1) NOT NULL DEFAULT b'0',
  `seats_heat` bit(1) NOT NULL DEFAULT b'0',
  `abs` bit(1) NOT NULL DEFAULT b'0',
  `esp` bit(1) NOT NULL DEFAULT b'0',
  `price` int(11) DEFAULT NULL,
  `car_info` text DEFAULT '',
  `colour` varchar(20) NOT NULL,
  `sold` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`vin`, `del_lot_id`, `equip_id`, `car_model_id`, `engine_vol`, `engine_power`, `mixed_fuel_consumption`, `transmission_type`, `climat_type`, `start_stop`, `bluetooth`, `gps`, `lights_type`, `steer_wheel_heat`, `seats_heat`, `abs`, `esp`, `price`, `car_info`, `colour`, `sold`) VALUES
(1417139852, 1, NULL, 5, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 43000, '', 'white', b'0'),
(1417139952, 1, 1, 4, '1', 120, '7', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 17250, '', 'white', b'0'),
(1417817985, 1, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, '', 'white', b'0'),
(1417862198, 1, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, '', 'white', b'0'),
(1417865139, 1, NULL, 7, '3', 230, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 45000, '', 'white', b'1'),
(1417865140, 1, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, '', 'white', b'0'),
(1417867591, 1, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, '', 'white', b'0'),
(1417869436, 1, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '', 'white', b'0'),
(1417869437, 1, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '', 'white', b'0'),
(4657139852, 2, NULL, 5, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 43000, '', 'white', b'0'),
(4657817985, 2, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, '', 'white', b'0'),
(4657862197, 2, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, '', 'white', b'0'),
(4657865140, 2, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, '', 'white', b'0'),
(4657867591, 2, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, '', 'white', b'0'),
(4657869436, 2, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '', 'white', b'0'),
(4657869437, 2, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '', 'white', b'0'),
(9877817985, 3, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, '', 'white', b'0'),
(9877862197, 3, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, '', 'white', b'0'),
(9877862198, 3, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, '', 'white', b'0'),
(9877865139, 3, NULL, 7, '3', 230, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 45000, '', 'white', b'0'),
(9877865140, 3, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, '', 'white', b'0'),
(9877867591, 3, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, '', 'white', b'0'),
(9877869436, 3, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '', 'white', b'0');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `car_info`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `car_info` (
`vin` bigint(11)
,`del_lot_id` int(11)
,`equip_id` int(11)
,`car_model_id` int(11)
,`engine_vol` decimal(10,0)
,`engine_power` int(11)
,`mixed_fuel_consumption` decimal(10,0)
,`transmission_type` enum('mechanic','automatic')
,`climat_type` enum('conditioner','climat_control')
,`start_stop` bit(1)
,`bluetooth` bit(1)
,`gps` bit(1)
,`lights_type` enum('halogen','xenon','LED')
,`steer_wheel_heat` bit(1)
,`seats_heat` bit(1)
,`abs` bit(1)
,`esp` bit(1)
,`price` int(11)
,`car_info` text
,`colour` varchar(20)
,`sold` bit(1)
,`car_make_name` varchar(15)
,`car_model_name` varchar(20)
,`length` int(11)
,`width` int(11)
,`height` int(11)
,`weight` int(11)
,`car_model_info` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `car_make`
--

CREATE TABLE `car_make` (
  `car_make_id` int(11) NOT NULL,
  `car_make_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car_make`
--

INSERT INTO `car_make` (`car_make_id`, `car_make_name`) VALUES
(1, 'Ford'),
(2, 'BMW'),
(3, 'Chevrolet'),
(4, 'Mazda');

-- --------------------------------------------------------

--
-- Структура таблицы `car_model`
--

CREATE TABLE `car_model` (
  `car_model_id` int(11) NOT NULL,
  `car_make_id` int(11) NOT NULL,
  `car_model_name` varchar(20) NOT NULL,
  `length` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `car_model_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car_model`
--

INSERT INTO `car_model` (`car_model_id`, `car_make_id`, `car_model_name`, `length`, `width`, `height`, `weight`, `car_model_info`) VALUES
(1, 1, 'Kuga', 4542, 1838, 1685, 1586, NULL),
(2, 1, 'Focus', 4378, 1825, 1454, 1364, 'Catalog: https://fordcms.blob.core.windows.net/media/Ukraine/%D0%86%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D1%96%D1%8F/FOCUS_19MY_V2_EDM_UKR_UA_EBRO_DP.pdf\nPrice-list: https://fordcms.blob.core.windows.net/media/Ukraine/Price%206.04/FOCUS%20NEW_2019%20%D1%80%D1%96%D0%BA%20%D0%B2%D0%B8%D1%80%D0%BE%D0%B1%D0%BD%D0%B8%D1%86%D1%82%D0%B2%D0%B0%20(%D0%B4%D0%BE%2020.10.2019%20%D0%B2%D0%B8%D1%80%D0%BE%D0%B1%D0%BD%D0%B8%D1%86%D1%82%D0%B2%D0%BE)-1.pdf'),
(3, 1, 'Fiesta', 4040, 1734, 1483, 1232, 'Catalog: https://fordcms.blob.core.windows.net/media/Ukraine/%D0%86%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D1%96%D1%8F/Fiesta_2019MY_EDM_UKR_eBrochure.pdf'),
(4, 1, 'EcoSport', 4096, 1765, 1645, 1263, NULL),
(5, 1, 'Mustang', 4784, 1916, 1381, 1655, NULL),
(6, 1, 'Edge', 4778, 1928, 1742, 1774, NULL),
(7, 1, 'Mondeo', 4871, 1852, 1482, 1394, 'Catalog: https://fordcms.blob.core.windows.net/media/Ukraine/%D0%86%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D1%96%D1%8F/Mondeo_19.5MY_UKR_eBrochure.pdf\nPrice-list: https://fordcms.blob.core.windows.net/media/Ukraine/Price%20scecial%20offer/MONDEO%20NEW_2019%20%D1%80%D1%96%D0%BA%20%D0%B2%D0%B8%D1%80%D0%BE%D0%B1%D0%BD%D0%B8%D1%86%D1%82%D0%B2%D0%B0.pdf'),
(8, 1, 'Ranger', 5362, 1860, 1815, 2014, NULL),
(9, 2, '1 series', 4319, 1799, 1434, 1430, NULL),
(10, 2, '2 series', 4432, 1774, 1418, 1380, NULL),
(11, 2, '3 series', 4709, 1827, 1442, 1450, NULL),
(12, 2, '4 series', 4640, 1825, 1377, 1425, NULL),
(13, 2, '5 series', 4936, 1868, 1479, 1560, NULL),
(14, 2, '6 series', 4894, 1894, 1369, 1660, NULL),
(15, 2, '7 series', 5260, 1902, 1479, 2085, NULL),
(16, 2, '8 series', 4843, 1902, 1341, 1785, NULL),
(17, 2, 'X1', 4447, 1821, 1598, 1515, NULL),
(18, 2, 'X2', 4360, 1824, 1526, 1535, NULL),
(19, 2, 'X3', 4708, 1891, 1676, 1820, NULL),
(20, 2, 'X4', 4752, 1918, 1621, 1755, NULL),
(21, 2, 'X5', 4922, 2004, 1745, 2060, NULL),
(22, 2, 'X6', 4935, 2004, 1696, 2260, NULL),
(23, 2, 'X7', 5151, 2000, 1805, 2320, NULL),
(24, 3, 'Aveo', 4039, 1735, 1517, 1035, NULL),
(25, 3, 'Spark', 3635, 1595, 1483, 1019, NULL),
(26, 3, 'Bolt', 4166, 1765, 1595, 1616, NULL),
(27, 3, 'Cruze', 4666, 1791, 1458, 1324, NULL),
(28, 3, 'Malibu', 4933, 1854, 1455, 1422, NULL),
(29, 3, 'Camaro', 4783, 1897, 1349, 1520, NULL),
(30, 3, 'Trax', 4257, 1775, 1676, 1380, NULL),
(31, 4, 'Mazda3', 4460, 1795, 1435, 1324, NULL),
(32, 4, 'Mazda6', 4870, 1840, 1450, 1487, NULL),
(33, 4, 'CX-3', 4275, 1765, 1535, 1250, NULL),
(34, 4, 'CX-30', 4395, 1795, 1540, 1400, NULL),
(35, 4, 'CX-5', 4550, 1925, 1675, 1512, NULL),
(36, 4, 'CX-9', 5075, 1969, 1747, 1960, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_lot`
--

CREATE TABLE `delivery_lot` (
  `del_lot_id` int(11) NOT NULL,
  `expected_arrival_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('waiting for delivery','on the way','delivered') NOT NULL,
  `factory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `delivery_lot`
--

INSERT INTO `delivery_lot` (`del_lot_id`, `expected_arrival_date`, `status`, `factory_id`) VALUES
(1, '2020-05-14 21:00:00', 'delivered', 3),
(2, '2020-06-04 21:00:00', 'on the way', 4),
(3, '2020-06-24 21:00:00', 'waiting for delivery', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(15) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `position` enum('sales_manager','supply_manager','HR_manager','mechanic','admin') NOT NULL,
  `salary` int(11) NOT NULL,
  `birth_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `enroll_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`username`, `password`, `name`, `surname`, `position`, `salary`, `birth_date`, `enroll_date`, `phone`, `email`) VALUES
('a_andreev', 'aj763if8', 'Alex', 'Andreev', 'admin', 1500, '2020-05-18 17:36:18', '2020-04-14 21:00:00', '+380687593159', 'alandr@gmail.com'),
('n_durov', '15akpo85', 'Nazar', 'Durov', 'mechanic', 1100, '1982-04-15 21:00:00', '2016-07-14 21:00:00', '+380661782396', 'nazdur@gmail.com'),
('n_shemenev', 'o48hj9q3', 'Nickolai', 'Shemenev', 'sales_manager', 1500, '2020-05-14 13:48:47', '2017-03-14 22:00:00', '+380687593167', 'nickshem@gmail.com'),
('o_mironov', 'o48hj9q3', 'Oleg', 'Mironov', 'supply_manager', 2700, '1990-07-18 21:00:00', '2015-07-27 21:00:00', '+380509472036', 'mironov@gmail.com'),
('s_kurkin', 'hd136yj7', 'Sergey', 'Kurkin', 'mechanic', 1250, '1970-11-12 22:00:00', '2017-11-24 22:00:00', '+380634775975', 'serkur@gmail.com'),
('v_mihailov', 'sq26tj87', 'Viktor', 'Mihailov', 'sales_manager', 1300, '2020-05-14 13:48:47', '2018-08-16 21:00:00', '+380997348394', 'vikmih@gmail.com'),
('v_nick', 'f97g531s', 'Vicktoriya', 'Nickolayeva', 'HR_manager', 2300, '1993-08-26 21:00:00', '2017-02-16 22:00:00', '+380504693145', 'vicknick@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `equip_template`
--

CREATE TABLE `equip_template` (
  `equip_id` int(11) NOT NULL,
  `equip_name` varchar(15) DEFAULT NULL,
  `car_make_id` int(11) NOT NULL,
  `climat_type` enum('conditioner','climat_control') NOT NULL,
  `start_stop` tinyint(4) NOT NULL,
  `bluetooth` tinyint(4) NOT NULL,
  `gps` tinyint(4) NOT NULL,
  `lights_type` enum('halogen','xenon','LED') NOT NULL,
  `steer_wheel_heat` tinyint(4) NOT NULL,
  `seats_heat` tinyint(4) NOT NULL,
  `abs` tinyint(4) NOT NULL,
  `esp` tinyint(4) NOT NULL,
  `equip_temp_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `equip_template`
--

INSERT INTO `equip_template` (`equip_id`, `equip_name`, `car_make_id`, `climat_type`, `start_stop`, `bluetooth`, `gps`, `lights_type`, `steer_wheel_heat`, `seats_heat`, `abs`, `esp`, `equip_temp_info`) VALUES
(1, 'Trend', 1, 'conditioner', 0, 1, 0, 'halogen', 0, 0, 1, 1, 'SYNC 2 audio system'),
(2, 'Titanium', 1, 'climat_control', 1, 1, 0, 'halogen', 0, 1, 1, 1, '16\' wheels, SYNC 3 audio system'),
(3, 'Vignale', 1, 'climat_control', 1, 1, 1, 'xenon', 1, 1, 1, 1, 'B&O PLAY audio system, leather saloon'),
(4, 'ST-Line', 1, 'climat_control', 1, 1, 1, 'LED', 1, 1, 1, 1, 'Aerodynamic body kit, sport seats');

-- --------------------------------------------------------

--
-- Структура таблицы `factory`
--

CREATE TABLE `factory` (
  `factory_id` int(11) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(20) NOT NULL,
  `car_make_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `factory`
--

INSERT INTO `factory` (`factory_id`, `country`, `city`, `car_make_id`) VALUES
(1, 'Germany', 'Cologne', 1),
(2, 'Germany', 'Rheine', 1),
(3, 'Belarus', 'Abchak', 1),
(4, 'Spain', 'Almussafes', 1),
(5, 'Romania', 'Craiova', 1),
(6, 'Great Britain', 'London', 1),
(7, 'Italy', 'Rome', 1),
(8, 'Germany', 'Munich', 2),
(9, 'Germany', 'Dingolfing', 2),
(10, 'Germany', 'Landshut', 2),
(11, 'Germany', 'Landshut', 2),
(12, 'Belgium', 'Vilvoorde', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `repair_order`
--

CREATE TABLE `repair_order` (
  `repair_order_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `client_name` varchar(15) NOT NULL,
  `client_surname` varchar(15) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `employee_username` varchar(15) NOT NULL,
  `repair_order_info` text DEFAULT NULL,
  `car_model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `repair_order`
--

INSERT INTO `repair_order` (`repair_order_id`, `time`, `client_name`, `client_surname`, `client_phone`, `employee_username`, `repair_order_info`, `car_model_id`) VALUES
(1, '2020-05-17 12:30:00', 'Ivan', 'Ivanov', '+380999999999', 'n_durov', 'Problems with engine', 3),
(2, '2020-05-18 09:30:00', 'Nickolay', 'Nickolaiev', '+380666666666', 's_kurkin', 'knocking in the suspension', 5),
(4, '2020-05-24 14:30:00', 'Oleg', 'Olegov', '+38077777777777', 'n_durov', 'Oil leak', 7),
(7, '2020-05-18 11:30:00', 'Nastya', 'Nastya', '+380664894127', 'n_durov', 'Problems', 3),
(8, '2020-05-19 09:30:00', 'Vasya', 'Pupkin', '+380664894127', 'n_durov', 'Problems', 4),
(9, '2020-05-19 09:30:00', 'Vasya', 'Pupkin', '+380664894127', 'n_durov', 'Problems', 5),
(10, '2020-05-19 09:30:00', 'Vasya', 'Pupkin', '+380664894127', 'n_durov', 'Problems', 6),
(11, '0000-00-00 00:00:00', 'Added', 'Report', '+380649436712', 'n_durov', 'Order added from app', 5),
(12, '0000-00-00 00:00:00', 'Second', 'Added', '+380852314965', 'n_durov', 'Second added from app', 2),
(13, '2020-05-23 05:30:00', 'Third', 'Added', '+380649436712', 'n_durov', 'Third added in the app', 1),
(14, '2020-05-20 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(15, '2020-05-20 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(16, '2020-05-20 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(17, '2020-05-20 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(18, '2020-05-20 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(19, '2020-05-20 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(20, '2020-05-20 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(21, '2020-05-20 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(22, '2020-05-21 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(23, '2020-05-21 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(24, '2020-05-21 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(25, '2020-05-21 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(26, '2020-05-21 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(27, '2020-05-21 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(28, '2020-05-21 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(29, '2020-05-21 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(30, '2020-05-22 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(31, '2020-05-22 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(32, '2020-05-22 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(33, '2020-05-22 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(34, '2020-05-22 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(35, '2020-05-22 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(36, '2020-05-22 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(37, '2020-05-22 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(38, '2020-05-23 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(39, '2020-05-23 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(40, '2020-05-23 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(41, '2020-05-23 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(42, '2020-05-23 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(43, '2020-05-23 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(44, '2020-05-23 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(45, '2020-05-23 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(46, '2020-05-24 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(47, '2020-05-24 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(48, '2020-05-24 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(49, '2020-05-24 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(50, '2020-05-24 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(51, '2020-05-24 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(52, '2020-05-24 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(53, '2020-05-24 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(54, '2020-05-25 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(55, '2020-05-25 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(56, '2020-05-25 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(57, '2020-05-25 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(58, '2020-05-25 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(59, '2020-05-25 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(60, '2020-05-25 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(61, '2020-05-25 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(62, '2020-05-26 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(63, '2020-05-26 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(64, '2020-05-26 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(65, '2020-05-26 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(66, '2020-05-26 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(67, '2020-05-26 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(68, '2020-05-26 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(69, '2020-05-26 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(70, '2020-05-27 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(71, '2020-05-27 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(72, '2020-05-27 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(73, '2020-05-27 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(74, '2020-05-27 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(75, '2020-05-27 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(76, '2020-05-27 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(77, '2020-05-27 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(78, '2020-05-28 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(79, '2020-05-28 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(80, '2020-05-28 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(81, '2020-05-28 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(82, '2020-05-28 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(83, '2020-05-28 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(84, '2020-05-28 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(85, '2020-05-28 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7),
(86, '2020-05-29 12:30:00', 'Alex', 'Alexov', '+380667531985', 'n_durov', 'Problems with engine sound', 3),
(87, '2020-05-29 13:30:00', 'Viktor', 'Ulianov', '+380723531985', 'n_durov', 'Problems with sound system', 2),
(88, '2020-05-29 14:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 'n_durov', 'No problems with engine sound', 5),
(89, '2020-05-29 15:00:00', 'Sasha', 'Beliy', '+380676331985', 'n_durov', 'Car is not shoot-resist', 7),
(90, '2020-05-29 11:30:00', 'Alex', 'Alexov', '+380667531985', 's_kurkin', 'Problems with engine sound', 3),
(91, '2020-05-29 12:30:00', 'Viktor', 'Ulianov', '+380723531985', 's_kurkin', 'Problems with sound system', 2),
(92, '2020-05-29 13:30:00', 'Dmitriy', 'Shtorkin', '+380676331985', 's_kurkin', 'No problems with engine sound', 5),
(93, '2020-05-29 14:00:00', 'Sasha', 'Beliy', '+380676331985', 's_kurkin', 'Car is not shoot-resist', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `repair_report`
--

CREATE TABLE `repair_report` (
  `repair_id` int(11) NOT NULL,
  `vin` bigint(11) NOT NULL,
  `repair_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `employee_username` varchar(15) NOT NULL,
  `repair_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `repair_report`
--

INSERT INTO `repair_report` (`repair_id`, `vin`, `repair_date`, `employee_username`, `repair_info`) VALUES
(1, 1417817985, '2020-05-18 14:43:59', 'n_durov', 'Break liquid changed'),
(2, 1417817985, '2020-05-18 14:44:08', 'n_durov', 'Break liquid changed'),
(3, 1417817985, '2020-05-18 14:45:17', 'n_durov', 'Break liquid changed'),
(4, 1417817985, '2020-05-18 15:04:40', 'n_durov', 'Second fix'),
(5, 1417817985, '2020-05-18 15:04:49', 'n_durov', 'Second fix'),
(6, 1417139952, '2020-05-18 15:13:33', 'n_durov', 'Third fx');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `rep_ord_info`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `rep_ord_info` (
`id` int(11)
,`client_phone` varchar(15)
,`client_name` varchar(31)
,`mechanic` varchar(15)
,`make` varchar(15)
,`model` varchar(20)
,`date` date
,`time` time
,`info` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `sell_order`
--

CREATE TABLE `sell_order` (
  `sell_order_id` int(11) NOT NULL,
  `vin` bigint(11) NOT NULL,
  `client_name` varchar(15) NOT NULL,
  `client_surname` varchar(15) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `employee_username` varchar(15) NOT NULL,
  `sell_order_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sell_order`
--

INSERT INTO `sell_order` (`sell_order_id`, `vin`, `client_name`, `client_surname`, `client_phone`, `employee_username`, `sell_order_info`) VALUES
(1, 1417139852, 'Viktor', 'Kadyrov', '+380111111111', 'n_shemenev', '500$ discount'),
(2, 1417139952, 'Alexey', 'Putin', '+380123456789', 'v_mihailov', '+ winter tires'),
(4, 1417862198, 'Anastasiya', 'Korobova', '+380899705632', 'v_mihailov', ''),
(6, 1417865140, 'Nazar', 'Vekovoi', '+380799657715', 'v_mihailov', ''),
(7, 1417867591, 'Olga', 'Kyrychenko', '+380706616901', 'n_shemenev', ''),
(8, 1417869436, 'Vika', 'Mikhaylova', '+380725125404', 'v_mihailov', ''),
(9, 9877867591, 'Albers', 'Einstein', '+380111111111', 'n_shemenev', 'Discount for great brain');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sell_ord_info`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sell_ord_info` (
`id` int(11)
,`vin` bigint(11)
,`make` varchar(15)
,`model` varchar(20)
,`price` int(11)
,`client_name` varchar(31)
,`client_phone` varchar(15)
,`employee_username` varchar(15)
,`info` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `supplies_info`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `supplies_info` (
`id` int(11)
,`make` varchar(15)
,`country` varchar(15)
,`city` varchar(20)
,`expected_arrival_date` date
,`status` enum('waiting for delivery','on the way','delivered')
);

-- --------------------------------------------------------

--
-- Структура для представления `car_info`
--
DROP TABLE IF EXISTS `car_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `car_info`  AS  select `car`.`vin` AS `vin`,`car`.`del_lot_id` AS `del_lot_id`,`car`.`equip_id` AS `equip_id`,`car`.`car_model_id` AS `car_model_id`,`car`.`engine_vol` AS `engine_vol`,`car`.`engine_power` AS `engine_power`,`car`.`mixed_fuel_consumption` AS `mixed_fuel_consumption`,`car`.`transmission_type` AS `transmission_type`,`car`.`climat_type` AS `climat_type`,`car`.`start_stop` AS `start_stop`,`car`.`bluetooth` AS `bluetooth`,`car`.`gps` AS `gps`,`car`.`lights_type` AS `lights_type`,`car`.`steer_wheel_heat` AS `steer_wheel_heat`,`car`.`seats_heat` AS `seats_heat`,`car`.`abs` AS `abs`,`car`.`esp` AS `esp`,`car`.`price` AS `price`,`car`.`car_info` AS `car_info`,`car`.`colour` AS `colour`,`car`.`sold` AS `sold`,`car_make`.`car_make_name` AS `car_make_name`,`car_model`.`car_model_name` AS `car_model_name`,`car_model`.`length` AS `length`,`car_model`.`width` AS `width`,`car_model`.`height` AS `height`,`car_model`.`weight` AS `weight`,`car_model`.`car_model_info` AS `car_model_info` from ((`car` join `car_model`) join `car_make`) where `car`.`car_model_id` = `car_model`.`car_model_id` and `car_model`.`car_make_id` = `car_make`.`car_make_id` order by `car`.`car_model_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `rep_ord_info`
--
DROP TABLE IF EXISTS `rep_ord_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rep_ord_info`  AS  select `repair_order`.`repair_order_id` AS `id`,`repair_order`.`client_phone` AS `client_phone`,concat(`repair_order`.`client_name`,' ',`repair_order`.`client_surname`) AS `client_name`,`repair_order`.`employee_username` AS `mechanic`,`car_make`.`car_make_name` AS `make`,`car_model`.`car_model_name` AS `model`,cast(`repair_order`.`time` as date) AS `date`,cast(`repair_order`.`time` as time) AS `time`,`repair_order`.`repair_order_info` AS `info` from ((`repair_order` join `car_make`) join `car_model`) where `car_model`.`car_model_id` = `repair_order`.`car_model_id` and `car_make`.`car_make_id` = `car_model`.`car_make_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `sell_ord_info`
--
DROP TABLE IF EXISTS `sell_ord_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sell_ord_info`  AS  select `sell_order`.`sell_order_id` AS `id`,`sell_order`.`vin` AS `vin`,`car_make`.`car_make_name` AS `make`,`car_model`.`car_model_name` AS `model`,`car`.`price` AS `price`,concat(`sell_order`.`client_name`,' ',`sell_order`.`client_surname`) AS `client_name`,`sell_order`.`client_phone` AS `client_phone`,`sell_order`.`employee_username` AS `employee_username`,`sell_order`.`sell_order_info` AS `info` from (((`sell_order` join `car`) join `car_make`) join `car_model`) where `sell_order`.`vin` = `car`.`vin` and `car`.`car_model_id` = `car_model`.`car_model_id` and `car_model`.`car_make_id` = `car_make`.`car_make_id` ;

-- --------------------------------------------------------

--
-- Структура для представления `supplies_info`
--
DROP TABLE IF EXISTS `supplies_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supplies_info`  AS  select `delivery_lot`.`del_lot_id` AS `id`,`car_make`.`car_make_name` AS `make`,`factory`.`country` AS `country`,`factory`.`city` AS `city`,cast(`delivery_lot`.`expected_arrival_date` as date) AS `expected_arrival_date`,`delivery_lot`.`status` AS `status` from ((`car_make` join `factory`) join `delivery_lot`) where `delivery_lot`.`factory_id` = `factory`.`factory_id` and `factory`.`car_make_id` = `car_make`.`car_make_id` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `equip_id` (`equip_id`),
  ADD KEY `del_lot_id` (`del_lot_id`),
  ADD KEY `car_model_id` (`car_model_id`);

--
-- Индексы таблицы `car_make`
--
ALTER TABLE `car_make`
  ADD PRIMARY KEY (`car_make_id`);

--
-- Индексы таблицы `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`car_model_id`),
  ADD KEY `car_make_id` (`car_make_id`);

--
-- Индексы таблицы `delivery_lot`
--
ALTER TABLE `delivery_lot`
  ADD PRIMARY KEY (`del_lot_id`),
  ADD KEY `factory_id` (`factory_id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`username`);

--
-- Индексы таблицы `equip_template`
--
ALTER TABLE `equip_template`
  ADD PRIMARY KEY (`equip_id`),
  ADD KEY `car_make_id` (`car_make_id`);

--
-- Индексы таблицы `factory`
--
ALTER TABLE `factory`
  ADD PRIMARY KEY (`factory_id`),
  ADD KEY `car_make_id` (`car_make_id`);

--
-- Индексы таблицы `repair_order`
--
ALTER TABLE `repair_order`
  ADD PRIMARY KEY (`repair_order_id`),
  ADD KEY `employee_username` (`employee_username`),
  ADD KEY `car_model_id` (`car_model_id`);

--
-- Индексы таблицы `repair_report`
--
ALTER TABLE `repair_report`
  ADD PRIMARY KEY (`repair_id`),
  ADD KEY `employee_username` (`employee_username`);

--
-- Индексы таблицы `sell_order`
--
ALTER TABLE `sell_order`
  ADD PRIMARY KEY (`sell_order_id`),
  ADD KEY `vin` (`vin`),
  ADD KEY `employee_username` (`employee_username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `car_make`
--
ALTER TABLE `car_make`
  MODIFY `car_make_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `car_model`
--
ALTER TABLE `car_model`
  MODIFY `car_model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `delivery_lot`
--
ALTER TABLE `delivery_lot`
  MODIFY `del_lot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `equip_template`
--
ALTER TABLE `equip_template`
  MODIFY `equip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `factory`
--
ALTER TABLE `factory`
  MODIFY `factory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `repair_order`
--
ALTER TABLE `repair_order`
  MODIFY `repair_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT для таблицы `repair_report`
--
ALTER TABLE `repair_report`
  MODIFY `repair_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `sell_order`
--
ALTER TABLE `sell_order`
  MODIFY `sell_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`equip_id`) REFERENCES `equip_template` (`equip_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`del_lot_id`) REFERENCES `delivery_lot` (`del_lot_id`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`car_model_id`);

--
-- Ограничения внешнего ключа таблицы `car_model`
--
ALTER TABLE `car_model`
  ADD CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`car_make_id`) REFERENCES `car_make` (`car_make_id`);

--
-- Ограничения внешнего ключа таблицы `delivery_lot`
--
ALTER TABLE `delivery_lot`
  ADD CONSTRAINT `delivery_lot_ibfk_1` FOREIGN KEY (`factory_id`) REFERENCES `factory` (`factory_id`);

--
-- Ограничения внешнего ключа таблицы `equip_template`
--
ALTER TABLE `equip_template`
  ADD CONSTRAINT `equip_template_ibfk_1` FOREIGN KEY (`car_make_id`) REFERENCES `car_make` (`car_make_id`);

--
-- Ограничения внешнего ключа таблицы `factory`
--
ALTER TABLE `factory`
  ADD CONSTRAINT `factory_ibfk_1` FOREIGN KEY (`car_make_id`) REFERENCES `car_make` (`car_make_id`);

--
-- Ограничения внешнего ключа таблицы `repair_order`
--
ALTER TABLE `repair_order`
  ADD CONSTRAINT `repair_order_ibfk_1` FOREIGN KEY (`employee_username`) REFERENCES `employee` (`username`),
  ADD CONSTRAINT `repair_order_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`car_model_id`);

--
-- Ограничения внешнего ключа таблицы `repair_report`
--
ALTER TABLE `repair_report`
  ADD CONSTRAINT `repair_report_ibfk_1` FOREIGN KEY (`employee_username`) REFERENCES `employee` (`username`);

--
-- Ограничения внешнего ключа таблицы `sell_order`
--
ALTER TABLE `sell_order`
  ADD CONSTRAINT `sell_order_ibfk_1` FOREIGN KEY (`vin`) REFERENCES `car` (`vin`),
  ADD CONSTRAINT `sell_order_ibfk_2` FOREIGN KEY (`employee_username`) REFERENCES `employee` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
