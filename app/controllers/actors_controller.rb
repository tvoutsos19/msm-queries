class ActorsController < ApplicationController
  def index
    @actors = Actor.all.order({ :created_at => :desc })

    render({ :template => "actor_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @actor = Actor.where({:id => the_id }).at(0)
    
    render({ :template => "actor_templates/show.html.erb" })
  end
end
