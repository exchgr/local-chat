$(document).ready(function() {
	if ($("body.chatrooms.show").length > 0) {
		setTimeout(updateChatroom, 1000);
		setTimeout(updateChatroomUsers, 1000);
		
		$("#send_message").click(function(e){
			e.preventDefault();
			sendMessage();
			return false;
		});
	}
	
	var message_count = $("#chatroom_message_count").val(); // This should be the count for the messages that already exist on the page
	var user_count = $("#chatroom_user_count").val();
	
	function updateChatroom() {
		var chatroom_number = $("input#chatroom_number").val();
		
		$.getJSON("/chatrooms/"+chatroom_number+"/ajax_update", function(data) {
			if (data.blank) { 
				console.log("empty");
			} else {
				if (data.count > message_count) {
					$("#chat-area").append("<p><span>"+data.username+"</span>: "+data.message+"</p>");
					console.log(data.message);
				}
				message_count = data.count
			}
			
			setTimeout(updateChatroom, 1000);
				
		});		
	}
	
	function updateChatroomUsers() {
		
		var chatroom_number = $("input#chatroom_number").val();
		
		$.getJSON("/chatrooms/"+chatroom_number+"/ajax_update_users", function(data) {
			if (data.count > user_count) {
				console.log(data.user);
			}
			user_count = data.count
			
			setTimeout(updateChatroom, 1000);	
		});		
		
	}
	
	function sendMessage() {
		var user_id = $("input#user_id").val();
		var message = $("textarea#sender").val();
		var chatroom_number = $("input#chatroom_number").val();
		
		$.ajax({
			type: "POST",
			url: "/chatrooms/"+chatroom_number+"/ajax_send_message",
			data: {
				'message': message,
				'user_id': user_id
			},
			dataType: "json",
			success: function(data) {
				$("textarea#sender").val("");
			}	
		});
	}
	
});


