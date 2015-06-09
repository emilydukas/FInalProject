class BoardsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

	def index
		@boards = Board.all
	end

	def show
		@board = Board.find params[:id]
		@posts = @board.posts
	end

end
