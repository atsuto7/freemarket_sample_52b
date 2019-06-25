Rails.application.routes.draw do
  devise_for :users, skip: :all, 
    controllers: { 
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations'
    }

  devise_scope :user do
    # registration用
    get    'signup',              to: 'users/registrations#index'
    get    'signup/registration', to: 'users/registrations#new',    as: :new_user_registration
    post   'signup/registration', to: 'users/registrations#create', as: :user_registration
    put    'users',               to: 'users/registrations#update'
    patch  'users',               to: 'users/registrations#update'
    # session用
    get    'login',               to: 'users/sessions#new',         as: :new_user_session
    post   'login',               to: 'users/sessions#create',      as: :user_session
    get    'logout',              to: 'users/sessions#destroy',     as: :destroy_user_registration
    # omniauth_callback用
    match  'signup/facebook/auth',     to: 'users/omniauth_callbacks#passthru',          via: [:get, :post], as: :user_facebook_omniauth_authorize
    match  'signup/facebook/callback', to: 'users/omniauth_callbacks#facebook_callback', via: [:get, :post], as: :user_facebook_omniauth_callback
    get    'signup/facebook',          to: 'users/omniauth_callbacks#facebook',                              as: :new_user_facebook_omniauth_registration
    post   'signup/facebook',          to: 'users/omniauth_callbacks#create',                                as: :create_user_facebook_omniauth_registration
    match  'signup/google/auth',       to: 'users/omniauth_callbacks#passthru',          via: [:get, :post], as: :user_google_oauth2_omniauth_authorize
    match  'signup/google/callback',   to: 'users/omniauth_callbacks#google_oauth2_callback',   via: [:get, :post], as: :user_google_omniauth_callback
    get    'signup/google',            to: 'users/omniauth_callbacks#google',                                as: :new_user_google_omniauth_registration
    post   'signup/google',            to: 'users/omniauth_callbacks#create',                                as: :create_user_google_omniauth_registration
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
  resources :purchases do
  end
end
