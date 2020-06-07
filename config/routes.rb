Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles #do
    #resources :commentts
  #end
  get 'solution2s/:id/edit', to: 'solution2s#edit', as: :edit_solution
  patch 'solution2s/:id', to: 'solution2s#update'
  resources :events
  resources :problem2s
  resources :solution2s
  root 'welcome#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
