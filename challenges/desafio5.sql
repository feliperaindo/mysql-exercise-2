SELECT
  musics.song_name AS cancao,
  COUNT(ph.song_id) AS reproducoes
FROM playback_history AS ph
INNER JOIN musics ON musics.id = ph.song_id
INNER JOIN artists ON musics.artist_id = artists.id
GROUP BY musics.song_name
ORDER BY reproducoes DESC, cancao
LIMIT 2;