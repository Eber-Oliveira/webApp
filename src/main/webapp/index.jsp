<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;
charset=UTF-8">
<title>Login</title>

<!.. Dependencias do Bootstrap ..>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<c:set var="erro" value="${null}" />

<!..Pessoa clicou em entrar ..>
<c:if
	test="${\"POST\".equalsIgnoreCase(pageContext.request.method) && pageContext.request.getParameter(\"submit\") != null}">

	<!..Cria um objeto com usuário e senha ..>
	<jsp:useBean id="loginBean"
		class="br.com.eberoliveira.webApp.bean.LoginBean">
		<jsp:setProperty name="loginBean" property="*" />
	</jsp:useBean>

	<!..Decisão ..>
	<c:choose>
		<c:when test="${!loginBean.isValid()}">
			<c:set var="erro" value="Usuário ou Senha inválidos. Tente novamente" />
		</c:when>
		<c:otherwise>
			<c:redirect url="/boas-vindas.jsp"></c:redirect>
		</c:otherwise>
	</c:choose>

</c:if>

<body>
	<form method="post" class="text-center">
		<div>
			<h2 class="jumbotron">Login</h2>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon1">Usuário</span>
			</div>
			<input type="text" class="form-control" placeholder="Usuário"
				aria-label="Usuário" aria-describedby="basic-addon1" name="usuario">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="basic-addon2">Senha</span>
			</div>
			<input type="password" class="form-control" placeholder="Senha"
				aria-label="Senha" aria-describedby="basic-addon2" name="senha">
		</div>


		<button type="submit" name="submit" class="btn btn-primary">Acessar</button>
		<button type="reset" class="btn btn-warning">Reset</button>

	</form>

	<!.. Dependencias Bootstrap ..>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>


</body>
</html>
