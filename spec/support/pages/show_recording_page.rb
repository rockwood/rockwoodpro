class ShowRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/recordings"
    find('.panel__title', text: recording.location).click
  end

  def play_piece(piece)
    find('td', text: piece.title).click
  end

  def playing?(piece)
    find('video', visible: false)['src'] == piece.file_url
  end
end

