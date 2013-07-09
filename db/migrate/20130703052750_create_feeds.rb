class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :host
      t.string :feed_url
      t.string :etag
      t.timestamp :last_modified

      t.timestamps
    end
  end
end
