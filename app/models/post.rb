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
end