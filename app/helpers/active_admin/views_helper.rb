module ActiveAdmin::ViewsHelper #camelized file name
  def color_for_state(state)
    case state
      when 'requested'
        :red
      when 'confirmed'
        :orange
      when 'finished'
        :green
    end
  end
end