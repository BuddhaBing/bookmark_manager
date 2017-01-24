feature "Sumbit links" do
  scenario "Displays form to add new bookmarks" do
    visit 'links/new'
    expect(page.status_code).to eq 200
    fill_in 'url', with: 'http://www.google.co.uk'
    fill_in 'title', with: 'Google UK'
    click_button 'Create link'
    expect(page).to have_content "http://www.google.co.uk"
  end
end
