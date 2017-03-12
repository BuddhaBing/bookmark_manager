feature "adding links to database" do
  scenario "user tries to add a link" do
    new_link
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('thingie')
    end
  end
end
