$(function() {
  $(document).on('turbolinks:load', function(){
    var submit = true;
    Payjp.setPublicKey('pk_test_8882248f2f0cbfab60012c09');
    const btn = document.getElementById('token_submit');
    var path = location.pathname
    if (path.includes('cards')) {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; 
      if (submit) {
        submit = false;
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          document.inputForm.submit();
          alert("登録が完了しました"); 
        } else {
          alert("カード情報が正しくありません。"); 
        }
      });
    } else {
      console.log('false')
    }
    });
  }
  })
$(function(){
  $(document).on('turbolinks:load', function(){
  $("#delete-card").on("click",function(){
    window.confirm('削除しますか?')
  });
})
});
});