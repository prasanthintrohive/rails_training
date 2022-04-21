jQuery(document).ready(function () {
    jQuery(document).on("click", '.btn', function(){
   
        var name = $('.form-control').val();
        console.log($(this).html())
        if(name == ""){
            jQuery.gritter.add({
                title: 'Error: ',
                text: "Fill your column and Try again later",
                sticky: false
                });
                $('.form-control').css("border", "1px solid red");
        return false
        }
        $.ajax({
            type: "post", 
            url: "create_author",
            data: {author:{name: name}},
            success: function(data, textStatus, jqXHR){
                jQuery("#author_row").prepend( data);
                jQuery('.form-control').val("");
            jQuery.gritter.add({
                title: 'Notification',
                text: "New Author is Added to the List",
                sticky: false
            });
            $('.form-control').css("border",'1px solid #ced4da')
            
        }  
            ,
            error: function(jqXHR, textStatus, errorThrown){
                jQuery.gritter.add({
                    title: 'Error',
                    text: jqXHR.responseJSON.message,
                    sticky: false
                });
                $('.form-control').css("border", "1px solid red");
            }
          })
    return false;
    })
}) 
