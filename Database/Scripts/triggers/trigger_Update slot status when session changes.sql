create or replace trigger trg_update_slot_status after
   insert or update on parking_sessions
   for each row
begin
   if inserting
   or ( :new.session_status = 'Active' ) then
      update parking_slots
         set
         status = 'Occupied'
       where slot_id = :new.slot_id;
   elsif
      updating
      and :new.session_status = 'Completed'
   then
      update parking_slots
         set
         status = 'Available'
       where slot_id = :new.slot_id;
   end if;
end;
/