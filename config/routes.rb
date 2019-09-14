Rails.application.routes.draw do
  get 'welcome/index'
  
  root 'welcome#index' #make it the root page (won't use /welceom/index)
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
