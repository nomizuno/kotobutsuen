class Comment < ApplicationRecord

  validates :content, {presence: true, length: {maximum: 140}, exclusion: { in: %w(www us ca jp http) }}


  validates :user_id, {presence: true}
end
