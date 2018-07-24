class ArticlesController < ApplicationController
	def index
		@articles = Article.all.order('published_at DESC')
	end

	def show
	  @article = Article.find(params[:id])
	end

	def create
		@news_sites = NewsSite.all
		Articles::RenewArticles.call(@news_sites)
		flash[:is_renewed] = true
		redirect_to action: 'index'
	end
end
