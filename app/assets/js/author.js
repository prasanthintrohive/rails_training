jQuery(document).ready(function () {
    jQuery(document).on("click", '.btn', function(){
        var name = $('.form-control').val();
        $.ajax({
            type: "post", 
            url: "create_author",
            data: {author:{name: name}},
            success: function(data, textStatus, jqXHR){
                jQuery('#auth_name').val("");
                jQuery("#author_row").prepend(
                    data
                );
                jQuery.gritter.add({
                    title: 'Notification',
                    text: "New Author is Added to the List",
                    sticky: false
                })
                console.log(data)
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("failed")
            }
          })
    return false;
    })
}) 
