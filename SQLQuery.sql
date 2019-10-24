--SELECT * FROM Genre;

--INSERT INTO Artist (ArtistName, YearEstablished) Values ('Led Zeppelin', '1968');

--SELECT * FROM Artist;

--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) Values ('Houses of the Holy', '1973', 3610, 'Atlantic', 28, 2);

--update Album
--set ReleaseDate = '03/28/1973'
--where Id = 23;

--SELECT * FROM Album;

--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Dyer Maker', '423', '03/28/1973', 2,28,23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Over the Hills and Far Away', '422', '03/28/1973', 2,28,23);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('The Song Remains the Same', '532', '03/28/1973', 2,28,23);

--SELECT * FROM SONG;

--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title, ar.ArtistName FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id LEFT JOIN Artist ar  ON s.ArtistId = ar.Id where s.AlbumId = 23;


--ALL ALBUMS WITH THE NUMBER OF SONGS PER ALBUM

--SELECT Album.Title, COUNT(Song.AlbumId)
--AS 'Count'
--FROM Album
--LEFT JOIN
--Song
--ON Song.AlbumId = Album.Id
--GROUP BY Album.Title
--ORDER BY 'COUNT' DESC;

--ALL ARTISTS WITH THE NUMBER OF SONGS PER ALBUM

--SELECT Artist.ArtistName, COUNT(Song.ArtistId)
--AS 'Count'
--FROM Artist
--LEFT JOIN
--Song
--ON Song.ArtistId = Artist.Id
--GROUP BY Artist.ArtistName
--ORDER BY 'COUNT' DESC;

--ALL GENRES WITH THE NUMBER OF SONGS PER GENRE

--SELECT Genre.Label, COUNT(Song.GenreId)
--AS 'Count'
--FROM Genre
--LEFT JOIN
--Song
--ON Song.GenreId = Genre.Id
--GROUP BY Genre.Label
--ORDER BY 'COUNT' DESC;

--SELECT THE ALBUM WITH THE LONGEST DURATION

--SELECT Album.Title, Album.AlbumLength
--FROM Album
--WHERE
--	AlbumLength = (
--		SELECT MAX(AlbumLength)
--		FROM Album
--	);

SELECT Song.Title
AS 'Song',
Song.SongLength
As 'Length', 
a.Title
AS 'Album'
FROM Song
LEFT JOIN
Album a
ON Song.AlbumId = a.Id
WHERE
	SongLength = (
		SELECT MAX(SongLength)
		FROM Song
	);