Ember.Handlebars.registerBoundHelper 'datetime', (value, options={}) ->
  moment.utc(value).format(options.hash.format || 'MM/DD/YY [at] h:mma')