SELECT 
  COUNT(DISTINCT musics.song_name) AS cancoes,
  COUNT(DISTINCT artists.artist_name) AS artistas,
  COUNT(DISTINCT albums.album_name) AS albuns
FROM musics 
INNER JOIN artists ON artists.id = musics.artist_id
INNER JOIN albums ON albums.id = musics.album_id;