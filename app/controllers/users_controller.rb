class UsersController < ApplicationController

  def show
  	@user = User.find_by(id: params[:id])


    @comments = Comment.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
    @post_count = Post.where(user_id: @user.id).count
    @comments_count = Comment.where(user_id: @user.id).count

    @likes_count = Comment.where(user_id: @user.id).sum(:likes_count)

  end

  def new
   @user = User.new

 end



def edit
 @user = User.find_by(id: params[:id])
 @user.save
end




def likes
  @user = User.find_by(id: params[:id])
  @post_count = Post.where(user_id: @user.id).count
  @comments_count = Comment.where(user_id: @user.id).count
  @likes = Like.where(user_id: @user.id).order(created_at: :desc).page(params[:page])
  @likes_count = Comment.where(user_id: @user.id).sum(:likes_count)
end


def send_newsletter
  UserMailer.newsletter.deliver
  # User.find_each do |user|
   # UserMailer.with(user: user).newsletter.deliver
  # end

   redirect_to("/posts/recent")
end

end
