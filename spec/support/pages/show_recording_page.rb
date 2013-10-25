class ShowRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/recordings/#/recordings/#{recording.id}"
  end

  def play_piece(piece)
    find('td', text: piece.title).click
  end

  def playing?(piece)
    find('video', visible: false)['src'] == piece.file_url
  end
end

