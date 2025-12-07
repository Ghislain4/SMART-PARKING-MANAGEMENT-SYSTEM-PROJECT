begin
   for i in 1..100 loop
      insert into vehicles (
         plate_number,
         vehicle_type,
         owner_name,
         owner_contact,
         is_frequent
      ) values ( 'RAB'
                 || lpad(
         i,
         3,
         '0'
      ),
                 case mod(
                    i,
                    4
                 )
                    when 0 then
                       'Car'
                    when 1 then
                       'Motorbike'
                    when 2 then
                       'Truck'
                    else
                       'Bus'
                 end,
                 'Owner_' || i,
                 '078'
                 || to_char(round(dbms_random.value(
                    1000000,
                    9999999
                 ))),
                 case mod(
                    i,
                    2
                 )
                    when 0 then
                       'Y'
                    else
                       'N'
                 end
      );
   end loop;
   commit;
end;
/