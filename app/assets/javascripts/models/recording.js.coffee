Rockcloud.Recording = DS.Model.extend
  location     : DS.attr('string')
  directory    : DS.attr('string')

  datetime     : DS.attr('date')
  created_at   : DS.attr('date')
  updated_at   : DS.attr('date')

  cds          : DS.attr('number')
  dvds         : DS.attr('number')

  context      : DS.attr('string')
  level        : DS.attr('string')
  state        : DS.attr('string')

  programFile  : DS.attr('string')

  pieces: DS.hasMany('piece')

  isFinished: (->
    @get('state') == 'finished'
  ).property('state')

  firstPiece: (->
    @get('pieces').filterBy('isPlayable', true).get('firstObject')
  ).property('pieces@each')