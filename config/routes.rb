Rails.application.routes.draw do
  resources :teammates
  resources :teams
  resources :investments
  resources :competitors
  resources :financials
  resources :revenues
  resources :projects
  resources :markets
  resources :tractions
  resources :businesses
  resources :start_ups
  resources :ideas
  resources :pitches
  get 'dashboard/index'

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