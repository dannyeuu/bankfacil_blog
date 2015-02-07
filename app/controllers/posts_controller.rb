class PostsController < ApplicationController
	def index
		@post = Post.order('created_at DESC')
	end
end
