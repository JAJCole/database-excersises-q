# Use the albums_db database.
use albums_db;

# What is the primary key for the albums table?
show tables;
select * from albums;
/* the primary key of the albums table is the "id" */

# What does the column named 'name' represent?
/* The column 'name' represents the name of the albums within the albums_db. */

# What do you think the sales column represents?
/* The sales column represents the millions of copies of the albums sold. */

# Find the name of all albums by Pink Floyd.
select name, artist from albums where artist = 'Pink Floyd';

# What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";

# What is the genre for the album Nevermind?
select genre from albums where name = 'Nevermind';

# Which albums were released in the 1990s?
select name from albums where release_date between 1990 and 1999;

# Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
select name as low_selling_albums from albums where sales < 20;
