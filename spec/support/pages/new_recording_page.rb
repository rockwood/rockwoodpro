class NewRecordingPage
  include Capybara::DSL

  def visit_page
    visit "/app/#/recording/new"
  end

  def fill_form(recording)
    fill_in 'When', with: recording.datetime.strftime('%Y-%m-%d %H:%M:%S')
    find("body").click # force datepicker to close
    fill_in 'Where', with: recording.location
    choose recording.context
    choose recording.level
    fill_in 'Number of CDs', with: recording.cds
    fill_in 'Number of DVDs', with: recording.dvds
  end

  def submit_form
    click_on 'Request recording'
  end

  def successful?
    page.has_content?("Thanks for requesting")
  end

  def create(recording)
    visit_page
    fill_form(recording)
    submit_form
  end
end

