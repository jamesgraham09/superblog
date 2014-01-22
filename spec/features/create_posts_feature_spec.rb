require 'spec_helper.rb'

describe "creating a post" do
	context "given a name and description" do
		it "should display the post on the index page" do
			visit "posts/new"
			fill_in 'Name', with: 'Test Post'
			fill_in 'Description', with: 'What a wonderful world'
			fill_in 'Tags', :with => 'yolo swag'
			click_button 'Create Post'

			expect(current_path).to eq('/posts')
			expect(page).to have_content('Test Post')
			expect(page).to have_content('What a wonderful world')
			expect(page).to have_content('#yolo')
			expect(page).to have_content('#swag')
		end
	end

	context "without a name and description" do
		it "should display errors" do
			visit '/posts/new'
			click_button 'Create Post'

			expect(page).to have_content('error')
		end
	end
end