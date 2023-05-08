SELECT
  ud.user_name AS pessoa_usuaria,
  IF(YEAR(MAX(ph.reproduction_date)) >= 2021, "Ativa", "Inativa") AS status_pessoa_usuaria
FROM 
  users_data AS ud
INNER JOIN
  playback_history AS ph
  ON ph.played_by = ud.id
GROUP BY ud.user_name
ORDER BY ud.user_name;