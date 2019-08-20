$(document).ready(function () {
  var link_login = "http://localhost:3000/vi/users/sign_in";
  var link_signup = "http://localhost:3000/vi/users/sign_up";
  if (window.location.href.localeCompare(link_login) === 0 ||
    window.location.href.localeCompare(link_signup) === 0)
    $('body,html').animate({scrollTop: 400}, 400)
});

$(document).on('turbolinks:load', function () {
  load_price();

});

var load_price = function () {
  $("input[type=number][name=input--quantity]").bind('keyup change click', function (e) {
      if ((!$(this).data("previousValue") ||
        $(this).data("previousValue") !== $(this).val()) && $(this).val() !== ""
      ) {
        $(this).data("previousValue", $(this).val());
        var product_id = $(this).attr('data-product-id');
        var quantity = $(this).val();
        $.ajax({
          method: 'POST',
          url: '/change-quantity-product',
          data: {product_id: product_id, quantity: quantity},
          dataType: 'script'
        })
      }
    }
  );


  $("input[type=number][name=input--quantity]").each(function () {
    $(this).data("previousValue", $(this).val());
  });
}