Rails.application.routes.draw do
  get '/top' => 'homes#top'
  get 'lists/new'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  get 'lists/edit'
  get 'lists/:id' => 'lists#show', as: 'list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end