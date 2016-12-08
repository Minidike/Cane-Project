Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "facts#index"
  resources :facts do
    resources :comments
    member do
      put "like", to: "facts#upvote"
    end
  end
end
