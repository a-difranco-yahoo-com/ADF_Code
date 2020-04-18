
select JOB_NAME,OPERATION,STATE from dba_datapump_jobs;

SELECT b.username, a.sid, b.opname, b.target,
            round(b.SOFAR*100/b.TOTALWORK,0) || '%' as "%DONE", b.TIME_REMAINING,
            to_char(b.start_time,'YYYY/MM/DD HH24:MI:SS') start_time
     FROM v$session_longops b, v$session a
     WHERE a.sid = b.sid      ORDER BY 6 desc;
     
     SELECT sl.sid, sl.serial#, sl.sofar, sl.totalwork, dp.owner_name, dp.state, dp.job_mode
     FROM v$session_longops sl, v$datapump_job dp
     WHERE sl.opname = dp.job_name
     AND sl.sofar != sl.totalwork;