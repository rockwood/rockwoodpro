class NewRecordingPage
  include Capybara::DSL

  def visit_page
    visit '/recordings/new'
  end

  def fill_form(recording)
    fill_in 'When', with: recording.datetime
    fill_in 'Where', with: recording.location
    fill_in 'Context', with: recording.context
    fill_in 'Level', with: recording.level
    fill_in 'Cds', with: recording.cds
    fill_in 'Dvds', with: recording.dvds
  end

  def submit_form
    click_on 'Request recording'
  end

  def successful?
    page.has_content?("Thanks! I'll be contacting you soon")
  end
end

