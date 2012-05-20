$(document).ready(function(){
  if($(".users.new").length > 0){
	if(navigator.geolocation){
		console.log("blahhhhhhhhhhhhhhhhhhhh");
		navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
	}

	function successFunction(position){
		console.log(position);
		var lat = position.coords.latitude;
		var longitude = position.coords.longitude;
		$("#user_lat").val(lat);
		$("#user_long").val(longitude);

		alert(lat+ ", " + longitude)
	}
	
	function errorFunction(e){
		console.log(e);
                $("#user_lat").val("30.2704263");
		$("#user_long").val("-97.7349768");
	}
  }
});
