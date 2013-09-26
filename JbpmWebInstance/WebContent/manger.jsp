<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.jbpm.api.*" %>
<%@page import="org.jbpm.api.task.Task"%>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskService=processEngine.getTaskService();
	String taskId=request.getParameter("id");
	Task task=taskService.getTask(taskId);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>

<legend>经理审批</legend>
<form action="submit_manage.jsp" method="post">
<input type="hidden" name="taskId"  value="${param.id}">
申请人：<%=taskService.getVariable(taskId, "owner") %></br>
请假天数:<%=taskService.getVariable(taskId, "day") %></br>
请假原因：<%=taskService.getVariable(taskId, "reason") %></textarea>
<input name="result" type="submit" value="批准"/><input name="result" type="submit" value="驳回"/>
</form>
</fieldset>
</body>
</html>