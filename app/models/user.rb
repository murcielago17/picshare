class User < ActiveRecord::Base
	has_many :items, dependent: :destroy

	has_secure_password

	validates :name, presence: true
	
	has_attached_file :avatar, 
										:styles => { :medium => "150x150>", :thumb => "44x44#" }, 
										:storage => :s3,
	                  :s3_credentials => Proc.new { |a| a.instance.s3_credentials },
	                  :s3_host_name => 's3-us-west-1.amazonaws.com',
	                  :path => "avatars/:id/:style/avatar.:extension",
	                  :default_url => "http://i.imgur.com/9nRLqn3.jpg"
	                 
								
  validates_attachment :avatar, 
  										 :content_type => {:content_type => ["image/jpg","image/jpeg","image/gif","image/png"]},
  										 :size => { :in => 0..1000.kilobytes }
	
	def s3_credentials
	  { :bucket => ENV['AWS_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] }
	end

end
