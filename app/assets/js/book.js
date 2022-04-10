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
                jQuery('.add-book #test').text('Tested');
                jQuery('.add-book #book-author').val("Select year");
                jQuery('.add-book #book-year').val("Select author");
                console.log("Hey")
            },
            error: function(jqXHR, textStatus, errorThrown){
                alert("failsed")
            }
          })
      return false;
    })





}) 
