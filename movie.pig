-- Load dataset
Movies = load 'movies.txt' using PigStorage(',') as (movie_id:int,movie_name:chararray,year:int,rating:double,duration:int);