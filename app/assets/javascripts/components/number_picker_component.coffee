Rockcloud.NumberPickerComponent = Ember.Component.extend
  min: 0,
  step: 1,
  classNames: ['number-picker', 'input-group']

  actions:
    increment: ->
      @incrementProperty('value', +@get('step'))

    decrement: ->
      @decrementProperty('value', +@get('step')) if @get('decrementable')

  decrementable: (->
    typeof @get('value') == 'number' && @get('value') > +@get('min')
  ).property('value')

  checkType: (->
    if @get('value')? && typeof @get('value') != 'number'
      number = parseInt(@get('value')) || null
      @set('value', number)
  ).observes('value')


