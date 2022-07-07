Movie.destroy_all

100.times do |index|

  movie_title = FFaker::Movie.title

  p "Creating #{movie_title} movie"
  Movie.create!(title: movie_title,
                director:   FFaker::Name.first_name,
                storyline:  FFaker::Lorem.paragraph,
                watched_on: FFaker::Time.datetime)
end

p "Created #{Movie.count} movies"