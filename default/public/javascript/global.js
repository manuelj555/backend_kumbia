$(function(){
    $("#seleccionar_todos").on('change',function(){
        $('table tbody :checkbox').attr("checked",$("#seleccionar_todos").is(':checked'));
    })
});