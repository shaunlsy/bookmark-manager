feature "Add bookmarks" do
  scenario "Adding a bookmark" do
    visit('/')
    fill_in :bookmark, with: "www.abcde.com"
    click_button 'Add'
    expect(page).to have_content "www.abcde.com"
  end 
end