class EditAdminRecordingPage
  include Capybara::DSL

  def visit_page(recording)
    visit "/admin/recordings/#{recording.id}/edit"
  end

  def confirm_recording
    choose "confirmed"
    click_on "Update Recording"
  end

  def finish_recording
  	choose "finished"
    click_on "Update Recording"
  end
end