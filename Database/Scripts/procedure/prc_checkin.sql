CREATE OR REPLACE PROCEDURE vehicle_check_in(
    p_vehicle_id IN NUMBER,
    p_slot_id IN NUMBER,
    p_session_id OUT NUMBER
) IS
BEGIN
    INSERT INTO parking_sessions(slot_id, vehicle_id, entry_time, session_status)
    VALUES(p_slot_id, p_vehicle_id, SYSDATE, 'Active')
    RETURNING session_id INTO p_session_id;

    -- Update slot status to Occupied
    UPDATE parking_slots
    SET status = 'Occupied'
    WHERE slot_id = p_slot_id;

    COMMIT;
END;
/
