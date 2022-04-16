jQuery(document).ready(function () {
    jQuery(document).on("click", '.add-ajax-link', function(){
        var title = $('.add-book #book-title').val();
        var author = $('#book-author').val();
        var year = $('#book-year').val();
        $.ajax({
            type: "post", 
            url: "create_book",
            data: {book:{title:title, author_id:author, published_year :year}},
            success: function(data, textStatus, jqXHR){
                $('.add-book #book-title').val("");
                jQuery("#add-table").prepend(
                    data
                );
                jQuery.gritter.add({
                    title: 'Notification',
                    text: "Book is Added",
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