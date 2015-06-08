class PostsController < ApplicationController
	def index
		@posts = current_user.Post.all # each user gets to see his/her posts
	end

	def show 
		@boards = Board.find params[:board_id]
		@post = @boards.post.find params[:id]
	end

	def new
		@boards = Board.find params[:board_id]
		@post = @boards.post.new
	end

	def create
		@boards = Board.find params[:board_id]
		@board = @user.boards.create(post_params)
 
	    if @board.save
	      redirect_to user_board_path(@user.id,@board.id)
	    else
	      render 'new'
	    end
	end



	private 
		def post_params
			params.require(:post).permit(:name, :description, :phone_number, :email_address)
		end
end