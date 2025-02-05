package controller;

import dao.ClientDAO;
import model.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ClientServlet/*")
public class ClientController extends HttpServlet {

    private ClientDAO clientDAO = new ClientDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // معالجة التسجيل
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            String motDePasse = request.getParameter("motDePasse");

            Client client = new Client(nom, prenom, email, motDePasse);
            clientDAO.addClient(client);
            response.sendRedirect("login_client.jsp");
         }else if ("login".equals(action)) {
                // Traitement de la connexion
                String email = request.getParameter("email");
                String motDePasse = request.getParameter("motDePasse");

                Client client = clientDAO.getClientByEmailAndPassword(email, motDePasse);

                if (client != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", client.getEmail());
                    session.setAttribute("client", client.getIdClient());  // تخزين كائن العميل في الجلسة
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("errorMessage", "Identifiants invalides");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

         }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}
