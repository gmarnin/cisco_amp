<div id="cisco_amp-tab"></div>
<h2 data-i18n="cisco_amp.title"></h2>

<table id="cisco_amp-tab-table"></table>

<script>
$(document).on('appReady', function(){
    $.getJSON(appUrl + '/module/cisco_amp/get_data/' + serialNumber, function(data){
        var table = $('#cisco_amp-tab-table');
        $.each(data, function(key,val){
            var th = $('<th>').text(i18n.t('cisco_amp.column.' + key));
            var td = $('<td>').text(val);
            table.append($('<tr>').append(th, td));
        });
    });
});
</script>
