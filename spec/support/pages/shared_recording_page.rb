class SharedRecordingPage < Page
  def visit_page(recording)
    visit "/app/recording/#{recording.id}/shared"
  end

  def has_piece?(piece)
    has_css?(test_selector("piece-#{piece.id}"))
  end

  def has_no_piece?(piece)
    has_no_css?(test_selector("piece-#{piece.id}"))
  end
end
