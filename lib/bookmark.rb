require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      object = PG.connect(dbname: 'bookmark_manager_test')
    else
      object = PG.connect(dbname: 'bookmark_manager')
    end
    result = object.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| Bookmark.new(id: bookmark['id'], url: bookmark['url'], title:['title']) }
    
  end

  def self.create(website, title)
    if ENV['ENVIRONMENT'] == 'test'
      object = PG.connect(dbname: 'bookmark_manager_test')
    else
      object = PG.connect(dbname: 'bookmark_manager')
    end
    result = object.exec("INSERT INTO bookmarks (url, title) VALUES ('#{website}', '#{title}') RETURNING id, url, title")
  end
  
end