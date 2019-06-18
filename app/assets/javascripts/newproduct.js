$(function() {
  function orgFloor(value, base) {
    return Math.floor(value * base) / base;
}
  function appendimage(src) {
    var html = `<div class="sell-page__main__container__item__upload__imagebox__appendbox">
    <img  src="${src}" class="sell-page__main__container__item__upload__imagebox__appendbox__imagephoto">
    <a href="#"><h1>削除</h1></a>
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
   var num = 0
   $(document).on('turbolinks:load', function(){
   $('.sell-page__main__container__item__upload__dropbox__file').change(function() {
    console.log('tttt')
    var file    = document.querySelector('input[type=file]').files[0];//'input[type=file]'で投稿されたファイル要素の0番目を参照します。input[type=file]にmutipleがなくてもこのコードになります。
    console.log(file)
    var reader  = new FileReader();
    reader.addEventListener("load", function () {
      var html = appendimage(reader.result);
      $('.sell-page__main__container__item__upload__imagebox').prepend(html)
      console.log(file.name)
      
    }, false);
    num += 1
    console.log(num)
    if (file) {
      reader.readAsDataURL(file);//ここでreaderのメソッドに引数としてfileを入れます。ここで、readerのaddEventListenerが発火します。

    }
    if (num == 10) {
      $('.sell-page__main__container__item__upload__imagebox__dropbox').hide();
      console.log('ttt');
    }else{
      $('.sell-page__main__container__item__upload__imagebox__dropbox').show();
    }
  });
})
$(document).on('turbolinks:load', function(){
  　$('.input-price').on("keyup", function(){
    var input = $('.input-price').val();
    if (300 <= input && input <= 9999999) {
      compounding_fee = input/10
      compounding_fee = orgFloor(compounding_fee, 1)
      profit = input - compounding_fee
      console.log(profit);
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
});