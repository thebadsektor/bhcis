-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 03:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bhcms_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `archived_patients_record`
--

CREATE TABLE `archived_patients_record` (
  `id` int(11) NOT NULL,
  `patient_data` varchar(1000) NOT NULL,
  `consultation_data` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_patients_record`
--

INSERT INTO `archived_patients_record` (`id`, `patient_data`, `consultation_data`) VALUES
(1, '(34, \'ordillano\', \'homer\', \'I.\', \'\', \'blk 37 lot 70\', \'2001-02-12\', 22, \'Male\', \'908778926\', \'\', None, None, 33, \'None\', \'None\', \'None\')', '((30, 32, \'0/0\', Decimal(\'98.0\'), Decimal(\'27.0\'), Decimal(\'142.0\'), Decimal(\'35.4\'), \'\', \'Masakit ang likod at dibdib pagnaubo /makati ang lalamunan\', \'AURI/ Pneumonia\', datetime.datetime(2023, 4, 3, 14, 54, 21), \'Salbutamol + guatucine 5ml X  5 days, For chart x-ray ,Amoxiciline 15mllin\', \'BHW Edna\', \'\', \'Loresita A. Rebong (Nurse\', datetime.date(2023, 3, 16), None),)'),
(2, '(33, \'Montenegro\', \'Agustin\', \'Allerite\', \'\', \'Blk 29 Lot 32 Site 3\', \'1957-02-14\', 66, \'Male\', \'921218221\', \'\', None, 1, 22, \'Diarrhea,Constipation\', \'Allergy,PTB\', \'None\')', '((29, 31, \'120/80\', Decimal(\'97.0\'), Decimal(\'67.0\'), Decimal(\'156.0\'), Decimal(\'36.5\'), \'none\', \'sipon, makating lalamunan, ubo\', \'sipon\', datetime.datetime(2023, 4, 3, 14, 12, 53), \'Citirizine\', \'BHW Edna\', \'\', \'Loresita A. Rebong (Nurse\', datetime.date(2023, 4, 3), datetime.date(2022, 9, 17)),)'),
(3, '(35, \'ordillano\', \'homer\', \'I.\', \'\', \'blk 37 lot 70\', \'2023-04-11\', 0, \'Male\', \'908778926\', \'\', None, None, 33, \'Others\', \'Cancer\', \'Cancer\')', '()'),
(4, '(32, \'Nuguid\', \'Hasney Phaine\', \'\', \'\', \'Purok 2- Sto Tomas\', \'2013-12-24\', 9, \'Female\', \'09265500185\', \'\', 1, None, 31, \'Cough/Colds\', \'None\', \'None\')', '((28, 30, \'100/70\', Decimal(\'87.0\'), Decimal(\'51.1\'), Decimal(\'169.0\'), Decimal(\'35.7\'), \'\', \'Nilalagnat , masakit ang buong katawan , nagsuka kagabi 4 times\', \'UTI\', datetime.datetime(2023, 4, 3, 14, 2, 57), \'Cotri 800mg /tab BID x 7 days, Paracetamol 500mg INC/UFI\', \'BHW Edna\', \'\', \'Loresita A. Rebong (Nurse\', datetime.date(2018, 10, 4), None),)');

-- --------------------------------------------------------

--
-- Table structure for table `archived_record`
--

CREATE TABLE `archived_record` (
  `id` int(11) NOT NULL,
  `newborn_data` varchar(10000) NOT NULL,
  `immunization_data` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archived_record`
--

INSERT INTO `archived_record` (`id`, `newborn_data`, `immunization_data`) VALUES
(2, '(33, \'Montenegro\', \'Agustin\', \'Allerite\', \'n/a\', \'Erick Tabing\', \'Blk 29 Lot 32 Site 3\', datetime.date(2020, 8, 2), 32, \'Male\', \'0921218221\', 89)', '[(86, 33, Decimal(\'67.0\'), Decimal(\'156.0\'), \'OPV 3\', Decimal(\'0.5\'), datetime.datetime(2023, 4, 2, 2, 5, 17), datetime.date(2023, 3, 2), \'Loresita A. Rebong\', \'Loresita Amoranto Rebong \', \'Left Deltoid (Intradermal\', \'\', \'\'), (87, 33, Decimal(\'67.0\'), De'),
(3, '(34, \'ordillano\', \'homer\', \'I.\', \'\', \'rowena\', \'blk 37 lot 70\', datetime.date(2022, 7, 6), 9, \'Male\', \'099199128763\', 92)', '((91, 34, Decimal(\'67.4\'), Decimal(\'156.0\'), \'Vitamin A Supplementation (6-11 months)\', Decimal(\'0.5\'), datetime.datetime(2023, 4, 7, 18, 47, 17), datetime.date(2023, 4, 4), \'BHW Edna\', \'Loresita Amoranto Rebong \', \'Left Deltoid (Intradermal\', \'Vaccinated\', \'\'), (92, 34, Decimal(\'67.4\'), Decimal(\'1.6\'), \'MCV 2\', Decimal(\'0.5\'), datetime.datetime(2023, 4, 7, 18, 47, 43), datetime.date(2023, 4, 7), \'BHW Edna\', \'Loresita Amoranto Rebong \', \'Left Deltoid (Subcutaneou\', \'Vaccinated\', \'\'))'),
(4, 'None', '()'),
(5, '(35, \'ordillano\', \'homer\', \'I.\', \'n/a\', \'Erick Tabing\', \'blk 37 lot 70\', datetime.date(2023, 4, 5), 0, \'Male\', \'908778926\', None)', '()');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_record`
--

CREATE TABLE `consultation_record` (
  `consultation_number` int(11) NOT NULL,
  `patients_id` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `diastolic` int(11) NOT NULL,
  `pulse_rate` decimal(5,1) DEFAULT NULL,
  `weight` decimal(5,1) DEFAULT NULL,
  `height` decimal(5,1) DEFAULT NULL,
  `temperature` decimal(5,1) DEFAULT NULL,
  `allergies` varchar(255) NOT NULL,
  `consultation` varchar(255) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `treatment_date` datetime NOT NULL,
  `medicine_treatment` varchar(255) NOT NULL,
  `encoder` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `consultant` varchar(25) NOT NULL,
  `encoded_date` date NOT NULL,
  `onset_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultation_record`
--

INSERT INTO `consultation_record` (`consultation_number`, `patients_id`, `systolic`, `diastolic`, `pulse_rate`, `weight`, `height`, `temperature`, `allergies`, `consultation`, `diagnosis`, `treatment_date`, `medicine_treatment`, `encoder`, `remarks`, `consultant`, `encoded_date`, `onset_date`) VALUES
(32, 38, 110, 90, '97.0', '67.0', '159.0', '36.4', 'none', 'ubo', 'sipon', '2023-04-14 10:28:53', 'paracetamol', 'Ronnie Edec', '', 'Loresita A. Rebong (Nurse', '2023-04-14', '2023-04-10'),
(34, 38, 110, 90, '37.5', '67.0', '156.0', '36.5', 'none', 'ubo', 'sipon', '2023-04-14 12:55:20', 'kiss', 'Ronnie Edec', 'rest', 'Loresita A. Rebong (Nurse', '2023-04-14', '2023-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `family_record`
--

CREATE TABLE `family_record` (
  `family_id` int(25) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `patients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_record`
--

INSERT INTO `family_record` (`family_id`, `family_name`, `address`, `contact_no`, `patients_id`) VALUES
(34, 'Edec', 'Blk 29 Lot 32 Site 3', '09212182211', 39),
(35, 'Ordillano', 'Blk 29 Lot 32 Site 3', '921218221', 1),
(36, 'Montenegro', 'blk 37 lot 70', '908778926', 0),
(37, 'Bongat', 'Blk 18 Lot 79 Site 3', '908778926', 0);

-- --------------------------------------------------------

--
-- Table structure for table `gravida`
--

CREATE TABLE `gravida` (
  `patients_id` int(11) NOT NULL,
  `gravida` int(11) NOT NULL,
  `term` varchar(11) NOT NULL,
  `wt_sex` varchar(25) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `facility` varchar(25) NOT NULL,
  `complication` varchar(25) NOT NULL,
  `tt` varchar(25) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `immunization_record`
--

CREATE TABLE `immunization_record` (
  `immunization_number` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `weight` decimal(52,1) DEFAULT NULL,
  `height` decimal(52,1) DEFAULT NULL,
  `immunization` varchar(255) DEFAULT NULL,
  `dose` decimal(52,1) DEFAULT NULL,
  `immunization_date` datetime DEFAULT NULL,
  `encoded` date NOT NULL,
  `encoder` varchar(100) DEFAULT NULL,
  `consultant` varchar(25) NOT NULL,
  `route` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `reason` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `immunization_record`
--

INSERT INTO `immunization_record` (`immunization_number`, `id`, `weight`, `height`, `immunization`, `dose`, `immunization_date`, `encoded`, `encoder`, `consultant`, `route`, `status`, `reason`) VALUES
(93, 36, '67.0', '156.0', 'MCV 2', '0.5', '2023-04-14 10:46:58', '2023-04-14', 'Ronnie Edec', 'Heidi Buera Alcos (Midwif', 'Oral', 'Vaccinated', ''),
(94, 36, '64.4', '156.0', 'PCV 3', '0.5', '2023-04-14 13:02:06', '2023-04-06', 'Ronnie Edec', 'Loresita Amoranto Rebong ', 'Right Deltoid (Subcutaneo', 'Vaccinated', 'may lagnat');

-- --------------------------------------------------------

--
-- Table structure for table `newborn_record`
--

CREATE TABLE `newborn_record` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `suffix` varchar(11) NOT NULL,
  `gname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `sex` text NOT NULL,
  `contact_no` varchar(50) NOT NULL,
  `immunization_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newborn_record`
--

INSERT INTO `newborn_record` (`id`, `lastname`, `firstname`, `middlename`, `suffix`, `gname`, `address`, `birthday`, `age`, `sex`, `contact_no`, `immunization_number`) VALUES
(36, 'Edec', 'Ronnie', 'Velasco', '', 'Raymond', 'Blk 18 Lot 79 Site 3', '2023-01-13', 3, 'Male', '908778926', 94);

-- --------------------------------------------------------

--
-- Table structure for table `patients_record`
--

CREATE TABLE `patients_record` (
  `patients_id` int(11) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `suffix` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `age` int(25) NOT NULL,
  `sex` varchar(25) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `consultation_number` int(11) DEFAULT NULL,
  `prediction_number` int(11) DEFAULT NULL,
  `family_id` int(11) NOT NULL,
  `systems` varchar(25) NOT NULL,
  `past_medical` varchar(25) NOT NULL,
  `family_medical` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients_record`
--

INSERT INTO `patients_record` (`patients_id`, `lastname`, `firstname`, `middlename`, `suffix`, `address`, `birthday`, `age`, `sex`, `contact_no`, `email`, `consultation_number`, `prediction_number`, `family_id`, `systems`, `past_medical`, `family_medical`) VALUES
(38, 'Edec', 'Ronnie', 'Velasco', '', 'Blk 18 Lot 79 Site 3', '1980-04-14', 43, 'Male', '908778926', '', 33, 16, 34, 'Diarrhea', 'Allergy', 'Allergy,Cancer'),
(39, 'Ordillano', 'Homer', 'Ibanez', '', 'Blk 18 Lot 79 Site 3', '1966-02-02', 57, 'Male', '0908778926', '', NULL, 1, 35, 'Constipation,Pain on Urin', 'Allergy,PTB', 'Cancer,History of Surgery'),
(40, 'Montenegro', 'Agustin', 'Allerite', '', 'Blk 29 Lot 32 Site 3', '2000-08-02', 22, 'Male', '0921218221', '', 1, NULL, 34, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `prediction_record`
--

CREATE TABLE `prediction_record` (
  `prediction_number` int(11) NOT NULL,
  `patients_id` int(11) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `smoker` int(11) DEFAULT NULL,
  `total_chol` int(11) NOT NULL,
  `hdl_chol` int(11) NOT NULL,
  `systolic` int(11) NOT NULL,
  `treated_bp` int(11) NOT NULL,
  `risk_score` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prediction_record`
--

INSERT INTO `prediction_record` (`prediction_number`, `patients_id`, `sex`, `age`, `smoker`, `total_chol`, `hdl_chol`, `systolic`, `treated_bp`, `risk_score`) VALUES
(12, 38, 1, 43, 1, 100, 75, 83, 1, 0.016337500845049206),
(14, 38, 1, 43, 1, 202, 75, 110, 0, 0.06966458024008668),
(15, 38, 1, 43, 1, 202, 55, 110, 0, 0.07598062168038858),
(16, 38, 1, 43, 1, 150, 75, 110, 0, 0.031054253559265874);

-- --------------------------------------------------------

--
-- Table structure for table `prenatal_consultation`
--

CREATE TABLE `prenatal_consultation` (
  `age_in_months` int(11) NOT NULL,
  `patients_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `pregnancy_month` int(25) NOT NULL,
  `aog` varchar(25) NOT NULL,
  `bp` varchar(25) NOT NULL,
  `pulse_rate` int(11) NOT NULL,
  `respiratory_rate` int(11) NOT NULL,
  `temperature` decimal(52,2) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` decimal(52,2) NOT NULL,
  `bmi` decimal(52,2) NOT NULL,
  `fundic_height` decimal(52,2) NOT NULL,
  `fetal_heart_tone` varchar(25) NOT NULL,
  `presentation` varchar(25) NOT NULL,
  `unconscious_convulsing` varchar(25) NOT NULL,
  `vaginal_bleeding` varchar(25) NOT NULL,
  `abdominal_pain` varchar(25) NOT NULL,
  `looks` varchar(25) NOT NULL,
  `headache` varchar(25) NOT NULL,
  `breathing` varchar(25) NOT NULL,
  `fever` varchar(25) NOT NULL,
  `vomiting` varchar(25) NOT NULL,
  `edema` varchar(25) NOT NULL,
  `laboratory_utz` varchar(25) NOT NULL,
  `tetanus_toxoid` varchar(25) NOT NULL,
  `iron` varchar(25) NOT NULL,
  `antibiotics` varchar(25) NOT NULL,
  `check_up` date NOT NULL,
  `encoder` varchar(250) NOT NULL,
  `consultant` varchar(250) NOT NULL,
  `encoded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prenatal_record`
--

CREATE TABLE `prenatal_record` (
  `patients_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `age` int(25) NOT NULL,
  `birthday` date NOT NULL,
  `husband` varchar(100) NOT NULL,
  `civil_status` varchar(50) NOT NULL,
  `contact_no` varchar(25) NOT NULL,
  `philhealth_no` varchar(25) NOT NULL,
  `lmp` date NOT NULL,
  `pmp` date NOT NULL,
  `edc` date NOT NULL,
  `ob_score` varchar(25) NOT NULL,
  `past_medical` varchar(50) NOT NULL,
  `family_medical` varchar(50) NOT NULL,
  `history_of_infection` varchar(50) NOT NULL,
  `age_in_months` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prenatal_record`
--

INSERT INTO `prenatal_record` (`patients_id`, `name`, `address`, `age`, `birthday`, `husband`, `civil_status`, `contact_no`, `philhealth_no`, `lmp`, `pmp`, `edc`, `ob_score`, `past_medical`, `family_medical`, `history_of_infection`, `age_in_months`, `id`) VALUES
(22, 'Joseph P. Replentes', 'Blk 18 Lot 79 Site 3', 0, '2023-04-11', 'Agustin Montenegro', 'Single', '09087789261', 'Yes', '2023-04-10', '2023-04-11', '2023-04-26', 'G2 P1 (1,0,0,1)', 'None', 'None', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `recovery_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `name`, `email`, `password`, `user_type`, `recovery_code`) VALUES
(3, 'Agustin', 'agustinmontenegro824@gmail.com', '123', '', '79ebf799-b0f2-4fa8-837a-0c1ec6721da2'),
(6, 'Loresita A. Rebong', 'loresita@gmail.com', '12345', 'admin', ''),
(8, 'BHW Edna', 'edna@gmail.com', '12345', '', ''),
(9, 'BHW Marites Cao', 'marites@gmail.com', '12345', '', ''),
(10, 'admin', 'admin@gmail.com', 'admin123', 'admin', ''),
(11, 'Ronnie Edec', 'Ronnie@gmail.com', '123', '', 'a96685c8-353d-4457-92c1-f2ed3f66cff9'),
(12, 'Agustin', 'agustin@g.com', '12', '', ''),
(13, 'Agustin', 'agustin@gmail.com', '12345', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archived_patients_record`
--
ALTER TABLE `archived_patients_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archived_record`
--
ALTER TABLE `archived_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultation_record`
--
ALTER TABLE `consultation_record`
  ADD PRIMARY KEY (`consultation_number`),
  ADD KEY `fk_patients_record` (`patients_id`);

--
-- Indexes for table `family_record`
--
ALTER TABLE `family_record`
  ADD PRIMARY KEY (`family_id`);

--
-- Indexes for table `gravida`
--
ALTER TABLE `gravida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prenatal_record_gravida` (`patients_id`);

--
-- Indexes for table `immunization_record`
--
ALTER TABLE `immunization_record`
  ADD PRIMARY KEY (`immunization_number`),
  ADD KEY `fk_immunization_record_newborn_record` (`id`);

--
-- Indexes for table `newborn_record`
--
ALTER TABLE `newborn_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients_record`
--
ALTER TABLE `patients_record`
  ADD PRIMARY KEY (`patients_id`),
  ADD KEY `fk_patients_record_family_record` (`family_id`);

--
-- Indexes for table `prediction_record`
--
ALTER TABLE `prediction_record`
  ADD PRIMARY KEY (`prediction_number`),
  ADD KEY `fk_patients_id` (`patients_id`);

--
-- Indexes for table `prenatal_consultation`
--
ALTER TABLE `prenatal_consultation`
  ADD PRIMARY KEY (`age_in_months`),
  ADD KEY `fk_prenatal_consultation_prenatal_record` (`patients_id`);

--
-- Indexes for table `prenatal_record`
--
ALTER TABLE `prenatal_record`
  ADD PRIMARY KEY (`patients_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archived_patients_record`
--
ALTER TABLE `archived_patients_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `archived_record`
--
ALTER TABLE `archived_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `consultation_record`
--
ALTER TABLE `consultation_record`
  MODIFY `consultation_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `family_record`
--
ALTER TABLE `family_record`
  MODIFY `family_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `gravida`
--
ALTER TABLE `gravida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `immunization_record`
--
ALTER TABLE `immunization_record`
  MODIFY `immunization_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `newborn_record`
--
ALTER TABLE `newborn_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `patients_record`
--
ALTER TABLE `patients_record`
  MODIFY `patients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `prediction_record`
--
ALTER TABLE `prediction_record`
  MODIFY `prediction_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `prenatal_consultation`
--
ALTER TABLE `prenatal_consultation`
  MODIFY `age_in_months` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `prenatal_record`
--
ALTER TABLE `prenatal_record`
  MODIFY `patients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultation_record`
--
ALTER TABLE `consultation_record`
  ADD CONSTRAINT `fk_patients_record` FOREIGN KEY (`patients_id`) REFERENCES `patients_record` (`patients_id`);

--
-- Constraints for table `gravida`
--
ALTER TABLE `gravida`
  ADD CONSTRAINT `fk_prenatal_record_gravida` FOREIGN KEY (`patients_id`) REFERENCES `prenatal_record` (`patients_id`),
  ADD CONSTRAINT `gravida_ibfk_1` FOREIGN KEY (`patients_id`) REFERENCES `prenatal_record` (`patients_id`);

--
-- Constraints for table `immunization_record`
--
ALTER TABLE `immunization_record`
  ADD CONSTRAINT `fk_immunization_record_newborn_record` FOREIGN KEY (`id`) REFERENCES `newborn_record` (`id`),
  ADD CONSTRAINT `immunization_record_ibfk_1` FOREIGN KEY (`id`) REFERENCES `newborn_record` (`id`);

--
-- Constraints for table `patients_record`
--
ALTER TABLE `patients_record`
  ADD CONSTRAINT `fk_patients_record_family_record` FOREIGN KEY (`family_id`) REFERENCES `family_record` (`family_id`);

--
-- Constraints for table `prediction_record`
--
ALTER TABLE `prediction_record`
  ADD CONSTRAINT `fk_patients_id` FOREIGN KEY (`patients_id`) REFERENCES `patients_record` (`patients_id`),
  ADD CONSTRAINT `prediction_record_ibfk_1` FOREIGN KEY (`patients_id`) REFERENCES `patients_record` (`patients_id`);

--
-- Constraints for table `prenatal_consultation`
--
ALTER TABLE `prenatal_consultation`
  ADD CONSTRAINT `fk_prenatal_consultation_prenatal_record` FOREIGN KEY (`patients_id`) REFERENCES `prenatal_record` (`patients_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
