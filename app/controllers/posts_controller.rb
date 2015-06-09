class PostsController < ApplicationController
	 before_action :authenticate_user!

	def index
		@board = Board.find params[:board_id]
		@posts = @board.posts # each user gets to see his/her posts
	end

	def show 
		@board = Board.find params[:board_id]
		@post = @board.posts.find params[:id]
	end

	def new
		@board = Board.find params[:board_id]
		@post = @board.posts.build
	end

	def create
		@board = Board.find params[:board_id]
		@post = @board.posts.build(post_params)
 
	    if @post.save
	      redirect_to board_path(@board)
	    else
		   render 'new'
	    end
	end



	private 
		def post_params
			params.require(:post).permit(:name, :title, :description, :phone_number, :email_address)
		end
end