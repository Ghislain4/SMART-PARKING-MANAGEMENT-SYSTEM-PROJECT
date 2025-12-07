-- ====================================================
-- PHASE VI: Smart Parking Management System Queries
-- ====================================================

-- 1️⃣ Available Parking Slots Per Lot
PROMPT === Available Parking Slots Per Lot ===
select pl.lot_name,
       count(ps.slot_id) as total_slots,
       sum(
          case
             when ps.status = 'Available' then
                1
             else
                0
          end
       ) as available_slots
  from parking_lots pl
  join parking_slots ps
on pl.lot_id = ps.lot_id
 group by pl.lot_name
 order by pl.lot_name;

-- 2️⃣ Active Parking Sessions
PROMPT === Active Parking Sessions ===
select s.session_id,
       v.plate_number,
       ps.slot_number,
       s.entry_time
  from parking_sessions s
  join vehicles v
on s.vehicle_id = v.vehicle_id
  join parking_slots ps
on s.slot_id = ps.slot_id
 where s.session_status = 'Active'
 order by s.entry_time desc;

-- 3️⃣ Reservations Summary by Status
PROMPT === Reservations Summary by Status ===
select r.status,
       count(*) as total_reservations
  from reservations r
 group by r.status
 order by r.status;

-- 4️⃣ Payments Summary by Payment Method
PROMPT === Payments Summary by Method ===
select payment_method,
       sum(amount) as total_collected,
       count(*) as num_payments
  from payments
 group by payment_method
 order by total_collected desc;

-- 5️⃣ Audit Logs Summary by Table
PROMPT === Audit Logs Summary by Table ===
select table_name,
       count(*) as total_changes
  from audit_log
 group by table_name
 order by total_changes desc;

-- 6️⃣ Frequent Vehicles Report (more than 5 sessions)
PROMPT === Frequent Vehicles Report (Sessions > 5) ===
select v.plate_number,
       v.owner_name,
       count(s.session_id) as total_sessions
  from vehicles v
  join parking_sessions s
on v.vehicle_id = s.vehicle_id
 group by v.plate_number,
          v.owner_name
having count(s.session_id) > 5
 order by total_sessions desc;

-- 7️⃣ Sample Data Preview (First 5 rows from each table)
PROMPT === Sample Data Preview: Parking Lots ===
select *
  from parking_lots
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Parking Slots ===
select *
  from parking_slots
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Vehicles ===
select *
  from vehicles
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Parking Sessions ===
select *
  from parking_sessions
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Reservations ===
select *
  from reservations
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Payments ===
select *
  from payments
 fetch first 5 rows only;

PROMPT === Sample Data Preview: Audit Log ===
select *
  from audit_log
 fetch first 5 rows only;