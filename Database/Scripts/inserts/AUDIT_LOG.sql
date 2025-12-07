begin
   for i in 1..100 loop
      insert into audit_log (
         table_name,
         operation_type,
         record_id,
         old_value,
         new_value,
         changed_by,
         change_date
      ) values (
         case mod(
            i,
            7
         )
            when 0 then
               'PARKING_LOTS'
            when 1 then
               'PARKING_SLOTS'
            when 2 then
               'VEHICLES'
            when 3 then
               'PARKING_SESSIONS'
            when 4 then
               'PAYMENTS'
            when 5 then
               'RESERVATIONS'
            else
               'AUDIT_LOG'
         end,
         case mod(
            i,
            3
         )
            when 0 then
               'INSERT'
            when 1 then
               'UPDATE'
            else
               'DELETE'
         end,
         i,                                 -- record_id
         'OldValue_' || i,                  -- old_value
         'NewValue_' || i,                  -- new_value
         'Admin_' || mod(
            i,
            10
         ),             -- changed_by
         systimestamp - numtodsinterval(
            i,
            'HOUR'
         )  -- change_date
          );
   end loop;
   commit;
end;
/