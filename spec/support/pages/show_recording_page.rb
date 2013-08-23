class ShowRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/recordings"
    click_on recording.location
  end

  def play_piece(piece)
    find('td', text: piece.title).click
  end

  def playing?(piece)
    page.find('video', visible: false)['src']
  end
end

