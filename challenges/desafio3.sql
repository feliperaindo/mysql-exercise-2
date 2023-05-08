SELECT
  ud.user_name AS pessoa_usuaria,
  COUNT(ph.song_id) AS musicas_ouvidas,
  ROUND(SUM(musics.duration)/60, 2) AS total_minutos
FROM
  playback_history AS ph
INNER JOIN users_data AS ud ON ud.id = ph.played_by
INNER JOIN musics ON musics.id = ph.song_id
GROUP BY ud.user_name
ORDER BY ud.user_name;