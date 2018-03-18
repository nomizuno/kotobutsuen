class Post < ApplicationRecord

  def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        Post.where(['content LIKE ?', "%#{search}%"]).order(reading: :asc)
      else
        Post.all.order(reading: :asc) #全て表示。
      end
    end

end
