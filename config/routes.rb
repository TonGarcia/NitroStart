Rails.application.routes.draw do
  # Errors
  match '/422', to: 'errors#unprocessable', via: :all
  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

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
    end
  end

  # RootRoute main LandingPage
  root to: 'home#index'
end