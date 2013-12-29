#= require jquery
#= require mediaelement
#= require moment
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

Rockcloud.deferReadiness()

$ ->
  $('.flash').on "click", ->
    $(this).remove()