class HomepageController < Spree::BaseController
  helper :products

  def show
    @product_groups = Spree::Config[:homepage_groups].split(',').map { |name| ProductGroup.find_by_name(name) }
  end

end

