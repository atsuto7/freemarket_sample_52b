Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all, controllers: {
    registrations: 'users/registrations'
  }

  devise_for :user do
    # とりあえずregistrationのみ
    get    'signup/registration', to: 'devise/registrations#new'
    post   'signup/registration', to: 'devise/registrations#create'
    put    'users',               to: 'devise/registrations#update'
    patch  'users',               to: 'devise/registrations#update'
    delete 'users',               to: 'devise/registrations#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
