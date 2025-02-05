<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.ReservationDAO" %>
<%@ page import="model.Reservation" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gérer les Réservations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-success text-white border-right" id="sidebar">
            <div class="sidebar-header text-center py-4">
                <h4>Gestion de Voitures</h4>
            </div>
            <div class="list-group list-group-flush">
                <a href="ajouter_voiture.jsp" class="list-group-item list-group-item-action text-white bg-success">Ajouter voiture</a>
                <a href="admin_dashboard.jsp" class="list-group-item list-group-item-action text-white bg-success">Gerer voiture</a>
                <a href="gerer_reservation.jsp" class="list-group-item list-group-item-action text-white bg-success">Gérer reservations</a>
                <a href="admin?action=logout" class="list-group-item list-group-item-action text-white bg-danger">Logout</a>
            </div>
        </div>

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-success text-white">
                <button class="btn btn-light" id="menu-toggle">☰</button>
                <a class="navbar-brand mx-auto text-white" href="#">Admin Dashboard</a>
            </nav>

            <div class="container-fluid mt-5">
                <h2 class="text-success">Gérer les Réservations</h2>

                <%
                    ReservationDAO reservationDAO = new ReservationDAO();
                    List<Reservation> reservations = reservationDAO.getAllReservations();

                    if (reservations != null && !reservations.isEmpty()) {
                %>
                    <table class="table table-bordered table-striped">
                        <thead class="bg-success text-white">
                            <tr>
                                <th>Image</th>
                                <th>Nom Client</th>
                                <th>Voiture</th>
                                <th>Date</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int count = 1; 
                                for (Reservation reservation : reservations) { 
                            %>
                                <tr>
                                    <td><img src="<%= reservation.getImg() %>" width="50" alt="Voiture"></td>
                                    <td><%= reservation.getNomClient() %></td>
                                    <td><%= reservation.getModeleVoiture() %></td>
                                    <td><%= reservation.getDateReservation() %></td>
                                    <td>
                                        <span class="badge bg-<%= "Acceptee".equals(reservation.getStatut()) ? "success" : ("Refusee".equals(reservation.getStatut()) ? "danger" : "warning") %>">
                                            <%= reservation.getStatut() %>
                                        </span>
                                    </td>
                                    <td>
                                        <% if ("attente".equals(reservation.getStatut())) { %>
                                            <form action="reservation" method="POST" style="display:inline;">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="idReservation" value="<%= reservation.getIdReservation() %>">
                                                <input type="hidden" name="statut" value="Acceptee">
                                                <button type="submit" class="btn btn-success btn-sm">Accepter</button>
                                            </form>

                                            <form action="reservation" method="POST" style="display:inline;">
                                                <input type="hidden" name="action" value="update">
                                                <input type="hidden" name="idReservation" value="<%= reservation.getIdReservation() %>">
                                                <input type="hidden" name="statut" value="Refusee">
                                                <button type="submit" class="btn btn-danger btn-sm">Refuser</button>
                                            </form>
                                        <% } else { %>
                                            <span class="text-muted">Aucune action</span>
                                        <% } %>
                                    </td>
                                </tr>
                            <% 
                                } 
                            %>
                        </tbody>
                    </table>
                <% 
                    } else {
                        out.println("<p class='text-muted'>Aucune réservation en attente.</p>");
                    }
                %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle Sidebar (Mobile version)
        document.getElementById('menu-toggle').addEventListener('click', function () {
            document.getElementById('sidebar').classList.toggle('toggled');
        });
    </script>

    <style>
        #wrapper {
            display: flex;
            width: 100%;
        }
        #sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
        }
        #page-content-wrapper {
            width: 100%;
            margin-left: 250px;
        }
        #sidebar.toggled {
            width: 0;
            display: none;
        }
        #menu-toggle {
            background: #198754;
            color: white;
            border: none;
            padding: 10px;
            font-size: 20px;
        }
    </style>
</body>
</html>