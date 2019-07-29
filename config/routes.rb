Rails.application.routes.draw do
  
  resources :products do
  	collection { post :import } 
  end

  resources :suppliers do
  	collection { get :active_product}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'suppliers#index'
end
