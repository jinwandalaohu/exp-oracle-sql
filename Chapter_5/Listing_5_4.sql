BEGIN
   DBMS_STATS.gather_table_stats (SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA')
                                 ,'T1'
                                 ,no_invalidate   => FALSE);
   DBMS_STATS.gather_table_stats (SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA')
                                 ,'T2'
                                 ,no_invalidate   => FALSE);
END;
/

SET LINES 200 PAGES 900 TIMING ON

ALTER SESSION SET statistics_level=all;

BEGIN
   FOR r IN (SELECT *
               FROM t1, t2
              WHERE t1.c1 = t2.c2)
   LOOP
      NULL;
   END LOOP;
END;
/

SET TIMING OFF

COLUMN id FORMAT 99
COLUMN operation FORMAT a18
COLUMN options FORMAT a11
COLUMN actual_time FORMAT 99.999 HEADING "Actual|Time"
COLUMN object_name FORMAT a17 HEADING "Object|Name"
COLUMN last_starts FORMAT 9999999 HEADING "Last|Starts"
COLUMN actual_rows FORMAT 9999999 HEADING "Actual|Rows"

  SELECT id
        ,LPAD (' ', DEPTH) || operation operation
        ,options
        ,last_elapsed_time / 1000000 actual_time
        ,object_name
        ,last_starts
        ,last_output_rows actual_rows
    FROM v$sql_plan_statistics_all
   WHERE sql_id = 'cwktrs03rd8c7'
ORDER BY id;