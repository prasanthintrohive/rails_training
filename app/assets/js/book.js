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
                console.log(title)
                if(title == "", author == "", year ==""){
                    jQuery.gritter.add({
                        title: 'Error: ',
                        text: 'Please fill Your details coorectly and Try again',
                        sticky: false
                        });
                }
                else{
                    jQuery("#add-table").prepend(
                        data
                    );
                    jQuery.gritter.add({
                        title: 'Notification',
                        text: "Book is Added",
                        sticky: false
                    })
                $('.add-book #book-title').val("");
                }
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert('failed')
            }
          })
    return false;
    })
}) 
