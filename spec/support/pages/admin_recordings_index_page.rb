class AdminRecordingsIndexPage
  include Capybara::DSL

  def visit_page
    visit "/admin/recordings"
    self
  end

  def confirm(recording)
    AdminRecordingRow.new(recording).confirm
  end

  def finish(recording)
    AdminRecordingRow.new(recording).finish
  end
end
