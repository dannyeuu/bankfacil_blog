class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :message:text, presence: true
end
