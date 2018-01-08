Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :users 
  resources :articles do
    resources :comments
  end

  
  post "log"=>"users#login"
  get "log"=>"users#login"
  get "login"=>"users#login"
  delete 'logout'=>'users#logout'
  post "upload"=>"welcome#upload"
  delete 'delete_user'=>"users#delete_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
