feature 'sign out' do
  scenario 'user can sign out' do
    sign_up
    sign_in

    click_button 'Sign Out'
    expect(current_path).to eq '/links'
    expect(page).to have_content "Goodbye!"

  end
end
