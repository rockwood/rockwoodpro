Rockcloud.NumberPickerComponent = Ember.Component.extend
  classNames: ['number-picker', 'input-group']

  events:
    increment: ->
      @incrementProperty('value')

    decrement: ->
      @decrementProperty('value') if @get('decrementable')

  decrementable: (->
    typeof @get('value') == 'number' && @get('value') > 0
  ).property('value')

  checkType: (->
    if @get('value')? && typeof @get('value') != 'number'
      number = parseInt(@get('value')) || null
      @set('value', number)
  ).observes('value')


