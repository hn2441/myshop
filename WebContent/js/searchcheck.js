/**
 * insert.html 빈칸 입력페이지 입니다.
 */

	/* 빈칸 확인하는 함수 */
	function check() {
		var search = document.getElementById("no").value;
		
		/* 빈칸 있을시 알림 띄워줌 */
		if (search == "") {
			alert("내용을 입력해주세요.");
			return false;
		} else {
			return true;
		}
	}