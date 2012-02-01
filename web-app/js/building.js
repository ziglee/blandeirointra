var torresCount = 0;

$(document).ready(function(){
    $('#torre-add').click(function() {
        ++torresCount;
        $('#torres-td').append('<input type="text" name="torres" id="torres-'+ torresCount +'" class="torres-text"/><input type="button" id="torres-'+ torresCount +'-del" class="torres-del-btn" value="-" onclick="removerTorre('+ torresCount +');"/>');
    });

    torresCount = $('.torres-text').size();
});

function removerTorre(id) {
    $('#torres-' + id).remove();
    $('#torres-' + id + '-del').remove();
}