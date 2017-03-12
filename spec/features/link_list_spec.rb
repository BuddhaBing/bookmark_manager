
feature 'list of links' do
  scenario 'user would like to view a list of links' do
    link = Link.new(url: 'http://www.bbc.co.uk', title: 'BBC')
    tag = Tag.create(name: "")
    link.tags << tag
    link.save
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
