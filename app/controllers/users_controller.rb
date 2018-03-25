class UsersController < ApplicationController

  def show
  	@user = User.find_by(id: params[:id])


    @comments = Comment.where(user_id: @user.id)
    @post_count = Post.where(user_id: @user.id).count
    @comments_count = Comment.where(user_id: @user.id).count

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
  @likes = Like.where(user_id: @user.id)
end

end