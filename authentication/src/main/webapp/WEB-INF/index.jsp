<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Login and Registration</title>
</head>
<body>
<div class="p-3 mb-2 bg-danger text-white">
	<h1>Welcome!</h1>
	<p>Join our growing community.</p>
</div>
<div class="p-3 mb-2 bg-success text-white">
<h1>Register</h1>
<form:form action="/register" method="post" modelAttribute="newUser">
	<p>
 		<form:errors path="userName"/>
        <form:label path="userName">User Name</form:label>
        <form:input path="userName"/>
    </p>
    <p>
        <form:label path="email">Email:</form:label>
        <form:errors path="email"/>
        <form:input path="email"/>
    </p>
    <p>
        <form:label path="password">Password</form:label>
        <form:errors path="password"/>     
        <form:input type="password" path="password"/>
    </p>  
    <p>
        <form:label path="confirm">Confirm PW</form:label>
        <form:errors path="confirm"/>     
        <form:input type="password" path="confirm"/>
    </p>      
	<button class="btn btn-primary">Submit</button>
</form:form>
<h1>Login</h1>
<form:form action="/login" method="post" modelAttribute="newLogin">
    <p>
        <form:label path="email">Email:</form:label>
        <form:errors path="email"/>
        <form:input path="email"/>
    </p>
    <p>
        <form:label path="password">Password</form:label>
        <form:errors path="password"/>     
        <form:input type="password" path="password"/>
    </p>     
	<button class="btn btn-primary">Submit</button>
</form:form>
</div>
</body>
</html>