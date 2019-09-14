Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index' #make it the root page (won't use /welceom/index)

  resources :docs #create all routes we're going to add to application
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
