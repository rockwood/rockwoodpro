class ShowRecordingPage < Page
  def visit_page(recording)
    visit "/app/#/recordings/#{recording.id}"
  end

  def showing?(recording)
    current_url.include?("/recordings/#{recording.id}")
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

  def share_piece(piece)
    within test_selector("piece-#{piece.id}") do
      find(test_selector("share-piece")).click
    end
  end
end

