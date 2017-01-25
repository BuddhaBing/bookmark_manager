feature 'organise links into categories' do
  scenario 'tag links' do
    visit '/new'
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'www.bbc.co.uk'
    fill_in 'tags', with: 'news'
    click_button 'Submit'
    #expect(page).to have_content 'tags:news'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
