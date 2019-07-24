Rails.application.routes.draw do
  get 'tweet/:tags', to: 'tweets#find_by_tag'
  resources :tweets do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :likes
  end
end
