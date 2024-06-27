-- Top Songs Streamed on Spotify 2023: Data Exploration

-- Top 10 most streamed songs for 2023
SELECT track_name, artist_names, streams
FROM data_portfolio.spotify_2023
ORDER BY streams DESC
LIMIT 10;

-- Number of songs each artist has in this dataset from most to least
SELECT artist_names, COUNT(*) AS number_of_songs
FROM data_portfolio.spotify_2023
GROUP BY artist_names
ORDER BY number_of_songs DESC;

-- Top 10 most streamed artists for 2023 
SELECT artist_names, SUM(streams) AS total_num_of_streams
FROM data_portfolio.spotify_2023
GROUP BY artist_names
ORDER BY total_num_of_streams DESC
LIMIT 10;

-- Average number of streams for each artist
SELECT artist_names, AVG(streams) AS avg_num_of_streams
FROM data_portfolio.spotify_2023
GROUP BY artist_names
ORDER BY avg_num_of_streams DESC;

-- Number of top songs in a major key (happy sounding) vs a minor key (sad sounding)
SELECT song_mode, COUNT(*)
FROM data_portfolio.spotify_2023
GROUP BY song_mode;

-- Returns the number of streams for each song and the number of Spotify curated playlists the song is in. To be used for visualization 
SELECT track_name, artist_names, streams, in_spotify_playlists
FROM data_portfolio.spotify_2023;

-- Returns the top songs that were released in the 1980s
SELECT track_name, artist_names, released_year
FROM data_portfolio.spotify_2023
WHERE released_year BETWEEN 1980 AND 1989;

/* Returns the number of streams for each song, the year the song was released, and the metrics used to measeure how danceable, 
   the amount of energy, and the amount of live instrumentation is in the song. To be used for visualization
*/
SELECT track_name, artist_names, released_year, streams, danceability, energy, liveness
FROM data_portfolio.spotify_2023;

-- Returns Taylor Swift's #1 most streamed song
SELECT track_name
FROM data_portfolio.spotify_2023
WHERE artist_names = 'Taylor Swift'
ORDER BY streams DESC
LIMIT 1;

-- Returns the number of artists with minimun of 2 billion streams
SELECT artist_names, SUM(streams) AS total_num_of_streams
FROM data_portfolio.spotify_2023
GROUP BY artist_names
HAVING total_num_of_streams > 2000000000
ORDER BY total_num_of_streams DESC;