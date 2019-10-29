
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
 scenario "Test task list" do
  
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  click_on 'Back'
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_02'
  fill_in  'Content' ,  with: 'sample'
  click_on '登録する'
  click_on 'Back'
  expect(page).to have_content 'testtesttest'
  expect(page).to have_content 'sample'
 end
 scenario "Test task creation" do
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  expect(page ).to have_text('Task was successfully created.')
 end
 scenario "Test task details" do
  click_on 'New Task'
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  click_on 'Back'
  click_on 'Show'
  expect(page).to have_content 'testtesttest'
 end
 scenario "Test whether tasks are arranged in descending order of creation date" do
  task=Task.all
  assert task.order('created_at DESC')

 end
 scenario "Test task updating" do
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  click_on 'Back'
  click_on 'Edit'
  
   fill_in 'Name', with: 'name update'
   fill_in 'Content', with: 'task update'
   click_on '更新する'
   
   expect(page).to have_content('name update')
   expect(page).to have_content('task update')
 end
 scenario 'Test Task Deletion' do
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  click_on 'Back'
  click_on 'Destroy'
   expect(page).to have_text('Task was successfully destroyed.')
 end
 scenario "Test Task of sorting by priority" do
  task=Task.all
  assert task.order('priority DESC')
 end
 scenario "Test Task of validation" do

    visit new_task_path
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  expect(page ).to have_text('error')
 end
 scenario "Test task deadline date" do
  task=Task.all
  assert task.order('end_date DESC')
 end
 scenario "test task search" do
  visit new_task_path
  fill_in  'Name' ,  with: 'test_task_01'
  fill_in  'Content' ,  with: 'testtesttest'
  click_on '登録する'
  expect(page ).to have_text('Task was successfully created.')
  visit tasks_path
  fill_in  'terms' ,  with: 'testtesttest'
  click_on 'Searche'
  expect(page).to have_content('testtesttest')
end
scenario "can search by attached labels " do
  visit new_label_path
  fill_in 'Name', with: 'label1'
  fill_in 'Content', with: 'testlabel1'
  click_on '登録する'
  visit tasks_path
  fill_in  'key' ,  with: 'testtesttest'
  click_on 'Search'
end
end