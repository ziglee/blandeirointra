$(document).ready(function(){
    $('#empreendimento').change(empreendimentoChange); 

    $('#calendar').fullCalendar({
        dayClick: function(date, allDay, jsEvent, view) {
            var year = date.getFullYear();
            var month = 1 + date.getMonth();
            var day = date.getDate();
            $('#dataPrevista_year').val(year);
            $('#dataPrevista_month').val(month);
            $('#dataPrevista_day').val(day);
            $('#dataPrevista_value').val((day < 10 ? '0' + day : day) + '/' + (month < 10 ? '0' + month : month) + '/' + year);
        },
        titleFormat: {
            month: 'MMMM yyyy',
            week: "dd/MM/yyyy{ '&#8212;' dd/MM/yyyy}",
            day: 'dd/MM/yyyy'
        },
        columnFormat: {
            month: 'ddd',
            week: 'ddd dd/MM',
            day: 'dddd dd/MM'
        },
        timeFormat: { // for event elements
            '': 'HH(:mm)' // default
        },
        height: 300,
        weekMode: "variable",
        header: {
            left: '',
            center: 'title',
            right: 'prev,next today'
        },
        editable: false,
        buttonText: {
            today: "hoje",
            month: 'mês',
            week: 'semana',
            day: 'dia'
        },
        monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
        events: function(start, end, callback) {
            $.ajax({
                url: 'listaJson',
                dataType: 'json',
                data: {
                    start: start.getTime(),
                    end: end.getTime(),
                    buildingId: $('#empreendimento').val()
                },
                success: function(doc) {
                    var events = [];
                    $.each(doc, function(key, val) {
                        events.push({
                            title: '',
                            start: val.dataPrevista,
                            textColor: 'black',
                            className: 'fc-event-status-' + val.fase,
                            borderColor: 'black'
                        });
                    });
                    callback(events);
                }
            });
        }
    });   
});

function empreendimentoChange() {
    var id = $(this).val();
    retrieveTorres(id);

    $('#calendar').fullCalendar('removeEvents');
    $('#calendar').fullCalendar('refetchEvents');    
}

function retrieveTorres(id) {
    $.ajax({
        url: '/building/listTorres/' + id,
        dataType: 'json',
        success: function(doc) {
            $('#torre').empty();
            $.each(doc, function(k,v){
                $('#torre').append('<option value="'+ v +'">'+ v +'</option>');
            });
        }
    });
}