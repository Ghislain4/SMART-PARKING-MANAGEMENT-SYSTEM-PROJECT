begin
   for i in 1..100 loop
      insert into parking_slots (
         lot_id,
         slot_number,
         slot_type,
         floor_level,
         status,
         hourly_rate
      ) values ( mod(
         i,
         100
      ) + 1,      -- references PARKING_LOTS
                 'SLOT_' || i,
                 case mod(
                    i,
                    4
                 )
                    when 0 then
                       'Regular'
                    when 1 then
                       'Compact'
                    when 2 then
                       'Large'
                    else
                       'Handicap'
                 end,
                 mod(
                    i,
                    5
                 ) + 1,
                 case mod(
                    i,
                    3
                 )
                    when 0 then
                       'Available'
                    when 1 then
                       'Occupied'
                    else
                       'Reserved'
                 end,
                 round(
                    dbms_random.value(
                       1.5,
                       5.0
                    ),
                    2
                 ) );
   end loop;
   commit;
end;
/