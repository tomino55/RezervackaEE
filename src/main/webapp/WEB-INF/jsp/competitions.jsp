<%--
  Created by IntelliJ IDEA.
  User: tomas
  Date: 9.4.2016
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@	taglib	prefix="c"	uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta	http-equiv="Content-Type"	content="text/html;	charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <title>Competitions</title>
</head>
<body>
<section>
       <c:forEach items="${competitions}" var="competition">
           <p>${competition.name}</p>
       </c:forEach>
</section>
</body>
</html>