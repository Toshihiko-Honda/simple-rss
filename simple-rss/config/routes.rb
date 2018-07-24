Rails.application.routes.draw do

	resources :articles, only: [:index, :create]

	resources :news_sites, except: [:show, :edit]

	root 'articles#index'

end
