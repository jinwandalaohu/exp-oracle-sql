EXPLAIN PLAN
   FOR
      SELECT t1.*, NTILE (4) OVER (ORDER BY sales_amount) nt FROM t1;

SELECT * FROM TABLE (DBMS_XPLAN.display);