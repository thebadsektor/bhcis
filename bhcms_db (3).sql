-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2023 at 10:52 PM
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
-- Database: `bhcms_db`
--

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
(4, 'None', '()');

-- --------------------------------------------------------

--
-- Table structure for table `consultation_record`
--

CREATE TABLE `consultation_record` (
  `consultation_number` int(11) NOT NULL,
  `patients_id` int(11) NOT NULL,
  `bp` varchar(10) DEFAULT NULL,
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

INSERT INTO `consultation_record` (`consultation_number`, `patients_id`, `bp`, `pulse_rate`, `weight`, `height`, `temperature`, `allergies`, `consultation`, `diagnosis`, `treatment_date`, `medicine_treatment`, `encoder`, `remarks`, `consultant`, `encoded_date`, `onset_date`) VALUES
(1, 3, '0.0', '112.0', '16.0', '0.0', '35.5', 'none', 'Maraming singaw at maraming botlig sa kamay', 'T/C AFPT$ mouth disease', '2023-04-01 19:33:53', 'Daktarin Oral Gel', 'Agustin', 'proper hygiene', 'Heidi B. Alcos (Midwife)', '2023-03-28', '0000-00-00'),
(2, 4, '0.0', '163.0', '7.1', '64.0', '36.9', 'none', 'Ubo\'t Sipon', 'Cold', '2023-04-01 18:57:39', 'Cetrizine drops 0.6 ml on @ mgl x5 day', 'Agustin', '', 'Heidi B. Alcos (Midwife)', '2023-03-28', '0000-00-00'),
(4, 6, '120/90', '80.0', '86.0', '169.0', '36.4', 'none', 'Pa sumpong sumpong ang sakit ng singit', 'none', '2023-04-01 19:07:41', 'T/C UTI', 'Loresita A. Rebong', 'VIT B Complex #30 1 cap daily, FOX VA CBC, ', 'Heidi B. Alcos (Midwife)', '2023-03-28', '0000-00-00'),
(5, 7, '110/80', '80.0', '54.0', '163.0', '37.4', 'none', 'pabalik-balik ang lagnat', 'none', '2023-04-01 19:07:16', 'AURI', 'Loresita A. Rebong', 'Ambroxtab 30mc 1 tub 5x day, Cetrizine tab #5 OD at bedtime, Paracetamol tab 500g # 4 hrs per, Vit B Complex OD', 'Heidi B. Alcos (Midwife)', '2023-03-28', '0000-00-00'),
(8, 1, '0.0', '127.0', '15.0', '0.0', '36.6', '', 'Nilagnat Kahapon at nagtatae ,madilaw ang ihi', '', '2023-04-01 19:08:01', 'AOE', 'Loresita A. Rebong', 'Oresol, Zinc Sulfate Supp 5ml OD X 14 oz, Erethra  Od x 3-5 dy, ', 'Loresita A. Rebong (Nurse', '2023-03-30', '0000-00-00'),
(9, 11, '0.0', '147.0', '8.5', '67.0', '36.6', 'none', 'May ubot sipon', 'none', '2023-04-01 19:08:20', '', 'BHW Edna', 'Ambroxol 0.5 ml BID x SD . Neozep 0.5 ml TD x SD', 'Loresita A. Rebong (Nurse', '2023-03-30', '0000-00-00'),
(10, 12, '0.0', '105.0', '12.0', '88.0', '36.6', 'none', 'Cough and cold', 'none', '2023-04-01 19:06:47', 'LRTI', 'BHW Edna', 'Ambroxol supp 2.5 mlg. BUD x SD , Neozep supplement 2.5 mg.  TD x SD', 'Loresita A. Rebong (Nurse', '2023-03-30', '0000-00-00'),
(13, 20, '120/80', '37.5', '67.0', '1.6', '36.6', 'hipon', 'sipon, makating lalamunan, ubo', 'sipon', '2023-04-01 19:29:04', 'paracetamol', 'BHW Edna', 'pahinga ka muna', 'Heidi B. Alcos (Midwife)', '2023-03-28', '2022-08-09'),
(14, 22, '110/80', '79.0', '57.7', '0.0', '36.7', '', '2 days nilalagnat at inuubo at may plema', 'Allergy', '2023-04-03 12:53:13', 'Loratadine 10mg/tab BID X 5 days, Ascorbic Acid tab OD, Vitamin B Complex tab OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2018-06-11', '0000-00-00'),
(15, 22, '130/80', '71.0', '59.0', '0.0', '36.4', '', '4 days na may ubo\'t sipon', 'URTI', '2023-04-03 12:55:56', 'For CXP view, Cetirizine, vitamin B complex, cont ambroxol', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2022-07-13', '0000-00-00'),
(16, 22, '0/0', '72.0', '59.0', '148.0', '36.6', '', '5 days namamaga at makirot ang paang kaliwa', '', '2023-04-03 12:59:02', 'Ox BUA, Vitamin B complex, celecoxio 200mg BID PRN, advised', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2023-02-27', '2023-02-22'),
(17, 23, '0/0', '100.0', '15.5', '98.0', '37.4', '', '2 weeks na may ubo , nilalagnat po kagabi', 'Allergy', '2023-04-03 13:05:22', 'Cetirizine syrup , 3ml DD HS x 5-7days , Ascorbic Acid Syrup 3ml OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2018-05-10', '0000-00-00'),
(18, 23, '0/0', '83.0', '15.4', '98.0', '36.0', 'none', '4 days nilalagnat  on and off', 'URTI', '2023-04-03 13:07:47', 'Symdex Syrup 3ml TID x 5 days, Ascorbic Syrup 3 ml OD , Propan TLC Syrup 3ml OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2018-08-24', '0000-00-00'),
(19, 23, '0/0', '0.0', '18.3', '0.0', '36.6', 'none', 'Fever ', 'URTI', '2023-04-03 13:11:04', 'Paracetamol 200mg, 5 ml, Lagundi Syrup 5ml TID x 7 days, Cetirizine Syrup 5ml OD x 7 days, AA 5 ml OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2019-10-10', '0000-00-00'),
(20, 24, '0/0', '144.0', '8.3', '70.0', '37.8', 'none', '3 days na nilalagnat, inuubo at sipon', 'URTI', '2023-04-03 13:20:33', 'Symdex D drops 15 ml TID x 3 more days, Carbo drops 75 ml TID X 5 days, INC Ofi paracetamol drops 1.2ml 94 PRN', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2019-07-15', '0000-00-00'),
(21, 25, '', '101.0', '9.3', '0.0', '36.1', '', '5 days na inuubo at sinisipon', 'URTI', '2023-04-03 13:28:45', 'Ambroxol hel 6mg drops 1.5ml BID x 5 days, Neozep drops 1.2ml TID x  5 days AA + Zinc 1.5 ml', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2016-09-19', '0000-00-00'),
(22, 26, '', '0.0', '14.1', '0.0', '36.6', '', '2 araw inuubo at sipon', 'URTI', '2023-04-03 13:34:07', 'Lagundi Syrup 5ml TID x 5 days, Cetirizine Syrup 5ml OD x 7 days, Paracetamol 250mg, AA 5ml OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2021-01-21', '0000-00-00'),
(23, 26, '', '100.0', '13.5', '0.0', '36.6', '', '3 days na may ubo\'t sipon', 'URTI', '2023-04-03 13:36:55', 'Carbocistine syrup 5ml, Cetirizine syrup 5ml OD, Paracetamol 250mg 4ml ', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2021-07-19', '0000-00-00'),
(24, 27, '', '83.0', '34.0', '0.0', '37.4', '', 'Masakit mula balakang hanggang pababa sa paa', '', '2023-04-03 13:42:20', 'Paracetamol 325mg 1 tab ', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2020-10-01', '0000-00-00'),
(25, 28, '100/70', '92.0', '47.2', '0.0', '36.2', '', '3 months na dumarami ang sugat sa paa', 'Skin OSE', '2023-04-03 13:48:41', 'Mupirucin Ointment, Loratadine Tab OD', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2017-10-02', '0000-00-00'),
(26, 28, '100/80', '85.0', '50.0', '0.0', '36.6', '', 'May sugat po ang binti', 'Skin Disease', '2023-04-03 13:50:50', 'Beta metasole cream apply TID', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2021-03-04', '0000-00-00'),
(27, 29, '', '98.0', '12.0', '0.0', '36.0', '', 'May lagnat Kahapon', 'T/C AVI', '2023-04-03 13:57:05', 'Paracetamol 120mg 15ml 8yr, 7.5 PRN. AA syrup 5ml OD, INC OFI for U/A if fever persist', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2017-04-03', '0000-00-00'),
(28, 30, '100/70', '87.0', '51.1', '169.0', '35.7', '', 'Nilalagnat , masakit ang buong katawan , nagsuka kagabi 4 times', 'UTI', '2023-04-03 14:02:57', 'Cotri 800mg /tab BID x 7 days, Paracetamol 500mg INC/UFI', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2018-10-04', '0000-00-00'),
(29, 31, '120/80', '97.0', '67.0', '156.0', '36.5', 'none', 'sipon, makating lalamunan, ubo', 'sipon', '2023-04-03 14:12:53', 'Citirizine', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2023-04-03', '2022-09-17'),
(30, 32, '0/0', '98.0', '27.0', '142.0', '35.4', '', 'Masakit ang likod at dibdib pagnaubo /makati ang lalamunan', 'AURI/ Pneumonia', '2023-04-03 14:54:21', 'Salbutamol + guatucine 5ml X  5 days, For chart x-ray ,Amoxiciline 15mllin', 'BHW Edna', '', 'Loresita A. Rebong (Nurse', '2023-03-16', '0000-00-00');

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
(1, 'Replentes', 'B-19 L-79 Site 3', '', 4),
(2, 'Rombaiz', 'Blk 54 Lot 17A Site 3', '09481906669', 5),
(14, 'Sarol', 'Blk 29 Lot 12 A ', '', 1),
(15, 'Macavinta', 'Blk 27 Lot 20 Site 3', '09157149603', 1),
(18, 'Pobe', 'Purok-2 Sto Tomas', '09264963745', 2),
(20, 'Morante', 'Blk-54 Lot-12A Site 3 Purok 3', '', 12),
(21, 'Rivera', 'Blk. 47 Lot 9 Site 3 Sto.Tomas', '09750649161', 1),
(22, 'Montenegro', 'Blk 29 Lot 32 Site 3', '09217927915', 21),
(23, 'Mercado', 'Blk 51 Lot 24 Phase 1 Site 3', '09483624945', 1),
(24, 'Remedios', 'Blk 58 Lot 30 Site 3', '', 1),
(25, 'Ocillada', 'Blk. 21 Lot 9B Site 3', '', 1),
(26, 'Magno', 'P -1 Sto.Tomas Cal.Lag.', '', 1),
(27, 'Jorge', 'Blk. 62 Lot 73', '', 1),
(28, 'Hopia', 'Purok 3A', '', 1),
(29, 'Santos', 'Blk.73 Lot 10 Site 3', '', 1),
(30, 'Broncano', 'Blk.47 Lot 37 NHA', '', 1),
(31, 'Nuguid', 'Purok 2- Sto Tomas Cal.Lag ', '', 1),
(32, 'Natiag', 'Blk 26 Lot 45', '09464322561', 1);

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

--
-- Dumping data for table `gravida`
--

INSERT INTO `gravida` (`patients_id`, `gravida`, `term`, `wt_sex`, `mode`, `facility`, `complication`, `tt`, `id`) VALUES
(19, 1, 'Full', 'F', 'NSO', 'HOME', '2008', '', 13),
(19, 2, 'Full', 'M', 'CS', 'Immaculate Conception, Sa', '', '', 14),
(20, 1, 'Full', '2-26-2019 M', 'NSD', 'Hospital', '', '8712', 15),
(21, 1, 'Full ', 'M/2017', 'NSD', 'PCGH', 'None', 'T1 and T2', 16),
(21, 2, 'FT', 'F/2021', 'NSD', 'PCGH', 'none', 'T3', 17),
(16, 1, 'FT', 'M/2018', 'NSD', 'LMS Santa Cruz', 'G6PD', 'T1 and T2', 18);

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
(16, 4, '12.0', '90.0', 'IPV 2', '0.0', '2023-04-04 02:10:04', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(17, 5, '7.0', '74.0', 'MCV 1', '0.0', '2023-04-04 02:10:45', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(18, 5, '7.0', '74.0', 'IPV 2', '0.0', '2023-04-04 02:12:24', '2023-03-28', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(19, 6, '9.0', '75.0', 'MCV 2', '0.0', '2023-04-04 02:12:44', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(20, 7, '9.5', '70.0', 'IPV 2', '0.0', '2023-04-04 02:13:02', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(21, 7, '9.5', '70.0', 'MCV 1', '0.0', '2023-04-04 02:13:28', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intradermal', 'Vaccinated', ''),
(22, 8, '3.3', '49.0', 'BCG', '0.5', '2023-04-03 14:44:50', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Intradermal', 'Deferred', 'may lagnat'),
(23, 9, '3.3', '0.0', 'BCG', '0.0', '2023-04-04 02:11:40', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(34, 10, '7.4', '66.0', 'Vitamin A Supplementation (6-11 months)', '0.0', '2023-04-04 02:11:20', '2023-04-01', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(35, 11, '11.0', '79.2', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:14:03', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(36, 13, '9.1', '79.5', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:16:22', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(37, 14, '6.4', '57.0', 'Penta 2', '0.0', '2023-04-04 02:16:49', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(38, 14, '6.4', '57.0', 'OPV 2', '0.0', '2023-04-04 02:17:06', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(39, 14, '6.4', '57.0', 'PCV 2', '0.0', '2023-04-04 02:17:19', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(40, 15, '9.0', '71.4', 'PCV 3', '0.0', '2023-04-04 02:17:39', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(41, 15, '9.0', '71.4', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:17:58', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(42, 16, '9.5', '79.5', 'PCV 3', '0.0', '2023-04-04 02:18:37', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(43, 16, '9.5', '79.5', 'MCV 2', '0.0', '2023-04-04 02:19:02', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Subcutaneo', 'Vaccinated', ''),
(44, 16, '9.5', '79.5', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:19:39', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intramuscu', 'Vaccinated', ''),
(45, 17, '8.8', '65.3', 'Penta 2', '0.0', '2023-04-04 02:19:58', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Thigh (Intramuscula', 'Vaccinated', ''),
(46, 17, '8.8', '65.3', 'OPV 2', '0.0', '2023-04-04 02:20:14', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(47, 17, '8.8', '65.3', 'PCV 2', '0.0', '2023-04-04 02:20:28', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intramuscu', 'Vaccinated', ''),
(48, 18, '5.0', '54.5', 'Penta 1', '0.0', '2023-04-04 02:20:51', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(49, 18, '5.0', '54.5', 'OPV 1', '0.0', '2023-04-04 02:21:09', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(50, 18, '5.0', '54.5', 'PCV 1', '0.0', '2023-04-04 02:21:22', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intramuscu', 'Vaccinated', ''),
(51, 19, '12.1', '90.0', 'PCV 3', '0.0', '2023-04-04 02:21:44', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intramuscu', 'Vaccinated', ''),
(52, 20, '8.8', '74.3', 'MCV 2', '0.0', '2023-04-04 02:22:06', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intramuscu', 'Vaccinated', ''),
(53, 20, '8.8', '74.3', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:22:32', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(54, 21, '12.0', '82.0', 'PCV 3', '0.0', '2023-04-04 02:22:50', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(55, 21, '12.0', '82.0', 'MCV 2', '0.0', '2023-04-04 02:23:10', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(56, 21, '12.0', '82.0', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:23:29', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(57, 22, '12.4', '83.0', 'IPV 2', '0.0', '2023-04-04 02:24:38', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(58, 22, '12.4', '83.0', 'MCV 2', '0.0', '2023-04-04 02:24:53', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(59, 22, '12.4', '83.0', 'Vitamin A Supplementation (12-59 months[1])', '0.0', '2023-04-04 02:25:17', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(60, 23, '4.9', '54.5', 'Penta 1', '0.0', '2023-04-04 02:25:43', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(61, 23, '4.9', '54.5', 'OPV 1', '0.0', '2023-04-04 02:26:00', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(62, 23, '4.9', '54.5', 'PCV 1', '0.0', '2023-04-04 02:26:12', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(63, 24, '5.7', '59.0', 'Penta 1', '0.0', '2023-04-04 02:26:35', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(64, 24, '5.7', '59.0', 'OPV 1', '0.0', '2023-04-04 02:26:54', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(65, 24, '5.7', '59.0', 'PCV 1', '0.0', '2023-04-04 02:27:11', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(66, 25, '4.6', '54.0', 'Penta 1', '0.0', '2023-04-04 02:27:38', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(67, 25, '4.6', '54.0', 'OPV 1', '0.0', '2023-04-04 02:28:06', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(68, 25, '4.6', '54.0', 'PCV 1', '0.0', '2023-04-04 02:28:24', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(69, 26, '5.0', '58.6', 'PCV 3', '0.0', '2023-04-04 02:28:53', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(70, 26, '5.0', '58.6', 'Vitamin A Supplementation (6-11 months)', '0.0', '2023-04-04 02:29:15', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(71, 27, '6.1', '61.7', 'Penta 2', '0.0', '2023-04-04 02:29:43', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(72, 27, '6.1', '61.7', 'OPV 2', '0.0', '2023-04-04 02:29:58', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Intradermal', 'Vaccinated', ''),
(73, 27, '6.1', '61.7', 'PCV 2', '0.0', '2023-04-04 02:30:49', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Thigh (Intramuscular', 'Vaccinated', ''),
(74, 28, '6.8', '67.0', 'IPV 2', '0.0', '2023-04-04 02:31:07', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Intramuscul', 'Vaccinated', ''),
(75, 28, '6.8', '67.0', 'MCV 1', '0.0', '2023-04-04 02:31:20', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(76, 30, '8.1', '75.5', 'MCV 1', '0.0', '2023-04-04 02:31:49', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(77, 30, '8.1', '75.5', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:32:09', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(78, 31, '5.3', '0.0', 'PCV 1', '0.0', '2023-04-04 02:32:33', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Intraderma', 'Vaccinated', ''),
(79, 12, '0.0', '0.0', 'PCV 3', '0.0', '2023-04-04 02:15:23', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Subcutaneo', 'Vaccinated', ''),
(80, 12, '0.0', '0.0', 'MCV 1', '0.0', '2023-04-04 02:15:42', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Right Deltoid (Subcutaneo', 'Vaccinated', ''),
(81, 12, '0.0', '0.0', 'Vitamin A Supplementation (12-59 months[2])', '0.0', '2023-04-04 02:16:05', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(82, 32, '8.5', '71.4', 'MCV 2', '0.0', '2023-04-04 02:32:56', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Left Deltoid (Subcutaneou', 'Vaccinated', ''),
(83, 32, '8.5', '71.4', 'Vitamin A Supplementation (12-59 months[1])', '0.0', '2023-04-04 02:33:18', '2023-03-30', 'BHW Edna', 'Loresita Amoranto Rebong ', 'Oral', 'Vaccinated', ''),
(84, 10, '67.0', '156.0', 'OPV 1', '0.5', '2023-04-01 16:42:46', '2023-04-01', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Left Deltoid (Intradermal', '', ''),
(85, 10, '67.0', '156.0', 'OPV 2', '0.5', '2023-04-01 16:42:23', '2023-04-01', 'BHW Edna', 'Heidi Buera Alcos (Midwif', 'Oral', '', '');

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
(1, 'Aguilar', 'John Michael', 'B.', 'n/a', '', 'Blk 66 Lot 5', '2021-11-18', 16, 'Male', '', 25),
(2, 'Mangubat', 'Sariah Amber', 'O.', 'n/a', '', '', '2022-12-23', 3, 'Female', '', 0),
(3, 'Goting', 'Nico George ', 'Ruz', 'n/a', '', '', '2021-01-27', 26, 'Male', '', 0),
(4, 'Collado', 'Prince Keiry', 'C.', 'n/a', '', '', '2021-03-20', 24, 'Male', '', 1),
(5, 'Collado', 'Princess Kaily', 'C.', '', '', '', '2021-03-20', 24, 'Female', '', 18),
(6, 'Ampioco', 'Zharick Elijah', 'none', '', '', 'Phase 1', '2021-11-10', 16, 'Male', '', 1),
(7, 'Marfora', 'Thalia Faye', 'V.', '', '', 'Bellparc', '2021-12-18', 15, 'Female', '', 21),
(8, 'Ulat', 'Jhoella', 'E.', '', '', 'Phase 1', '2023-03-24', 0, 'Female', '', 1),
(9, 'Ciervas', 'Bien Ellejhey', 'D.', '', '', 'Phase 2', '2023-03-25', 0, 'Male', '', 24),
(10, 'Follero', 'Clarence', 'Ubaldo', 'n/a', 'Jerrlyn U. Follero', 'Blk 10 Lot 81', '2022-09-26', 6, 'Male', '09387857561', 35),
(11, 'Morales', 'Atarah', 'none', 'none', 'Daisy Moraled', 'Blk 19 Lot 70 site 3', '2021-06-05', 21, 'Female', '09083566876', 1),
(12, 'Serrano', 'Hero Arkiel', '', '', 'Ginalyn Obel', 'Blk 39 Lot 13 Site 3', '2021-09-12', 18, 'Male', '09361454501', 1),
(13, 'Fetil', 'Princess Chloe', 'R.', '', 'Lorna Rivera', 'Blk-18 Lot-25 Site 3', '2021-07-13', 20, 'Female', '09108551499', 1),
(14, 'Manlulu', 'Eunice', 'Tubanza', '', 'Lorie Jean Betonio Tubanza', 'Blk-23 Lot-58 Site 3', '2022-12-08', 3, 'Female', '09481569161', 1),
(15, 'Nacpil', 'Caijadon', 'Cabalhao', '', 'Carmen P. Cabalhao', 'Blk-20 Lot-58 Site 3', '2022-09-22', 6, 'Male', '', 1),
(16, 'Deladia', 'Raymart', 'P.', '', 'Maricel Partillo', 'Blk-26 Lot-19 Site 3', '2021-07-25', 20, 'Male', '', 1),
(17, 'Maglente', 'Arlyn', 'Vallesteros', '', 'Regine Bilog Vallesteros', 'Blk-63 Lot-39 Site 3', '2022-10-07', 5, 'Female', '09459953717', 47),
(18, 'Bubay', 'Aliyah Faye', 'M.', '', 'Rhealiza B. Mansalapus', 'Blk-27 Lot-57 Site 3', '2023-02-03', 1, 'Female', '', 1),
(19, 'Fisalbon', 'Minea ash', '', '', 'Mariella', 'Blk-28 Lot-49 Site 3', '2021-01-27', 26, 'Female', '', 1),
(20, 'Porsona', 'Raniesha', 'onoga', '', 'Janery Remaano Onoga', 'Blk-50 Lot-3 Site 3', '2022-03-28', 12, 'Female', '09976222151', 1),
(21, 'Quirequire', 'Princess Cia', '', '', 'Danica Bernardos', 'Blk-38 Lot-4A Site 3', '2021-06-27', 21, 'Female', '09187716849', 1),
(22, 'Cabalhao', 'Onewa Gwen', '', '', 'Ailanie Alvarez', 'Blk-19 Lot-68 Site 3', '2021-09-30', 18, 'Female', '', 1),
(23, 'Ramirez', 'Ivan', 'Gabane', '', 'Aileen Delos Santos Gabane', 'Blk-48 Lot-42 Site 3', '2023-02-10', 1, 'Male', '09268763943', 1),
(24, 'Ancla', 'Janella', 'Betcher', '', 'Melanie Betcher', 'Blk-38 Lot-4A', '2023-01-15', 2, 'Female', '09187716849', 1),
(25, 'Nogalada', 'Eros rein', 'Montilla', '', 'Rea mae Quicay Montilla', 'BLk-26 Lot-32 NHA', '2023-02-11', 1, 'Male', '09308872000', 1),
(26, 'Magsino', 'Althea Louise', 'Bacsid', '', 'Liamie P. Bacsid', 'Blk-50 Lot-2 Site 3', '2022-09-30', 6, 'Female', '09665996798', 1),
(27, 'Dalampasig', 'Yasher Krish Lei', 'R.', '', 'Natalia Rivera', 'Blk-62 Lot-43 Site 3 ', '2022-12-18', 3, 'Male', '09956624796', 1),
(28, 'Tasong', 'Eros Kalix', 'Constantino', '', 'Alynna Constantino', 'Blk-30 Lot-26 Site 3', '2022-06-22', 9, 'Male', '09057721478', 1),
(29, 'Abanto', 'Kian Arius', 'Mondejar', '', 'Alexxa mae Mondejar', 'Blk-48 Santo Tomas', '2023-02-12', 1, 'Male', '', NULL),
(30, 'Claridad', 'Lian Jane', 'M.', '', 'Annie Martinada', 'Blk-19 Lot-8B Site 3', '2021-12-18', 15, 'Female', '', 1),
(31, 'Mier', 'Niel Jace', 'Cayoyong', '', 'Darlene Patiño Cayoyong', 'Blk-18 Lot-15B Site 3', '2023-02-12', 1, 'Male', '', 1),
(32, 'Caintic', 'Kyren Dale', 'Villamor', 'n/a', 'Jealyn Gad Villamor', 'B-36 Lot 92 Site 3', '2022-03-12', 12, 'Male', '09503391145', 1);

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
(1, 'Pobe', 'Ezeqiel', 'Navarette', 'n/a', 'Purok 2- Sto Tomas', '2019-04-10', 3, 'Male', '09264963745', '', 1, NULL, 18, '', '', ''),
(3, 'Replentes', 'Josep', 'P.', 'n/a', 'Blk 18 Lot 79 Site 3', '2018-10-28', 4, 'Male', 'none', '', 7, 18, 1, '', '', ''),
(4, 'Rombaiz', 'Maria Christine', 'Guerora', 'n/a', 'Blk 54 Lot 17A Site 3', '2016-08-02', 6, 'Female', '09481906669', '', 1, NULL, 2, '', '', ''),
(6, 'Vetchelyn ', 'Sarol', 'E.', 'n/a', 'Blk 29 Lot 12 A', '1976-07-05', 46, 'Female', '', '', 1, NULL, 14, '', '', ''),
(7, 'Macavinta', 'Errol', 'Gomuza', 'n/a', 'Blk 27 Lot 20 Site 3', '1977-12-29', 45, 'Male', '09157149603', '', 1, NULL, 15, '', '', ''),
(11, 'Morante', 'Jailhynn Yhara', 'Laguardia', '', 'Blk-54 Lot-12A Site 3 Purok 3', '2022-09-06', 0, 'Female', '', '', 1, NULL, 20, '', '', ''),
(12, 'Rivera', 'Sofia ward', 'n/a', 'n/a', 'Blk-47 Lot 9. Site 3 Sto.tomas', '2019-12-11', 3, 'Female', '09750649161', '', 1, NULL, 21, '', '', ''),
(16, 'Mercado', 'Gretchen', 'Riños', 'n/a', 'Blk 54 Lot 24 Phase 1 Site 3', '1978-05-22', 44, 'Female', '0948362945', '', NULL, NULL, 23, '', '', ''),
(20, 'Montenegro', 'Agustin', 'Allerite', '', 'Blk 29 Lot 32 Site 3', '2000-08-02', 22, 'Male', '09217927914', '', 1, NULL, 22, 'Fever,Cough/Colds', 'Asthma,Heart Disease', 'Allergy,PTB,Cancer'),
(22, 'Remedios', 'Jacob', 'Abragon', '', 'Blk 58 Lot 30 Site 3', '1958-02-24', 65, 'Female', '', '', 16, NULL, 24, 'Fever,Cough/Colds', 'None', 'None'),
(23, 'Pequinio', 'Princess Nathalie', 'Ocillada', '', 'Blk. 21 Lot 9B Site 3', '2015-02-25', 8, 'Female', '', '', 19, NULL, 25, 'Fever,Cough/Colds', 'None', 'None'),
(24, 'Billano', 'Makoceo', 'Ludwig', '', 'P-1 Sto.Tomas Cal.Lag', '2018-09-25', 4, 'Male', '', '', 1, NULL, 26, 'Fever,Cough/Colds', 'None', 'None'),
(25, 'Morante', 'Jaiyesha yen', '', '', 'Blk.54 Lot 12A NHA', '2015-08-12', 7, 'Male', '', '', 1, NULL, 20, 'Cough/Colds', 'None', 'Diabetes Mellitus'),
(26, 'Jorge', 'Ysabella Sachie', '', '', 'Blk.62 Lot 73', '2015-10-20', 7, 'Male', '', '', 23, NULL, 27, 'Cough/Colds', 'None', 'None'),
(27, 'Paglinawan', 'Jamit', '', '', 'Purok 3A', '2008-05-14', 14, 'Male', '', '', 1, NULL, 28, 'Fever', 'None', 'Hypertension'),
(28, 'Santos', 'Cecil', '', '', 'Blk.73 Lot 10 Site 3', '1988-02-02', 35, 'Female', '', '', 26, NULL, 29, 'None', 'None', 'Asthma'),
(29, 'Broncano', 'Drake Daniel', '', '', 'Blk.47 Lot 37 NHA', '2015-03-04', 8, 'Male', '', '', 1, NULL, 30, 'None', 'None', 'None'),
(30, 'Pobe', 'Cyrus', '', '', 'Purok 2', '2001-09-27', 21, 'Male', '', '', 1, NULL, 18, 'Fever,Pain on Urination', 'None', 'Hypertension,Asthma,PTB'),
(31, 'Natiag', 'Annaliza', 'Baniel', '', 'Blk 26 Lot 45 Site 3', '1969-11-14', 53, 'Female', '09464322561', '', 1, NULL, 32, 'None', 'None', 'None'),
(32, 'Nuguid', 'Hasney Phaine', '', '', 'Purok 2- Sto Tomas', '2013-12-24', 9, 'Female', '09265500185', '', 1, NULL, 31, 'Cough/Colds', 'None', 'None'),
(33, 'Montenegro', 'Agustin', 'Allerite', '', 'Blk 29 Lot 32 Site 3', '1957-02-14', 66, 'Male', '921218221', '', NULL, 165, 22, 'Diarrhea,Constipation', 'Allergy,PTB', 'None');

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
  `sbp` int(11) NOT NULL,
  `treated_bp` int(11) NOT NULL,
  `risk_score` decimal(50,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prediction_record`
--

INSERT INTO `prediction_record` (`prediction_number`, `patients_id`, `sex`, `age`, `smoker`, `total_chol`, `hdl_chol`, `sbp`, `treated_bp`, `risk_score`) VALUES
(1, 33, 0, 75, 0, 202, 26, 112, 1, '0.00'),
(2, 33, 0, 75, 0, 202, 26, 112, 1, '0.00'),
(3, 33, 1, 58, 0, 221, 67, 111, 1, '0.07'),
(4, 33, 0, 64, 1, 291, 13, 97, 0, '0.00'),
(5, 33, 0, 68, 0, 256, 48, 105, 1, '0.00'),
(6, 33, 0, 68, 0, 256, 48, 105, 1, '0.00'),
(7, 33, 0, 63, 0, 224, 20, 159, 0, '0.00'),
(8, 33, 1, 62, 0, 202, 55, 141, 0, '0.13'),
(9, 33, 1, 77, 0, 201, 36, 140, 0, '0.25'),
(10, 33, 1, 39, 1, 288, 60, 132, 0, '0.16'),
(11, 33, 1, 62, 0, 218, 74, 133, 1, '0.10'),
(12, 33, 1, 76, 1, 223, 19, 196, 1, '1.00'),
(13, 33, 0, 62, 0, 262, 6, 102, 0, '0.00'),
(14, 33, 1, 77, 0, 106, 52, 83, 0, '0.10'),
(15, 33, 0, 62, 0, 262, 6, 102, 0, '0.00'),
(16, 33, 1, 55, 1, 299, 19, 123, 1, '0.46'),
(17, 33, 0, 49, 0, 242, 36, 83, 0, '0.00'),
(18, 33, 0, 44, 1, 256, 67, 81, 0, '0.00'),
(19, 33, 1, 66, 1, 102, 3, 154, 0, '0.74'),
(20, 33, 0, 62, 1, 217, 37, 127, 0, '0.00'),
(21, 33, 0, 46, 0, 199, 43, 172, 0, '0.00'),
(22, 33, 0, 34, 1, 267, 76, 99, 1, '0.00'),
(23, 33, 0, 33, 1, 168, 0, 123, 0, '1.00'),
(24, 33, 0, 33, 1, 168, 0, 123, 0, '1.00'),
(25, 33, 0, 32, 1, 223, 33, 161, 1, '0.00'),
(26, 33, 1, 50, 1, 159, 22, 138, 1, '0.19'),
(27, 33, 0, 69, 1, 139, 34, 148, 0, '0.00'),
(28, 33, 0, 69, 1, 139, 34, 148, 0, '0.00'),
(29, 33, 0, 32, 0, 176, 75, 114, 1, '0.00'),
(30, 33, 0, 50, 0, 115, 60, 195, 1, '0.00'),
(31, 33, 1, 77, 1, 285, 55, 171, 0, '1.00'),
(32, 33, 0, 78, 1, 176, 31, 83, 1, '0.00'),
(33, 33, 0, 78, 1, 176, 31, 83, 1, '0.00'),
(34, 33, 1, 37, 0, 200, 41, 114, 0, '0.01'),
(35, 33, 0, 71, 1, 183, 48, 188, 0, '0.00'),
(36, 33, 1, 65, 0, 236, 72, 150, 0, '0.14'),
(37, 33, 1, 58, 1, 254, 61, 135, 0, '0.16'),
(38, 33, 0, 68, 0, 246, 57, 85, 1, '0.00'),
(39, 33, 1, 63, 0, 172, 1, 89, 1, '0.88'),
(40, 33, 0, 51, 1, 246, 31, 98, 0, '0.00'),
(41, 33, 0, 60, 1, 259, 74, 105, 1, '0.00'),
(42, 33, 0, 60, 1, 259, 74, 105, 1, '0.00'),
(43, 33, 0, 60, 1, 259, 74, 105, 1, '0.00'),
(44, 33, 1, 64, 0, 148, 60, 144, 0, '0.09'),
(45, 33, 0, 63, 1, 181, 3, 192, 1, '0.00'),
(46, 33, 1, 42, 1, 192, 36, 161, 1, '0.14'),
(47, 33, 0, 70, 1, 197, 65, 127, 0, '0.00'),
(48, 33, 1, 73, 1, 255, 9, 122, 0, '1.00'),
(49, 33, 0, 65, 1, 241, 27, 95, 1, '0.00'),
(50, 33, 0, 30, 0, 131, 12, 114, 1, '0.00'),
(51, 33, 0, 55, 1, 289, 25, 131, 1, '0.00'),
(52, 33, 1, 47, 1, 157, 27, 102, 0, '0.09'),
(53, 33, 0, 62, 1, 111, 12, 129, 0, '0.00'),
(54, 33, 1, 35, 1, 241, 71, 155, 1, '0.09'),
(55, 33, 0, 34, 1, 150, 35, 171, 0, '0.00'),
(56, 33, 0, 37, 1, 178, 59, 134, 1, '0.00'),
(57, 33, 0, 65, 0, 201, 74, 116, 0, '0.00'),
(58, 33, 0, 37, 0, 208, 51, 116, 0, '0.00'),
(59, 33, 1, 41, 0, 231, 24, 121, 0, '0.06'),
(60, 33, 0, 53, 0, 222, 22, 92, 0, '0.00'),
(61, 33, 1, 30, 0, 150, 3, 141, 0, '0.03'),
(62, 33, 1, 46, 0, 153, 0, 149, 0, '0.96'),
(63, 33, 0, 30, 0, 262, 29, 160, 1, '0.00'),
(64, 33, 1, 30, 1, 212, 14, 162, 1, '0.15'),
(65, 33, 1, 55, 0, 125, 34, 173, 1, '0.08'),
(66, 33, 0, 30, 0, 230, 56, 131, 0, '0.00'),
(67, 33, 0, 34, 0, 181, 47, 193, 0, '0.00'),
(68, 33, 1, 75, 1, 148, 70, 124, 0, '1.00'),
(69, 33, 1, 59, 0, 231, 31, 193, 1, '0.29'),
(70, 33, 0, 34, 0, 253, 64, 182, 1, '0.00'),
(71, 33, 0, 55, 0, 297, 50, 118, 0, '0.00'),
(72, 33, 0, 64, 1, 153, 2, 98, 0, '0.00'),
(73, 33, 1, 57, 0, 151, 56, 130, 0, '0.05'),
(74, 33, 0, 46, 1, 295, 76, 173, 1, '0.00'),
(75, 33, 0, 47, 1, 237, 50, 105, 0, '0.00'),
(76, 33, 1, 64, 0, 149, 23, 155, 0, '0.21'),
(77, 33, 1, 36, 1, 196, 35, 187, 1, '0.10'),
(78, 33, 1, 54, 0, 145, 30, 156, 1, '0.09'),
(79, 33, 1, 54, 0, 145, 30, 156, 1, '0.10'),
(80, 33, 1, 73, 1, 255, 9, 122, 0, '1.00'),
(81, 33, 0, 65, 1, 241, 27, 95, 1, '0.00'),
(82, 33, 0, 55, 1, 289, 25, 131, 1, '0.00'),
(83, 33, 0, 55, 1, 289, 25, 131, 1, '0.00'),
(84, 33, 1, 47, 1, 157, 27, 102, 0, '0.07'),
(85, 33, 1, 35, 1, 241, 71, 155, 1, '0.07'),
(86, 33, 1, 62, 0, 202, 55, 141, 0, '0.12'),
(87, 33, 1, 77, 0, 201, 36, 140, 0, '0.25'),
(88, 33, 1, 39, 1, 288, 60, 132, 0, '0.17'),
(89, 33, 1, 62, 0, 218, 74, 133, 1, '0.10'),
(90, 33, 0, 62, 0, 262, 6, 102, 0, '0.00'),
(91, 33, 1, 77, 0, 106, 52, 83, 0, '0.10'),
(92, 33, 1, 64, 0, 149, 23, 155, 0, '0.21'),
(93, 33, 1, 36, 1, 196, 35, 187, 1, '0.10'),
(94, 33, 1, 57, 0, 151, 56, 130, 0, '0.05'),
(95, 33, 1, 59, 0, 231, 31, 193, 1, '0.29'),
(96, 33, 1, 30, 1, 212, 14, 162, 1, '0.15'),
(97, 33, 1, 55, 0, 125, 34, 173, 1, '0.08'),
(98, 33, 1, 47, 1, 157, 27, 102, 0, '0.07'),
(99, 33, 1, 42, 1, 192, 36, 161, 1, '0.14'),
(100, 33, 1, 64, 0, 148, 60, 144, 0, '0.09'),
(101, 33, 1, 63, 0, 172, 1, 89, 1, '0.94'),
(102, 33, 1, 58, 1, 254, 61, 135, 0, '0.16'),
(103, 33, 1, 65, 0, 236, 72, 150, 0, '0.13'),
(104, 33, 1, 30, 1, 212, 14, 162, 1, '0.17'),
(105, 33, 1, 55, 0, 125, 34, 173, 1, '0.09'),
(106, 33, 0, 65, 1, 241, 27, 95, 1, '0.00'),
(107, 33, 1, 59, 0, 231, 31, 193, 1, '0.28'),
(108, 33, 1, 64, 0, 149, 23, 155, 0, '0.21'),
(109, 33, 1, 36, 1, 196, 35, 187, 1, '0.10'),
(110, 33, 1, 54, 0, 145, 30, 156, 1, '0.09'),
(111, 33, 1, 62, 0, 202, 55, 141, 0, '0.11'),
(112, 33, 1, 77, 0, 201, 36, 140, 0, '0.24'),
(113, 33, 1, 39, 1, 288, 60, 132, 0, '0.16'),
(114, 33, 1, 62, 0, 218, 74, 133, 1, '0.10'),
(115, 33, 1, 76, 1, 223, 19, 196, 1, '1.00'),
(116, 33, 0, 62, 0, 262, 6, 102, 0, '0.00'),
(117, 33, 1, 77, 0, 106, 52, 83, 0, '0.10'),
(118, 33, 1, 66, 1, 102, 3, 154, 0, '0.71'),
(119, 33, 1, 50, 1, 159, 22, 138, 1, '0.18'),
(120, 33, 1, 65, 0, 236, 72, 150, 0, '0.14'),
(121, 33, 1, 58, 1, 254, 61, 135, 0, '0.16'),
(122, 33, 1, 63, 0, 172, 1, 89, 1, '0.82'),
(123, 33, 1, 64, 0, 148, 60, 144, 0, '0.09'),
(124, 33, 1, 42, 1, 192, 36, 161, 1, '0.13'),
(125, 33, 0, 75, 0, 202, 26, 112, 1, '0.00'),
(126, 33, 1, 62, 0, 202, 55, 141, 0, '0.14'),
(127, 33, 1, 77, 0, 201, 36, 140, 0, '0.23'),
(128, 33, 1, 62, 0, 202, 55, 141, 0, '0.12'),
(129, 33, 1, 77, 0, 201, 36, 140, 0, '0.24'),
(130, 33, 1, 39, 1, 288, 60, 132, 0, '0.16'),
(131, 33, 1, 62, 0, 218, 74, 133, 1, '0.10'),
(132, 33, 1, 77, 0, 106, 52, 83, 0, '0.10'),
(133, 33, 1, 55, 1, 299, 19, 123, 1, '0.39'),
(134, 33, 0, 75, 0, 202, 26, 112, 1, '0.00'),
(135, 33, 1, 66, 1, 102, 3, 154, 0, '0.73'),
(136, 33, 1, 50, 1, 159, 22, 138, 1, '0.18'),
(137, 33, 1, 65, 0, 236, 72, 150, 0, '0.12'),
(138, 33, 1, 58, 1, 254, 61, 135, 0, '0.15'),
(139, 33, 1, 63, 0, 172, 1, 89, 1, '0.85'),
(140, 33, 1, 64, 0, 148, 60, 144, 0, '0.09'),
(141, 33, 1, 42, 1, 192, 36, 161, 1, '0.14'),
(142, 33, 1, 73, 1, 255, 9, 122, 0, '1.00'),
(143, 33, 0, 65, 1, 241, 27, 95, 1, '0.00'),
(144, 33, 1, 47, 1, 157, 27, 102, 0, '0.08'),
(145, 33, 1, 35, 1, 241, 71, 155, 1, '0.10'),
(146, 33, 1, 30, 1, 212, 14, 162, 1, '0.15'),
(147, 33, 1, 55, 0, 125, 34, 173, 1, '0.08'),
(148, 33, 1, 59, 0, 231, 31, 193, 1, '0.28'),
(149, 33, 1, 57, 0, 151, 56, 130, 0, '0.05'),
(150, 33, 1, 64, 0, 149, 23, 155, 0, '0.21'),
(151, 33, 1, 36, 1, 196, 35, 187, 1, '0.10'),
(152, 33, 1, 54, 0, 145, 30, 156, 1, '0.09'),
(153, 33, 1, 77, 0, 201, 36, 140, 0, '0.25'),
(154, 33, 1, 39, 1, 288, 60, 132, 0, '0.16'),
(155, 33, 1, 62, 0, 218, 74, 133, 1, '0.10'),
(156, 33, 1, 76, 1, 223, 19, 196, 1, '1.00'),
(157, 33, 1, 77, 0, 106, 52, 83, 0, '0.10'),
(158, 33, 1, 55, 1, 299, 19, 123, 1, '0.46'),
(159, 33, 1, 66, 1, 102, 3, 154, 0, '0.74'),
(160, 33, 0, 33, 1, 168, 0, 123, 0, '1.00'),
(161, 33, 1, 50, 1, 159, 22, 138, 1, '0.19'),
(162, 33, 1, 37, 0, 200, 41, 114, 0, '0.01'),
(163, 33, 1, 65, 0, 236, 72, 150, 0, '0.14'),
(164, 33, 1, 58, 1, 254, 61, 135, 0, '0.16'),
(165, 33, 0, 64, 1, 153, 2, 98, 0, '0.00');

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

--
-- Dumping data for table `prenatal_consultation`
--

INSERT INTO `prenatal_consultation` (`age_in_months`, `patients_id`, `date`, `pregnancy_month`, `aog`, `bp`, `pulse_rate`, `respiratory_rate`, `temperature`, `weight`, `height`, `bmi`, `fundic_height`, `fetal_heart_tone`, `presentation`, `unconscious_convulsing`, `vaginal_bleeding`, `abdominal_pain`, `looks`, `headache`, `breathing`, `fever`, `vomiting`, `edema`, `laboratory_utz`, `tetanus_toxoid`, `iron`, `antibiotics`, `check_up`, `encoder`, `consultant`, `encoded`) VALUES
(4, 1, '2023-04-02 00:59:03', 5, '17 weeks', '100/80', 97, 19, '37.00', 86, '159.00', '0.00', '0.00', 'none', 'none', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'none', 'IDI', 'Prirate', 'none', '2023-04-25', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(5, 2, '2023-04-02 01:00:19', 0, '28 weeks', '100/80', 99, 20, '68.00', 161, '36.00', '0.00', '26.00', '149', 'LIPH', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'none', 'ID2', 'none', 'none', '0000-00-00', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(6, 3, '2023-04-02 01:01:14', 0, '17 weeks', '100/80', 87, 18, '53.00', 162, '36.00', '0.00', '0.00', 'none', 'none', 'No', 'No', 'No', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'none', 'none', 'mes', 'yes', '2023-04-28', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(7, 4, '2023-04-02 01:01:50', 0, '21 week', '100/80', 89, 19, '162.00', 36, '55.00', '0.00', '0.00', 'normal', 'none', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Check', 'TD1', 'none', 'none', '0000-00-00', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(8, 5, '2023-04-02 01:02:36', 0, '19 weeks', '100/70', 88, 19, '154.00', 36, '56.00', '0.00', '0.00', 'none', 'none', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Yes', '345.23 TT', 'Yes', 'Yes', '2023-04-25', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(9, 6, '2023-03-28 00:00:00', 0, '29 weeks', '120/80', 100, 28, '36.00', 64, '0.00', '0.00', '0.00', '148', 'none', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', '', '', '', '0000-00-00', '', '', '0000-00-00'),
(10, 7, '2023-04-03 01:41:18', 2, '13 weeks', '100/80', 86, 21, '59.00', 163, '36.00', '0.00', '0.00', 'none', 'none', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'none', 'none', 'Yes', 'none', '2023-04-25', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-28'),
(16, 15, '2023-04-03 15:10:18', 5, '156', '100/70', 125, 21, '36.20', 50, '152.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', 'T1', '90', '', '2023-03-07', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-02-07'),
(17, 15, '2023-04-03 15:12:55', 6, '24.8', '100/80', 128, 20, '36.70', 51, '152.00', '0.00', '18.00', '146', '6ph', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'none', 'TD2', 'Pre SC.', '', '0000-00-00', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-07'),
(18, 16, '2023-04-03 15:18:42', 6, '188', '110/80', 110, 19, '36.10', 0, '0.00', '0.00', '0.00', '', '', 'Yes', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'r9', 'h3', '90 pre SC', '', '2023-03-07', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-02-07'),
(19, 16, '2023-04-03 15:20:23', 7, '87', '90/70', 99, 19, '36.40', 72, '156.00', '0.00', '25.00', '45', '6ph', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'r9', 'h3', '30', '', '2023-04-14', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-07'),
(20, 17, '2023-04-03 15:25:31', 6, '26', '110/80', 91, 19, '36.30', 51, '156.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Req', '', '90 pre SC', '', '2023-02-21', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-01-24'),
(21, 18, '2023-04-03 15:29:51', 5, '158', '120/80', 90, 19, '36.60', 74, '0.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', 'TD2', '30', '', '2022-12-13', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2022-11-15'),
(22, 18, '2023-04-03 15:32:01', 6, '179', '110/80', 90, 19, '36.40', 76, '0.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'ITI', '', '30', 'Deful', '2022-12-20', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2022-12-06'),
(23, 18, '2023-04-03 15:34:14', 7, '193', '90/70', 88, 19, '36.40', 77, '0.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', '', '', '30', '', '2023-01-17', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2022-12-20'),
(24, 19, '2023-04-03 15:39:28', 3, '12', '100/80', 92, 19, '36.40', 65, '158.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'c req', '', 'pes', '', '2023-04-05', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-31'),
(25, 20, '2023-04-03 15:56:50', 3, '110', '100/80', 109, 20, '34.10', 49, '158.00', '19.60', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Yes', 'No', 'none', 'none', 'none', 'none', '2023-03-28', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-02-28'),
(26, 20, '2023-04-03 15:58:47', 5, '20 weeks', '100/70', 111, 19, '36.60', 53, '158.00', '0.00', '20.00', '153', '6ph', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'none', 'TD3', '', '', '2023-04-28', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-03-31'),
(27, 21, '2023-04-03 16:03:38', 4, '106', '100/80', 97, 19, '36.30', 47, '154.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'Req', '', '190', '', '2023-02-28', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-01-24'),
(28, 21, '2023-04-03 16:05:15', 5, '141', '90/70', 97, 19, '36.40', 51, '154.00', '0.00', '0.00', '', '', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'No', 'FFUP', 'TD4', 'presc', '', '2023-03-23', 'BHW Edna', 'Heidi Buera Alcos (Midwife)', '2023-02-28');

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
(1, 'Miriam Alamay San Andres', 'P3- Sto.Tomas', 35, '1988-03-03', 'Ryan San Andres', 'Married', '09773344470', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 5, 0),
(2, 'Roxanne Acuna Manzanero', 'B-21 lot 1 Bellparc', 27, '1995-08-17', 'Michael Angelo Manzanero', 'Married', '09753058472', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 1, 0),
(3, 'Jowana Imbido Mabesa', 'B52 Lot 32 Site 3', 26, '1996-04-22', 'Malyin Sequena', 'Common in Law/Live-in', '09303238890', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', 'Asthma,Heart Disease', '', '', 1, 0),
(4, 'Karen May Doronila Ytac', 'B-63 L-5 Site 3 Sto. Tomas', 19, '2003-05-28', 'Mark Estoya', 'Single', '09754035873', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 1, 0),
(5, 'Jessa Ortiz Salmorin', 'P2 - Sto. Tomas', 28, '1994-08-17', 'Jerico Manatac', 'Single', '09053695744', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 1, 0),
(6, 'Ginalyn Dimasuag Olivarez', 'Blk 12 Lot 1 Site 3', 33, '1990-02-08', '', 'Married', '', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 1, 0),
(7, 'Aiko Pacid Aravilla', 'Purok 1 Latian', 27, '1995-06-15', 'Jomar F. Aravilla', 'Married', '09973278414', 'Yes', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', 1, 0),
(13, 'Agustin Allerite Montenegro', 'Blk 29 Lot 32 Site 3', 22, '2000-08-02', 'Agustin Montenegro', 'Married', '0921218221', 'Yes', '1974-12-02', '2023-04-18', '2023-04-13', 'G5 P5 (1,2,3,4)', 'PTB,Cancer', 'Kidney Disease,PTB', '', 15, 0),
(15, 'Julia Marie Mahilom Arcillas', 'Blk. 22 Lot 59', 17, '2005-09-19', 'Nick Corpuz', 'Common Law/Live-in', '09056448231', 'No', '2022-09-04', '0000-00-00', '2023-06-11', 'G1 P0 (0,0,0,0)', 'Asthma', 'Asthma', '', 17, NULL),
(16, 'Janine Pineda Gurion', 'Blk 19 Lot 15B Sto.tomas', 26, '1996-10-13', 'Marvin Manantan', 'Common Law/Live-in', '09566628463', 'Yes', '2022-08-03', '0000-00-00', '2023-05-10', 'G2 P1 (1,0,0,1)', 'None', 'None', '', 19, NULL),
(17, 'Jennifer Velarde Obedece', 'Blk.24 Lot 72 Site 3', 42, '1980-07-20', 'Alwyn M. Obedece', 'Married', '0955653469', 'Yes', '2022-07-20', '0000-00-00', '2023-04-27', 'G5 P4 (4,0,0,4)', 'None', 'Hypertension', '', 1, NULL),
(18, 'Jasmin Jade Delantar Mercado', 'Blk. 19 Lot 55 Site 3', 18, '2004-10-02', '', 'Common Law/Live-in', '09917637441', 'Yes', '2022-06-10', '0000-00-00', '2023-03-17', 'G1 P0 (0,0,0,0)', 'None', 'None', '', 23, NULL),
(19, 'Sheryl Maglente Lominario', 'Blk.67 Lot 15', 33, '1989-11-30', 'Derick Quizon', 'Common Law/Live-in', '09053702119', 'No', '2022-01-06', '0000-00-00', '2023-10-13', 'G3 P2 (2,0,0,2)', 'None', 'Hypertension', '', 1, NULL),
(20, 'Rhona Tilan Caones', 'Blk. 16 Lot 12 Site 3', 26, '1996-12-13', 'Christopher Desabelle', 'Married', '0909758480', 'No', '2022-11-10', '0000-00-00', '2023-08-17', 'G2 P1 (1,0,0,1)', 'None', 'None', '', 26, NULL),
(21, 'Donnalyn Guirela Calara', 'Blk.21 Lot 17A Sto.Tomas', 26, '1996-08-29', 'Patrick Calara', 'Married', '09926914708', 'Yes', '2022-10-10', '0000-00-00', '2023-07-17', 'G3 P2 (2,0,0,2)', 'None', 'None', '', 28, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `name`, `email`, `password`, `user_type`) VALUES
(3, 'Agustin', 'agustinmontenegro824@gmail.com', '123', ''),
(6, 'Loresita A. Rebong', 'loresita@gmail.com', '12345', 'admin'),
(8, 'BHW Edna', 'edna@gmail.com', '12345', ''),
(9, 'BHW Marites Cao', 'marites@gmail.com', '12345', ''),
(10, 'admin', 'admin@gmail.com', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

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
  ADD KEY `patients_id` (`patients_id`);

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
-- AUTO_INCREMENT for table `archived_record`
--
ALTER TABLE `archived_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consultation_record`
--
ALTER TABLE `consultation_record`
  MODIFY `consultation_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `family_record`
--
ALTER TABLE `family_record`
  MODIFY `family_id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `gravida`
--
ALTER TABLE `gravida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `immunization_record`
--
ALTER TABLE `immunization_record`
  MODIFY `immunization_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `newborn_record`
--
ALTER TABLE `newborn_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `patients_record`
--
ALTER TABLE `patients_record`
  MODIFY `patients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `prediction_record`
--
ALTER TABLE `prediction_record`
  MODIFY `prediction_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `prenatal_consultation`
--
ALTER TABLE `prenatal_consultation`
  MODIFY `age_in_months` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `prenatal_record`
--
ALTER TABLE `prenatal_record`
  MODIFY `patients_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
