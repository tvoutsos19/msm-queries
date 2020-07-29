require "rails_helper"

describe "/actors" do
  it "lists the names of each Actor record in the Actor table", points: 1 do
    
    ashley_johnson = Actor.new
    ashley_johnson.name = "Ashley Johnson"
    ashley_johnson.dob = 28.years.ago
    ashley_johnson.image = ""
    ashley_johnson.save
    
    gugu = Actor.new
    gugu.name = "Gugu Mbatha-Raw"
    gugu.dob = 38.years.ago
    gugu.image = ""
    gugu.save
    
    idris = Actor.new
    idris.name = "Idris Elba"
    idris.dob = 58.years.ago
    idris.image = ""
    idris.save

    visit "/actors"

    expect(page).to have_text(ashley_johnson.name),
      "Expected page to have the name, 'Ashley Johnson'"
    
    expect(page).to have_text(gugu.name),
      "Expected page to have the name, '#{gugu.name}'"
    
    expect(page).to have_text(idris.name),
      "Expected page to have the name, '#{idris.name}'"
  end
end

describe "/actors" do
  it "has a 'Show details' link to the details page of each Actor", points: 1 do
    
    ashley_johnson = Actor.new
    ashley_johnson.name = "Ashley Johnson"
    ashley_johnson.dob = 28.years.ago
    ashley_johnson.image = ""
    ashley_johnson.save
    
    gugu = Actor.new
    gugu.name = "Gugu Mbatha-Raw"
    gugu.dob = 38.years.ago
    gugu.image = ""
    gugu.save
    
    idris = Actor.new
    idris.name = "Idris Elba"
    idris.dob = 58.years.ago
    idris.image = ""
    idris.save

    visit "/actors"

    expect(page).to have_tag("a", :with => { :href => "/actors/#{ashley_johnson.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/actors/#{ashley_johnson.id}'"

    expect(page).to have_tag("a", :with => { :href => "/actors/#{gugu.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/actors/#{gugu.id}'"

    expect(page).to have_tag("a", :with => { :href => "/actors/#{idris.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/actors/#{idris.id}'"

  end
end
