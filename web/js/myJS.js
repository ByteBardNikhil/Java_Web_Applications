
function doLike(pid, uid)
{
  
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };
    Pid = pid;


    $.ajax({
        url: "LikeServlet",
        data: d, success: function (data, textStatus, jqXHR) {

     
    
        }, error: function (jqXHR, textStatus, errorThrown) {
            console.log(data + "Error");
        }
    });

}

    
    
    


   








