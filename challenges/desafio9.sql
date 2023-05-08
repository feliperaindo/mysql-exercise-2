SELECT COUNT(ph.song_id) AS musicas_no_historico
FROM playback_history AS ph
INNER JOIN users_data AS ud ON ud.id = ph.played_by
WHERE ud.user_name LIKE 'Barbara Liskov';