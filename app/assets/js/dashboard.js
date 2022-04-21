jQuery(document).ready(function(){
    $(document).on('click',this,function(){
        $('#user-row').fadeToggle()
        $('#show').text('text')
    })
jQuery(document).on('change','#users',function(){
    var user_id = this.value
    $.ajax({
        type: "get", 
        url: "/home/dashboard",
        data: {user_id: user_id},
        success: function(data, textStatus, jqXHR){    
            $('#user_details').html(data)
            $('#user_details').fadeToggle()
    },
    error: function(jqXHR, textStatus, errorThrown){
        alert('failed')
    }
  })


//   jQuery(document).on
})
})  