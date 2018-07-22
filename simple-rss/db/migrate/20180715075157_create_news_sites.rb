class CreateNewsSites < ActiveRecord::Migration[5.2]
  def change
    create_table :news_sites do |t|
      t.string :url
      t.string :title
      
      t.timestamps
    end
  end
end
