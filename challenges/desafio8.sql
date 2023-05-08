SELECT
  artists.artist_name AS artista,
  albums.album_name AS album
FROM artists
INNER JOIN albums ON albums.artist_id = artists.id
WHERE artists.artist_name = 'Elis Regina'
ORDER BY albums.album_name;