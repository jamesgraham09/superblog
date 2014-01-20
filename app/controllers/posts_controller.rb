class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end 

	def create
		@post = Post.new params[:post].permit(:name, :description)	
		
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
		@post.update params[:post].permit(:name, :description)
		
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