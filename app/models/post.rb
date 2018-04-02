class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 10},uniqueness: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }}
  validates :user_id, {presence: true}
  validates :reading, {presence: true,length: {maximum: 20},format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }}


  def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        Post.where(['content LIKE ?', "%#{search}%"]).or(Post.where(['reading LIKE ?', "%#{search}%"])).order(reading: :asc)
      else
        Post.all.order(reading: :asc) #全て表示。
      end
    end

end
