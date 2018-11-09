
$(function(){
  $(document).on('click', '.showModalButton', function(){

    if ($('#modal').hasClass('in')) {
        $('#modal').find('#modalContent')
                .load($(this).attr('value'));
        document.getElementById('modalHeader').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    } else {
        $('#modal').modal('show')
                .find('#modalContent')
                .load($(this).attr('value'));
        document.getElementById('modalHeader').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    }
});

});

$(function(){
  $(document).on('click', '.showModalButton2', function(){

    if ($('#modal2').hasClass('in')) {
        $('#modal2').find('#modalContent2')
                .load($(this).attr('value'));
        document.getElementById('modalHeader2').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    } else {
        $('#modal2').modal('show')
                .find('#modalContent2')
                .load($(this).attr('value'));
        document.getElementById('modalHeader2').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    }
});

});

$(function(){
  $(document).on('click', '.showModalButton3', function(){

    if ($('#modal3').hasClass('in')) {
        $('#modal3').find('#modalContent3')
                .load($(this).attr('value'));
        document.getElementById('modalHeader3').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    } else {
        $('#modal3').modal('show')
                .find('#modalContent3')
                .load($(this).attr('value'));
        document.getElementById('modalHeader3').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    }
});

});

$(function(){
  $(document).on('click', '.showModalButton4', function(){

    if ($('#modal4').hasClass('in')) {
        $('#modal4').find('#modalContent4')
                .load($(this).attr('value'));
        document.getElementById('modalHeader4').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    } else {
        $('#modal4').modal('show')
                .find('#modalContent4')
                .load($(this).attr('value'));
        document.getElementById('modalHeader4').innerHTML = '<h4>' + $(this).attr('title') + '</h4>';
    }
});

});
