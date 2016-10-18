EXPLAIN PLAN
   FOR
      SELECT t1.*
            ,AVG (sales_amount) OVER (PARTITION BY channel_id)
                average_sales_amount
        FROM t1;


SELECT * FROM TABLE (DBMS_XPLAN.display);