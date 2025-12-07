declare
   cursor c_active_sessions is
   select pl.lot_name,
          v.plate_number,
          ps.slot_number,
          s.entry_time
     from parking_sessions s
     join vehicles v
   on s.vehicle_id = v.vehicle_id
     join parking_slots ps
   on s.slot_id = ps.slot_id
     join parking_lots pl
   on ps.lot_id = pl.lot_id
    where s.session_status = 'Active'
    order by pl.lot_name;

   v_rec c_active_sessions%rowtype;
begin
   open c_active_sessions;
   loop
      fetch c_active_sessions into v_rec;
      exit when c_active_sessions%notfound;
      dbms_output.put_line(v_rec.lot_name
                           || ' - '
                           || v_rec.plate_number
                           || ' - ' || v_rec.slot_number);
   end loop;
   close c_active_sessions;
end;
/