$(function() {
  $('.registar1-main__content__form__next').on('click',function(){  
    $('.telephone-num').removeClass('hidden'); 
    $('.telephone-num').addClass('active');
    $('.registar1-frame ').removeClass('active');
  });
  $('.telephone-num__field__next').on('click',function(){
    $('.registar3-frame').removeClass('hidden');
    $('.registar3-frame').addClass('active');
    $('.telephone-num').removeClass('active');
    $('.telephone-num').addClass('hidden');
  });
  $('.registar3-main__content__form__next').on('click',function(){
    $('.registar4-frame').removeClass('hidden');
    $('.registar4-frame').addClass('active');
    $('.registar3-frame').removeClass('active');
    $('.registar3-frame').addClass('hidden');
  });
  $('.registar4-main__content__form__next').on('click',function(){
    $('.signup-completion').addClass('remove');
    $('.signup-completion').addClass('active');
    $('.registar4-frame').removeClass('active');
    $('.registar4-frame').addClass('hidden');
  });
}); 