
jQuery(document).ready(function () {
    jQuery(document).on("change", '#show_deleted', function(){
        alert($(this).text());
        $.ajax({
            type: "get", 
            url: "/ajax_book",
            data: {value: $(this).text()},
            success: function(data, textStatus, jqXHR){alert('success')},
            error: function(jqXHR, textStatus, errorThrown){alert('failed')}
          })
      return false;
    })
})