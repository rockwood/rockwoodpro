class IcalPage
  include Capybara::DSL
  def visit_page
    visit("/calendar.ics")
  end

  def has_event_location?(location)
    has_content?("LOCATION:#{location}")
  end

  def has_event_start?(datetime)
    has_content?("DTSTART:#{I18n.l datetime.utc, format: :ical}")
  end

  def has_event_status?(status)
    has_content?("STATUS:#{status}")
  end

  def has_sequence?(sequence)
    has_content?("SEQUENCE:#{sequence}")
  end
end
