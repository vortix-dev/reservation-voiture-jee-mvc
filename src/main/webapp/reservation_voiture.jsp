<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Voiture" %>
<%@ page import="model.Client" %>
<%@ page import="dao.VoitureDAO" %>
<%@ page import="model.Reservation" %>
<%@ page import="dao.ReservationDAO" %>
<%  if (session.getAttribute("user") == null) {
	    response.sendRedirect("inscription.jsp");
	} %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réservation de Voiture</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse mx-auto" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Accueil</a>
                    </li>
                    <% 
                        String username = (String) session.getAttribute("user");
                        if (username == null) { 
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="login_client.jsp">Se connecter</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="inscription.jsp">Inscrire</a>
                        </li>
                    <% 
                        } else { 
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="mes_reservations.jsp">Mes Réservations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ClientServlet?action=logout">Logout</a>
                        </li>
                    <% 
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1>Réservez Votre Voiture</h1>

        <% 
            // الحصول على معرف السيارة من معلمة URL
            String idVoitureStr = request.getParameter("id");
            int idVoiture = Integer.parseInt(idVoitureStr);
            VoitureDAO voitureDAO = new VoitureDAO();
            Voiture voiture = voitureDAO.getVoitureById(idVoiture);

            if (voiture != null) {
        %>
            <div class="card mb-4">
                <img src="<%= voiture.getImg() %>" class="card-img-top" alt="Voiture Image" style="height: 200px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= voiture.getMarque() + " " + voiture.getModele() %></h5>
                    <p class="card-text">Prix: <%= voiture.getPrix() %> €</p>
                    <p class="card-text">Disponibilité: <%= voiture.isDisponible() ? "Disponible" : "Non disponible" %></p>
                </div>
            </div>

            <% 
            if (username != null) { 
                // تم تعريف session مسبقًا في مكان آخر، لذا لا داعي لتعريفه هنا مجددًا
    			Integer client = (Integer) session.getAttribute("client");
                if (client == null) { 
                    out.println("<p>"+client+"</p>");
                } else {
            %>
                    <form action="reservation?action=add" method="POST">
				        <input type="hidden" name="idClient" value="<%= client %>">
				        <input type="hidden" name="idVoiture" value="<%= voiture.getIdVoiture() %>">
				        <div class="mb-3">
				            <label for="dateReservation" class="form-label">Date de Réservation</label>
				            <input type="date" class="form-control" id="dateReservation" name="dateReservation" required>
				        </div>
				        <button type="submit" class="btn btn-primary">Réserver</button>
				    </form>
            <% 
                } 
                } else {
            %>
                <p>Veuillez vous connecter pour effectuer une réservation.</p>
            <% 
                }
            %>
        <% 
            } else {
        %>
            <p>Voiture non trouvée.</p>
        <% 
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
