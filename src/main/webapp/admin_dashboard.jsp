<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Voiture" %>
<%@ page import="dao.VoitureDAO" %>
    <%  if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    } %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Voitures</title>
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
        <h1 class="text-success">Liste des Voitures</h1>
        <h2>Voitures Disponibles</h2>
        <table class="table table-bordered table-striped">
            <thead class="bg-success text-white">
                <tr>
                    <th>Image</th>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Prix</th>
                    <th>Disponible</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                 <% 
                    VoitureDAO voitureDAO = new VoitureDAO();
                    List<Voiture> voitures = voitureDAO.getAllVoitures();
                    if (voitures != null && !voitures.isEmpty()) {
                       for (Voiture voiture : voitures) {
                 %>
                    <tr>
                        <td><img src="<%= voiture.getImg() %>" alt="Voiture Image" width="50"></td>
                        <td><%= voiture.getMarque() %></td>
                        <td><%= voiture.getModele() %></td>
                        <td><%= voiture.getPrix() %> €</td>
                        <td><%= voiture.isDisponible() ? "Oui" : "Non" %></td>
                        <td>
                            <form method="post" action="voiture?action=delete" onsubmit="return confirmerSuppression()">
                                <a href="modifier_voiture.jsp?id=<%= voiture.getIdVoiture() %>" class="btn btn-warning">Modifier</a>
                                <input type="hidden" name="idVoiture" value="<%= voiture.getIdVoiture() %>">
                                <input type="submit" value="Supprimer" class="btn btn-danger">
                            </form>
                        </td>
                    </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="6">Aucune voiture disponible pour le moment.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function confirmerSuppression() {
            return confirm("Êtes-vous sûr de vouloir supprimer cette voiture ?");
        }
        
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


           