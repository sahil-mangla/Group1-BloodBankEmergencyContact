-- procedures.sql
SET SERVEROUTPUT ON;

-- Procedure to Add a New User
CREATE OR REPLACE PROCEDURE AddUser(
    p_UserID IN Users.UserID%TYPE,
    p_Name IN Users.Name%TYPE,
    p_Email IN Users.Email%TYPE,
    p_Password IN Users.Password%TYPE
) IS
BEGIN
    INSERT INTO Users (UserID, Name, Email, Password)
    VALUES (p_UserID, p_Name, p_Email, p_Password);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('User added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: User ID or Email already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding user: ' || SQLERRM);
END;
/

-- Procedure to Add a New Donor
CREATE OR REPLACE PROCEDURE AddDonor(
    p_DonorID IN Donors.DonorID%TYPE,
    p_Name IN Donors.Name%TYPE,
    p_BloodGroup IN Donors.BloodGroup%TYPE,
    p_Location IN Donors.Location%TYPE,
    p_ContactDetails IN Donors.ContactDetails%TYPE
) IS
BEGIN
    INSERT INTO Donors (DonorID, Name, BloodGroup, Location, ContactDetails, AvailabilityStatus)
    VALUES (p_DonorID, p_Name, p_BloodGroup, p_Location, p_ContactDetails, 'Available');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Donor added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Donor ID already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding donor: ' || SQLERRM);
END;
/

-- Procedure to Create a Blood Request
CREATE OR REPLACE PROCEDURE CreateBloodRequest(
    p_RequestID IN BloodRequests.RequestID%TYPE,
    p_UserID IN BloodRequests.UserID%TYPE,
    p_BloodGroup IN BloodRequests.BloodGroup%TYPE,
    p_Location IN BloodRequests.Location%TYPE
) IS
BEGIN
    INSERT INTO BloodRequests (RequestID, UserID, BloodGroup, Location, Status)
    VALUES (p_RequestID, p_UserID, p_BloodGroup, p_Location, 'Pending');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Blood request created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating blood request: ' || SQLERRM);
END;
/

-- Procedure to Map Donor to Request
CREATE OR REPLACE PROCEDURE MapDonorToRequest(
    p_MapID IN DonorRequestMap.MapID%TYPE,
    p_DonorID IN DonorRequestMap.DonorID%TYPE,
    p_RequestID IN DonorRequestMap.RequestID%TYPE
) IS
BEGIN
    INSERT INTO DonorRequestMap (MapID, DonorID, RequestID)
    VALUES (p_MapID, p_DonorID, p_RequestID);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Donor successfully mapped to request.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error mapping donor: ' || SQLERRM);
END;
/

-- Procedure to Update Request Status to Completed
CREATE OR REPLACE PROCEDURE CompleteRequest(
    p_RequestID IN BloodRequests.RequestID%TYPE
) IS
BEGIN
    UPDATE BloodRequests
    SET Status = 'Completed'
    WHERE RequestID = p_RequestID;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Request marked as completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating request: ' || SQLERRM);
END;
/

-- ==========================================
-- ADVANCED PL/SQL: TRIGGERS, CURSORS, FUNCTIONS
-- ==========================================

-- 1. Trigger to Automatically Update Donor Availability
-- When a donor is mapped to a blood request, this trigger
-- marks them as 'Unavailable' in the Donors table.
CREATE OR REPLACE TRIGGER trg_UpdateDonorAvailability
AFTER INSERT ON DonorRequestMap
FOR EACH ROW
BEGIN
    UPDATE Donors
    SET AvailabilityStatus = 'Unavailable'
    WHERE DonorID = :NEW.DonorID;
END;
/

-- 2. Function to Count Available Donors by Blood Group
CREATE OR REPLACE FUNCTION GetAvailableDonorCount(
    p_BloodGroup IN VARCHAR
) RETURN NUMBER IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM Donors
    WHERE BloodGroup = p_BloodGroup 
      AND AvailabilityStatus = 'Available';
      
    RETURN v_Count;
END;
/

-- 3. Procedure with a Cursor to List All Pending Requests
-- This demonstrates the use of Cursors in PL/SQL
CREATE OR REPLACE PROCEDURE ListPendingRequests IS
    CURSOR c_PendingRequests IS
        SELECT RequestID, UserID, BloodGroup, Location 
        FROM BloodRequests
        WHERE Status = 'Pending';
    v_Req c_PendingRequests%ROWTYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- List of Pending Blood Requests ---');
    OPEN c_PendingRequests;
    LOOP
        FETCH c_PendingRequests INTO v_Req;
        EXIT WHEN c_PendingRequests%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Request ID: ' || v_Req.RequestID || 
                             ' | User ID: ' || v_Req.UserID ||
                             ' | Blood Group: ' || v_Req.BloodGroup || 
                             ' | Location: ' || v_Req.Location);
    END LOOP;
    CLOSE c_PendingRequests;
END;
/
