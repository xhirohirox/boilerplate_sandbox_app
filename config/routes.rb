Rails.application.routes.draw do
  devise_for :company_users, controllers: {
    sessions: 'company_users/sessions'
  }

  devise_scope :company_users do
    get 'sign_in', to: 'company_users/sessions#new'
    get 'sign_up', to: 'company_users/registrations#new'
    get 'forgot_password', to: 'company_users/passwords#new'
    get 'reset_password', to: 'company_users/passwords#edit'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :company_users do
    resources :recruitments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
