<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>

<%  
    if (session.getAttribute("user") == null) {
        response.sendRedirect("inscription.jsp");
    } else {
        Integer clientId = (Integer) session.getAttribute("client");
        if (clientId != null) {
            // استرجاع حجوزات العميل
            ReservationDAO reservationDAO = new ReservationDAO();
            List<Reservation> reservations = reservationDAO.getReservationById(clientId);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Réservations</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="mes_reservations.jsp">Mes Réservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ClientServlet?action=logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h1>Mes Réservations</h1>

        <% 
            if (reservations != null && !reservations.isEmpty()) {
        %>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Img</th>
                        <th>Voiture</th>
                        <th>Date</th>
                        <th>Statut</th>
                    </tr>
                </thead>
                <tbody>
			        <% int count = 1; 
			           for (Reservation reservation : reservations) { 
			        %>
			            <tr>
			                <td><%= count++ %></td>
			                <td>
			                    <img src="<%= reservation.getImg() %>" alt="Image de la voiture" width="50">
</td><td>			                    <%= reservation.getMarqueVoiture() %>
			                </td>
			                <td><%= reservation.getDateReservation() %></td>
			                <td><%= reservation.getStatut() %></td>
			            </tr>
			        <% 
			           } 
			        %>
			    </tbody>
            </table>
        <% 
        } else {
            out.println("<p>Aucune réservation trouvée.</p>");
        }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<% } } %>
