class NewsSite < ApplicationRecord
	has_many :articles, dependent: :destroy

	validates :title, 
		presence: true

	validates :url,
		presence: true
end
