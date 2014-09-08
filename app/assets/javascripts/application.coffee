#= require jquery
#= require bootstrap-datetimepicker
#= require mediaelement
#= require moment
#= require zero-clipboard
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./rockcloud


$.ajaxPrefilter (options, originalOptions, xhr) ->
  xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

Ember.LOG_VERSION = false

window.Rockcloud = Ember.Application.create
  rootElement: "#rockcloud"

Rockcloud.ENV =
  PLUGIN_URL: 'http://cdn.rockwoodpro.com/plugins/'

Rockcloud.deferReadiness()

Rockcloud.Router.reopen
  location: 'history'
  rootURL: '/app'

ZeroClipboard.config(swfPath: Rockcloud.ENV.PLUGIN_URL + 'ZeroClipboard.swf')

$ ->
  $('.flash').on "click", ->
    $(this).remove()
