<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jbpm.api.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

ProcessEngine processEngine=Configuration.getProcessEngine();
RepositoryService repositoryService=processEngine.getRepositoryService();
ExecutionService executionService=processEngine.getExecutionService();
String id=request.getParameter("id");
System.out.print(id+"pic");
ProcessInstance processInstance=executionService.findProcessInstanceById(id);
String processDefinitionId=processInstance.getProcessDefinitionId();
ProcessDefinition processDefinition=repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).uniqueResult();
InputStream inputStream=repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), "leave.png");
byte[] b = new byte[1024];  
int len=-1;
while((len=inputStream.read(b, 0, 1024))!=-1){	
	response.getOutputStream().write(b,0,1024);	
}
out.clear();
out=pageContext.pushBody();
%>
</body>
</html>