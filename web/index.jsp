<%@ page import=" java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Александр
  Date: 05.04.2017
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <% Locale.setDefault(Locale.ENGLISH); %>
  <sql:setDataSource var="ds" url="jdbc:oracle:thin:@localhost:1521:XE"
                     driver="oracle.jdbc.OracleDriver"
                     user="nc" password="1"
  />
  <sql:query var="selection" dataSource="${ds}">
    SELECT d.DISH_NAME, d.DISH_COST, c.CAT_NAME FROM DISH d, CATEGORY c WHERE d.CAT_ID = c.ID_CAT
  </sql:query>
  <p>Список блюд</p>
  <table border="1" width="100%">
    <tr>
      <th>Блюдо</th>
      <th>Цена</th>
      <th>Категория</th>
    </tr>
    <c:forEach var="row" items="${selection.rows}">
      <tr>
        <td><c:out value="${row.dish_name}"/></td>
        <td><c:out value="${row.dish_cost}"/></td>
        <td><c:out value="${row.cat_name}"/></td>
      </tr>
    </c:forEach>
  </table>
  </body>
</html>
