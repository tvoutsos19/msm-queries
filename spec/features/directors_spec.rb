require "rails_helper"

describe "/directors" do
  it "lists the names of each Director record in the database", points: 1 do
    director = Director.new
    director.name = "Travis McElroy"
    director.dob = 38.years.ago
    director.image = ""
    director.save

    other_director = Director.new
    other_director.name = "Trina Kayetti"
    other_director.dob = 30.years.ago
    other_director.image = ""
    other_director.save

    iris_roy = Director.new
    iris_roy.name = "Iris Roy"
    iris_roy.dob = 32.years.ago
    iris_roy.image = ""
    iris_roy.save

    visit "/directors"

    expect(page).to have_text(director.name),
      "Expected page to have the name, '#{director.name}'"
    
    expect(page).to have_text(other_director.name),
      "Expected page to have the name, '#{other_director.name}'"
    
    expect(page).to have_text(iris_roy.name),
      "Expected page to have the name, '#{iris_roy.name}'"
  end
end

describe "/directors" do
  it "has a 'Show details' link to the details page of each director", points: 1 do
    director = Director.new
    director.name = "Travis McElroy"
    director.dob = 38.years.ago
    director.image = ""
    director.save

    other_director = Director.new
    other_director.name = "Trina Kayetti"
    other_director.dob = 30.years.ago
    other_director.image = ""
    other_director.save

    iris_roy = Director.new
    iris_roy.name = "Iris Roy"
    iris_roy.dob = 32.years.ago
    iris_roy.image = ""
    iris_roy.save

    visit "/directors"

    expect(page).to have_tag("a", :with => { :href => "/directors/#{director.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/directors/#{director.id}'"

    expect(page).to have_tag("a", :with => { :href => "/directors/#{other_director.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/directors/#{other_director.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/directors/#{iris_roy.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/directors/#{iris_roy.id}'"

  end
end

