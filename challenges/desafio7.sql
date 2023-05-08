SELECT
  artists.artist_name AS artista,
  albums.album_name AS album,
  COUNT(follow.followed_artist_id) AS pessoas_seguidoras
FROM artists
INNER JOIN albums ON albums.artist_id = artists.id
INNER JOIN follow ON follow.followed_artist_id = artists.id
GROUP BY artists.artist_name, albums.album_name 
ORDER BY
  pessoas_seguidoras DESC,
  artista,
  album;