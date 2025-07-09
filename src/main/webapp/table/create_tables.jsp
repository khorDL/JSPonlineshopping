<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    String q1 = "CREATE TABLE users (" +
                "name VARCHAR(100), " +
                "email VARCHAR(100) PRIMARY KEY, " +
                "mobileNumber BIGINT, " +
                "securityQuestion VARCHAR(200), " +
                "answer VARCHAR(200), " +
                "password VARCHAR(200), " +
                "address VARCHAR(200), " +
                "city VARCHAR(100), " +
                "state VARCHAR(100), " +
                "country VARCHAR(100)" +
                ")";
    out.println(q1); // or use log
    st.execute(q1);
    out.println("Table created successfully");
    con.close();
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
