-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 15 Gru 2022, 09:17
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `addresses`
--

CREATE TABLE `addresses` (
  `id_address` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `town` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `street_name` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `zip_code` char(6) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `addresses`
--

INSERT INTO `addresses` (`id_address`, `id_user`, `id_type`, `town`, `street_name`, `zip_code`) VALUES
(1, 1, 0, 'Kraków', 'Opacka', '65-632'),
(2, 1, 0, 'Olkusz', 'Żabia', '55-888');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `basket`
--

CREATE TABLE `basket` (
  `id_basket` int(11) NOT NULL,
  `id_prodact` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `basket`
--

INSERT INTO `basket` (`id_basket`, `id_prodact`, `id_user`, `date_add`) VALUES
(1, 2, 2, '2022-11-19 16:11:06'),
(2, 1, 1, '2022-11-19 16:11:06');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `dostawcy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `dostawcy` (
`nazwa_produktu` varchar(150)
,`name` varchar(250)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id_product` int(11) NOT NULL,
  `nazwa_produktu` varchar(150) COLLATE utf8mb4_polish_ci NOT NULL,
  `description` text COLLATE utf8mb4_polish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `picture` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `date_add` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id_product`, `nazwa_produktu`, `description`, `price`, `picture`, `date_add`) VALUES
(1, 'Telewizor LG 1000V', 'Najlepszy TV', '3999.99', 'lg.jpg', '2022-11-19 16:08:10'),
(2, 'Laptop Lenovo 3000p', 'Fajny laptop', '4900.00', 'laptop.png', '2022-11-19 16:08:50'),
(3, 'Telewizor LG 2000V.', 'Najlepszy TV 2.', '4999.99', 'lg2.jpeg', '2022-11-20 15:17:13'),
(4, 'Laptop HP 1000V', 'Fajny laptop 2', '5999.00', 'laptop.png', '2022-11-19 16:08:44'),
(5, 'Telewizor SONY 4000VA.', 'Najlepszy TV Sony.', '6999.99', 'lg4.jpeg', '2022-11-20 16:08:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `promocje`
--

CREATE TABLE `promocje` (
  `id_promo` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `providers`
--

CREATE TABLE `providers` (
  `id_provider` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `phone_number` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `providers`
--

INSERT INTO `providers` (`id_provider`, `id_product`, `name`, `phone_number`, `email`) VALUES
(1, 4, 'Top-Lap HP ', '+48123456789', 'top-lap@best.pl'),
(2, 2, 'Elektronika Wszechczasów', '+48987654321', 'elektronikawszechczasow@gwiazda.star'),
(3, 1, 'RTVAGDdelivery Warszawa', '+48654987321', 'rtvagddelivery@rtv.best'),
(4, 3, 'Złomowisko PL Końskowola', '+48456789123', 'zlomowisko@pulawy.pl'),
(5, 5, 'Sony&Syn Sp.z O.O', '+61987654321', 'poczta@sonyisyn@it');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `type_address`
--

CREATE TABLE `type_address` (
  `id_type` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `type_address`
--

INSERT INTO `type_address` (`id_type`, `name`) VALUES
(1, 'zamieszkania'),
(2, 'dostawy'),
(3, 'faktury'),
(4, 'tymczasowy'),
(5, 'typ 2'),
(6, 'typ 3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(20) COLLATE utf8mb4_polish_ci NOT NULL,
  `pass` varchar(40) COLLATE utf8mb4_polish_ci NOT NULL,
  `surname` varchar(60) COLLATE utf8mb4_polish_ci NOT NULL,
  `firstname` varchar(30) COLLATE utf8mb4_polish_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_polish_ci NOT NULL,
  `date_add` date NOT NULL DEFAULT current_timestamp(),
  `date_mode` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `pass`, `surname`, `firstname`, `email`, `date_add`, `date_mode`) VALUES
(1, 'pkania', 'a74d41be49e933836818f577170b75d957c3389f', 'Kania', 'Piotr', 'asdf@o2.pl', '2022-12-03', NULL),
(2, 'jnowak', '9ccbef383120409c1c209b777bcdecd53d3bfec2', 'Nowak', 'Zbigniew', 'jnowak@o2.pl', '2022-12-03', '2022-12-04 13:40:44'),
(3, 'anowak', 'tttyyyooo', 'Nowak', 'Anna', '', '2022-12-03', NULL),
(4, 'znowak', 'asdf', 'Nowak', 'Zbigniew', '', '2022-12-03', NULL);

--
-- Wyzwalacze `users`
--
DELIMITER $$
CREATE TRIGGER `dataModyfikacjiuzytkownika` BEFORE UPDATE ON `users` FOR EACH ROW SET new.date_mode = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura widoku `dostawcy`
--
DROP TABLE IF EXISTS `dostawcy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dostawcy`  AS SELECT `products`.`nazwa_produktu` AS `nazwa_produktu`, `providers`.`name` AS `name` FROM (`providers` join `products` on(`products`.`id_product` = `providers`.`id_product`))  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_type` (`id_type`);

--
-- Indeksy dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id_basket`),
  ADD KEY `id_prodact` (`id_prodact`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`);

--
-- Indeksy dla tabeli `promocje`
--
ALTER TABLE `promocje`
  ADD PRIMARY KEY (`id_promo`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeksy dla tabeli `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id_provider`),
  ADD KEY `id_product` (`id_product`);

--
-- Indeksy dla tabeli `type_address`
--
ALTER TABLE `type_address`
  ADD PRIMARY KEY (`id_type`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `basket`
--
ALTER TABLE `basket`
  MODIFY `id_basket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `promocje`
--
ALTER TABLE `promocje`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `providers`
--
ALTER TABLE `providers`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `type_address`
--
ALTER TABLE `type_address`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ograniczenia dla tabeli `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`id_prodact`) REFERENCES `products` (`id_product`);

--
-- Ograniczenia dla tabeli `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
