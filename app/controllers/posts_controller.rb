class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  # @post = Post.new
		# @post.title = params[:post][:title]
		# @post.description = params[:post][:description]
	  # @post.save
		@post = Post.new(post_params)
  	@post.save
  	redirect_to post_path(@post)

	end

	def update
	  # @post = Post.find(params[:id])
	  # @post.update(title: params[:post][:title], description: params[:post][:description])
		@post = Post.find(params[:id])
  	@post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end


private

def post_params
  params.require(:post).permit(:title, :description)
end
