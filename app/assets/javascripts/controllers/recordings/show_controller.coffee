Rockcloud.RecordingsShowController = Ember.ObjectController.extend
  needs: ['currentlyPlaying']

  labelClass: (->
    switch @get('state')
      when 'requested'
        return 'label-default'
      when 'confirmed'
        return 'label-primary'
      when 'finished'
        return 'label-success'
  ).property('state')

  sharedPieces: Ember.computed.filterBy('pieces', 'shared', true)
  isSharable: Ember.computed.notEmpty('sharedPieces')

  shareLink: (->
    path = @container.lookup("router:main").generate('recordings.show', @get('model'))
    window.location.origin + path
  ).property('id')

  encodedShareLink: (->
    encodeURIComponent(@get('shareLink'))
  ).property('shareLink')

  encodedShareCaption: (->
    encodeURIComponent("Checkout this performance: ")
  ).property()

  facebookLink: (->
    "https://www.facebook.com/sharer/sharer.php?u=#{@get('encodedShareLink')}&t=#{@get('encodedShareCaption')}"
  ).property('shareLink')

  twitterLink: (->
    "https://twitter.com/home?status=#{@get('encodedShareCaption')}#{@get('encodedShareLink')}"
  ).property('shareLink')


