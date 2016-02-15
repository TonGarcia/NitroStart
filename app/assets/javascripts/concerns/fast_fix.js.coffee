# Fix waves effect
$(document).on 'ready page:change', ->
  Waves.displayEffect()
  $('select').material_select()