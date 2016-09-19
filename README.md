
# Brian Sisney's Coding Challenge Solution

## Description

Write a small system for managing your music collection. The system should be accessible from the command line and program should accept the following commands:

- **add "$title" "$artist"**: adds an album to the collection with the given title and artist. All albums are unplayed by default.
- **play "$title"**: marks a given album as played.
- **show all**: displays all of the albums in the collection
- **show unplayed**: display all of the albums that are unplayed
- **show all by "$artist"**: shows all of the albums in the collection by the given artist
- **show unplayed by "$artist"**: shows the unplayed albums in the collection by the given artist
- **quit**: quits the program

Some other stipulations:

- Assume that there can never be two albums with the same title in the system (even if they were to have different artists). The user shouldn't be allowed to add two albums with the same title.

- **Do not** use a persistence mechanism (ie, a SQL database) for the albums. Store them in memory. That is, every time you run the program, the list of albums should be empty. 


## Running the program

From the project's main directory run the following command:

```
./music
```

## Running the tests

The tests for my solution are written using RSpec. To install the dependency on RSpec run:

```
bundle install
```

To run the full test suite:

```
bundle exec rspec spec/
```

To run specific specs, use `bundle exec rspec` followed by the path to the spec.

## Notes

There are a few assumptions I made in solving the challenge. In a production environment I would have asked for more detail on the specifications before making these assumptions.

* This assumes that you would only write strings with double quotes and not single quotes.

* This assumes that the artist is always listed as the second option when displaying albums.
