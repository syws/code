<%@page import="org.jbpm.api.model.ActivityCoordinates"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.jbpm.api.*" %>
<%@ page import="org.jbpm.api.model.*" %>
<%
	String id=request.getParameter("id");
	System.out.print(id+"view");
	 ProcessEngine processEngine=Configuration.getProcessEngine();
	RepositoryService repositoryService=processEngine.getRepositoryService();
	ExecutionService executionService=processEngine.getExecutionService();
	ProcessInstance processInstance=executionService.startProcessInstanceById(id);
	Set<String> activityNames=processInstance.findActiveActivityNames();
	ActivityCoordinates ac=repositoryService.getActivityCoordinates(processInstance.getProcessDefinitionId(), activityNames.iterator().next());

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<img  src="pic.jsp?id=<%=id%>"  style="position: absolute;left: 0px;top: 0px">
 <div style="position:absolute;border:1px solid red;left: <%=ac.getX()%>px;top:<%=ac.getY()%>px;width:<%=ac.getWidth()%>px;height:<%=ac.getHeight()%>px;"></div>
</body>
</html>