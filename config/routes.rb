Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :products do
    resources :reviews
  end
  get 'home/index'
end


# Some setup you must do manually if you haven't yet:

#   Ensure you have overridden routes for generated controllers in your routes.rb.
#   For example:

#     Rails.application.routes.draw do
#       devise_for :users, controllers: {
#         sessions: 'users/sessions'
#       }
#     end