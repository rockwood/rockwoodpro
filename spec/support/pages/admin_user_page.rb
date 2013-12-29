class AdminUserPage
  include Capybara::DSL

  def visit_page(user)
    visit "/admin/users/#{user.id}"
  end

  def switch_to_user
    click_on "Switch to User"
  end

  def signed_in_as_user?(user)
    find('.flash__message').text == "Signed in as: #{user.full_name}"
  end
end