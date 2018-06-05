Rails.application.routes.draw do
devise_for :users

resources :users

resources :blogs do
	resource :blog_comments, only: [:create, :destroy]
	resource :favorites, only: [:create, :destroy]
end

#resources :blog_images, only: [:new, :create, :index, :show]


get 'blogs/search/:id' => 'blogs#show'
root 'blogs#index'




end
