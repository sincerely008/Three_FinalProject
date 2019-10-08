function idchk() {
	var id = $("#id").val();
	$.ajax({
		url : "login.do?command=idchk&id="+id,
		method : "post",
		success : function(msg) {
			alert(msg);
		}, error: function(msg) {
			alert(msg);
		}
	});
	
}

function nicknamechk(){
	var nickname = $("#nickname").val();
	$.ajax({
		url : "login.do?command=nicknamechk&nickname="+nickname,
		method : "post",
		success : function(msg) {
			alert(msg);
		}, error: function(msg) {
			alert(msg);
		}
	});
}