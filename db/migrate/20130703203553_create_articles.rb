class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :feed
      t.string :name
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid

      t.timestamps
    end
    add_index :articles, :feed_id
  end
end
