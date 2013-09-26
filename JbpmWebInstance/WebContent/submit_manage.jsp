<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.jbpm.api.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请与驳回</title>
</head>
<body>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskService=processEngine.getTaskService();
	/* String username = (String) session.getAttribute("username"); */
	String taskId=request.getParameter("taskId");
	String result=request.getParameter("result");
	result=new String(result.getBytes("ISO-8859-1"),"UTF-8");
	taskService.completeTask(taskId,result);
	response.sendRedirect("index.jsp");


%>
</body>
</html>