<%@page import="org.jbpm.api.task.Task"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.jbpm.api.*" %>

<%
ProcessEngine processEngine=Configuration.getProcessEngine();
RepositoryService repositoryService=processEngine.getRepositoryService();
ExecutionService executionService=processEngine.getExecutionService();
TaskService taskService=processEngine.getTaskService();
String username=(String)session.getAttribute("username");
List<ProcessDefinition> pdList=repositoryService.createProcessDefinitionQuery().list();
List<ProcessInstance> piList=executionService.createProcessInstanceQuery().list();
List<Task> taskList=taskService.findPersonalTasks(username);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="deploy.jsp">deploy</a> [username:<%=username%>]<a href="login.jsp">登陆</a>
	<table border="1" width="100%">
	<h1 align="center">流程定义</h1>
	<thead>
	<th>id</th>
	<th>name</th>
	<th>version</th>
	<th>操作</th>
	</thead>
	<%
	List<ProcessDefinition> list=repositoryService.createProcessDefinitionQuery().list();
	for(ProcessDefinition pd:list){
	%>
	<tr>
	<td><%=pd.getId()%></td>
	<td><%=pd.getName() %></td>
	<td><%=pd.getVersion()%></td>
	<td><a href="remove.jsp?id=<%=pd.getDeploymentId()%>">remove</a>
		<a href="start.jsp?id=<%=pd.getId()%>">start</a>
	</td>
	</tr>
	<%
	
	}
	%>
	</table>
	<table border="1" width="100%">
	<h1 align="center">流程实例</h1>
	<thead>
	<th>id</th>
	<th>activity</th>
	<th>state</th>
	<th>操作</th>
	</thead>
	<%
	
	for(ProcessInstance pi:piList){
	%>
	<tr>
	<td><%=pi.getId() %></td>
	<td><%=pi.findActiveActivityNames() %></td>
	<td><%=pi.getState() %></td>
	<td><a href="view.jsp?id=<%=pi.getId()%>">view</a>  </td>
	
	</tr>
	
	<%} %>
	</table>
	
	<table border="1" width="100%">
	<h1 align="center">代办任务</h1>
	<thead>
	<th>id</th>
	<th>name</th>
	<th>操作</th>
	</thead>
	<%
		for(Task task:taskList){
	%>
	
	<tr>
	<td><%=task.getId() %></td>
	<td><%=task.getName()%></td>
	<td><a href="<%=task.getFormResourceName()%>?id=<%=task.getId()%>">view</a></td>
	</tr>
	<%
		}
	%>	
	</table>
</body>
</html>