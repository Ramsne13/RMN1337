-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Май 24 2025 г., 05:46
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_mulaliev9070_ramsne1337`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Goal`
--

CREATE TABLE `Goal` (
  `id` int NOT NULL COMMENT 'ID гола',
  `id_match` int DEFAULT NULL COMMENT 'ID матча',
  `id_player` int DEFAULT NULL COMMENT 'ID игрока',
  `time` time DEFAULT NULL COMMENT 'Время от начала матча'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Goal`
--

INSERT INTO `Goal` (`id`, `id_match`, `id_player`, `time`) VALUES
(1, 1, 2, '00:29:24'),
(2, 1, 3, '00:22:10'),
(3, 2, 1, '01:05:42');

-- --------------------------------------------------------

--
-- Структура таблицы `Match`
--

CREATE TABLE `Match` (
  `id` int NOT NULL COMMENT 'ID матча',
  `id_team1` int DEFAULT NULL COMMENT 'ID команды 1',
  `id_team2` int DEFAULT NULL COMMENT 'ID команды 2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Match`
--

INSERT INTO `Match` (`id`, `id_team1`, `id_team2`) VALUES
(1, 1, 2),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Player`
--

CREATE TABLE `Player` (
  `id` int NOT NULL COMMENT 'ID игрока',
  `id_team` int DEFAULT NULL COMMENT 'ID команды',
  `Name` varchar(255) NOT NULL COMMENT 'ФИО',
  `Role` varchar(255) DEFAULT NULL COMMENT 'Амплуа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Player`
--

INSERT INTO `Player` (`id`, `id_team`, `Name`, `Role`) VALUES
(1, 1, 'Иванов И.И.', 'Капитан'),
(2, 2, 'Месси Л.', 'Капитан'),
(3, 1, 'Роналдо К.', 'Нападающий'),
(4, 2, 'Сидоров А.', 'Нападающий');

-- --------------------------------------------------------

--
-- Структура таблицы `Team`
--

CREATE TABLE `Team` (
  `id` int NOT NULL COMMENT 'ID команды',
  `Name` varchar(255) DEFAULT NULL COMMENT 'Наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Team`
--

INSERT INTO `Team` (`id`, `Name`) VALUES
(1, 'Барселона'),
(2, 'АНЖИ');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Goal`
--
ALTER TABLE `Goal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_match` (`id_match`),
  ADD KEY `id_player` (`id_player`);

--
-- Индексы таблицы `Match`
--
ALTER TABLE `Match`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_team1` (`id_team1`),
  ADD KEY `id_team2` (`id_team2`);

--
-- Индексы таблицы `Player`
--
ALTER TABLE `Player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_team` (`id_team`);

--
-- Индексы таблицы `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Goal`
--
ALTER TABLE `Goal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID гола', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Match`
--
ALTER TABLE `Match`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID матча', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Player`
--
ALTER TABLE `Player`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID игрока', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Team`
--
ALTER TABLE `Team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID команды', AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Goal`
--
ALTER TABLE `Goal`
  ADD CONSTRAINT `Goal_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `Match` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Goal_ibfk_2` FOREIGN KEY (`id_player`) REFERENCES `Player` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Match`
--
ALTER TABLE `Match`
  ADD CONSTRAINT `Match_ibfk_1` FOREIGN KEY (`id_team1`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Match_ibfk_2` FOREIGN KEY (`id_team2`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Player`
--
ALTER TABLE `Player`
  ADD CONSTRAINT `Player_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `Team` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
