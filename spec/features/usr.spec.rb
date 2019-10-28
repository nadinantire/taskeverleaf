require 'rails_helper'
RSpec.feature "Task management function", type: :feature do
  background do 
  Usr.create!(name: "nadine", email: "g@gmail.com", password: "123456")
  end
  background do
    visit  root_path
    fill_in  'Email' ,  with: 'g@gmail.com'
    fill_in  'Password' ,  with: '123456'
    click_on  'Log in'
    # expect(page ).to have_text('Logged in as g@gmail.com.')
  end
 scenario "Test number of users" do
   @user = Usr.all.count
   
 end
 scenario "Test user list" do
   visit admin_usrs_path
   expect(page ).to  have_content  'nadine'
 end
 scenario "Test user creation" do
   visit admin_usrs_path
   expect(page ).to  have_content  'nadine'
 end
 scenario "test enable user creation page" do
   visit admin_usrs_path
   expect(page ).to  have_content  'nadine'
 end
 scenario 'Test Task Deletion' do
   @usr = Usr.last
   @usr.destroy
   # expect(page).to have_content('testtesttest')
   # click_on 'Destroy'
   visit usrs_path
   expect(page).not_to have_content('nadine')
 end
end