<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.jbpm.api.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ProcessEngine processEngine=Configuration.getProcessEngine();
ExecutionService executionService=processEngine.getExecutionService();
Map map=new HashMap();
map.put("owner", session.getAttribute("username"));;
executionService.startProcessInstanceById(request.getParameter("id"),map);
response.sendRedirect("index.jsp");

%>
</body>
</html>