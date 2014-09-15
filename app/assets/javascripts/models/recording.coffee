Rockcloud.Recording = DS.Model.extend
  location     : DS.attr('string')
  directory    : DS.attr('string')

  datetime     : DS.attr('date')
  created_at   : DS.attr('date')
  updated_at   : DS.attr('date')

  cds          : DS.attr('number', defaultValue: 0)
  dvds         : DS.attr('number', defaultValue: 0)

  context      : DS.attr('string', defaultValue: "Live Performance")
  level        : DS.attr('string', defaultValue: "Audio and Video")
  state        : DS.attr('string')

  programFile  : DS.attr('string')

  user: DS.belongsTo('user')
  pieces: DS.hasMany('piece')

  isRequested: (->
    @get('state') == 'requested'
  ).property('state')

  isFinished: (->
    @get('state') == 'finished'
  ).property('state')

  firstPiece: (->
    @get('pieces').filterBy('isPlayable', true).get('firstObject')
  ).property('pieces@each')