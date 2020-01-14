require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      object = PG.connect(dbname: 'bookmark_manager_test')

      object.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      object.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      object.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end