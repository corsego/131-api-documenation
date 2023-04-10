Rails.application.routes.draw do
  root 'static_pages#landing_page'
  get 'dashboard', to: 'static_pages#dashboard'
end
