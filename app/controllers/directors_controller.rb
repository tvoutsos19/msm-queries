class DirectorsController < ApplicationController 

  def index
   render({ :template => "directors_template/index.html.erb" })
  end

  def wisest
    @oldest = Director.where.not({ :dob => nil}).order({ :dob => :asc}).at(0)
    render({ :template => "directors_template/eldest.html.erb" })
  end

  def dumb
    @youngest = Director.where.not({ :dob => nil}).order({ :dob => :desc}).at(0)
    render({ :template => "directors_template/youngest.html.erb" })
  end

  def director_details
    # params looks like {"an_id"=>"42"}

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id}).at(0)
    @filmography = Movie.where({ :director_id => @the_director.id})

    render({ :template => "directors_template/show.html.erb" })
  end

  def movies_index
   render({ :template => "movies_template/movies_index.html.erb" })
  end

  def movies_details
    # params looks like {"an_id"=>"42"}

    the_id = params.fetch("an_id")

    @the_movie = Movie.where({ :id => the_id}).at(0)

    render({ :template => "movies_template/movies_details.html.erb" })
  end

  def actors_index
   render({ :template => "actors_template/actors_index.html.erb" })
  end

  def actors_details
    # params looks like {"an_id"=>"42"}

    the_id = params.fetch("an_id")

    @the_actor = Actor.where({ :id => the_id}).at(0)

    @character = Character.where({ :actor_id => the_id})

    render({ :template => "actors_template/actors_details.html.erb" })
  end

end