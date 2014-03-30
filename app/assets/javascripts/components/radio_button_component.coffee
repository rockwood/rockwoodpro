Rockcloud.RadioButtonComponent = Ember.Component.extend
  tagName : "input"
  type : "radio"
  attributeBindings : [ "name", "type", "value", "checked:checked" ]

  click: ->
      @set("selection", @$().val())

  checked: (->
    @get("value") == @get("selection")
  ).property('selection')

