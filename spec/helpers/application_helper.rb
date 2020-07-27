module ApplicationHelper

  def add_user
    visit '/'
    click_link('Add User')
    fill_in('Username', with: 'Luni')
    fill_in('Email', with: 'cat@example.com')
    fill_in('Password', with: 'Password0')
    click_button('Submit')
  end

end
