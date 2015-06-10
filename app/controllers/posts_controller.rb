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
 		@post.user = current_user

	    if @post.save
	      redirect_to board_path(@board)
	    else
		   render 'new'
	    end
	end

	def edit
		@board = Board.find params[:board_id]
		@post = @board.posts.find params[:id]
	end

	def update
		@board = Board.find params[:board_id]
		@post = @board.posts.find params[:id]

		if @post.user == current_user
			if @post.update(post_params)
				redirect_to board_path(@board)
			else
				render :edit
			end
		else
			redirect_to root, alert: "You cannot edit someone else's post"
		end
	end
	

	def destroy
		@board = Board.find params[:board_id]
		@post = @board.posts.find params[:id]

		if @post.user == current_user
				else
			redirect_to :root, alert: "You cannot delete someone else's post"
		end	
			@post.destroy
			redirect_to board_path(@board)

	end

	private 
		def post_params
			params.require(:post).permit(:name, :title, :description, :phone_number, :email_address)
		end
end

