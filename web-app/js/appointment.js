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

            var timeToRemove = new Array();
            var allevents = $('#calendar').fullCalendar('clientEvents');
            for(var x = 0; x < allevents.length; x++) {
                var thisEventDate = allevents[x].start;
                if (year == thisEventDate.getFullYear() && month == 1 + thisEventDate.getMonth() && day == thisEventDate.getDate()){
                    var min = thisEventDate.getMinutes();
                    if (min < 10)
                        min = '0' + min;
                    var hour = thisEventDate.getHours();
                    if (hour < 10)
                        hour = '0' + hour;
                    timeToRemove.push(hour + ':' + min)
                }
            }

            var timeOptions = ['08:00','08:30','09:00','09:30','10:00','10:30','11:00','11:30','12:00','12:30','13:00','13:30','14:00','14:30','15:00','15:30','16:00','16:30','17:00'];

            $('#dataPrevista_time').empty();
            for(var x = 0; x < timeOptions.length; x++) {
                var time = timeOptions[x];
                var remove = false;
                for(var y = 0; y < allevents.length; y++) {
                    if (time == timeToRemove[y]) remove = true;
                }
                if (!remove)
                    $('#dataPrevista_time').append('<option value="'+ time +'">'+ time +'</option>');
            }
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