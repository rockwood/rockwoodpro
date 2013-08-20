Rockcloud.Router.map ->
  @resource 'recordings', ->
    @resource 'recording', path: ':recording_id'