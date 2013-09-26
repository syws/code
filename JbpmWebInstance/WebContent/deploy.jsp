<%@page import="java.util.zip.ZipInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.jbpm.api.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		ProcessEngine processEngine = Configuration.getProcessEngine();
		RepositoryService repositoryService = processEngine
				.getRepositoryService();
		/* repositoryService.createDeployment()
				.addResourceFromClasspath("leave.jpdl.xml").deploy(); */
		ZipInputStream zis=new ZipInputStream(this.getClass().getResourceAsStream("/leave.zip"));
		repositoryService.createDeployment().addResourcesFromZipInputStream(zis).deploy();

		response.sendRedirect("index.jsp");
	%>
</body>
</html>