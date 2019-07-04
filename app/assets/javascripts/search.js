$(document).on('turbolinks:load', function () {
  var search_price_field = $('.search-container__l-content__extend__price__field');
  var search_price_select = search_price_field.parent('div').children('.search-container__l-content__extend__price__select').children('select');
  var price_range;
  var price_array;

  search_price_select.on('change', function() {
    price_range = $(this).val();
    price_array = price_range.split(/\s|~/);
    search_price_field.children('input:first-of-type').val(price_array.shift());
    search_price_field.children('input:last-of-type').val(price_array.pop());
  });
});