$(function() {
  function orgFloor(value, base) {
    return Math.floor(value * base) / base;
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
  $(window).load(function () {
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
});