class AdminRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/admin/recordings/#{recording.id}"
  end

  def discover_pieces
    click_on "Discover Pieces"
  end

  def state
    find('.row-state td').text
  end

  def pieces
    all('td.col-filename').collect(&:text)
  end
end