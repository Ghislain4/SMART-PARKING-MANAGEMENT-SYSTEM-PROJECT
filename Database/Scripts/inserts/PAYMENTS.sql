begin
   for i in 1..100 loop
      insert into payments (
         session_id,
         amount,
         payment_method,
         payment_date,
         transaction_ref,
         discount_applied
      ) values ( mod(
         i,
         100
      ) + 1,   -- valid session_id
                 round(
                    dbms_random.value(
                       2,
                       40
                    ),
                    2
                 ),
                 case mod(
                    i,
                    3
                 )
                    when 0 then
                       'Cash'
                    when 1 then
                       'Card'
                    else
                       'MobilePay'
                 end,
                 sysdate - dbms_random.value(
                    0,
                    5
                 ),
                 'TXN-'
                 || dbms_random.string(
                    'U',
                    6
                 ),
                 round(
                    dbms_random.value(
                       0,
                       5
                    ),
                    2
                 ) );
   end loop;
   commit;
end;
/