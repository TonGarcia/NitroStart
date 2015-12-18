# Fix FacebookJS components
$ ->
  loadFacebookSDK()
  bindFacebookEvents() unless window.fbEventsBound

$(document).on 'page:change', ->
  FB.init({ status: true, cookie: true, xfbml: true });

loadTwitterSDK = ->
  $.getScript("//platform.twitter.com/widgets.js")

bindFacebookEvents = ->
  $(document)
  .on('page:fetch', saveFacebookRoot)
  .on('page:change', restoreFacebookRoot)
  .on('page:load', ->
    FB?.XFBML.parse()
  )
  @fbEventsBound = true

saveFacebookRoot = ->
  if $('#fb-root').length
    @fbRoot = $('#fb-root').detach()

restoreFacebookRoot = ->
  if @fbRoot?
    if $('#fb-root').length
      $('#fb-root').replaceWith @fbRoot
    else
      $('body').append @fbRoot

loadFacebookSDK = ->
  window.fbAsyncInit = initializeFacebookSDK
  $.getScript("//connect.facebook.net/en_US/sdk.js")

initializeFacebookSDK = ->
  FB.init
    appId  : '1691426611079180'
    status : true
    cookie : true
    xfbml  : true



# Fix waves effect
$(document).on 'ready page:change', ->
  Waves.displayEffect()
  $('select').material_select()



# Fix TwitterJS components
twttr_events_bound = false
$ ->
  loadTwitterSDK()
  bindTwitterEventHandlers() unless twttr_events_bound

bindTwitterEventHandlers = ->
  $(document).on 'page:load', renderTweetButtons
  twttr_events_bound = true

renderTweetButtons = ->
  $('.twitter-share-button').each ->
    button = $(this)
    button.attr('data-url', document.location.href) unless button.data('url')?
    button.attr('data-text', document.title) unless button.data('text')?
  twttr.widgets.load()


# Fix Go
$ ->
  gapi.plusone.go()
  $(document).on 'page:load', gapi.plusone.go