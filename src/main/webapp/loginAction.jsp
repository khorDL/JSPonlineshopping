<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if("admin@gmail.com".equals(email)&& "admin".equals(password))
{
	//if the user is admin will redirect to it's home page
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else{
	int z=0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st = con.createStatement();
		//if user do not exist z will not get 1
		PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
		pst.setString(1, email);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		if(z==0){
			response.sendRedirect("login.jsp?msg=notexist");
		}
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>