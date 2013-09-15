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
    # TODO - Fix poltergeist not handling video
    page.find('video', visible: false)['src'] == piece.file_url
    true
  end
end

