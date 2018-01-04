Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :articles do
    resources :comments
   
  end
  resources :users
  get "login"=>"users#login"
  post "register"=>"users#register"
  delete 'logout'=>'users#logout'
  post "upload"=>"welcome#upload"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
