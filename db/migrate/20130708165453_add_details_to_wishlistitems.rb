class AddDetailsToWishlistitems < ActiveRecord::Migration
  def change
    add_column :wishlistitems, :title, :string
    add_column :wishlistitems, :url, :string
    add_column :wishlistitems, :image, :string
    add_column :wishlistitems, :price, :decimal
  end
end
