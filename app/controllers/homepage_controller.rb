class HomepageController < Spree::BaseController
  helper :products

  def show
    # do stuff here :)
    @taxons = Taxonomy.where(:name => "Categories").first.root.children
  end

end

