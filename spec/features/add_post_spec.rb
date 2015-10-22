require 'rails_helper'

describe "the add a list process" do
  it "adds a new post" do
    visit posts_path
    click_link 'Add Post'
    fill_in 'Title', :with => 'Home stuff'
    fill_in 'Body', :with => 'Car stuff'
    fill_in '#tags', :with => '#testing #is #no #fun'
    click_on 'Post!'
    expect(page).to have_content 'Home stuff'
  end
end
