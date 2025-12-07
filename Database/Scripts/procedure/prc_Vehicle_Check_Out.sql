create or replace procedure vehicle_check_out (
   p_session_id in number
) is
   v_exit_time  date := sysdate;
   v_fee        number;
   v_slot_id    number;
   v_vehicle_id number;
begin
   select slot_id,
          vehicle_id
     into
      v_slot_id,
      v_vehicle_id
     from parking_sessions
    where session_id = p_session_id;

    -- Calculate fee
   select calc_parking_fee(
      slot_id,
      entry_time,
      v_exit_time
   )
     into v_fee
     from parking_sessions
    where session_id = p_session_id;

    -- Update session
   update parking_sessions
      set exit_time = v_exit_time,
          session_status = 'Completed',
          parking_fee = v_fee
    where session_id = p_session_id;

    -- Update slot to Available
   update parking_slots
      set
      status = 'Available'
    where slot_id = v_slot_id;

   commit;
end;
/