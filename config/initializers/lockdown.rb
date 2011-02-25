class SpreeStaticContentHooks < Spree::ThemeSupport::HookListener

  # obfuscate customer email addresses for privacy purposes
  replace :admin_orders_index_rows, 'admin/orders/obfuscated_order_line'

  # remove buttons and links to stuff that is disallowed for public admin
  remove :admin_order_show_buttons
  remove :admin_orders_index_header_actions
  remove :admin_orders_index_row_actions
end
