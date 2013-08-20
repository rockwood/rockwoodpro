Rockcloud.Piece = DS.Model.extend
  title        : DS.attr('string')
  composer     : DS.attr('string')
  fileUrl      : DS.attr('string')
  filename     : DS.attr('string')
  performer    : DS.attr('string')
  trackNumber  : DS.attr('number')
  year         : DS.attr('number')
  updatedAt    : DS.attr('date')

  recording    : DS.belongsTo('Rockcloud.Recording')