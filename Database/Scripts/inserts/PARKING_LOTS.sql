begin
   for i in 1..100 loop
      insert into parking_lots (
         lot_name,
         location,
         total_slots,
         status
      ) values ( 'Lot_' || i,
                 'Location_' || i,
                 round(dbms_random.value(
                    50,
                    300
                 )),
                 case mod(
                    i,
                    3
                 )
                    when 0 then
                       'Open'
                    when 1 then
                       'Closed'
                    else
                       'Maintenance'
                 end
      );
   end loop;
   commit;
end;
/