require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create('http://www.makersacademy.com', 'MakersAcademy')
      Bookmark.create('http://www.destroyallsoftware.com', 'DestroyAllSoftware')
      Bookmark.create('http://www.google.com', 'Google')
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com", 'MakersAcademy')
      expect(bookmarks).to include("http://www.destroyallsoftware.com", 'DestroyAllSoftware')
      expect(bookmarks).to include("http://www.google.com", 'Google')
    end
  end

  describe '.create' do
    it 'create a new row of the database' do
      Bookmark.create("www.abcde.com", 'Abcde')
      bookmarks = Bookmark.all
      expect(bookmarks).to include "www.abcde.com"
    end
  end
end