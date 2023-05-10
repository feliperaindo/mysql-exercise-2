SELECT
  albums.album_name AS album,
  COUNT(fs.song_id) AS favoritadas
FROM favorite_songs AS fs
INNER JOIN musics ON fs.song_id = musics.id
INNER JOIN albums ON albums.id = musics.album_id
GROUP BY albums.album_name
ORDER BY favoritadas DESC
LIMIT 3;