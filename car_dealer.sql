-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 07 2020 г., 15:06
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `car_info` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`vin`, `del_lot_id`, `equip_id`, `car_model_id`, `engine_vol`, `engine_power`, `mixed_fuel_consumption`, `transmission_type`, `climat_type`, `start_stop`, `bluetooth`, `gps`, `lights_type`, `steer_wheel_heat`, `seats_heat`, `abs`, `esp`, `price`, `car_info`) VALUES
(1417139852, 1, NULL, 5, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 43000, ''),
(1417139952, 1, 1, 4, '1', 120, '7', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 17250, ''),
(1417817985, 1, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, ''),
(1417862198, 1, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, ''),
(1417865139, 1, NULL, 7, '3', 230, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 45000, ''),
(1417865140, 1, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, ''),
(1417867591, 1, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, ''),
(1417869436, 1, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, ''),
(1417869437, 1, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, ''),
(4657139852, 2, NULL, 5, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 43000, ''),
(4657817985, 2, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, ''),
(4657862197, 2, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, ''),
(4657865140, 2, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, ''),
(4657867591, 2, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, ''),
(4657869436, 2, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, ''),
(4657869437, 2, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, ''),
(9877817985, 3, NULL, 6, '3', 250, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 50000, ''),
(9877862197, 3, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, ''),
(9877862198, 3, NULL, 2, '2', 120, '7', 'automatic', 'conditioner', b'0', b'0', b'0', 'halogen', b'0', b'0', b'1', b'1', 15120, ''),
(9877865139, 3, NULL, 7, '3', 230, '10', 'automatic', 'climat_control', b'1', b'1', b'1', 'LED', b'1', b'1', b'1', b'1', 45000, ''),
(9877865140, 3, NULL, 7, '2', 150, '8', 'automatic', 'climat_control', b'1', b'1', b'1', 'xenon', b'0', b'1', b'1', b'1', 27000, ''),
(9877867591, 3, NULL, 1, '2', 150, '8', 'mechanic', 'conditioner', b'1', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 20100, ''),
(9877869436, 3, NULL, 3, '1', 100, '5', 'automatic', 'conditioner', b'0', b'1', b'0', 'halogen', b'0', b'0', b'1', b'1', 12300, '');

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
('a_andreev', 'aj763if8', 'Alex', 'Andreev', 'admin', 1500, '2000-05-29 21:00:00', '2020-04-14 21:00:00', '+380687593159', 'alandr@gmail.com'),
('n_durov', '15akpo85', 'Nazar', 'Durov', 'mechanic', 1100, '1982-04-15 21:00:00', '2016-07-14 21:00:00', '+380661782396', 'nazdur@gmail.com'),
('n_shemenev', 'o48hj9q3', 'Nickolai', 'Shemenev', '', 1500, '1995-06-24 21:00:00', '2017-03-14 22:00:00', '+380687593167', 'nickshem@gmail.com'),
('o_mironov', 'o48hj9q3', 'Oleg', 'Mironov', 'supply_manager', 2700, '1990-07-18 21:00:00', '2015-07-27 21:00:00', '+380509472036', 'mironov@gmail.com'),
('s_kurkin', 'hd136yj7', 'Sergey', 'Kurkin', 'mechanic', 1250, '1970-11-12 22:00:00', '2017-11-24 22:00:00', '+380634775975', 'serkur@gmail.com'),
('v_mihailov', 'sq26tj87', 'Viktor', 'Mihailov', '', 1300, '1985-10-22 21:00:00', '2018-08-16 21:00:00', '+380997348394', 'vikmih@gmail.com'),
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
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_name` varchar(15) NOT NULL,
  `client_surname` varchar(15) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `employee_username` varchar(15) NOT NULL,
  `repair_order_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `employee_username` (`employee_username`);

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
  MODIFY `repair_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `repair_report`
--
ALTER TABLE `repair_report`
  MODIFY `repair_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sell_order`
--
ALTER TABLE `sell_order`
  MODIFY `sell_order_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `repair_order_ibfk_1` FOREIGN KEY (`employee_username`) REFERENCES `employee` (`username`);

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
