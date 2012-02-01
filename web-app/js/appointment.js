$(document).ready(function(){
    $('#empreendimento').change(retrieveTorres);
});

function retrieveTorres() {
    $.ajax({
        url: '/blandeirointra/building/listTorres/' + $(this).val(),
        dataType: 'json',
        success: function(doc) {
            $('#torre').empty();
            $.each(doc, function(k,v){
                $('#torre').append('<option value="'+ v +'">'+ v +'</option>');
            });
        }
    });
}