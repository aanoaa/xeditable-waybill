$ ->
  $('#waybill').editable
    mode: 'inline'
    url: '/post'
    title: 'oops'
    values:
      parcel_service: 'Fedex'
      number: '123456'

  $('#address').editable
    mode: 'inline'
    url: '/post'
    title: 'Enter city, street and building #'
    value:
      city: "Moscow"
      street: "Lenina"
      building: "15"
