

-- Grant AUDIT ADMIN privileges to the user (run as SYSDBA)
-- Replace USERNAME with your schema user
GRANT AUDIT_ADMIN TO USERNAME;
GRANT AUDIT_VIEWER TO USERNAME;

--  Create Session Audit Policy
BEGIN
    EXECUTE IMMEDIATE '
    CREATE AUDIT POLICY spm_session_audit
        ACTIONS LOGON, LOGOFF
        WHEN ''SYS_CONTEXT(''USERENV'',''SESSION_USER'') = ''USERNAME'''';
END;
/

-- Create DML Audit Policy
BEGIN
    EXECUTE IMMEDIATE '
    CREATE AUDIT POLICY spm_dml_audit
        ACTIONS INSERT, UPDATE, DELETE ON USERNAME.*
        WHEN ''SYS_CONTEXT(''USERENV'',''SESSION_USER'') = ''USERNAME'''';
END;
/

-- Enable Audit Policies
AUDIT POLICY spm_session_audit;
AUDIT POLICY spm_dml_audit;

-- Optional: Revoke unnecessary privileges for security hardening
-- REVOKE CREATE ANY TABLE FROM PUBLIC;
-- REVOKE DROP ANY TABLE FROM PUBLIC;

-- Optional: Verify audit policies

SELECT policy_name, enabled, con_id
FROM dba_audit_policies
WHERE policy_name IN ('SPM_SESSION_AUDIT', 'SPM_DML_AUDIT');


