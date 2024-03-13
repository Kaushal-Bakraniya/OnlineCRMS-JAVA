-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 06:46 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` int(11) NOT NULL,
  `UserName` varchar(60) NOT NULL,
  `Password` varchar(60) NOT NULL,
  `Access` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `UserName`, `Password`, `Access`) VALUES
(1, 'admin', '1234', 'ALL'),
(2, 'admin@mumbai', '1234', 'Mumbai, MH'),
(3, 'admin@delhi', '1234', 'Delhi, NCR'),
(4, 'admin@kolkata', '1234', 'Kolkata, WB'),
(5, 'admin@chennai', '1234', 'Chennai, TN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cars`
--

CREATE TABLE `tbl_cars` (
  `ID` int(11) NOT NULL,
  `Reg_No` varchar(20) NOT NULL,
  `Model_Name` varchar(60) NOT NULL,
  `Status` varchar(60) NOT NULL,
  `City` varchar(60) NOT NULL,
  `Fuel_Type` varchar(60) NOT NULL,
  `Airbags` int(11) NOT NULL,
  `Seating_Capacity` int(11) NOT NULL,
  `Rent_PerDay` int(11) NOT NULL,
  `Rent_PerKM` int(11) NOT NULL,
  `Limit_PerDay` int(11) NOT NULL,
  `Image_1` varchar(500) NOT NULL,
  `Image_2` varchar(500) NOT NULL,
  `KMS_Driven` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cars`
--

INSERT INTO `tbl_cars` (`ID`, `Reg_No`, `Model_Name`, `Status`, `City`, `Fuel_Type`, `Airbags`, `Seating_Capacity`, `Rent_PerDay`, `Rent_PerKM`, `Limit_PerDay`, `Image_1`, `Image_2`, `KMS_Driven`) VALUES
(1, 'MH01AB1234', 'BMW X5', 'Available', 'Mumbai, MH', 'Petrol', 8, 5, 3000, 90, 250, 'Images/Uploads/Car_Images/MH01AB1234_1_BMW_X5_1.jpg', 'Images/Uploads/Car_Images/MH01AB1234_2_BMW_X5_2.jpg', 0),
(2, 'DL01AB1234', 'Toyota Fortuner', 'Available', 'Delhi, NCR', 'Petrol', 7, 7, 2200, 80, 250, 'Images/Uploads/Car_Images/DL01AB1234_1_Fortuner_1.jpeg', 'Images/Uploads/Car_Images/DL01AB1234_2_Fortuner_2.jpeg', 0),
(3, 'WB01AB1234', 'Honda City', 'Available', 'Kolkata, WB', 'Petrol', 4, 5, 2000, 90, 300, 'Images/Uploads/Car_Images/WB01AB1234_1_HondaCity_1.jpg', 'Images/Uploads/Car_Images/WB01AB1234_2_HondaCity_2.jpg', 0),
(4, 'TN01AB1234', 'Mahindra Scopio', 'Available', 'Chennai, TN', 'Petrol', 5, 7, 8000, 50, 250, 'Images/Uploads/Car_Images/TN01AB1234_1_Scorpio_1jpg.jpg', 'Images/Uploads/Car_Images/TN01AB1234_2_Scorpio_2.jpeg', 100),
(5, 'MH07GT1717', 'Mercedez C Class', 'Available', 'Mumbai, MH', 'Petrol', 5, 5, 7000, 90, 200, 'Images/Uploads/Car_Images/MH07GT1717_1_1exterior.jpg', 'Images/Uploads/Car_Images/MH07GT1717_2_1interior.jpg', 0),
(6, 'MH01KB9797', 'Mini Cooper', 'Available', 'Mumbai, MH', 'Petrol', 5, 5, 4700, 90, 250, 'Images/Uploads/Car_Images/MH01KB9797_1_2exterior.jpg', 'Images/Uploads/Car_Images/MH01KB9797_2_2interior.jpg', 0),
(7, 'MH01AC0001', 'Rolls Royce Ghost', 'Available', 'Mumbai, MH', 'Petrol', 8, 8, 100000, 8000, 200, 'Images/Uploads/Car_Images/MH01AC0001_1_4exterior.jpg', 'Images/Uploads/Car_Images/MH01AC0001_2_4interior.jpg', 0),
(8, 'MH01AE1997', 'Maruti Suzuki Baleno', 'Available', 'Mumbai, MH', 'Petrol', 5, 5, 2000, 40, 300, 'Images/Uploads/Car_Images/MH01AE1997_1_3exterior.jpg', 'Images/Uploads/Car_Images/MH01AE1997_2_3interior.jpg', 100),
(9, 'DL04EE0007', 'Mustang GT Classic', 'Available', 'Delhi, NCR', 'Petrol', 4, 4, 10000, 150, 300, 'Images/Uploads/Car_Images/DL04EE0007_1_1exterior.jpg', 'Images/Uploads/Car_Images/DL04EE0007_2_1interior.jpg', 0),
(10, 'DL03AE9999', 'Mitshubishi Pajero', 'Available', 'Delhi, NCR', 'Petrol', 7, 7, 6000, 50, 250, 'Images/Uploads/Car_Images/DL03AE9999_1_2exterior.jpg', 'Images/Uploads/Car_Images/DL03AE9999_2_2interior.jpg', 0),
(11, 'DL01ER1111', 'BMW Z4', 'Available', 'Delhi, NCR', 'Diesel', 2, 2, 9000, 200, 300, 'Images/Uploads/Car_Images/DL01ER1111_1_3exterior.jpg', 'Images/Uploads/Car_Images/DL01ER1111_2_3interior.jpg', 0),
(12, 'WB01AR2023', 'Skoda Rapid', 'Available', 'Kolkata, WB', 'Petrol', 5, 5, 5000, 50, 300, 'Images/Uploads/Car_Images/WB01AR2023_1_1exterior.JPG', 'Images/Uploads/Car_Images/WB01AR2023_2_1interior.jpg', 0),
(13, 'WB01DB0202', 'Tata Nexon', 'Available', 'Kolkata, WB', 'Petrol', 5, 5, 6000, 50, 200, 'Images/Uploads/Car_Images/WB01DB0202_1_2exterior.jpg', 'Images/Uploads/Car_Images/WB01DB0202_2_2interior.jpeg', 0),
(14, 'WB07DR0017', 'Tata Harrier', 'Available', 'Kolkata, WB', 'Diesel', 5, 5, 8000, 50, 200, 'Images/Uploads/Car_Images/WB07DR0017_1_3exterior.jpg', 'Images/Uploads/Car_Images/WB07DR0017_2_3exterior.jpeg', 0),
(15, 'TN07CA0001', 'Mahindra Thar', 'Available', 'Chennai, TN', 'Diesel', 5, 5, 7000, 50, 300, 'Images/Uploads/Car_Images/TN07CA0001_1_exterior1.jpg', 'Images/Uploads/Car_Images/TN07CA0001_2_interior1.jpeg', 0),
(16, 'TN01DA6767', 'Maruti Suzuki Brezza', 'Available', 'Chennai, TN', 'Petrol', 5, 5, 5000, 50, 300, 'Images/Uploads/Car_Images/TN01DA6767_1_exterior1.webp', 'Images/Uploads/Car_Images/TN01DA6767_2_exterior2.webp', 0),
(17, 'TN01DA7777', 'Maruti Suzuki Ciaz', 'Available', 'Chennai, TN', 'Diesel', 5, 5, 6000, 50, 300, 'Images/Uploads/Car_Images/TN01DA7777_1_exterior2.jpg', 'Images/Uploads/Car_Images/TN01DA7777_2_inetrior3.jpeg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver`
--

CREATE TABLE `tbl_driver` (
  `ID` int(11) NOT NULL,
  `Full_Name` varchar(600) NOT NULL,
  `Gender` varchar(600) NOT NULL,
  `Email` varchar(600) NOT NULL,
  `Contact_No` varchar(600) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `City` varchar(600) NOT NULL,
  `Experience_Years` int(11) NOT NULL,
  `Aadhar_Card` varchar(600) NOT NULL,
  `Driving_License` varchar(600) NOT NULL,
  `DOB` varchar(600) NOT NULL,
  `Join_Date` varchar(600) NOT NULL DEFAULT '0',
  `Status` varchar(600) NOT NULL,
  `Salary` int(11) NOT NULL DEFAULT 0,
  `Current_Trip` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_driver`
--

INSERT INTO `tbl_driver` (`ID`, `Full_Name`, `Gender`, `Email`, `Contact_No`, `Address`, `City`, `Experience_Years`, `Aadhar_Card`, `Driving_License`, `DOB`, `Join_Date`, `Status`, `Salary`, `Current_Trip`) VALUES
(1, 'Sundarrajan Iyyer', 'Male', 'driver1@mailnotexists.com', '9876512340', 'Anna Road', 'Chennai, TN', 0, 'Images/Uploads/Drivers_Documents/alberto.gustavo@gmail.com_2_1_AadharCard_Aadhar.jpg', 'Images/Uploads/Drivers_Documents/alberto.gustavo@gmail.com_2_2_DrivingLicense_License.jpg', '2001-01-01', '', 'AVAILABLE', 0, 0),
(2, 'MAYUR SOHILBHAI KATLA', 'Male', 'driver2@mailnotexists.com', '8520369874', 'Andheri - Kurla Road', 'Mumbai, MH', 4, 'Images/Uploads/Drivers_Documents/mayur71@gmail.com_2_1_AadharCard_Aadhar.jpg', 'Images/Uploads/Drivers_Documents/mayur71@gmail.com_2_2_DrivingLicense_License.jpg', '1999-07-09', '2023-04-07', 'On Trip', 15000, 6),
(3, 'GAUTAM DHRUVBHAI GAJJAR', 'Male', 'driver3@mailnotexists.com', '9638527877', 'Eden Gardens Road', 'Kolkata, WB', 3, 'Images/Uploads/Drivers_Documents/gautam1717@gmail.com_2_1_AadharCard_Aadhar.jpg', 'Images/Uploads/Drivers_Documents/gautam1717@gmail.com_2_2_DrivingLicense_License.jpg', '2002-07-17', '2023-04-07', 'AVAILABLE', 12000, 0),
(5, 'ARPIT JAGJIVAN BAKSHI', 'Male', 'driver4@mailnotexists.com', '1234567890', 'ABC Street', 'Mumbai, MH', 1, 'Images/Uploads/Drivers_Documents/kaushalbakraniya97@gmail.com_2_1_AadharCard_Aadhar.jpg', 'Images/Uploads/Drivers_Documents/kaushalbakraniya97@gmail.com_2_2_DrivingLicense_License.jpg', '2003-09-30', '2023-04-08', 'AVAILABLE', 12000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `ID` int(11) NOT NULL,
  `Username` varchar(600) NOT NULL,
  `UID` int(11) NOT NULL,
  `User_Email` varchar(600) NOT NULL,
  `Feedback` varchar(600) NOT NULL,
  `Status` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`ID`, `Username`, `UID`, `User_Email`, `Feedback`, `Status`) VALUES
(1, 'Kaushal ', 2, 'user2@mailnotexists.com', 'Your Service Is Excellent', 'Replied'),
(2, 'Mayur', 3, 'user3@mailnotexists.com', 'hello', 'Not Readed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_oldbookings`
--

CREATE TABLE `tbl_oldbookings` (
  `ID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `Reg_No` varchar(600) NOT NULL,
  `Contact` varchar(600) NOT NULL,
  `Pickup_Date` varchar(600) NOT NULL,
  `Return_Date` varchar(600) NOT NULL,
  `Days` int(11) NOT NULL,
  `Days_Late` int(11) NOT NULL,
  `City` varchar(600) NOT NULL,
  `Basic_Rent` int(11) NOT NULL,
  `Other_Fine` int(11) NOT NULL,
  `Extra_Charge` int(11) NOT NULL,
  `Final_Payment` int(11) NOT NULL,
  `Note` varchar(600) NOT NULL,
  `Driver_ID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_oldbookings`
--

INSERT INTO `tbl_oldbookings` (`ID`, `UID`, `Reg_No`, `Contact`, `Pickup_Date`, `Return_Date`, `Days`, `Days_Late`, `City`, `Basic_Rent`, `Other_Fine`, `Extra_Charge`, `Final_Payment`, `Note`, `Driver_ID`) VALUES
(1, 1, 'WB01AB1234', '1234567890', '2023-03-30', '2023-03-30', 1, 0, 'Kolkata, WB', 2000, 0, 0, 2000, 'Without Driver', 0),
(2, 2, 'TN01AB1234', '9876543210', '2023-03-30', '2023-03-30', 1, 0, 'Chennai, TN', 2200, 0, 0, 2200, 'Without Driver', 0),
(3, 2, 'TN01AB1234', '9876543210', '2023-04-07', '2023-04-07', 1, 0, 'Chennai, TN', 8000, 0, 0, 8000, 'With Driver', 0),
(4, 3, 'MH01AE1997', '5656567676', '2023-04-07', '2023-04-07', 1, 0, 'Mumbai, MH', 2000, 750, 20, 2770, 'With Driver', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rented`
--

CREATE TABLE `tbl_rented` (
  `ID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `Reg_No` varchar(600) NOT NULL,
  `Days` int(11) NOT NULL,
  `Pickup_Date` varchar(600) NOT NULL,
  `Return_Date` varchar(600) NOT NULL,
  `Contact` varchar(600) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `City` varchar(600) NOT NULL,
  `Payment` int(11) NOT NULL,
  `Note` varchar(600) NOT NULL,
  `Status` varchar(600) NOT NULL,
  `Driver_ID` int(11) DEFAULT 0,
  `KMS_Driven` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(600) NOT NULL,
  `Email` varchar(600) NOT NULL,
  `Contact_No` varchar(600) NOT NULL,
  `Gender` varchar(600) NOT NULL,
  `Address` varchar(600) NOT NULL,
  `City` varchar(60) NOT NULL,
  `Profile_Picture` varchar(600) NOT NULL,
  `Password` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`ID`, `Name`, `Email`, `Contact_No`, `Gender`, `Address`, `City`, `Profile_Picture`, `Password`) VALUES
(1, 'Dhruv', 'user1@mailnotexists.com', '1234567890', 'Male', 'ABCD Road', 'Mumbai, MH', 'Images/Uploads/ProfilePictures/Reader.png', '1234'),
(2, 'Kaushal ', 'user2@mailnotexists.com', '9876543210', 'Male', 'ABX Road', 'Chennai, TN', 'Images/Uploads/ProfilePictures/KB.jpg', '1234'),
(3, 'Mayur', 'user3@mailnotexists.com', '5656567676', 'Male', 'ABCD Street', 'Mumbai, MH', 'Images/Uploads/ProfilePictures/Aadhar.jpg', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Indexes for table `tbl_cars`
--
ALTER TABLE `tbl_cars`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Reg_No` (`Reg_No`);

--
-- Indexes for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_oldbookings`
--
ALTER TABLE `tbl_oldbookings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_rented`
--
ALTER TABLE `tbl_rented`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Reg_No` (`Reg_No`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Contact_No` (`Contact_No`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cars`
--
ALTER TABLE `tbl_cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_oldbookings`
--
ALTER TABLE `tbl_oldbookings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_rented`
--
ALTER TABLE `tbl_rented`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
