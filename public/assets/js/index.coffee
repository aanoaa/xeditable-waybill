$ ->
  $('#waybill').editable
    mode: 'inline'
    url: '/post'
    title: 'oops'
    value:
      parcel_service: 'Fedex'
      number: '123456'
    display: (value) ->
      return $(@).empty() unless value
      html = """
      #{$('<div>').text(value.parcel_service).html()},
      #{$('<div>').text(value.number).html()}
      """
      $(@).html(html)

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
