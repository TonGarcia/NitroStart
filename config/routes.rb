Rails.application.routes.draw do
  # Errors
  match '/422', to: 'errors#unprocessable', via: :all
  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Global "Home"/"LandingPages"
  get '/landing2' => 'home#landing2'
  get '/partners' => 'home#partners'

  # DeviseUser sessions
  devise_for :users,
             controllers: {
                 sessions:            'users/sessions',
                 passwords:           'users/passwords',
                 registrations:       'users/registrations',
                 omniauth_callbacks:  'users/omniauth_callbacks'
             }

  # Global Resources
  resources :ideas
  resources :teams
  resources :pitches
  resources :markets
  resources :traction
  resources :revenues
  resources :projects
  resources :financial
  resources :start_ups
  resources :teammates
  resources :businesses
  resources :investments
  resources :competitors

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