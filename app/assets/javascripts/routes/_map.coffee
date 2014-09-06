Rockcloud.Router.map ->
  @resource 'recordings', ->
    @route 'show', path: ':recording_id'

  @resource 'recording', ->
    @route 'new'
    @route 'showShared', path: 'shared/:recording_id'

