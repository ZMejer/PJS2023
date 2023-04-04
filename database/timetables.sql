-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Kwi 2023, 22:11
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `timetables`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `admins`
--

CREATE TABLE `admins` (
  `id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faculties`
--

CREATE TABLE `faculties` (
  `id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `faculties`
--

INSERT INTO `faculties` (`id`, `name`) VALUES
(0, 'Wydział Chemii'),
(1, 'Wydział Biotechnologii'),
(2, 'Wydział Filologiczny'),
(3, 'Wydział Fizyki i Astronomii'),
(4, 'Wydział Matematyki i Informatyki'),
(5, 'Wydział Nauk Biologicznych'),
(6, 'Wydział Nauk Historycznych i Pedagogicznych'),
(7, 'Wydział Nauk o Ziemi i Kształtowania Środowiska'),
(8, 'Wydział Nauk Społecznych'),
(9, 'Wydział Prawa, Administracji i Ekonomii');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fields_of_study`
--

CREATE TABLE `fields_of_study` (
  `id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `faculty_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `fields_of_study`
--

INSERT INTO `fields_of_study` (`id`, `name`, `faculty_id`) VALUES
(1, 'Biotechnologia', 1),
(2, 'Chemia', 0),
(3, 'Chemia medyczna', 0),
(4, 'Filologia polska', 2),
(5, 'Filologia hiszpańska', 2),
(6, 'Filologia francuska', 2),
(7, 'Fizyka', 3),
(8, 'Astronomia', 3),
(9, 'Informatyka stosowana i systemy pomiarowe', 3),
(10, 'Informatyka', 4),
(11, 'Matematyka', 4),
(12, 'Biologia', 5),
(13, 'Biologia człowieka', 5),
(14, 'Genetyka i biologia eksperymentalna', 5),
(15, 'Filozofia', 8),
(16, 'Socjologia', 8),
(17, 'Kryminologia', 9),
(18, 'Administracja', 9),
(19, 'Ekonomia', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `faculty` varchar(64) NOT NULL,
  `major` varchar(64) NOT NULL,
  `semester` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `fields_of_study`
--
ALTER TABLE `fields_of_study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty` (`faculty_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `fields_of_study`
--
ALTER TABLE `fields_of_study`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `fields_of_study`
--
ALTER TABLE `fields_of_study`
  ADD CONSTRAINT `fields_of_study_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
