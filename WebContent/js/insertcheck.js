/**
 * insert.html 빈칸 입력페이지 입니다.
 */

	/* 빈칸 확인하는 함수 */
	function check() {
		var title = document.getElementById("title").value;
		var price = document.getElementById("price").value;
		var content = document.getElementById("content").value;
		var img = document.getElementById("img").value;
		/* 빈칸 있을시 알림 띄워줌 */
		if (title == "" || price == "" || content == "" || img == "") {
			alert("빈칸이 있습니다. 확인해주세요.");
			return false;
		} else {
			return true;
		}
	}