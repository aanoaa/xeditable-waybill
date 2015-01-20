###
<a href="#" id="waybill" data-type="waybill" data-name="key">awesome</a>
<script>
  $('#waybill').editable
    source: ['Fedex', 'DHL']
    value:
      parcel: 'Fedex'
      number: '123456'
</script>
###
Waybill = (opts) ->
  @sourceData = opts.source
  @init('waybill', opts, Waybill.defaults)
  
# inherit from Abstract input
$.fn.editableutils.inherit(Waybill, $.fn.editabletypes.abstractinput)

$.extend Waybill.prototype,
  render: ->
    @$input = @$tpl.find('input')
    @$list  = @$tpl.find('select')
    @$list.empty()
    fillItems = ($el, data) ->
      $el.append($('<option>', {value: '직접반납'}).text('직접반납'))
      $el.append($('<option>', {value: item}).text(item)) for item in data
      return $el
    fillItems(@$list, @sourceData)
  value2html: (value, element) ->
    return $(element).empty() unless value
    $(element).html [value.parcel,value.number].join(',')
  html2value: (html) ->
    [parcel, number] = html.split(',')
    return { parcel: parcel, number: number }
  value2str: (value) ->
    return [value.parcel,value.number].join(',')
  str2value: (str) -> str
  value2input: (value) ->
    return unless value
    @$list.val(value.parcel)
    @$input.filter('[name="number"]').val(value.number)
  input2value: ->
    parcel: @$list.val()
    number: @$input.filter('[name="number"]').val()
  activate: ->
    @$list.focus()
  autosubmit: ->
    @$input.keydown (e) ->
      if e.which is 13 then $(@).closest('form').submit()

Waybill.defaults = $.extend {}, $.fn.editabletypes.abstractinput.defaults,
  tpl: '''
    <div class="editable-waybill">
      <label><select name="parcel"></select></label>
      <label><input type="text" name="number" placeholder="운송장번호"></label>
    </div>
  '''
  inputclass: ''
  source: []

$.fn.editabletypes.waybill = Waybill
