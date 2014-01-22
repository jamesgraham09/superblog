class Post < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true

	has_attached_file :postpic, 
		:styles => { :thumb => "50x50#" },
		:storage => :s3,
		:s3_credentials => {
			:access_key_id =>'AKIAJTZE473R5JRB34WA',
			:secret_access_key => Rails.application.secrets.s3_secret
		},
		:bucket => 'superblog_development'

	has_and_belongs_to_many :tags

	def tag_names
		tags.map {|tag| tag.name}.join(', ')
	end

	def tag_names=(tag_names)
		self.tags = tag_names.split(', ').map do |tag_name|
			Tag.find_or_create_by(:name => tag_name)
		end
	end
end