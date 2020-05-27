package br.com.eberoliveira.webApp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String form = "<form method=\"post\">\n" +         
				"<label>Usuário</label>" +
				"<input type=\"text\" name=\"usuario\"> <br>" + 
				"<label>Senha</label>" +  
				"<input type=\"password\" name=\"senha\"> <br>" +
				"<button type=\"submit\" name=\"submit\">Acessar</button>\n" +    
				"<button type=\"reset\">Reset</button>" +     
				"</form";

		response.getWriter().append("<h1>Tela de Login</h1>").append(form);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 
		response.setContentType("text/html");
		
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String usuarioEsperado = "Admin";
		String senhaEsperada = "admin";
		
		
		if (senhaEsperada.equals(senha) && usuarioEsperado.equals(usuario)){
			//Usuario foi valido
			response.getWriter().append("<h3>Bem vindo, " + usuario + "</h3>").append("Login efetuado com sucesso!");
		}else {
			//indica que a nossa resposta é um HTML e não em texto simples
			
			response.getWriter().append("<span style=\" color: red;\">Usuário ou senha Inválidos. Tente Novamente.</span>");
			//Anexar o titulo e o formulario
			doGet(request, response);
		}
		
		
	}

}
