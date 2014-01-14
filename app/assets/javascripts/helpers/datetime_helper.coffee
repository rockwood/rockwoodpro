Ember.Handlebars.registerBoundHelper 'datetime', (value, options={}) ->
  moment(value).format(options.hash.format || 'MMMM Do YYYY, h:mma')