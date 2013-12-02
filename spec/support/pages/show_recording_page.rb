class ShowRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/app/#/recordings/#{recording.id}"
  end

  def play_piece(piece)
    find('td', text: piece.filename).click
  end

  def playing?(piece)
    find('video', visible: false)['src'] == piece.file_url
  end

  def state
    find('.recording__state').text
  end
end

