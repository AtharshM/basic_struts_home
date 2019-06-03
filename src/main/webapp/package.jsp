<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Package.jsp</title>

<script src="jquery-3.4.1.min.js" ></script>
<script>
$(document).ready(function(){
$('#submit').click(function(e){
    e.preventDefault();
    $.ajax({
        url:'Request_from_user.action',
        data: $("#selectPlace").serialize(), 
        type : "POST",
       
        success:function(data) {
        	
        	$('#div').html("The selected package has been submitted for the validation of admin so kindly wait for sometime");
        		
       
        },
        
        error: function(data){
            alert("An error occured: " + data.status + " " + data.statusText);
          },
    
    });
});

});













var id=setInterval(
	
		 function repeat(){
			 
		$.ajax({
			url : "Response_from_admin.action",
			type : "GET",
			data : "",
			success : function(data)
			{
				
				window.location.reload(true);
				if(data.includes("true"))
					{
				location.href = "success.jsp";
					}
				else if(data.includes("null"))
					{
					location.href = "package.jsp";
					}
				else
					{
					alert("THE CHOSEN PACKAGE HAS NOT BEEN APPROVED BY THE ADMIN ,SO KINDLY CHOOSE SOME OTHER PACKAGE..!!!")
					location.href = "package.jsp";
					}
				
			
					
					
				
			}
			
			
			
		});

		 }
		 ,7000);


</script>


</head>
<body>

<h1>Select the places you want to visit</h1>

<form action="Request_from_user" method="post">
  <select name="selectPlace" id="selectPlace" multiple="multiple" >
  <optgroup label="COUPLES">
    <option value="Sunrise island">Sunrise island</option>
    <option value="La la land">La la land</option>
    <option value="Beach">Beach</option>
    </optgroup>
    
    <optgroup label="KIDS">
        <option value="play ground">play ground</option>
    <option value="park">park</option>
    <option value="snow world">snow world</option>
    </optgroup>
  </select>
  
 
  <input type="submit" id="submit" value="Submit">
</form>


<div id="div">

</div>




</body>
</html>