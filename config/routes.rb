Rails.application.routes.draw do
  devise_for :users, skip: :all, 
    controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    # registration用
    get    'signup',              to: 'devise/registrations#index'
    get    'signup/registration', to: 'devise/registrations#new',    as: :new_user_registration
    post   'signup/registration', to: 'devise/registrations#create', as: :user_registration
    put    'users',               to: 'devise/registrations#update'
    patch  'users',               to: 'devise/registrations#update'
    # session用
    get    'login',               to: 'devise/sessions#new',         as: :new_user_session
    post   'login',               to: 'devise/sessions#create',      as: :user_session
    get    'logout',              to: 'devise/sessions#destroy',     as: :destroy_user_registration
  end

  root 'products#index'
  get '/products/show' => 'products#show'
  get '/templates/purchaseconfirmation' => 'templates#purchaseconfirmation'
  get '/templates/mypage' => 'templates#mypage'
  get '/templates/productsinformation' => 'templates#productsinformation'
  get '/templates/view3mypagehome' => 'templates#view3mypagehome'
  get '/templates/view3profile' => 'templates#view3profile'
  get '/templates/views3identification' => 'templates#views3identification'
  get '/templates/views3payment' => 'templates#views3payment'
  get '/templates/sellpage' => 'templates#sellpage'
  resources :products do
  end
  resources :images do
  end
end
