// Generated by CoffeeScript 1.8.0

/*
<a href="#" id="waybill" data-type="waybill">awesome</a>
<script>
  $('#waybill').editable
    url: '/post'
    title: ''
    values:
      parcel_service: 'Fedex'
      number: '123456'
</script>
 */
var Waybill;

Waybill = function(opts) {
  return this.init('waybill', opts, Waybill.defaults);
};

$.fn.editableutils.inherit(Waybill, $.fn.editabletypes.abstractinput);

$.extend(Waybill.prototype, {
  render: function() {
    return this.$input = this.$tpl.find('input,select');
  },
  value2html: function(value, element) {
    if (!value) {
      return $(element).empty();
    }
    return $(element).html("<div>" + value.parcel_service + "</div>\n<div>" + value.number + "</div>");
  },
  html2value: function(html) {},
  value2str: function(value) {
    var num, parcel, str;
    str = '';
    for (parcel in value) {
      num = value[parcel];
      str = "" + parcel + ":" + num + ";";
    }
    return str;
  },
  str2value: function(str) {},
  value2input: function(value) {
    if (!value) {
      return;
    }
    this.$input.filter('[name="parcel_service"]').val(value.parcel_service);
    return this.$input.filter('[name="number"]').val(value.number);
  },
  input2value: function() {
    return {
      parcel_service: this.$input.filter('[name="parcel_service"]').val(),
      number: this.$input.filter('[name="number"]').val()
    };
  },
  activate: function() {
    return this.$input.filter('[name="parcel_service"]').focus();
  },
  autosubmit: function() {
    return this.$input.keydown(function(e) {
      if (e.which === 13) {
        return $(this).closest('form').submit();
      }
    });
  }
});

Waybill.defaults = $.extend({}, $.fn.editabletypes.abstractinput.defaults, {
  tpl: '<div class="editable-waybill">\n  <label>\n    <select name="parcel_service">\n      <option value="현대">현대택배</option>\n      <option value="CJ">CJ택배</option>\n    </select>\n  </label>\n  <label>\n    <input type="text" name="number">\n  </label>\n</div>',
  inputclass: ''
});

$.fn.editabletypes.waybill = Waybill;
