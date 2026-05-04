-- schema.sql
-- Table: Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);

-- Table: Donors
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    BloodGroup VARCHAR(5) NOT NULL CHECK (BloodGroup IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    Location VARCHAR(255) NOT NULL,
    ContactDetails VARCHAR(255) NOT NULL,
    AvailabilityStatus VARCHAR(20) DEFAULT 'Available' CHECK (AvailabilityStatus IN ('Available', 'Unavailable'))
);

-- Table: BloodRequests
CREATE TABLE BloodRequests (
    RequestID INT PRIMARY KEY,
    UserID INT,
    BloodGroup VARCHAR(5) NOT NULL CHECK (BloodGroup IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    Location VARCHAR(255) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Completed')),
    RequestDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: DonorRequestMap
CREATE TABLE DonorRequestMap (
    MapID INT PRIMARY KEY,
    DonorID INT,
    RequestID INT,
    MappedDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (RequestID) REFERENCES BloodRequests(RequestID)
);

-- Sequences for Automatic ID Generation
CREATE SEQUENCE seq_user_id START WITH 101 INCREMENT BY 1;
CREATE SEQUENCE seq_donor_id START WITH 201 INCREMENT BY 1;
CREATE SEQUENCE seq_request_id START WITH 301 INCREMENT BY 1;
CREATE SEQUENCE seq_map_id START WITH 401 INCREMENT BY 1;


