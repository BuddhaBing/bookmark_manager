feature "filtering links" do
  scenario "user wants to only see 'watermelons' tags " do
    new_link
    new_link title: "waterthing", tags: "watermelons"
    visit "/tags/watermelons"
    within 'ul#links' do
      expect(page).not_to have_content('thingie')
      expect(page).to have_content('waterthing')
    end
  end
end
