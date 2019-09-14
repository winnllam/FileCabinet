Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :docs #create all routes we're going to add to application
  
  authenticated :user do #for already logged in user
    root "docs#index", as: "authenticated_root" #go to authenticated_root
  end

  root 'welcome#index' #make it the root page (won't use /welceom/index) for people who have not logged in

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
