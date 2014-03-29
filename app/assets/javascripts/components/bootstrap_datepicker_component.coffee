Rockcloud.BootstrapDatepickerComponent = Ember.TextField.extend
  didInsertElement: ->
    @$().datetimepicker
        format: "dd MM yyyy - HH:ii P"
        showMeridian: true
        autoclose: true
        todayBtn: true

