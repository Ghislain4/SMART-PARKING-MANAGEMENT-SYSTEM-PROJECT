insert into reservations (
   vehicle_id,
   slot_id,
   reservation_time,
   reserved_from,
   reserved_until,
   status
)
   select mod(
      level,
      50
   ) + 1 as vehicle_id,        -- vehicles 1–50
          mod(
             level,
             30
          ) + 1 as slot_id,           -- slots 1–30
          sysdate - ( level / 24 ) as reservation_time,      -- past hours
          sysdate + ( level / 1440 ) as reserved_from,       -- future minutes
          sysdate + ( ( level + 60 ) / 1440 ) as reserved_until, -- +60 min
          case
             when level <= 40 then
                'Pending'
             when level <= 70 then
                'Confirmed'
             else
                'Cancelled'
          end as status
     from dual
   connect by
      level <= 100;

commit;