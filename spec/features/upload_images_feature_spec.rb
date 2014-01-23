require 'spec_helper'

describe "upload images" do
	# before do
	# 	login
	# end

	it 'allows me to attach a photo on the new post form' Description
	    visit '/posts/new'

	    fill_in 'Name', with: 'My test photo'
	    fill_in 'Description', with: 'Blah blah'
	    attach_file 'Postpic', Rails.root.join('spec/images/smiley1.jpeg')
	    click_button 'Create Post'

		expect(page).to have_css 'img.instagram-upload'
	end
end