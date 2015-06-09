class PostsController < ApplicationController
	def index
		@posts = current_user.Post.all # each user gets to see his/her posts
	end

	def show 
		@board = Board.find params[:board_id]
		@post = @board.posts.find params[:id]
	end

	def new
		@board = Board.find params[:board_id]
		@post = @board.posts.new
	end

	def create
		@board = Board.find params[:board_id]
		@post = @board.posts.create(post_params)
 
	    if @post.save
	      redirect_to user_post_path(current_user,@post)
	    else
	      render 'new'
	    end
	end



	private 
		def post_params
			params.require(:post).permit(:name, :description, :phone_number, :email_address)
		end
end