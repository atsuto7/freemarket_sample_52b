Rails.application.routes.draw do

  root 'templates#index'
  get '/templates/show' => 'templates#show'
  get '/templates/purchaseconfirmation' => 'templates#purchaseconfirmation'
  get '/templates/login' => 'templates#login'
  get '/templates/mypage' => 'templates#mypage'
  get '/templates/productsinformation' => 'templates#productsinformation'
  get '/templates/view3mypagehome' => 'templates#view3mypagehome'
  get '/templates/view3profile' => 'templates#view3profile'
  get '/templates/views3identification' => 'templates#views3identification'
  get '/templates/views3logout' => 'templates#views3logout'
  get '/templates/views3payment' => 'templates#views3payment'
  get '/templates/sellpage' => 'templates#sellpage'
  resources :products do
  end
end
