# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all


top_movies_api = "https://tmdb.lewagon.com/movie/top_rated"
top_movies = JSON.parse(URI.open(top_movies_api).read)["results"]
top_movie_genres = top_movies.map { |movie| movie["genre_ids"] }
                             .flatten

genres_api = "https://tmdb.lewagon.com/genre/movie/list"
genres = JSON.parse(URI.open(genres_api).read)["genres"]

genres.filter! do |genre|
  top_movie_genres.include?(genre["id"])
end

genres.each { |genre|
  list = List.create(
    name: genre["name"],
  )
  top_movies
    .filter do |movie_data|
      movie_data["genre_ids"].include?(genre["id"])
    end
    .each do |movie_data|
      movie = Movie.create(
        title: movie_data["title"],
        overview: movie_data["overview"],
        poster_url: movie_data["poster_path"],
        rating: movie_data["vote_average"]
      )
      Bookmark.create(
        movie_id: movie.id,
        list_id: list.id,
        comment: "#{genre["name"]} rocks!"
      )
    end
}
