Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get '/products/show' => 'products#show'
  get '/products/purchaseconfirmation' => 'products#purchaseconfirmation'
  get '/products/login' => 'products#login'
  get '/products/mypage' => 'products#mypage'
  get '/products/productsinformation' => 'products#productsinformation'
  get '/products/topuserregistar' => 'products#topuserregistar'
  get '/products/userregistar1' => 'products#userregistar1'
  get '/products/view3mypagehome' => 'products#view3mypagehome'
  get '/products/view3profile' => 'products#view3profile'
  get '/products/views3identification' => 'products#views3identification'
  get '/products/views3logout' => 'products#views3logout'
  get '/products/views3payment' => 'products#views3payment'
end
