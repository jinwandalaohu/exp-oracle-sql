SET LINES 200 PAGES 0

EXPLAIN PLAN
   FOR
SELECT /*+ index_ffs(t1 (c1, c2)) */
            c1, c2
        FROM t1
       WHERE c2 = 1;

SELECT * FROM TABLE (DBMS_XPLAN.display);