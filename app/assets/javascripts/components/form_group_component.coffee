Rockcloud.FormGroupComponent = Ember.Component.extend
  classNames: ['form-group']
  classNameBindings: ['hasError:has-error']

  hasError: Em.computed.notEmpty('errors')
