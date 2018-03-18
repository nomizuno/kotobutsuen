class AddReadingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :reading, :string
  end
end
