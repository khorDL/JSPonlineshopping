<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestions");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int auth = 0;
try {
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	PreparedStatement check = con.prepareStatement(
	"SELECT * FROM users WHERE email=? AND mobileNumber=? AND securityQuestion=? AND answer=?");
	check.setString(1, email);
	check.setString(2, mobileNumber);
	check.setString(3, securityQuestion);
	check.setString(4, answer);

	ResultSet rs = check.executeQuery();

	while (rs.next()) {
		auth = 1;
		PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
		ps.setString(1, newPassword);
		ps.setString(2, email);
		ps.executeUpdate();
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if (auth == 0) {
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");

}
%>