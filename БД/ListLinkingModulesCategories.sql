-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 26 2021 г., 12:07
-- Версия сервера: 5.5.65-MariaDB
-- Версия PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `calculator`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ListLinkingModulesCategories`
--

CREATE TABLE IF NOT EXISTS `ListLinkingModulesCategories` (
  `ListModCatID` int(11) NOT NULL,
  `companyID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `moduleID` int(11) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ListLinkingModulesCategories`
--
ALTER TABLE `ListLinkingModulesCategories`
  ADD PRIMARY KEY (`ListModCatID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ListLinkingModulesCategories`
--
ALTER TABLE `ListLinkingModulesCategories`
  MODIFY `ListModCatID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
