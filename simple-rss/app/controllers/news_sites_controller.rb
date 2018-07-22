class NewsSitesController < ApplicationController

	def index
		@news_sites = NewsSite.all
	end

	def new
		@news_site = NewsSite.new
	end

	def create
	  @news_site = NewsSite.new(news_site_params)
	 
	  if @news_site.save
		  redirect_to news_sites_path
		else
			render 'new'
		end
	end

	def destroy
		@news_site = NewsSite.find(params[:id])
	  @news_site.destroy
	 
	  redirect_to news_sites_path
	end

	private
	  def news_site_params
	    params.require(:news_site).permit(:url, :title)
	  end

end
