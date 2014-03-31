Rockcloud.BootstrapDatepickerComponent = Ember.Component.extend
  classNames: ["input-group"]

  click: ->
    @$('input').datetimepicker('show')

  didInsertElement: ->
    @$('input').datetimepicker
      format: "MM dd yyyy HH:ii P"
      showMeridian: true
      autoclose: true
      todayBtn: true

  valueProxy: ((key, value) ->
    if value?
      date = moment(value)
      @set('value', date.toDate()) if date && date.isValid()
    @get('value')
  ).property('value')

