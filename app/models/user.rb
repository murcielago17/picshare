class User < ActiveRecord::Base
	has_many :items, dependent: :destroy
	has_secure_password
end
