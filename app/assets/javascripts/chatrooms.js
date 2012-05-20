$(document).ready(function() {
	if ($("body.chatrooms.show").length > 0) {
		setTimeout(updateChatroom(), 10000);	
	}
	
	function updateChatroom() {
		var chatroom_number = $("input#chatroom_number").val();
		var user_id = $("input#user_id").val();
		var message = $("textarea#sender").html();
		
		$.ajax({
				type: "POST",
				url: "/chatrooms/"+chatroom_number+"/ajax_update",
				data: {
					'message':message,
					'user_id':user_id
				},
				dataType: "json",
				success: function(data) {
					console.log*~(data.message);
					
					setTimeout(updateChatroom(), 10000);
				}
		});
		
		
	}
});
