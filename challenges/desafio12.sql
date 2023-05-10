SELECT
  artists.artist_name AS artista,
  CASE
    WHEN COUNT(fs.song_id) >= 5 THEN 'A'
    WHEN COUNT(fs.song_id) >= 3 THEN 'B'
    WHEN COUNT(fs.song_id) >= 1 THEN 'C'
    ELSE '-'
  END AS ranking
FROM artists
INNER JOIN musics
  ON musics.artist_id = artists.id
LEFT JOIN favorite_songs AS fs
  ON fs.song_id = musics.id
GROUP BY artists.artist_name
ORDER BY
  REPLACE(ranking, '-', 'Z'),
  artista;