-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Maj 2023, 22:49
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
-- Struktura tabeli dla tabeli `schedules`
--

CREATE TABLE `schedules` (
  `id` int(8) NOT NULL,
  `subject` varchar(128) NOT NULL,
  `field_of_study_id` int(8) NOT NULL,
  `semester` int(8) NOT NULL,
  `day` enum('1','2','3','4','5') NOT NULL,
  `beginning_time` time NOT NULL,
  `end_time` time NOT NULL,
  `lecturer` varchar(64) NOT NULL,
  `type` enum('seminar','labolatories','lecture') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `schedules`
--

INSERT INTO `schedules` (`id`, `subject`, `field_of_study_id`, `semester`, `day`, `beginning_time`, `end_time`, `lecturer`, `type`) VALUES
(57, 'Algebra 1', 7, 1, '4', '13:00:00', '15:00:00', 'Dariusz Grech', 'seminar'),
(58, 'Algebra 1', 7, 1, '4', '13:00:00', '15:00:00', 'Wiesław Sobków', 'seminar'),
(59, 'Algebra 1', 7, 1, '4', '10:00:00', '12:00:00', 'Dariusz Grech', 'lecture'),
(60, 'Algebra 2', 7, 2, '3', '12:00:00', '14:00:00', 'Dariusz Grech', 'seminar'),
(61, 'Algebra 2', 7, 2, '4', '08:15:00', '10:00:00', 'Dariusz Grech', 'lecture'),
(62, 'Algorytmy i programowanie', 8, 3, '2', '12:00:00', '14:00:00', 'Dawid Moździerski', 'seminar'),
(63, 'Algorytmy i programowanie', 8, 3, '2', '12:00:00', '14:00:00', 'Małgorzata Pietras', 'seminar'),
(64, 'Algorytmy i programowanie', 8, 3, '2', '17:00:00', '19:00:00', 'Paweł Rudawy', 'lecture'),
(65, 'Analiza matematyczna 1', 7, 1, '5', '09:00:00', '12:00:00', 'Tomasz Różański', 'seminar'),
(66, 'Analiza matematyczna 1', 7, 1, '2', '12:00:00', '14:30:00', 'Jakub Jankowski', 'seminar'),
(67, 'Analiza matematyczna 1', 7, 1, '2', '12:00:00', '14:30:00', 'Michał Szymański', 'seminar'),
(68, 'Analiza matematyczna 1', 7, 1, '1', '12:15:00', '15:00:00', 'Robert Olkiewicz', 'lecture'),
(69, 'Analiza matematyczna 2', 7, 2, '3', '09:00:00', '12:00:00', 'Tomasz Różański, Małgorzata Pietras, Natalia Posiłek', 'seminar'),
(70, 'Analiza matematyczna 2', 7, 2, '3', '09:45:00', '12:00:00', 'Dmitry Zhuridov', 'seminar'),
(71, 'Analiza matematyczna 2', 7, 2, '1', '12:15:00', '14:00:00', 'Marek Mozrzymas', 'lecture'),
(72, 'Analiza matematyczna 3', 7, 3, '2', '08:15:00', '10:30:00', 'Valeriya Mykhaylova', 'seminar'),
(73, 'Analiza matematyczna 3', 7, 3, '2', '14:00:00', '17:00:00', 'Wojciech Szewczuk', 'seminar'),
(74, 'Analiza matematyczna 3', 7, 3, '1', '12:15:00', '14:30:00', 'Dmitry Zhuridov', 'lecture'),
(75, 'Astrofizyka obserwacyjna 1', 8, 3, '5', '17:00:00', '19:00:00', 'Piotr Kołaczek-Szymański', 'seminar'),
(76, 'Astrofizyka obserwacyjna 1', 8, 3, '4', '16:00:00', '18:00:00', 'Grzegorz Kopacki', 'lecture'),
(77, 'Astrofizyka obserwacyjna 2', 8, 4, '2', '08:30:00', '10:00:00', 'Gabriela Michalska', 'seminar'),
(78, 'Astrofizyka obserwacyjna 2', 8, 4, '5', '11:00:00', '13:00:00', 'Andrzej Pigulski', 'lecture'),
(79, 'Astrofizyka układów planetarnych', 8, 3, '1', '14:00:00', '16:00:00', 'Sylwester Kołomański', 'lecture'),
(80, 'Astrofizyka wysokich energii', 8, 4, '2', '10:00:00', '12:00:00', 'Kamil Bicz', 'seminar'),
(81, 'Astrofizyka wysokich energii', 8, 4, '3', '13:00:00', '15:00:00', 'Robert Falewicz', 'lecture'),
(82, 'Astronomia galaktyczna', 8, 2, '4', '11:00:00', '13:00:00', 'Gabriela Michalska', 'seminar'),
(83, 'Astronomia galaktyczna', 8, 2, '5', '09:00:00', '11:00:00', 'Grzegorz Kopacki', 'lecture'),
(84, 'Astronomia pozagalaktyczna', 8, 3, '3', '11:00:00', '13:00:00', 'Dawid Moździerski', 'seminar'),
(85, 'Astronomia pozagalaktyczna', 8, 3, '3', '09:00:00', '11:00:00', 'Andrzej Pigulski', 'lecture'),
(86, 'Bazy danych', 7, 6, '2', '10:15:00', '12:00:00', 'Bartosz Brzostowski', 'labolatories'),
(87, 'Bazy danych', 7, 6, '2', '16:30:00', '18:00:00', 'Bartosz Brzostowski', 'labolatories'),
(88, 'Bazy danych', 7, 6, '3', '12:00:00', '13:45:00', 'Bartosz Brzostowski', 'labolatories'),
(89, 'Bazy danych', 7, 6, '4', '15:45:00', '17:15:00', 'Bartosz Brzostowski, Artur Ankowski', 'labolatories'),
(90, 'Bazy danych', 7, 6, '4', '14:00:00', '15:30:00', 'Bartosz Brzostowski', 'lecture'),
(91, 'Bazy danych astronomicznych', 8, 5, '3', '13:00:00', '15:00:00', 'Krzysztof Radziszewski', 'labolatories'),
(92, 'Budowa i ewolucja gwiazd 1', 8, 4, '5', '09:00:00', '11:00:00', 'Przemysław Walczak, Wojciech Szewczuk', 'seminar'),
(93, 'Budowa i ewolucja gwiazd 1', 8, 4, '4', '11:00:00', '13:00:00', 'Jadwiga Daszyńska-Daszkiewicz', 'lecture'),
(94, 'Budowa i ewolucja gwiazd 2', 8, 1, '4', '14:00:00', '16:00:00', 'Przemysław Walczak', 'seminar'),
(95, 'Budowa i ewolucja gwiazd 2', 8, 1, '3', '13:00:00', '15:00:00', 'Przemysław Walczak', 'lecture'),
(96, 'Classical field theory', 7, 1, '2', '09:45:00', '11:15:00', 'Giacomo Rosati, Achilleas Gitsis', 'seminar'),
(97, 'Classical field theory', 7, 1, '3', '16:00:00', '17:30:00', 'Andrzej Frydryszak', 'lecture'),
(98, 'Contemporary problems in condensed matter physics', 7, 1, '2', '14:00:00', '15:30:00', 'Armen Sedrakjan', 'seminar'),
(99, 'Elektrodynamika', 7, 1, '2', '16:15:00', '17:45:00', 'Krzysztof Graczyk', 'seminar'),
(100, 'Elektrodynamika', 7, 1, '2', '14:15:00', '16:00:00', 'Krzysztof Redlich', 'lecture'),
(101, 'Elektrodynamika klasyczna', 7, 5, '3', '10:00:00', '11:30:00', 'Marcin Postolak', 'seminar'),
(102, 'Elektrodynamika klasyczna', 7, 5, '2', '11:45:00', '13:15:00', 'Krzysztof Redlich', 'lecture'),
(103, 'Elektronika cyfrowa', 9, 5, '3', '09:00:00', '12:00:00', 'Radosław Wasielewski', 'seminar'),
(104, 'Elektronika cyfrowa', 9, 5, '3', '09:00:00', '12:00:00', 'Radosław Wasielewski', 'seminar'),
(105, 'Elektronika cyfrowa', 9, 5, '3', '09:00:00', '12:00:00', 'Radosław Wasielewski', 'lecture'),
(106, 'Elektryczność i magnetyzm', 7, 3, '4', '10:00:00', '12:00:00', 'Wojciech Kamiński', 'seminar'),
(107, 'Elektryczność i magnetyzm', 7, 3, '4', '08:15:00', '10:00:00', 'Robert Bryl', 'lecture'),
(108, 'Elementy fizyki statystycznej', 7, 4, '3', '14:15:00', '16:00:00', 'Grzegorz Kondrat', 'seminar'),
(109, 'Elementy fizyki statystycznej', 7, 4, '3', '12:00:00', '14:00:00', 'Artur Barasiński', 'lecture'),
(110, 'Elementy rachunku prawdopodobieństwa', 7, 2, '4', '10:00:00', '12:00:00', 'Arkadiusz Błaut', 'seminar'),
(111, 'Elementy rachunku prawdopodobieństwa', 7, 2, '4', '10:00:00', '12:00:00', 'Michał Szymański', 'seminar'),
(112, 'Elementy rachunku prawdopodobieństwa', 7, 2, '4', '08:15:00', '10:00:00', 'Arkadiusz Błaut', 'lecture'),
(113, 'Fale', 7, 4, '3', '14:00:00', '16:00:00', 'Jacek Brona', 'seminar'),
(114, 'Fale', 7, 4, '3', '11:15:00', '13:45:00', 'Jacek Brona', 'lecture'),
(115, 'Fizyka dla ISSP 1', 9, 1, '3', '14:15:00', '16:00:00', 'Robert Kucharczyk', 'seminar'),
(116, 'Fizyka dla ISSP 1', 9, 1, '2', '08:00:00', '10:00:00', 'Sylwia Owczarek', 'seminar'),
(117, 'Fizyka dla ISSP 1', 9, 1, '5', '12:00:00', '14:00:00', 'Ireneusz Morawski', 'seminar'),
(118, 'Fizyka dla ISSP 1', 9, 1, '4', '15:00:00', '17:00:00', 'Elwira Wachowicz', 'labolatories'),
(119, 'Fizyka dla ISSP 1', 9, 1, '4', '15:00:00', '17:00:00', 'Bartosz Brzostowski', 'labolatories'),
(120, 'Fizyka dla ISSP 1', 9, 1, '1', '14:00:00', '16:00:00', 'Bartosz Brzostowski', 'labolatories'),
(121, 'Fizyka dla ISSP 1', 9, 1, '1', '10:00:00', '12:00:00', 'Tomasz Ossowski', 'labolatories'),
(122, 'Fizyka dla ISSP 1', 9, 1, '4', '13:15:00', '15:00:00', 'Elwira Wachowicz', 'lecture'),
(123, 'Fizyka dla ISSP 2', 9, 2, '1', '09:00:00', '11:00:00', 'Marek Nowicki', 'seminar'),
(124, 'Fizyka dla ISSP 2', 9, 2, '2', '08:15:00', '10:00:00', 'Andrzej Szczepkowicz', 'seminar'),
(125, 'Fizyka dla ISSP 2', 9, 2, '1', '09:00:00', '11:00:00', 'Marek Nowicki', 'seminar'),
(126, 'Fizyka dla ISSP 2', 9, 2, '2', '08:15:00', '10:00:00', 'Agnieszka Puchalska', 'seminar'),
(127, 'Fizyka dla ISSP 2', 9, 2, '1', '09:00:00', '11:00:00', 'Marcin Wiejak', 'labolatories'),
(128, 'Fizyka dla ISSP 2', 9, 2, '1', '13:15:00', '15:00:00', 'Tomasz Ossowski', 'labolatories'),
(129, 'Fizyka dla ISSP 2', 9, 2, '5', '10:00:00', '11:45:00', 'Tomasz Ossowski', 'labolatories'),
(130, 'Fizyka dla ISSP 2', 9, 2, '1', '09:00:00', '11:00:00', 'Tomasz Ossowski', 'labolatories'),
(131, 'Fizyka dla ISSP 2', 9, 2, '1', '11:15:00', '13:00:00', 'Elwira Wachowicz', 'lecture'),
(132, 'Fizyka dla ISSP 3', 9, 3, '5', '08:00:00', '10:00:00', 'Mirela Kaczmarek', 'seminar'),
(133, 'Fizyka dla ISSP 3', 9, 3, '5', '08:00:00', '10:00:00', 'Mirela Kaczmarek', 'seminar'),
(134, 'Fizyka dla ISSP 3', 9, 3, '5', '08:00:00', '10:00:00', 'Wojciech Olszewski', 'seminar'),
(135, 'Fizyka dla ISSP 3', 9, 3, '1', '12:00:00', '14:00:00', 'Elwira Wachowicz', 'labolatories'),
(136, 'Fizyka dla ISSP 3', 9, 3, '1', '14:00:00', '16:00:00', 'Elwira Wachowicz', 'labolatories'),
(137, 'Fizyka dla ISSP 3', 9, 3, '1', '12:00:00', '14:00:00', 'Tomasz Ossowski', 'labolatories'),
(138, 'Fizyka dla ISSP 3', 9, 3, '3', '14:45:00', '16:15:00', 'Tomasz Ossowski', 'lecture'),
(139, 'Fizyka Słońca', 8, 1, '4', '09:00:00', '12:00:00', 'Urszula Bąk-Stęślicka, Kamil Bicz', 'seminar'),
(140, 'Fizyka Słońca', 8, 1, '3', '15:00:00', '17:00:00', 'Michał Tomczak', 'lecture'),
(141, 'General relativity and gravitation', 7, 2, '1', '10:00:00', '11:45:00', 'Giacomo Rosati, Stefanos Tsiopelas', 'seminar'),
(142, 'General relativity and gravitation', 7, 2, '3', '14:15:00', '16:00:00', 'Arkadiusz Błaut', 'lecture'),
(143, 'Grafika inżynierska 2', 9, 5, '4', '13:15:00', '14:45:00', 'Rafał Szukiewicz', 'labolatories'),
(144, 'Grafika inżynierska 2', 9, 5, '3', '16:00:00', '17:30:00', 'Maciej Kuchowicz', 'labolatories'),
(145, 'Grafika inżynierska 2', 9, 5, '2', '12:00:00', '14:00:00', 'Rafał Szukiewicz', 'labolatories'),
(146, 'Grafika inżynierska 3', 9, 6, '4', '15:45:00', '18:00:00', 'Maciej Kuchowicz', 'labolatories'),
(147, 'Historia astronomii', 8, 6, '4', '15:00:00', '17:00:00', 'Ewa Niemczura, Michał Tomczak', 'seminar'),
(148, 'Historia astronomii', 8, 6, '3', '16:00:00', '18:00:00', 'Michał Tomczak', 'lecture'),
(149, 'I Pracownia fizyczna 1', 7, 2, '2', '08:00:00', '10:15:00', 'Sylwia Owczarek', 'labolatories'),
(150, 'I Pracownia fizyczna 1', 7, 2, '2', '08:00:00', '10:15:00', 'Robert Bryl', 'labolatories'),
(151, 'I Pracownia fizyczna 1', 7, 2, '2', '08:00:00', '10:15:00', 'Barbara Pieczyrak, Tomasz Greczyło', 'labolatories'),
(152, 'I pracownia fizyczna dla ISSP 1', 9, 2, '2', '10:30:00', '12:45:00', 'Agnieszka Puchalska', 'labolatories'),
(153, 'I pracownia fizyczna dla ISSP 1', 9, 2, '2', '10:30:00', '12:45:00', 'Wojciech Olszewski', 'labolatories'),
(154, 'I pracownia fizyczna dla ISSP 1', 9, 2, '2', '10:30:00', '12:45:00', 'Monika Krawczyk, Magdalena Sobota', 'labolatories'),
(155, 'I pracownia fizyczna dla ISSP 1', 9, 2, '2', '10:30:00', '12:45:00', 'Dorota Podsiadła', 'labolatories'),
(156, 'I pracownia fizyczna dla ISSP 1', 9, 2, '1', '15:15:00', '17:30:00', 'Marek Nowicki', 'labolatories'),
(157, 'I pracownia fizyczna dla ISSP 2', 9, 3, '4', '10:30:00', '12:45:00', 'Monika Krawczyk', 'labolatories'),
(158, 'I pracownia fizyczna dla ISSP 2', 9, 3, '4', '08:00:00', '10:15:00', 'Sylwia Owczarek', 'labolatories'),
(159, 'I pracownia fizyczna dla ISSP 2', 9, 3, '4', '10:30:00', '12:45:00', 'Karolina Idczak', 'labolatories'),
(160, 'I pracownia fizyczna dla ISSP 2', 9, 3, '4', '10:30:00', '12:45:00', 'Ireneusz Morawski', 'labolatories'),
(161, 'II Pracownia fizyczna 2', 7, 1, '4', '13:00:00', '19:00:00', 'Jacek Brona', 'labolatories'),
(162, 'II Pracownia fizyczna 2', 7, 1, '3', '10:00:00', '16:00:00', 'Leszek Markowski', 'labolatories'),
(163, 'Indywidualny projekt programistyczny', 9, 4, '4', '08:15:00', '10:00:00', 'Mateusz Cierniak', 'labolatories'),
(164, 'Indywidualny projekt programistyczny', 9, 4, '4', '08:15:00', '10:00:00', 'Radosław Kowalski', 'labolatories'),
(165, 'Informatyka w biznesie', 9, 5, '5', '11:30:00', '13:15:00', 'Marcin Wiejak', 'seminar'),
(166, 'Kosmologia', 8, 4, '2', '14:00:00', '16:00:00', 'Piotr Kołaczek-Szymański', 'seminar'),
(167, 'Kosmologia', 8, 4, '3', '13:00:00', '15:00:00', 'Andrzej Pigulski', 'lecture'),
(168, 'Laboratorium programowania', 8, 4, '4', '13:00:00', '16:00:00', 'Grzegorz Kopacki', 'labolatories'),
(169, 'Matematyka 1', 7, 1, '3', '12:15:00', '14:00:00', 'Dmitry Zhuridov', 'seminar'),
(170, 'Matematyka 1', 7, 1, '5', '10:00:00', '12:00:00', 'Gabriela Michalska, Natalia Posiłek', 'seminar'),
(171, 'Matematyka 1', 7, 1, '5', '10:00:00', '12:00:00', 'Amadeusz Miszuda, Tomasz Różański', 'seminar'),
(172, 'Matematyka 1', 7, 1, '3', '10:00:00', '12:00:00', 'Dmitry Zhuridov', 'lecture'),
(173, 'Matematyka 2', 7, 2, '5', '15:00:00', '17:00:00', 'Dawid Moździerski', 'seminar'),
(174, 'Matematyka 2', 7, 2, '4', '12:00:00', '14:00:00', 'Wiesław Sobków', 'seminar'),
(175, 'Matematyka 2', 7, 2, '5', '10:00:00', '11:45:00', 'Wiesław Sobków', 'lecture'),
(176, 'Matematyka 3', 7, 3, '4', '08:00:00', '11:00:00', 'Piotr Ługiewicz', 'seminar'),
(177, 'Matematyka 3', 7, 3, '1', '15:00:00', '18:00:00', 'Piotr Ługiewicz', 'lecture'),
(178, 'Matematyka dla ISSP 1', 9, 1, '4', '08:00:00', '10:30:00', 'Grzegorz Kondrat', 'labolatories'),
(179, 'Matematyka dla ISSP 1', 9, 1, '4', '10:45:00', '13:15:00', 'Tomasz Trześniewski', 'labolatories'),
(180, 'Matematyka dla ISSP 1', 9, 1, '4', '10:45:00', '13:15:00', 'Grzegorz Kondrat', 'labolatories'),
(181, 'Matematyka dla ISSP 1', 9, 1, '3', '08:45:00', '11:00:00', 'Remigiusz Durka', 'labolatories'),
(182, 'Matematyka dla ISSP 1', 9, 1, '5', '10:15:00', '12:00:00', 'Remigiusz Durka', 'lecture'),
(183, 'Matematyka dla ISSP 2', 9, 1, '3', '14:00:00', '16:30:00', 'Janusz Miśkiewicz', 'labolatories'),
(184, 'Matematyka dla ISSP 2', 9, 1, '3', '14:00:00', '16:30:00', 'Valeriya Mykhaylova', 'labolatories'),
(185, 'Matematyka dla ISSP 2', 9, 1, '3', '14:00:00', '16:30:00', 'Remigiusz Durka', 'labolatories'),
(186, 'Matematyka dla ISSP 2', 9, 1, '3', '14:00:00', '16:30:00', 'Tomasz Trześniewski', 'labolatories'),
(187, 'Matematyka dla ISSP 2', 9, 1, '3', '12:15:00', '14:00:00', 'Remigiusz Durka', 'lecture'),
(188, 'Mechanika', 7, 1, '3', '12:00:00', '15:00:00', 'Mirela Kaczmarek', 'seminar'),
(189, 'Mechanika', 7, 1, '3', '12:00:00', '15:00:00', 'Andrzej Szczepkowicz', 'seminar'),
(190, 'Mechanika', 7, 1, '1', '10:00:00', '12:00:00', 'Robert Konieczny', 'seminar'),
(191, 'Mechanika', 7, 1, '1', '08:15:00', '10:00:00', 'Leszek Jurczyszyn', 'lecture'),
(192, 'Mechanika kwantowa 1', 7, 4, '4', '14:00:00', '15:45:00', 'Dariusz Prorok', 'seminar'),
(193, 'Mechanika kwantowa 1', 7, 4, '4', '12:15:00', '14:00:00', 'Arkadiusz Błaut', 'lecture'),
(194, 'Mechanika kwantowa 2', 7, 5, '1', '18:00:00', '19:30:00', 'Jerzy Kowalski-Glikman', 'seminar'),
(195, 'Mechanika kwantowa 2', 7, 5, '1', '16:00:00', '17:45:00', 'Jerzy Kowalski-Glikman', 'lecture'),
(196, 'Mechanika nieba', 8, 3, '4', '08:00:00', '10:00:00', 'Tomasz Mrozek', 'seminar'),
(197, 'Mechanika nieba', 8, 3, '3', '08:00:00', '10:00:00', 'Tomasz Mrozek', 'lecture'),
(198, 'Mechanika teoretyczna', 7, 3, '4', '14:00:00', '16:00:00', 'Jan Sobczyk', 'seminar'),
(199, 'Mechanika teoretyczna', 7, 3, '4', '12:00:00', '14:00:00', 'Jan Sobczyk', 'lecture'),
(200, 'Metody matematyczne fizyki teoretycznej', 7, 4, '4', '10:00:00', '12:00:00', 'Piotr Ługiewicz', 'seminar'),
(201, 'Metody matematyczne fizyki teoretycznej', 7, 4, '4', '08:15:00', '10:00:00', 'Piotr Ługiewicz', 'lecture'),
(202, 'Metody matematyczne w astronomii', 8, 6, '3', '13:00:00', '16:00:00', 'Joanna Molenda-Żakowicz, Przemysław Walczak', 'seminar'),
(203, 'Metody numeryczne', 8, 5, '4', '09:00:00', '12:00:00', 'Wojciech Szewczuk, Tomasz Różański', 'seminar'),
(204, 'Metody numeryczne', 8, 5, '3', '09:00:00', '11:00:00', 'Wojciech Szewczuk', 'lecture'),
(205, 'Metody redukcji i analizy danych astronomicznych', 8, 2, '2', '09:00:00', '11:00:00', 'Krzysztof Radziszewski, Kamil Bicz', 'seminar'),
(206, 'Metody redukcji i analizy danych astronomicznych', 8, 2, '5', '11:00:00', '13:00:00', 'Robert Falewicz', 'lecture'),
(207, 'Modelowanie fizyczne w animacji komputerowej', 9, 5, '2', '12:00:00', '14:00:00', 'Oleksandr Vitiuk', 'labolatories'),
(208, 'Modelowanie fizyczne w animacji komputerowej', 9, 5, '3', '16:00:00', '17:30:00', 'Oleksandr Vitiuk', 'labolatories'),
(209, 'Modelowanie fizyczne w animacji komputerowej', 9, 5, '2', '08:15:00', '10:00:00', 'Artur Ankowski', 'labolatories'),
(210, 'Modelowanie fizyczne w animacji komputerowej', 9, 5, '5', '08:30:00', '10:00:00', 'Artur Ankowski', 'labolatories'),
(211, 'Modelowanie fizyczne w animacji komputerowej', 9, 5, '4', '10:30:00', '11:15:00', 'Maciej Matyka', 'lecture'),
(212, 'Modern quantum mechanics with elements of quantum optics', 7, 1, '4', '13:00:00', '14:45:00', 'Arkadiusz Błaut', 'seminar'),
(213, 'Modern quantum mechanics with elements of quantum optics', 7, 1, '1', '14:00:00', '16:00:00', 'Andrzej Frydryszak', 'lecture'),
(214, 'Monographic Lecture - Computational Fluid Dynamics', 7, 1, '3', '12:00:00', '14:00:00', 'Maciej Matyka', 'lecture'),
(215, 'Optyka kwantowa', 7, 6, '4', '12:00:00', '13:45:00', 'Alicja Gronowska-Kowalska', 'seminar'),
(216, 'Optyka kwantowa', 7, 6, '4', '10:00:00', '12:00:00', 'Artur Barasiński', 'lecture'),
(217, 'Osiągnięcia fizyki współczesnej', 7, 1, '1', '14:00:00', '15:30:00', 'Robert Kucharczyk', 'seminar'),
(218, 'Podstawy analizy danych -praktyczne warsztaty', 7, 5, '4', '13:15:00', '14:45:00', 'Iwona Mróz', 'labolatories'),
(219, 'Podstawy analizy danych -praktyczne warsztaty', 7, 5, '3', '17:45:00', '19:15:00', 'Iwona Mróz', 'labolatories'),
(220, 'Podstawy astronomii 1', 8, 1, '5', '12:00:00', '14:00:00', 'Małgorzata Pietras', 'seminar'),
(221, 'Podstawy astronomii 1', 8, 1, '5', '12:00:00', '14:00:00', 'Dawid Moździerski, Tomasz Różański', 'seminar'),
(222, 'Podstawy astronomii 1', 8, 1, '5', '12:00:00', '14:00:00', 'Urszula Bąk-Stęślicka, Natalia Posiłek', 'seminar'),
(223, 'Podstawy astronomii 1', 8, 1, '4', '16:00:00', '18:00:00', 'Sylwester Kołomański', 'lecture'),
(224, 'Podstawy astronomii 2', 8, 2, '3', '12:30:00', '14:00:00', 'Ewa Niemczura, Natalia Posiłek', 'seminar'),
(225, 'Podstawy astronomii 2', 8, 2, '3', '15:00:00', '17:00:00', 'Kamil Bicz', 'seminar'),
(226, 'Podstawy astronomii 2', 8, 2, '2', '12:00:00', '14:00:00', 'Urszula Bąk-Stęślicka', 'lecture'),
(227, 'Podstawy chemii', 7, 6, '1', '14:00:00', '15:30:00', 'Magdalena Sobota', 'seminar'),
(228, 'Podstawy chemii', 7, 6, '1', '12:15:00', '14:00:00', 'Monika Krawczyk', 'lecture'),
(229, 'Podstawy fizyki 1', 7, 1, '4', '08:15:00', '10:00:00', 'Agnieszka Puchalska', 'seminar'),
(230, 'Podstawy fizyki 1', 7, 1, '4', '08:15:00', '10:00:00', 'Karolina Idczak', 'seminar'),
(231, 'Podstawy fizyki 1', 7, 1, '3', '08:15:00', '10:00:00', 'Wojciech Kamiński', 'lecture'),
(232, 'Podstawy fizyki 2', 7, 2, '4', '14:00:00', '16:00:00', 'Piotr Staniorowski', 'seminar'),
(233, 'Podstawy fizyki 2', 7, 2, '1', '13:15:00', '15:00:00', 'Elwira Wachowicz', 'seminar'),
(234, 'Podstawy fizyki 2', 7, 2, '3', '08:15:00', '09:45:00', 'Robert Kucharczyk', 'lecture'),
(235, 'Podstawy fizyki 3', 7, 3, '4', '13:00:00', '15:00:00', 'Maciej Kuchowicz', 'seminar'),
(236, 'Podstawy fizyki 3', 7, 3, '1', '13:00:00', '15:00:00', 'Andrzej Szczepkowicz', 'lecture'),
(237, 'Podstawy fizyki 4', 7, 4, '3', '16:15:00', '18:00:00', 'Robert Konieczny', 'seminar'),
(238, 'Podstawy fizyki 4', 7, 4, '1', '12:00:00', '14:30:00', 'Rafał Idczak', 'lecture'),
(239, 'Podstawy grafiki komputerowej', 9, 5, '2', '10:00:00', '11:30:00', 'Michał Marczenko', 'labolatories'),
(240, 'Podstawy grafiki komputerowej', 9, 5, '1', '12:00:00', '14:00:00', 'Andrzej Łukaszewski', 'lecture'),
(241, 'Pracownia astronomiczna', 8, 2, '2', '14:00:00', '16:00:00', 'Joanna Molenda-Żakowicz', 'labolatories'),
(242, 'Pracownia astronomiczna', 8, 2, '2', '14:00:00', '16:00:00', 'Sylwester Kołomański', 'labolatories'),
(243, 'Pracownia elektroniki cyfrowej', 9, 5, '4', '17:00:00', '19:15:00', 'Radosław Wasielewski, Maciej Zagrabski', 'labolatories'),
(244, 'Pracownia elektroniki cyfrowej', 9, 5, '5', '16:15:00', '18:30:00', 'Radosław Wasielewski, Maciej Zagrabski', 'labolatories'),
(245, 'Pracownia fotometrii CCD', 8, 1, '2', '14:00:00', '17:00:00', 'Joanna Molenda-Żakowicz', 'seminar'),
(246, 'Pracownia IDL', 8, 1, '4', '11:30:00', '14:30:00', 'Robert Falewicz, Małgorzata Pietras, Kamil Bicz', 'seminar'),
(247, 'Pracownia jądrowa', 7, 2, '1', '09:00:00', '12:00:00', 'Piotr Sobota', 'labolatories'),
(248, 'Pracownia komputerowa metod matematycznych 1', 7, 2, '4', '08:15:00', '10:00:00', 'Michał Bobula', 'labolatories'),
(249, 'Pracownia komputerowa metod matematycznych 1', 7, 2, '2', '10:30:00', '12:00:00', 'Nazarii Sudak', 'labolatories'),
(250, 'Pracownia komputerowa metod matematycznych 1', 7, 2, '1', '10:00:00', '11:45:00', 'Krzysztof Graczyk', 'labolatories'),
(251, 'Pracownia komputerowa metod matematycznych 1', 7, 2, '1', '10:00:00', '11:45:00', 'Aleksander Kozak', 'labolatories'),
(252, 'Pracownia komputerowa metod matematycznych 2', 7, 3, '3', '16:00:00', '17:30:00', 'Arkadiusz Błaut', 'labolatories'),
(253, 'Pracownia komputerowa metod matematycznych 2', 7, 3, '5', '08:00:00', '10:00:00', 'Arkadiusz Błaut', 'labolatories'),
(254, 'Pracownia komputerowa metod matematycznych 2', 7, 3, '5', '08:00:00', '10:00:00', 'Maciej Kowalczyk', 'labolatories'),
(255, 'Pracownia problemów fizycznych', 9, 1, '3', '08:00:00', '11:00:00', 'Piotr Staniorowski', 'labolatories'),
(256, 'Pracownia problemów fizycznych', 9, 1, '3', '11:00:00', '14:00:00', 'Dorota Podsiadła', 'labolatories'),
(257, 'Pracownia problemów fizycznych', 9, 1, '2', '12:00:00', '15:00:00', 'Maciej Kuchowicz', 'labolatories'),
(258, 'Pracownia problemów fizycznych', 9, 1, '3', '14:00:00', '17:00:00', 'Tomasz Greczyło, Robert Bryl', 'labolatories'),
(259, 'Pracownia spektroskopii', 8, 2, '5', '13:00:00', '16:00:00', 'Joanna Molenda-Żakowicz', 'labolatories'),
(260, 'Pracownia systemów wbudowanych', 9, 6, '3', '17:15:00', '19:30:00', 'Radosław Wasielewski, Maciej Zagrabski', 'labolatories'),
(261, 'Praktyczny wstęp do programowania', 7, 2, '2', '12:15:00', '14:30:00', 'Dmitry Zhuridov', 'labolatories'),
(262, 'Praktyczny wstęp do programowania', 7, 2, '1', '09:30:00', '11:45:00', 'Dmitry Zhuridov', 'labolatories'),
(263, 'Praktyczny wstęp do programowania', 7, 2, '4', '14:00:00', '15:00:00', 'Maciej Matyka', 'lecture'),
(264, 'Praktyczny wstęp do programowania', 9, 1, '3', '08:15:00', '10:45:00', 'Tomasz Trześniewski', 'labolatories'),
(265, 'Praktyczny wstęp do programowania', 9, 1, '1', '10:00:00', '12:30:00', 'Grzegorz Kondrat', 'labolatories'),
(266, 'Praktyczny wstęp do programowania', 9, 1, '1', '10:00:00', '12:30:00', 'Michał Szymański', 'labolatories'),
(267, 'Praktyczny wstęp do programowania', 9, 1, '3', '11:00:00', '13:30:00', 'Tomasz Trześniewski', 'labolatories'),
(268, 'Praktyczny wstęp do programowania', 9, 1, '2', '10:00:00', '10:45:00', 'Maciej Matyka', 'lecture'),
(269, 'Prezentacja wyników naukowych', 8, 5, '3', '11:00:00', '13:00:00', 'Grzegorz Kopacki, Małgorzata Pietras', 'labolatories'),
(270, 'Programowanie gier komputerowych', 9, 7, '1', '18:15:00', '19:45:00', 'Maciej Celmer', 'labolatories'),
(271, 'Programowanie gier komputerowych', 9, 7, '1', '16:30:00', '18:00:00', 'Maciej Celmer', 'labolatories'),
(272, 'Programowanie obiektowe', 7, 5, '1', '16:15:00', '18:00:00', 'Zbigniew Koza', 'labolatories'),
(273, 'Programowanie obiektowe', 7, 5, '1', '14:15:00', '16:00:00', 'Zbigniew Koza', 'lecture'),
(274, 'Programy użytkowe', 7, 1, '2', '10:00:00', '12:00:00', 'Maciej Kowalczyk', 'labolatories'),
(275, 'Programy użytkowe', 7, 1, '2', '10:00:00', '12:00:00', 'Nazarii Sudak', 'labolatories'),
(276, 'Programy użytkowe', 7, 1, '2', '14:45:00', '16:15:00', 'Michał Bobula', 'labolatories'),
(277, 'Programy użytkowe', 7, 1, '2', '17:00:00', '18:30:00', 'Mateusz Cierniak, Patryk Mieszkalski', 'labolatories'),
(278, 'Programy użytkowe', 7, 1, '4', '12:00:00', '13:00:00', 'Janusz Miśkiewicz', 'lecture'),
(279, 'Projekt aplikacji mobilnej 1', 9, 6, '3', '12:00:00', '13:45:00', 'Rafał Lewandków', 'labolatories'),
(280, 'Projekt aplikacji mobilnej 1', 9, 6, '2', '08:00:00', '10:00:00', 'Rafał Lewandków', 'labolatories'),
(281, 'Projekt aplikacji mobilnej 1', 9, 6, '5', '08:15:00', '10:00:00', 'Rafał Lewandków, Artur Ankowski', 'labolatories'),
(282, 'Projekt aplikacji mobilnej 2', 9, 7, '1', '14:00:00', '16:00:00', 'Janusz Miśkiewicz', 'labolatories'),
(283, 'Projekt C++', 9, 3, '1', '14:00:00', '16:00:00', 'Cezary Juszczak', 'labolatories'),
(284, 'Projekt C++', 9, 3, '1', '12:00:00', '14:00:00', 'Cezary Juszczak', 'labolatories'),
(285, 'Projekt C++', 9, 3, '1', '14:00:00', '16:00:00', 'Aleksander Kozak', 'labolatories'),
(286, 'Projekt w języku skryptowym', 9, 2, '5', '10:00:00', '11:45:00', 'Jakub Jankowski', 'labolatories'),
(287, 'Projekt w języku skryptowym', 9, 2, '2', '08:30:00', '10:00:00', 'Dmitry Zhuridov', 'labolatories'),
(288, 'Projekt w języku skryptowym', 9, 2, '5', '08:15:00', '10:00:00', 'Radosław Kowalski', 'labolatories'),
(289, 'Psychologia biznesu', 9, 7, '2', '17:15:00', '18:45:00', 'Mariola Siorek', 'lecture'),
(290, 'Pulsacje gwiazdowe', 8, 3, '4', '10:00:00', '12:00:00', 'Jadwiga Daszyńska-Daszkiewicz', 'seminar'),
(291, 'Pulsacje gwiazdowe', 8, 3, '3', '11:00:00', '13:00:00', 'Jadwiga Daszyńska-Daszkiewicz', 'lecture'),
(292, 'Quantum electrodynamics', 7, 1, '3', '14:00:00', '15:45:00', 'Armen Sedrakjan, Noshad Khosravi Largani', 'seminar'),
(293, 'Quantum electrodynamics', 7, 1, '3', '10:15:00', '12:00:00', 'Chihiro Sasaki', 'lecture'),
(294, 'Rachunek prawdopodobieństwa', 7, 2, '5', '10:00:00', '11:45:00', 'Piotr Ługiewicz, Artur Ankowski', 'seminar'),
(295, 'Rachunek prawdopodobieństwa', 7, 2, '5', '08:15:00', '10:00:00', 'Piotr Ługiewicz', 'lecture'),
(296, 'Rachunek prawdopodobieństwa i statystyka', 9, 3, '3', '13:00:00', '14:30:00', 'Wiesław Sobków', 'seminar'),
(297, 'Rachunek prawdopodobieństwa i statystyka', 9, 3, '4', '15:00:00', '17:00:00', 'Wiesław Sobków', 'seminar'),
(298, 'Rachunek prawdopodobieństwa i statystyka', 9, 3, '2', '16:00:00', '18:00:00', 'Dariusz Prorok', 'seminar'),
(299, 'Rachunek prawdopodobieństwa i statystyka', 9, 3, '2', '14:00:00', '16:00:00', 'Dariusz Prorok', 'lecture'),
(300, 'Seminarium', 7, 6, '2', '10:15:00', '12:00:00', 'Krzysztof Redlich', 'seminar'),
(301, 'Seminarium inżynierskie', 9, 7, '1', '12:00:00', '14:00:00', 'Zbigniew Koza', 'seminar'),
(302, 'Seminarium inżynierskie', 9, 7, '1', '12:00:00', '14:00:00', 'Leszek Markowski', 'seminar'),
(303, 'Seminarium licencjackie 2', 8, 6, '1', '12:00:00', '14:00:00', 'Przemysław Walczak', 'seminar'),
(304, 'Seminarium magisterskie 1', 7, 3, '3', '14:00:00', '15:45:00', 'Dariusz Prorok', 'seminar'),
(305, 'Seminarium nowych technologii', 9, 6, '3', '15:45:00', '17:15:00', 'Maciej Matyka', 'seminar'),
(306, 'Seminarium z astronomii', 8, 6, '3', '11:00:00', '13:00:00', 'Urszula Bąk-Stęślicka', 'seminar'),
(307, 'Seminarium z astronomii', 8, 4, '2', '12:30:00', '14:00:00', 'Urszula Bąk-Stęślicka', 'seminar'),
(308, 'Specialized Lecture - An Introduction to String Theory', 7, 1, '4', '10:00:00', '12:45:00', 'Falk Hassler, Luca Scala', 'seminar'),
(309, 'Specialized Lecture - An Introduction to String Theory', 7, 1, '4', '08:00:00', '10:00:00', 'Falk Hassler', 'lecture'),
(310, 'Specialized Lecture - Introduction to quantum information theory for physicists', 7, 2, '1', '13:45:00', '15:15:00', 'Artur Barasiński, Achilleas Gitsis', 'seminar'),
(311, 'Specialized Lecture - Introduction to quantum information theory for physicists', 7, 2, '1', '12:00:00', '13:30:00', 'Artur Barasiński', 'lecture'),
(312, 'Statistical physics 2', 7, 2, '4', '16:00:00', '17:30:00', 'Armen Sedrakjan, Stefanos Tsiopelas', 'seminar'),
(313, 'Statistical physics 2', 7, 2, '4', '14:00:00', '15:45:00', 'Armen Sedrakjan', 'lecture'),
(314, 'Statystyka matematyczna', 8, 4, '5', '10:00:00', '13:00:00', 'Przemysław Walczak', 'seminar'),
(315, 'Statystyka matematyczna', 8, 4, '2', '09:00:00', '12:00:00', 'Przemysław Walczak', 'lecture'),
(316, 'Teoria atmosfer gwiazdowych', 8, 6, '1', '14:00:00', '16:00:00', 'Ewa Niemczura, Tomasz Różański', 'seminar'),
(317, 'Teoria atmosfer gwiazdowych', 8, 6, '4', '13:00:00', '15:00:00', 'Ewa Niemczura', 'lecture'),
(318, 'Termodynamika', 7, 2, '4', '10:00:00', '11:45:00', 'Sylwia Owczarek', 'seminar'),
(319, 'Termodynamika', 7, 2, '4', '10:00:00', '11:45:00', 'Monika Krawczyk', 'seminar'),
(320, 'Termodynamika', 7, 2, '1', '14:00:00', '16:00:00', 'Grażyna Antczak', 'lecture'),
(321, 'Theory of elementary particles', 7, 2, '2', '16:00:00', '17:30:00', 'Giacomo Rosati', 'seminar'),
(322, 'Theory of elementary particles', 7, 2, '2', '14:00:00', '15:45:00', 'Krzysztof Graczyk', 'lecture'),
(323, 'Trends in modern theoretical physics A', 7, 1, '4', '16:45:00', '18:15:00', 'Chihiro Sasaki', 'seminar'),
(324, 'Trends in modern theoretical physics A', 7, 1, '4', '15:00:00', '16:30:00', 'Chihiro Sasaki', 'lecture'),
(325, 'Trends in modern theoretical physics B', 7, 1, '4', '16:45:00', '18:15:00', 'Andrzej Frydryszak', 'seminar'),
(326, 'Trends in modern theoretical physics B', 7, 1, '4', '15:00:00', '16:30:00', 'Andrzej Frydryszak', 'lecture'),
(327, 'Trends in modern theoretical physics C', 7, 1, '4', '16:45:00', '18:15:00', 'Armen Sedrakjan', 'seminar'),
(328, 'Trends in modern theoretical physics C', 7, 1, '4', '15:00:00', '16:30:00', 'Armen Sedrakjan', 'lecture'),
(329, 'Tworzenie stron internetowych', 8, 6, '1', '16:00:00', '18:00:00', 'Sylwester Kołomański', 'labolatories'),
(330, 'Wizualne i poznawcze aspekty projektowania', 9, 6, '5', '15:00:00', '16:00:00', 'Laura Adel', 'seminar'),
(331, 'Wizualne i poznawcze aspekty projektowania', 9, 6, '5', '14:00:00', '15:00:00', 'Jakub Jernajczyk, Laura Adel', 'lecture'),
(332, 'Wprowadzenie do programowania w Pythonie', 8, 4, '3', '09:00:00', '11:00:00', 'Kamil Bicz', 'seminar'),
(333, 'Wprowadzenie do systemów IoT', 9, 5, '1', '16:00:00', '18:00:00', 'Piotr Figlarek', 'labolatories'),
(334, 'Wprowadzenie do systemów IoT', 9, 5, '1', '15:00:00', '16:00:00', 'Piotr Figlarek', 'lecture'),
(335, 'Wstęp do algebry', 7, 1, '2', '15:00:00', '16:45:00', 'Marek Mozrzymas', 'seminar'),
(336, 'Wstęp do algebry', 7, 1, '2', '15:00:00', '16:45:00', 'Valeriya Mykhaylova', 'seminar'),
(337, 'Wstęp do algebry', 7, 1, '2', '15:00:00', '16:45:00', 'Alicja Gronowska-Kowalska', 'seminar'),
(338, 'Wstęp do algebry', 7, 1, '4', '10:00:00', '12:00:00', 'Marek Mozrzymas', 'lecture'),
(339, 'Wstęp do fizyki Słońca', 8, 5, '2', '11:00:00', '13:00:00', 'Krzysztof Radziszewski, Małgorzata Pietras', 'seminar'),
(340, 'Wstęp do fizyki Słońca', 8, 5, '4', '09:00:00', '11:00:00', 'Paweł Rudawy', 'lecture'),
(341, 'Wstęp do nanofizyki i nanotechnologii', 7, 2, '4', '10:00:00', '12:00:00', 'Jacek Brona', 'seminar'),
(342, 'Wstęp do nanofizyki i nanotechnologii', 7, 2, '3', '12:00:00', '13:45:00', 'Leszek Markowski', 'lecture'),
(343, 'Wstęp do programowania urządzeń mobilnych – Kotlin, Java', 9, 4, '3', '09:15:00', '11:00:00', 'Rafał Lewandków', 'labolatories'),
(344, 'Wstęp do programowania urządzeń mobilnych – Kotlin, Java', 9, 4, '2', '14:00:00', '15:45:00', 'Rafał Lewandków', 'labolatories'),
(345, 'Wstęp do programowania urządzeń mobilnych – Kotlin, Java', 9, 4, '3', '14:30:00', '16:00:00', 'Rafał Lewandków', 'labolatories'),
(346, 'Wstęp do programowania urządzeń mobilnych – Kotlin, Java', 9, 4, '2', '10:00:00', '11:00:00', 'Rafał Lewandków', 'lecture'),
(347, 'Wstęp do systemów operacyjnych', 8, 2, '2', '10:00:00', '12:00:00', 'Urszula Bąk-Stęślicka', 'labolatories'),
(348, 'Wstęp do systemów operacyjnych', 8, 2, '2', '10:00:00', '12:00:00', 'Gabriela Michalska', 'labolatories'),
(349, 'Wybrane metody diagnostyki powierzchni fazy skondensowanej', 7, 1, '4', '15:30:00', '17:00:00', 'Marek Nowicki', 'lecture'),
(350, 'Wykład monograficzny - Fizykochemia powierzchni i metody jej obrazowania', 7, 1, '1', '15:45:00', '17:15:00', 'Ireneusz Morawski, Marek Nowicki', 'lecture'),
(351, 'Wykład monograficzny - Metody analizy sieci', 7, 1, '3', '12:00:00', '14:00:00', 'Janusz Miśkiewicz', 'lecture'),
(352, 'Wykład monograficzny - Wprowadzenie do nauki o materiałach', 7, 2, '1', '12:15:00', '13:45:00', 'Grażyna Antczak', 'lecture'),
(353, 'Zaawansowane programowanie C++', 9, 5, '4', '15:00:00', '16:45:00', 'Jakub Jankowski', 'labolatories'),
(354, 'Zaawansowane programowanie C++', 9, 5, '4', '13:15:00', '14:45:00', 'Jakub Jankowski', 'labolatories'),
(355, 'Zaawansowane programowanie C++', 9, 5, '4', '11:30:00', '13:00:00', 'Zbigniew Koza', 'lecture'),
(356, 'Zespołowy projekt programistyczny', 9, 7, '2', '15:00:00', '16:45:00', 'Cezary Juszczak', 'labolatories');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `todo_list`
--

CREATE TABLE `todo_list` (
  `id` int(8) NOT NULL,
  `task` varchar(1024) NOT NULL,
  `due_date` date NOT NULL,
  `user_id` int(8) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `subject` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `login` varchar(32) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(32) NOT NULL,
  `faculty` varchar(64) NOT NULL,
  `major` varchar(64) NOT NULL,
  `semester` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_schedules`
--

CREATE TABLE `users_schedules` (
  `id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `subject_id` int(8) NOT NULL
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
-- Indeksy dla tabeli `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_of_study_id` (`field_of_study_id`);

--
-- Indeksy dla tabeli `todo_list`
--
ALTER TABLE `todo_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users_schedules`
--
ALTER TABLE `users_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subject_id` (`subject_id`);

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
-- AUTO_INCREMENT dla tabeli `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT dla tabeli `todo_list`
--
ALTER TABLE `todo_list`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT dla tabeli `users_schedules`
--
ALTER TABLE `users_schedules`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `fields_of_study`
--
ALTER TABLE `fields_of_study`
  ADD CONSTRAINT `fields_of_study_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`);

--
-- Ograniczenia dla tabeli `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`field_of_study_id`) REFERENCES `fields_of_study` (`id`);

--
-- Ograniczenia dla tabeli `users_schedules`
--
ALTER TABLE `users_schedules`
  ADD CONSTRAINT `users_schedules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_schedules_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `schedules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
