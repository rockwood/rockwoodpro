Ember.Handlebars.registerBoundHelper 'datetime', (value, options={}) ->
  moment.utc(value).format(options.hash.format || 'MMMM Do YYYY, h:mma')