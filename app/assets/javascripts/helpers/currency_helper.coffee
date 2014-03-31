Ember.Handlebars.registerBoundHelper 'currency', (value, options={}) ->
  return "" if value == ""
  return "$" + value.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
