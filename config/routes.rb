Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'templates#index'
  get '/templates/show' => 'templates#show'
  get '/templates/purchaseconfirmation' => 'templates#purchaseconfirmation'
  get '/templates/login' => 'templates#login'
  get '/templates/mypage' => 'templates#mypage'
  get '/templates/productsinformation' => 'templates#productsinformation'
  get '/templates/topuserregistar' => 'templates#topuserregistar'
  get '/templates/userregistar1' => 'templates#userregistar1'
  get '/templates/userregistar2' => 'templates#userregistar2'
  get '/templates/userregistar3' => 'templates#userregistar3'
  get '/templates/userregistar4' => 'templates#userregistar4'
  get '/templates/userregistar5' => 'templates#userregistar5'
  get '/templates/view3mypagehome' => 'templates#view3mypagehome'
  get '/templates/view3profile' => 'templates#view3profile'
  get '/templates/views3identification' => 'templates#views3identification'
  get '/templates/views3logout' => 'templates#views3logout'
  get '/templates/views3payment' => 'templates#views3payment'
  get '/templates/sellpage' => 'templates#sellpage'
  resources :products do
  end
end
