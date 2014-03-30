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

