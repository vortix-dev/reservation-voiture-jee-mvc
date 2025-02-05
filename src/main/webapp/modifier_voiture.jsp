<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.VoitureDAO" %>
<%@ page import="model.Voiture" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
    int idVoiture = Integer.parseInt(request.getParameter("id"));
    VoitureDAO voitureDAO = new VoitureDAO();
    Voiture voiture = voitureDAO.getVoitureById(idVoiture);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Voiture</title>
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
                <a href="admin_dashboard.jsp" class="list-group-item list-group-item-action text-white bg-success">Gérer voitures</a>
                <a href="gerer_reservation.jsp" class="list-group-item list-group-item-action text-white bg-success">Gérer réservations</a>
                <a href="admin?action=logout" class="list-group-item list-group-item-action text-white bg-danger">Logout</a>
            </div>
        </div>

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-success text-white">
                <button class="btn btn-light" id="menu-toggle">☰</button>
                <a class="navbar-brand mx-auto text-white" href="#">Modifier Voiture</a>
            </nav>

            <div class="container mt-5">
                <h2 class="mb-4">Modifier Voiture</h2>
                <form action="voiture" method="POST">
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="idVoiture" value="<%= voiture.getIdVoiture() %>" />
                    
                    <div class="mb-3">
                        <label for="img" class="form-label">Image</label>
                        <input type="text" class="form-control" id="img" name="img" value="<%= voiture.getImg() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="marque" class="form-label">Marque</label>
                        <input type="text" class="form-control" id="marque" name="marque" value="<%= voiture.getMarque() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="modele" class="form-label">Modèle</label>
                        <input type="text" class="form-control" id="modele" name="modele" value="<%= voiture.getModele() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="prix" class="form-label">Prix</label>
                        <input type="number" class="form-control" id="prix" name="prix" value="<%= voiture.getPrix() %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="disponible" class="form-label">Disponible</label>
                        <select name="disponible" id="disponible" class="form-control" required>
                            <option value="true" <%= voiture.isDisponible() ? "selected" : "" %>>Disponible</option>
                            <option value="false" <%= !voiture.isDisponible() ? "selected" : "" %>>Indisponible</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Mettre à jour</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
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
            padding: 20px;
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
