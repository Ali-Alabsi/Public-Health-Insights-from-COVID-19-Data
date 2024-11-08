CREATE TABLE `covid_deaths` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_cases` int(11) DEFAULT NULL,
  `new_cases` int(11) DEFAULT NULL,
  `total_deaths` int(11) DEFAULT NULL,
  `total_vaccinations` int(11) DEFAULT NULL,
  `people_vaccinated` int(11) DEFAULT NULL,
  `people_fully_vaccinated` int(11) DEFAULT NULL,
  `new_vaccinations` int(11) DEFAULT NULL,
  `people_vaccinated_per_hundred` float DEFAULT NULL,
  `people_fully_vaccinated_per_hundred` float DEFAULT NULL,
  `new_vaccinations_smoothed_per_million` float DEFAULT NULL,
  `population` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;