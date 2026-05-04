-- mock_data.sql
-- This file populates your database with sample data for your project demo

-- 1. Insert mock Users
INSERT INTO Users (UserID, Name, Email, Password) VALUES (1, 'Rahul Sharma', 'rahul@email.com', 'pass123');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (2, 'Priya Singh', 'priya@email.com', 'pass456');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (3, 'Amit Kumar', 'amit@email.com', 'pass789');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (4, 'Sneha Reddy', 'sneha.r@email.com', 'passabc');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (5, 'Ravi Teja', 'ravi.t@email.com', 'passdef');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (6, 'Kavya Nair', 'kavya.n@email.com', 'passghi');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (7, 'Arjun Kapoor', 'arjun.k@email.com', 'passjkl');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (8, 'Meera Joshi', 'meera.j@email.com', 'passmno');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (9, 'Rohan Das', 'rohan.d@email.com', 'passpqr');
INSERT INTO Users (UserID, Name, Email, Password) VALUES (10, 'Neha Sharma', 'neha.s@email.com', 'passstu');

-- 2. Insert mock Donors
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (101, 'Vikram Verma', 'O+', 'Delhi', '9876543210', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (102, 'Neha Gupta', 'A-', 'Mumbai', '8765432109', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (103, 'Suresh Patel', 'B+', 'Pune', '7654321098', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (104, 'Anjali Desai', 'O+', 'Delhi', '6543210987', 'Unavailable');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (105, 'Karan Malhotra', 'AB+', 'Bangalore', '9988776655', 'Unavailable');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (106, 'Pooja Hegde', 'A+', 'Chennai', '8877665544', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (107, 'Tarun Kumar', 'O-', 'Hyderabad', '7766554433', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (108, 'Simran Kaur', 'B-', 'Chandigarh', '6655443322', 'Unavailable');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (109, 'Varun Dhawan', 'AB-', 'Delhi', '5544332211', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (110, 'Shruti Haasan', 'O+', 'Chennai', '4433221100', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (111, 'Aditya Roy', 'A+', 'Mumbai', '9898989898', 'Available');
INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus) VALUES (112, 'Kriti Sanon', 'B+', 'Pune', '8787878787', 'Unavailable');

-- 3. Insert mock Blood Requests
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1001, 1, 'O+', 'Delhi City Hospital', 'Completed');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1002, 2, 'AB+', 'Mumbai Central', 'Completed');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1003, 3, 'B+', 'Pune Ruby Hall', 'Pending');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1004, 4, 'O-', 'Hyderabad Apollo', 'Pending');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1005, 5, 'A+', 'Bangalore Fortis', 'Pending');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1006, 6, 'O+', 'Chennai MIOT', 'Completed');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1007, 7, 'B-', 'Chandigarh PGIMER', 'Pending');
INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status) VALUES (1008, 8, 'A-', 'Delhi AIIMS', 'Pending');

-- 4. Insert mock Mapping (Connecting Unavailable Donors to specific requests)
INSERT INTO DonorRequestMap (MapID, DonorID, RequestID) VALUES (5001, 104, 1001);
INSERT INTO DonorRequestMap (MapID, DonorID, RequestID) VALUES (5002, 108, 1007);
INSERT INTO DonorRequestMap (MapID, DonorID, RequestID) VALUES (5003, 112, 1003);
INSERT INTO DonorRequestMap (MapID, DonorID, RequestID) VALUES (5004, 105, 1002);

COMMIT;
