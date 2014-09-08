Rockcloud.CopyableInputComponent = Ember.Component.extend
  classNames: ['input-group', 'copyable']

  didInsertElement: ->
    clip = new ZeroClipboard @$('button')

    clip.on 'aftercopy', (evt) ->
      alert("Copied!")
