Rails.application.routes.draw do
  # Errors Routes
  match '/403', to: 'errors#forbidden', via: :all, as: :forbidden
  match '/404', to: 'errors#file_not_found', via: :all, as: :file_not_found
  match '/422', to: 'errors#unprocessable', via: :all, as: :unprocessable
  match '/500', to: 'errors#internal_server_error', via: :all, as: :internal_server_error

  # Global "Home"/"LandingPages"
  get '/landing2' => 'home#landing2', as: :investors
  get '/partners' => 'home#partners', as: :partners
  get '/startupers' => 'home#startupers', as: :startupers

  # DeviseUser sessions
  devise_for :users,
             controllers: {
                 sessions:            'users/sessions',
                 passwords:           'users/passwords',
                 registrations:       'users/registrations',
                 confirmations:       'users/confirmations',
                 omniauth_callbacks:  'users/omniauth_callbacks'
             }

  # Global Resources
  resources :pitches do
    # Nested Objects
    resource :team
    resources :ideas
    resources :businesses
    resources :projects
    resources :markets
    resources :tractions
    resources :revenues
    resources :financials
    resources :competitors
    resources :teammates
    resources :providers
    resources :investments
    resources :supporters
    resources :campaigns
  end

  # StartUp - Nested Objects
  resources :start_ups do
    resources :ideas
    resources :businesses
    resources :projects
    resources :markets
    resources :tractions
    resources :revenues
    resources :financials
    resources :competitors
      resources :providers
    resources :investments
  end

  # Pitch supporters caption routes
  # resources :campaign do
  #
  # end

  # Non-Nested objects
  resources :teammates

  # StartUps raising routes
  scope 'showroom' do
    get '' => 'showroom#index', as: :showroom_index
  end

  # Dashboard Tracking URLs
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