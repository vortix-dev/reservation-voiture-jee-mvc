package controller;

import dao.VoitureDAO;
import model.Voiture;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/voiture")
public class VoitureController extends HttpServlet {

    private VoitureDAO voitureDAO = new VoitureDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Ajouter une voiture
            String img = request.getParameter("img");
            String marque = request.getParameter("marque");
            String modele = request.getParameter("modele");
            BigDecimal prix = new BigDecimal(request.getParameter("prix"));
            boolean disponible = Boolean.parseBoolean(request.getParameter("disponible"));

            Voiture voiture = new Voiture(marque, modele, prix, disponible, img);
            voitureDAO.addVoiture(voiture);
            response.sendRedirect("admin_dashboard.jsp");
        } else if ("update".equals(action)) {
            // Mettre à jour une voiture
            int idVoiture = Integer.parseInt(request.getParameter("idVoiture"));
            String img = request.getParameter("img");
            String marque = request.getParameter("marque");
            String modele = request.getParameter("modele");
            BigDecimal prix = new BigDecimal(request.getParameter("prix"));
            boolean disponible = Boolean.parseBoolean(request.getParameter("disponible"));

            Voiture voiture = new Voiture(idVoiture, marque, modele, prix, disponible, img);
            voitureDAO.updateVoiture(voiture);
            response.sendRedirect("admin_dashboard.jsp");
        } else if ("delete".equals(action)) {
            // Supprimer une voiture
            int idVoiture = Integer.parseInt(request.getParameter("idVoiture"));
            voitureDAO.deleteVoiture(idVoiture);
            response.sendRedirect("admin_dashboard.jsp");
        }
    }
}

