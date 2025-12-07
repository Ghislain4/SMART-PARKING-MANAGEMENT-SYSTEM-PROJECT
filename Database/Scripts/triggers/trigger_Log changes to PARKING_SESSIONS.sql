create or replace trigger trg_sessions_audit after
   insert or update or delete on parking_sessions
   for each row
declare
   v_op_type varchar2(10);
begin
   if inserting then
      v_op_type := 'INSERT';
   elsif updating then
      v_op_type := 'UPDATE';
   else
      v_op_type := 'DELETE';
   end if;

   insert into audit_log (
      table_name,
      operation_type,
      record_id,
      old_value,
      new_value,
      changed_by,
      change_date
   ) values ( 'PARKING_SESSIONS',
              v_op_type,
              nvl(
                 :old.session_id,
                 :new.session_id
              ),
              case
                 when :old.session_id is not null then
                    'Old Session Data'
                 else
                    null
              end,
              case
                 when :new.session_id is not null then
                    'New Session Data'
                 else
                    null
              end,
              user,
              systimestamp );
end;
/