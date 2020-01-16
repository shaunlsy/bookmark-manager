feature "Add bookmarks" do
  scenario "Adding a bookmark" do
    visit('/')
    fill_in :url, with: "www.abcde.com"
    fill_in :title, with: "Abcde"
    click_button 'Add'
    
    expect(page).to have_link("Abcde", href: "www.abcde.com")
  end 
end