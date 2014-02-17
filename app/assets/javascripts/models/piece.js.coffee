Rockcloud.Piece = DS.Model.extend
  title        : DS.attr('string')
  composer     : DS.attr('string')
  fileUrl      : DS.attr('string')
  filename     : DS.attr('string')
  filetype     : DS.attr('string')
  performer    : DS.attr('string')
  trackNumber  : DS.attr('number')
  year         : DS.attr('number')
  updatedAt    : DS.attr('date')
  posterUrl    : DS.attr('string')

  recording    : DS.belongsTo('recording')

  isPlayable: (->
    @get('filetype') == "audio" || @get('filetype') == "video"
  ).property('filetype')

  siblings: (->
    @get('recording.pieces')
  ).property()

  next: (->
    @get('siblings').objectAt(@get('currentIndex') + 1)
  ).property('currentIndex')

  previous: (->
    @get('siblings').objectAt(@get('currentIndex') - 1)
  ).property('currentIndex')

  currentIndex: (->
    @get('siblings').indexOf(this)
  ).property('siblings.@each')