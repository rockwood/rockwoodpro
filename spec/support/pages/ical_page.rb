class IcalPage
  include Capybara::DSL
  def visit_page
    visit("/calendar.ics")
  end

  def has_event_location?(location)
    has_content?("LOCATION:#{location}")
  end

  def has_event_start?(datetime)
    has_content?("DTSTART:#{I18n.l datetime, format: :ical}")
  end
end