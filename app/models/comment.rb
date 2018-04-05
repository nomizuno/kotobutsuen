class Comment < ApplicationRecord
  # validates :content, {presence: true, length: {maximum: 31}, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }}
  validates :content, {presence: true, length: {maximum: 31}}
  validates :user_id, {presence: true}

end
