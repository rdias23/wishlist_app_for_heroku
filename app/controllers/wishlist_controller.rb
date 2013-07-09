class WishlistController < ApplicationController
	before_filter :authenticate_user!, except: :add_wishlistitem

  def show
    @user = current_user
    @wishlistitems_backwards = @user.wishlistitems
    @wishlistitems = @wishlistitems_backwards.reverse
  end

  def add_wishlistitem
    unless current_user
        respond_to do |format|
          format.js { render partial: '/wishlist/fail.js.erb' }
        end
      else

        wishlist = current_user.wishlist.id
        title = params[:title]
        image = params[:image]
        price = params[:price]
        link_url = params[:link_url]

        @wishlistitem = Wishlistitem.create(wishlist_id: wishlist, title: title, image: image, price: price, url: link_url)
        
        if @wishlistitem.save          
          respond_to do |format|
            format.js
          end
        end
      end
end
    def delete_wishlistitem
       @wishlistitem = Wishlistitem.find(params[:id])
         @wishlistitem.destroy

    end
end
