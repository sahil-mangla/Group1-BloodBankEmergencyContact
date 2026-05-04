-- reset.sql
-- Run this script to completely wipe the database so you can start the demo fresh.

-- 1. Drop Tables (In reverse order of creation due to Foreign Keys)
DROP TABLE DonorRequestMap CASCADE CONSTRAINTS;
DROP TABLE BloodRequests CASCADE CONSTRAINTS;
DROP TABLE Donors CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;

-- 2. Drop Sequences
DROP SEQUENCE seq_user_id;
DROP SEQUENCE seq_donor_id;
DROP SEQUENCE seq_request_id;
DROP SEQUENCE seq_map_id;

DBMS_OUTPUT.PUT_LINE('Database reset successfully. You can now re-run schema.sql, procedures.sql, and mock_data.sql.');
