class LiveController < ApplicationController
  def show
    @recording = Recording.live_now
  end
end
