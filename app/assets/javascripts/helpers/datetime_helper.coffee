Ember.Handlebars.registerBoundHelper 'datetime', (value, options={}) ->
  return null unless value? && value != ""
  moment(value).format(options.hash.format || 'MMMM Do YYYY, h:mma')
