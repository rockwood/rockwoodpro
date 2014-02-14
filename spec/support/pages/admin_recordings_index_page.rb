class AdminRecordingsIndexPage
  include Capybara::DSL

  def visit_page
    visit "/admin/recordings"
  end
end