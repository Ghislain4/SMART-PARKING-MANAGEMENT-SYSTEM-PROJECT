create or replace trigger trg_calc_fee before
   update of session_status on parking_sessions
   for each row
begin
   if :new.session_status = 'Completed' then
      :new.parking_fee := calc_parking_fee(
         :new.slot_id,
         :old.entry_time,
         :new.exit_time
      );
   end if;
end;
/