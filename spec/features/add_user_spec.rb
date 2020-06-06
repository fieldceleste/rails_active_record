describe 'the add a user process' do
  it "adds a new user" do 
    visit new_user_registration_path
    fill_in 'Email', :with => 'celeste@aol.com'
    fill_in 'Password', :with => 'hello1234567'
    fill_in 'Password confirmation', :with => 'hello1234567'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end