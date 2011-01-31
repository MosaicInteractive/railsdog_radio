(function($){
  $(document).ready(function(){
    $('div#banner section div').jCarouselLite({
        btnNext: "#banner-nav .last",
        btnPrev: "#banner-nav .first",
        visible: 1,
        auto: 3000,
        speed: 1000,
        btnGo:
          ["#b1_handle", "#b2_handle",
          "#b3_handle", "#b4_handle"],
        afterEnd: function(a) {
          $('#banner-nav li.current').removeClass('current');

          var handle = $('#' + a.attr('id') + '_handle');
          handle.addClass('current');
        }

    });


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

    //wishlist


    //handle wishlist edit link (show / hide form)
    $('a#edit_wishlist_link').click(function(){
      if($('#edit_wishlist').is(':visible')){
        $('#edit_wishlist').slideUp();
      }else{
        $('#edit_wishlist').slideDown();
      }

      return false;
    });

    //handle move item link
    $('.move_item a.button').click(function(){
      var move_button = $(this);
      move_button.hide();
      move_button.parent().find('form').fadeIn();
      return false;
    });



    //search box
    if(!$.browser.webkit){
      var $input = $('#s1');
      var placeholder = $input.attr('placeholder');
      $input.focus(function(){
        if($input.val() == placeholder){
          $input.val('');
          $input.removeClass('empty');
        }
      });
      $input.blur(function(){
        if($.trim($input.val()) == ""){
          $input.val(placeholder);
          $input.addClass('empty');
        }
      });
      $input.triggerHandler('blur');
    }

  });
})(jQuery);
