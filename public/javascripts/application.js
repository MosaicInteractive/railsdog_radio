(function($){
  $(document).ready(function(){

    // Remove an item from the cart by setting its quantity to zero and posting the update form
    $('form#updatecart a.delete').show().click(function(){
      $(this).parents('tr').find('input.line_item_quantity').val(0);
      $(this).parents('form').submit();
      return false;
    });


    // add handler for mousing over thumbnails
    $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
    $('ul.thumbnails li').eq(0).addClass('selected');
    $('ul.thumbnails li a').click(function() {
      $("#main-image").data('selectedThumb', $(this).attr('data-product-image'));
      $('ul.thumbnails li').removeClass('selected');
      $(this).parent('li').addClass('selected');
    }).hover(
      function() {
        $('#main-image img').attr('src', $(this).attr('data-product-image'));
      },
      function() {
        $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
      }
    );

    // add light box
    $("a[rel='product_images']").fancybox({
      'transitionIn'	:	'elastic',
  		'transitionOut'	:	'elastic'
    });


    $('#checkout_form_address').validate();

    var get_states = function(region){
      var country        = $('span#' + region + 'country :only-child').val();
      return state_mapper[country];
    }

    var update_state = function(region) {
      var states         = get_states(region);

      var state_select = $('span#' + region + 'state select');
      var state_input = $('span#' + region + 'state input');

      if(states) {
        var selected = state_select.val();
        state_select.html('');
        var states_with_blank = [["",""]].concat(states);
        $.each(states_with_blank, function(pos,id_nm) {
          var opt = $(document.createElement('option'))
                    .attr('value', id_nm[0])
                    .html(id_nm[1]);
          if(selected==id_nm[0]){
            opt.attr('selected', 'selected');
          }
          state_select.append(opt);
        });
        state_select.removeAttr('disabled').show();
        state_input.hide().attr('disabled', 'disabled');

      } else {
        state_input.removeAttr('disabled').show();
        state_select.hide().attr('disabled', 'disabled');
      }

    };


  });
})(jQuery);
