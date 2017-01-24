feature "Submit tags" do
  scenario "Displays form to add new bookmark with tag" do
    visit 'links/new'
    expect(page.status_code).to eq 200
    fill_in 'url', with: 'http://www.google.co.uk'
    fill_in 'title', with: 'Google UK'
    fill_in 'tags', with: 'search'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end
end
