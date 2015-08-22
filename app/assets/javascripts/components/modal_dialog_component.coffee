Rockcloud.ModalDialogComponent = Ember.Component.extend
  classNames: "modal modal--active"

  actions:
    close: ->
      @sendAction('onClose')
