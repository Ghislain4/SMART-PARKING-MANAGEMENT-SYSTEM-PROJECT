create or replace trigger trg_reservation_check before
   insert on reservations
   for each row
declare
   v_count number;
begin
   select count(*)
     into v_count
     from reservations
    where slot_id = :new.slot_id
      and status in ( 'Pending',
                      'Confirmed' )
      and ( ( :new.reserved_from between reserved_from and reserved_until )
       or ( :new.reserved_until between reserved_from and reserved_until ) );

   if v_count > 0 then
      raise_application_error(
         -20001,
         'This slot is already reserved for the selected time.'
      );
   end if;
end;
/