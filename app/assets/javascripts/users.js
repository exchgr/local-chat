$(document).ready(function(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(successFunction);
	}

	function successFunction(position){
		var lat = position.coords.latitude;
		var longitude = position.coords.longitude;
        $("#user__lat").val(lat);
		$("#user__long").val(longitude);

		alert(lat+ ", " + longitude);

	}
   


	
});
