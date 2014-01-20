class Post < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true

	has_attached_file :postpic, :styles => { :thumb => ["50x50#"] }
end
