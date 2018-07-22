require 'net/http'
require 'uri'
require 'json'
require 'feedjira'

class Articles::RenewArticles
	private_class_method 	:new

	def self.call(news_sites)
		new(news_sites).send(:call)
	end

  def initialize(news_sites)
    @news_sites = news_sites
  end

  def call()
    @news_sites.each do |news_site|
      @articles = request_articles(news_site.url)
      save_articles(news_site, @articles)
    end
  end

  private
  	def request_articles(uri)
      @articles = []
      rss = Feedjira::Feed.fetch_and_parse(uri)
      rss.entries.each do |item|
        @articles += [:title => item.title,
                      :url => item.url,
                      :summary => item.summary,
                      :published => item.published.to_time.strftime("%Y-%m-%d %H:%M:%S")]
      end
      return @articles
  	end

  	def save_articles(news_site, articles)
      latest_published = Article.where("news_site_id = ?", news_site.id).maximum(:published_at) || DateTime.new(1900, 1, 1)
      articles.each do |article|
        if article[:published] > latest_published
          news_site.articles.create(
            title: article[:title],
            description: article[:summary],
            content_url: article[:url],
            published_at: article[:published],
          )
        end
      end
  	end
end
