Rails.application.routes.draw do
  # Errors
  match '/422', to: 'errors#unprocessable', via: :all
  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Global "Home"/"LandingPages"
  get '/landing2' => 'home#landing2'
  get '/partners' => 'home#partners'
  get '/startupers' => 'home#startupers'

  # DeviseUser sessions
  devise_for :users,
             controllers: {
                 sessions:            'users/sessions',
                 passwords:           'users/passwords',
                 registrations:       'users/registrations',
                 omniauth_callbacks:  'users/omniauth_callbacks'
             }

  # Global Resources
  resources :pitches do
    # Nested Objects
    resources :ideas
    resources :businesses
    resources :projects
    resources :markets
    resources :tractions
    resources :revenues
    resources :financial
    resources :competitors
    resources :teams
    resources :investments
  end

  # StartUp - Nested Objects
  resources :start_ups do
    resources :ideas
    resources :businesses
    resources :projects
    resources :markets
    resources :tractions
    resources :revenues
    resources :financial
    resources :competitors
    resources :teams
    resources :investments
  end

  # Non-Nested objects
  resources :teammates

  # Custom URLs (non-resources)
  scope 'showroom' do
    get '' => 'showroom#index', as: :showroom_index
  end

  scope 'dashboard' do
    get '' => 'dashboard#index', as: :dashboard_index
    get 'start_ups' => 'dashboard#start_ups', as: :dashboard_start_ups
    get 'investments' => 'dashboard#investments', as: :dashboard_investments
  end


  # Admin Routes
  namespace :admin do
    constraints subdomain: 'admin' do
      get '/' => 'dashboard#admin', as: :admin_dashboard
    end
  end

  # Signed User Routes
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end

  # RootRoute main LandingPage
  root to: 'home#index'
end