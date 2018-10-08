class AdministerController < ApplicationController

  # before_action :admin_check,only: [:news, :create]
  before_action :authenticate_admin_user!

  def news
  end




  def create
    @news = News.new(
      title: params[:title],
  	  url: params[:url],
  	  title2: params[:title2]
    )
    @news.save
    if   @news.save
      redirect_to("/")
    else
      render("/administer/news")
    end

  end

end
