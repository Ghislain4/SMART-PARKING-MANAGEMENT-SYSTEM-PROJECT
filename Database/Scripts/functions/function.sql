-- Function: Calculate Parking Fee
create or replace function calc_parking_fee (
   p_slot_id    in number,
   p_entry_time in date,
   p_exit_time  in date
) return number is
   v_hours number(
      5,
      2
   );
   v_rate  number(
      6,
      2
   );
begin
   select hourly_rate
     into v_rate
     from parking_slots
    where slot_id = p_slot_id;

   v_hours := ( p_exit_time - p_entry_time ) * 24; -- hours
   return round(
      v_hours * v_rate,
      2
   );
end;
/