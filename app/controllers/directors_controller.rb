class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order({ :created_at => :desc })

    render({ :template => "director_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @director = Director.where({:id => the_id }).at(0)
    @filmography = Movie.where({ :director_id => @director.id })

    render({ :template => "director_templates/show.html.erb" })
  end

  def max_dob
    @youngest = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc }).
      at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    @eldest = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc }).
      at(0)

    render({ :template => "director_templates/eldest" })
  end
end
