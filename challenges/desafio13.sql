SELECT
  CASE
    WHEN ud.age > 60 THEN "Maior de 60 anos"
    WHEN ud.age BETWEEN 31 AND 60 THEN "Entre 31 e 60 anos"
    ELSE "Até 30 anos"
  END AS faixa_etaria,
  COUNT(DISTINCT ud.id) AS total_pessoas_usuarias,
  COUNT(fs.song_id) AS total_favoritadas
FROM users_data AS ud
LEFT JOIN favorite_songs AS fs
  ON fs.user_id = ud.id
GROUP BY faixa_etaria
ORDER BY faixa_etaria;