select ar.artist_name as artista, al.album_name as album from SpotifyClone.artist ar left join SpotifyClone.album al on ar.id = al.artist_id where ar.artist_name = 'Walter Phoenix' order by album;