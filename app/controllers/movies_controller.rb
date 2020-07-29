class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :created_at => :desc })

    render({ :template => "movie_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @movie = Movie.where({:id => the_id }).at(0)

    render({ :template => "movie_templates/show.html.erb" })
  end
end
