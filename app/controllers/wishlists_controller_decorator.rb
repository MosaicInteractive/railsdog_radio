WishlistsController.class_eval do
  show.before :load_other_lists

  private
    def load_other_lists
      return unless current_user == @wishlist.user
      @wishlists = current_user.wishlists.select {|wl| wl.id != @wishlist.id }
    end
end
