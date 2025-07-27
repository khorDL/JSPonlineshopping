<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
	<div id='container'>
		<div class='signup'>
			<form action="signupAction.jsp" method="post">
				<input type="text" placeholder="Enter name" name="name" required>
				<input type="email" placeholder="Enter email" name="email" required>
				<input type="number" placeholder="Enter number" name="mobileNumber"
					required> <select name="securityQuestions" required>
					<option value="What was your first car?">What was your
						first car?</option>
					<option value="What is the name of your first pet?">What
						is the name of your first pet?</option>
					<option value="What elementary school did you attend?">What
						elementary school did you attend?</option>
					<option value="What is the name of the town where you were born?">What
						is the name of the town where you were born?</option>
				</select> <input type="text" name="answer" placeholder="Enter answer"
					required> <input type="password" name="password"
					placeholder="Enter password" required> <input type="submit"
					value="Sign Up">

			</form>
			<h2>
				<a href="login.jsp">Login</a>
			</h2>
		</div>
		<div class='whysign'>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Successfully Registered !</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>

			<h1>Some thing Went Wrong! Try Again !</h1>
			<%
			}
			%>
			<h2>Online Shopping</h2>
			<p>The Online Shopping System is the application that allows the
				users to shop online without going to the shops to buy them.</p>
		</div>
	</div>

</body>
</html>