namespace :feed_articles do
  
  desc "TODO"
    task :count => :environment do
      puts Feed.all.count
    end
  
  desc "TODO"
    task :list => :environment do
      all_feeds = Feed.all
      all_feeds.each do |feed|
        parsed_feed = Feedzirra::Feed.fetch_and_parse(feed.feed_url)
        updated_feed = Feedzirra::Feed.update(parsed_feed)
        puts "=========================="
        puts Time.now.to_s + " has " + updated_feed.new_entries.count.to_s + " entries"
        updated_feed.new_entries.each do |entry|
          Article.create!(
            :name         => entry.title,
            :summary      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :feed_id      => feed.id
          )
          puts " (  " + feed.id.to_s + " : " + feed.host.to_s + " )  " + entry.title.to_s     
        end
      end
    end
end