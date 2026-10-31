-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2026 at 08:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bumpr`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidents`
--

CREATE TABLE `accidents` (
  `AccidentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AccidentType` enum('Single Vehicle','Two or More Vehicles','Pedestrian') NOT NULL,
  `AccidentDescription` text NOT NULL,
  `InjuriesReported` tinyint(1) NOT NULL DEFAULT 0,
  `HasWitnesses` tinyint(1) NOT NULL DEFAULT 0,
  `Latitude` decimal(10,7) DEFAULT NULL,
  `Longitude` decimal(10,7) DEFAULT NULL,
  `AccidentDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `VehicleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accident_ai_analysis`
--

CREATE TABLE `accident_ai_analysis` (
  `AnalysisID` int(11) NOT NULL,
  `AccidentID` int(11) NOT NULL,
  `EvidenceID` int(11) NOT NULL,
  `AIModel` varchar(100) NOT NULL DEFAULT 'gemma4:e2b',
  `AIAnalysis` text NOT NULL,
  `ReviewedAnalysis` text DEFAULT NULL,
  `AnalysisStatus` varchar(20) NOT NULL DEFAULT 'Generated',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accident_evidence`
--

CREATE TABLE `accident_evidence` (
  `EvidenceID` int(11) NOT NULL,
  `AccidentID` int(11) NOT NULL,
  `EvidenceCategory` varchar(150) NOT NULL,
  `ImagePath` varchar(500) NOT NULL,
  `UploadedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contactID` int(11) NOT NULL,
  `contactName` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filevault`
--

CREATE TABLE `filevault` (
  `documentID` int(11) NOT NULL,
  `documentName` varchar(255) DEFAULT NULL,
  `documentType` varchar(100) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `documentPath` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otherdriver`
--

CREATE TABLE `otherdriver` (
  `otherDriverID` int(11) NOT NULL,
  `accidentID` int(11) NOT NULL,
  `otherVehicleID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `idNumber` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `licenceNumber` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `othervehicle`
--

CREATE TABLE `othervehicle` (
  `otherVehicleID` int(11) NOT NULL,
  `accidentID` int(11) NOT NULL,
  `registration` varchar(20) NOT NULL,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `colour` varchar(30) NOT NULL,
  `insuranceName` varchar(100) DEFAULT NULL,
  `policyNumber` varchar(50) DEFAULT NULL,
  `ownerName` varchar(100) DEFAULT NULL,
  `ownerPhone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Token` varchar(255) NOT NULL,
  `ExpiresAt` datetime NOT NULL,
  `Used` tinyint(1) DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedestrianinformation`
--

CREATE TABLE `pedestrianinformation` (
  `pedestrianID` int(11) NOT NULL,
  `accidentID` int(11) NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `wasInjured` tinyint(1) NOT NULL DEFAULT 0,
  `injuryDescription` text DEFAULT NULL,
  `emergencyServicesCalled` tinyint(1) NOT NULL DEFAULT 0,
  `additionalNotes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicleID` int(11) NOT NULL,
  `registrationNumber` varchar(50) DEFAULT NULL,
  `vehicleMake` varchar(50) DEFAULT NULL,
  `vehicleModel` varchar(50) DEFAULT NULL,
  `vehicleYear` varchar(10) DEFAULT NULL,
  `vehicleColour` varchar(50) DEFAULT NULL,
  `insurancePolicyNumber` varchar(100) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `witnessinformation`
--

CREATE TABLE `witnessinformation` (
  `witnessID` int(11) NOT NULL,
  `accidentID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `statement` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accidents`
--
ALTER TABLE `accidents`
  ADD PRIMARY KEY (`AccidentID`),
  ADD KEY `fk_accidents_user` (`UserID`),
  ADD KEY `fk_accidents_vehicle` (`VehicleID`);

--
-- Indexes for table `accident_ai_analysis`
--
ALTER TABLE `accident_ai_analysis`
  ADD PRIMARY KEY (`AnalysisID`),
  ADD KEY `fk_ai_accident` (`AccidentID`),
  ADD KEY `fk_ai_evidence` (`EvidenceID`);

--
-- Indexes for table `accident_evidence`
--
ALTER TABLE `accident_evidence`
  ADD PRIMARY KEY (`EvidenceID`),
  ADD KEY `fk_evidence_accident` (`AccidentID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contactID`);

--
-- Indexes for table `filevault`
--
ALTER TABLE `filevault`
  ADD PRIMARY KEY (`documentID`);

--
-- Indexes for table `otherdriver`
--
ALTER TABLE `otherdriver`
  ADD PRIMARY KEY (`otherDriverID`),
  ADD KEY `idx_otherdriver_accident` (`accidentID`),
  ADD KEY `idx_otherdriver_vehicle` (`otherVehicleID`);

--
-- Indexes for table `othervehicle`
--
ALTER TABLE `othervehicle`
  ADD PRIMARY KEY (`otherVehicleID`),
  ADD KEY `idx_othervehicle_accident` (`accidentID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `pedestrianinformation`
--
ALTER TABLE `pedestrianinformation`
  ADD PRIMARY KEY (`pedestrianID`),
  ADD KEY `idx_pedestrian_accident` (`accidentID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicleID`);

--
-- Indexes for table `witnessinformation`
--
ALTER TABLE `witnessinformation`
  ADD PRIMARY KEY (`witnessID`),
  ADD KEY `idx_witness_accident` (`accidentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accidents`
--
ALTER TABLE `accidents`
  MODIFY `AccidentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accident_ai_analysis`
--
ALTER TABLE `accident_ai_analysis`
  MODIFY `AnalysisID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accident_evidence`
--
ALTER TABLE `accident_evidence`
  MODIFY `EvidenceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contactID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `filevault`
--
ALTER TABLE `filevault`
  MODIFY `documentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `otherdriver`
--
ALTER TABLE `otherdriver`
  MODIFY `otherDriverID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `othervehicle`
--
ALTER TABLE `othervehicle`
  MODIFY `otherVehicleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedestrianinformation`
--
ALTER TABLE `pedestrianinformation`
  MODIFY `pedestrianID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `vehicleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `witnessinformation`
--
ALTER TABLE `witnessinformation`
  MODIFY `witnessID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accidents`
--
ALTER TABLE `accidents`
  ADD CONSTRAINT `fk_accidents_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_accidents_vehicle` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`vehicleID`) ON DELETE SET NULL;

--
-- Constraints for table `accident_ai_analysis`
--
ALTER TABLE `accident_ai_analysis`
  ADD CONSTRAINT `fk_ai_accident` FOREIGN KEY (`AccidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ai_evidence` FOREIGN KEY (`EvidenceID`) REFERENCES `accident_evidence` (`EvidenceID`) ON DELETE CASCADE;

--
-- Constraints for table `accident_evidence`
--
ALTER TABLE `accident_evidence`
  ADD CONSTRAINT `fk_evidence_accident` FOREIGN KEY (`AccidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `otherdriver`
--
ALTER TABLE `otherdriver`
  ADD CONSTRAINT `fk_otherdriver_accident` FOREIGN KEY (`accidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_otherdriver_vehicle` FOREIGN KEY (`otherVehicleID`) REFERENCES `othervehicle` (`otherVehicleID`) ON DELETE CASCADE;

--
-- Constraints for table `othervehicle`
--
ALTER TABLE `othervehicle`
  ADD CONSTRAINT `fk_othervehicle_accident` FOREIGN KEY (`accidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `pedestrianinformation`
--
ALTER TABLE `pedestrianinformation`
  ADD CONSTRAINT `fk_pedestrian_accident` FOREIGN KEY (`accidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE;

--
-- Constraints for table `witnessinformation`
--
ALTER TABLE `witnessinformation`
  ADD CONSTRAINT `fk_witness_accident` FOREIGN KEY (`accidentID`) REFERENCES `accidents` (`AccidentID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
