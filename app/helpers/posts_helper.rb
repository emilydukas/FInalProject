module PostsHelper
	def find(post)
		@profile = post.find params[:user_id] 
	end
end