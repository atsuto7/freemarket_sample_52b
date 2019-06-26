$(document).on('turbolinks:load', function(){
  $(function() {
    
    $('.registar1-main__content__form__next').on('click',function(){  
      var nickname = $('#user_nickname').val();
      var email = $('#user_email').val();
      var password = $('#user_password').val();
      var password_confirmation = $('#user_password_confirmation').val();

      if(nickname == ""){
        $('p.nickname_error').removeClass('hidden'); 
        $('p.nickname_error').addClass('active');
      }

      if(email == ""){
        $('p.email_error').removeClass('hidden'); 
        $('p.email_error').addClass('active');
      }

      if(password == ""){
        $('p.password_error').removeClass('hidden'); 
        $('p.password_error').addClass('active');
      }else if(password.match('[!-~]{6,}')){
      }else{
        $('p.too_short_password_error').removeClass('hidden'); 
        $('p.too_short_password_error').addClass('active');
      }

      if (password_confirmation == ""){
        $('p.confirmation_error').removeClass('hidden'); 
        $('p.confirmation_error').addClass('active');
      }

      if(nickname != "" &&
         email != "" &&
         password != "" &&
         password_confirmation != ""){
        $('.telephone-num').removeClass('hidden'); 
        $('.telephone-num').addClass('active');
        $('.registar1-frame').removeClass('active');
        $('.registar-header1').removeClass('active');
        $('.registar-header1').addClass('hidden');
        $('.registar-header2').addClass('active');
      }
    });

    $('.telephone-num__field__next').on('click',function(){
      var phone_number = $('#user_phone_number').val();

      if(phone_number == ""){
        $('p.phone_number_error').removeClass('hidden'); 
        $('p.phone_number_error').addClass('active');
      }else {
        $('.registar3-frame').removeClass('hidden');
        $('.registar3-frame').addClass('active');
        $('.telephone-num').removeClass('active');
        $('.telephone-num').addClass('hidden');
        $('.registar-header2').removeClass('active');
        $('.registar-header2').addClass('hidden');
        $('.registar-header-address').addClass('active');
      }
    });

    $('.registar3-main__content__form__next').on('click',function(){
      var kanji_surname = $('#user_kanji_surname').val();
      var kanji_name = $('#user_kanji_name').val();
      var kana_surname = $('#user_kana_surname').val();
      var kana_name = $('#user_kana_name').val();
      var postal_code = $('#user_address_attributes_postal_code').val();
      var prefecture_id = $('#user_address_attributes_prefecture_id').val();
      var city = $('#user_address_attributes_city').val();
      var street_number = $('#user_address_attributes_street_number').val();

      if(kanji_surname == ""){
        $('p.kanji_surname_error').removeClass('hidden'); 
        $('p.kanji_surname_error').addClass('active');
      }

      if(kanji_name == ""){
        $('p.kanji_name_error').removeClass('hidden'); 
        $('p.kanji_name_error').addClass('active');
      }

      if(kana_surname == ""){
        $('p.kana_surname_error').removeClass('hidden'); 
        $('p.kana_surname_error').addClass('active');
      }else if(kana_surname.match(/^[\u30a0-\u30ff]+$/)){
      }else{
        $('p.not_kana_surname_error').removeClass('hidden'); 
        $('p.not_kana_surname_error').addClass('active');
      }

      if(kana_name == ""){
        $('p.kana_name_error').removeClass('hidden'); 
        $('p.kana_name_error').addClass('active');
      }else if(kana_name.match(/^[\u30a0-\u30ff]+$/)){
      }else{
        $('p.not_kana_name_error').removeClass('hidden'); 
        $('p.not_kana_name_error').addClass('active');
      }

      if(postal_code == ""){
        $('p.postal_code_error').removeClass('hidden'); 
        $('p.postal_code_error').addClass('active');
      }

      if(prefecture_id == 0){
        $('p.prefecture_id_error').removeClass('hidden'); 
        $('p.prefecture_id_error').addClass('active');
      }

      if(city == ""){
        $('p.city_error').removeClass('hidden'); 
        $('p.city_error').addClass('active');
      }

      if(street_number == ""){
        $('p.street_number_error').removeClass('hidden'); 
        $('p.street_number_error').addClass('active');
      }else if(street_number.match(/^[\u3040-\u30ff]+$/)){
      }else{
        $('p.full-width_street_number_error').removeClass('hidden'); 
        $('p.full-width_street_number_error').addClass('active');
      }

      if(
        kanji_surname != "" &&
        kanji_name != "" &&
        kana_surname != "" &&
        kana_surname.match(/^[\u30a0-\u30ff]+$/) &&
        kana_name != "" &&
        kana_name.match(/^[\u30a0-\u30ff]+$/) &&
        postal_code != "" &&
        prefecture_id != 0 &&
        city != "" &&
        street_number != "" &&
        street_number.match(/^[\u3040-\u30ff]+$/)){
        $('.registar4-frame').removeClass('hidden');
        $('.registar4-frame').addClass('active');
        $('.registar3-frame').removeClass('active');
        $('.registar3-frame').addClass('hidden');
        $('.registar-header-address').removeClass('active');
        $('.registar-header-address').addClass('hidden');
        $('.registar-header-pay').addClass('active');
      }
    }); 
  });
})