class PostsController < ApplicationController
	# before_filter :authenticate_user!
	# recommended by devise to authenticate at start of controller

	def new
		@post = Post.new
	end

	def index
		if params[:tag_id]
			@posts = Tag.find_by(name: params[:tag_id]).posts
		else
			@posts = Post.all
		end
		# @posts = Post.for_tag_or_all params[:tag_id]
	end 

	def create
		@post = Post.new params[:post].permit(:name, :description, :postpic, :tag_names)	
		
		if @post.save
			redirect_to '/posts'
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update params[:post].permit(:name, :description, :postpic, :tag_names)
		
		if @post.save
			redirect_to '/posts'
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to '/posts'
	end
end