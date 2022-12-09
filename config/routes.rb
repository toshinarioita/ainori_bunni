Rails.application.routes.draw do
  
  
  root 'tops#link'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tops/link' => 'tops#link'
  
  get 'recruitments' => 'recruitments#index'
  get 'recruitments/new' => 'recruitments#new'
  post 'recruitments' => 'recruitments#create'
  get 'recruitments/:id' => 'recruitments#show',as: 'recruitment'
  post 'recruitments/:id' => 'recruitments#join',as: 'recruitment_join'
  delete 'recruitments/:id/leave' => 'recruitments#leave',as: 'recruitment_leave'
  delete 'recruitments/:id' => 'recruitments#destroy'
  resources :recruitments do

    resources :chat_messages, only: [:index, :create, :destroy]
    
  end
  

    
  
  resources :users, only: [:show]

  
end
