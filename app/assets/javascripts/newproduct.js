$(function() {
  function orgFloor(value, base) {
    return Math.floor(value * base) / base;
}
function disabled_false() {
  $('.sell-page__main__container__item__sell-btn-box__sell-btn').prop('disabled', false); 
}
  function appendimage(src, image_id) {
    var html = `<div class="sell-page__main__container__item__upload__imagebox__appendbox" data-image-id= '${image_id}'>
    <img  src="${src}" class="sell-page__main__container__item__upload__imagebox__appendbox__imagephoto">
    <h1 class='image-remove-btn'>削除</h1>
    </div>`
  return html
  }
  function Profit(profit) {
    profit = profit.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    var html = `<p class='profit__result'>¥${profit}</p>`
  return html
  }
  function compoundingfee(compounding_fee) {
    compounding_fee = compounding_fee.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
    var html = `<p class='compounding_fee__result'>¥${compounding_fee}</p>`
  return html
  }
  function secoundselectbox() {
    var html = `<select id="secound_category_id"><option value>---</option></select>`
    return html
  }
  function thirdselectbox() {
    var html = `<select id="third_category_id"><option value>---</option></select>`
    return html
  }
  function appendcategory(category) {
    var html = `<option value="${category.id}">${category.name}</option>`
    return html
  }
  var num = 0
  var images_id = [];
$(document).on('turbolinks:load', function(){
  $('.input-price').on("keyup", function(){
    var input = $('.input-price').val();
    if (300 <= input && input <= 9999999) {
      compounding_fee = input/10
      compounding_fee = orgFloor(compounding_fee, 1)
      profit = input - compounding_fee
      $('.compounding_fee').hide();
      $('.profit').hide();
      var html = compoundingfee(compounding_fee);
      var profit_html = Profit(profit);
      $('.compounding_fee__result').remove();
      $('.profit__result').remove();
      $('.sell-page__main__container__item__price__inner__box__fee__right').append(html)
      $('.sell-page__main__container__item__price__inner__box__profit__right').append(profit_html)
    }else{
      $('.compounding_fee').show();
      $('.profit').show();
      $('.compounding_fee__result').remove();
      $('.profit__result').remove();
    }  
  });
})
$(document).on('turbolinks:load', function(){
$('.sell-page__main__container__item__upload__dropbox__file').change(function() {
  var formdata = new FormData($('#image_form').get(0));
  $.ajax({
    type: 'post',
    url: '/images',
    data: formdata,
    dataType: 'json',
    processData: false,
    contentType: false
  })
  .done(function(data) {
    var number = $('.sell-page__main__container__item__upload__imagebox__appendbox').length;
    number += 1
    images_id.push(data.id);
    var image_id = data.id;
    var file    = document.querySelector('input[type=file]').files[0];//'input[type=file]'で投稿されたファイル要素の0番目を参照します。input[type=file]にmutipleがなくてもこのコードになります。
    var reader  = new FileReader();
    reader.addEventListener("load", function () {
      var html = appendimage(reader.result, image_id);
      $('.sell-page__main__container__item__upload__imagebox').prepend(html)
    }, false);
    num += 1

    if (file) {
      reader.readAsDataURL(file);//ここでreaderのメソッドに引数としてfileを入れます。ここで、readerのaddEventListenerが発火します。
    }
    if (number == 10) {
      $('.sell-page__main__container__item__upload__imagebox__dropbox').hide();
    }else{
      $('.sell-page__main__container__item__upload__imagebox__dropbox').show();
    }
  })
  .fail(function() {
    alert('画像の送信に失敗しました');
  })

});
})
$(document).on('turbolinks:load', function(){
$('.sell-page__main__container__item__upload__imagebox').on('click', '.image-remove-btn', function(){
  var number = $('.sell-page__main__container__item__upload__imagebox__appendbox').length;
  number -= 1
  $(this).parent().remove();
  num -= 1
  if (number == 10) {
    $('.sell-page__main__container__item__upload__imagebox__dropbox').hide();
  }else{
    $('.sell-page__main__container__item__upload__imagebox__dropbox').show();
  }
  var id = $(this).parent().attr('data-image-id')
  var id = parseInt(id);
    var idx = images_id.indexOf(id);
    if(idx >= 0){
    images_id.splice(idx, 1); 
    }
  $.ajax({
    type: 'delete',
    url: '/images/' + id,
    dataType: 'json',
  })
  .done(function() {
  })
  .fail(function() {
    alert('画像の削除に失敗しました');
  })

})
})
$(document).on('turbolinks:load', function(){
$('#new_product').on('submit', function(e){
  $('.sell-page__main__container__item__sell-btn-box__sell-btn').prop('disabled', true); 
  e.preventDefault();
  var firstcss = $('#first_shipment_form').css('display');
  var secoundcss = $('#secound_shipment_form').css('display');
    if (firstcss=='none') {
       var shipment_method = $('#secound_selecter').children().val();
    } else if (secoundcss=='none') {
      var shipment_method = $('#first_selecter').children().val();
    }
  var category_id = $('#third_category_id').val();
  var status = $('#product_status').val();
  var obligation_fee = $('#product_obligation_fee').val();
  var prefecture_id = $('#product_prefecture_id').val();
  var deliverytime = $('#product_deliverytime').val();
  var name = $('.sell-page__input').val();
  var description = $('.sell-page-textarea').val();
  var price = $('.input-price').val();
  var number = $('.sell-page__main__container__item__upload__imagebox__appendbox').length;
  if (number == 0) {
    alert('画像を入力してください');
    setTimeout(disabled_false, 500);
  }else{
    
  $.ajax({
    url: '/products',
    type: "POST",
    data: { product: {category_id: category_id, status: status, obligation_fee: obligation_fee, shipment_method: shipment_method, prefecture_id: prefecture_id,
    deliverytime: deliverytime, name: name, description: description, price: price}},
    dataType: 'json',
})
.done(function(data){
  var product_id = data.id
  $.each(images_id, function(index, value) {
    $.ajax({
      type: 'patch',
      url: '/images/'+ value,
      data: {image:{product_id: product_id}},
      dataType: 'json',
    })
})
location.href = '/'
})
.fail(function() {
  alert('商品の送信に失敗しました');
  $('.sell-page__main__container__item__sell-btn-box__sell-btn').prop('disabled', false); 
})
}
})
})
$(document).on('turbolinks:load', function(){
$('#edit_product').on('submit', function(e){
  $('.sell-page__main__container__item__sell-btn-box__sell-btn').prop('disabled', true); 
  e.preventDefault();
  var firstcss = $('#first_shipment_form').css('display');
  var secoundcss = $('#secound_shipment_form').css('display');
    if (firstcss=='none') {
       var shipment_method = $('#secound_selecter').children().val();
    } else if (secoundcss=='none') {
      var shipment_method = $('#first_selecter').children().val();
    }
  var category_id = $('#third_category_id').val();
  var status = $('#product_status').val();
  var obligation_fee = $('#product_obligation_fee').val();
  var prefecture_id = $('#product_prefecture_id').val();
  var deliverytime = $('#product_deliverytime').val();
  var name = $('.sell-page__input').val();
  var description = $('.sell-page-textarea').val();
  var price = $('.input-price').val();
  var edit_id = $('.sell-page__main__container__item__top').attr('data-id')
  var number = $('.sell-page__main__container__item__upload__imagebox__appendbox').length;
  if (number == 0) {
    alert('画像を入力してください');
    setTimeout(disabled_false, 500);
  }else{
  $.ajax({
    url: '/products/' + edit_id,
    type: "patch",
    data: { product: {category_id: category_id, status: status, obligation_fee: obligation_fee, shipment_method: shipment_method, prefecture_id: prefecture_id,
    deliverytime: deliverytime, name: name, description: description, price: price}},
    dataType: 'json',
})
.done(function(data){
  var product_id = data.id
  $.each(images_id, function(index, value) {
    $.ajax({
      type: 'patch',
      url: '/images/'+ value,
      data: {image:{product_id: product_id}},
      dataType: 'json',
    })
})
location.href = '/'
})
.fail(function() {
  alert('商品情報の変更に失敗しました');
  $('.sell-page__main__container__item__sell-btn-box__sell-btn').prop('disabled', false); 
})
  }
})
})
$(document).on('turbolinks:load', function(){
  $('#product_category_id').change(function() {
    $('#secound_category_id').remove();
    $('#third_category_id').remove();
     first_id = $('#product_category_id').val();
     $.ajax({
      type: 'get',
      url: '/categories/search',
      data: {category_id: first_id},
      dataType: 'json',
      async: false
    })
    .done(function(categories) {
      var html = secoundselectbox();
      $("#category_collection_select").append(html)
        categories.forEach(function(category){
          var html = appendcategory(category);
          $('#secound_category_id').append(html)
        });
    })
    .fail(function() {
      alert('カテゴリの送信に失敗しました');
    })
  });


  jQuery(document).on('change', '#secound_category_id', function () {
    
    $('#third_category_id').remove();
    var html = thirdselectbox();
    $("#category_collection_select").append(html);
     secound_id = $('#secound_category_id').val();
     $.ajax({
      type: 'get',
      url: '/categories/search',
      data: {category_id: secound_id},
      dataType: 'json',
      async: false
    })
    
    .done(function(categories) {
        categories.forEach(function(category){
          var html = appendcategory(category);
          $('#third_category_id').append(html)
        });
    })
    .fail(function() {
      alert('カテゴリの送信に失敗しました');
    })
  });
  $('#product_obligation_fee').change(function() {
    var obligation_fee = $('#product_obligation_fee').val();
    if (obligation_fee == 1) {
      $('#secound_shipment_form').hide();
      $('#first_shipment_form').show();
      var css = $('#secound_shipment_form').css('display');
    } else if (obligation_fee == 2) {
      $('#first_shipment_form').hide();
       $('#secound_shipment_form').show();
    } else {
      $('#first_shipment_form').hide();
      $('#secound_shipment_form').hide();
    }
  });

})
});