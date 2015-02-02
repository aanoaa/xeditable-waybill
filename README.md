x-editable custom inputs

    <a href="#" id="waybill" data-type="waybill" data-name="key">awesome</a>
    <script>
      $('#waybill').editable
        source: ['Fedex', 'DHL']
        value:
          parcel: 'Fedex'
          number: '123456'
    </script>
