
function getJsonInfo01(){
	$.getJSON("json/product01.json",function(infoData){
		$.ajax({
			url : "dummydata01.do",
			method : "post",
			data : {"info" : JSON.stringify(infoData)},
			success : function(msg){
				alert(msg);
			},
			error : function(){
				alert("1번 실패")
			}
		});
	});
}