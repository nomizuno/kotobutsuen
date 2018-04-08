class Comment < ApplicationRecord

  validates :content, {presence: true, length: {maximum: 31}, exclusion: { in: %w(www us ca jp http) }}
  validates :content, {presence: true, length: {maximum: 31}}

  validates :user_id, {presence: true}
end
