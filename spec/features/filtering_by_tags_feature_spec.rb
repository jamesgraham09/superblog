require 'spec_helper'

describe 'filtering by tags' do
	before do
		tag = create(:tag, name: 'yolo')

		tagged = create(:post, title: 'Something')
		create(:post, title: 'Another')

		tagged.tags << tag
	
end