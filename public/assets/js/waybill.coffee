###
<a href="#" id="waybill" data-type="waybill">awesome</a>
<script>
  $('#waybill').editable
    url: '/post'
    title: ''
    values:
      parcel_service: 'Fedex'
      number: '123456'
</script>
###
Waybill = (opts) ->
  @init('waybill', opts, Waybill.defaults)

# inherit from Abstract input
$.fn.editableutils.inherit(Waybill, $.fn.editabletypes.abstractinput)

$.extend Waybill.prototype,
  render: ->
    @$input = @$tpl.find('input,select')
  value2html: (value, element) ->
    return $(element).empty() unless value
    $(element).html """
      <div>#{value.parcel_service}</div>
      <div>#{value.number}</div>
    """
  html2value: (html) ->
  value2str: (value) ->
  str2value: (str) ->
  value2input: (value) ->
    return unless value
    @$input.filter('[name="parcel_service"]').val(value.parcel_service)
    @$input.filter('[name="number"]').val(value.number)
  input2value: ->
    parcel_service: @$input.filter('[name="parcel_service"]').val()
    number: @$input.filter('[name="number"]').val()
  activate: ->
    @$input.filter('[name="parcel_service"]').focus()
  autosubmit: ->
    @$input.keydown (e) ->
      if e.which is 13 then $(@).closest('form').submit()

Waybill.defaults = $.extend {}, $.fn.editabletypes.abstractinput.defaults,
  tpl: '''
    <div class="editable-waybill">
      <label>
        <select name="parcel_service">
          <option value="현대">현대택배</option>
          <option value="CJ">CJ택배</option>
        </select>
      </label>
      <label>
        <input type="text" name="number">
      </label>
    </div>
  '''
  inputclass: ''

$.fn.editabletypes.waybill = Waybill
