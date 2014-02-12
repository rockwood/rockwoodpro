class CalendarsController < ApplicationController
  respond_to :ics

  def recordings
    @recordings ||= Recording.all
  end
  helper_method :recordings
end