require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
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
    result.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      object = PG.connect(dbname: 'bookmark_manager_test')
    else
      object = PG.connect(dbname: 'bookmark_manager')
    end
    result = object.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(title:)
    if ENV['ENVIRONMENT'] == 'test'
      object = PG.connect(dbname: 'bookmark_manager_test')
    else
      object = PG.connect(dbname: 'bookmark_manager')
    end
    object.exec("DELETE FROM bookmakrs WHERE title=#{title};")
  end
  
end