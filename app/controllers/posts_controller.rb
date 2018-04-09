class PostsController < ApplicationController

  def new
		@post = Post.new
	end

	def index

		 @posts = Post.search(params[:search])

         if @posts.empty?
         	flash[:notice] ="まだデータがないみたい！投稿してみたら？"
           redirect_to("/posts/new")
         end

  end


	def recent
		@comments = Comment.all.order(created_at: :desc).page(params[:page])
	end

  def recent_words
		@posts = Post.where(comments_count: 0).order(created_at: :desc).page(params[:page])
	end

	def popular
		@comments = Comment.all.order("likes_count desc").page(params[:page])
	end



	def create
		@post=Post.new(content: params[:content],
			user_id: current_user.id,
			reading: params[:reading],
      comments_count: 0)
		@post.save
	  if @post.save
      #保存できた場合
        redirect_to("/posts/#{@post.id}")
        flash[:notice] ="投稿できたよ!"
      else
  	    render("/posts/new")
      end
    end


    def show
     @post = Post.find_by(id: params[:id])
     @comments = Comment.where(post_id: @post.id).order("likes_count desc").page(params[:page])
     @post.comments_count = Comment.where(post_id: @post.id).count
     @post.save
     # @comments = Comment.page(params[:page])
    end

     def show_all
     @post = Post.find_by(id: params[:id])
     @comments = Comment.where(post_id: @post.id).order("likes_count desc")
    end

    def index_all
      @words = ["あ","い","う","え","お",
                "か","き","く","け","こ",
                 "さ","し","す","せ","そ",
                 "た","ち","つ","て","と",
                 "な","に","ぬ","ね","の",
                  "は","ひ","ふ","へ","ほ",
                  "ま","み","む","め","も",
                  "や","ゆ","よ",
                  "ら","り","る","れ","ろ",
                "わ","を","ん",
                "が","ぎ","ぐ","げ","ご",
                 "ざ","じ","ず","ぜ","ぞ",
               "だ","ぢ","づ","で","ど",
               "ば","び","ぶ","べ","ぼ","ぱ","ぴ","ぷ","ぺ","ぽ"]
    end

    def word
  		 @posts = Post.where(['reading LIKE ?', "#{params[:word]}%"])or(Post.where(['reading LIKE ?', "#{params[:word]}%"]))
    end

end
