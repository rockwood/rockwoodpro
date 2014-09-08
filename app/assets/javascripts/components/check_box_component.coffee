Rockcloud.CheckBoxComponent = Ember.Component.extend
  attributeBindings: ['data-test']
  tagName: "label"
  classNames: "check-box"
  click: (evt) ->
    @sendAction()
    # prevents double events when clicking on the label instead of the input
    if @$().get(0) == evt.target
      @toggleProperty('checked')
      return false


