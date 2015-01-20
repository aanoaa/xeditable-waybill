$ ->
  $('#waybill').editable
    mode: 'inline'
    source: ['Fedex', 'DHL']

  $('#address').editable
    mode: 'inline'
    url: '/post'
    title: 'Enter city, street and building #'
    value:
      city: "Moscow"
      street: "Lenina"
      building: "15"
    display: (value) ->
      return $(@).empty() unless value
      html = """
      <b>#{$('<div>').text(value.city).html()}</b>,
      #{$('<div>').text(value.street).html()},
      #{$('<div>').text(value.building).html()}
      """
      $(@).html(html)
