Rails.application.routes.draw do

	resources :articles, only: [:index, :show] do
		collection do
			post 'renew'
		end
	end

	resources :news_sites, except: [:show, :edit]

	root 'articles#index'

end
