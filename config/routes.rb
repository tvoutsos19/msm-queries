Rails.application.routes.draw do
  
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index"})

  get("/directors/eldest", { :controller => "directors", :action => "wisest"})

  get("/directors/youngest", { :controller => "directors", :action => "dumb"})

  get("/directors/:an_id", { :controller => "directors", :action => "director_details" })

  get("/movies", { :controller => "directors", :action => "movies_index" })

  get("/movies/:an_id", { :controller => "directors", :action => "movies_details" })

  get("/actors", { :controller => "directors", :action => "actors_index" })

  get("/actors/:an_id", { :controller => "directors", :action => "actors_details" })
  
end
