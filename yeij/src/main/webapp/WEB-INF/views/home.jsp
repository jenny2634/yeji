<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4d94ff;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 20%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>


<h1 style="text-align: center">
	HI, I'M YEJI<br> Enjoy your life!

</h1>

<button onclick="document.getElementById('id01').style.display='block'">Login</button>
<br>
<button onclick="document.getElementById('id02').style.display='block'">SignUp</button>

<!-- 로그인모달 -->

<div id="id01" class="modal">
	<form method="post" id="frmLogin" class="modal-content animate"
		action="http://localhost:8080/yeji/login">
		<div class="imgcontainer">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="close" title="Close Modal">&times;</span> <img
				src="resources/image/2.jpg" alt="avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname" required> <label
				for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="psw" required>
			<button type="submit" id="btnLogin">Login</button>
		</div>

		<div class="container" style="background-color: #b3e6ff">
			<button type="button"
				onclick="document.getElementById('id01').style.display='none'"
				class="cancelbtn">Cancel</button>
		</div>
	</form>
</div>

<div id="id02" class="modal">
	<form method="post" id="frmJoin" class="modal-content"
		action="http://localhost:8080/yeji/join">
		<div class="imgcontainer">
			<span onclick="document.getElementById('id02').style.display='none'"
				class="close" title="Close Modal">&times;</span>
		</div>
		<div class="container">
			<h1>Sign Up</h1>
			<p>Please fill in this form to create an account.</p>
			<hr>
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" id="uname" name="uname" required>
				<button type="button" id="checkid" class="cancelbtn">Check</button><br>
			<label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" id="psw" name="psw" required> <label
				for="psw-repeat"><b>Repeat Password</b></label> 
				<p id='msg' style="color:red"></p>
				<input
				type="password" placeholder="Repeat Password" name="psw-repeat"
				required>

			<div class="clearfix">
				<button type="button"
					onclick="document.getElementById('id02').style.display='none'"
					class="cancelbtn">Cancel</button>
				<button type="submit" id="btnJoin" class="signupbtn">Sign
					Up</button>
			</div>
		</div>
	</form>
</div>


<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('[name=psw-repeat]').keyup(function() {
			var psw = $('#psw').val();
			var repeatPw = $(this).val();
			if(psw != repeatPw) {
				$('#msg').text('비밀번호가 다릅니다');
			} else {
				$('#msg').text('');
			}
		})
		
		$('#btnLogin').click(function() {
			var action = $('#frmLogin').attr("action");
			var form_data = {
				"uname" : $('[name=uname]').val(),
				"psw" : $('[name=psw]').val()
			};
			$.ajax({
				type : "POST",
				url : action,
				data : form_data,
				success : function(res) {
					if (res == "success") {
						alert("로그인 성공!");
						location = "main"
					} else {
						alert("아이디 또는 비밀번호가 잘못되었습니다");
					}
				},
				error : function() {
					alert("Error");
				}
			});
			return false;

		});
		
		$('#btnJoin').click(function() {
			var action = $('#frmJoin').attr("action");
			var form_data = {
				"uname" : $('#uname').val(),
				"psw" : $('#psw').val()
			};
			$.ajax({
				type : "POST",
				url : action,
				data : form_data,
				success : function(res) {
					if (res == "success") {
						alert("회원가입 성공!");
						document.getElementById('id02').style.display='none';
					} else {
						alert("회원가입 실패!");
					}
				},
				error : function() {
					alert("Error");
				}
			});
			return false;
		});
	});
</script>


<script>
	// Get the modal
	var modal1 = document.getElementById('id01');
	var modal2 = document.getElementById('id02');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal1) {
			modal1.style.display = "none";
		}
		if (event.target == modal2) {
			modal2.style.display = "none";
		}
	}
	
</script>


