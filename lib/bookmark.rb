require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      object = PG.connect(dbname: 'bookmark_manager_test')
    else
      object = PG.connect(dbname: 'bookmark_manager')
    end
    
    result = object.exec('SELECT * FROM bookmarks')
    result.map{ |bookmark| bookmark["url"] }
  end

end