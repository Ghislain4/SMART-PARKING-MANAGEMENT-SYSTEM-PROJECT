create or replace package parking_mgmt_pkg as
   procedure check_in (
      p_vehicle_id in number,
      p_slot_id    in number,
      p_session_id out number
   );
   procedure check_out (
      p_session_id in number
   );
   function available_slots (
      p_lot_id in number
   ) return number;
end parking_mgmt_pkg;
/

create or replace package body parking_mgmt_pkg as

   procedure check_in (
      p_vehicle_id in number,
      p_slot_id    in number,
      p_session_id out number
   ) is
   begin
      vehicle_check_in(
         p_vehicle_id,
         p_slot_id,
         p_session_id
      );
   end;

   procedure check_out (
      p_session_id in number
   ) is
   begin
      vehicle_check_out(p_session_id);
   end;

   function available_slots (
      p_lot_id in number
   ) return number is
      v_count number;
   begin
      select count(*)
        into v_count
        from parking_slots
       where lot_id = p_lot_id
         and status = 'Available';
      return v_count;
   end;

end parking_mgmt_pkg;
/