feature 'Viewing bookmarks' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Bookmark Manager'
    end
  end

  scenario 'bookmarks are visible' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit('/')
    fill_in :url, with: "www.abcde.com"
    fill_in :title, with: "Abcde"
    click_button "Add"

    expect(page).to have_link "Makers Academy", href: "http://www.makersacademy.com"
    expect(page).to have_link "Destroy All Software", href: "http://www.destroyallsoftware.com"
    expect(page).to have_link "Google", href: "http://www.google.com"
  end
  
end
