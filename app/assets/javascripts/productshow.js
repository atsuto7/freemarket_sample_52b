$(function() {
  $(document).on('turbolinks:load', function(){
    $(".products-information__item__image__selector__photo:first").css('opacity', 1); 
    var slideWidth = $('.products-information__item__image__slideset__slide').outerWidth();
    var slideNum = $('.products-information__item__image__slideset__slide').length;  
    var slideSetWidth = slideWidth * slideNum; 
    $('.products-information__item__image__slideset').css('width', slideSetWidth); 
    $('.products-information__item__image__selector__photo').on('mouseover', function(){
      var index = $('.products-information__item__image__selector__photo').index(this);
      timeout = setTimeout($.proxy(function(){                   //thisを取得すべく$.proxyを実装している
      $('.products-information__item__image__selector__photo').css('opacity', 0.4); 
      $(this).css('opacity', 1); 
      $('.products-information__item__image__slideset').animate({
        left: -slideWidth * index
      });
    }, this),300);
    $('.products-information__item__image__selector__photo').on('mouseout', function(setTimeout){
      clearTimeout(timeout);
    })
    });
  })
})

