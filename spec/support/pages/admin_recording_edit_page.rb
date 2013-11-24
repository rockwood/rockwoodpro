class AdminRecordingEditPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/admin/recordings/#{recording.id}/edit"
  end

  def confirm_recording
    choose "Confirm"
    click_on "Submit"
  end
end