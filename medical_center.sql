-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 24 2019 г., 06:59
-- Версия сервера: 10.4.8-MariaDB
-- Версия PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `medical_center`
--

-- --------------------------------------------------------

--
-- Структура таблицы `d_agents`
--

CREATE TABLE `d_agents` (
  `ID` bigint(17) NOT NULL,
  `FIRSTNAME` varchar(40) NOT NULL,
  `SURNAME` varchar(40) NOT NULL,
  `LASTNAME` varchar(40) NOT NULL,
  `BIRTHDATE` date NOT NULL,
  `SEX` int(1) NOT NULL COMMENT '1 - мужской, 0 - женский'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `d_agents`
--

INSERT INTO `d_agents` (`ID`, `FIRSTNAME`, `SURNAME`, `LASTNAME`, `BIRTHDATE`, `SEX`) VALUES
(1, 'Иван', 'Иванов', 'Иванович', '2001-10-12', 1),
(2, 'Семен', 'Семенов', 'Семенович', '1999-12-12', 1),
(3, 'Баярма', 'Павлова', 'Баянтуевна', '1999-12-12', 0),
(4, 'Дарима', 'Бадмаева', 'Петровна', '1997-03-23', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `d_bloodgroupe`
--

CREATE TABLE `d_bloodgroupe` (
  `ID` int(1) NOT NULL,
  `BG_CODE` varchar(20) NOT NULL,
  `BG_NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `d_bloodgroupe`
--

INSERT INTO `d_bloodgroupe` (`ID`, `BG_CODE`, `BG_NAME`) VALUES
(1, 'AB IV', 'Четвертая'),
(2, 'A II', 'Вторая'),
(3, 'B III ', 'Третья'),
(4, 'O I', 'Первая');

-- --------------------------------------------------------

--
-- Структура таблицы `d_lpu`
--

CREATE TABLE `d_lpu` (
  `ID` bigint(17) NOT NULL,
  `FULLNAME` varchar(250) NOT NULL,
  `HEADDOCTOR_FULLNAME` varchar(160) NOT NULL,
  `FULLADDRESS` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `d_lpu`
--

INSERT INTO `d_lpu` (`ID`, `FULLNAME`, `HEADDOCTOR_FULLNAME`, `FULLADDRESS`) VALUES
(1, 'Городская больница № 1', 'Петров Петр Петрович', 'г.Улан-Удэ, Комсомольская 6'),
(2, 'Городская больница № 2', 'Павлов Юрий Семенович', 'г.Улан-Удэ, Николая Петрова 1');

-- --------------------------------------------------------

--
-- Структура таблицы `d_persmedcard`
--

CREATE TABLE `d_persmedcard` (
  `ID` bigint(17) NOT NULL,
  `BLOODGROUPE` int(1) NOT NULL,
  `RHESUS` int(1) NOT NULL COMMENT '1- положительный, 0 - отрицательный',
  `CARD_NUMB` varchar(26) NOT NULL,
  `AGENT` bigint(17) NOT NULL,
  `LPU` bigint(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `d_persmedcard`
--

INSERT INTO `d_persmedcard` (`ID`, `BLOODGROUPE`, `RHESUS`, `CARD_NUMB`, `AGENT`, `LPU`) VALUES
(1, 1, 1, '111111', 1, 1),
(2, 1, 1, '222222', 4, 1),
(3, 1, 1, '5623656', 4, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `d_agents`
--
ALTER TABLE `d_agents`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `d_bloodgroupe`
--
ALTER TABLE `d_bloodgroupe`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `d_lpu`
--
ALTER TABLE `d_lpu`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `d_persmedcard`
--
ALTER TABLE `d_persmedcard`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `AGENT-LPU` (`AGENT`,`LPU`) USING BTREE,
  ADD KEY `BLOODGROUPE` (`BLOODGROUPE`),
  ADD KEY `LPU` (`LPU`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `d_agents`
--
ALTER TABLE `d_agents`
  MODIFY `ID` bigint(17) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `d_bloodgroupe`
--
ALTER TABLE `d_bloodgroupe`
  MODIFY `ID` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `d_lpu`
--
ALTER TABLE `d_lpu`
  MODIFY `ID` bigint(17) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `d_persmedcard`
--
ALTER TABLE `d_persmedcard`
  MODIFY `ID` bigint(17) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `d_persmedcard`
--
ALTER TABLE `d_persmedcard`
  ADD CONSTRAINT `d_persmedcard_ibfk_1` FOREIGN KEY (`BLOODGROUPE`) REFERENCES `d_bloodgroupe` (`ID`),
  ADD CONSTRAINT `d_persmedcard_ibfk_2` FOREIGN KEY (`AGENT`) REFERENCES `d_agents` (`ID`),
  ADD CONSTRAINT `d_persmedcard_ibfk_3` FOREIGN KEY (`LPU`) REFERENCES `d_lpu` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
