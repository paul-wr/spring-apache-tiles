<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/script/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function onLoad() {

		$("#password").keyup(checkPasswordsMatch);
		$("#confirmpass").keyup(checkPasswordsMatch);

		$("#details").submit(canSubmit);
	}
	
	function canSubmit() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		
		if(password != confirmpass) {
			alert("Passwords do not match!")
			return false;
		}
		else {
			return true;
		}
	}

	function checkPasswordsMatch() {
		var password = $("#password").val();f
		var confirmpass = $("#confirmpass").val();

		if (password.length > 3 || confirmpass.length > 3) {

			if (password == confirmpass) {
				$("#matchpass").text("<fmt:message key="MatchedPasswords.user.password" />");
				$("#matchpass").addClass("valid");
				$("#matchpass").removeClass("error");
			} else {
				$("#matchpass").text("<fmt:message key="UnmatchedPasswords.user.password" />");
				$("#matchpass").addClass("error");
				$("#matchpass").removeClass("valid");
			}
		}
	}

	$(document).ready(onLoad);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Offer</title>
</head>
<body>
<br/>

<h2>Create New Account</h2>
	<sf:form id="details" method="post"
		action="${pageContext.request.contextPath}/createaccount" commandName="user">
		<table class="formtable">
			<tr>
				<td>Username: <sf:input type="text"  path="username" name="username" /><br/><div class="error"><sf:errors path="username"></sf:errors></div>
				</td>
			</tr>
			<tr>
				<td>Email: <sf:input type="text" path="email" name="email" /><br/><div class="error"><sf:errors path="email"></sf:errors></div>
				</td>
			</tr>
			<tr>
				<td>Password: <sf:input type="password" path="password" name="password" /><br/><div class="error"><sf:errors path="password"></sf:errors></div>
				</td>
			</tr>
			<tr>
				<td>Confirm Password: <input type="password" id="confirmpass" name="confirmpass" />
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><input value="Create account" type="submit""/></td>
			</tr>
		</table>
	</sf:form>
	<div id="matchpass"></div>
</body>
</html>