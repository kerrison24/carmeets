require 'spec_helper'

describe "Createevents" do
  it "creates event when info submitted correctly" do
    event = FactoryGirl.create(:event)
    visit events_path
    fill_in "Title", :with => event.title
    fill_in "Location", :with => event.location
    fill_in "Description", :with => event.description
    click_button "Create my meetup"
  end
end
