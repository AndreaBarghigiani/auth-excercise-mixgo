class PostsController < ApplicationController
	before_action :set_post, only: %i[ show edit update destroy ]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(posts_params)
		@post.user_id = session[:user_id] if session.present?

		if @post.save
			redirect_to dashboards_path
		else
			flash[:alert] = "Couldn't create the post"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @post.update(posts_params)
			redirect_to dashboards_path, notice: "Post was successfully updated."
		else
			 flash[:alert] = "Something wrong while updating your post"
			 render :edit, status: :unprocessable_entity
		end 
	end

	private
		def set_post
			@post = Post.find(params[:id])
		end

		def posts_params
			params.require(:post).permit(:title, :body)
		end
end
