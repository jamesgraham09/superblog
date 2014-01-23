require 'spec_helper'

describe 'filtering by tags' do
	before do
		tag = create(:tag, name: 'yolo')

		tagged = create(:post, description: 'Something')
		create(:post, description: 'Another')

		tagged.tags << tag
	end

	it 'can filter by clicking on a tag' do
		visit '/posts'
		click_link '#yolo'

		expect(page).to have_content('Something')
		expect(page).not_to have_content('Another')
	end

end