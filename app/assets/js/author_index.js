jQuery(document).ready(function () {
    jQuery(document).on("click", '#edit_author', function(){
        before_edit = $(this).parent().html();
         auth_id = $(this).data('auth-id');
        $.ajax({
            type: "get", 
            url: "/author/ajax_edit/" + auth_id,
            data: {},
            success: function(data, textStatus, jqXHR){
            jQuery("#"+auth_id).html( data )
        },
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })

    jQuery(document).on("click", '#update_btn', function(){
        var author_name = $('#author_name').val();
        if(author_name == ""){
            jQuery.gritter.add({
                title: 'Missing Details',
                text: "Fill Your Details.....",
                sticky: false
            })
        return
        }
        $.ajax({
            type: "patch", 
            url: "/author/ajax_edit/" + auth_id,
            data: {author:{name:author_name}},
            success: function(data, textStatus, jqXHR){
            jQuery("#"+auth_id).html( data )
                jQuery.gritter.add({
                    title: 'Notification',
                    text: "Author updated successfully!!!!!",
                    sticky: false
                })    
            },
                
            error: function(jqXHR, textStatus, errorThrown){alert('failed')
                jQuery.gritter.add({
                    title: 'Error: ',
                    text: jqXHR.responseJSON.message,
                    sticky: false
                    });
            }
          })
    return false;
    })

    jQuery(document).on("click", '#cancel_btn', function(){
        $.ajax({
            data: {},
            success: function(data, textStatus, jqXHR){
            jQuery("#"+auth_id).html(before_edit)
        },
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })
}) 
