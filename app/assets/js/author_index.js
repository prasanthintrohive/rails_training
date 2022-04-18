jQuery(document).ready(function () {
    jQuery(document).on("click", '#edit_author', function(){
        var auth_id = $(this).data('auth-id');
        $.ajax({
            type: "get", 
            url: "/author/ajax_edit/" + auth_id,
            data: {},
            success: function(data, textStatus, jqXHR){
            jQuery("#new-render").html(
                data
            )},
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })
})