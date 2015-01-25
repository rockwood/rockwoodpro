Rockcloud.CopyableInputComponent = Ember.Component.extend
  classNames: ['input-group', 'copyable']
  didCopy: false

  didInsertElement: ->
    clip = new ZeroClipboard @$('button')
    clip.on 'aftercopy', => @toggleDidCopy()

  toggleDidCopy: ->
    @set('didCopy', true)
    Ember.run.later((=> @set('didCopy', false)), 2000)

  copyButtonText: (->
    if @get('didCopy') then "Copied!" else "Copy"
  ).property('didCopy')
