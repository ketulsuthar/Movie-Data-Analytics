-- Load dataset
Movies = load 'movies.txt' using PigStorage(',') as (movie_id:int,movie_name:chararray,year:int,rating:double,duration:int);

-- A. Find the number of movies released between 1950 and 1960.

moviesbetween1950_1960 = filter Movies by (year > 1950 and year< 1960);
tmpMovies = foreach moviesbetween1950_1960 generate $1,1;
groupbyMovies = group tmpMovies by $1;
countMovies = foreach groupbyMovies generate COUNT($1);
dump countMovies;


-- B. Find the number of movies having rating more than 4.

ratingMovies4 = filter Movies by (rating > 4.0);
tmpMovies = foreach ratingMovies4 generate $1,1;
groupByCount = group tmpMovies by $1;
moviesRatingCount = foreach groupByCount generate 'Rating more than 4.0 Movies Count', COUNT($1);
dump moviesRatingCount;