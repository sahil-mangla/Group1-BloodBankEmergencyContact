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
    BloodGroup VARCHAR(5) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    ContactDetails VARCHAR(255) NOT NULL,
    AvailabilityStatus VARCHAR(20) DEFAULT 'Available' CHECK (AvailabilityStatus IN ('Available', 'Unavailable'))
);

-- Table: BloodRequests
CREATE TABLE BloodRequests (
    RequestID INT PRIMARY KEY,
    UserID INT,
    BloodGroup VARCHAR(5) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Completed')),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table: DonorRequestMap
CREATE TABLE DonorRequestMap (
    MapID INT PRIMARY KEY,
    DonorID INT,
    RequestID INT,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (RequestID) REFERENCES BloodRequests(RequestID)
);
