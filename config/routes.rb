Rails.application.routes.draw do
  resources :problems
  mount RedactorRails::Engine => '/redactor_rails'
  get 'call_to_action' => 'call_to_action#index', as: :call_to_action

  # Errors Routes
  match '/403', to: 'errors#forbidden', via: :all, as: :forbidden
  match '/404', to: 'errors#file_not_found', via: :all, as: :file_not_found
  match '/422', to: 'errors#unprocessable', via: :all, as: :unprocessable
  match '/500', to: 'errors#internal_server_error', via: :all, as: :internal_server_error

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
    resources :supporters
    resources :campaigns
    resources :teammates
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

  # Non-Nested objects
  resources :teammates
  resources :people, except: [:delete, :update]

  # StartUps raising routes
  scope 'showroom' do
    get '' => 'showroom#index', as: :showroom_index
    get 'pitches' => 'showroom#pitches', as: :showroom_pitches
    get 'startups' => 'showroom#startups', as: :showroom_startups
  end

  # Dashboard Tracking URLs
  scope 'dashboard' do
    get '' => 'dashboard#index', as: :dashboard_index
    get 'start_ups' => 'dashboard#start_ups', as: :dashboard_start_ups
    get 'investments' => 'dashboard#investments', as: :dashboard_investments
  end

  # Ajax Routes
  get 'idiom_flags' => 'locale#idiom_flags', as: :idiom_flags
  get 'people/search(/:partial_name)' => 'people#search', as: :person_search

  # Admin Routes
  namespace :admin do
    constraints subdomain: 'admin' do
      get '/' => 'dashboard#admin', as: :admin_dashboard
    end
  end

  # Signed User Routes
  authenticated :user do
    root to: 'call_to_action#index', as: :authenticated_root
  end

  # RootRoute main LandingPage
  root to: 'home#index'

  get "/:permalink" => "showroom#show", as: :showroom_campaign
end