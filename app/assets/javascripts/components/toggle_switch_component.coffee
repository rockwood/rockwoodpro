Rockcloud.ToggleSwitchComponent = Ember.Component.extend
  classNames: ['toggle']
  classNameBindings: ['isOn:toggle--on']

  click: ->
    @toggleProperty('isOn')
    @sendAction()
    return false # stop event bubble
