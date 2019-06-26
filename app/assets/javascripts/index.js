$(function() {
   function addfirstct(category) {
     var html = `<div class="categories__name" data-id="${category.id}">
     <p>${category.name}</p>
     </div>`
     return html
   }
   function addsecoundct(category) {
    var html = `<div class="categories__name" data-id="${category.id}">
    <p>${category.name}</p>
    </div>`
    return html
  }
  function addthirdct(category) {
    var html = `<div class="categories__name" data-id="${category.id}">
    <p>${category.name}</p>
    </div>`
    return html
  }
  $(document).on('turbolinks:load', function(){
    $('.header__container__bottom__nav__categories').hover(function(){
      var first_category = $('.header__container__bottom__nav__categories__box__first').children().length;
      console.log(first_category)
      if (first_category == 0) {
      $.ajax({
        type: 'get',
        url: '/categories/search',
        data: {category_id: 0},
        dataType: 'json',
        async: false
      })
      .done(function(categories) {
          var categories = categories.filter(function (x, i, self) {
            return self.indexOf(x) === i;
        });
        $('.header__container__bottom__nav__categories__box__first').show();
          categories.forEach(function(category){
            var html = addfirstct(category);
            $('.header__container__bottom__nav__categories__box__first').append(html)

          });
      })
      .fail(function() {
        alert('カテゴリの取得に失敗しました');
      })
    }
    }, function() {
      $('.header__container__bottom__nav__categories__box__first').hide();
      $('.header__container__bottom__nav__categories__box__first').empty();
      $('.header__container__bottom__nav__categories__box__secound').empty();
      $('.header__container__bottom__nav__categories__box__secound').hide();
      $('.categories__name').remove();
    }
  );
  $('.header__container__bottom__nav__categories__box__first').on('mouseover', '.categories__name', function(){
    $('.header__container__bottom__nav__categories__box__third').empty();
    $('.header__container__bottom__nav__categories__box__third').hide();
    $('.categories__name').css('background-color', '#fff');
    $('.categories__name').css('color', '#333333');
    $(this).css('background-color', '#ea352d');
    $(this).css('color', '#fff');  
    var category_id = $(this).attr('data-id')
    $.ajax({
      type: 'get',
      url: '/categories/search',
      data: {category_id: category_id},
      dataType: 'json',
      async: false
    })
    .done(function(categories) {
        var categories = categories.filter(function (x, i, self) {
          return self.indexOf(x) === i;
      });
      $('.header__container__bottom__nav__categories__box__secound').show();
      $('.header__container__bottom__nav__categories__box__secound').empty();
        categories.forEach(function(category){
          var html = addsecoundct(category);
          $('.header__container__bottom__nav__categories__box__secound').append(html)

        });
    })
    .fail(function() {
      alert('カテゴリの取得に失敗しました');
    })

    $('.header__container__bottom__nav__categories__box__first').on('mouseout', '.categories__name', function(){     
    });
  });
  $('.header__container__bottom__nav__categories__box__secound').on('mouseover', '.categories__name', function(){
    console.log('ttt')
    $('.header__container__bottom__nav__categories__box__secound').children().css('background-color', '#fff');
    $('.header__container__bottom__nav__categories__box__secound').children().css('color', '#333333');
    $(this).css('background-color', '#f5f5f5'); 
    var category_id = $(this).attr('data-id')
    $.ajax({
      type: 'get',
      url: '/categories/search',
      data: {category_id: category_id},
      dataType: 'json',
      async: false
    })
    .done(function(categories) {
        var categories = categories.filter(function (x, i, self) {
          return self.indexOf(x) === i;
      });
      $('.header__container__bottom__nav__categories__box__third').show();
      $('.header__container__bottom__nav__categories__box__third').empty();
        categories.forEach(function(category){
          var html = addthirdct(category);
          $('.header__container__bottom__nav__categories__box__third').append(html)

        });
    })
    .fail(function() {
      alert('カテゴリの取得に失敗しました');
    })
    $('.header__container__bottom__nav__categories__box__secound').on('mouseout', '.categories__name', function(){ 

    });
  });
  $('.header__container__bottom__nav__categories__box__third').on('mouseover', '.categories__name', function(){
    $('.header__container__bottom__nav__categories__box__third').children().css('background-color', '#fff');
    $('.header__container__bottom__nav__categories__box__third').children().css('color', '#333333');
    $(this).css('background-color', '#f5f5f5'); 
  });
  $('.header__container__bottom__nav__categories__box__first').on('click', '.categories__name', function(){
    var id = $(this).attr('data-id')
    console.log('firstt')
    location.href = '/categories/' + id
  });
  $('.header__container__bottom__nav__categories__box__secound').on('click', '.categories__name', function(){
    console.log('secound')
    var id = $(this).attr('data-id')
    location.href = '/categories/' + id
  });
  $('.header__container__bottom__nav__categories__box__third').on('click', '.categories__name', function(){
    var id = $(this).attr('data-id')
    location.href = '/categories/' + id
  });
  })
})