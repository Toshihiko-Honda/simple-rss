class ArticlesController < ApplicationController
  # Rails.logger.debug('#######################################')
  # Rails.logger.debug(article.inspect)
  # Rails.logger.debug('#######################################')
	def index
		@articles = Article.all.order('published_at DESC')
	end

	def show
	  @article = Article.find(params[:id])
	end

	def renew
		@news_sites = NewsSite.all
		Articles::RenewArticles.call(@news_sites)
	end
end
