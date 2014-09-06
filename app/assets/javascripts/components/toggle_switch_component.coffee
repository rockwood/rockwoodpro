Rockcloud.ToggleSwitchComponent = Ember.Component.extend
  classNames: ['toggle']
  classNameBindings: ['isOn:toggle--on']
  attributeBindings: ['data-test']

  click: ->
    @toggleProperty('isOn')
    @sendAction()
    return false # stop event bubble
