require 'pg'

class Bookmark

  def self.all
    object = PG.connect(dbname: 'bookmark_manager')
    result = object.exec('SELECT * FROM bookmarks')
    result.map{ |bookmark| bookmark["url"] }
  end

end