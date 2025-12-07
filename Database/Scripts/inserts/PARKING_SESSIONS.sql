begin
   for i in 1..100 loop
      insert into parking_sessions (
         slot_id,
         vehicle_id,
         entry_time,
         exit_time,
         session_status,
         parking_fee
      ) values ( mod(
         i,
         100
      ) + 1,          -- valid slot_id
                 mod(
                    i,
                    100
                 ) + 1,          -- valid vehicle_id
                 sysdate - dbms_random.value(
                    1,
                    10
                 ),
                 sysdate - dbms_random.value(
                    0,
                    1
                 ),
                 case mod(
                    i,
                    3
                 )
                    when 0 then
                       'Active'
                    when 1 then
                       'Completed'
                    else
                       'Cancelled'
                 end,
                 round(
                    dbms_random.value(
                       2,
                       40
                    ),
                    2
                 ) );
   end loop;
   commit;
end;
/