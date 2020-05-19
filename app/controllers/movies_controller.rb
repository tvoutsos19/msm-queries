class MoviesController < ApplicationController
  def tdk
    render({ :template => "movie_templates/dk.html.erb" })
  end
  
  def before2k
    render({ :template => "movie_templates/pre2000.html.erb" })
  end
end
