SELECT * FROM northwind_dw.fact_orders;

SELECT northwind_dw.fact_orders.ship_name, northwind_dw.fact_orders.quantity, northwind_dw.fact_orders.unit_price 
FROM northwind_dw.fact_orders