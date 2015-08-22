Rockcloud.Recording = DS.Model.extend
  location     : DS.attr('string')
  directory    : DS.attr('string')

  datetime     : DS.attr('date')
  created_at   : DS.attr('date')
  updated_at   : DS.attr('date')

  cds          : DS.attr('number', defaultValue: 0)
  dvds         : DS.attr('number', defaultValue: 0)

  duration     : DS.attr('number', defaultValue: 1)
  context      : DS.attr('string', defaultValue: "Live Performance")
  level        : DS.attr('string', defaultValue: "Multi Camera")
  liveStream   : DS.attr('boolean', defaultValue: false)
  state        : DS.attr('string')

  programFile  : DS.attr('string')

  user: DS.belongsTo('user')
  pieces: DS.hasMany('piece')

  permissions: DS.attr()

  isRequested: (->
    @get('state') == 'requested'
  ).property('state')

  isFinished: (->
    @get('state') == 'finished'
  ).property('state')

  firstPiece: (->
    @get('pieces').filterBy('isPlayable', true).get('firstObject')
  ).property('pieces@each')

  isLivePerformance: (->
    @get('context') == "Live Performance"
  ).property('context')

  recordingPrice: (->
    switch @get('level')
      when 'Multi Camera'
        return 225 * @get('duration')
      when 'Single Camera'
        return 150 * @get('duration')
      when 'Audio Only'
        return 100 * @get('duration')
  ).property('level', 'duration')

  liveStreamPrice: (->
    if @get('liveStream') then 50 else 0
  ).property('liveStream')

  discPrice: (->
    (@get('cds') + @get('dvds')) * 20
  ).property('cds', 'dvds')

  totalPrice: (->
    @get('discPrice') + @get('recordingPrice') + @get('liveStreamPrice')
  ).property('discPrice', 'recordingPrice', 'liveStreamPrice')
