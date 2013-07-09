class AddWishlistRefToWishlistitems < ActiveRecord::Migration
  def change
    add_reference :wishlistitems, :wishlist, index: true
  end
end
