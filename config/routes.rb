Rails.application.routes.draw do
  devise_for :users, skip: :all, controllers: {
    registrations: 'users/registrations'
  }
 
  devise_scope :user do
    # とりあえずregistrationのみ
    get    'signup',              to: 'users/registrations#index'
    get    'signup/registration', to: 'users/registrations#new', as: :new_user_registration
    post   'signup/registration', to: 'users/registrations#create', as: :user_registration
    put    'users',               to: 'users/registrations#update'
    patch  'users',               to: 'users/registrations#update'
    delete 'users',               to: 'users/registrations#destroy'
  end

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
