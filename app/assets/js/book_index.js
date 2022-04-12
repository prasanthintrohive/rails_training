
jQuery(document).ready(function () {
    jQuery(document).on("change", '#show_deleted', function(){
        var checked = $('#show_deleted').is(":checked");
        $.ajax({
            type: "get", 
            url: '/show_deleted',
            data: {show_deleted: checked},
            success: function(data, textStatus, jqXHR){
            jQuery("#add-table").html(
                data
            )},
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })
})