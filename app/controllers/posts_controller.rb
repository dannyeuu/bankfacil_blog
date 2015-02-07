class PostsController < ApplicationController
	def index
		@post = Post.order('created_at DESC')
	end

	def post
		@post = Post.friendly.find(params[:post])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:post])
	end

	def create
		@post = Post.new(params[:post])

		@post.save
		redirect_to @post
	end
end
