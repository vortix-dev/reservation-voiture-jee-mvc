<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Voiture" %>
<%@ page import="dao.VoitureDAO" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse mx-auto" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="index.jsp">Accueil</a>
                    </li>
                    
                    <% 
                        Integer username = (Integer) session.getAttribute("client");
                        if (username == null) { 
                    %>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="login_client.jsp">Se connecter</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="inscription.jsp">Inscrire</a>
                        </li>
                    <% 
                        } else { 
                    %>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="mes_reservations.jsp">Mes Réservations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger fw-bold" href="ClientServlet?action=logout">Logout</a>
                        </li>
                    <% 
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <div class="container mt-5">
        <h1 class="text-center mb-4">Nos Voitures Disponibles</h1>

        <% 
            VoitureDAO voitureDAO = new VoitureDAO();
            List<Voiture> voitures = voitureDAO.getAllVoitures();

            if (voitures != null && !voitures.isEmpty()) {
        %>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <% 
                    for (Voiture voiture : voitures) {
                %>
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="<%= voiture.getImg() %>" class="card-img-top" alt="Voiture Image" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title"><%= voiture.getMarque() + " " + voiture.getModele() %></h5>
                                <p class="card-text"><strong>Prix:</strong> <%= voiture.getPrix() %> €</p>
                                <p class="card-text">
                                    <strong>Disponibilité:</strong> 
                                    <span class="badge <%= voiture.isDisponible() ? "bg-success" : "bg-danger" %>">
                                        <%= voiture.isDisponible() ? "Disponible" : "Non disponible" %>
                                    </span>
                                </p>
                                <a href="reservation_voiture.jsp?id=<%= voiture.getIdVoiture() %>" class="btn btn-success w-100">Réserver</a>
                            </div>
                        </div>
                    </div>
                <% 
                    }
                %>
            </div>
        <% 
            } else {
        %>
            <p class="text-center text-muted">Aucune voiture disponible pour le moment.</p>
        <% 
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
