<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Info</title>
</head>
<body>
	<% 
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String numStr = request.getParameter("phone");
		if (name == null || address == null || numStr == null) {
			request.setAttribute("name", "");
			request.setAttribute("address", "");
			request.setAttribute("phone", "");
		} else {
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("phone", numStr);
		}
	%>
	<form action="index.jsp" method="get">
		<label>Name</label>
		<input type='text' name='name' value='<%=request.getAttribute("name")%>'><br />
		<label>Address</label>
		<input type='text' name='address' value='<%=request.getAttribute("address")%>'> <br />
		<label>Mobile No.</label>
		<input type='text' name='phone' value='<%=request.getAttribute("phone")%>'><br />
		<input type='submit' value='submit'>
	</form>
	<%
		String message = "Customer Information is not valid.";
		boolean valid = false;
		boolean start = false;
		if (name == null || address == null || numStr == null) {
		} else if (name.isEmpty() || address.isEmpty() || numStr.isEmpty()){
			start = true;
		}
		else {
			start = true;
			try{
				int num = Integer.parseInt(numStr);
				valid = true;
				out.println("<h1>Customer info</h1><br />"+
					"Customer Name: " + name +
					"<br />Customer address: " + address + 
					"<br />Customer number: " + num);
			}catch (Exception e){
				message = "Phone must be a number.";
			}
		}
		
		if (!valid && start){
			out.println("<h1 style='color:red'> " + message + "</h1>");
		}
		
	%>
</body>
</html>