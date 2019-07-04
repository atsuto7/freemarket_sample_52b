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

$(function() {
  $('select[name=sort_order]').change(function() {

    var this_value = $(this).val();
    if (this_value == "price_asc") {
      html = "&sort=price+asc"
    } else if (this_value == "price_desc") {
      html = "&sort=price+desc"
    } else if (this_value == "created_at_asc") {
      html = "&sort=created_at+asc"
    } else if (this_value == "created_at_desc") {
      html = "&sort=created_at+desc"
    } else {
      html = ""
    };
    var current_html = window.location.href;
    if (location['href'].match(/&sort=*.+/) != null) {
      var remove = location['href'].match(/&sort=*.+/)[0]
      var current_html = current_html.replace(remove, '')
    };
    window.location.href = current_html + html
  });

  $(function () {
    if (location['href'].match(/&sort=*.+/) != null) {
      if ($('select option[selected=selected]')) {
        $('select option:first').prop('selected', false);
      }

      var selected_option = location['href'].match(/&sort=*.+/)[0].replace('&sort=', '');

      if(selected_option == "price+asc") {
        var sort = 1
      } else if (selected_option == "price+desc") {
        var sort = 2
      } else if (selected_option == "created_at+asc") {
        var sort = 3
      } else if (selected_option == "created_at+desc") {
        var sort = 4
      }

      var add_selected = $('select[name=sort_order]').children()[sort]
      $(add_selected).attr('selected', true)
    }
  });
});