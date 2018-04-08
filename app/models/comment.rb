class Comment < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 31}, exclusion: { in: %w(www us ca jp) }}
  validates :user_id, {presence: true}

end
