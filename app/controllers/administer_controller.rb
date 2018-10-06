class AdministerController < ApplicationController

before_action ;

  def radio
  end

  def create
    @news = News.new(
      title: params[:title],
  	  usr: params[:url],
  	  next: params[:next]
    )
    @news.save
    if   @news.save
      redirect_to("/")
    else
      render("/administer/news")
    end

  end

end
