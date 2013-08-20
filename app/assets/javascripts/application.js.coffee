#= require jquery
#= require mediaelement
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require ./rockcloud

$.ajaxPrefilter (options, originalOptions, xhr) ->
  xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))

window.Rockcloud = Ember.Application.create
  rootElement: "#app"
