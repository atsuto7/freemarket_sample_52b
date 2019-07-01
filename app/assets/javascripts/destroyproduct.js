$(function() {
  $(document).on('turbolinks:load', function(){
$('.products-information__checkout-btn__delete').click(function(){
  if(!confirm('本当に削除しますか？')){
      /* キャンセルの時の処理 */
      return false;
  }else{
      /*OKの時の処理 */
      location.href = '/';
  }
});
  })
})