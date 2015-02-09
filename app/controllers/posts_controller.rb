class PostsController < ApplicationController
	def index
		@post = Post.order('created_at DESC')
	end

	def post
		@post = Post.friendly.find(params[:post])
	end

	def novo
		@post = Post.new
	end

	def edit
		@post = Post.friendly.find(params[:post])
	end

	def update
		@post = Post.friendly.find(params[:post])

		if @post.update_attributes(post_params)
			redirect_to action: "post", post: @post
		else
			render action: "edit"
		end
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to action: "post", post: @post
		else
			render action: "novo"
		end
	end

	def destroy
		@post = Post.find(params[:post])
		@post.destroy

		redirect_to action: 'posts#index'
	end

	private
		def post_params
			params.require(:post).permit(:title, :message)
		end
end
