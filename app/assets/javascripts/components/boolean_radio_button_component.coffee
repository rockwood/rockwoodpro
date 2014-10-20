Rockcloud.BooleanRadioButtonComponent = Ember.Component.extend
  tagName : "input"
  type : "radio"
  attributeBindings : [ "name", "type", "value", "checked:checked" ]

  click: ->
    @set("selection", if @$().val() == "1" then true else false)

  checked: (->
    if @get("value") == "1"
      @get("selection") == true
    else
      @get("selection") == false
  ).property('selection')

