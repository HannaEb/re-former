require 'rails_helper'

feature 'users' do

  context 'no users have been added' do
    scenario 'should display a prompt to add a user' do
      visit '/'
      expect(page).to have_content('All Users')
      expect(page).to have_link('Add User')
    end
  end

  context 'adding users' do
    scenario 'prompts user to fill out a form, then displays the new user' do
      add_user
      expect(page).to have_content('Luni')
      expect(page).to have_link('edit')
    end
  end

  context 'an invalid user' do

    scenario 'does not allow user to be added if password requirements are not met' do
      visit '/'
      click_link('Add User')
      fill_in('Username', with: 'Luni')
      fill_in('Email', with: 'cat@example.com')
      fill_in('Password', with: 'password')
      click_button('Submit')
      expect(page).to have_content('Password is invalid')
      expect(page).not_to have_content('Luni')
    end

    scenario 'does not allow user to be added if form fields are left empty' do
      visit '/'
      click_link('Add User')
      click_button('Submit')
      expect(page).to have_content('Username can\'t be blank')
      expect(page).to have_content('Email can\'t be blank')
      expect(page).to have_content('Password can\'t be blank')
    end

  end

  context 'editing users' do
    scenario 'prompts user to fill out a form then displays the users' do
      add_user
      click_link('edit')
      fill_in('Username', with: 'Marley')
      fill_in('Email', with: 'cat@example.com')
      fill_in('Password', with: 'Password1')
      click_button('Submit')
      expect(page).to have_content('Marley')
      expect(page).not_to have_content('Luni')
    end
  end

end
