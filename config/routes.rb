Rails.application.routes.draw do
  get 'books/new'
  get '/books' => 'books#index'
  get 'books/show'
  get 'books/edit'
  
  root to: 'homes#top'
  get '/top' => 'homes#top'
  get 'books/:id' => 'books#show', as: 'name'
  get 'books/:id/edit' => 'books#edit', as: 'edit_list'
  patch 'books/:id' => 'books#update', as: 'update_list'
  delete 'books/:id'=> 'books#destroy',as:'destroy_book'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
