require 'spec_helper'

describe "editing a post" do
	before (:each) do	
		visit "posts/new"
		fill_in 'Name', with: 'Test Post'
		fill_in 'Description', with: 'What a wonderful world'
		click_button 'Create Post'
  	end

	it "is possible by clicking a link on the index page to the relevant post" do
		visit "posts"
		click_link 'Edit Post'
		fill_in 'Name', with: 'Amended Test Post'
		click_button 'Create Post'

		expect(current_path).to eq('/posts')
		expect(page).to have_content('Amended Test Post')
	end
end
		
