SELECT 
  ROUND(MIN(plans.cost), 2) AS faturamento_minimo,
  ROUND(MAX(plans.cost), 2) AS faturamento_maximo,
  ROUND(AVG(plans.cost), 2) AS faturamento_medio,
  ROUND(SUM(plans.cost), 2) AS faturamento_total
FROM plans
INNER JOIN users_data AS ud ON ud.subscription_plan_id = plans.id;