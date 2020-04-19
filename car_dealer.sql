-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 19 2020 г., 15:47
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

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `vin` int(11) NOT NULL,
  `del_lot_id` int(11) NOT NULL,
  `car_model_id` int(11) NOT NULL,
  `engine_vol` decimal(10,0) NOT NULL,
  `engine_power` int(11) NOT NULL,
  `mixed_fuel_consumption` decimal(10,0) NOT NULL,
  `transmission_type` enum('mechanic','automatic') NOT NULL,
  `climat_type` enum('conditioner','climat_control') NOT NULL,
  `start_stop` bit(1) NOT NULL,
  `bluetooth` bit(1) NOT NULL,
  `gps` bit(1) NOT NULL,
  `ligts_type` enum('halogen','xenon','LED') NOT NULL,
  `steer_wheel_heat` bit(1) NOT NULL,
  `seats_heat` bit(1) NOT NULL,
  `abs` bit(1) NOT NULL,
  `esp` bit(1) NOT NULL,
  `car_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `car_model`
--

INSERT INTO `car_model` (`car_model_id`, `car_make_id`, `car_model_name`, `length`, `width`, `height`, `weight`) VALUES
(1, 1, 'Kuga', 4542, 1838, 1685, 1586),
(2, 1, 'Focus', 4378, 1825, 1454, 1364),
(3, 1, 'Fiesta', 4040, 1734, 1483, 1232),
(4, 1, 'EcoSport', 4096, 1765, 1645, 1263),
(5, 1, 'Mustang', 4784, 1916, 1381, 1655),
(6, 1, 'Edge', 4778, 1928, 1742, 1774),
(7, 1, 'Mondeo', 4871, 1852, 1482, 1394),
(8, 1, 'Ranger', 5362, 1860, 1815, 2014),
(9, 2, '1 series', 4319, 1799, 1434, 1430),
(10, 2, '2 series', 4432, 1774, 1418, 1380),
(11, 2, '3 series', 4709, 1827, 1442, 1450),
(12, 2, '4 series', 4640, 1825, 1377, 1425),
(13, 2, '5 series', 4936, 1868, 1479, 1560),
(14, 2, '6 series', 4894, 1894, 1369, 1660),
(15, 2, '7 series', 5260, 1902, 1479, 2085),
(16, 2, '8 series', 4843, 1902, 1341, 1785),
(17, 2, 'X1', 4447, 1821, 1598, 1515),
(18, 2, 'X2', 4360, 1824, 1526, 1535),
(19, 2, 'X3', 4708, 1891, 1676, 1820),
(20, 2, 'X4', 4752, 1918, 1621, 1755),
(21, 2, 'X5', 4922, 2004, 1745, 2060),
(22, 2, 'X6', 4935, 2004, 1696, 2260),
(23, 2, 'X7', 5151, 2000, 1805, 2320),
(24, 3, 'Aveo', 4039, 1735, 1517, 1035),
(25, 3, 'Spark', 3635, 1595, 1483, 1019),
(26, 3, 'Bolt', 4166, 1765, 1595, 1616),
(27, 3, 'Cruze', 4666, 1791, 1458, 1324),
(28, 3, 'Malibu', 4933, 1854, 1455, 1422),
(29, 3, 'Camaro', 4783, 1897, 1349, 1520),
(30, 3, 'Trax', 4257, 1775, 1676, 1380),
(31, 4, 'Mazda3', 4460, 1795, 1435, 1324),
(32, 4, 'Mazda6', 4870, 1840, 1450, 1487),
(33, 4, 'CX-3', 4275, 1765, 1535, 1250),
(34, 4, 'CX-30', 4395, 1795, 1540, 1400),
(35, 4, 'CX-5', 4550, 1925, 1675, 1512),
(36, 4, 'CX-9', 5075, 1969, 1747, 1960);

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_lot`
--

CREATE TABLE `delivery_lot` (
  `del_lot_id` int(11) NOT NULL,
  `arrival_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('waiting','on the way','delivered') NOT NULL,
  `factory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `enroll_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `equip_template`
--

CREATE TABLE `equip_template` (
  `equip_id` int(11) NOT NULL,
  `equip_name` varchar(15) DEFAULT NULL,
  `car_make_id` int(11) NOT NULL,
  `climat_type` enum('conditioner','climat_control') NOT NULL,
  `start_stop` bit(1) NOT NULL,
  `bluetooth` bit(1) NOT NULL,
  `gps` bit(1) NOT NULL,
  `ligts_type` enum('halogen','xenon','LED') NOT NULL,
  `steer_wheel_heat` bit(1) NOT NULL,
  `seats_heat` bit(1) NOT NULL,
  `abs` bit(1) NOT NULL,
  `esp` bit(1) NOT NULL,
  `car_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `vin` int(11) NOT NULL,
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
  `vin` int(11) NOT NULL,
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
-- AUTO_INCREMENT для таблицы `car`
--
ALTER TABLE `car`
  MODIFY `vin` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `del_lot_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `equip_template`
--
ALTER TABLE `equip_template`
  MODIFY `equip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `factory`
--
ALTER TABLE `factory`
  MODIFY `factory_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`del_lot_id`) REFERENCES `delivery_lot` (`del_lot_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`car_model_id`) REFERENCES `car_model` (`car_model_id`);

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
