jQuery(document).ready(function () {
    jQuery(document).on("click", '.add-ajax-link', function(){
        var title = $('.add-book #book-title').val();
        var author = $('#book-author').val();
        var year = $('#book-year').val();
        if(title == "", author == "", year ==""){
            jQuery.gritter.add({
                title: 'Missing Details',
                text: "Fill Your Details",
                sticky: false
            })
        return
        }
        $.ajax({
            type: "post", 
            url: "create_book",
            data: {book:{title:title, author_id:author, published_year :year}},
            success: function(data, textStatus, jqXHR){
                jQuery("#add-table").prepend(data);
                $('.add-book #book-title').val("");
                jQuery.gritter.add({
                    title: 'Notification',
                    text: "Book is Added",
                    sticky: false
                })    
            },
                
            error: function(jqXHR, textStatus, errorThrown){
                jQuery.gritter.add({
                    title: 'Error: ',
                    text: jqXHR.responseJSON.message,
                    sticky: false
                    });
            }
          })
    return false;
    })
}) 
