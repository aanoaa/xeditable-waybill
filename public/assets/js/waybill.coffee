###
<a href="#" id="waybill" data-type="waybill" data-name="key">awesome</a>
<script>
  $('#waybill').editable
    source: [
      {value:1, text: 'Fedex'},
      {value:2, text: 'DHL'}
    ]
    value:
      parcel: 'Fedex'
      number: '123456'
</script>
###
Waybill = (opts) ->
  @sourceData = opts.source
  @sourceMap = {}
  for item in @sourceData
    @sourceMap[item.value] = item.text
  @init('waybill', opts, Waybill.defaults)
  
# inherit from Abstract input
$.fn.editableutils.inherit(Waybill, $.fn.editabletypes.abstractinput)

$.extend Waybill.prototype,
  render: ->
    @$input = @$tpl.find('input')
    @$list  = @$tpl.find('select')
    @$list.empty()
    fillItems = ($el, data) ->
      $el.append($('<option>', {value: item.value}).text(item.text)) for item in data
      return $el
    fillItems(@$list, @sourceData)
  value2html: (value, element) ->
    return $(element).empty() unless value
    $(element).html """
      <div>#{@sourceMap[value.parcel]}</div>
      <div>#{value.number}</div>
    """
  html2value: (html) ->
  value2str: (value) ->
    str = ''
    for parcel, num of value
      str = "#{parcel}:#{num};"
    return str
  str2value: (str) ->
  value2input: (value) ->
    return unless value
    @$list.val(value.parcel)
    @$input.filter('[name="number"]').val(value.number)
  input2value: ->
    parcel: @sourceMap[@$list.val()]
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
      <label><input type="text" name="number"></label>
    </div>
  '''
  inputclass: ''
  source: []

$.fn.editabletypes.waybill = Waybill
