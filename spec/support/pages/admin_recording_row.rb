class AdminRecordingRow
  include Capybara::DSL

  def initialize(recording)
    @recording = recording
  end

  def confirm
    row.click_on "Confirm"
  end

  def finish
    row.click_on "Finish"
  end

  def state
    row.find('.col-context').text
  end

  def row
    find("#recording_#{@recording.id}")
  end
end