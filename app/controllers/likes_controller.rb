class LikesController < ApplicationController


	def create
		@like = Like.new(
			user_id: current_user.id,
			comment_id: params[:comment_id]
			)
		@like.save
		@comment = Comment.find_by(id: params[:comment_id])
		@comment.likes_count = Like.where(comment_id: params[:comment_id]).count
		@comment.save
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/#{@post.id}")
	end

	def destroy
		@like = Like.find_by(
			user_id: current_user.id,
			comment_id: params[:comment_id]
			)
		@like.destroy
		@comment = Comment.find_by(id: params[:comment_id])
		@comment.likes_count = Like.where(comment_id: params[:comment_id]).count
		@comment.save
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/#{@post.id}")
	end

	def create_recent
		@like = Like.new(
			user_id: current_user.id,
			comment_id: params[:comment_id]
			)
		@like.save
		@comment = Comment.find_by(id: params[:comment_id])
		@comment.likes_count = Like.where(comment_id: params[:comment_id]).count
		@comment.save
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/recent")
	end

	def destroy_recent
		@like = Like.find_by(
			user_id: current_user.id,
			comment_id: params[:comment_id]
			)
		@like.destroy
		@comment = Comment.find_by(id: params[:comment_id])
		@comment.likes_count = Like.where(comment_id: params[:comment_id]).count
		@comment.save
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/recent")
	end

end
