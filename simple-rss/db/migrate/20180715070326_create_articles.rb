class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
    	t.string :title
      t.text :description
      t.text :content_url
      t.string :category
      t.datetime :published_at

			t.references :news_site, index: true

      t.timestamps
    end
  end
end
