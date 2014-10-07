class LiveRecordingPage < Page
  def visit_page
    visit("/live")
  end

  def playing?(recording)
    embed_source.include?(recording.embed_code)
  end

  def inactive?
    has_css?(test_selector("inactive"))
  end

  def embed_source
    find('iframe')[:src]
  end
end
