Spree::BaseHelper.module_eval do

  def link_to_cart(text = t('cart'))
    return "" if current_page?(cart_path)
    if current_order.nil? or current_order.line_items.empty?
      text = "#{text}($0.00)"
    else
      text = "#{text}(#{order_price(current_order)})"
    end
    link_to text, cart_path, :class => "cart"
  end


end
