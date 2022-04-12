
jQuery(document).ready(function () {
    jQuery(document).on("change", '#show_deleted', function(){
        alert($(this).text());
        var checked = $('#check_id').val();
        $.ajax({
            type: "get", 
            url: '/show_deleted',
            data: {value: $(this).text()},
            success: function(data, textStatus, jqXHR){alert('success')},
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })
})